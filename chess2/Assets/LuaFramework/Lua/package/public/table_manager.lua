local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local AppData = AppData
local class = require("lib.middleclass")
local Model = require('core.mvvm.model_base')
local ModuleEventBase = require('core.mvvm.module_event_base')
---@class TableManager
local TableManager = class('TableManager', Model)
local CSmartTimer = ModuleCache.SmartTimer.instance
local Net_Hall_Login = "Msg_Hall_Login"
local max_reconnect_game_server_times = 7
local Buffer = ModuleCache.net.Buffer
local Application = UnityEngine.Application
local Time = Time

function TableManager:henanmj_request_login_game_server(loginInfo, hideCircle)
    ModuleCache.GameSDKCallback.instance.mwEnterRoomID = "0"
    ModuleCache.FunctionManager.ClearClipBoard()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Login_Server")
    request.UserID = tonumber(loginInfo.UserID or self.modelData.roleData.userID)
    request.Password = loginInfo.Password
    request.RoomID = loginInfo.RoomID
    request.SeatID = loginInfo.SeatID or 0
    request.AppendData = loginInfo.AppendData or ""
    request.ProtoVersion = loginInfo.ProtoVersion or 1
    request.ClientVersion = loginInfo.ClientVersion

    Model.send_msg(self, msgId, request, "gameServer")

    -- 因为心跳的处理是在登录游戏服成功后
    self.checkLoginGameServerTimeId = self:subscibe_time_event_on(10, function(t)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        ModuleCache.GameManager.logout()
    end).id

    --ModuleCache.PreLoadManager.registerFinishPreLoadCallback(function()
    --    ModuleCache.UnityEngine.Application.backgroundLoadingPriority = UnityEngine.ThreadPriority.High
    --end)
end

function TableManager:henanmj_request_create_room(createInfo)
    local ruleTable = ModuleCache.Json.decode(createInfo.Rule)
    self.Rule = createInfo.Rule
    self.RoundCount = createInfo.RoundCount
    local msgId, request = self.netMsgApi:create_request_data("Msg_CreateRoom")
    if AppData.is_universal_game() then
        request.GameName = ModuleCache.AppData.to_universal_app_game_name(createInfo.GameName)
    else
        request.GameName = createInfo.GameName
    end

    request.RoundCount = createInfo.RoundCount or 0
    request.Rule = createInfo.Rule
    request.HallID = createInfo.HallID
    if createInfo.boxId then
        request.BoxID = createInfo.boxId
    end
    request.IsGoldFieldRoom = ruleTable.IsGoldFieldRoom or false

    if ModuleCache.GameManager.iosAppStoreIsCheck and (ruleTable.NeedOpenGPS or ruleTable.CheckIPAddress) then
        ruleTable.NeedOpenGPS = false
        ruleTable.CheckIPAddress = false
        createInfo.Rule = ModuleCache.GameUtil.table_encode_to_json(ruleTable)
        request.Rule = createInfo.Rule
    end

    if ruleTable.ShiShiYuYin then
        if not ModuleCache.SDKInterface().is_have_record_permission() then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("进入房间失败，请检查是否开启麦克风权限")
            return
        end
    end

    if ruleTable.NeedOpenGPS or ruleTable.CheckIPAddress  then
        local playRule = {
            NeedOpenGPS = ruleTable.NeedOpenGPS,
            CheckIPAddress = ruleTable.CheckIPAddress,
            simulateGPS = true
        }
        self:get_client_ip_and_gps(playRule, nil, function(exJsonStr)
            request.ExJsonStr = exJsonStr
            self:ExJsonStrInit(request)
            Model.send_msg(self, msgId, request, "login")
        end, true)
    else
        self:ExJsonStrInit(request)
        Model.send_msg(self, msgId, request, "login")
    end
end


--
function TableManager:get_client_ip_and_gps(playeRule, exJsonTable, callback)
    local processData = function(data)
        local exJsonTable = exJsonTable or {}
        if data then
            exJsonTable.gps_opened = not (data.latitude == 0 and data.longitude == 0)
            exJsonTable.latitude = tonumber(data.latitude)
            exJsonTable.longitude = tonumber(data.longitude)
        end
        exJsonTable.ip = tostring(self.modelData.roleData.ip)

        if (ModuleCache.GameManager.isEditor or "WindowsPlayer" == tostring(ModuleCache.UnityEngine.Application.platform)) then
            exJsonTable.gps_opened = true
            exJsonTable.ip = "183.1" .. os.date("%S") .. ".197.1" .. tostring(os.date("%S"))
            exJsonTable.latitude = tonumber("1" .. tostring(os.date("%S")))
            exJsonTable.longitude = tonumber("2" .. tostring(os.date("%S")))
        end

        return ModuleCache.Json.encode(exJsonTable)
    end

    if playeRule.CheckIPAddress and callback then
        if not playeRule.NeedOpenGPS and self.modelData.roleData.ip ~= "" then
            callback(processData(nil))
            --如果callback不置空的话就不会有可能受到两次回调
            callback = nil
            return
        end

        local requestData = {
            baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "api/getIp?",
            params = {
                uid = self.modelData.roleData.userID,
            },
        }
        ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
            local retData = ModuleCache.Json.decode(wwwOperation.www.text)
            if retData.ret and retData.ret == 0 then
                self.modelData.roleData.ip = retData.data
                if not playeRule.NeedOpenGPS and callback then
                    callback(processData(nil))
                    callback = nil
                end
            end
        end, function(error)
            print(error.error)
        end)

        if not playeRule.NeedOpenGPS then
            return
        end
    end

    if playeRule.NeedOpenGPS then
        local getGPS = function(forbidUserCacheData)
            ModuleCache.GPSManager.begin_location(function(data)
                if data.errorCodeInfo and data.errorCodeInfo == "位置服务未开启" then
                    callback = nil
                    self:disconnect_login_server()
                    ModuleCache.ModuleManager.hide_public_module("netprompt")
                    if ModuleCache.GameManager.platformIsIphone then
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("获取地理位置失败，请检查您的设备是否已开启\"定位服务\"")
                    elseif ModuleCache.GameManager.platformIsAndroid then
                        ModuleCache.ModuleManager.show_public_module_alertdialog():show_confirm_cancel("此玩法需要检测您的地理位置,而您设备GPS处于关闭状态(部分手机定位模式需要选择<color=red>高精确度模式</color>),\n是否前往打开？", function()
                            ModuleCache.GameSDKInterface:StartActivity("android.settings.LOCATION_SOURCE_SETTINGS")
                        end)
                    end
                end
                if callback then
                    callback(processData(data))
                    callback = nil
                end
            end, forbidUserCacheData)
        end
        getGPS(true)
        if ModuleCache.GameManager.platformIsIphone then  --因为iOS判断是否开启GPS开关是要在回调中判断，而实时获取GPS信息是一件很耗时的事情
            self:subscibe_time_event_on(0.1, function(t)
                if callback then
                    getGPS(false)
                end
            end)
        end
    end
end

function TableManager:connect_login_server(onConnectedCallback, onLoginAccCallback, onCreateRoomCallback, onEnterRoomCallback, onErrorCallback, hideCircle)
    local curRuningTableModule = self:try_get_cur_runing_table_module()
    if curRuningTableModule then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
            "您正在房间中，是否返回当前房间?", function()
                self:try_back_to_runing_table()
            end, function()

            end, true, "确定", "取消")
        return 
    end
    
    ModuleCache.ModuleManager.show_public_module("netprompt", hideCircle)
    self.connecting = true
    self.onConnectLoginServerCallback = onConnectedCallback
    self.onLoginAccCallback = onLoginAccCallback
    self.onCreateRoomFromLoginServerCallback = onCreateRoomCallback
    self.onEnterRoomFromLoginServerCallback = onEnterRoomCallback
    self.onConnectLoginServerErrorCallback = onErrorCallback
    local loginClient = NetClientManager.init_client("login", 1)
    self.modelData.loginClient = loginClient
    local accountID = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
    local password = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_PASSWORD, "0")
    local curServerHostIp = ModuleCache.GameManager.netAdress.curServerHostIp
    local url = ""
    if AppData.is_universal_game() then
        --print("===gold server host====",ModuleCache.GameManager.netAdress.curGoldServerHostIp)
        curServerHostIp = ModuleCache.GameManager.netAdress.curGoldServerHostIp
    end
    if accountID ~= "0" and password ~= "0" and password ~= "" then
        url = curServerHostIp .. "login?type=token"
    else
        url = curServerHostIp .. "login"
    end
    print("connect_login_server url...", url)
    loginClient:connect(url)
    loginClient:subscibe_connect_event(function(state)
        self.connecting = false
        if "Closed" == state then
            self.loginClientConnected = false
            if self.checkLoginTimeId then
                CSmartTimer:Kill(self.checkLoginTimeId)
                self.checkLoginTimeId = nil
            end
        elseif "Connected" == state then
            self.loginClientConnected = true
            self.reconnectLoginServerTimes = 0
            if (self.onConnectLoginServerCallback) then
                self:onConnectLoginServerCallback()
            end
            self.checkLoginTimeId = CSmartTimer:Subscribe(9, false, 0):OnComplete(function(t)
                --self:disconnect_login_server()
                print("diconnect login server")
                ModuleCache.ModuleManager.hide_public_module("netprompt")
                self.modelData.loginClient:close()
            end).id
        else
            self.loginClientConnected = false
            ModuleCache.GameManager.get_and_set_net_adress()
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end
    end)
end

function TableManager:connect_game_server(host, port, onConnectCallback, hideCircle)
    ModuleCache.ModuleManager.show_public_module("netprompt", hideCircle)
    self.connectCallback = onConnectCallback
    self.lastLoginToken = nil
    local client = NetClientManager.init_client("gameServer", 2)
    self.modelData.gameClient = client
    local accountID = self.modelData.roleData.userID
    if not accountID then
        accountID = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
    end
    if self.curTableData.WebSocketSport and self.curTableData.WebSocketSport ~= 0 then
        --用于连测试服
        client:connect(self.curTableData.ServerHost .. ":" .. self.curTableData.WebSocketSport)
    else
        client:connect(ModuleCache.GameManager.netAdress.curServerHostIp .. "game?token=" .. accountID)
    end

    client:subscibe_connect_event(function(state)
        if "Closed" == state then
            --主动关闭，不会触发断线重连
            self.clientConnected = false
        elseif "Connected" == state then
            self.netErrNum = 0
            self.reconnectGameServerTimes = 0
            self.clientConnected = true
            if self.connectCallback then
                self.connectCallback()
            end
        elseif "Disconnected" == state then
            self.clientConnected = false
            self:on_game_server_connect_error()
        elseif "ConnectTimeOut" == state then
            self.clientConnected = false
            self:on_game_server_connect_error()
        else
            self.clientConnected = false
            self:on_game_server_connect_error()
        end
    end);
