






local class = require("lib.middleclass")
local Module = require("core.mvvm.module_base")

--- @class HallModule : Module
--- @field view HallView
--- @field hallView HallView
--- @field hallModel HallModel
--- @field model HallModel
local HallModule = class("hallModule", Module)
local DialogManager = require("manager.auto_dialog_manager");
local MatchingManager = require("package.public.matching_manager")
---@type JumpManager
local JumpManager = require('package.public.jump_manager')
local ModuleCache = ModuleCache
local CSmartTimer = ModuleCache.SmartTimer.instance
local onAppFocusCallback;
local PlayerPrefs = UnityEngine.PlayerPrefs
local audioMusic = ModuleCache.SoundManager.audioMusic
local bgMusic1 = "bgmhall"
local PlayModeUtil = ModuleCache.PlayModeUtil

function HallModule:initialize(...)
    -- 开始初始化
    Module.initialize(self, "hall_view", "hall_model", ...)

    local list = require("list")
    -- 需要按照权重来播放,从1、2、3、4开始，还有触发的时间等等都要重新排序
    self._systemAnnounceContents = list:new()
    if (not self.modelData.noticeData) then
        self.modelData.noticeData = { }
    end
    onAppFocusCallback = function(eventHead, state)
        if not self.hallView:is_active() then
            return
        end

        if state then
            --self:firstRecharge()

            self:getUserNewMessage()
            self:get_app_asset_data_info()
            self:subscibe_time_event(0.3, false, 0):OnComplete( function(...)
                self:process_mwenter()
            end)

            if ModuleCache.SDKInterface().get_cur_signal_type() ~= self._lastSignalType then
                self._lastSignalType = ModuleCache.SDKInterface().get_cur_signal_type()
                self.modelData.roleData.ip = ""
                self.hallModel:get_adcontentinfo(true)
            end
        else
            self._lastSignalType = ModuleCache.SDKInterface().get_cur_signal_type()
        end
    end

    ModuleCache.WechatManager.registMWEnterRoomCallback(function()
        self:process_mwenter()
    end)

    self:subscibe_app_focus_event(onAppFocusCallback)

    self._lastSignalType = ModuleCache.SDKInterface().get_cur_signal_type()
    onAppFocusCallback(nil, true)

    self:subscibe_time_event(0.5, false, 0):OnComplete(function(...)
        self:process_mwenter()
    end)

    -- 大厅中更新位置信息
    self:begin_location()

    self:isShowHongBaoHuoDong()

    ModuleCache.ModuleManager.destroy_module("public", "login")

    if self.modelData.hallData.normalGameName then
        ModuleCache.GameManager.change_game_by_gameName(self.modelData.hallData.normalGameName)
        self.modelData.hallData.normalGameName = nil
    end
    ModuleCache.LogManager.clear_logs()

    ModuleCache.GVoiceManager().quitTeam()
    if ModuleCache.ComponentCache.uiCamera then
        ModuleCache.ComponentCache.uiCamera.cullingMask = ModuleCache.ComponentCache.uiCameraCullingMaskValue
    end
end

