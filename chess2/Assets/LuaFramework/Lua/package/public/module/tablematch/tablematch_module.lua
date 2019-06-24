
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableMatchModule = class("Public.TableMatchModule", ModuleBase)
local TableManager = TableManager
-- 常用模块引用
local ModuleCache = ModuleCache
local MatchingManager = require("package.public.matching_manager")
local CSmartTimer = ModuleCache.SmartTimer.instance
local audioMusic = ModuleCache.SoundManager.audioMusic
local bgMusic1 = "bgmfight1"
local bgMusic2 = "bgmfight2"
local bgMusic3 = "bgmfight3"
local Time = Time

ModuleCache.GameManager.set_rendering_AmbientMode()

function TableMatchModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "tablematch_view", "tablematch_model", ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TableMatchModule:on_module_inited()

end

function TableMatchModule:on_update()
    if ((not self.lastPingTime) or (self.lastPingTime + 3 < Time.realtimeSinceStartup)) then
        self.lastPingTime = Time.realtimeSinceStartup
        if (TableManager.loginClientConnected) then
            TableManager:request_ping()
        end
    end
    if TableManager.loginClientConnected and self.modelData.loginClient and self.modelData.loginClient.clientConnected and (self.modelData.loginClient.lastReceivePackTime + 15 < Time.realtimeSinceStartup) then
        TableManager:heartbeat_timeout_reconnect_login_server()
        ModuleCache.GameManager.logout();
    end
end

function TableMatchModule:on_update_per_second()
    if self.view and self.view.topright and self.modelData.hallData and not self.haveEnter then
        self.view.textTime.text = os.date("%H:%M", os.time())
        --print("延迟", TableManager.lastPingReqeustTime, TableManager.pingDelayTime  )
        if (TableManager.lastPingReqeustTime) then
            local delaytime = UnityEngine.Time.realtimeSinceStartup - TableManager.lastPingReqeustTime
            self.view:show_ping_delay(true, delaytime)
            if delaytime > 10 then
                self:reconnect_deal()
            else
                self.reconnectTimes = 0
            end
        elseif (TableManager.pingDelayTime) then
            self.view:show_ping_delay(true, TableManager.pingDelayTime)
            if TableManager.pingDelayTime > 10 then
                self:reconnect_deal()
            else
                self.reconnectTimes = 0
            end
        else
            self.reconnectTimes = 0
            self.view:show_ping_delay(true, 0.05)
        end
    end

    if (not audioMusic.isPlaying) then
        if self.packageName == "huzi" then
            ModuleCache.SoundManager.play_music("public", "public/sound/bgmmusic/" .. bgMusic2 .. ".bytes", bgMusic2)
        elseif string.find(self.packageName, "majiang") then
            ModuleCache.SoundManager.play_music("majiang", "majiang/sound/bgmmusic/" .. bgMusic3 .. ".bytes", bgMusic3)
        else
            ModuleCache.SoundManager.play_music("public", "public/sound/bgmmusic/" .. bgMusic1 .. ".bytes", bgMusic1)
        end
    end
end

function TableMatchModule:reconnect_deal()
    print("重连", self.reconnectTimes, TableManager.connecting, TableManager.loginClientConnected)
    self.request_join_room_login_server_roomID = 0
    if not self.reconnectTimes or self.reconnectTimes == 0 then
        --第一次无条件重连
        self:reconnet_match()
        if self.reconnectTimes then
            self.reconnectTimes = self.reconnectTimes + 1
        else
            self.reconnectTimes = 1
        end
    elseif self.reconnectTimes < 7 then
        if not TableManager.connecting and not TableManager.loginClientConnected then
            self:reconnet_match()
            if self.reconnectTimes then
                self.reconnectTimes = self.reconnectTimes + 1
            else
                self.reconnectTimes = 1
            end
        end
    else
        ModuleCache.GameManager.logout();
    end
end

function TableMatchModule:exit_to_hall()
    ModuleCache.ModuleManager.destroy_module("public", "tablematch")
    self:dispatch_package_event("Event_GoldJump_error")
    if (TableManager.loginClientConnected) then
        TableManager:disconnect_login_server()
    end
    ModuleCache.ModuleManager.show_module("public", "hall")
    ModuleCache.ModuleManager.show_module("public", "goldentrance")
end