end

function TableManager:gameclient_is_connected()
    if self.modelData.gameClient and self.modelData.gameClient.clientConnected then
        return true
    end
    return false
end

function TableManager:on_game_server_connect_error()
    -- 同一个账号是否在多地登录
    ModuleCache.GameManager.get_and_set_net_adress()
    if (self.reconnectGameServerTimes >= max_reconnect_game_server_times) then
        ModuleCache.GameManager.logout();
    else
        self:_reconnect_game_server()
    end
end

function TableManager:heartbeat_timeout_reconnect_game_server()
    -- 主动断线会触发Error
    self.modelData.gameClient:disconnect()
end

function TableManager:heartbeat_timeout_reconnect_login_server()
    -- 主动断线会触发Error
    self.modelData.loginClient:disconnect()
end

-- 离开房间
function TableManager:exit_room(tip)
    self:disconnect_login_server()
    self:disconnect_game_server()
    ModuleCache.net.NetClientManager.disconnect_all_client()
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
        ModuleCache.ModuleManager.destroy_package(v.package_name)
    end
    ModuleCache.ModuleManager.destroy_public_package()
    --ModuleCache.ModuleManager.destroy_module("majiang", "table")
    ModuleCache.ModuleManager.show_module("public", "hall")
    if (tip) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(tip)
    end
end

function TableManager:check_in_room(errorReconnect)
    if errorReconnect then
        self._check_in_room_connect_time = self._check_in_room_connect_time or 0
    else
        self._check_in_room_connect_time = 0
    end

    local accountID = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
    accountID = tonumber(accountID)
    local password = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_PASSWORD, "0")
    if accountID ~= 0 and password ~= "0" and password ~= "" then
        TableManager:connect_login_server(function()
            TableManager:request_login_login_server(accountID, password)
        end,
        --登录成功回调
                function(data)
                    self._check_in_room_connect_time = 0
                    if data.UserID ~= "0" then
                        if (data.RoomID and data.RoomID ~= 0) then
                            TableManager:request_join_room_login_server({ roomId = data.RoomID })
                            if data.LoginEnv == "match" then
                                self.modelData.tableCommonData.tableType = 2
                            elseif data.LoginEnv == "new_gold" then
                                self.modelData.tableCommonData.tableType = 1
                                local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                                self.modelData.tableCommonData.goldFildId = jsonTable.GoldID
                            else
                                self.modelData.tableCommonData.tableType = 0
                            end
                        elseif (data.LoginEnv == 'match') then
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            if TableManager.checkLoginTimeId then
                                CSmartTimer:Kill(TableManager.checkLoginTimeId)
                                TableManager.checkLoginTimeId = nil
                            end
                            TableManager:request_matching_enter(jsonTable.MatchID, jsonTable.StageID)
                        elseif (data.LoginEnv == 'new_gold') then
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            if TableManager.checkLoginTimeId then
                                CSmartTimer:Kill(TableManager.checkLoginTimeId)
                                TableManager.checkLoginTimeId = nil
                            end
                            TableManager:request_goldmatching_enter(jsonTable.GoldID, accountID)
                        else
                            TableManager:disconnect_login_server()
                        end
                    else
                        -- 密码错误
                        TableManager:disconnect_login_server()
                        ModuleCache.GameManager.logout()
                    end
                end, nil, nil, function()
                    self._check_in_room_connect_time = self._check_in_room_connect_time + 1
                    if self._check_in_room_connect_time > 3 then
                        ModuleCache.GameManager.logout()
                    else
                        TableManager:check_in_room(true)
                    end
                end, true)
    end

end

-- 如果出了总结算界面那么就不返回桌面
function TableManager:disconnect_all_client_no_exit_room()
    self:disconnect_login_server()
    self:disconnect_game_server(true)
    ModuleCache.net.NetClientManager.disconnect_all_client()
    ModuleCache.ModuleManager.hide_public_module("netprompt")
end


-- 此接口不能用于处理牌局中的断线重连，只适用于连接错误时的重试，不能外部调用
function TableManager:_reconnect_game_server()
    print("reconnect_game_server")
    self.reconnectGameServerTimes = self.reconnectGameServerTimes + 1
    self:connect_game_server(self.curTableData.ServerHost, self.curTableData.ServerPort, function()
        self:henanmj_request_login_game_server(self.curTableData)
    end)
end

function TableManager:showNetErrDialog(callback)
    if (callback) then
        if (not self.netErrNum) then
            self.netErrNum = 1
        end
        self.netErrNum = self.netErrNum + 1
        if (self.netErrNum >= 4) then
            self.netErrNum = 0
            self.onConnectLoginServerErrorCallback = nil
            ModuleCache.GameManager.logout();
        else
            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("当前网络环境异常，请检查网络后重试", callback)
        end
    else
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("当前网络环境异常，请检查网络后重试", nil)
    end
end

function TableManager:request_login_login_server(userId, password, extendData, hideCircle)
    ModuleCache.ModuleManager.show_public_module("netprompt", hideCircle)

    local msgId, request = self.netMsgApi:create_request_data(Net_Hall_Login)
    request.UserID = userId or 0
    request.Password = password or ""
    if extendData and extendData.weiXinCode then
        request.WeiXinCode = extendData.weiXinCode
    else
        request.WeiXinCode = ""
    end

    --if (request.UserID == 0 or request.Password == "") and request.WeiXinCode == "" then
    --    ModuleCache.GameManager.logout(true)
    --    ModuleCache.Log.report_exception("登录参数错误", ModuleCache.Log.print_debug(tostring(request.UserID), 5))
    --    return
    --end

    request.Platform = ModuleCache.GameManager.customPlatformName
    request.ProtoVersion = 1
    request.ClientVersion = ModuleCache.GameManager.appVersion

    local requestExData = {}
    requestExData.deviceId = ModuleCache.SDKInterface().get_idfa()

    if AppData.is_universal_game() then
        request.AppName = ModuleCache.AppData.Const_Universal_App_Name
    else
        if ModuleCache.AppData.Is_Independent_App then
            request.AppName = ModuleCache.AppData.Const_App_Name
            requestExData = requestExData or {}
            requestExData.AppName = ModuleCache.AppData.get_app_name()
        else
            request.AppName = ModuleCache.AppData.get_app_name()
        end
    end


    if extendData and extendData.mobile and extendData.verifyCode then
        requestExData = requestExData or {}
        requestExData.mobile = extendData.mobile
        requestExData.verifyCode = extendData.verifyCode
        self._loginWithPhone = true;
    else
        self._loginWithPhone = false;
    end


    if ModuleCache.GameManager.channel ~= "Official" then
        requestExData = requestExData or {}
        requestExData.channelId = ModuleCache.AppData.channelData[ModuleCache.GameManager.channel]
        if extendData and extendData.weiXinCode then  -- 因为好彩渠道的微信登录的AppName必须传渠道号
            request.AppName = ModuleCache.GameManager.channel
            --透传给中继服
            requestExData.AppName = ModuleCache.AppData.get_app_name()
        end
    end

    if requestExData then
        request.ExJsonStr = ModuleCache.Json.encode(requestExData)
    end
    request.EnterGraySrv = ModuleCache.GameManager.openGameServerGradationTest

    Model.send_msg(self, msgId, request, "login")
end


-- playRule为玩法规则
function TableManager:request_join_room_login_server(data, hideCircle)
    local msgId, request = self.netMsgApi:create_request_data("Msg_EnterRoom")
    ModuleCache.ModuleManager.show_public_module("netprompt", hideCircle)
    if data.roomId then
        request.RoomID = data.roomId
        -- 防止服务器返回0的情况  客户端缓村该变量
        self._joinRoomID = data.roomId
    else
        self._joinRoomID = nil
    end

    if data.boxId then
        request.BoxID = data.boxId
        self._joinRoomBoxID = data.boxId
    else
        self._joinRoomBoxID = nil
    end

    if data.EnterNewRoom then
        request.EnterNewRoom = data.EnterNewRoom
        self._enterNewRoom = data.EnterNewRoom
    else
        self._enterNewRoom = nil
    end

    if (data.gameName) then
        if AppData.is_universal_app_game(data.gameName) then
            request.GameName = ModuleCache.AppData.to_universal_app_game_name(data.gameName)
        else
            request.GameName = data.gameName
        end
        self._joinRoomGameName = request.GameName
    else
        self._joinRoomGameName = nil
    end

    if data.playRule and data.playRule.callFromErrorCode then
        self.callFromErrorCode = true
    else
        self.callFromErrorCode = false
    end

    if data.playRule and data.playRule.ShiShiYuYin then
        if not ModuleCache.SDKInterface().is_have_record_permission() then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("进入房间失败，请检查是否开启麦克风权限")
            return
        end
    end

    if not ModuleCache.GameManager.iosAppStoreIsCheck and data.playRule and (data.playRule.NeedOpenGPS or data.playRule.CheckIPAddress) then
        self:get_client_ip_and_gps(data.playRule, nil, function(exJsonStr)
            request.ExJsonStr = exJsonStr
            self:ExJsonStrInit(request)
            Model.send_msg(self, msgId, request, "login")
        end)
    else
        self:ExJsonStrInit(request)
        Model.send_msg(self, msgId, request, "login")
    end
end



-- 给login协议的ExJsonStr 添加额外信息
function TableManager:ExJsonStrInit(request)
    if request.ExJsonStr == "" or request.ExJsonStr == nil then
        request.ExJsonStr = "{}"
    end
    local t = ModuleCache.Json.decode(request.ExJsonStr)
    -- 有可能 自己写入的json并不符合格式....
    local z = ModuleCache.PlayerPrefsManager.GetString("ExJsonStr_" .. AppData.Game_Name .. self.modelData.roleData.userID, '{}')
    local b = ModuleCache.Json.decode(z)
    for k, v in pairs(b) do
        t[k] = v
	end
    request.ExJsonStr = ModuleCache.Json.encode(t)
end