--- 处理进入房间的BUG
function HallModule:process_mwenter()
    if nil ~= TableManager:try_get_cur_runing_table_module() then
        return
    end

    local mwData = ModuleCache.GameManager.get_mw_data(ModuleCache.GameSDKCallback.instance.mwEnterRoomID)
    if mwData then
        ModuleCache.FunctionManager.ClearClipBoard()

        if mwData.from and mwData.from == "SBestH5GameSDK" then
            self:dispatch_module_event("hall", "urlSchemeIntentdata", mwData)
            return
        end

        if mwData.appName and mwData.appName ~= ModuleCache.AppData.get_app_name() then
            if ModuleCache.GameManager.change_game_buy_appName_gameName(mwData.appName, mwData.gameName) then
                if self.isOnShowFinish then
                    ModuleCache.GameManager.logout()
                else
                    self.isNeedLogOut = true
                end
            end
        else
            ModuleCache.GameSDKCallback.instance.mwEnterRoomID = "0"
            if mwData.appGameName and mwData.appGameName ~= "" then
                local curGameId = ModuleCache.GameManager.curGameId
                local curProvince = ModuleCache.GameManager.curProvince
                ModuleCache.GameManager.change_game_by_gameName(mwData.appGameName)
                if curGameId ~= ModuleCache.GameManager.curGameId or curProvince ~= ModuleCache.GameManager.curProvince then
                    self:dispatch_package_event("Event_Set_Play_Mode", nil)
                end
            end

            if mwData.roomId then
                local roomId = mwData.roomId
                -- 解决通过分享链接进入牌桌时，没有加入亲友圈时不会切到对应的游戏玩法中
                if mwData.appGameName and mwData.appGameName ~= "" then
                    local curGameId = ModuleCache.GameManager.curGameId
                    local curProvince = ModuleCache.GameManager.curProvince
                    ModuleCache.GameManager.change_game_by_gameName(mwData.appGameName)
                    if curGameId ~= ModuleCache.GameManager.curGameId or curProvince ~= ModuleCache.GameManager.curProvince then
                        self:dispatch_package_event("Event_Set_Play_Mode", nil)
                    end
                end

                -- 如果有赋值亲友圈号，那么就用亲友圈
                if mwData.parlorId and #tostring(mwData.parlorId) > 2 and mwData.roomType == 2 then
                    roomId = mwData.parlorId
                end
                local roomIdStr = tostring(roomId)
                local gameID = 0
                local gameName = ""
                if #roomIdStr > 6 then
                    local len = #roomIdStr
                    gameID = tonumber(roomIdStr:sub(len - 5, len))

                    if mwData.gameName_full then
                        gameName = mwData.gameName_full
                    else
                        gameName = ModuleCache.PlayModeUtil.getInfoByGameId(gameID).createName
                    end

                    roomId = roomIdStr:sub(1, len - 6)
                end

                if mwData.goldId and mwData.goldId ~= 0 and self.playMode and self.playMode.isOpenGold then
                    self:goldClick()
                end

                print(tonumber(roomId), "--------process_mwenter-------------------", gameName, mwData.gameName_full)
                self.modelData.tableCommonData.tableType = 0

                local arr = string.split(gameName, "_")
                if #arr > 1 then
                    --print( arr[1] ~= AppData.App_Name,"#######", arr[1],AppData.App_Name)
                    if arr[1] ~= AppData.App_Name then
                        --TODO XLQ 当前输入的圈号的亲友圈不在当前省份时 切换省份
                        ModuleCache.GameManager.select_province_name_not_record(arr[1])
                    end
                end

                local joinData = nil
                if tostring(gameName):find("|") ~= nil then
                    joinData = { roomId = tonumber(roomId), gameName = mwData.gameName_full, playRule = mwData }
                else
                    joinData = { roomId = tonumber(roomId), gameName = gameName, playRule = mwData }
                end

                if mwData.launchRoundStatus and mwData.launchRoundStatus == 2 then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈已暂停组局，请联系管理员！")
                    return
                end

                if mwData.parlorBoxId then
                    joinData.boxId = mwData.parlorBoxId
                end
                TableManager:join_room(joinData)
            end
        end
    end
end

function HallModule:getUserNewMessage()

    ModuleCache.PayManager().getUserNewMessage()
end

function HallModule:on_destroy()
    ModuleCache.SoundManager.stop_music()
    ModuleCache.ModuleManager.destroy_module("public", "redpacket")
    ModuleCache.ModuleManager.destroy_module("public", "activity")
    ModuleCache.ModuleManager.destroy_module("public", "activity_redpacket")
    -- 大厅中的红包与大厅模块共存亡

    -- UpdateBeat:Remove(self.UpdateBeat, self)
    self:stop_auto_play_adcontent()
    if (self.callID) then
        CSmartTimer:Kill(self.callID)
        self.callID = nil
    end

    ModuleCache.WechatManager.registMWEnterRoomCallback(nil)

end

function HallModule:on_update()
    if ModuleCache.GameManager.customOsType == 1 and ModuleCache.UnityEngine.Input.GetKeyDown(ModuleCache.UnityEngine.KeyCode.Escape)
            and not ModuleCache.ModuleManager.module_is_active("public", "customerservicesystem")
            and not ModuleCache.ModuleManager.module_is_active("public", "webgame") then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确定要退出游戏？"), function()
            ModuleCache.UnityEngine.Application.Quit()
        end, nil)
    end
    -- if self.lastUpdateBeatTime + 1 > Time.realtimeSinceStartup then
    --    return
    -- end
    -- self.lastUpdateBeatTime = Time.realtimeSinceStartup
end


function HallModule:on_update_per_second()
    if (not self.view:is_active()) then
        return
    end
    if (not audioMusic.isPlaying or audioMusic.clip.name ~= bgMusic1) then
        ModuleCache.SoundManager.play_music("public", "public/sound/bgmmusic/" .. bgMusic1 .. ".bytes", bgMusic1, true)
    end

end

