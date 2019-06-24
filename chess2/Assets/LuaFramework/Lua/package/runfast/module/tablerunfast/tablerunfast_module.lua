local AppData = AppData
local BranchPackageName = AppData.BranchRunfastName
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local SoundManager = ModuleCache.SoundManager
local CustomVoiceManager = ModuleCache.CustomVoiceManager
local CSmartTimer = ModuleCache.SmartTimer.instance
local Application = UnityEngine.Application
local System = UnityEngine.System
local Time = Time
local GameSDKInterface = ModuleCache.GameSDKInterface
local WechatManager = ModuleCache.WechatManager
local TableData = require("package/runfast/module/tablerunfast/tablerunfast_data")
local TableSound = require(TableData.Path_tablerunfast_sound)
local TableRunfastHelper = require(TableData.Path_tablerunfast_helper)
local CardSet = require(TableData.Path_gamelogic_set)
local CardCommon = require(TableData.Path_gamelogic_common)
---@type MatchingManager MatchingManager
local MatchingManager = require("package.public.matching_manager")
local class = require("lib.middleclass")
local ModuleBase = require('core.mvvm.module_base')
local list = require('list')
---@class TableRunfastModule
---@field view TableRunfastView
---@field model TableRunfastModel
---@field TableRunfastLogic TableRunfastLogic
local TableRunfastModule = class('TableRunfastModule', ModuleBase)

local TableManagerPoker = TableManagerPoker
local voicePath = Application.persistentDataPath .. "/voice"
local ChatMsgType = { }-- 聊天的类型
ChatMsgType.voiceMsg = 0
ChatMsgType.shotMsg = 1
ChatMsgType.emojiMsg = 2
ChatMsgType.text = 3
ChatMsgType.gift = 10

------初始化
function TableRunfastModule:initialize(...)

    self.moduleInitializeMonitoring = true
    self.curTableData_PB = TableManager.curTableData_PB
    --UnityEngine.Application.targetFrameRate = AppData.tableTargetFrameRate
    ModuleBase.initialize(self, "tablerunfast_view", "tablerunfast_model", ...)

end

function TableRunfastModule:initTable()
    self:ResetDragPoker()
    self.chatConfig = require('package.runfast.config')

    self.waitPlayVoiceQueue = list:new()

    self.TableRunfastHelper = TableRunfastHelper
    TableRunfastHelper.TableRunfastView = self.TableRunfastView
    self.TableRunfastHelper.module = self
    self.TableRunfastHelper.modelData = self.modelData
    -- 不同的玩法:跑得快就一种玩法
    self.TableRunfastLogic = require(string.format("package/%s/module/tablerunfast/tablerunfast_logic", BranchPackageName)):new(self)

    self.table_gift_module = ModuleCache.ModuleManager.show_module('public', 'table_gift')
    self.voiceDataMap = { }
    self.curRecordPath = ''
    self.netClient = self.modelData.bullfightClient
    TableManagerPoker:registLoginGameCallbacks(function(data)
        if (not data.err_no or data.err_no == "0") then
            ModuleCache.ModuleManager.destroy_package(BranchPackageName)
            ModuleCache.SoundManager.stop_music(BranchPackageName)
            ModuleCache.ModuleManager.show_module(BranchPackageName, "tablerunfast")
        else
            TableManagerPoker:disconnect_game_server()
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.err_no)
            ModuleCache.ModuleManager.destroy_package(BranchPackageName)
            ModuleCache.ModuleManager.show_module("public", "hall")
        end
    end)
    ModuleCache.FileUtility.DeleteDirectory(voicePath, true)
    ModuleCache.FileUtility.DirectoryCreate(voicePath)

    self:initGVoice()
    self.TableRunfastView:refresh_voice_shake();

    self:begin_location(function()
        self:UploadIpAndAddress()
    end)

    self.allChatMsgs = {}

    self:Test()
    self:subscibe_app_focus_event(function(eventHead, eventData)
        if (eventData) then
            self:on_press_poker_up()
        end
    end)
    self.TableRunfastView:SetRankInfo(false)
    self:CheckLuckyBox()
    self:CheckFirstGiftBag()
end

function TableRunfastModule:initGVoice()
    print(GameSDKInterface:GetPlatformName())
    if GameSDKInterface:GetPlatformName() == "WindowsEditor" or GameSDKInterface:GetPlatformName() == "Android" or GameSDKInterface:GetPlatformName() == "IPhonePlayer" then
        if (self.isGvoiceInited) then
            return
        end
        CustomVoiceManager.init(ModuleCache.AppData.GVoiceCloudID, ModuleCache.AppData.GVoiceCloudKey, self.modelData.roleData.userID, 5000)
        CustomVoiceManager.set_event_listener(
        function(fileid)
            if (not self or self._is_destroyed) then
                return
            end
            self.TableRunfastModel:request_chat(ChatMsgType.voiceMsg, fileid)
        end,
        function(filePath, fileid)
            if (not self or self._is_destroyed) then
                return
            end
            print('--------------------------------------------down file finish')
            local voiceData = self.voiceDataMap[filePath]
            self.waitPlayVoiceQueue:push(voiceData)
            self:tryPlayVoice()
        end,
        function(filePath, key)
            if (not self or self._is_destroyed) then
                return
            end
            local voiceData = self.voiceDataMap[filePath]
            if (not voiceData) then
                print(filePath, "map中不存在此数据")
                self:UnPauseMusic()
                return
            end

            local seatInfo = voiceData.seatInfo
            self.TableRunfastView:hide_voice(seatInfo.localSeatIndex)
            self.voiceDataMap[filePath] = nil
            self.curPlayingVoiceData = nil
            if (self.curPlayerVoiceTimeEventId) then
                CSmartTimer:Kill(self.curPlayerVoiceTimeEventId)
                self.curPlayerVoiceTimeEventId = nil
            end

            if (not self:tryPlayVoice() and not self.isPress) then
                if (self:getTableKeyCount(self.voiceDataMap) == 0) then
                    self:UnPauseMusic()
                end
            end
        end)
    end
    self.isGvoiceInited = true
end

------获取表的Key数量
function TableRunfastModule:getTableKeyCount(t)
    local count = 0
    for k, v in pairs(t) do
        count = count + 1
    end
    return count
end