function TableManager:initialize(...)
    Model.initialize(self, ...)
    self:refresh_voice_shake()
    self.chatMsgs = {}
    self.reconnectGameServerTimes = 0
    self.reconnectLoginServerTimes = 0
    self.sendMsgNetClientName = "gameServer"
    self.modelData = require("package.public.model.model_data")
    self.heartbeatRequestName = "5"
    self.heartbeatResponseName = "Msg_Ping"

    Model.subscibe_msg_event(self, {    --登录回调
        msgName = Net_Hall_Login,
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            if (retData.ErrorCode and retData.ErrorCode ~= 0) or retData.ErrorInfo == "密码检验失败" or retData.ErrorInfo == "密码校验失败" then
                ModuleCache.ModuleManager.hide_public_module("netprompt")
                if (retData.ErrorCode == -8) then
                    print("登录错误提示：", retData.ErrorCode, retData.ErrorInfo)
                    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(retData.ErrorInfo)
                else
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
                end
                if (not retData.ErrorCode or (retData.ErrorCode and retData.ErrorCode >= -4)) then
                    if ModuleCache.ModuleManager.module_is_active("public", "phonebinding") and self._loginWithPhone then
                    else
                        ModuleCache.GameManager.logout(true)
                    end
                    self:disconnect_login_server()
                end

                ModuleEventBase.dispatch_package_event(self, 'Event_Matching_Exit')
            else
                if retData.Password then
                    AppData.userToken = retData.Password
                end

                self.loginGameName = retData.Game_Name
                if (self.onLoginAccCallback) then
                    self.onLoginAccCallback(retData)
                end
            end
        end
    }, "login")

    Model.subscibe_msg_event(self, {
        msgName = "Msg_CreateRoom",
        callback = function(msgName, msgBuffer)
            -- ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            print_pbc_table(retData, "~~~~~~~~~~~~~~~~~~~Msg_CreateRoom~~~~~~~~~~~")
            self.curTableData = {}
            if retData.ErrorCode ~= 0 then
                ModuleCache.ModuleManager.hide_public_module("netprompt")
                if TableManager:proce_msg_enterroom_errorcode(retData) then
                else
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
                end
            else
                ModuleCache.GameManager.set_used_playMode(ModuleCache.GameManager.curProvince, ModuleCache.GameManager.curGameId)
                local ruleTable = ModuleCache.Json.decode(self.Rule)
                self.curTableData = {
                    Password = retData.Password,
                    RoomID = retData.RoomID,
                    RoomHisID = retData.RoomHisID,
                    UserID = self.modelData.roleData.userID,
                    SeatID = retData.SeatID,
                    AppendData = ModuleCache.GPSManager.gps_info,
                    ProtoVersion = 1,
                    ClientVersion = ModuleCache.UnityEngine.Application.version,
                    ServerHost = retData.ServerHost,
                    ServerPort = retData.ServerPort,
                    WebSocketSport = retData.wsport,
                    modelData = self.modelData,
                    Rule = self.Rule,
                    RuleTable = ruleTable,
                    RoundCount = self.RoundCount,
                    HallID = retData.HallID,
                    BoxID = retData.BoxID,
                    RoomType = retData.RoomType
                }
                self.modelData.tableCommonData.tableType = 0
                self.modelData.tableCommonData.boxID = retData.BoxID


                print_table(ruleTable, "创建房间rule")

                if ruleTable.gameName then
                    ModuleCache.GameManager.change_game_by_gameName(ruleTable.gameName)
                end

                if self.onCreateRoomFromLoginServerCallback then
                    if (retData.RoomID ~= 0) then
                        local roleData = self.modelData.roleData
                        local myRoomSeatInfo = { }
                        myRoomSeatInfo.RoomID = retData.RoomID
                        myRoomSeatInfo.RoomHisID = retData.RoomHisID
                        myRoomSeatInfo.WebSocketSport = retData.wsport
                        myRoomSeatInfo.ServerHost = retData.ServerHost
                        myRoomSeatInfo.ServerPort = retData.ServerPort
                        myRoomSeatInfo.SeatID = retData.SeatID
                        myRoomSeatInfo.UserID = self.modelData.roleData.userID
                        myRoomSeatInfo.Password = retData.Password
                        myRoomSeatInfo.Rule = self.Rule
                        myRoomSeatInfo.RuleTable = ruleTable

                        roleData.myRoomSeatInfo = myRoomSeatInfo
                        roleData.RoomType = retData.RoomType
                        roleData.HallID = retData.HallID
                        roleData.BoxID = retData.BoxID
                    end
                    self:update_package_with_curGameID_gameType(ruleTable.GameType, function()
                        self.onCreateRoomFromLoginServerCallback(retData)
                        self:disconnect_login_server()
                    end)
                else
                    self:update_package_with_curGameID_gameType(ruleTable.GameType, function()
                        self:connect_game_server(self.curTableData.ServerHost, self.curTableData.ServerPort, function()
                            self:henanmj_request_login_game_server(self.curTableData)
                        end)
                    end)
                    self:disconnect_login_server()
                end

            end
        end
    }, "login")

    Model.subscibe_msg_event(self, {
        msgName = "Msg_Login_Server",
        callback = function(msgName, msgBuffer)
            if self.checkLoginGameServerTimeId then
                CSmartTimer:Kill(self.checkLoginGameServerTimeId)
                self.checkLoginGameServerTimeId = nil
            end

            ModuleCache.ModuleManager.hide_public_module("netprompt")
            ModuleCache.ModuleManager.hide_public_module("redpacket")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)

            if retData.Error == 0 then
                if ModuleCache.PlayerPrefsManager.GetString("parlor/list/getParlorDetail?RoomHisID","") ~= ""then
                    if retData.PlayRule and retData.PlayRule ~= "" then
                        local cachStr =ModuleCache.PlayerPrefsManager.GetString("parlor/list/getParlorDetail?RoomHisID","")
                        local cachData = ModuleCache.Json.decode(cachStr)
                        if cachData.RoomHisID == retData.RoomHisID then
                            local playRule = ModuleCache.Json.decode(retData.PlayRule)
                            playRule.allowDissolveRoom= cachData.allowDissolveRoom
                            playRule.allowDissolveRoomTime= cachData.allowDissolveRoomTime
                            playRule.allowInteractiveExpression= cachData.allowInteractiveExpression
                            retData.PlayRule = ModuleCache.Json.encode(playRule)
                        end

                    end
                end

                if self:cur_game_is_shishiyuyin_room() then   --是否开启实时语音
                    ModuleCache.GVoiceManager().joinTeam(self.curTableData.RoomID)
                    local RoomID = self.curTableData.RoomID
                    self:subscibe_time_event_on(3, function(t)
                        if not ModuleCache.ModuleManager.module_is_active("public", "hall") and self.curTableData.RuleTable and self.curTableData.RuleTable.ShiShiYuYin and RoomID == self.curTableData.RoomID then
                            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您已进入实时语音房间，请注意保护隐私")
                        end
                    end)
                end


                ModuleCache.SoundManager.stop_music()
                for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
                    ModuleCache.ModuleManager.destroy_package(v.package_name)
                end
                ModuleCache.ModuleManager.destroy_public_package()

                if retData.RoomHisID  then
                    if retData.RoomHisID > 0 then
                        self.curTableData.RoomHisID = retData.RoomHisID
                    end
                end
                if ModuleCache.AppData.Game_Name == "NTCP" or ModuleCache.AppData.Game_Name == "HMCP" or "RDCP" == ModuleCache.AppData.Game_Name then
                    ModuleCache.ModuleManager.show_module_only("changpai", "table")
                else
                    --- 大冶字牌
                    if self.curTableData and self.curTableData.Rule and string.sub(self.curTableData.Rule, 1, 1) == "{" then
                        self.phzTableData = {}
                        for k, v in pairs(self.curTableData) do
                            self.phzTableData[k .. ""] = v
                        end
                        local package = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
                        if package == "paohuzi" or package == 'huzi' or package == 'huapai' or package == 'huazhipai' then
                            ModuleCache.ModuleManager.destroy_package(package)
                            ModuleCache.ModuleManager.show_module_only(package, "table")
                        else
                            ---麻将每次登陆游戏服，从游戏服登陆消息中拿取rule信息
                            ---本质来说，每次重连服务器都应该拿取到完整的游戏信息，
                            ---因为麻将存在提前开局会对rule进行修改，4人麻将提前开局，那么实际人数必然少于4人，客户端唯一修改这个变量的地方
                            ---仅仅只在Msg_StartNowNTF消息处理里，如果玩家正好在服务器发送这个消息给客户端的过程中断线了，没有收到
                            ---那本地从加入和创建房间中拿取的Rule则并不是正确的Rule
                            ---所以在登陆游戏服务器消息中添加  PlayRule 字段
                            if retData.PlayRule and retData.PlayRule ~= "" then
                                ---怂，还是判断一下防止不必要的数据覆盖
                                self.curTableData.Rule = retData.PlayRule
                            end
                            self:show_majiang_table(self.curTableData.Rule)
                        end
                    else
                        ---注释同上
                        ---怂，还是判断一下防止不必要的数据覆盖
                        if retData.PlayRule and retData.PlayRule ~= "" then
                            self.curTableData.Rule = retData.PlayRule
                        end
                        self:show_majiang_table(self.curTableData.Rule)
                    end
                end
                ModuleCache.GPSManager.begin_location(function(data)
                    if data and type(data) == "table" then
                        data.chatType = 4
                        self:request_chat(data)
                    end
                end)
            else
                --穆大神：连接服务器失败不提示
                if ModuleCache.GameManager.developmentMode then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("连接游戏服错误：" .. (retData.ErrInfo or ""))
                end
                --牌友圈如果长时间未准备，会被踢出。然后断线重连会提示密码不正确.-1为密码错误，-2为房间不存在，-3为不在房间中
                if retData.Error and retData.Error < -1 then
                    self:exit_room()
                else
                    if retData.ErrInfo and retData.ErrInfo == "房间不存在" then
                        self:exit_room()
                        --self:check_in_room()
                    else
                        --self:exit_room()
                        --self:check_in_room()
                        ModuleCache.GameManager.logout()
                    end
                end
            end
        end
    }, "gameServer")

    Model.subscibe_msg_event(self, {
        msgName = "Msg_EnterRoom",
        callback = function(msgName, msgBuffer)
            self:proce_msg_enterRoom(msgName, msgBuffer, self.modelData.hallData.hideCircle)
        end
    }, "login")



    --进入回调
    self:subscibe_msg_event({
        msgName = 'Msg_Matching_Enter',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            if (retData.ErrorCode == 0) then
                if self.checkLoginTimeId then
                    CSmartTimer:Kill(self.checkLoginTimeId)
                    self.checkLoginTimeId = nil
                end
                if (retData.IsStart or retData.CurLoopCnt > 0) then
                    local tips = "upgrade"
                    if self.matchExpand == "wait" then
                        tips = "wait"
                    end
                    ModuleCache.ModuleManager.show_module("public", "tablematch", { matchtype = 2, matchinfo = retData, type = tips })
                else
                    ModuleCache.ModuleManager.show_module("public", "bisai",
                            { id = retData.MatchID, stageId = retData.StageID, isSigned = true })

                end
            else
                self:disconnect_login_server()
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
                ModuleCache.ModuleManager.destroy_all_package()
                ModuleCache.ModuleManager.show_module("public", "hall")
            end
            if self.connectMatchEnterTimeId then
                CSmartTimer:Kill(self.connectMatchEnterTimeId)
            end
        end
    }, "login")

    --self:subscibe_msg_event({
    --    msgName = "Msg_Matching_Exit",
    --    callback = function(msgName,msgBuffer)
    --        ModuleEventBase.dispatch_package_event(self, 'Event_Matching_Exit' )
    --    end
    --},"login")

    --报名回调
    self:subscibe_msg_event({
        msgName = 'Msg_Matching_Exit',
        callback = function(msgName, msgBuffer)
            ModuleEventBase.dispatch_package_event(self, 'Event_Matching_Exit')
        end
    }, "login")

    --报名回调
    self:subscibe_msg_event({
        msgName = 'Msg_Matching_SignUp',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            if (retData.ErrorCode == 0) then
                ModuleEventBase.dispatch_package_event(self, 'Event_Matching_SignUp', { MatchID = retData.MatchID, StageID = retData.StageID })
                if self.checkLoginTimeId then
                    CSmartTimer:Kill(self.checkLoginTimeId)
                    self.checkLoginTimeId = nil
                end
            else
                self:disconnect_login_server()
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
            end
        end
    }, "login")
    --退赛回调
    self:subscibe_msg_event({
        msgName = 'Msg_Matching_Withdraw',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            ModuleEventBase.dispatch_package_event(self, 'Event_Matching_Withdraw',
                    { MatchID = retData.MatchID, StageID = retData.StageID, error = retData.ErrorCode, ErrorInfo = retData.ErrorInfo })

        end
    }, "login")
    --赛况
    self:subscibe_msg_event({
        msgName = 'Msg_Matching_Notify_MatchDynamic',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            ModuleEventBase.dispatch_package_event(self, 'Event_Matching_Notify_MatchDynamic', retData)
        end
    }, "login")
    --匹配成功
    self:subscibe_msg_event({
        msgName = 'Msg_Matching_Notify_RoomInfo',
        callback = function(msgName, msgBuffer)
            print("比赛场进入房间")
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            ModuleEventBase.dispatch_package_event(self, 'Event_Matching_Notify_RoomInfo', retData)

        end
    }, "login")
    --账号被挤
    self:subscibe_msg_event({
        msgName = 'Msg_Extrusion',
        callback = function(msgName, msgBuffer)

            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            print("账号被挤", retData.UserID)
            if retData.UserID == self.modelData.roleData.userID then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您的账号已在其他地方登录")
                ModuleCache.GameManager.logout()
            end
        end
    }, "login")
    --心跳回包
    self:subscibe_msg_event({
        msgName = 'Msg_Ping',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            --print("login ping")
            if (self.lastPingReqeustTime) then
                self.pingDelayTime = UnityEngine.Time.realtimeSinceStartup - self.lastPingReqeustTime
                self.lastPingReqeustTime = nil
                if (self.pingDelayTime == 0) then
                    self.pingDelayTime = 0.06
                end
            end
        end
    }, "login")
    --进入金币场
    self:subscibe_msg_event({
        msgName = 'Msg_GoldMatching_Enter',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            if (retData.ErrorCode == 0) then
                if self.checkLoginTimeId then
                    CSmartTimer:Kill(self.checkLoginTimeId)
                    self.checkLoginTimeId = nil
                end
                if self.goldFinishCallback then
                    self.goldFinishCallback()
                    self.goldFinishCallback = nil
                end
                ModuleCache.ModuleManager.show_module("public", "tablematch", { matchtype = 1, goldid = retData.GoldID })
            else
                self:disconnect_login_server()
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
                ModuleCache.ModuleManager.destroy_all_package()
                ModuleCache.ModuleManager.show_module("public", "hall")
            end
            if self.connectGoldEnterTimeId then
                CSmartTimer:Kill(self.connectGoldEnterTimeId)
            end
        end
    }, "login")
    --退出金币场
    self:subscibe_msg_event({
        msgName = 'Msg_GoldMatching_Quit',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            print("退出金币场成功，", retData.ErrorCode)
            if (retData.ErrorCode == 0) then
                print("发退出金币场消息")
                ModuleEventBase.dispatch_package_event(self, 'Event_GoldMatching_Quit', retData.GoldID)
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
            end

        end
    }, "login")
    --金币场匹配成功
    self:subscibe_msg_event({
        msgName = 'Msg_GoldMatching_Notify_RoomInfo',
        callback = function(msgName, msgBuffer)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            ModuleEventBase.dispatch_package_event(self, 'Event_GoldMatching_Notify_RoomInfo', retData)
        end
    }, "login")