-- 绑定module层的交互事件
function TableMatchModule:on_module_event_bind()
    self:subscibe_package_event("Event_GoldMatching_Quit", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self:exit_to_hall()
    end)

    self:subscibe_package_event("Event_Have_Enter_Table", function()
        if self.isHide then
            return
        end
        print("收到下销毁匹配界面通知")
        ModuleCache.ModuleManager.destroy_module("public", "tablematch")
    end)

    self:subscibe_package_event("Event_GoldMatching_Notify_RoomInfo", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self.view:update_player(eventData.Players)
        if (eventData.RoomID and eventData.RoomID ~= 0) then
            if self.request_join_room_login_server_roomID == eventData.RoomID then
                return
            end
            --if (TableManager.loginClientConnected) then
            --    TableManager:disconnect_login_server()
            --end
            self.haveEnter = true
            self.modelData.tableCommonData.tableType = 1
            self.modelData.tableCommonData.goldFildId = self.data.goldid
            self.modelData.hallData.hideCircle = true
            self.request_join_room_login_server_roomID = eventData.RoomID
            
            if self.packageName == "majiang" or self.packageName == "majiang3d" then
                local players = {}
                for i=1,#eventData.Players do
                    local player = {}
                    player.UserID = eventData.Players[i].UserID
                    player.SeatID = eventData.Players[i].SeatID
                    table.insert(players,player)
                end 
                if 2 <= #players and #players <= 4 then
                    ModuleCache.ModuleManager.show_module("majiang","opening",{
                        players = players,
                        aniStep = 1,
                        callBack = function() 
                            TableManager:request_join_room_login_server({roomId = eventData.RoomID}, true)
                        end
                    })
                else
                    TableManager:request_join_room_login_server({roomId = eventData.RoomID}, true)
                end
            else
                TableManager:request_join_room_login_server({roomId = eventData.RoomID}, true)
            end
        end
    end)

    self:subscibe_package_event("Event_Matching_Withdraw", function(eventHead, eventData)
        if self.isHide then
            return
        end
        if eventData.error == 0 then
            if (TableManager.loginClientConnected) then
                TableManager:disconnect_login_server()
            end

            ModuleCache.ModuleManager.hide_module("public", "tablematch")

            ModuleCache.ModuleManager.show_module("public", "hall")
            ModuleCache.ModuleManager.show_module("public", "bisai")

        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(eventData.ErrorInfo)
        end
    end)
    self:subscibe_package_event("match_entry_info_change", function(eventHead, eventData)
        if self.isHide then
            return
        end
        --print("收到比赛场人数改变推送", eventData, type(eventData), eventData.matchId, eventData.stageNum, eventData.preEntryNum,
        --        eventData.currentEntryNum, self.data.matchinfo.MatchID, self.data.matchinfo.StageID)
        if self.view and self.data and self.data.matchinfo and tonumber(self.data.matchinfo.MatchID) == tonumber(eventData.matchId) then
            if eventData.stageNum then
                --兼容api
                if tonumber(self.data.matchinfo.StageID) == tonumber(eventData.stageNum) then
                    self.view:refreshSignNum(eventData)
                end
            else
                self.view:refreshSignNum(eventData)
            end
        end
    end)
    self:subscibe_package_event("Event_Matching_Notify_RoomInfo", function(eventHead, eventData)
        print("比赛进入牌局", eventData.RoomID)
        if self.isHide then
            return
        end
        if (eventData.RoomID ~= 0) then
            if self.request_join_room_login_server_roomID == eventData.RoomID then
                return
            end
            self.haveEnter = true
            self.modelData.tableCommonData.tableType = 2
            self.modelData.hallData.hideCircle = true
            self.request_join_room_login_server_roomID = eventData.RoomID
            TableManager:request_join_room_login_server({roomId = eventData.RoomID}, true)
        end
    end)

    --事件
    self:subscibe_package_event("Event_Matching_Notify_MatchDynamic", function(eventHead, eventData)
        if self.isHide then
            return
        end
        if tonumber(eventData.MatchID) ~= tonumber(self.data.matchinfo.MatchID) and tonumber(eventData.StageID) ~= tonumber(self.data.matchinfo.StageID) then
            print("收到非本比赛场的比赛事件，", eventData.MatchID, eventData.StageID, self.data.matchinfo.MatchID, self.data.matchinfo.StageID)
            return
        end
        if self.data.matchtype == 1 then
            return
        end
        if not self.myinfo then
            self.myinfo = {}
        end
        local ev = ModuleCache.Json.decode(eventData.EventArgs)
        self.playerInfos = eventData.Users
        for _, v in pairs(self.playerInfos) do
            if tonumber(v.UserID) == tonumber(self.modelData.roleData.userID) then
                self.myinfo = v
            end
        end
        self.matchDynamicData = ev
        self.matchDynamicData.CurLoopCnt = eventData.CurLoopNo
        self.matchConfig = eventData.config
        if not self.firstInfo then
            self.firstInfo = 1
        else
            self.firstInfo = self.firstInfo + 1
        end --只有第一次和轮空晋级才刷新界面
        if self.matchData and self.data.type == "upgrade" and self.firstInfo == 1 then
            --第一次
            self.view:upgradeInfo(self.matchData, self.data.matchinfo, self.matchDynamicData, self.matchConfig, self.myinfo)
        elseif self.matchData and self:memberUser(ev.PromotionUsers, self.modelData.roleData.userID) and (ev.Type == "loop_start" or ev.Type == "loop_playing") then
            --轮空晋级
            print("收到轮空晋级消息")
            self.view:upgradeInfo(self.matchData, self.data.matchinfo, self.matchDynamicData, self.matchConfig, self.myinfo)
        end
        if (ev.Type == "loop_end" and ev.MatchState == 2) or ev.Type == "match_end" then
            local rank = 0
            if self.myinfo and self.myinfo.Rank then
                rank = self.myinfo.Rank
            end
            MatchingManager:matchAwards(eventData.MatchID, eventData.StageID, rank, eventData.CurLoopNo)
            if (TableManager.loginClientConnected) then
                TableManager:disconnect_login_server()
            end
        end
    end)

    self:subscibe_package_event("Event_RoomSetting_RefreshBg", function(eventHead, eventData)
        self.view:refresh_majiang_2d_Bg(eventData)
    end)
    self:subscibe_package_event("Event_RoomSetting_Refresh2dOr3d", function(eventHead, eventData)
        if 1 == eventData then
            ModuleCache.PackageManager.update_package_version("majiang3d", function()
                self.view:refresh_majiang_2d_Bg(-10086)
            end)
        elseif 2 == eventData then
            self.view:refresh_majiang_2d_Bg()
        end
    end)
