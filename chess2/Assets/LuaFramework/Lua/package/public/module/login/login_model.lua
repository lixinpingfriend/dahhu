
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

---@class LoginModel
local LoginModel = Class("loginModel", Model)
local CSmartTimer = ModuleCache.SmartTimer.instance


function LoginModel:initialize(...)
    Model.initialize(self, ...)

end



function LoginModel:connect_login_server(userId, password, extendData)
    --ModuleCache.AssetBundleManager:LoadAssetBundleAsync("public/module/hall/public_windowhall.prefab", "Public_WindowHall", nil)
    TableManager:connect_login_server(function()
        TableManager:request_login_login_server(userId, password, extendData)
    end,
    --登录成功回调
            function(data)
                if data.UserID ~= "0" then
                    ModuleCache.LogManager.uid = data.UserID
                    if ModuleCache.GameManager.isTestUser then
                        local eventData = {
                            eventId = "Login_IsTestUser",
                            userId = data.UserID
                        }
                        ModuleCache.TalkingDataMgr().setEventData(eventData)
                    end
                    ModuleCache.GameSDKInterface:BuglySetUserId(data.UserID)
                    if extendData and extendData.testUserId then
                        local idAndToken = string.split(extendData.testUserId, "_")
                        self.testUserId = idAndToken[1]
                        if #idAndToken > 1 then
                            ModuleCache.AppData.userToken = idAndToken[2]
                        end
                    end
                    self:set_role_data(data)
                    ModuleCache.CustomVoiceManager.uid = data.UserID
                    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, data.UserID)
                    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, data.UserID)
                    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_PASSWORD, data.Password)
                    ModuleCache.PlayerPrefsManager.Save()

                    if (data.RoomID and data.RoomID ~= 0) then
                        if data.LoginEnv == "match" then
                            self.modelData.tableCommonData.tableType = 2
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            if jsonTable.GameName then
                                ModuleCache.GameManager.change_game_by_gameName(jsonTable.GameName)
                                if ModuleCache.AppData.isPokerRule(jsonTable.GameName) then
                                    TableManager:disconnect_login_server()
                                    TableManager:join_room({roomId = data.RoomID}, true)
                                    return
                                end
                            end
                        elseif data.LoginEnv == "new_gold" then
                            self.modelData.tableCommonData.tableType = 1
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            self.modelData.tableCommonData.goldFildId = jsonTable.GoldID
                            if jsonTable.GameName then
                                ModuleCache.GameManager.change_game_by_gameName(jsonTable.GameName)
                                if ModuleCache.AppData.isPokerRule(jsonTable.GameName) then
                                    TableManager:disconnect_login_server()
                                    TableManager:join_room({roomId = data.RoomID}, true)
                                    return
                                end
                            end
                        else
                            self.modelData.tableCommonData.tableType = 0
                        end
                        TableManager:request_join_room_login_server({roomId = data.RoomID})
                    elseif (data.LoginEnv == 'match') then
                        if TableManager.checkLoginTimeId then
                            CSmartTimer:Kill(TableManager.checkLoginTimeId)
                            TableManager.checkLoginTimeId = nil
                        end
                        local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                        MatchingManager:getmatchbyid(jsonTable.MatchID,function (matchdata)
                            local rule = ModuleCache.Json.decode(matchdata.playRule)
                            local gamename = rule.gameName or rule.GameID
                            if gamename then
                                ModuleCache.GameManager.change_game_by_gameName(gamename)
                                ModuleCache.JpushManager().setTag()
                                TableManager:disconnect_login_server()
                                TableManager:matching_enter(data.UserID, data.Password,jsonTable.MatchID, jsonTable.StageID)
                            end
                        end,function ()
                            TableManager:disconnect_login_server()
                            Model.dispatch_event(self, "Event_Login_LoginSucess")
                        end)

                    elseif (data.LoginEnv == 'new_gold') then
                        if TableManager.checkLoginTimeId then
                            CSmartTimer:Kill(TableManager.checkLoginTimeId)
                            TableManager.checkLoginTimeId = nil
                        end
                        local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                        MatchingManager:getGoldById(jsonTable.GoldID,function (golddata)
                            local rule = ModuleCache.Json.decode(golddata.playRule)
                            local gamename = rule.gameName or rule.GameID
                            if gamename then
                                ModuleCache.GameManager.change_game_by_gameName(gamename)
                                ModuleCache.JpushManager().setTag()
                                TableManager:disconnect_login_server()
                                TableManager:start_enter_gold_matching(data.UserID, data.Password,jsonTable.GoldID)
                            end
                        end,function ()
                            TableManager:disconnect_login_server()
                            Model.dispatch_event(self, "Event_Login_LoginSucess")
                        end)
                    else
                        ModuleCache.ModuleManager.hide_public_module("netprompt")
                        TableManager:disconnect_login_server()
                        Model.dispatch_event(self, "Event_Login_LoginSucess")
                        --ModuleCache.PreLoadManager.registerFinishPreLoadCallback(function()
                        --	--UnityEngine.Application.backgroundLoadingPriority = UnityEngine.ThreadPriority.High
                        --	ModuleCache.ModuleManager.show_module_only("public", "hall")
                        --end)
                        --ModuleCache.ModuleManager.show_module_only("public", "hall")
                    end
                    ModuleCache.JpushManager().init(self.modelData.roleData.userID)
                    if ModuleCache.TalkingDataMgr then
                        local loginType = ModuleCache.TalkingDataMgr().LoginType.REGISTERED
                        if self.modelData.weXinUserData then
                            loginType = ModuleCache.TalkingDataMgr().LoginType.WeChat
                        end
                        ModuleCache.TalkingDataMgr().setAccount(self.modelData.roleData, loginType)
                    end
                    if ModuleCache.GameManager.iosAppStoreIsCheck then
                        ModuleCache.TalkingDataMgr().setEventCheckVersion("Check_LoginSucess")
                    end
                else
                    ModuleCache.ModuleManager.hide_public_module("netprompt")
                    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
                    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_PASSWORD, "0")
                    if (data.ErrorInfo) then
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                    else
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("登录失败，请重试")
                    end
                    TableManager:disconnect_login_server()
                end
            end,
            nil, nil, function()
                TableManager:showNetErrDialog(nil)
            end)
end



function LoginModel:set_role_data(data)
    self.modelData.reset()
    self.modelData.roleData.userID = data.UserID;       --用户ID。为0表示微信登录
    self.modelData.roleData.userId = data.UserID;       --用户ID。为0表示微信登录
    ModuleCache.LogManager.uid = data.UserID

    if ModuleCache.GameManager.runtimePlatform == "OSXEditor" or ModuleCache.GameManager.runtimePlatform == "WindowsEditor" or ModuleCache.GameManager.developmentMode then
        if self.testUserId and self.testUserId ~= "" then
            print("-------------------self.testUserId = " .. self.testUserId)
            self.modelData.roleData.userID = self.testUserId
        end
        --self.modelData.roleData.userID      = "32017257";  --用户ID。为0表示微信登录
    end
    self.modelData.roleData.password = data.Password      --密码
    self.modelData.roleData.WeiXinCode = data.WeiXinCode;   --微信授权码。如果是用ID和密码登录，则忽略该参数
    self.modelData.roleData.Platform = data.Platform;   --系统平台
    self.modelData.roleData.RoomID = data.RoomID
    self.modelData.roleData.GameName = data.GameName
end

return LoginModel