end

function TableManager:proce_msg_enterRoom(msgName, msgBuffer, hideCircle)
    local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
    self.curTableData = {}
    if retData.ErrorCode == 0 then
        self:disconnect_login_server()

        self.modelData.tableCommonData.boxID = retData.BoxID
        local roomRule = ModuleCache.Json.decode(retData.Rule)

        local  cachKey = string.format("parlor/list/getParlorDetail?%s",retData.HallID)
        local text = ModuleCache.PlayerPrefsManager.GetString(cachKey, "")

        if text ~= "" then
            local cachData = ModuleCache.Json.decode(text)

            if(cachData and cachData.success and cachData.data) then
                local museumData = cachData.data
                roomRule.allowDissolveRoom= museumData.allowDissolveRoom
                roomRule.allowDissolveRoomTime= museumData.allowDissolveRoomTime
                roomRule.allowInteractiveExpression= museumData.allowInteractiveExpression

                roomRule.RoomHisID = retData.RoomHisID
                retData.Rule = ModuleCache.Json.encode(roomRule)
                ModuleCache.PlayerPrefsManager.SetString("parlor/list/getParlorDetail?RoomHisID", retData.Rule)
            end
        end


        self.curTableData = {
            Password = retData.Password,
            RoundCount = retData.RoundCount,
            SeatID = retData.SeatID,
            Rule = retData.Rule,
            RuleTable = roomRule,
            ServerHost = retData.ServerHost,
            ServerPort = retData.ServerPort,
            WebSocketSport = retData.wsport,
            RoomID = retData.RoomID,
            RoomHisID = retData.RoomHisID,
            UserID = self.modelData.roleData.userID,
            AppendData = ModuleCache.GPSManager.gps_info,
            ProtoVersion = 1,
            ClientVersion = ModuleCache.UnityEngine.Application.version,
            modelData = self.modelData,
            HallID = retData.HallID,
            BoxID = retData.BoxID,
            RoomType = retData.RoomType,
            MatchID = retData.MatchID,
            GoldFieldID = retData.GoldFieldID,
        }

        if string.sub(retData.Rule, 1, 1) == "{" then
            local isPokerRule, packageConfig = ModuleCache.AppData.isPokerRule(roomRule.gameName)
            if (isPokerRule) then
                local roleData = self.modelData.roleData
                local myRoomSeatInfo = {}
                myRoomSeatInfo.RoomID = retData.RoomID
                myRoomSeatInfo.RoomHisID = retData.RoomHisID
                myRoomSeatInfo.HallID = retData.HallID
                myRoomSeatInfo.BoxID = retData.BoxID
                myRoomSeatInfo.ServerHost = retData.ServerHost
                myRoomSeatInfo.ServerPort = retData.ServerPort
                myRoomSeatInfo.WebSocketSport = retData.wsport
                myRoomSeatInfo.SeatID = retData.SeatID
                myRoomSeatInfo.Password = retData.Password
                myRoomSeatInfo.Rule = retData.Rule
                myRoomSeatInfo.RuleTable = roomRule

                roleData.modelData = self.modelData
                roleData.RoomID = retData.RoomID
                roleData.RoomHisID = retData.RoomHisID
                roleData.HallID = retData.HallID
                roleData.BoxID = retData.BoxID
                roleData.RoomType = retData.RoomType
                roleData.MatchID = retData.MatchID

                roleData.myRoomSeatInfo = myRoomSeatInfo

                self._lostJoinRommSelectProvinceNameAppName = nil
                ModuleCache.GameManager.change_game_by_gameName(myRoomSeatInfo.RuleTable.gameName)

                ModuleCache.PackageManager.update_package_version(packageConfig.package_name, function()
                    TableManagerPoker.reconnectGameServerTimes = 0
                    TableManagerPoker:connect_game_server(function()
                        TableManagerPoker:request_login_game_server(self.modelData.roleData.userID, self.modelData.roleData.myRoomSeatInfo.Password)
                    end,
                    --登录回调
                            function(data)
                                if TableManager:proce_msg_enterroom_errorcode(data) then
                                elseif (not data.err_no or data.err_no == "0") then
                                    local nohidemodule = ""
                                    if self.modelData.tableCommonData.tableType == 1 or self.modelData.tableCommonData.tableType == 2 then
                                        nohidemodule = "tablematch"
                                    end
                                    for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
                                        ModuleCache.ModuleManager.destroy_package(v.package_name)
                                    end
                                    ModuleCache.ModuleManager.destroy_package("public", nohidemodule)
                                    ModuleCache.GameManager.set_used_playMode(ModuleCache.GameManager.curProvince, ModuleCache.GameManager.curGameId)
                                    if (packageConfig.package_name == 'runfast' or packageConfig.package_name == 'quickrun' ) then
                                        self.RunfastRuleJsonString = myRoomSeatInfo.Rule
                                    end

                                    ModuleCache.SoundManager.stop_music()
                                    if (self.modelData.roleData.myRoomSeatInfo.RuleTable.name and self.modelData.roleData.myRoomSeatInfo.RuleTable.name == "ZhaJinNiu") then
                                        ModuleCache.ModuleManager.show_module("cowboy", "table_zhajinniu")
                                    else
                                        if packageConfig.package_name == "biji" and self.modelData.roleData.myRoomSeatInfo.RuleTable.gameType == 2 then
                                            ModuleCache.ModuleManager.show_module(packageConfig.package_name, "tablebijisix")
                                        else
                                            ModuleCache.ModuleManager.show_module(packageConfig.package_name, packageConfig.table_module_name)
                                        end
                                    end
                                else
                                    TableManagerPoker:disconnect_game_server()
                                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.err_no)
                                    self:removeLastNum()
                                    self.joinRoomView:refreshRoomNumText(self.strRoomNum)
                                end
                            end, hideCircle)
                end)
                return
            end

        end

        ModuleCache.ModuleManager.hide_module("public", "joinroom")

        local ruleTable = ModuleCache.Json.decode(retData.Rule)
        --在独立App老的牌友圈中ruleJson没有gameName
        if not ruleTable.gameName then
            if ruleTable.GameType then
                local gameName = Config.GameTypeToGameName[ruleTable.GameType]
                if gameName then
                    ModuleCache.GameManager.change_game_by_gameName(gameName)
                end
            else
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("检测到您的房间配置有问题，请联系客服")
                ModuleCache.Log.report_exception("检测到房间没有gameName和GameType", tostring(self.modelData.roleData.userID) .. "retData.RoomID")
                return
            end
        else
            ModuleCache.GameManager.change_game_by_gameName(ruleTable.gameName)
        end

        ModuleCache.GameManager.set_used_playMode(ModuleCache.GameManager.curProvince, ModuleCache.GameManager.curGameId)

        self:update_package_with_curGameID_gameType(ruleTable.GameType, function()
            self:connect_game_server(self.curTableData.ServerHost, self.curTableData.ServerPort, function()
                self:henanmj_request_login_game_server(self.curTableData)
            end, hideCircle)
        end)
    else
        -- 如果换桌失败，需要退出重连
        for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
            if (ModuleCache.ModuleManager.module_is_active(v.package_name, v.table_module_name)) then
                ModuleCache.ModuleManager.destroy_package(v.package_name)
                self:exit_room()
                return
            end
        end

        if (ModuleCache.ModuleManager.module_is_active("majiang", "table")
                or ModuleCache.ModuleManager.module_is_active("majiang", "tablenew")
                or ModuleCache.ModuleManager.module_is_active("majiang3d", "table3d")) then
            self:exit_room()
        else
            local PackageModuleEvent = require("core.package_module_event")
            PackageModuleEvent:dispatch_module_event(nil, nil, "Event_Package_EnterRoomFail", retData.ErrorCode)
            --self:dispatch_package_event("Event_Package_EnterRoomFail",retData.ErrorCode)  --跑抛出消息进入房间失败
            if TableManager:proce_msg_enterroom_errorcode(retData) then
                if self._lostJoinRommSelectProvinceNameAppName then
                    ModuleCache.GameManager.change_game_by_gameName(self._lostJoinRommSelectProvinceNameAppName, true)
                end
                self._lostJoinRommSelectProvinceNameAppName = nil
            elseif retData.ErrorCode == -14 then
                --TODO XLQ 大厅输入房号跨省加入房间
                print_table(retData, "大厅输入房号跨省加入房间")
                local rule = ModuleCache.Json.decode(retData.Rule)
                local arr = string.split(rule.GameID or rule.gameId, "_")
                if #arr > 1 then
                    print(arr[1] ~= AppData.App_Name, "#######", arr[1], AppData.App_Name)
                    if arr[1] ~= AppData.App_Name then
                        --TODO XLQ 当前输入的房号不在当前省份时 切换省份
                        self._lostJoinRommSelectProvinceNameAppName = AppData.get_app_and_game_name()
                        --GameManager.change_game_by_gameName(appAndGameName, noRecord)
                        ModuleCache.GameManager.change_game_by_gameName(rule.GameID or rule.gameId, true)
                        --ModuleCache.GameManager.select_province_name_not_record(rule.GameID or rule.gameId)
                    end
                end

                self:join_room({ roomId = retData.RoomID })
                return
            elseif retData.ErrorCode == -46 and not self.callFromErrorCode then
                --服务器返回GPS没有打开,需要避免死循环
                local roomId = self._joinRoomID
                if not roomId and retData.RoomID and retData.RoomID ~= 0 then
                    roomId = retData.RoomID
                end
                local data = {
                    roomId = roomId,
                    boxId = self._joinRoomBoxID,
                    EnterNewRoom = self._enterNewRoom,
                    gameName = self._joinRoomGameName,
                    playRule = { NeedOpenGPS = true, simulateGPS = true, callFromErrorCode = true }
                }
                TableManager:request_join_room_login_server(data)
                return
            elseif retData.ErrorCode == -47 and not self.callFromErrorCode then
                --服务器返回ip没有获取成功,需要避免死循环
                local roomId = self._joinRoomID
                if not roomId and retData.RoomID and retData.RoomID ~= 0 then
                    roomId = retData.RoomID
                end
                local data = {
                    roomId = roomId,
                    boxId = self._joinRoomBoxID,
                    gameName = self._joinRoomGameName,
                    playRule = { CheckIPAddress = true, simulateGPS = true, callFromErrorCode = true }
                }
                TableManager:request_join_room_login_server(data)
                return
            else
                if self._lostJoinRommSelectProvinceNameAppName then
                    ModuleCache.GameManager.change_game_by_gameName(self._lostJoinRommSelectProvinceNameAppName, true)
                end
                self._lostJoinRommSelectProvinceNameAppName = nil
                -- 进入麻将馆时可能会提示用“您已在房间中，请重试”
                self.callFromErrorCode = false
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
                if string.find(retData.ErrorInfo, "已在") then
                    ModuleCache.GameManager.logout()
                end

                if retData.ErrorCode == -2 then
                    if (self.openShake) then
                        ModuleCache.GameSDKInterface:ShakePhone(250)
                    end
                end
            end
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            self:disconnect_login_server()
        end
    end