end

function TableMatchModule:memberUser(ids, id)
    local is
    if ids and type(ids) == "table" then
        for _, p in pairs(ids) do
            if tonumber(p) == tonumber(id) then
                is = true
            end
        end
    end
    return is
end

function TableMatchModule:reconnet_match()
    print("匹配界面断线重连")
    if (TableManager.loginClientConnected) then
        TableManager:disconnect_login_server()
    end
    TableManager:reconnect_gold_match(self.modelData.roleData.userID, self.modelData.roleData.password)
end

-- 绑定loginModel层事件，模块内交互
function TableMatchModule:on_model_event_bind()


end

function TableMatchModule:on_show(data)
    self.request_join_room_login_server_roomID = 0
    self.view:hide();
    --self.view:initLocalView()
    if data then
        self.data = data
        self.view:show_view(data.matchtype)
        if data.matchtype == 1 then
            self:getgoldbyid(data.goldid)
        elseif data.matchtype == 2 then
            self:getmatchbyid(data)
        end

        --ModuleCache.AssetBundleManager:LoadAssetBundleAsync("runfast/module/tabletunfast/runfast_table.prefab", "Runfast_Table", nil)
    end

    self.packageName = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
    --self:dispatch_package_event("Event_GoldJump_error")
end

function TableMatchModule:on_click(obj, arg)
    print("点击", obj.name, obj.transform.parent.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonJinBiChangExit" then
        self.view:pannelExpand(false)
        if not TableManager.loginClientConnected then
            self:exit_to_hall()
            TableManager:check_in_room()
            ModuleCache.Log.report_exception("金币场匹配场退出卡住", self.modelData.roleData.userID, "")
        else
            if self.data.matchtype == 1 then
                TableManager:request_goldmathing_quit(self.data.goldid, self.modelData.roleData.userID)
            elseif self.data.matchtype == 2 then
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("比赛场无法退出")
            end
        end
    elseif obj.name == "BtnLeftOpen" then
        self.view:pannelExpand(true)
    elseif obj.name == "BtnLeftClose" then
        self.view:pannelExpand(false)
    elseif obj.name == "BtnMatchRank" then
        ModuleCache.ModuleManager.show_module("public", "matchrank", self.data.matchid)
    elseif obj.name == "Image" then
        local id = tonumber(obj.transform.parent.parent.parent.parent.parent.name)
        print("点击玩家头像", id)
        if id then
            ModuleCache.ModuleManager.show_module("public", "playerinfo", id):enable_gift(false)
        end
    elseif obj.name == "BtnSetting" then
        if AppData.Game_Name == "RUNFAST" then
            local intentData = { }
            intentData.tableBackgroundSpriteSetName = "RoomSetting_TableBackground_Name_" .. "RUNFAST"
            intentData.tableBackgroundSprite = self.view.bgsprite
            intentData.canExitRoom = false
            intentData.canDissolveRoom = false
            ModuleCache.ModuleManager.show_module("public", "roomsetting", intentData)
        else
            local ConfigData = ModuleCache.PlayModeUtil.getGameRuleConfig()--require(string.format("package.public.config.%s.config_%s", AppData.App_Name, AppData.Game_Name))
            local GameID = AppData.get_app_and_game_name()
            local wanfaType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
            if self.view.ruleJsonInfo then
                wanfaType = self.view.ruleJsonInfo.GameType
            end
            local Is3D = Config.get_mj3dSetting(GameID).Is3D
            local def3dOr2d = Config.get_mj3dSetting(GameID).goldRoomdef3dOr2d
            local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d", wanfaType)
            local intentData = { }
            intentData.tableBackgroundSpriteSetName = "RoomSetting_TableBackground_Name_" .. "MJ"
            intentData.canExitRoom = false
            intentData.canDissolveRoom = false
            intentData.is3D = Is3D
            intentData.def3dOr2d = def3dOr2d
            intentData.mj2dOr3dSetKey = mj2dOr3dSetKey
            if 1 == Is3D then
                intentData.tableBackground2d = self.view.majiang3dBgSprite[1] ---2D示意桌布
                intentData.tableBackground3d = self.view.majiang3dBgSprite[2] ---3D示意桌布
                local curSetting = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey, def3dOr2d)
                if 2 == curSetting then
                    intentData.tableBackgroundSprite = self.view.majiang2dBgSprite[1]  ---2D桌布
                    intentData.tableBackgroundSprite2 = self.view.majiang2dBgSprite[2] ---2D桌布
                    intentData.tableBackgroundSprite3 = self.view.majiang2dBgSprite[3] ---2D桌布
                end
            else
                if self.view.majiang2dBgSprite then
                    intentData.tableBackgroundSprite = self.view.majiang2dBgSprite[1]  ---2D桌布
                    intentData.tableBackgroundSprite2 = self.view.majiang2dBgSprite[2] ---2D桌布
                    intentData.tableBackgroundSprite3 = self.view.majiang2dBgSprite[3] ---2D桌布
                end
            end
            intentData.isOpenLocationSetting = ConfigData.isOpenLocationSetting
            intentData.defLocationSetting = ConfigData.defLocationSetting
            intentData.defGuoHu = ConfigData.defGuoHu
            ModuleCache.ModuleManager.show_module("public", "roomsetting", intentData)
        end

    elseif obj.name == "ButtonRuleExplain" then
        ModuleCache.ModuleManager.show_module("public", "goldhowtoplay")
    elseif obj.name == "BtnReturn" then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
                "您报名的比赛即将开始，真的要狠心离开吗？",
                function()
                    --退赛
                    if (TableManager.loginClientConnected) then
                        TableManager:request_matching_withdraw(self.data.matchinfo.MatchID, self.data.matchinfo.StageID, self.modelData.roleData.userID)
                    else
                        self:reconnet_match()
                    end
                    --
                    --self:dispatch_package_event("Event_QuiMatch")

                end, nil, true, "退赛", "取消")
    elseif obj.name == "BtnRank" then
        if self.playerInfos then
            ModuleCache.ModuleManager.show_module("public", "matchonlinerank", self.playerInfos)
        end
    end

end

function TableMatchModule:getgoldbyid(id)
    local addStr = "gold/getById?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            goldId = id,
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.view:initTable(1, retData.data, nil, self.modelData.roleData)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function TableMatchModule:getmatchbyid(data)
    local addStr = "match/getById?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            uid = self.modelData.roleData.userID,
            matchId = data.matchinfo.MatchID,
            stageNum = data.matchinfo.StageID
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.matchData = retData.data
            if self.matchDynamicData and self.data.type == "upgrade" then
                self.view:upgradeInfo(self.matchData, self.data.matchinfo, self.matchDynamicData, self.matchConfig, self.myinfo)
            end
            self.view:initTable(2, nil, retData.data, self.modelData.roleData, self.data)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function TableMatchModule:on_destroy()
end

return TableMatchModule