function TableRunfastModule:on_click(obj, arg)
    print(obj.name)
    --目前还没有双击的情况
    --if (self.lastClickObj == obj and self.lastClickTime + 0.4 > Time.realtimeSinceStartup) then
    --    self:on_double_click(obj, arg)
    --    return
    --end
    --self.lastClickObj = obj

    self.lastClickTime = Time.realtimeSinceStartup
    TableSound:PlaySound_Btn()
    if (self.lastClickInviteTime and self.lastClickInviteTime + 0.6 > Time.realtimeSinceStartup) then
        return
    end

    local startIndex, endIndex = string.find(obj.name, "Poker")
    if (startIndex == 1) then
        if (self.isDragPokerHelp) then
            self.isDragPokerHelp = false
        else
            self.TableRunfastLogic:onClickPoker(obj, true)
        end
    elseif (obj == self.TableRunfastView.BtnHint.gameObject) then
        -- 提示按钮
        self.TableRunfastLogic:onClickHint()
    elseif (obj == self.TableRunfastView.BtnThrowCard.gameObject) then
        -- 出牌按钮
        self.TableRunfastLogic:onReadyThrowCard()
    elseif (obj == self.TableRunfastView.BtnNotAfford.gameObject) then
        -- 要不起按钮
        if (self.TableRunfastLogic:CheckHave2MustPressA()) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("有2必打A")
            return
        end
        self.TableRunfastLogic:onClickNotAfford()
    elseif (obj == self.TableRunfastView.BtnLocation.gameObject) then
        -- 位置按钮
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList;
        ---- 获取玩家信息列表
        --local playerInfoList = TableManagerPoker:getPlayerInfoList(seatInfoList);
        ---- 获取位置信息文本
        --local tipText, distanceText = TableManagerPoker:get_gps_warn_text(playerInfoList);
        --ModuleCache.ModuleManager.show_module("public", "tablegps", tipText .. "," .. distanceText)

        local data = {};
        data.gameType = "runfast";
        data.seatHolderArray = seatInfoList
        data.tableCount = self.modelData.curTableData.roomInfo.maxPlayerCount
        data.isPlay = true
        data.isShowLocation = true
        ModuleCache.ModuleManager.show_module("public", "tablelocation", data)
    elseif (obj == self.TableRunfastView.BtnSetting.gameObject) then
        -- 设置按钮
        self.TableRunfastView:SetState_LeftRoot(false)
        local canExitRoom = self.modelData.curTableData.roomInfo.curRoundNum == 0 and (not self.modelData.curTableData.roomInfo.mySeatInfo.isCreator)
        local intentData = { }
        intentData.tableBackgroundSpriteSetName = "RoomSetting_TableBackground_Name_RUNFAST"
        intentData.canExitRoom = canExitRoom
        intentData.CurUseBgId = UnityEngine.PlayerPrefs.GetInt(intentData.tableBackgroundSpriteSetName)
        intentData.canDissolveRoom = not canExitRoom
        if (self.TableRunfastView:isJinBiChang()) then
            intentData.canExitRoom = false
            intentData.canDissolveRoom = false
        end

        --intentData.IsOpenTableBgSelect = true
        --intentData.TableBgSelect_2DSpriteList = {}
        --local TableBg2DImageList = self.TableRunfastView.TableBg2DImageList
        --for i = 1, #TableBg2DImageList do
        --    intentData.TableBgSelect_2DSpriteList[i] = TableBg2DImageList[i].sprite
        --end
        --intentData.TableBgSelect_2DViewSprite = self.TableRunfastView.TableBgView2D.sprite
        --
        --intentData.TableBgSelect_3DSpriteList = {}
        --local TableBg3DImageList = self.TableRunfastView.TableBg3DImageList
        --for i = 1, #TableBg3DImageList do
        --    intentData.TableBgSelect_3DSpriteList[i] = TableBg3DImageList[i].sprite
        --end
        --intentData.TableBgSelect_3DViewSprite = self.TableRunfastView.TableBgView3D.sprite

        intentData.tableBackgroundSprite = self.TableRunfastView.TableBg3DImageList[1].sprite
        intentData.tableBackgroundSprite2 = self.TableRunfastView.TableBg3DImageList[2].sprite
        intentData.tableBackgroundSprite3 = self.TableRunfastView.TableBg3DImageList[3].sprite
        ModuleCache.ModuleManager.show_module("public", "roomsetting", intentData)
        -- 根据房间是否开始的状态传值
    elseif (obj == self.TableRunfastView.buttonReady.gameObject) then
        -- 准备开始
        if self.modelData.roleData.RoomType == 2 then
            self.TableRunfastModel:request_ready()
        else
            self.TableRunfastLogic:ClickButtonReadyAction()
        end

    elseif (obj.name == "KickBtn") then
        -- 踢人
        --print("=====KickBtn11")
        local seatInfo = self:GetSeatInfoByKickBtn(obj)
        if (seatInfo == nil) then
            print("=====seatInfo is not exist")
            return
        end
        self.TableRunfastLogic:OnClickKickBtn(tonumber(seatInfo.playerId))
    elseif (obj == self.TableRunfastView.buttonCancelReady.gameObject) then
        -- 取消准备
    elseif (obj == self.TableRunfastView.buttonStart.gameObject) then
        self.TableRunfastLogic:onclick_start_btn(obj)
    elseif (obj.name == "NotSeatDown" or obj == self.TableRunfastView.buttonInvite.gameObject) then
        if (self.TableRunfastView:isJinBiChang() or self.TableRunfastView:isMatchTable()) then
            return
        end
        self.lastClickInviteTime = Time.realtimeSinceStartup
        self:inviteWeChatFriend()
    elseif (obj.name == "ButtonChat") then
        -- 对话说话
        local locTable = {}
        locTable.seatHolderArray = {}
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        for i = 1, #seatInfoList do
            local seatInfo = seatInfoList[i]
            if (seatInfo ~= nil) then
                local tmp = {}
                tmp.SeatID = seatInfo.seatIndex
                tmp.playerId = seatInfo.playerId
                seatInfo.chatDataSeatHolder = tmp
                table.insert(locTable.seatHolderArray, tmp)
            end
        end
        local tablechatData = { is_New_Sever = true, allChatMsgs = self.allChatMsgs, curTableData = locTable, config = self.chatConfig, backgroundStyle = "BackgroundStyle_1" }
        tablechatData.hideTextChat = self.TableRunfastView:isJinBiChang()
        ModuleCache.ModuleManager.show_module("public", "tablechat", tablechatData)
    elseif (obj.name == "Image") then
        -- 玩家头像
        local seatInfo = self:getSeatInfoByHeadImageObj(obj)
        if (seatInfo == nil) then
            print("=====seatInfo is not exist")
            return
        end
        if (self.TableRunfastView.IsFriendsCirclePreventCheating) then
            if (seatInfo == self.modelData.curTableData.roomInfo.mySeatInfo) then
                --print("==防作弊功还是能点击自己头像")
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主已开启防作弊功能，无法查看玩家信息")
                return
            end
        end

        if (self.TableRunfastView.isPlayBacking) then
            print("====warning:回放切换视角")
            if (self.modelData.curTablePlayerId == tonumber(seatInfo.playerId)) then
                print("====warning:点击自己,不用切换视角")
            else
                self.modelData.curTablePlayerId = tonumber(seatInfo.playerId)
                self:PB_InitiGameInfo()
            end
            return
        end

        if (seatInfo.localSeatIndex == 1 and seatInfo.playerInfo ~= nil and seatInfo.playerInfo.locationData ~= nil) then
            -- 点击自己的信息,需要先刷新一下
            seatInfo.playerInfo.locationData.address = ModuleCache.GPSManager.gpsAddress
        end
        if(seatInfo.playerInfo)then
            ModuleCache.ModuleManager.show_module("public", "playerinfo", seatInfo.playerInfo)
        end
    elseif (obj == self.TableRunfastView.BtnUnSelectedAllPoker.gameObject) then
        self.TableRunfastLogic:unSelectedAllPoker()
    elseif (obj == self.TableRunfastView.ButtonLeave.gameObject) then
        --牌友圈的快速组局 房主点离开按钮发 退出房间请求
        if (self.modelData.curTableData.roomInfo.mySeatInfo.isCreator and self.modelData.roleData.RoomType ~= 2) then
            self.TableRunfastModel:request_dissolve_room(true)
        else
            self.TableRunfastModel:request_exit_room()
        end
    elseif obj == self.TableRunfastView.ButtonRoomRule.gameObject then
        -- ModuleCache.ModuleManager.show_module("public", "tablerule", rule) --rule是传入字符串
        if (self.TableRunfastView:isJinBiChang() or self.TableRunfastView:isMatchTable()) then
            return
        end
        ModuleCache.ModuleManager.show_module("public", "tablerule", TableManager.RunfastRuleJsonString)
    elseif (obj == self.TableRunfastView.TestButton1.gameObject) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("点击触发断线重连")
        TableManagerPoker:heartbeat_timeout_reconnect_game_server()
    elseif (obj == self.TableRunfastView.PB_ReplayBtn.gameObject) then
        print("==PB_ReplayBtn=")
        self:OnClick_PB_ReplayBtn()
    elseif (obj == self.TableRunfastView.PB_StopBtn.gameObject) then
        self:OnClick_PB_StopBtn(true)
    elseif (obj == self.TableRunfastView.PB_PauseBtn.gameObject) then
        self:OnClick_PB_PauseBtn()
        ModuleCache.ComponentUtil.SafeSetActive(obj, false)
        print("==PB_PauseBtn=")
        ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.PB_PlayBtn.gameObject, true)
    elseif (obj == self.TableRunfastView.PB_PlayBtn.gameObject) then
        print("==PB_PlayBtn=")
        self:OnClick_PB_PlayBtn()
        ModuleCache.ComponentUtil.SafeSetActive(obj, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.PB_PauseBtn.gameObject, true)
    elseif (obj == self.TableRunfastView.PB_ForwardBtn.gameObject) then
        -- if (self.lastClickTime_PB_ForwardBtn == nil or self.lastClickTime_PB_ForwardBtn + 1.5 <= Time.realtimeSinceStartup) then
        --     self.lastClickTime_PB_ForwardBtn = Time.realtimeSinceStartup
        print("==PB_ForwardBtn=")
        self:OnClick_PB_ForwardBtn()
        --end
    elseif (obj == self.TableRunfastView.PB_BackBtn.gameObject) then
        print("==PB_BackBtn=")
        self:OnClick_PB_BackBtn()
    elseif (obj == self.TableRunfastView.PB_PreRoundBtn.gameObject) then
        self:on_click_pre_round_btn(obj, arg)
    elseif (obj == self.TableRunfastView.PB_NextRoundBtn.gameObject) then
        self:on_click_next_round_btn(obj, arg)
    elseif (obj == self.TableRunfastView.buttonReady_quickStart.gameObject) then
        self.TableRunfastModel:request_ready()
    elseif (obj == self.TableRunfastView.ButtonShop.gameObject) then
        print("====商城")
        self:GoTo_goldadd(false)
    elseif (obj == self.TableRunfastView.BtnRecordPoker.gameObject) then
        print("====点击了记牌")
        self:OnClickBtnRecordPoker()
    elseif (obj == self.TableRunfastView.BtnLeftOpen.gameObject) then
        print("====点击了左边开启")
        self.TableRunfastView:SetState_LeftRoot(true)
    elseif (obj.name == "BtnLeftClose") then
        print("====点击了左边关闭")
        self.TableRunfastView:SetState_LeftRoot(false)
    elseif (obj == self.TableRunfastView.ButtonJinBiChangExit.gameObject) then
        self.TableRunfastView:SetState_LeftRoot(false)
        if (self.TableRunfastView:isMatchTable()) then
            print("=====比赛场离开房间")
            --ModuleCache.PlayerPrefsManager.SetInt("ChangeTable", 0)
            --self:dispatch_package_event("Event_RoomSetting_LeaveRoom", 1)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("游戏正在进行中，不能退出...")
            return
        elseif (self.TableRunfastView:isJinBiChang()) then
            local gamePhaseState = self.modelData.curTableData.roomInfo.gamePhaseState
            if (gamePhaseState == 2) then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("游戏正在进行中，不能退出...")
                return
            end
            if (TableManagerPoker.clientConnected) then
                self:dispatch_package_event("Event_RoomSetting_LeaveRoom", 1)
            else
                ModuleCache.ModuleManager.destroy_package(BranchPackageName)
                ModuleCache.ModuleManager.destroy_package("public")
                ModuleCache.ModuleManager.show_module("public", "hall")
            end


        else
            local canExitRoom = self.modelData.curTableData.roomInfo.curRoundNum == 0 and (not self.modelData.curTableData.roomInfo.mySeatInfo.isCreator)
            local canDissolveRoom = not canExitRoom
            if (canDissolveRoom) then
                -- self.modelData.roleData.RoomType == 0   非麻将馆房间 1 麻将馆普通开房 2 麻将馆随机组局 3 比赛场房间
                if (self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0) then
                    if not self.modelData.curTableData.roomInfo.createRoomRule.allowDissolveRoom or self.modelData.curTableData.roomInfo.createRoomRule.allowDissolveRoom == 1 then
                        print("=====解散房间")
                        self:dispatch_package_event("Event_RoomSetting_DissolvedRoom", 1)
                    else
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主禁止解散房间。")
                    end
                else
                    print("=====解散房间")
                    self:dispatch_package_event("Event_RoomSetting_DissolvedRoom", 1)
                end

            else
                print("=====离开房间")
                self:dispatch_package_event("Event_RoomSetting_LeaveRoom", 1)
            end
        end
    elseif (obj == self.TableRunfastView.ButtonRuleExplain.gameObject) then
        print("点击了金币场说明按钮")
        self.TableRunfastView:SetState_LeftRoot(false)
        ModuleCache.ModuleManager.show_module("public", "goldhowtoplay")
    elseif (obj == self.TableRunfastView.ButtonReplaceTable.gameObject) then
        print("点击了金币场换桌")
        --TableManager.LastChangeTableTime = Time.realtimeSinceStartup
        --ModuleCache.PlayerPrefsManager.SetInt("ChangeTable", 1)
        self:dispatch_module_event("currentgameaccount", "Event_HuanZhuo")
        self:dispatch_package_event("Event_RoomSetting_LeaveRoom", 1)


    elseif (obj == self.TableRunfastView.ButtonJinBiChangReady.gameObject) then
        print("点击了金币场准备")
        self.TableRunfastModel:request_ready()
    elseif (obj == self.TableRunfastView.BtnCancelIntrust.gameObject) then
        print("点击了金币场取消托管")
        self.TableRunfastModel:request_IntrustReq()
    elseif (obj == self.TableRunfastView.BtnIntrust.gameObject) then
        print("点击了金币场托管")
        local gamePhaseState = self.modelData.curTableData.roomInfo.gamePhaseState
        if (gamePhaseState == 2) then
            self.TableRunfastModel:request_IntrustReq(true)
            self.TableRunfastView:SetState_LeftRoot(false)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("游戏还未开始，不能托管...")
        end
    elseif (obj.name == "BtnRank") then
        print("点击了比赛场排行榜按钮")
        self.TableRunfastModel:request_MatchRankReq()
    elseif (obj == self.TableRunfastView.BtnLuckyBox.gameObject) then
        print("点击了幸运宝箱")
        ModuleCache.ModuleManager.show_public_module("luckybox")
    elseif (obj == self.TableRunfastView.BtnFirstGiftBag.gameObject) then
        print("点击了点击了首冲礼包")
        ModuleCache.ModuleManager.show_public_module("firstrecharge", self.FirstGiftBagData)
        --elseif (obj == self.TableRunfastView.BtnMenu2D.gameObject or obj == self.TableRunfastView.BtnMenu3D.gameObject) then
        --    self:ClickSwitchChingJing()
    elseif (obj == self.TableRunfastView.BtnSwitchSkin.gameObject) then
        print("点击了换肤")
        local Key = "RoomSetting_TableBackground_Name_RUNFAST"
        local tableBgIndex = UnityEngine.PlayerPrefs.GetInt(Key)
        if (tableBgIndex == 0) then
            tableBgIndex = 1
        end
        tableBgIndex = tableBgIndex + 1
        if (tableBgIndex > #self.TableRunfastView.TableBg3DImageList) then
            tableBgIndex = 1
        end
        UnityEngine.PlayerPrefs.SetInt(Key, tableBgIndex)
        self.TableRunfastView:refresh_table_bg()
    elseif(obj.name == 'ButtonCustomService')then
        ModuleCache.ModuleManager.show_public_module("customerservicesystem")
    end
end

function TableRunfastModule:ClickSwitchChingJing()
    local CurUseChingJingId = self.TableRunfastView:GetCurUseChingJingId()
    if (CurUseChingJingId == 2) then
        CurUseChingJingId = 3
    elseif (CurUseChingJingId == 3) then
        CurUseChingJingId = 2
    else
        print("error==场景id应该等于是2或者3")
        return
    end
    self.TableRunfastView:SetCurUseChingJingId(CurUseChingJingId)
    self.TableRunfastView:SetCurUseZhuoBuId(1)
    self.TableRunfastView:refresh_table_bg()
end

function TableRunfastModule:GetSeatInfoByKickBtn(obj)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
            if (seatHolder.KickBtn.gameObject == obj) then
                return seatInfo
            end
        end
    end
    return nil
end
------通过头像获取座位信息
function TableRunfastModule:getSeatInfoByHeadImageObj(obj)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
        if (seatHolder.imagePlayerHead.gameObject == obj) then
            return seatInfo
        end
    end
    return nil
end

------邀请微信好友
function TableRunfastModule:inviteWeChatFriend()
    if (ModuleCache.GameManager.iosAppStoreIsCheck) then
        return
    end

    local shareData = self:get_share_data()
    if ModuleCache.ShareManager().can_share_to_xianliao() then
        ModuleCache.ModuleManager.show_module("public", "table_share", { shareType = "ShareRoom", shareData = shareData })
    else
        ModuleCache.ShareManager().shareRoomNum(shareData, false)
    end
    --local roomInfo = self.modelData.curTableData.roomInfo
    --local ruleTable = roomInfo.createRoomRule
    --local shareData = { }
    --shareData.type = 2
    --shareData.roomId = ""
    --shareData.rule = ""
    --local proStr = ModuleCache.PlayModeUtil.get_province_data(AppData.App_Name).shortName
    --local gameType = ruleTable.GameType or ruleTable.gameType or ruleTable.game_type or ruleTable.bankerType or 3
    --local _, wanfaName = Config.GetWanfaIdx(gameType)
    --if (string.find(wanfaName, proStr)) then
    --    shareData.title = wanfaName
    --else
    --    shareData.title = proStr .. wanfaName
    --end
    --if (AppData.App_Name == "DHAHQP") then
    --    shareData.title = wanfaName
    --end
    --local _, ruleDesc, totalSeat = TableUtil.get_rule_name(TableManager.RunfastRuleJsonString, self.modelData.roleData.HallID > 0)
    --shareData.ruleName = wanfaName .. ' ' .. ruleDesc
    --shareData.userID = self.modelData.roleData.userID
    --shareData.parlorId = ""
    --shareData.roomType = 0
    --shareData.roomId = tostring(self.modelData.curTableData.roomInfo.roomNum)
    --shareData.ruleMsg = self.modelData.curTableData.roomInfo.ruleDesc
    --shareData.gameName = AppData.get_url_game_name()
    --if (self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0) then
    --    shareData.parlorId = self.modelData.roleData.HallID .. ""
    --    shareData.roomType = self.modelData.roleData.RoomType
    --else
    --    shareData.roomType = 0
    --end
    --if (self.modelData.roleData.RoomType == 3) then
    --    -- 比赛场分享
    --    shareData.type = 4
    --    shareData.matchId = self.modelData.roleData.MatchID
    --elseif self.modelData.roleData.RoomType == 2 then
    --    --快速组局
    --    shareData.parlorId = shareData.parlorId .. string.format("%06d", ModuleCache.GameManager.curGameId)
    --end
    --shareData.totalPlayer = roomInfo.maxPlayerCount
    --shareData.totalGames = roomInfo.totalRoundCount
    --shareData.comeIn = false
    --shareData.curPlayer = #roomInfo.seatInfoList
    --print_table(shareData)
    --print("--------------share-----------shareData.type:", shareData.type, shareData.parlorId, shareData.matchId)
    --ModuleCache.ShareManager.shareRoomNum(shareData, false)

    -- ModuleCache.ShareManager:shareRoomNum(self.modelData.curTableData.roomInfo.roomNum, self.modelData.curTableData.roomInfo.createRoomRule, false)
end

------双击按钮
function TableRunfastModule:on_double_click(obj, arg)

end

------按下按钮
function TableRunfastModule:on_press(obj, arg)
    -- print("TableRunfastModule on press ", obj.name)
    if (obj.name == "ButtonMic") then
        ModuleCache.ModuleManager.show_module("public", "tablevoice", true)
        if GameSDKInterface:GetPlatformName() == "WindowsEditor" or GameSDKInterface:GetPlatformName() == "Android" or GameSDKInterface:GetPlatformName() == "IPhonePlayer" then
            self.isPress = true
            self.isUpload = false
            self.isRecording = false
            self:PauseMusic()
            CustomVoiceManager.stop_play_file()
            if (self.curPlayerVoiceTimeEventId) then
                CSmartTimer:Kill(self.curPlayerVoiceTimeEventId)
                self.curPlayerVoiceTimeEventId = nil
            end
            if (self.curPlayingVoiceData) then
                local seatInfo = self.curPlayingVoiceData.seatInfo
                self.TableRunfastView:hide_voice(seatInfo.localSeatIndex)
                self.voiceDataMap[self.curPlayingVoiceData.savePath] = nil
                self.curPlayingVoiceData = nil
            end
            self.timeEventID = self:subscibe_time_event(0.05, false, 0):OnComplete(function(t)
                self.pressTime = Time.realtimeSinceStartup
                self.isRecording = true
                self.isUpload = true
                self.curRecordPath = voicePath .. "/" .. Util.guid() .. ".data"
                print("这里开始录制语音！！！！！！", self.curRecordPath)
                CustomVoiceManager.start_recording(self.curRecordPath)
            end)                   .id
        end
    elseif (obj.name == "Poker") then
        PressPokerFirstName = obj.transform.parent.name
        self.is_press_on_poker = true
    end
end

------抬起按钮
function TableRunfastModule:on_press_up(obj, arg)
    if (obj.name == "ButtonMic") then
        if self.timeEventID then
            CSmartTimer:Kill(self.timeEventID)
            self.timeEventID = nil
        end
        ModuleCache.ModuleManager.hide_module("public", "tablevoice")
        if GameSDKInterface:GetPlatformName() == "WindowsEditor" or GameSDKInterface:GetPlatformName() == "Android" or GameSDKInterface:GetPlatformName() == "IPhonePlayer" then
            self.isPress = false
            self:UnPauseMusic()
            if (self.isRecording) then
                self.curRecordPath = CustomVoiceManager.stop_recording()
                self.isRecording = false
            end
            self:tryPlayVoice()
            if (self.isUpload) then
                if (arg.pointerEnter and arg.pointerEnter.gameObject == obj) then
                    if (Time.realtimeSinceStartup - self.pressTime < 0.5) then
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("说话时间太短")
                        self.isUpload = false
                        return
                    end
                    print("发送语音")
                    CustomVoiceManager.upload_recorded_file(self.curRecordPath, 60000)
                end
                self.isUpload = false
            end
        end
    elseif (obj.name == "Poker") then
        self:on_press_poker_up()
    end
end

function TableRunfastModule:on_press_poker_up()
    if (not self.is_press_on_poker) then
        return
    end
    self.is_press_on_poker = false
    if self.isDragPoker then
        self:DragPokerAction()
        self.isDragPoker = false
        self.isDragPokerHelp = true
        -- self.TableRunfastLogic:DragHint()
    else
        self.isDragPokerHelp = false
    end
    self.DragPokerFirstName = ""
    self.DragPokerPreName = ""
    self.DragPokerLastName = ""
    self:ClearMyAllPokerGradientColor()
end

function TableRunfastModule:ResetDragPoker(...)
    self.isDragPoker = false
    self.DragPokerFirstName = ""
    self.DragPokerPreName = ""
    self.DragPokerLastName = ""
end

------拖动按钮
function TableRunfastModule:on_drag(obj, arg)
    if (obj.name == "ButtonMic") then
        if (arg.pointerEnter and arg.pointerEnter.gameObject == obj) then
            ModuleCache.ModuleManager.show_module("public", "tablevoice", true)
        else
            ModuleCache.ModuleManager.show_module("public", "tablevoice", false)
        end
    elseif (obj.name == "Poker") then
        local count = arg.hovered.Count
        for i = 0, count - 1 do
            local go = arg.hovered[i]
            if (go and go.name) then
                if (go.transform.parent and go.transform.parent == self.TableRunfastView.PokerPrefabParent.transform) then
                    --if (go.name == "Poker1" or go.name == "Poker2" or go.name == "Poker3" or go.name == "Poker4" or go.name == "Poker5" or go.name == "Poker6" or go.name == "Poker7" or go.name == "Poker8" or go.name == "Poker9" or go.name == "Poker10" or go.name == "Poker11" or go.name == "Poker12" or go.name == "Poker13" or go.name == "Poker14" or go.name == "Poker15" or go.name == "Poker16") then
                    self.DragPokerLastName = go.name
                    if (self.DragPokerFirstName == "") then
                        self.DragPokerFirstName = go.name
                    end
                    if (self.DragPokerPreName == "") then
                        self.DragPokerPreName = go.name
                    elseif (self.DragPokerPreName ~= go.name) then
                        self.DragPokerPreName = go.name
                        TableSound:PlaySound_Btn()
                        self:DragPokerEffect()
                    end
                    self.isDragPoker = true
                end
            end
        end
    end
end

function TableRunfastModule:tryPlayVoice()
    if (self.curPlayingVoiceData or self.isRecording) then
        return false
    end
    if (self.curPlayerVoiceTimeEventId) then
        CSmartTimer:Kill(self.curPlayerVoiceTimeEventId)
        self.curPlayerVoiceTimeEventId = nil
    end
    local voiceData = self.waitPlayVoiceQueue:shift()
    if (voiceData) then
        local filePath = voiceData.savePath
        local seatInfo = voiceData.seatInfo
        if (self.TableRunfastView.openVoice) then
            self:PauseMusic()
            if seatInfo ~= nil then
                self.TableRunfastView:show_voice(seatInfo.localSeatIndex)
            end
            CustomVoiceManager.play_recorded_file(filePath)
            self.curPlayingVoiceData = voiceData
            local timeEvent = self:subscibe_time_event(60, false, 0):OnComplete(function(...)
                self.TableRunfastView:hide_voice(seatInfo.localSeatIndex)
                self.voiceDataMap[filePath] = nil
                self.curPlayingVoiceData = nil
                self:tryPlayVoice()
            end)
            self.curPlayerVoiceTimeEventId = timeEvent.id
            return true
        end
    end
    return false
end

-- 拖牌的效果
function TableRunfastModule:DragPokerEffect()
    local DragFirstindex = self:FindPokerIndex(self.DragPokerFirstName)
    local DragLastindex = self:FindPokerIndex(self.DragPokerLastName)
    if (DragFirstindex < 0 or DragLastindex < 0) then
        return
    end

    local startIndex = DragFirstindex
    local endIndex = DragLastindex
    if (startIndex > endIndex) then
        startIndex = DragLastindex
        endIndex = DragFirstindex
    end
    -- print("==效果startIndex="..tostring(startIndex).." endIndex="..tostring(endIndex))
    self.TableRunfastLogic:onDragPokerEffect(startIndex, endIndex)
end

-- 清除拖牌效果
function TableRunfastModule:ClearMyAllPokerGradientColor()
    local locCount = TableData.pokerSlotMaxCount
    for i = 1, locCount do
        local localPoker = self.TableRunfastLogic:FindPokerByName(tostring(i))
        if (localPoker) then
            self.TableRunfastHelper:enableGradientColor(localPoker, false)
        end
    end
end

------拖牌的响应
function TableRunfastModule:DragPokerAction()
    local DragFirstindex = self:FindPokerIndex(self.DragPokerFirstName)
    local DragLastindex = self:FindPokerIndex(self.DragPokerLastName)
    if (DragFirstindex < 0 or DragLastindex < 0) then
        return
    end

    local startIndex = DragFirstindex
    local endIndex = DragLastindex
    if (startIndex > endIndex) then
        startIndex = DragLastindex
        endIndex = DragFirstindex
    end
    -- print("==响应startIndex="..tostring(startIndex).." endIndex="..tostring(endIndex))
    self.TableRunfastLogic:onDragPoker(startIndex, endIndex)
end

------找牌的下标
function TableRunfastModule:FindPokerIndex(name)
    return tonumber(name)
end

------显示
function TableRunfastModule:on_show(intentData)
    -- if(ModuleCache.GameManager.developmentMode) then
    --     self.randomConnect = math.random(20, 30)
    --     if(self.randomConnectID) then
    --         CSmartTimer:Kill(self.randomConnectID)
    --         self.randomConnectID = nil
    --     end
    --     self.randomConnectID = self:subscibe_time_event(self.randomConnect, false, 0):OnComplete(function(t)
    --         TableManagerPoker:heartbeat_timeout_reconnect_game_server()
    --     end).id
    -- end
    --self.lastUpdateBeatTime = 0
    self:initTable()

    self.gameClient = self.modelData.bullfightClient
    --UpdateBeat:Add(self.UpdateBeat, self)
    self.TableRunfastLogic:on_show()


end

function TableRunfastModule:on_module_inited(...)
    self.lastUpdateBeatTime = 0
    self.gameClient = self.modelData.bullfightClient
end

------隐藏
function TableRunfastModule:on_hide()
    --UpdateBeat:Remove(self.UpdateBeat, self)
    self.TableRunfastLogic:on_hide()
    self:clean_share_clip_board()
end

------销毁
function TableRunfastModule:on_destroy()
    self:_on_model_event_unbind()
    --UpdateBeat:Remove(self.UpdateBeat, self)
    self.TableRunfastLogic = nil
    --print("===============清空剪切板")
    self:clean_share_clip_board()

    --if(self.table_voice_module)then
    --    ModuleCache.ModuleManager.destroy_module('public','table_voice')
    --end
    if (self.table_gift_module) then
        ModuleCache.ModuleManager.destroy_module('public', 'table_gift')
    end
end

------Update
function TableRunfastModule:on_update()
    if (self.isDestroy) then
        return
    end

    if (self.TableRunfastView.isPlayBacking) then
        self:PB_Update()
        return
    end

    if (self.TableRunfastLogic ~= nil) then
        self.TableRunfastLogic:update()
    end
    -- 每5秒刷新一次电池,时间,网络
    if ((not self.lastBatteryTime) or (self.lastBatteryTime + 2 < Time.realtimeSinceStartup)) then
        self.lastBatteryTime = Time.realtimeSinceStartup
        self.TableRunfastView:refreshBatteryAndTimeInfo()
    end

    if ((not self.lastRefreshPingValTime) or (self.lastRefreshPingValTime + 1 < Time.realtimeSinceStartup)) then
        self.lastRefreshPingValTime = Time.realtimeSinceStartup
        if (self.model and self.model.lastPingReqeustTime) then
            self.view:show_ping_delay(true, UnityEngine.Time.realtimeSinceStartup - self.model.lastPingReqeustTime)
        elseif (self.model and self.model.pingDelayTime) then
            self.view:show_ping_delay(true, self.model.pingDelayTime)
        else
            self.view:show_ping_delay(true, 0.05)
        end
    end

    -- 心跳:每 请求一次
    if ((self.lastUpdateBeatTime ~= 0) and ((not self.lastPingTime) or (self.lastPingTime + 3 < Time.realtimeSinceStartup))) then
        self.lastPingTime = Time.realtimeSinceStartup
        if (TableManagerPoker.clientConnected) then
            self.TableRunfastModel:request_ping()
        end
    end
    self.lastUpdateBeatTime = Time.realtimeSinceStartup

    if (self.gameClient) then
        if self.gameClient.clientConnected and (self.gameClient.lastReceivePackTime + 15 < Time.realtimeSinceStartup) then
            TableManagerPoker:heartbeat_timeout_reconnect_game_server()
        end
    end

    if ((not self.lastCheckAudioMusic) or (self.lastCheckAudioMusic + 1 < Time.realtimeSinceStartup)) then
        self.lastCheckAudioMusic = Time.realtimeSinceStartup
        local audioMusic = ModuleCache.SoundManager.audioMusic
        if (not audioMusic.isPlaying) then
            local bgMusic1 = "bgmfight1"
            local bgMusic2 = "bgmfight2"
            if ((not audioMusic.clip) or audioMusic.clip.name ~= bgMusic1) then
                TableSound:PlayMusic_BG(bgMusic1)
            else
                TableSound:PlayMusic_BG(bgMusic2)
            end
        end
    end

end

------暂停音乐
function TableRunfastModule:PauseMusic()
    SoundManager.audioMusic.mute = true
end

------不暂停音乐
function TableRunfastModule:UnPauseMusic()
    SoundManager.audioMusic.mute = false
end

------module事件绑定:发送包
function TableRunfastModule:on_module_event_bind()
    -- 心跳包
    self:subscibe_module_event("joinroom", "Event_Table_Ping", function(eventHead, eventData)
    end)

    -- 对话框确认解散房间
    self:subscibe_module_event("dissolveroom", "Event_DissolvedRoom", function(eventHead, eventData)
        print("==对话框确认解散房间1=")
        self.TableRunfastModel:request_dissolve_room(eventData)
    end)
    self:subscibe_package_event("Event_DissolvedRoom", function(eventHead, eventData)
        print("==对话框确认解散房间2=")
        self.TableRunfastModel:request_dissolve_room(eventData == 2)
    end)

    -- 解散房间
    self:subscibe_package_event("Event_RoomSetting_DissolvedRoom", function(eventHead, eventData)
        self.TableRunfastModel:request_dissolve_room(true)
    end)

    -- 退出房间
    self:subscibe_package_event("Event_RoomSetting_LeaveRoom", function(eventHead, eventData)

        if (TableManagerPoker.clientConnected) then
            self.onClickLeave = true
            print("金币场离开房间", self.onClickLeave)
            self.TableRunfastModel:request_exit_room()
        else
            ModuleCache.ModuleManager.destroy_package(BranchPackageName)
            ModuleCache.ModuleManager.destroy_package("public")
            ModuleCache.ModuleManager.show_module("public", "hall")
        end
    end)

    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self.TableRunfastModel:request_UserCoinBalanceReq()
    end)

    self:subscibe_package_event("Event_Close_TableShop", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self.TableRunfastModel:request_RechargeReq(false)
    end)

    self:subscibe_package_event("Event_GoldJump_error", function(eventHead, eventData)
        if self.isHide then
            return
        end
        print("=====执行Event_GoldJump_error")
        self:GoToHall()
    end)

    self:subscibe_package_event("Event_Refresh_StyleType_Runfast", function(eventHead, eventData)
        print("====执行:刷新跑得快的牌面样式=", eventData)
        self.TableRunfastView:CheckStyleType(eventData)
        self.TableRunfastLogic:refreshMyHandPokerListBySeverData()
    end)

    -- 聊天
    -- self:subscibe_module_event("tablechat", "Event_Send_ChatMsg", function(eventHead, eventData)
    --     -- print("老方式==Event_Send_ChatMsg")
    --     if (eventData.isShotMsg) then
    --         self.TableRunfastModel:request_chat(ChatMsgType.shotMsg, eventData.content)
    --     elseif (eventData.isEmojiMsg) then
    --         self.TableRunfastModel:request_chat(ChatMsgType.emojiMsg, eventData.content)
    --     end
    -- end )
    self:subscibe_package_event("Event_Send_ChatMsg", function(eventHead, eventData)
        print("新方式==Event_Send_ChatMsg")
        local msgType, text = nil, nil
        if (eventData.chatType == 1) then
            -- 短语
            msgType = ChatMsgType.shotMsg
            text = eventData.content
        elseif (eventData.chatType == 2) then
            -- 表情
            msgType = ChatMsgType.emojiMsg
            text = eventData.content
        elseif (eventData.chatType == 3) then
            -- 文本消息
            msgType = ChatMsgType.text
            text = eventData.content
        else
            return
        end
        self.TableRunfastModel:request_chat(msgType, text)
    end)

    -- 结算界面继续游戏
    self:subscibe_module_event("currentgameaccount", "Event_CurrentGameAccount", function(eventHead, eventData)
        self.TableRunfastLogic:ClearLightPokers(true)
        self:ClearLeaveRoomPlayerIdList()
        local roomInfo = self.modelData.curTableData.roomInfo
        if (self.TableRunfastView:isJinBiChang()) then

            local myGoldCount = roomInfo.mySeatInfo.coinBalance
            print("====金币场点击继续游戏", myGoldCount, roomInfo.minEnterGoldNum, roomInfo.maxEnterGoldNum, TableManagerPoker.clientConnected)
            if (myGoldCount >= roomInfo.minEnterGoldNum and (myGoldCount <= roomInfo.maxEnterGoldNum or roomInfo.minEnterGoldNum >= roomInfo.maxEnterGoldNum)) then

                if (TableManagerPoker.clientConnected) then
                    --游戏服连接没有断开则 准备开始
                    print("金币场继续，点击准备", self.modelData.roleData.RoomType)
                    self.gotoOtherGoldRoom = roomInfo.goldFieldId
                    self.TableRunfastModel:request_ready()
                    roomInfo.IsNeedShowReplaceTable = true
                    self:subscibe_time_event(3, false, 0):OnComplete(function(t)
                        roomInfo.IsNeedShowReplaceTable = false
                    end)
                else
                    --游戏服连接断开了则进入匹配界面
                    print("====自己的金币数量在这个区间就执行这里进行匹配")
                    TableManagerPoker:disconnect_game_server()
                    MatchingManager:gold_jump(roomInfo.goldFieldId)

                end

            elseif (myGoldCount < 2000) then
                self.TableRunfastLogic:BankruptGoToHall()
            else
                print("====金币数量超出场次限制，进入匹配服匹配")
                --退出游戏
                if (TableManagerPoker.clientConnected) then
                    self.gotoOtherGoldRoom = roomInfo.goldFieldId
                    self:dispatch_package_event("Event_RoomSetting_LeaveRoom")
                else
                    MatchingManager:gold_jump(roomInfo.goldFieldId)
                end

            end
        elseif (self.TableRunfastView:isMatchTable()) then
            print("====比赛场点击继续游戏:前三名进入匹配", roomInfo.totalRoundCount, roomInfo.curRoundNum)
            if (roomInfo.totalRoundCount == roomInfo.curRoundNum) then
                --print("====最后一局就匹配")
                local matchInfo = roomInfo.matchInfo
                TableManagerPoker:disconnect_game_server()
                TableManager:matching_enter(self.modelData.roleData.userID, self.modelData.roleData.password, matchInfo.matchId, matchInfo.stageId)
            else
                self.TableRunfastLogic:onclick_ready_btn()
            end
        else
            -- self.TableRunfastLogic:onclick_start_btn()
            self.TableRunfastLogic:onclick_ready_btn()
        end
    end)

    self:subscibe_module_event("currentgameaccount", "Event_HuanZhuo", function(eventHead, eventData)
        print("===============结算界面换桌逻辑")
        self:dispatch_package_event("Event_RoomSetting_LeaveRoom")
        TableManagerPoker:disconnect_game_server()
        local roomInfo = self.modelData.curTableData.roomInfo
        MatchingManager:gold_jump(roomInfo.goldFieldId)
        --TableManager:start_enter_gold_matching(self.modelData.roleData.userID, self.modelData.roleData.password, roomInfo.goldFieldId, nil, nil)
    end)

    self:subscibe_module_event("table", "Event_AccountClearTable", function(eventHead, eventData)
        --print("===============小结算关闭时清理牌桌")
        if eventData == 1 then
            self.TableRunfastLogic:ClearTable(true, true, true, true)
        else
            self.TableRunfastLogic:ClearTable(true, true, true, true, true)
        end
    end)

    self:subscibe_module_event("currentgameaccount", "Event_SetAudioMusic", function(eventHead, eventData)
        if (eventData and eventData > 0) then
            self:PauseMusic()
            self:subscibe_time_event(eventData, false, 0):OnComplete(function(t)
                self:UnPauseMusic()
            end)
        else
            self:UnPauseMusic()
        end
    end)

    self:subscibe_module_event("currentgameaccount", "Event_ChangeTable", function(eventHead, eventData)
        print("======继续游戏换桌1")
        TableManagerPoker:disconnect_game_server()
        local roomInfo = self.modelData.curTableData.roomInfo
        MatchingManager:gold_jump(roomInfo.goldFieldId)
    end)

    self:subscibe_module_event("currentgameaccount", "Event_PB_ReplayBtn", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
        self:OnClick_PB_PlayBtn()
        self:OnClick_PB_ReplayBtn()
    end)

    self:subscibe_module_event("currentgameaccount", "Event_PB_StopBtn", function(eventHead, eventData)
        self:OnClick_PB_StopBtn(true)
    end)

    self:subscibe_module_event("currentgameaccount", "Event_PB_BackBtn", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount")
        self.PB_StepNum = self.PB_StepNumMax
        self:OnClick_PB_PlayBtn()
    end)

    self:subscibe_module_event("currentgameaccount", "Event_PB_PauseBtn", function(eventHead, eventData)
    end)

    self:subscibe_module_event("currentgameaccount", "Event_PB_PlayBtn", function(eventHead, eventData)
    end)

    self:subscibe_module_event("currentgameaccount", "Event_PB_ForwardBtn", function(eventHead, eventData)
    end)
    self:subscibe_module_event("table", "Event_ClearLightPokers", function(eventHead, eventData)
        self.TableRunfastLogic:ClearLightPokers(true)
    end)
    self:subscibe_package_event("Event_TableVoice_StartPlayVoice", function(eventHead, eventData)
        local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(eventData, self.modelData.curTableData.roomInfo.seatInfoList)
        if (seatInfo) then
            self.TableRunfastView:show_voice(seatInfo.localSeatIndex)
        end
    end)
    self:subscibe_package_event("Event_TableVoice_StopPlayVoice", function(eventHead, eventData)
        local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(eventData, self.modelData.curTableData.roomInfo.seatInfoList)
        if (seatInfo) then
            self.TableRunfastView:hide_voice(seatInfo.localSeatIndex)
        end
    end)
    self:subscibe_package_event("Event_TableVoice_SendVoice", function(eventHead, eventData)
        self.TableRunfastModel:request_chat(ChatMsgType.voiceMsg, eventData)
    end)

    self:subscibe_package_event("Event_PlayerInfo_SendGift", function(eventHead, eventData)
        local gift = {
            receiver = eventData.receiver,
            giftName = eventData.giftName,
            times = eventData.times,
        }
        local text = ModuleCache.Json.encode(gift)
        self.model:request_chat(ChatMsgType.gift, text)
    end)


    self:subscibe_package_event("Event_RoomSetting_RefreshBg", function(eventHead, eventData)
        self.TableRunfastView:refresh_table_bg()
    end)

    self:subscibe_package_event("Event_RoomSetting_ClickSwitchChingJing", function(eventHead, eventData)
        self:ClickSwitchChingJing()
    end)