end

function TableManager:proce_msg_enterroom_errorcode(data)
    if (data.ErrorCode == -8) then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您尚未加入此亲友圈，是否申请加入？"), function()
            if #data.Rule > 0 then
                -- TODO XLQ 判断是否有Rule  不能用 data.Rule ~= nil 判断
                local rule = ModuleCache.Json.decode(data.Rule)

                ModuleCache.ModuleManager.show_module("public", "museumjoin", { parlorNum = data.HallID, gameName = rule.GameID or rule.gameId, BoxID = data.BoxID })
            else
                ModuleCache.ModuleManager.show_module("public", "museumjoin", data.HallID)
            end

        end, nil)
    elseif data.ErrorCode == -34 then
        -- 已在游戏中
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
        if string.find(data.ErrorInfo, "已在") then
            --需要重新登录
            ModuleCache.GameManager.logout()
        end
    elseif data.ErrorCode == -23 then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("体力不足，是否充值？"), function()
            ModuleCache.ModuleManager.show_module("public", "shop", 5)
        end, nil)
    elseif data.ErrorCode == -11 then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您的钻石和体力都不足，是否充值？\n（体力和钻石必须有一种数量足够）"), function()
            ModuleCache.ModuleManager.show_module("public", "shop", { showpage = 2, isUsedDefault = true })
        end, nil)
    elseif (data.ErrorCode == -41) then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel("您的金币不足，是否立即补充金币继续游戏？", function()
            ModuleCache.ModuleManager.show_module("public", "goldadd")
        end, nil, true, "确 认", "取 消")
    elseif (data.ErrorCode == -48) or (data.ErrorCode == -49) then
        --48提示您与其他玩家距离过近
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
    else
        return false
    end
    return true
end

function TableManager:clear_strategy_vals()

end

function TableManager:refresh_voice_shake()
    self.openVoice = (ModuleCache.PlayerPrefsManager.GetInt("openVoice", 1) == 1)
    self.openShake = (ModuleCache.PlayerPrefsManager.GetInt("openShake", 1) == 1)
end

function TableManager:disconnect_game_server(notClearData)
    self:clear_strategy_vals()
    if self.modelData.gameClient then
        self.modelData.gameClient:clear_subscibe_connect_event()
        self.modelData.gameClient:close()
    end
    self.connectCallback = nil
    self.lastLoginToken = nil
    self.clientConnected = false
    --if (not notClearData) then
    --    self.curTableData = {}
    --end
end

function TableManager:disconnect_login_server()
    -- self.modelData.loginClient:clear_subscibe_connect_event()
    self.modelData.loginClient:close()
    self.onCreateRoomFromLoginServerCallback = nil
    self.onEnterRoomFromLoginServerCallback = nil
    self.lastPingReqeustTime = nil
end

function TableManager:play_back_on_id(playBackId)
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
            shortRecordId = playBackId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/getRecordId?",
    }

    ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            local gameName = retData.data.gameId
            ModuleCache.GameManager.change_game_by_gameName(gameName)
            local isPokerGame, packageConfig = ModuleCache.AppData.isPokerGameByGameId(gameName)
            if (isPokerGame) then
                self:play_back_common_poker(retData.data, retData.data.players)
                return
            end
            self:play_back(retData.data, retData.data.players)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("回放码错误！请填写正确的回放码")
        end

    end, function(error)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("回放码错误！请填写正确的回放码")
    end)
end

function TableManager:share_play_back_id(playBackId, roomId , gameName)
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
            recordId = playBackId,
            roomId = roomId,
            gameName = gameName,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/getShortRecordId?",
    }
    ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            --OK
            ModuleCache.ShareManager().share_play_back(self.modelData.roleData.userID, retData.data.shortRecordId,gameName)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("分享回放码错误")
        end
    end, function(error)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("分享回放码错误")
    end)
end