function HallModule:start_auto_play_adcontent()
    self.autoPlayAdTimeEventID = self:subscibe_time_event(3, false, 0):OnComplete(function(t)
        if (self.hallView.adContentInfo.isDraging) then
            return
        end

        if (self.hallView.lastIndex == 1) then
            self.auto_play_offset = 1
        elseif (self.hallView.lastIndex == #self.hallView.adContentInfo.pageSelectImageArray) then
            self.auto_play_offset = -1
        end
        if (not self.auto_play_offset) then
            self.auto_play_offset = 1
        end

        self.hallView.adContentInfo.scrollRectAdContent.horizontalNormalizedPosition = self.hallView.adContentInfo.scrollRectAdContent.horizontalNormalizedPosition + 0.01 * self.auto_play_offset

        self.hallView:onBeginDragAdContent()
        self.hallView:onEndDragAdContent(self.auto_play_offset)
        self:stop_auto_play_adcontent()
        self:start_auto_play_adcontent()
    end)                             .id
end

function HallModule:stop_auto_play_adcontent()
    if (self.autoPlayAdTimeEventID) then
        CSmartTimer:Kill(self.autoPlayAdTimeEventID)
        self.autoPlayAdTimeEventID = nil
    end
end



-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function HallModule:on_model_event_bind()
    self:subscibe_model_event("Event_Hall_GetUserInfo", function(eventHead, eventData)
        -- 监听model层的事件反馈，事件头、事件数据
        self.hallView:refreshPlayerInfo(self.modelData.roleData)
        self.view:updateVerifyStatus(self.modelData.roleData.mobile == "")
        self:dispatch_package_event("Event_Package_GetUserInfo", self.modelData.roleData)
        self:dispatch_package_event("Event_Package_Refresh_Userinfo", self.modelData.roleData)
    end)

    self:subscibe_model_event("Event_Hall_GetAppGlobalConfig", function(eventHead, eventData)
        -- 监听model层的事件反馈，事件头、事件数据
        if (eventData.err) then
            -- self.hallModel:get_adcontentinfo()
        else
            -- self.hallView:refreshAdContent(self.modelData.AppGlobalConfig.sys_ads)
            -- self:start_auto_play_adcontent()
        end
    end)

    self:subscibe_model_event("Event_Hall_GetActivityList", function(eventHead, eventData)

        -- 监听model层的事件反馈，事件头、事件数据
        local activityList = self.modelData.hallData.activityList;

        if activityList == nil then
            self.showShareReward = false
            self.view.buttonFreeDiamond.gameObject:SetActive(false);
            self.view.spriteShareReward.gameObject:SetActive(false);
        else
            -- 更新奖励视图
            self.showShareReward = self.hallView:updateRewardView(activityList, "share");
        end

    end)


    -- 实名认证状态获取回包
    self:subscibe_model_event("Event_Hall_GetMainRedPoint", function(eventHead, eventData)
        -- 更新主界面红点(此方法目前只有背包)
        self.view:updateMainRedPoint(eventData);
    end)

    self:subscibe_model_event("Event_Hall_GetIsAgent",function (eventHead,eventData)
        self.view:updateAgentStatus(eventData);
    end)
end

function HallModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        self.hallView:refreshPlayerInfo(self.modelData.roleData)
    end)

    self:subscibe_module_event("hall", "Event_refresh_userinfo", function(eventHead, eventData)
        print("subscibe_module_event -------------")
        self.hallView:refreshPlayerInfo(self.modelData.roleData)
        self:process_mwenter()
    end)

    self:subscibe_module_event("hall", "Event_Hall_GetActivityList", function(eventHead, eventData)
        if self.modelData.hallData.activityList == nil then
            self.view.buttonFreeDiamond.gameObject:SetActive(false);
        else
            -- 更新奖励视图
            self.showShareReward = self.hallView:updateRewardView(self.modelData.hallData.activityList, "share");
        end
    end)

    self:subscibe_package_event("Event_Package_User_BindingPhone", function(eventHead, eventData)
        -- 更新实名认证状态
        self.model:get_userinfo()
        self.view:updateVerifyStatus(false)
        if ModuleCache.ModuleManager.module_is_active("public", "playerinfodetail") then
            local data = {
                showType = 1,
                uid = self.modelData.roleData.userID,
            }
            ModuleCache.ModuleManager.show_module("public", "playerinfodetail", data)
        end
    end)

    self:subscibe_package_event("Event_Set_Play_Mode", function(eventHead, eventData)
        if eventData then
            self.playMode = PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
            self:on_show()
        end

    end)
    self:subscibe_package_event("Event_Package_RefreshTips", function(eventHead, eventData)
        if eventData then
            if eventData.module == "Mail" then
                self.hallView.mailRed:SetActive(eventData.tips)
            end
        end

    end)

    
    self:subscibe_package_event("Event_Package_RefreshUserInfo", function(eventHead, eventData)

        self.hallModel:get_userinfo()
    end)

    self:subscibe_package_event("Event_Package_NeedRefreshUserInfo", function(eventHead, eventData)
        self.hallModel:get_userinfo()
    end)
    self:subscibe_package_event("Event_Show_Hall_Anim", function(eventHead, eventData)
        self.view.root:SetActive(false)
        self.view.root:SetActive(true)
    end)

    self:subscibe_package_event("Event_Refresh_Red_Status", function(eventHead, eventData)
        self:updateRedInfo(eventData)
    end)

    -- 刷新大厅背包红点
    self:subscibe_package_event("Event_Refresh_Bag_Red", function(eventHead, eventData)
        -- 请求大厅红点协议
        self.hallModel:getMainRedPoint();
    end)

    --self:subscibe_package_event("Event_Package_Recharge_Success", function(eventHead, eventData)
    --    --self:updateRedInfo(eventData)
    --    print("充值成功")
    --    self:firstRecharge()
    --end)

    -- 刷新宝箱数据
    --self:subscibe_package_event("Event_Lucky_Buy_End", function(eventHead, eventData)
    --    self:luckybox();
    --end)

    -- 刷新大厅代理按钮显示
    self:subscibe_module_event("agentregister","Event_AgentRegister_GetIsAgent", function(eventHead, eventData)
        self.view:updateAgentStatus(eventData)
    end)