end

------model事件绑定收到包
function TableRunfastModule:on_model_event_bind()
    -- 同步消息包:收到数据每个玩家的信息
    self.TableRunfastModel.subscibe_event(TableManagerPoker, "Event_Table_Synchronize_Notify", function(eventHead, eventData)
        self.TableRunfastLogic:on_table_synchronize_notify(eventData)
    end)

    -- 进入房间
    self:subscibe_model_event("Msg_Table_Enter_Room", function(eventHead, eventData)
        if (tostring(eventData.err_no) == "0") then
        else
            TableManagerPoker:disconnect_game_server()
            ModuleCache.net.NetClientManager.disconnect_all_client()
            ModuleCache.ModuleManager.destroy_package(BranchPackageName)
            ModuleCache.ModuleManager.destroy_package("public", "hall")
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("进入房间失败")
        end
    end)


    -- 收到:牌桌中有玩家进入房间的通知
    self:subscibe_model_event("Event_Table_EnterRoom_Notify", function(eventHead, eventData)
        -- self.TableRunfastLogic:on_table_enter_notify(eventData)
    end)
    -- 收到:牌桌中有玩家退出房间的通知
    self:subscibe_model_event("Event_Table_Leave_Room_Notify", function(eventHead, eventData)
        local roomInfo = self.modelData.curTableData.roomInfo
        local player_id = eventData.player_id
        if (roomInfo.JustReceived_CurrentGameAccount) then
            --进到这里表示正在结算界面,如果玩家离开了将显示不了离开玩家的结算信息,所以暂时不显示玩家离开,延后处理
            roomInfo.LeaveRoomPlayerIdList = roomInfo.LeaveRoomPlayerIdList or {}
            table.insert(roomInfo.LeaveRoomPlayerIdList, player_id)
            return
        end
        --print("====Event_Table_Leave_Room_Notify=")
        self:PlayerLeaveRoom(player_id)
        self:refresh_share_clip_board()
    end)
    -- 收到:退出房间的回应
    self:subscibe_model_event("Event_Table_Leave_Room_Rsp", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        print("牌桌收到离开房间消息", self.gotoOtherGoldRoom, self.onClickLeave)
        if (eventData.err_no and eventData.err_no == "0") then
            if (self.TableRunfastView:isJinBiChang()) then
                if self.gotoOtherGoldRoom then
                    TableManagerPoker:disconnect_game_server()
                    --进入匹配服
                    MatchingManager:gold_jump(self.gotoOtherGoldRoom)
                    self.gotoOtherGoldRoom = nil
                    self.onClickLeave = false
                    return
                elseif (not self.onClickLeave) then
                    --不处理
                    self.haveLeave = true
                    TableManagerPoker:disconnect_game_server()
                    self.onClickLeave = false
                    return
                end
            end
            TableManagerPoker:disconnect_game_server()
            ModuleCache.net.NetClientManager.disconnect_all_client()
            ModuleCache.ModuleManager.destroy_package(BranchPackageName)
            ModuleCache.ModuleManager.destroy_package("public")
            ModuleCache.ModuleManager.show_module("public", "hall")
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("离开房间失败:" .. eventData.err_no)
        end
        self.onClickLeave = false
    end)


    -- 收到:牌桌中有玩家断线的通知
    self:subscibe_model_event("Event_Table_Disconnect_Notify", function(eventHead, eventData)
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(eventData.player_id, seatInfoList)
        if (seatInfo ~= nil) then
            seatInfo.isOffline = true
            self.TableRunfastView:refreshSeatOfflineState(seatInfo)
        end
    end)
    -- 收到:牌桌中有玩家重连的通知
    self:subscibe_model_event("Event_Table_Reconnect_Notify", function(eventHead, eventData)
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(eventData.player_id, seatInfoList)
        if (seatInfo) then
            seatInfo.isOffline = false
            self.TableRunfastView:refreshSeatInfo(seatInfo)
        end
    end)


    -- 解散房间相关
    -- 解散请求
    self:subscibe_model_event("Event_Table_Dissolve_Room_Rsp", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end)
    -- 解散投票
    self:subscibe_model_event("Event_Table_Dissolve_RoomRequest_Notify", function(eventHead, eventData)
        local freeRoomData, isFree, disAgreeSeatInfo = self:genFreeRoomData(eventData)
        self.freeRoomData = freeRoomData
        self.freeRoomData.dataType = BranchPackageName
        if (disAgreeSeatInfo) then
            ModuleCache.ModuleManager.hide_module("public", "dissolveroom")
        else
            ModuleCache.ModuleManager.show_module("public", "dissolveroom", self.freeRoomData)
        end
    end)
    -- 已解散
    self:subscibe_model_event("Event_Table_Dissolve_Room_Notify", function(eventHead, eventData)
        if (self.TableRunfastLogic:CheckIsDroppedOutThisRoundGame()) then
            print("==中途解散房间跳转到结算界面", self.modelData.roleData.HallID)
            ModuleCache.ModuleManager.hide_module("public", "dissolveroom")
            if not self.modelData.roleData.HallID or self.modelData.roleData.HallID == 0 or self.modelData.roleData.HallID == "0" then
                return
            end

        end

        print("==解散房间跳转到主城界面")
        self:subscibe_time_event(0.2, false, 0):OnComplete(function(t)
            TableManagerPoker:disconnect_game_server()
            ModuleCache.net.NetClientManager.disconnect_all_client()
            ModuleCache.ModuleManager.destroy_package(BranchPackageName)
            ModuleCache.ModuleManager.hide_module("public", "dissolveroom")
            ModuleCache.ModuleManager.show_module("public", "hall")
        end)
    end)


    -- 准备的回应
    self:subscibe_model_event("Event_Table_Ready_Rsp", function(eventHead, eventData)
        print("-- 准备的回应")
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.gotoOtherGoldRoom = nil
        if (tostring(eventData.err_no) == "0") then
            self.TableRunfastLogic:on_table_ready_rsp(eventData)
        else
            if (eventData.err_no == "-888") then
                self:GoTo_goldadd(true)
                if (self.TableRunfastView:isJinBiChang()) then
                    self.TableRunfastView:SetJinBiChangStateSwitcher("Center")
                end
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("准备错误err:" .. eventData.err_no)
            end
        end
    end)
    -- 收到:准备的广播通知
    self:subscibe_model_event("Event_Table_Ready_Notify", function(eventHead, eventData)
        -- 登陆成功
        self.TableRunfastLogic:on_table_ready_notify(eventData)
    end)

    -- 收到:开始的回应
    self:subscibe_model_event("Event_Table_Start_Rsp", function(eventHead, eventData)
        -- 登陆成功
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        if (tostring(eventData.err_no) == "0") then
            self.TableRunfastLogic:on_table_start_rsp()
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("开始错误:" .. eventData.err_no)
        end
    end)

    -- 收到:开始广播通知
    self:subscibe_model_event("Event_Table_Start_Notify", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end)


    -- 收到:聊天回应
    self:subscibe_model_event("Event_Table_Chat", function(eventHead, eventData)
    end)
    -- 收到:聊天广播通知
    self:subscibe_model_event("Event_Table_Chat_Notify", function(eventHead, eventData)
        print("====Event_Table_Chat_Notify")
        print_table(eventData)
        local playerId = eventData.player_id
        local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(playerId, self.modelData.curTableData.roomInfo.seatInfoList)
        if (seatInfo) then
            local chatMsg = eventData.chatMsg
            local chatData = { }
            chatData.userId = playerId
            chatData.chatType = chatMsg.msgType
            chatData.content = ''
            chatData.SeatID = seatInfo.localSeatIndex
            chatData.playerInfo = seatInfo.playerInfo
            if (chatMsg.msgType == ChatMsgType.text) then
                self.TableRunfastView:show_chat_bubble(seatInfo.localSeatIndex, chatMsg.text)
                chatData.content = chatMsg.text
                table.insert(self.allChatMsgs, chatData)
            elseif (chatMsg.msgType == ChatMsgType.shotMsg) then
                local textkey = chatMsg.text
                local text = self:getShotTextByShotTextIndex(textkey)
                self.TableRunfastView:show_chat_bubble(seatInfo.localSeatIndex, text)
                TableSound:PlaySound_ShotVocie(seatInfo.playerInfo and seatInfo.playerInfo.gender == 1, textkey)
                chatData.content = text
                table.insert(self.allChatMsgs, chatData)
            elseif (chatMsg.msgType == ChatMsgType.voiceMsg) then
                -- 语言对话
                local voiceData = { }
                voiceData.fileid = chatMsg.text
                if string.sub(voiceData.fileid, 1, 1) == "{" then
                    local jsonData = ModuleCache.Json.decode(voiceData.fileid)
                    if (jsonData.key) then
                        voiceData.savePath = Application.persistentDataPath .. "/" .. jsonData.key .. ".data"
                        voiceData.seatInfo = seatInfo
                        self.voiceDataMap[voiceData.savePath] = voiceData
                        self:initGVoice()
                        CustomVoiceManager.download_recorded_file(voiceData.fileid, voiceData.savePath, 60000)
                    end
                end
            elseif (chatMsg.msgType == ChatMsgType.gift or chatMsg.msgType == ChatMsgType.emojiMsg) then
                self:on_send_gift_chat_msg(playerId, chatMsg.text)
            end
            self:dispatch_package_event("Event_Refresh_ChatMsg")
        end
    end)



    -- 收到:到期时间
    self:subscibe_model_event("Event_Table_SynExpire_Notify", function(eventHead, eventData)

    end)

    self:subscibe_model_event("Event_Table_GameInfo", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:on_table_gameinfo(eventData)
    end)

    self:subscibe_model_event("Event_Table_CurrentGameAccount", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:on_table_currentgameaccount(eventData)
    end)

    self:subscibe_model_event("Event_Table_TotalGameAccount", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        -- self.TableRunfastLogic:on_table_totalgameaccount(eventData)
    end)

    self:subscibe_model_event("Event_Table_DiscardNotify", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:DiscardNotify(eventData)
    end)

    self:subscibe_model_event("Event_Table_DiscardReply", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:on_table_discardreply(eventData)
    end)

    self:subscibe_model_event("Event_Table_CustomInfoChangeBroadcast", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        -- 延迟处理
        self:subscibe_time_event(2, false, 0):OnComplete(function(t)
            self.TableRunfastLogic:on_table_CustomInfoChangeBroadcast(eventData)
        end)
    end)

    self:subscibe_model_event("Event_Table_KickPlayerRsp", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end)

    self:subscibe_model_event("Event_Table_KickPlayerBroadcast", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        --print("==所有人都会收到踢人的广播")
        local player_id = eventData.player_id
        local myId = tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)

        --被踢的是自己,退出房间,到主城界面去
        if (player_id == myId) then
            TableManagerPoker:disconnect_game_server()
            ModuleCache.net.NetClientManager.disconnect_all_client()
            ModuleCache.ModuleManager.destroy_package(BranchPackageName)
            ModuleCache.ModuleManager.destroy_package("public")
            ModuleCache.ModuleManager.show_module("public", "hall")
            return
        end

        --你踢别人,刷新台面
        local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(player_id, self.modelData.curTableData.roomInfo.seatInfoList)
        if (seatInfo ~= nil) then
            seatInfo.playerId = "0"
            seatInfo.playerInfo = nil
            seatInfo.isSeated = false
            self.TableRunfastView:refreshSeat(seatInfo, false)
        end

        if (self.modelData.roleData.RoomType == 2) then
            --牌友圈 快速组局
            TableManagerPoker:heartbeat_timeout_reconnect_game_server()
        end

    end)

    -- 牌友圈 快速组局 踢人倒计时
    self:subscibe_model_event("Event_Table_KickPlayerExpire", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        print("------------------收到踢人倒计时：", eventData.expire)
        -- self.modelData.roleData.RoomType == 0 --0 非麻将馆房间 1 麻将馆普通开房 2 麻将馆随机组局 3 比赛场房间
        -- if(self.modelData.roleData.RoomType == 3) then

        if self.kickedTimeId then
            CSmartTimer:Kill(self.kickedTimeId)
        end

        self.kickedTimeId = self:subscibe_time_event(eventData.expire, false, 1):OnUpdate(function(t)
            t = t.surplusTimeRound
            self.view.buttonReady_quickStart_TextWrap.text = t .. ""
        end)                    :OnComplete(function(t)

        end)                    .id

    end)

    self:subscibe_model_event("Msg_Table_RoomAwardMessage", function(eventHead, eventData)
        local roomAwardTable = self.view:get_room_award_table(eventData)
        if (roomAwardTable) then
            ModuleCache.ModuleManager.show_public_module("redpacket", roomAwardTable)
        end
    end)

    self:subscibe_model_event("Msg_Table_OneShotSettleNotify", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:OneShotSettleNotify(eventData)
    end)

    self:subscibe_model_event("Msg_Table_IntrustRsp", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:IntrustRsp(eventData)
    end)

    self:subscibe_model_event("Msg_Table_IntrustNotify", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:IntrustNotify(eventData)
    end)


    -- self:subscibe_model_event("Msg_Table_GoldNotEnoughNotify", function(eventHead, eventData)
    --     print("====Msg_Table_GoldNotEnoughNotify")
    --     ModuleCache.ModuleManager.hide_public_module("netprompt")
    --     local roomInfo = self.modelData.curTableData.roomInfo
    --     local seatInfo = self.tableHelper:getSeatInfoByPlayerId(eventData.playerid, roomInfo.seatInfoList)
    --     if(seatInfo == nil) then
    --         print("==seatInfo == nil")
    --     else
    --         if(seatInfo == roomInfo.mySeatInfo) then
    --         end
    --     end
    -- end)

    self:subscibe_model_event("Msg_Table_TimeoutNotify", function(eventHead, eventData)
        if self.isHide then
            return
        end
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:TimeoutNotify(eventData)
    end)

    self:subscibe_model_event("Msg_Table_BankruptNotify", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:BankruptNotify(eventData)
    end)

    self:subscibe_model_event("Msg_Table_RechargeNotify", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:RechargeNotify(eventData)
    end)

    self:subscibe_model_event("Msg_Table_CardRecorderMsg", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:CardRecorderMsg(eventData)
    end)

    self:subscibe_model_event("Msg_Table_CardRecorderStatuRsp", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        if (eventData.status == 0) then
            print("====没有记牌,去购买?")
            if (TableData.IsCan_BuyRecordPoker) then
                self:QueryGamePacketItemBuyPage()
            end
        elseif (eventData.status == 1) then
            print("====已经拥有记牌")
            if (not self.modelData.curTableData.roomInfo.accountWaitReady
            and self.TableRunfastLogic:IsCardRecorderState(self.modelData.curTableData.roomInfo.mySeatInfo)) then
                self.TableRunfastView:SetState_RecordPokerTimeRoot(not self.TableRunfastView.RecordPokerTimeRoot.gameObject.activeInHierarchy)
            end
        end
    end)
    self:subscibe_model_event("Msg_Table_PlayerMatchRanksNotify", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        self.TableRunfastLogic:PlayerMatchRanksNotify(eventData)
    end)

    self:subscibe_model_event("Msg_Table_MatchRankRsp", function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        print("================Msg_Table_MatchRankRsp")
        ModuleCache.ModuleManager.show_module("public", "matchonlinerank", eventData.playerRanks)
        self.TableRunfastLogic:PlayerMatchRanksNotify(eventData)
    end)