function TableManager:play_back(data, players,hidePublicPack,playBackInitData,onEnterTable,onEnterTableComplate)
    if self:try_get_cur_runing_table_module() then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("正在房间中无法播放回放")
        return
    end
    hidePublicPack = hidePublicPack or false
    self:get_play_back_info(data, function(gamestates, data)
        self.modelData.tableCommonData.tableType = 0
        local index = 1
        for i = 1, #players do
            local userId = players[i].userId
            if (userId .. "" == self.modelData.roleData.userID) then
                index = i
            end
        end
        self.curTableData = {
            isPlayBack = true,
            SeatID = index - 1,
            videoData = data,
            modelData = self.modelData,
            gamestates = gamestates,
            players = players
        }
        local strurl
        if data.gamerule then
            local jsonTable = ModuleCache.Json.decode(data.gamerule)
            self.curTableData.RuleTable = jsonTable
            strurl = jsonTable.gameName or Config.GameTypeToGameName[jsonTable.GameType]
            if not strurl then
                strurl = ModuleCache.AppData.Game_Name
            else
                self.curTableData.gameName = strurl
                local tmp
                tmp,strurl = ModuleCache.GameUtil.appGameNameToAppNameAndGameName(strurl)
            end
        end

        local len = string.len(strurl)
		if string.sub(strurl, len - 1, len) == 'ZP' then
			TableManager.phzTableData = {
                isPlayBack = true,
                SeatID = index - 1,
                RoomID = data.roomid,
                RoundCount = data.roundcount,
                videoData = data,
                modelData = self.modelData,
                gamestates = gamestates,
                players = players,
                Rule = data.gamerule,
            }

			for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
				if v.package_name ~= "public" then
					ModuleCache.ModuleManager.destroy_package(v.package_name)
				end
			end
			if hidePublicPack then
				ModuleCache.ModuleManager.hide_package("public")
			else
				ModuleCache.ModuleManager.destroy_package("public")
			end
            
			ModuleCache.ModuleManager.show_module_only("huzi", "table")
			ModuleCache.ModuleManager.show_module("huzi", "playback", playBackInitData)
            
        elseif string.sub(strurl, len - 1, len) == 'CP' then
            local excute = function()
                for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
                    ModuleCache.ModuleManager.destroy_package(v.package_name)
                end
                ModuleCache.ModuleManager.destroy_package("public")
                ModuleCache.ModuleManager.show_module_only("changpai", "table")
                ModuleCache.ModuleManager.show_module("changpai", "playback")
            end
			excute()
        elseif string.sub(strurl, len - 1, len) == 'HP' then
            self.curTableData.isPlayBack = true
            self.curTableData.SeatID = index - 1
            self.curTableData.RoomID = data.roomid
            self.curTableData.RoundCount = data.roundcount
            self.curTableData.videoData = data
            self.curTableData.modelData = self.modelData
            self.curTableData.gamestates = gamestates
            self.curTableData.players = players
            self.curTableData.Rule = data.gamerule
			for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
				if v.package_name ~= "public" then
					ModuleCache.ModuleManager.destroy_package(v.package_name)
				end
			end
			if hidePublicPack then
				ModuleCache.ModuleManager.hide_package("public")
			else
				ModuleCache.ModuleManager.destroy_package("public")
			end

			ModuleCache.ModuleManager.show_module_only("huazhipai", "table")
			ModuleCache.ModuleManager.show_module("huazhipai", "playback")
        else
            local excute = function()
                if not hidePublicPack then
                    for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
                        ModuleCache.ModuleManager.destroy_package(v.package_name)
                    end
                    ModuleCache.ModuleManager.destroy_package("public")
                else
                    for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
                        ModuleCache.ModuleManager.hide_package(v.package_name)
                    end
                    ModuleCache.ModuleManager.hide_package("public")
                end
                if onEnterTable then
                    onEnterTable()
                end
                self:show_majiang_table(data.gamerule)
                ModuleCache.ModuleManager.show_module("majiang", "playback",playBackInitData)
                if onEnterTableComplate then
                    onEnterTableComplate()
                end
            end
            local ruleTable = ModuleCache.Json.decode(data.gamerule)
            self:update_package_with_curGameID_gameType(ruleTable.GameType, function()
                excute()
            end)
        end
    end)
end

function TableManager:show_majiang_table(rule)
    local ruleTable = ModuleCache.Json.decode(rule)
    local Is3D = self:get_cur_majiang_game_open_3d_state()
    local def3dOr2d = self:get_cur_majiang_game_2dor3d_def()
    if (Is3D) then
        local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d", ruleTable.GameType)
        local curSetIs3D = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey, def3dOr2d)
        if (Is3D == 1 and curSetIs3D == 1) then
            ModuleCache.ModuleManager.show_module_only("majiang3d", "table3d")
        else
            ModuleCache.ModuleManager.show_module_only("majiang", "tablenew")
        end
    else
        ModuleCache.ModuleManager.show_module_only("majiang", "table")
    end
end

---获取当前麻将游戏的2D，3D模式设置的默认值
function TableManager:get_cur_majiang_game_2dor3d_def()
    local mj3dConfigData = Config.get_mj3dSetting(AppData.get_app_and_game_name())
    local def3dOr2d = not self:cur_game_is_gold_room_type() and mj3dConfigData.def3dOr2d or mj3dConfigData.goldRoomdef3dOr2d
    return def3dOr2d
end
---获取当前麻将游戏是否开放3D模式
function TableManager:get_cur_majiang_game_open_3d_state()
    local mj3dConfigData = Config.get_mj3dSetting(AppData.get_app_and_game_name())
    return mj3dConfigData.Is3D
end

function TableManager:get_play_back_info(data, callback)
    ModuleCache.ModuleManager.show_public_module("netprompt")
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
            recordId = data.recordId,
            -- 需要使用传进来的gameId
            gameName = data.gameId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/playback?",
    }
	self.record_game_id = data.gameId
    ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        if (string.find(www.text, "ret") ~= nil and string.find(www.text, "{") ~= nil) then
            local retData = ModuleCache.Json.decode(www.text)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            return
        end

        local buffer = Buffer.Create(0)  --会在C#层自动回收
        local videoData = buffer:GetPlayBackInfo(www.bytes)
        if not videoData then
            print("回放数据非法")
            return
		end
		
		local gameName = ModuleCache.PlayModeUtil.get_createname_by_gamename(self.record_game_id)
		local len = string.len(self.record_game_id)
		local strLast = string.sub(self.record_game_id, len - 1, len)
		if gameName and strLast == "ZP" or strLast == "HP" then	--花牌和字牌依赖AppGame.Game_Name 这里更改AppGame.Game_Name 退出时改回来
			self.last_game_id = AppData.get_app_and_game_name()		--缓存上次的GameID 字牌和花牌回放退出再切回
			ModuleCache.GameManager.change_game_by_gameName(gameName)
		end

        local videoTable = nil
        if videoData.rule then
            videoTable = {}
            videoTable.gamerule = videoData.rule
        else
            videoTable = self:unpack_msg_new("Msg_VideoCode", videoData.headData)
		end
        
        local gamestates = {}
        for i = 1, videoData.frames.Count do
            local retData, error = self:unpack_msg_new("Msg_Table_GameStateNTF", videoData.frames[i - 1].buffer)
            table.insert(gamestates, retData)
        end

        callback(gamestates, videoTable)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end, function(error)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end)
end

function TableManager:play_back_runfast(data, players, _roomInfo, needDestroyPackage, onFinish)
    needDestroyPackage = false
    local playBackInitData = data.playBackInitData
    self:get_play_back_info_runfast(data, function(gamestates, videoTable)
        local index = 1
        for i = 1, #players do
            local userId = players[i].userId
            if (tostring(userId) == self.modelData.roleData.userID) then
                index = i
            end
        end

		local daliTag = false
        for k, v in pairs(videoTable) do
            if string.find(k .. "", "_RUNFAST_RUNFAST") ~= nil then
                videoTable.RUNFAST = v
                break
			end
			
			if string.find(k .. "", "_RUNFASTDL_RUNFASTDL") ~= nil then
				videoTable.RUNFAST = v
				daliTag = true
                break
            end
        end

        if (_roomInfo == nil) then
            local locDataTable = videoTable.RUNFAST
            _roomInfo = {
                roomNum = locDataTable.room_id,
                curRoundNum = locDataTable.round_count,
                totalRoundCount = locDataTable.room_conf.roundCount,
                creatorId = locDataTable.owner_id,
                playRule = ModuleCache.Json.encode(locDataTable.room_conf)
            }
        end

        self.curTableData_PB = {
            isPlayBack = true,
            roomInfo = _roomInfo,
            SeatID = index - 1,
            videoData = videoTable,
            modelData = self.modelData,
            gamestates = gamestates,
            players = players,
            playBackInitData = playBackInitData,
        }

        self.modelData.curTablePlayerId = players[1].userId
        self.RunfastRuleJsonString = _roomInfo.playRule
        if (videoTable.success == false) then
            print("=====服务器说:" .. videoTable.errMsg)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(videoTable.errMsg)
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            self.curTableData_PB = nil
            return
        end

        if(needDestroyPackage)then
            for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
                ModuleCache.ModuleManager.destroy_package(v.package_name)
            end
            ModuleCache.ModuleManager.destroy_package("public")
        end
        if(onFinish)then
            onFinish()
		end
		if daliTag then
			ModuleCache.ModuleManager.show_module(ModuleCache.AppData.BranchQuickRunName, "tablerunfast", true)
		else
			ModuleCache.ModuleManager.show_module(ModuleCache.AppData.BranchRunfastName, "tablerunfast", true)
		end
        
    end)
end

function TableManager:play_back_common_poker(data, players, onFinish)
    local gameName = data.gameId
    local playBackInitData = data.playBackInitData
    local isPokerGame, packageConfig = ModuleCache.AppData.isPokerGameByGameId(gameName)
    ModuleCache.PackageManager.update_package_version(packageConfig.package_name, function()
        if (packageConfig.package_name == 'runfast' or packageConfig.package_name == 'quickrun' ) then
            self:play_back_runfast(data, data.players, nil, true, onFinish)
            return
        end
        self:get_videoData(data, function(data)
            if (data.ret and data.ret ~= 0) then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.errMsg)
                return
            end
            if(onFinish)then
                onFinish()
            end
            local moduleName = "table_video_player"
            local moduleNameVideo = 'table_video'
            if (packageConfig.package_name == 'guandan') then
                moduleNameVideo = 'guandan_' .. moduleNameVideo
            end
            data.gameId = gameName
            local intentData = {
                packageName = packageConfig.package_name,
                moduleName = moduleNameVideo,
                needDestroyPackage = false,
                videoData = data,
                playBackInitData = playBackInitData,
            }
            ModuleCache.ModuleManager.show_module('public', moduleName, intentData)
        end)
    end)
end

function TableManager:get_videoData(data, callback)
    local requestData = {
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            recordId = data.recordId,
            gameName = data.gameId,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/playback?",
    }
    ModuleCache.GameUtil.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if (callback) then
            callback(retData)
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

function TableManager:get_play_back_info_runfast(data, callback)
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
            recordId = data.recordId,
            gameName = data.gameId,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/playback?",
    }

    ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        --  {"errMsg":"未知的回放记录","ret":-1,"success":false}
        if www.bytes and www.bytes.Length > 0 and www.bytes[0] == 123 then
            local retDataTable = ModuleCache.Json.decode(www.text)
            if (www.text ~= nil and www.text ~= nil and retDataTable ~= nil) then
                if (retDataTable.ret and retDataTable.ret ~= 0) then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retDataTable.errMsg)
                    return
                end
                callback(nil, retDataTable)
            end
        end
    end, function(error)
        print("==error.error=" .. error.error)
    end)
end