end

function HallModule:on_module_inited()
    self.view:show(true)
end

-- 没分钟调用一次
function HallModule:start_auto_call()
    if (self.callID) then
        CSmartTimer:Kill(self.callID)
        self.callID = nil
    end

    self.callID = self:subscibe_time_event(60, false, 0):OnComplete(function(t)
        self:getNewChatCount()
        self:start_auto_call()
    end)              .id
end

function HallModule:on_show(intentData)
    if (self.isDestroy) then
        return
    end

    self.hallView:set_effect_sortingOrder()
    self.hallView:setGameName()
    -- 请求大厅红点协议
    self.hallModel:getMainRedPoint();

    ----首充数据
    --self:firstRecharge()
    ----幸运宝箱
    --self:luckybox()

    self:getNewChatCount()
    self:start_auto_call()
    self:get_mail_data()
    self.view:refreshThirdGamesView()
    JumpManager:getWebGameList(function(webGameDataList)
        self.view:refreshThirdGamesView(webGameDataList)
    end)

    ModuleCache.ModuleManager.add_module("public", "redpacket"):get_redpacket_info()
    -- 大厅中的红包与大厅模块共存亡
    ModuleCache.UnityEngine.Application.targetFrameRate = 30
    self.hallModel:get_userinfo()
    --self.hallView:refreshPlayerInfo(self.modelData.roleData)

    if ModuleCache.GameManager.iosAppStoreIsCheck then
        self.isOnShowFinish = true
        return
    end

    self.hallModel:get_notice_list(function(data)
        if self.isDestroy then
            return
        end

        self.modelData.noticeData[AppData.Game_Name] = data
        for i = 1, #data do
            if (data[i].noticekey == "parlor") then
                self.modelData.parlorWeiXin = data[i].content
                --local showMuseum = PlayerPrefs.GetInt("showMuseum", 0)
                --if (showMuseum == 1) then
                --    self:get_museum_list()
                --end
            end
        end
    end)

    if (PlayerPrefs.GetInt("showMuseum", 0) == 1) then
        --self:get_museum_list()
        ModuleCache.ModuleManager.show_module("public", "chessmuseum")
    end

    -- 这个一定不能注释掉的
    self.hallModel:get_adcontentinfo();

    self:get_app_asset_data_info();

    self.modelData.hallData.activityList = nil;
    self.modelData.shareData.isShare = false;
    -- 请求获取活动奖励协议
    self.hallModel:getActivityList();

    self.model:getParlorAgentTableActivity(function (retData)
        if retData.ret and retData.ret == 0 and retData.data.hasActivity and retData.data.activityUrl ~= "" then
            self.ParlorAgentTableActivityUrl = retData.data.activityUrl
            self.view:show_ParlorAgentTableActivity(true)
        else
            self.view:show_ParlorAgentTableActivity(false)
        end
    end)

    -- ios过审模式
    if ModuleCache.GameManager.iosAppStoreIsCheck then

        self.view.buttonActivity.gameObject:SetActive(false);
        -- self.view.buttonBillboard.gameObject:SetActive(false);
    else
        self.view.buttonActivity.gameObject:SetActive(true);
        -- self.view.buttonBillboard.gameObject:SetActive(false);
        ---- 打开活动界面
        --local object =
        --{
        --showRegionType = "hall",
        --showType="Auto",
        --}
        --ModuleCache.ModuleManager.show_public_module("activity", object);
        --

        if self.modelData.curGameName ~= AppData.get_url_game_name() then
            self.modelData.curGameName = AppData.get_url_game_name()
            DialogManager.ResetQueue()
        end
        DialogManager.openPriorityDialog();
        --打开优先级高的弹框
        --if DialogManager.getPrioritySize() > 0 then
        --    DialogManager.openPriorityDialog();
        --else
        --    MatchingManager:jump_jiujijin()
        --end
    end

    ---刷新返回房间按钮的状态
    if TableManager:try_get_cur_runing_table_module() then
        self.view.buttonReturnRoom.gameObject:SetActive(true)
    else
        self.view.buttonReturnRoom.gameObject:SetActive(false)
    end

    self.isOnShowFinish = true
    if self.isNeedLogOut then
        ModuleCache.GameManager.logout()
    end

    self:isShowHongBaoHuoDong()

    if not self.playMode then
        self.playMode = PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
    end
    if self.playMode and not self.playMode.isOpenGold then
        ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_LAST_HALL_OPEN_MODULE, "");
    end

    local hallLastOpenHall = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_LAST_HALL_OPEN_MODULE, "");
    print("===上一次打开的模块====", hallLastOpenHall)
    if hallLastOpenHall ~= "" then
        hallLastOpenHall = string.split(hallLastOpenHall, '_')
        if hallLastOpenHall[2] == "goldentrance" then
            self:goldClick(hallLastOpenHall[3])
        else
            ModuleCache.ModuleManager.show_module(hallLastOpenHall[1], hallLastOpenHall[2])
        end
    end