end

function TableRunfastModule:on_send_gift_chat_msg(senderPlayerId, content)
    local gift
    local chatface_id
    if (string.sub(content, 1, 1) == "{") then
        gift = ModuleCache.Json.decode(content)
    else
        chatface_id = tonumber(content)
    end
    local senderSeatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(senderPlayerId, self.modelData.curTableData.roomInfo.seatInfoList)
    if (not senderSeatInfo) then
        return
    end
    local sendSeatHolder = self.view.seatHolderArray[senderSeatInfo.localSeatIndex]
    local data = {
        fromPos = sendSeatHolder.imagePlayerHead.transform.position,
    }
    if (gift) then
        data.giftName = gift.giftName
        data.times = gift.times
        if (gift.receiver) then
            local receiverSeatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(gift.receiver, self.modelData.curTableData.roomInfo.seatInfoList)
            if (not receiverSeatInfo) then
                return
            end
            local receiverSeatHolder = self.view.seatHolderArray[receiverSeatInfo.localSeatIndex]
            data.toPos = receiverSeatHolder.imagePlayerHead.transform.position
            data.receiverId = gift.receiver
        end
    elseif (chatface_id) then
        if (sendSeatHolder.emojiRootTran) then
            data.fromPos = sendSeatHolder.emojiRootTran.position
        end
        data.is_common_chatface = true
        data.chatface_id = chatface_id
    else
        return
    end
    self:dispatch_package_event('Event_Table_Play_SendGift', data)