function TableManager:unpack_msg_new(msgName, dataBuffer)
    local strurl = ModuleCache.AppData.Game_Name
    local len = string.len(strurl)
    if string.sub(strurl, len - 1, len) == 'ZP' then
        local api = require("package.huzi.model.net.net_msg_data_map")
        local ret = api:create_ret_data(msgName)
        ret:ParseFromString(dataBuffer)
        return ret
    end

    if string.sub(strurl, len - 1, len) == 'HP' then
        local api = require("package.huazhipai.model.net.net_msg_data_map")
        local ret = api:create_ret_data(msgName)
        ret:ParseFromString(dataBuffer)
        return ret
    end

    -- 南通长牌
    if string.sub(strurl, len - 1, len) == 'CP' then
        local api = require("package.changpai.model.net.net_msg_data_map")
        local ret = api:create_ret_data(msgName)
        ret:ParseFromString(dataBuffer)
        return ret
    end

    -- 麻将的
    local api = require("package.majiang.model.net.net_msg_data_map")
    local ret = api:create_ret_data(msgName)
    ret:ParseFromString(dataBuffer)
    return ret
end

-- 请求加入房间，gameName很有用处，用来进入牌友的
function TableManager:join_room(data, hideCircle)
    self:connect_login_server(function()
        self:request_login_login_server(self.modelData.roleData.userID, self.modelData.roleData.password, nil, hideCircle)
    end,
    --登录回调
            function(retData)
                if (not retData.ErrorCode or retData.ErrorCode == 0) then
                    if retData.RoomID ~= 0 then
                        data.roomId = retData.RoomID
                    end
                    self:request_join_room_login_server({ roomId = data.roomId, boxId = data.boxId, gameName = data.gameName, playRule = data.playRule, EnterNewRoom = data.EnterNewRoom }, hideCircle)
                else
                    self:disconnect_login_server()
                    if retData.ErrorInfo == "密码检验失败" or retData.ErrorInfo == "密码校验失败" then
                        ModuleCache.GameManager.logout()
                    end
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.ErrorInfo)
                end
            end,
            nil, nil, function()
                self:showNetErrDialog(nil)
            end, hideCircle)
end

function TableManager:request_chat(msg)
    local api = require("package.public.model.net.net_msg_data_map_2")
    local msgId, request = api:create_request_data("Msg_Message")
    request.Message = ModuleCache.Json.encode(msg)
    request.AppendData = ModuleCache.GPSManager.gps_info
    Model.send_msg(self, msgId, request, "gameServer", 1)
end

function TableManager:GetRunfastRuleText(RuleJsonString)
    local locResult = ""
    local locJsonString = ""

    if (RuleJsonString ~= nil and RuleJsonString ~= "") then
        locJsonString = RuleJsonString
    elseif (self.RunfastRuleJsonString ~= nil and self.RunfastRuleJsonString ~= "") then
        locJsonString = self.RunfastRuleJsonString
    end

    if (locJsonString ~= nil and locJsonString ~= "") then
        local ruleTable = ModuleCache.Json.decode(locJsonString)
        -- if(ruleTable.game_type == 1) then
        --     locResult = locResult .. "安徽关牌 "
        -- elseif(ruleTable.game_type == 2) then
        --     if(ruleTable.gameName == "DHJSQP_RUNFAST_RUNFAST") then
        --         locResult = locResult .. "江苏关牌 "
        --     else
        --         locResult = locResult .. "经典玩法 "
        --     end
        -- end
        local wanfaName = self:GetCurTip(ruleTable.game_type)
        locResult = locResult .. wanfaName .. " "
        locResult = locResult .. ruleTable.roundCount .. "局 "
        locResult = locResult .. ruleTable.playerCount .. "人 "
        locResult = locResult .. (ruleTable.notify_card_cnt and "显示牌数 " or "不显示牌数 ")
        locResult = locResult .. (ruleTable.allow_pass and "可过牌 " or "有牌必压 ")
        -- if(ruleTable.notify_card_cnt) then
        --     locResult = locResult .. "显示牌数 "
        -- else
        --     locResult = locResult .. "不显示牌数 "
        -- end

        -- if(ruleTable.allow_pass) then
        --     locResult = locResult .. "可过牌 "
        -- else
        --     locResult = locResult .. "有牌必压 "
        -- end

        locResult = locResult .. ruleTable.init_card_cnt .. "张牌玩法 "
        --if (ruleTable.game_type == 2) then
        --    locResult = locResult .. ruleTable.rate .. "倍积分 "
        --end

        if (ruleTable.payType == 0) then
            locResult = locResult .. "AA支付"
        elseif (ruleTable.payType == 1) then
            locResult = locResult .. "房主支付"
        elseif (ruleTable.payType == 2) then
            locResult = locResult .. "大赢家支付"
        end
    end

    print("===locResult", locResult)

    return locResult
end

function TableManager:GetRunfastRuleJsonString()
    local locJsonString = ""
    if (self.RunfastRuleJsonString ~= nil and self.RunfastRuleJsonString ~= "") then
        locJsonString = self.RunfastRuleJsonString
    end
    return locJsonString
end

function TableManager:GetRunfastRuleTable()
    local locJsonString = self:GetRunfastRuleJsonString()
    if (locJsonString ~= "") then
        return ModuleCache.Json.decode(locJsonString)
    end
    return nil
end