end

function HallModule:get_app_asset_data_info()
    if(ModuleCache.ModuleManager.module_is_active("public", "webgame"))then
        return
    end
    --竖屏状态不允许更新
    if  ModuleCache.GameManager.webGameModuleShow and (ModuleCache.UnityEngine.Screen.width < ModuleCache.UnityEngine.Screen.height or (not ModuleCache.GameManager.isLandscapeOrientation()))then
        ModuleCache.TalkingDataMgr().setEvent("WebGameModuleShowPortrait")
        return
    end

    if ModuleCache.GameManager.lockAssetUpdate then
        return
    end
    ModuleCache.GameManager.get_app_asset_data_info(function(appAssetVersionUpdateData)
        if self.isDestroy then
            -- 要注意缓存回调时有可能view已经销毁了
            return
        end
        --print_table(appAssetVersionUpdateData)
        if appAssetVersionUpdateData.appData then
            if ModuleCache.GameManager.deviceIsMobile then
                if appAssetVersionUpdateData.appData.forceUpgrade and appAssetVersionUpdateData.appData.forceUpgrade == 1 then
                    -- 强制更新
                    ModuleCache.GameManager.logout()
                else
                    -- 非强制更新
                    self.hallView.goUpdateVersionBubble:SetActive(true)
                end
            end
        else
            local config = PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId)
            --先全部强制更新吧 and appAssetVersionUpdateData.assetData.isForceUpdate
            if ModuleCache.GameManager.deviceIsMobile and appAssetVersionUpdateData.assetData then
                -- 是否强制更新
                if config then
                    ModuleCache.PackageManager.update_package_version(config.package, function()
                    end)
                end
            end
            local updatePackageAssetData = ModuleCache.PackageManager.get_app_package_update_info("public")
            if not updatePackageAssetData and config then
                updatePackageAssetData = ModuleCache.PackageManager.get_app_package_update_info(config.package)
            end
            self.hallView.goUpdateVersionBubble:SetActive(false)
        end
    end)
end

function HallModule:on_begin_drag(obj, arg)
    if (obj.name == "ad_item") then
        self:stop_auto_play_adcontent()
        self.hallView:onBeginDragAdContent(obj, arg)
    end
end

function HallModule:on_drag(obj, arg)
    self.hallView:onDragAdContent(obj, arg)
end

function HallModule:on_end_drag(obj, arg)
    if (self.view and obj.name == "ad_item") then
        self.hallView:onEndDragAdContent(nil, obj, arg)
        self:start_auto_play_adcontent()
    end