end

function TableRunfastModule:_on_model_event_unbind()
    self.TableRunfastModel.unsubscibe_event_by_name(TableManagerPoker, "Event_Table_Synchronize_Notify")
end

------????
function TableRunfastModule:genFreeRoomData(data)
    local freeRoomData = { }
    local freeRoomStateList = data.freeRoomStateList
    local isAllAgree = true
    local isAllAnswered = true
    local disAgreeSeatInfo = nil
    freeRoomData.expire = data.expire
    for i, v in ipairs(self.modelData.curTableData.roomInfo.seatInfoList) do
        if (v.playerId and v.playerId ~= '0' and v.playerId ~= 0) then
            local freeRoomSeatData = { }
            freeRoomSeatData.seatInfo = v
            freeRoomSeatData.isSponsor = false
            freeRoomSeatData.isAnswered = false
            freeRoomSeatData.agree = false
            table.insert(freeRoomData, freeRoomSeatData)
            -- print(v.playerId, self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
            if (v.playerId == self.modelData.curTableData.roomInfo.mySeatInfo.playerId) then
                freeRoomData.mySeatFreeRoomData = freeRoomSeatData
            end
            for j, value in ipairs(freeRoomStateList) do
                if (freeRoomSeatData.seatInfo == self.TableRunfastHelper:getSeatInfoByPlayerId(value.player_id, self.modelData.curTableData.roomInfo.seatInfoList)) then
                    freeRoomSeatData.isSponsor = value.sponsor == value.player_id
                    freeRoomSeatData.isAnswered = true
                    freeRoomSeatData.agree = value.agree
                end
            end
            if (freeRoomSeatData.isAnswered and (not freeRoomSeatData.agree)) then
                disAgreeSeatInfo = freeRoomSeatData.seatInfo
            end
            isAllAgree = isAllAgree and freeRoomSeatData.agree
            isAllAnswered = isAllAnswered and freeRoomSeatData.isAnswered
        end
    end

    return freeRoomData, isAllAgree and isAllAnswered, disAgreeSeatInfo
    --[[
	local freeRoomData = {}
	local freeRoomStateList = data.freeRoomStateList
	local isAllAgree = true
	local isAllAnswered = true
	local disAgreeSeatInfo = nil
	freeRoomData.expire = data.expire
	for i, v in ipairs(self.modelData.curTableData.roomInfo.seatInfoList) do
		if(v.playerId and v.playerId ~= '0' and v.playerId ~= 0) then
			local freeRoomSeatData = {}
			freeRoomSeatData.seatInfo = v
			freeRoomSeatData.isSponsor = false
			freeRoomSeatData.isAnswered = false
			freeRoomSeatData.agree = false
			table.insert(freeRoomData, freeRoomSeatData)
			if(v == self.modelData.curTableData.roomInfo.mySeatInfo) then
				freeRoomData.mySeatFreeRoomData = freeRoomSeatData
			end
			for j, value in ipairs(freeRoomStateList) do
				if(freeRoomSeatData.seatInfo == self.TableRunfastHelper:getSeatInfoByPlayerId(value.player_id, self.modelData.curTableData.roomInfo.seatInfoList)) then
					freeRoomSeatData.isSponsor = value.sponsor == value.player_id
					freeRoomSeatData.isAnswered = true
					freeRoomSeatData.agree = value.agree
				end
			end
			if(freeRoomSeatData.isAnswered and(not freeRoomSeatData.agree)) then
				disAgreeSeatInfo = freeRoomSeatData.seatInfo
			end
			isAllAgree = isAllAgree and freeRoomSeatData.agree
			isAllAnswered = isAllAnswered and freeRoomSeatData.isAnswered
		end
	end
	return freeRoomData, isAllAgree and isAllAnswered, disAgreeSeatInfo
	]]
end

------获取聊天的文本
function TableRunfastModule:getShotTextByShotTextIndex(key)
    -- return Config.chatShotTextList[index]
    return self.chatConfig.chatShotTextList[key]
end

function TableRunfastModule:selectCardsByPokerArray(pokerArray)
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray
    local selectedPokersArray = { }
    for i = 1, #cardsArray do
        cardsArray[i].selected = false
        self.TableRunfastView:refreshCardSelect(cardsArray[i])
        for j = 1, #pokerArray do
            if (cardsArray[i].poker == pokerArray[j]) then
                cardsArray[i].selected = true
                table.insert(selectedPokersArray, cardsArray[i].poker)
                self.TableRunfastView:refreshCardSelect(cardsArray[i])
            end
        end
    end
    self.TableRunfastView.seatHolderArray[1].selectedPokersArray = selectedPokersArray
end

function TableRunfastModule:resetSelectedPokers()
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray
    for i = 1, #cardsArray do
        if (cardsArray[i].selected) then
            cardsArray[i].selected = false
            self.TableRunfastView:refreshCardSelect(cardsArray[i])
        end
    end
    self.TableRunfastView.seatHolderArray[1].selectedPokersArray = { }
end

-- 上传IP和地址
function TableRunfastModule:UploadIpAndAddress()
    --print("==上传IP和地址UploadIpAndAddress")
    local newTable = { }
    newTable.address = ModuleCache.GPSManager.gpsAddress
    newTable.gpsInfo = ModuleCache.GPSManager.gps_info
    self.TableRunfastModel:request_CustomInfoChange(ModuleCache.Json.encode(newTable))
end

-- 是否允许过牌
function TableRunfastModule:IsAllowPassPoker()
    local isAllowPassPoker = nil
    if (TableManager ~= nil and TableManager.RunfastRuleJsonString ~= nil) then
        local ruleTable = ModuleCache.Json.decode(TableManager.RunfastRuleJsonString)
        isAllowPassPoker = ruleTable.allow_pass
    end
    return isAllowPassPoker
end

function TableRunfastModule:Test(...)
    -- if(true) then
    -- 	--print("============curTableData_PB == nil")
    -- 	return
    -- end
    -- body
    --print("=========Test")
    if (self.curTableData_PB == nil) then
        --print("============curTableData_PB == nil")
        return
    end
    print_table(self.curTableData_PB.roomInfo)
    print_table(self.curTableData_PB.players)
    print_table(self.curTableData_PB.videoData)
    self:PB_InitiGameInfo()
end

function TableRunfastModule:PB_Reset(...)
    self.TableRunfastView.isPlayBacking = false
    self.TableRunfastView.curTableData_PB = nil
    TableManager.curTableData_PB = nil
    self.curTableData_PB = nil
    self.PB_ThrowPokerDataTable = nil
    self.PB_SeatPlayerIdTable = nil
    self.PB_StepNum = nil
    self.PB_IsStartPBTime = false
    self.PB_AccountData = nil
end

function TableRunfastModule:PB_InitiGameInfo(...)
    if (self.curTableData_PB == nil) then
        print("==curTableData_PB == nil")
        return
    end

    local has_seat_id = function()
        local info = self.curTableData_PB.videoData.RUNFAST.info
        for i, v in pairs(info) do
            if(not v.seat_id)then
                return false
            end
        end
        return true
    end

    -- 1.1出牌的数据以及顺序
    self.PB_ThrowPokerDataTable = {}
    for i = 1, 80 do
        local locData = self.curTableData_PB.videoData.RUNFAST.played_cards[tostring(i)]
        if (locData ~= nil) then
            table.insert(self.PB_ThrowPokerDataTable, locData)
        else
            -- print("=======数据数量i="..i)
        end
    end
    if (not has_seat_id() and #self.PB_ThrowPokerDataTable <= 0) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips('老牌局数据无法回放')
        print("==没有出牌的数据")
        self:PB_Reset()
        return
    else
        print("==出牌的数据数量=" .. #self.PB_ThrowPokerDataTable)
        print_table(self.PB_ThrowPokerDataTable)
        self.PB_StepNumMax = #self.PB_ThrowPokerDataTable
    end

    -- 1.2玩家的座位顺序
    self.PB_SeatPlayerIdTable = { }
    local seatMaxCount = TableData.seatMaxCount
    if (#self.PB_ThrowPokerDataTable >= 3) then
        for i = 1, seatMaxCount do
            local PB_ThrowPokerData = self.PB_ThrowPokerDataTable[i]
            if (PB_ThrowPokerData == nil) then
                print("=====PB_ThrowPokerData = nil  i=" .. tostring(i))
                --break
            else
                local player_id = PB_ThrowPokerData.player_id
                local IsContains = TableRunfastHelper:IsNumTableContains(self.PB_SeatPlayerIdTable, player_id)
                if (not IsContains) then
                    table.insert(self.PB_SeatPlayerIdTable, player_id)
                end
            end
        end
    end

    --兼容解散牌局
    if(has_seat_id())then
        self.PB_SeatPlayerIdTable = { }
        local info = self.curTableData_PB.videoData.RUNFAST.info
        for i, v in pairs(info) do
            self.PB_SeatPlayerIdTable[v.seat_id] = tonumber(i)
        end
    end

    -- 2.0开始组合
    local simulateData = { }
    -- 模拟数据
    simulateData.room_id = self.curTableData_PB.roomInfo.roomNum
    simulateData.game_loop_cnt = self.curTableData_PB.roomInfo.curRoundNum
    simulateData.game_total_cnt = self.curTableData_PB.roomInfo.totalRoundCount
    simulateData.desk_player_id = 0
    simulateData.desk_cards = { }
    simulateData.next_player_id = self.PB_SeatPlayerIdTable[1]
    simulateData.time = 0
    simulateData.max_player_cnt = #self.PB_SeatPlayerIdTable
    -- simulateData.rate = 1
    simulateData.players = { }
    for i = 1, #self.PB_SeatPlayerIdTable do
        local players = { }
        players.player_id = self.PB_SeatPlayerIdTable[i]
        players.player_pos = i
        players.is_single = false
        players.is_offline = false
        players.is_owner = (self.curTableData_PB.roomInfo.creatorId and self.curTableData_PB.roomInfo.creatorId == players.player_id)
        players.is_ready = true
        players.score = 0
        players.win_cnt = 0
        players.lost_cnt = 0
        players.rest_card_cnt = -1
        players.enter_cnt = 2
        table.insert(simulateData.players, players)
    end

    simulateData.cards = { }
    self.PB_HandCards = { }
    for i = 1, #self.PB_SeatPlayerIdTable do
        local player_id = self.PB_SeatPlayerIdTable[i]
        local handCards = self.curTableData_PB.videoData.RUNFAST.info[tostring(player_id)]
        if (handCards ~= nil) then
            handCards.player_id = player_id
            table.insert(self.PB_HandCards, handCards)

            --if (tonumber(player_id) == tonumber(self.curTableData_PB.roomInfo.creatorId)) then
            if (tonumber(player_id) == tonumber(self.modelData.curTablePlayerId)) then
                -- print("==============11111111111")
                -- print_table(handCards)
                for m = 1, #handCards.cards do
                    table.insert(simulateData.cards, handCards.cards[m])
                end
                -- print("==============22222222222")
                -- print_table(simulateData.cards)
            end
        end
    end
    print("=============gameinfo模拟数据")
    print_table(simulateData)
    print("=============PB_HandCards")
    print_table(self.PB_HandCards)

    self.PB_IsPause = false
    self.PB_IsStartPBTime = false
    self.PB_StepNum = 1

    self:subscibe_time_event(1, false, 0):OnComplete(function(t)
        self.TableRunfastLogic:on_table_gameinfo(simulateData)
        self:subscibe_time_event(3, false, 0):OnComplete(function(t)
            self.PB_IsStartPBTime = true
        end)
    end)

    self.PB_List = self:InitVideoData(self.curTableData_PB.videoData.RUNFAST)
    print("====初始化出牌数据")
    print_table(self.PB_List)
    print_table(self.PB_SeatPlayerIdTable)

    local locPB_AccountData = self.curTableData_PB.videoData.RUNFAST.settle_account.msg
    locPB_AccountData.isPBData = true
    self.PB_AccountData = locPB_AccountData
end

function TableRunfastModule:GetSeatIndex(playerId)
    for i = 1, #self.PB_SeatPlayerIdTable do
        if (tonumber(self.PB_SeatPlayerIdTable[i]) == tonumber(playerId)) then
            return i
        end
    end
end

function TableRunfastModule:InitVideoData(videoJsonData)
    -- print("====videoJsonData")
    -- print_table(videoJsonData)
    self.Just_Show_currentgameaccount = false
    local videoData = videoJsonData--ModuleCache.Json.decode(videoJsonData)
    local list = {}
    local lastGameData
    local gameData = { seatData = {} }
    local seatInfoTable = {}
    self.seatInfoTable = seatInfoTable
    local mySeatInfo;
    local index = 1
    for k, v in pairs(videoData.info) do
        local seatInfo = {}
        seatInfo.playerId = tonumber(k)
        if (seatInfo.playerId == tonumber(self.modelData.curTablePlayerId)) then
            mySeatInfo = seatInfo
        end
        seatInfo.score = v.score
        seatInfo.rest_cnt = v.rest_cnt
        seatInfo.bomb_cnt = v.bomb_cnt
        seatInfo.seatIndex = self:GetSeatIndex(seatInfo.playerId)--index
        seatInfoTable[seatInfo.playerId] = seatInfo
        index = index + 1
        local data = {}
        data.hand_cards = self:deep_clone(v.cards)
        local set = CardSet.new(data.hand_cards)
        CardCommon.Sort(set.cards)
        data.hand_cards = set.cards
        gameData.seatData[seatInfo.playerId] = data
    end

    for k, v in pairs(seatInfoTable) do
        v.localSeatIndex = self.TableRunfastHelper:getLocalIndexFromRemoteSeatIndex(v.seatIndex, mySeatInfo.seatIndex, index - 1)
    end
    lastGameData = self:deep_clone(gameData)
    table.insert(list, gameData)

    for i = 1, 70 do
        local playedData = videoData.played_cards[i .. '']
        if (not playedData) then
            break
        end
        gameData = { seatData = {} }
        gameData.cur_player_id = playedData.player_id
        for k, v in pairs(seatInfoTable) do
            local seatInfo = v
            local data = {}
            local lastSeatData = lastGameData.seatData[seatInfo.playerId]
            if (seatInfo.playerId == gameData.cur_player_id) then
                data.played_cards = self:deep_clone(playedData.played_cards)
                if (type(data.played_cards) == 'table') then
                    local set = CardSet.new(data.played_cards)
                    CardCommon.Sort(set.cards)
                    data.played_cards = set.cards
                    local result = self:remove_codeList(data.played_cards, lastSeatData.hand_cards)
                    data.hand_cards = self:deep_clone(lastSeatData.hand_cards)
                else
                    data.hand_cards = self:deep_clone(lastSeatData.hand_cards)
                end

            else
                if (playedData.played_cards == 'PASS') then
                    data.played_cards = lastSeatData.played_cards
                end
                data.hand_cards = self:deep_clone(lastSeatData.hand_cards)
            end
            gameData.seatData[seatInfo.playerId] = data

        end
        lastGameData = self:deep_clone(gameData)
        table.insert(list, gameData)
    end
    return list
end

function TableRunfastModule:deep_clone(t)
    local newTable = {}
    if (type(t) == 'table') then
        for k, v in pairs(t) do
            newTable[k] = self:deep_clone(v)
        end
    else
        return t
    end
    return newTable
end

function TableRunfastModule:remove_codeList(codeList, list)
    local result = true
    for k, v in pairs(codeList) do
        result = result and self:remove_code(v, list)
    end
    return result
end

function TableRunfastModule:remove_code(code, list)
    for k, v in pairs(list) do
        if (v == code) then
            table.remove(list, k)
            return true
        end
    end
    return false
end

-- 停止
function TableRunfastModule:OnClick_PB_StopBtn(isToHall)
    self:OnClick_PB_PauseBtn()
    if (isToHall) then
        self:PB_Reset()
        --ModuleCache.ModuleManager.destroy_package("public")
        ModuleCache.ModuleManager.destroy_module(BranchPackageName, "tablerunfast")
        ModuleCache.ModuleManager.destroy_module(BranchPackageName, "currentgameaccount")
        ModuleCache.ModuleManager.destroy_module(BranchPackageName, "currentgameaccount1")
        ModuleCache.ModuleManager.show_module("public", "hall")
    else
        if (self.PB_AccountData ~= nil) then
            if (self.Just_Show_currentgameaccount) then
                return
            end

            self.Just_Show_currentgameaccount = true
            self:subscibe_time_event(3, false, 0):OnComplete(function(t)
                self.Just_Show_currentgameaccount = false
            end)
            self.TableRunfastLogic:on_table_currentgameaccount(self.PB_AccountData)
        end
        -- self:PB_Reset()
        -- self:subscibe_time_event(3, false, 0):OnComplete(function(t)
        --     ModuleCache.ModuleManager.hide_package("public")
        -- end)
    end
end

-- 后退
function TableRunfastModule:OnClick_PB_BackBtn()
    if (not self.TableRunfastView.isPlayBacking) then
        return
    end

    if (self.PB_StepNum == nil or self.PB_StepNum == 0) then
        self.PB_StepNum = 1
    else
        self.PB_StepNum = self.PB_StepNum - 1
    end

    if (self.PB_StepNum <= 0) then
        self.PB_StepNum = 1
    end
    self:do_step(self.PB_StepNum, false)
end

-- 前进
function TableRunfastModule:OnClick_PB_ForwardBtn()
    if (not self.TableRunfastView.isPlayBacking) then
        return
    end
    if (self.PB_StepNum == nil or self.PB_StepNum == 0) then
        self.PB_StepNum = 1
    else
        self.PB_StepNum = self.PB_StepNum + 1
    end

    self:do_step(self.PB_StepNum, true)
end

--执行步骤
function TableRunfastModule:do_step(curStep, back)
    local gameData = self.PB_List[curStep] --当前出牌这一步的数据
    if (gameData == nil) then
        self:OnClick_PB_StopBtn()
        return
    end

    local curPlayerId = gameData.cur_player_id --当前出牌玩家id
    local seatData = gameData.seatData
    local myPlayerId = tonumber(self.modelData.curTablePlayerId)
    for k, v in pairs(seatData) do
        local seatInfo = self.seatInfoTable[k]
        if (myPlayerId == k) then
            if (v.played_cards == 'PASS') then
                self:PB_playFirstViewDisCards(false)
                self:PB_playPass(seatInfo, true and k == curPlayerId)
            elseif (type(v.played_cards) == 'table') then
                print("=====自己打牌")
                self:PB_playFirstViewDisCards(true, v.played_cards, curPlayerId ~= k)
                if (curPlayerId == k) then
                    self.TableRunfastLogic:PB_ThrowPokerType(seatInfo, v.played_cards)
                end
            else
                self:PB_playFirstViewDisCards(false)
            end
            self:PB_refreshFirstViewHandCards(v.hand_cards)
        else
            if (v.played_cards == 'PASS') then
                self:PB_playDisCards(seatInfo.localSeatIndex, false)
                self:PB_playPass(seatInfo, true and k == curPlayerId)
            elseif (type(v.played_cards) == 'table') then
                print("=====别人打牌")
                self:PB_playDisCards(seatInfo.localSeatIndex, true, v.played_cards, curPlayerId ~= k)
                if (curPlayerId == k) then
                    self.TableRunfastLogic:PB_ThrowPokerType(seatInfo, v.played_cards)
                end
            else
                self:PB_playDisCards(seatInfo.localSeatIndex, false)
            end
            self:PB_refreshOhterHandCards(seatInfo.localSeatIndex, v.hand_cards)
        end
    end
    self:PB_TurnWhoThrowPokerEffect(curPlayerId)

end

function TableRunfastModule:do_video()
    local throwPokerData = self.PB_ThrowPokerDataTable[self.PB_StepNum]
    -- print("=======123456")
    -- print_table(throwPokerData)
    local discardreplyData = { }
    local discardnotifyData = { }
    discardnotifyData.player_id = throwPokerData.player_id
    if (throwPokerData.played_cards == "PASS") then
        discardreplyData.is_ok = true
        discardnotifyData.is_passed = true
        discardnotifyData.cards = { }
    else
        discardreplyData.is_ok = true
        discardreplyData.desc = ""
        discardreplyData.cards = { }
        discardnotifyData.is_passed = false
        discardnotifyData.cards = throwPokerData.played_cards

        local inHandData = self:PB_GetHandDataByPlayerId(discardnotifyData.player_id)
        if (inHandData ~= nil) then
            -- print("======手上的牌 前")
            -- print_table(inHandData.cards)
            local shengyuCardsInHand = { }
            for i = 1, #inHandData.cards do
                local locCardNum = inHandData.cards[i]
                local IsContains = TableRunfastHelper:IsNumTableContains(discardnotifyData.cards, locCardNum)
                if (not IsContains) then
                    table.insert(shengyuCardsInHand, locCardNum)
                end
            end

            local set = CardSet.new(shengyuCardsInHand)
            CardCommon.Sort(set.cards)
            shengyuCardsInHand = set.cards

            inHandData.cards = shengyuCardsInHand
            discardreplyData.cards = shengyuCardsInHand
            -- print("======手上的牌 后")
            -- print_table(inHandData.cards)
            -- print("======查看所有玩家手上的牌")
            -- print_table(self.PB_HandCards)
        end
    end
    discardnotifyData.warning_flag = 0

    local nextStepNum = self.PB_StepNum + 1
    if (nextStepNum <= self.PB_StepNumMax) then
        local nextThrowPokerData = self.PB_ThrowPokerDataTable[nextStepNum]
        discardnotifyData.next_player_id = nextThrowPokerData.player_id
    else
        discardnotifyData.next_player_id = 0
    end
    discardnotifyData.rest_card_cnt = -1
    discardnotifyData.is_first_pattern = true

    -- 2.1 on_table_discardreply消息
    if (self.modelData.curTablePlayerId == throwPokerData.player_id) then
        -- print("==========on_table_discardreply")
        -- print_table(discardreplyData)
        if (discardnotifyData.cards ~= nil and #discardnotifyData.cards > 0) then
            self.TableRunfastLogic:UpPoker(discardnotifyData.cards)
            self:subscibe_time_event(0.3, false, 0):OnComplete(function(t)
                self.TableRunfastLogic:onReadyThrowCard()
            end)
        end

        self:subscibe_time_event(0.6, false, 0):OnComplete(function(t)
            self.TableRunfastLogic:on_table_discardreply(discardreplyData)
        end)
    end

    self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
        self.TableRunfastLogic:DiscardNotify(discardnotifyData)
    end)
end

-- 暂停
function TableRunfastModule:OnClick_PB_PauseBtn()
    if (not self.TableRunfastView.isPlayBacking) then
        return
    end

    self.PB_IsPause = true
end
-- 重播
function TableRunfastModule:OnClick_PB_ReplayBtn()
    if (not self.TableRunfastView.isPlayBacking) then
        return
    end
    self.PB_StepNum = 1
    self:do_step(self.PB_StepNum, false)
    self:PB_ResetCurrentCount()
end
-- 播放
function TableRunfastModule:OnClick_PB_PlayBtn()
    if (not self.TableRunfastView.isPlayBacking) then
        return
    end

    self.PB_IsPause = false
end

function TableRunfastModule:PB_GetHandDataByPlayerId(_PlayerId)
    for i = 1, #self.PB_HandCards do
        local locHandData = self.PB_HandCards[i]
        if (tonumber(locHandData.player_id) == tonumber(_PlayerId)) then
            return locHandData
        end
    end
    return nil
end

function TableRunfastModule:PB_RefreshInHandPokerForOthers(seatInfo, cardsNumTable)
    local localSeatIndex = seatInfo.localSeatIndex
    if (localSeatIndex == 1) then
        return
    end

    -- 1.1获取手上的牌的数据
    local locInHandCards = nil
    local locHandData = self:PB_GetHandDataByPlayerId(seatInfo.playerId)
    if (locHandData ~= nil) then
        locInHandCards = locHandData.cards
    end
    if (locInHandCards == nil) then
        return
    end

    -- 1.2刷新手上的牌
    local seatHolder = self.TableRunfastView.seatHolderArray[localSeatIndex]
    for i = 1, #seatHolder.inhandCardsArray do
        local cardHolder = seatHolder.inhandCardsArray[i]
        local locPokerNum = locInHandCards[i]
        if (i <= #locInHandCards and locPokerNum ~= nil) then
            cardHolder.face.sprite = self.TableRunfastHelper:GetPokerSprite(locPokerNum)
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.gameObject, true)
        else
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.gameObject, false)
        end
    end
end

function TableRunfastModule:PB_Update()
    if (self.TableRunfastView.isPlayBacking) then
    else
        return
    end

    if (self.PB_IsPause) then
        return
    else
    end

    if (self.PB_IsStartPBTime) then
    else
        return
    end

    if ((not self.lastPBTime) or (self.lastPBTime + 2.2 < Time.realtimeSinceStartup)) then
        self.lastPBTime = Time.realtimeSinceStartup
        self:OnClick_PB_ForwardBtn()
    end
end

function TableRunfastModule:PB_refreshFirstViewHandCards(cards)
    local myHandPokerNumTable = cards
    --1.1排序
    local set = CardSet.new(myHandPokerNumTable)
    CardCommon.Sort(set.cards)
    myHandPokerNumTable = set.cards

    --1.2设置数据
    local pokerSlotTable = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--牌的预设
    for i = 1, #pokerSlotTable do
        local cardHolder = pokerSlotTable[i]--牌槽
        if (i <= #myHandPokerNumTable) then
            local locPokerTable = self.TableRunfastHelper:NumberToPokerTable(myHandPokerNumTable[i])
            self.TableRunfastHelper:setCardInfo(cardHolder, locPokerTable)
            cardHolder.isThrowed = false
            cardHolder.isHide = false
            cardHolder.isDarkness = false
            cardHolder.cardRoot.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0, 0, 0)
        else
            cardHolder.isThrowed = true
            cardHolder.isHide = true
            cardHolder.isDarkness = true
        end
        cardHolder.selected = false
        self.TableRunfastHelper:enableGradientColor(cardHolder, cardHolder.isDarkness)
        ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.parent.transform.gameObject, not cardHolder.isHide)
    end
end

function TableRunfastModule:PB_refreshOhterHandCards(localSeatIndex, cards)
    local locInHandCards = cards
    -- 1.2刷新手上的牌
    local seatHolder = self.TableRunfastView.seatHolderArray[localSeatIndex]
    for i = 1, #seatHolder.inhandCardsArray do
        local cardHolder = seatHolder.inhandCardsArray[i]
        local locPokerNum = locInHandCards[i]
        if (i <= #locInHandCards and locPokerNum ~= nil) then
            cardHolder.face.sprite = self.TableRunfastHelper:GetPokerSprite(locPokerNum)
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.gameObject, true)
        else
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.gameObject, false)
        end
    end
end

function TableRunfastModule:PB_playDisCards(localSeatIndex, show, cards, withoutAnim)
    local cardsNumTable = cards
    local seatHolder = self.TableRunfastView.seatHolderArray[localSeatIndex]
    if (show) then
        for i = 1, #seatHolder.otherThrowPokerSlotTable do
            local pokerSlot = seatHolder.otherThrowPokerSlotTable[i]
            if (i <= #cardsNumTable) then
                ModuleCache.ComponentUtil.SafeSetActive(pokerSlot.gameObject, true)
                self.TableRunfastLogic:setCardInfo2(pokerSlot, cardsNumTable[i])
                if (not withoutAnim) then
                    self.TableRunfastHelper:PlayScaleAnim(pokerSlot.gameObject, 0.5, 1, 0.2)
                end
            else
                ModuleCache.ComponentUtil.SafeSetActive(pokerSlot.gameObject, false)
            end
        end
    else
        for i = 1, #seatHolder.otherThrowPokerSlotTable do
            local pokerSlot = seatHolder.otherThrowPokerSlotTable[i]
            if (pokerSlot ~= nil) then
                ModuleCache.ComponentUtil.SafeSetActive(pokerSlot.gameObject, false)
            end
        end
    end

end

function TableRunfastModule:PB_playFirstViewDisCards(show, cards, withoutAnim)
    --重置出牌的槽
    local FirstThrowPokerSlotArray = self.TableRunfastView.FirstThrowPokerSlotArray
    for i = 1, #FirstThrowPokerSlotArray do
        local FirstThrowPokerSlot = FirstThrowPokerSlotArray[i]
        ModuleCache.ComponentUtil.SafeSetActive(FirstThrowPokerSlot.PrefabGo, false)
    end
    --出牌的动画
    if (show) then
        local FirstThrowPokerSlotArray = self.TableRunfastView.FirstThrowPokerSlotArray
        local resultNumList = cards
        for i = 1, #resultNumList do
            local FirstThrowPokerSlot = FirstThrowPokerSlotArray[i]
            FirstThrowPokerSlot.FaceImage.sprite = self.TableRunfastHelper:GetPokerSprite(resultNumList[i], nil)
            ModuleCache.ComponentUtil.SafeSetActive(FirstThrowPokerSlot.PrefabGo, true)
            local fromY = 0
            local locOffestY = -120
            if (withoutAnim) then
                fromY = locOffestY
            end
            self.TableRunfastHelper:PlayMoveYAnim(FirstThrowPokerSlot.FaceImage, fromY, locOffestY, 0)
        end
    end
end

function TableRunfastModule:PB_playPass(seatInfo, show, withoutAnim)
    if (not show) then
        return
    end
    local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
    self.TableRunfastHelper:PlayScaleAnim(seatHolder.NotAffordEffectRoot, 0, 1, 0.2, 1.2)
    TableSound:PlaySound_NotAfford(self.TableRunfastLogic:GetPlayerIsMaleByPlayerId(seatInfo.playerId))
end

------轮到谁出牌的效果
function TableRunfastModule:PB_TurnWhoThrowPokerEffect(curPlayerId)
    local next_player_id = tonumber(curPlayerId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatInfoPlayerId = tonumber(seatInfo.playerId)
        local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
        local boolShow = (seatInfoPlayerId == next_player_id)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.HeadSelected.gameObject, boolShow)
    end
end

function TableRunfastModule:PB_ResetCurrentCount()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatHolder = self.TableRunfastView:GetSeatHolderBySeatInfo(seatInfo)
        seatHolder.textScore.text = tostring(0)
    end
end

function TableRunfastModule:GoTo_goldadd(is_alertdialog)
    print("====是否显示对话框=", tostring(is_alertdialog))
    if (is_alertdialog) then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel("您的金币不足，是否立即补充金币继续游戏？", function()
            self.TableRunfastModel:request_RechargeReq(true)
            ModuleCache.ModuleManager.show_module("public", "goldadd")
        end, nil, true, "确 认", "取 消")
    else
        self.TableRunfastModel:request_RechargeReq(true)
        ModuleCache.ModuleManager.show_module("public", "goldadd")
    end
end

function TableRunfastModule:OnClickBtnRecordPoker()
    local isTest = false
    if (isTest) then
        if (not self.modelData.curTableData.roomInfo.accountWaitReady) then
            self.TableRunfastView:SetState_RecordPokerTimeRoot(not self.TableRunfastView.RecordPokerTimeRoot.gameObject.activeInHierarchy)
        end
    else
        self.TableRunfastModel:request_CardRecorderStatuReq()
    end
end

--获取记牌购买界面的数据
function TableRunfastModule:QueryGamePacketItemBuyPage()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "packetItem/queryGamePacketItemBuyPage?",
        params = {
            uid = self.modelData.roleData.userID,
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            --{"ret":0,"errMsg":"","data":
            --{"rows":10,"total":2,"totalPage":1,"page":1,"currentResult":0,"orderBy":null,"asc":false,"startTime":null,"endTime":null,"searchValue":null,"list":[{"itemId":3,"itemCode":"123","itemName":"av2","itemIcon":"aaa","itemDesc":"","coins":100,"coinsType":2,"onwerNum":null},{"itemId":5,"itemCode":"1234","itemName":"av2","itemIcon":"aaa","itemDesc":"啊哈哈","coins":200,"coinsType":2,"onwerNum":null}]},"success":true}
            -- print_table(retData)
            local locDataList = retData.data.list
            if (locDataList and #locDataList > 0) then
                ModuleCache.ModuleManager.hide_module(BranchPackageName, "recordpokershop")
                ModuleCache.ModuleManager.show_module(BranchPackageName, "recordpokershop", locDataList)
            else
                print("error====获取记牌物品列表没有数据")
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    print("error====2")
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function TableRunfastModule:GoToHall()
    print("=====跳去大厅")
    --self.modelData.curTableData.roomInfo = nil
    ModuleCache.ModuleManager.destroy_package(BranchPackageName)
    ModuleCache.ModuleManager.destroy_package("public")
    ModuleCache.ModuleManager.show_module("public", "hall")
    TableManagerPoker:disconnect_game_server()
end

function TableRunfastModule:PlayerLeaveRoom(playerId)
    print("====玩家离开房间,玩家id=", playerId)
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    local roomInfo = self.modelData.curTableData.roomInfo
    local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(playerId, roomInfo.seatInfoList)
    if (seatInfo ~= nil) then
        seatInfo.playerId = "0"
        seatInfo.playerInfo = nil
        seatInfo.isSeated = false
        self.TableRunfastView:refreshSeat(seatInfo, false)
    end
    self.TableRunfastLogic:SeatInfoListRemoveDataByPlayerId(0)
    self.TableRunfastLogic:AutoReady()
    self.TableRunfastLogic:CheckLocation()
end

function TableRunfastModule:ClearLeaveRoomPlayerIdList()
    local LeaveRoomPlayerIdList = self.modelData.curTableData.roomInfo.LeaveRoomPlayerIdList
    if (not self.TableRunfastLogic:CheckTableIsNilOrEmpty(LeaveRoomPlayerIdList)) then
        for i = 1, #LeaveRoomPlayerIdList do
            self:PlayerLeaveRoom(LeaveRoomPlayerIdList[i])
        end
    end
    LeaveRoomPlayerIdList = nil
end

function TableRunfastModule:CheckLuckyBox()
    --print("==幸运宝箱")
    if (not self.TableRunfastView:isJinBiChang()) then
        self.TableRunfastView:SetState_BtnLuckyBox(false)
        return
    end

    MatchingManager:get_luckybox_times(function(data)
        print("幸运宝箱开启次数", data.remainderCount)
        self.TableRunfastView:SetState_BtnLuckyBox(data.remainderCount > 0)
    end)

    MatchingManager:get_luckybox_status(function(data)
        print("幸运宝箱开启，剩余时间", data.exprice)
        if data.exprice > 5 then
            if self.LuckyChestEventId then
                CSmartTimer:Kill(self.LuckyChestEventId)
                self.LuckyChestEventId = nil
            end

            self.LuckyChestEventId = self:subscibe_time_event(data.exprice, false, 0):OnComplete(function(t)
                self:dispatch_package_event('Event_Lucky_Buy_End')
            end)                         .id
        end
    end)
end

function TableRunfastModule:CheckFirstGiftBag()
    --print("==首冲礼包")
    if (not self.TableRunfastView:isJinBiChang()) then
        self.TableRunfastView:SetState_BtnFirstGiftBag(false)
        return
    end

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
            self.TableRunfastView:SetState_BtnFirstGiftBag(true)
            self.FirstGiftBagData = retData.data[1]
        else
            self.TableRunfastView:SetState_BtnFirstGiftBag(false)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function TableRunfastModule:refresh_share_clip_board()
    if (self.TableRunfastView:isFriendTable()) then
        --金币场比赛场调用会报错,好友场才有这个功能
        self:share_room_info_text(self:get_share_data())
    end
end

function TableRunfastModule:clean_share_clip_board()
    self:clear_share_room_info_text()
end

function TableRunfastModule:get_share_data()
    local roomInfo = self.modelData.curTableData.roomInfo
    local ruleTable = roomInfo.createRoomRule
    local shareData = { }
    shareData.type = 2
    shareData.roomId = ""
    shareData.rule = ""
    local proStr = ModuleCache.PlayModeUtil.get_province_data(AppData.App_Name).shortName
    local gameType = ruleTable.GameType or ruleTable.gameType or ruleTable.game_type or ruleTable.bankerType or 3
    local _, wanfaName = Config.GetWanfaIdx(gameType)
    if (wanfaName == nil or wanfaName == "") then
        print("error====配置错误请检查配置数据", AppData.App_Name, gameType, _, name, wanfaName)
    end
    if (string.find(wanfaName, proStr)) then
        shareData.title = wanfaName
    else
        shareData.title = proStr .. wanfaName
    end
    if (AppData.App_Name == "DHAHQP" or AppData.Is_Independent_App) then
        shareData.title = wanfaName
    end
    local _, ruleDesc, totalSeat = TableUtil.get_rule_name(TableManager.RunfastRuleJsonString, self.modelData.roleData.HallID > 0)
    shareData.ruleName = wanfaName .. ' ' .. ruleDesc
    shareData.userID = self.modelData.roleData.userID
    shareData.parlorId = ""
    shareData.roomType = 0
    shareData.roomId = tostring(self.modelData.curTableData.roomInfo.roomNum)
    shareData.ruleMsg = self.modelData.curTableData.roomInfo.ruleDesc
    shareData.gameName = AppData.get_url_game_name()
    if (self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0) then
        shareData.parlorId = self.modelData.roleData.HallID .. ""
        shareData.roomType = self.modelData.roleData.RoomType
    else
        shareData.roomType = 0
    end
    if (self.modelData.roleData.RoomType == 3) then
        -- 比赛场分享
        shareData.type = 4
        shareData.matchId = self.modelData.roleData.MatchID
    elseif self.modelData.roleData.RoomType == 2 then
        --快速组局
        shareData.parlorId = shareData.parlorId .. string.format("%06d", ModuleCache.GameManager.curGameId)
    end
    shareData.totalPlayer = roomInfo.maxPlayerCount
    shareData.totalGames = roomInfo.totalRoundCount
    shareData.comeIn = false
    shareData.curPlayer = #roomInfo.seatInfoList
    print_table(shareData)
    print("--------------share-----------shareData.type:", shareData.type, shareData.parlorId, shareData.matchId)
    return shareData
end


function TableRunfastModule:on_click_pre_round_btn(obj, arg)
    local playBackInitData = self.curTableData_PB.playBackInitData
    if(playBackInitData)then
        local curReplayIndex = playBackInitData.curReplayIndex
        local replayRoundInfos = playBackInitData.replayRoundInfos
        curReplayIndex = curReplayIndex - 1
        local roundInfo = replayRoundInfos[curReplayIndex]
        if(roundInfo)then
            local players = {}
            for i=1,#roundInfo.players do
                local player = {}
                player.userId = roundInfo.players[i].userId
                table.insert(players,player)
            end
            playBackInitData.curReplayIndex = curReplayIndex
            self:playOtherVideo(roundInfo.gameId, roundInfo.replay, players, playBackInitData)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已经是第一局")
        end
    end
end

function TableRunfastModule:on_click_next_round_btn(obj, arg)
    local playBackInitData = self.curTableData_PB.playBackInitData
    if(playBackInitData)then
        local curReplayIndex = playBackInitData.curReplayIndex
        local replayRoundInfos = playBackInitData.replayRoundInfos
        curReplayIndex = curReplayIndex + 1
        local roundInfo = replayRoundInfos[curReplayIndex]
        if(roundInfo)then
            local players = {}
            for i=1,#roundInfo.players do
                local player = {}
                player.userId = roundInfo.players[i].userId
                table.insert(players,player)
            end
            playBackInitData.curReplayIndex = curReplayIndex
            self:playOtherVideo(roundInfo.gameId, roundInfo.replay, players, playBackInitData)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已经是最后一局")
        end
    end
end

function TableRunfastModule:playOtherVideo(gameId, recordId, players, playBackInitData)
    local data = {
        gameId = gameId,
        recordId = recordId,
        players = players,
        playBackInitData = playBackInitData,
    }
    TableManager:play_back_common_poker(data, data.players, function()
        ModuleCache.ModuleManager.destroy_module(ModuleCache.AppData.BranchRunfastName, "tablerunfast")
    end)
end

return TableRunfastModule