function TableManager:GetCurTip(curwanfaType)
    local result = ""

    --检查curwanfaType
    if (curwanfaType == nil) then
        if (self.modelData.roleData.myRoomSeatInfo.Rule) then
            local RuleTable = ModuleCache.Json.decode(self.modelData.roleData.myRoomSeatInfo.Rule)
            curwanfaType = RuleTable.game_type
        else
            print("==self.modelData.roleData.myRoomSeatInfo.Rule == nil")
        end
    end

    --查找数据
    local playMode = ModuleCache.PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
    if(not playMode.tips or not playMode.wanfaType)then
        return result
    end
    local tipArr = string.split(playMode.tips, "|")
    local wanfaTypeArr = string.split(playMode.wanfaType, "|")
    if (#wanfaTypeArr <= 0) then
        print("=====#wanfaTypeArr <= 0")
    else
        for i = 1, #wanfaTypeArr do
            local tempwanfaType = wanfaTypeArr[i]
            if (tempwanfaType == tostring(curwanfaType)) then
                result = tipArr[i]
            end
        end
    end
    return result
end


--心跳包
function TableManager:request_ping()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Ping")
    request.TimeStamp = os.time()
    if (not self.lastPingReqeustTime) then
        self.lastPingReqeustTime = Time.realtimeSinceStartup
    end
    Model.send_msg(self, msgId, request, "login")
end

--进入金币场
function TableManager:request_goldmatching_enter(goldId, userId)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    local msgId, request = self.netMsgApi:create_request_data("Msg_GoldMatching_Enter")
    request.GoldID = goldId
    request.UserID = userId
    Model.send_msg(self, msgId, request, "login")
    ModuleCache.ModuleManager.show_public_module("netprompt")
    self.connectGoldEnterTimeId = CSmartTimer:Subscribe(8, false, 0):OnComplete(function(t)
        ModuleCache.GameManager.logout();
        self:showNetErrDialog(nil)
    end).id
end

--退出金币场
function TableManager:request_goldmathing_quit(goldId, userId)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    local msgId, request = self.netMsgApi:create_request_data("Msg_GoldMatching_Quit")
    request.GoldID = goldId
    request.UserID = userId
    Model.send_msg(self, msgId, request, "login")
end

--判断当前游戏房间是否时金币场
function TableManager:cur_game_is_gold_room_type()
    return (1 == self.modelData.tableCommonData.tableType)
end

--判断当前游戏房间是否为实时语音房间
function TableManager:cur_game_is_shishiyuyin_room()
    if self.curTableData and self.curTableData.RuleTable and self.curTableData.RuleTable.ShiShiYuYin then
        return true
    end
end


--进入比赛场
function TableManager:request_matching_enter(matchId, stageId, userId, expand)
    self.matchExpand = expand
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    local msgId, request = self.netMsgApi:create_request_data("Msg_Matching_Enter")
    request.MatchID = matchId
    request.StageID = stageId
    request.UserID = userId
    Model.send_msg(self, msgId, request, "login")
    self.connectMatchEnterTimeId = CSmartTimer:Subscribe(8, false, 0):OnComplete(function(t)
        ModuleCache.GameManager.logout();
        self:showNetErrDialog(nil)
    end).id
    --ModuleCache.ModuleManager.hide_public_module("netprompt")
end

--退出比赛场
function TableManager:request_matching_exit(matchId, stageId, userId)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    local msgId, request = self.netMsgApi:create_request_data("Msg_Matching_Exit")
    request.MatchID = tonumber(matchId)
    request.StageID = tonumber(stageId)
    request.UserID = tonumber(userId)
    Model.send_msg(self, msgId, request, "login")
    --ModuleCache.ModuleManager.hide_public_module("netprompt")
end


--报名比赛场
function TableManager:request_matching_signup(matchId, stageId, userId)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    local msgId, request = self.netMsgApi:create_request_data("Msg_Matching_SignUp")
    request.MatchID = matchId
    if stageId then
        request.StageID = stageId
    end

    request.UserID = tonumber(userId)
    ModuleCache.ModuleManager.show_public_module("netprompt")
    Model.send_msg(self, msgId, request, "login")
end

--退赛
function TableManager:request_matching_withdraw(matchId, stageId, userId)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    local msgId, request = self.netMsgApi:create_request_data("Msg_Matching_Withdraw")
    request.MatchID = matchId
    request.StageID = stageId
    request.UserID = userId
    ModuleCache.ModuleManager.show_public_module("netprompt")
    Model.send_msg(self, msgId, request, "login")
end

function TableManager:matching_signup(userId, password, matchId)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    userId = tonumber(userId .. '')
    TableManager:connect_login_server(function()
        TableManager:request_login_login_server(userId, password, nil, true)
    end,
    --登录成功回调
            function(data)

                if (not data.ErrorCode or data.ErrorCode == 0) then
                    if (data.RoomID ~= 0) then
                        if data.LoginEnv == "match" then
                            self.modelData.tableCommonData.tableType = 2
                        elseif data.LoginEnv == "new_gold" then
                            self.modelData.tableCommonData.tableType = 1
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            self.modelData.tableCommonData.goldFildId = jsonTable.GoldID
                        else
                            self.modelData.tableCommonData.tableType = 0
                        end
                        self.modelData.hallData.hideCircle = true
                        TableManager:request_join_room_login_server({ roomId = data.RoomID }, true)
                        return
                    end
                    print("开始报名比赛场", matchId)
                    TableManager:request_matching_signup(matchId, nil, userId)
                else
                    TableManager:disconnect_login_server()

                    if data.ErrorInfo == "密码检验失败" or data.ErrorInfo == "密码校验失败" then
                        ModuleCache.GameManager.logout()
                    end
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end,
    --创建成功回调
            nil,
    --加入房间回调
            function(data)
                if data.ErrorCode == 0 then
                    TableManager:disconnect_login_server()
                    self:connect_game_server(nil, nil, true)
                else
                    TableManager:disconnect_login_server()
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end, nil, true)
end

function TableManager:matching_enter(userId, password, matchId, stageId, expand)

    self.matchEnter = true
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    userId = tonumber(userId .. '')
    TableManager:connect_login_server(function()
        TableManager:request_login_login_server(userId, password, nil, true)
    end,
    --登录成功回调
            function(data)

                if (not data.ErrorCode or data.ErrorCode == 0) then
                    if (data.RoomID ~= 0) then
                        if data.LoginEnv == "match" then
                            self.modelData.tableCommonData.tableType = 2
                        elseif data.LoginEnv == "new_gold" then
                            self.modelData.tableCommonData.tableType = 1
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            self.modelData.tableCommonData.goldFildId = jsonTable.GoldID
                        else
                            self.modelData.tableCommonData.tableType = 0
                        end
                        self.modelData.hallData.hideCircle = true
                        TableManager:request_join_room_login_server({ roomId = data.RoomID }, true)
                        return
                    end
                    TableManager:request_matching_enter(matchId, stageId, userId, expand)
                else
                    TableManager:disconnect_login_server()

                    if data.ErrorInfo == "密码检验失败" or data.ErrorInfo == "密码校验失败" then
                        ModuleCache.GameManager.logout()
                    end
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end,
    --创建成功回调
            nil,
    --加入房间回调
            function(data)
                if data.ErrorCode == 0 then
                    TableManager:disconnect_login_server()
                    self:connect_game_server(nil, nil, true)
                else
                    TableManager:disconnect_login_server()
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end, function()
                ModuleCache.GameManager.logout();
                self:showNetErrDialog(nil)
            end, true)
end

function TableManager:start_enter_gold_matching(userId, password, goldId,goldFinishCallback)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    userId = tonumber(userId .. '')
    self.goldFinishCallback = goldFinishCallback
    TableManager:connect_login_server(function()
        TableManager:request_login_login_server(userId, password, nil, true)
    end,
    --登录成功回调
            function(data)

                if (not data.ErrorCode or data.ErrorCode == 0) then
                    if (data.RoomID ~= 0) then
                        if data.LoginEnv == "match" then
                            self.modelData.tableCommonData.tableType = 2
                        elseif data.LoginEnv == "new_gold" then
                            self.modelData.tableCommonData.tableType = 1
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            self.modelData.tableCommonData.goldFildId = jsonTable.GoldID
                        else
                            self.modelData.tableCommonData.tableType = 0
                        end
                        self.modelData.hallData.hideCircle = true
                        TableManager:request_join_room_login_server({ roomId = data.RoomID }, nil, true)
                        return
                    end
                    if (data.LoginEnv == 'new_gold') then
                        local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                        if self.checkLoginTimeId then
                            CSmartTimer:Kill(self.checkLoginTimeId)
                            self.checkLoginTimeId = nil
                        end
                        TableManager:request_goldmatching_enter(jsonTable.GoldID, userId)
                        return
                    else
                        if (goldId) then
                            TableManager:request_goldmatching_enter(goldId, userId)
                            return
                        end
                        print('goldId全为空？？？？？？？？？？？？')
                        ModuleCache.GameManager.logout()

                    end
                else
                    TableManager:disconnect_login_server()

                    if data.ErrorInfo == "密码检验失败" or data.ErrorInfo == "密码校验失败" then
                        ModuleCache.GameManager.logout()
                    end
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end,
    --创建成功回调
            nil,
    --加入房间回调
            function(data)
                if data.ErrorCode == 0 then
                    TableManager:disconnect_login_server()
                    self:connect_game_server(nil, nil, true)
                else
                    TableManager:disconnect_login_server()
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end, function()
                ModuleCache.GameManager.logout();
                self:showNetErrDialog(nil)
            end, true)
end

function TableManager:reconnect_gold_match(userId, password)
    userId = userId or tonumber(self.modelData.roleData.userID .. '')
    userId = tonumber(userId .. '')
    TableManager:connect_login_server(function()
        TableManager:request_login_login_server(userId, password, nil, true)
    end,
    --登录成功回调
            function(data)

                if (not data.ErrorCode or data.ErrorCode == 0) then
                    if (data.RoomID ~= 0) then
                        if data.LoginEnv == "match" then
                            self.modelData.tableCommonData.tableType = 2
                        elseif data.LoginEnv == "new_gold" then
                            self.modelData.tableCommonData.tableType = 1
                            local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                            self.modelData.tableCommonData.goldFildId = jsonTable.GoldID
                        else
                            self.modelData.tableCommonData.tableType = 0
                        end
                        self.modelData.hallData.hideCircle = true
                        TableManager:request_join_room_login_server({ roomId = data.RoomID }, nil, true)
                        return
                    end
                    if (data.LoginEnv == 'new_gold') then
                        local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                        TableManager:request_goldmatching_enter(jsonTable.GoldID, userId)
                        return
                    elseif (data.LoginEnv == 'match') then
                        local jsonTable = ModuleCache.Json.decode(data.LoginArgs)
                        TableManager:request_matching_enter(jsonTable.MatchID, jsonTable.StageID)
                    else
                        ModuleCache.GameManager.logout()
                    end
                else
                    TableManager:disconnect_login_server()

                    if data.ErrorInfo == "密码检验失败" or data.ErrorInfo == "密码校验失败" then
                        ModuleCache.GameManager.logout()
                    end
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end,
    --创建成功回调
            nil,
    --加入房间回调
            function(data)
                if data.ErrorCode == 0 then
                    TableManager:disconnect_login_server()
                    self:connect_game_server(nil, nil, true)
                else
                    TableManager:disconnect_login_server()
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
                end
            end, function()
                ModuleCache.GameManager.logout();
                self:showNetErrDialog(nil)
            end, true)
end

function TableManager:update_package_with_curGameID_gameType(gameType, callback)
    self._lastTableEnterConfig = ModuleCache.PlayModeUtil.config
    local appGameName = self.curTableData.RuleTable.gameName or Config.GameTypeToGameName[self.curTableData.RuleTable.GameType]
    if self.curTableData.RuleTable.GameType then
        self.curTableData.playModelData = ModuleCache.PlayModeUtil.getConfigByAppGameNameAndWanfaType(appGameName, self.curTableData.RuleTable.GameType)
        --self.curTableData.playModelData = ModuleCache.PlayModeUtil.get_playmodel_data(self.curTableData.RuleTable.GameType)
        --print_table(self.curTableData.RuleTable)
        --print_table(self.curTableData.playModelData)
    end

    self.curTableData.gameRuleConfig = ModuleCache.PlayModeUtil.getGameRuleConfig(appGameName)
    self.curTableData.appGameName = appGameName
    self.curTableData.App_Name, self.curTableData.Game_Name = ModuleCache.GameUtil.appGameNameToAppNameAndGameName(appGameName)
    --print_table(self.curTableData)
    ModuleCache.ComponentCache.uiCamera.cullingMask = ModuleCache.ComponentCache.uiCameraCullingMaskValue
    local packageName = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
    packageName = self:process_package_name(packageName, gameType)
    print(packageName)
    ModuleCache.PackageManager.update_package_version(packageName, function()
        callback()
    end)
end

--所有的进入房间都要经过这里
function TableManager:process_package_name(packageName, gameType)
    if packageName == "majiang" then
        local Is3D = self:get_cur_majiang_game_open_3d_state()
        local def3dOr2d = self:get_cur_majiang_game_2dor3d_def()
        local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d", gameType)
        local curSetIs3D = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey, def3dOr2d)
        if Is3D and Is3D == 1 and curSetIs3D == 1 then
            packageName = "majiang3d"
        end
    end
    return packageName
end


---当前游戏状态是否在牌桌中
function TableManager:is_on_the_table()
    return TableManager:gameclient_is_connected()
end
---尝试从大厅返回牌桌
function TableManager:try_back_to_runing_table()
    if not self:is_on_the_table() then
        return
    end
    ModuleCache.ComponentCache.uiCamera.cullingMask = ModuleCache.ComponentCache.uiCameraCullingMaskValue
    if self._lastTableAppGameName then
        ModuleCache.GameManager.change_game_by_gameName(self._lastTableAppGameName)
    end
    local runingTableModule = self:try_get_cur_runing_table_module()
    if runingTableModule then
        --ModuleCache.ModuleManager.hide_package("public", "table_earlystart,tablelocation")
        ModuleCache.ModuleManager.destroy_package("public","",{"table_earlystart","tablelocation"})
        runingTableModule.view:active()
        if self._lastTableViewSortOrder then
            runingTableModule.view.canvas.sortingOrder = self._lastTableViewSortOrder
        end
    end

end
---尝试从房间暂时返回大厅
function TableManager:try_back_to_hall_form_table()
    self._lastTableAppNameData = nil
    if not self:is_on_the_table() then
        return
    end
    local runingTableModule = self:try_get_cur_runing_table_module()
    if not runingTableModule then
        return
    end
    
    ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("返回大厅，您的房间将保留")
    self._lastTableAppGameName = AppData.get_url_game_name()
    self._lastTableViewSortOrder = runingTableModule.view.canvas.sortingOrder
    runingTableModule.view:hide()
    ModuleCache.ModuleManager.show_module("public","hall")
    ModuleCache.ComponentCache.uiCamera.cullingMask = ModuleCache.ComponentCache.uiHallCameraCullingMaskValue
end
---尝试获取当前正在运行的游戏牌桌模块
function TableManager:try_get_cur_runing_table_module()
    if not self:is_on_the_table() then
        return
    end
    local tableModule = nil
    tableModule = ModuleCache.ModuleManager.get_module("majiang3d","table3d")
    if not tableModule then
        tableModule = ModuleCache.ModuleManager.get_module("majiang","tablenew")
    end
    return tableModule
end
---尝试获取当前正在运行的房间数据
function TableManager:try_cur_runing_table_data()
    local curTableModule  = self:try_get_cur_runing_table_module()
    if curTableModule then
        local tableData = self.curTableData
        return tableData    
    end
end

--获取牌局中和玩法相关的playmodelConfig，因为新增了返回大厅需要使用固定的Config
function TableManager:get_table_playmodelconfig()
    if self._lastTableEnterConfig then

    end
end

TableManager:initialize("public")

return TableManager