end

-- 点击事件 因为效率的问题不能用C#中绑定Button的方式，
function HallModule:on_click(obj, arg)
    local _cmd = obj.name
    print(obj.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    self:dispatch_module_event("login", "hall_show", "hall_show")
    if "ad_item" == _cmd then
        local gameObjectArray = self.hallView.adContentInfo.gameObjectAds
        for i = 1, #gameObjectArray do
            if (obj == gameObjectArray[i]) then
                local adInfo = self.hallView.adContentInfo.ads[i]
                if adInfo.link and adInfo.link ~= "" then
                    ModuleCache.ModuleManager.show_module("public", "webview", { link = adInfo.link, showType = 0 })
                end
                return
            end
        end
    elseif obj == self.view.buttonCreateRoom.gameObject then
        local sendData = {
            showType = 1,
            clickType = 1,
            data = nil
        }
        ModuleCache.ModuleManager.show_module("public", "createroom", sendData)
    elseif obj == self.view.buttonJoinRoom.gameObject then
        ModuleCache.ModuleManager.show_module("public", "joinroom", { mode = 1 })
    elseif obj == self.view.buttonReturnRoom.gameObject then
        TableManager:try_back_to_runing_table() ---回到当前正在运行的游戏牌桌模块
    elseif obj == self.view.buttonCheckResult.gameObject then
        self:getHistoryList()
    elseif obj == self.view.buttonShare.gameObject then
        ModuleCache.ModuleManager.show_module("public", "share", { from = "hall", showShareReward = self.showShareReward })
    elseif obj.name == "ActivityParlorAgentTable" then
        self.view:open_ParlorAgentTableActivity(self.ParlorAgentTableActivityUrl)
    elseif obj == self.view.buttonSetting.gameObject then
        ModuleCache.ModuleManager.show_module("public", "setting")
    elseif obj == self.view.buttonRanking.gameObject then
        if self.playMode and self.playMode.isOpenGold then
            ModuleCache.ModuleManager.show_module("public", "rank");
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")
        end
        --幸运转盘
    elseif obj == self.view.buttonLucky.gameObject then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")
        --比赛场
    elseif obj == self.view.buttonMatch.gameObject then
        if ModuleCache.AppData.Is_Independent_App then
            self:matchClick()
        else
            if self.playMode and self.playMode.isOpenMatch then
                self:matchClick()
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")
            end
        end

        -- 代理按钮
    elseif obj == self.view.buttonAgent.gameObject then
        if self.modelData.roleData.isAgent then
            if self.modelData.roleData.isAgentForbid then
                ModuleCache.ModuleManager.show_public_module_alertdialog():show_confirm_cancel("您的推广员账户已被禁用。",function ()
                    MatchingManager:openCustomerService()
                end,nil,nil,nil,"联系客服","我知道了")
                return
            end
            if self.modelData.roleData.isSpecialAgent then
                ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("您当前为渠道账号，请在后台操作")
                return
            end
            ModuleCache.ModuleManager.show_public_module("agentback")
        else
            ModuleCache.ModuleManager.show_public_module("agentregister")
        end
        -- 活动按钮
    elseif obj == self.view.buttonActivity.gameObject then
        local object = {
            showRegionType = "hall",
            showType = "Manual",
        }
        ModuleCache.ModuleManager.show_public_module("activity", object);
        -- 免费领钻按钮
    elseif obj == self.view.buttonFreeDiamond.gameObject then
        ModuleCache.ModuleManager.show_module("public", "freediamond");
        -- 红白雨按钮
    elseif _cmd == "ActivityHongBao" then
        local redpacket = ModuleCache.ModuleManager.show_module("public", "redpacket")
        if redpacket then
            redpacket:hall_click_redpacket()
        end
        -- 实名认证按钮
    elseif obj == self.view.buttonVerify.gameObject then
        ModuleCache.ModuleManager.show_module("public", "phonebinding", "Binding");
    elseif _cmd == "buttonShouChong" then
        --首充礼包
        if self.firstRechargeData then
            ModuleCache.ModuleManager.show_public_module("firstrecharge", self.firstRechargeData);
        end
    elseif _cmd == "buttonXianShi" then
        --限时宝箱
        ModuleCache.ModuleManager.show_public_module("luckybox");

        -- 客服按钮
    elseif obj == self.view.buttonCustomerService.gameObject then
        self:getIsCustomer()
        -- 背包按钮
    elseif obj == self.view.buttonBag.gameObject then
        local data = {
            showType = 1,
        };
        ModuleCache.ModuleManager.show_module("public", "bag", data);

    elseif obj == self.view.buttonRole.gameObject then
        if ModuleCache.GameManager.iosAppStoreIsCheck then
            return
        end
        -- ModuleCache.ModuleManager.show_module("public", "setting")
        local data = {
            showType = 1,
            uid = self.modelData.roleData.userID,
        }
        ModuleCache.ModuleManager.show_module("public", "playerinfodetail", data)
    elseif obj == self.view.buttonAddRoomCard.gameObject  then
        ModuleCache.ModuleManager.show_module("public", "shop", { showpage = 2, isUsedDefault = true })
    elseif obj == self.view.buttonShop.gameObject  then
        ModuleCache.ModuleManager.show_module("public", "shop", { showpage = 5, isUsedDefault = true })
    elseif obj.name == "Gold" then
        ModuleCache.ModuleManager.show_module("public", "shop", 1)
    elseif (obj.name == "PaiYouQuan") then
        print("-------------------")
        --self:get_museum_list(true)
        ModuleCache.ModuleManager.show_module("public", "chessmuseum")
    elseif obj.name == "ButtonMail" then
    ModuleCache.ModuleManager.show_module("public", "mail")
    elseif (obj.name == "Switch") then
        if not ModuleCache.AppData.Is_Independent_App then
            ModuleCache.ModuleManager.show_public_module("operate", true);
        else
            ModuleCache.ModuleManager.show_module("public", "switchgame")
        end
    elseif (obj.name == "buttonHongBaoHuoDong") then
        local url = self.HongBaoHuoDongUrl
        local data = {
            link = url,
            showType = 0,
            style = 2
        }
        ModuleCache.ModuleManager.show_module("public", "webview", data);
    elseif (obj.name == "Quit") then
        if not ModuleCache.AppData.Is_Independent_App then
            ModuleCache.ModuleManager.show_public_module("operate", true);
        else
            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("确定退出游戏？", function()
                UnityEngine.Application.Quit()
            end , nil, false)
        end
    elseif (obj.name == "GoldBtn") then
        if ModuleCache.AppData.Is_Independent_App then
            self:goldClick()
        else
            if self.playMode and self.playMode.isOpenGold then
                --跑得快切换为澳门
                self:goldClick()
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")
            end
        end
    elseif (obj.name == "CopyId") then
        ModuleCache.GameSDKInterface:CopyToClipboard(self.modelData.roleData.userID)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("游戏ID复制成功")
    elseif (obj.name == "ButtonStore") then
        if self.playMode and self.playMode.isOpenGold then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")
        end
    elseif obj.name == "WebViewTestBtn" then
        --self:webviewtest()
        ModuleCache.ModuleManager.show_public_module("matchawards", { matchId = 9, rank = 1 });
    end
end

function HallModule:update_userinfo()
    self.hallModel:get_userinfo()
end

-- 金币场点击
function HallModule:goldClick(tag)
    if TableManager:try_get_cur_runing_table_module() then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("正在房间中无法进行金币场游戏")
        return
    end

    --跑得快切换为澳门  麻将字牌不切换
    if ModuleCache.AppData.Game_Name == "RUNFAST" then
        if ModuleCache.AppData.Is_Independent_App then
            ModuleCache.PackageManager.update_package_version("majiang3d", function()
                self.modelData.hallData.normalGameName = ModuleCache.AppData.get_real_app_and_game_name()
                ModuleCache.GameManager.change_game_by_gameName(ModuleCache.AppData.getGoldRunfastGameName(), true)
                ModuleCache.ModuleManager.show_module("public", "goldentrance", tag)
            end)
        else
            self.modelData.hallData.normalGameName = ModuleCache.AppData.get_real_app_and_game_name()
            ModuleCache.GameManager.change_game_by_gameName(ModuleCache.AppData.getGoldRunfastGameName(), true)
            ModuleCache.ModuleManager.show_module("public", "goldentrance", tag)
        end
    else
        if ModuleCache.GameManager.player_switch_majiang3D() then
            ModuleCache.PackageManager.update_package_version("majiang3d", function()
                ModuleCache.ModuleManager.show_module("public", "goldentrance")
            end)
        else
            ModuleCache.ModuleManager.show_module("public", "goldentrance", tag)
        end
    end
end

-- 比赛场点击
function HallModule:matchClick()
    --跑得快切换为澳门  麻将字牌不切换
    if ModuleCache.AppData.Game_Name == "RUNFAST" then
        self.modelData.hallData.normalGameName = ModuleCache.AppData.get_real_app_and_game_name()
        ModuleCache.GameManager.change_game_by_gameName(ModuleCache.AppData.getGoldRunfastGameName(), true)
        ModuleCache.ModuleManager.show_module("public", "bisai")
    else
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")
    end
end

function HallModule:webviewtest()
    local url = self.modelData.roleData.agentUrl
    local data = {
        link = url,
        showType = 0,
        style = 2
    }
    ModuleCache.ModuleManager.show_module("public", "webview", data);
end

function HallModule:updateRedInfo(eventData)
    self.view:updateRedStatus(eventData.show, eventData.data)
end

function HallModule:isShowHongBaoHuoDong()


    -- 上报 服务器  成功后 刷新界面  buttonHongBaoHuoDong   GET /packetShow/getUrl
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
            gameId = ModuleCache.GameManager.curGameId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "packetShow/getUrl?",
    }

    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.success then
            self.view.buttonHongBaoHuoDong.gameObject:SetActive(true);
            self.HongBaoHuoDongUrl = retData.data
        else
            self.view.buttonHongBaoHuoDong.gameObject:SetActive(false);
        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

function HallModule:getHistoryList()
    local initData = {}
    ModuleCache.ModuleManager.show_module("public","gamehistory",initData)
end

function HallModule:get_new_list(list)
    local newList = { }
    local maxNum = 20
    if (#list < maxNum) then
        return list
    else
        for i = 1, maxNum do
            table.insert(newList, list[i])
        end
        print(#newList)
        return newList
    end
end

function HallModule:get_index_by_parlorId(parlorId)
    for i, v in ipairs(self.dataList) do
        if v.parlorId == parlorId then
            return i
        end
    end
    return 1
end

-- 通过code获取活动数据
function HallModule:firstRecharge()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityListByCode?",
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name(),
            code = "privilege_product"
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) and retData.data and #retData.data > 0 and retData.data[1].isReceive == 0 then
            self.hallView.shouChongObj:SetActive(true)
            self.firstRechargeData = retData.data[1]
        else
            self.hallView.shouChongObj:SetActive(false)
        end
        self.view:setGridActive()
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function HallModule:luckybox()
    --self.hallView:updateLuckyStatus(false)
    MatchingManager:get_luckybox_times(function(data)
        print("幸运宝箱开启次数", data.remainderCount)
        self.hallView.xianShiObj:SetActive(data.remainderCount > 0)
        self.view:setGridActive()
    end)
    MatchingManager:get_luckybox_status(function(data)
        print("幸运宝箱开启，剩余时间", data.exprice)
        if data.exprice > 5 then
            self.hallView.xianShiObj:SetActive(true)
            if self.modelData.hallData.smartTimer.luckybox then
                CSmartTimer:Kill(self.modelData.hallData.smartTimer.luckybox)
            end

            self.modelData.hallData.smartTimer.luckybox = CSmartTimer:Subscribe(data.exprice, false, 1):OnComplete(function(t)
                self:dispatch_package_event('Event_Lucky_Buy_End')
            end)
                                                                     .id
            self.view:setGridActive()
        end
    end)
end

function HallModule:getIsCustomer()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/isCustomer?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if retData.data then
                ModuleCache.ModuleManager.show_public_module("customerservicesystem");
                self.view.spritecustomerServiceRed:SetActive(false)
            else
                ModuleCache.ModuleManager.show_module("public", "customerservice");
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function HallModule:getNewChatCount()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/getNewChatCount?",
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        --if (retData.success) then
        if retData.data then
            --self.customerServiceSystemNewMsgNum = retData.data

            self.view.spritecustomerServiceRed:SetActive(retData.data > 0)
        end
        --end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end



--主要做邮件红点更新
function HallModule:get_mail_data(newMsgFormServerPush)
    local addStr = "sys/msg/getMsgByUser?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        --showModuleNetprompt = true,
        params = {
            gameId = AppData.get_app_and_game_name(),
            uid = self.modelData.roleData.userID,
            pageNum = 1,
            msgType = 1,
            pageSize = 60,
            dayNum = 30
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.hallView.mailRed:SetActive(false)
            for i = 1, #retData.data do
                if (#retData.data[i].attachs > 0 and retData.data[i].attachStatus == 1) or retData.data[i].status == 1 then
                    self.hallView.mailRed:SetActive(true)
                    break
                end
            end
        end
    end, function(wwwErrorData)
        if newMsgFormServerPush then
            self.hallView.mailRed:SetActive(true)
        end
        print(wwwErrorData.error)
    end)
end


return HallModule


