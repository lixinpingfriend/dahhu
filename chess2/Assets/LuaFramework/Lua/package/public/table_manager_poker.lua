local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local NetMsgHandler = ModuleCache.net.NetMsgHandler
local class = require("lib.middleclass")
local Model = require('core.mvvm.model_base')
local CSmartTimer = ModuleCache.SmartTimer.instance
local PlayerPrefs = UnityEngine.PlayerPrefs

local string = string

--- @class TableManagerPoker : Model
local TableManagerPoker = class('TableManagerPoker', Model)

local Net_Hall_Login = "Msg_Hall_Login"
local Net_Table_Login_Skynet_GameServer = "Msg_Table_Login_Skynet_GameServer"
local PlayerPrefs = UnityEngine.PlayerPrefs

local max_reconnect_game_server_times = 6


function TableManagerPoker:connect_game_server(onConnectCallback, loginCallback)

    self.connectCallback = onConnectCallback;
    self.loginCallback = loginCallback
    self.lastLoginAcc = nil
    self.lastLoginToken = nil
    local client = ModuleCache.net.NetClientManager.init_client("bullfight", 3)
    self.modelData = require("package.public.model.model_data")
    self.modelData.bullfightClient = client
    local accountID = self.modelData.roleData.userID
    if not accountID then
        accountID = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
    end
    local url = ""
    if self.modelData.roleData.myRoomSeatInfo.WebSocketSport and self.modelData.roleData.myRoomSeatInfo.WebSocketSport ~= 0 then
        -- 用于连测试服
        url = self.modelData.roleData.myRoomSeatInfo.ServerHost .. ":" .. self.modelData.roleData.myRoomSeatInfo.WebSocketSport
        --client:connect(self.modelData.roleData.myRoomSeatInfo.ServerHost .. ":" .. self.modelData.roleData.myRoomSeatInfo.WebSocketSport)
    else
        url = ModuleCache.GameManager.netAdress.curServerHostIp .. "game?token=" .. accountID
        -- client:connect("172.16.30.104:3815")--吴渤的本机测试IP
    end
    client:connect(url)
    print("connect_game_server...",url)
    client:subscibe_connect_event( function(state)
        print("网络状态变化 state=" .. state)
        if "Closed" == state then
            -- 主动断线
            -- self:reconnect_game_server();
            self.clientConnected = false
        elseif "Connected" == state then
            self.reconnectGameServerTimes = 0
            self.loginGameScucess = false
            self.clientConnected = true
            if (self.connectCallback) then
                local connectCallback = self.connectCallback
                connectCallback()
            elseif (self.lastLoginAcc) then
                self:request_login_game_server(self.lastLoginAcc, self.lastLoginToken)
            end
        else
            self:on_game_server_connect_error()
        end
    end );
end

function TableManagerPoker:on_game_server_connect_error()
    -- 同一个账号是否在多地登录
    ModuleCache.GameManager.get_and_set_net_adress()
    if (self.reconnectGameServerTimes >= max_reconnect_game_server_times) then
        -- ModuleCache.GameManager.logout();
        self:showNetErrDialog( function()
            if (self.reconnectGameServerTimes >= max_reconnect_game_server_times + 2) then
                self.clientConnected = false
                ModuleCache.GameManager.logout();
                return
            end
            self:reconnect_game_server()
        end )
    else
        self:reconnect_game_server()
    end
end

function TableManagerPoker:heartbeat_timeout_reconnect_game_server()
    -- 主动断线会触发Error
    self.modelData.bullfightClient:disconnect()
end

function TableManagerPoker:registLoginGameCallbacks(onLoginGameCallback)
    self.loginCallback = onLoginGameCallback
end


function TableManagerPoker:reconnect_game_server()
    self.reconnectGameServerTimes = self.reconnectGameServerTimes + 1
    self:connect_game_server(self.connectCallback, self.loginCallback);
end

function TableManagerPoker:showNetErrDialog(callback)
    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("网络连接失败，请检查网络状况并重试", callback)
end



function TableManagerPoker:request_login_game_server(acc, token)
    ModuleCache.GameSDKCallback.instance.mwEnterRoomID = "0"
    --ModuleCache.ModuleManager.show_public_module("netprompt", true)
    self.lastLoginAcc = acc
    self.lastLoginToken = token
    local msgId, request = self.netMsgApi:create_request_data(Net_Table_Login_Skynet_GameServer)
    request.account = acc
    request.token = token
    Model.send_msg(self, msgId, request, "bullfight")


    -- 因为心跳的处理是在登录游戏服成功后，极限情况下会有收不到这个登录包的
    self.checkLoginGameServerTimeId = self:subscibe_time_event_on(10, function(t)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        ModuleCache.GameManager.logout()
    end).id

    --ModuleCache.PreLoadManager.registerFinishPreLoadCallback(function()
    --    self.lastLoginAcc = acc
    --    self.lastLoginToken = token
    --    local msgId, request = self.netMsgApi:create_request_data(Net_Table_Login_Skynet_GameServer)
    --    request.account = acc
    --    request.token = token
    --    Model.send_msg(self, msgId, request, "bullfight")
    --end)
end


function TableManagerPoker:initialize(...)
    Model.initialize(self, ...)
    self.sendMsgNetClientName = "bullfight"
    self.reconnectGameServerTimes = 0
    self.reconnectLoginServerTimes = 0
    self.modelData = require("package.public.model.model_data")

    Model.subscibe_msg_event(self, {
        msgName = Net_Table_Login_Skynet_GameServer,
        callback = function(msgName, msgBuffer)
            self:proce_login_skynet_gameserver(msgName, msgBuffer)
            --ModuleCache.PreLoadManager.registerFinishPreLoadCallback(function()
            --    self:proce_login_skynet_gameserver(msgName, msgBuffer)
            --end)
        end
    } , "bullfight")

end

function TableManagerPoker:proce_login_skynet_gameserver(msgName, msgBuffer)
    if self.checkLoginGameServerTimeId then
        CSmartTimer:Kill(self.checkLoginGameServerTimeId)
        self.checkLoginGameServerTimeId = nil
    end

    if msgBuffer.msgRetCode == 0 then
        local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
        if (not retData.err_no or retData.err_no == "0") then
            if (retData.room_id > 0) then
                -- room_id为负数时代表登录失败，要重新连接
                self.loginGameScucess = true
            else
                if (retData.room_id == -100) then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips('房间已解散')
                end
                ModuleCache.GameManager.logout()
                return
            end
            self.modelData.curTablePlayerId = retData.account
        end
        if (self.loginCallback) then
            local callback = self.loginCallback
            self.loginCallback = nil
            callback(retData)
        else
            for k,v in pairs(AppData.allPackageConfig) do
                ModuleCache.ModuleManager.destroy_package(v.package_name)
            end
            ModuleCache.ModuleManager.destroy_public_package()

            print(self.modelData.roleData.myRoomSeatInfo.RuleTable.gameName)
            local ruleTable = self.modelData.roleData.myRoomSeatInfo.RuleTable
            local isPokerRule, packageConfig = AppData.isPokerRule(ruleTable.gameName)
            if(isPokerRule)then
                if(packageConfig.package_name == 'cowboy')then
                    if (ruleTable.name and ruleTable.name == "ZhaJinNiu") then
                        ModuleCache.ModuleManager.show_module(packageConfig.package_name, 'table_zhajinniu')
                        return
                    end
                end
                if packageConfig.package_name == "biji" and self.modelData.roleData.myRoomSeatInfo.RuleTable.gameType == 2 then
                    ModuleCache.ModuleManager.show_module(packageConfig.package_name, "tablebijisix")
                    return
                end
                ModuleCache.ModuleManager.show_module(packageConfig.package_name, packageConfig.table_module_name)
            end
        end
        ModuleCache.ModuleManager.hide_public_module("netprompt", true)
    end

end



function TableManagerPoker:disconnect_game_server()
    if(self.modelData and self.modelData.bullfightClient) then
        self.modelData.bullfightClient:clear_subscibe_connect_event()
        self.modelData.bullfightClient:disconnect()
    end
    self.clientConnected = false
    self.connectCallback = nil
    self.loginCallback = nil
    self.lastLoginAcc = nil
    self.lastLoginToken = nil
end


-- 获取玩家信息列表
function TableManagerPoker:getPlayerInfoList(seatInfoList)

    local seatInfoListTemp = seatInfoList;
    local onSeatSort = function(playerInfo1, playerInfo2)

        if playerInfo1.localSeatIndex > playerInfo2.localSeatIndex then
            return false;
        elseif playerInfo1.localSeatIndex < playerInfo2.localSeatIndex then
            return true;
        end
    end
    -- 按玩家座位升序排序
    table.sort(seatInfoListTemp, onSeatSort);

    local playerInfoList = { };
    local index = 0;
    for key, seatInfo in ipairs(seatInfoListTemp) do

        if seatInfo.playerInfo then
            index = index + 1;
            playerInfoList[index] = seatInfo.playerInfo;

            -- 过滤玩家名字
            local filterPlayerName = Util.filterPlayerName(seatInfo.playerInfo.playerName, 8);
            playerInfoList[index].playerName = filterPlayerName;
        end
    end

    --    print(22222);
    --    print_table(playerInfoList);
    return playerInfoList;
end

-- 获取玩家信息列表(比鸡专用)
function TableManagerPoker:getPlayerInfoListByBiJi(seatInfoList)

    local seatInfoListTemp = { };
    local index = 0;
    for key, seatInfo in ipairs(seatInfoList) do

        -- 存在座位号
        if seatInfo.localSeatIndex ~= nil then
            index = index + 1;
            seatInfoListTemp[index] = seatInfo;
        end
    end

    local onSeatSort = function(playerInfo1, playerInfo2)

        if playerInfo1.localSeatIndex > playerInfo2.localSeatIndex then
            return false;
        elseif playerInfo1.localSeatIndex < playerInfo2.localSeatIndex then
            return true;
        end
    end
    -- 按玩家座位升序排序
    table.sort(seatInfoListTemp, onSeatSort);

    local playerInfoList = { };
    local index = 0;
    for key, seatInfo in ipairs(seatInfoListTemp) do

        if seatInfo.chatDataSeatHolder.playerInfo then
            index = index + 1;
            playerInfoList[index] = seatInfo.chatDataSeatHolder.playerInfo;

            -- 过滤玩家名字
            local filterPlayerName = Util.filterPlayerName(seatInfo.chatDataSeatHolder.playerInfo.playerName, 8);
            playerInfoList[index].playerName = filterPlayerName;
        end
    end

    --    print_table(playerInfoList);
    return playerInfoList;
end

-- 获取位置信息文本
function TableManagerPoker:get_gps_warn_text(playerInfoList)
    local tipText = "";
    local distanceText = "";
    local tip = "";
    local distance = "";

    if #playerInfoList < 3 then
        return tipText, distanceText;
    end

    -- 从索引2开始,意味着不遍历玩家自己的信息
    for i = 2, #playerInfoList do
        local currentPlayerInfo = playerInfoList[i];

        -- 玩家名字为空,说明是断线重连方式进入,不执行防作弊检测
        if currentPlayerInfo.playerName == nil then
            return tipText, distanceText;
        end

        -- 按顺序遍历当前玩家与其他玩家信息进行比较
        for j = i + 1, #playerInfoList do
            local nextPlayerInfo = playerInfoList[j];

            -- 当前玩家与下一玩家ip地址相同
            if currentPlayerInfo.ip == nextPlayerInfo.ip then
                tip = "<color=#b13a1f>" .. currentPlayerInfo.playerName .. "</color>与<color=#b13a1f>" .. nextPlayerInfo.playerName .. "</color> IP地址相同\n";
                tipText = tipText .. tip;
            end
            -- 计算距离
            distance = self:caculate_distance(currentPlayerInfo, nextPlayerInfo);
            distanceText = distanceText .. distance;
        end

        if currentPlayerInfo.locationData ~= nil then

            local currentPlayerInfoString = string.split(currentPlayerInfo.locationData.gpsInfo, ",");
            local currentPlayerInfoLatitude = tonumber(currentPlayerInfoString[1]);
            local currentPlayerInfoLongitude = tonumber(currentPlayerInfoString[2]);
            local currentPlayerInfoAddress = currentPlayerInfo.locationData.address;
            if currentPlayerInfoLatitude == 0 and currentPlayerInfoLongitude == 0 then

                if currentPlayerInfoAddress == "未开启位置获取功能" then

                    tip = "<color=#b13a1f>" .. currentPlayerInfo.playerName .. "</color>未开启位置信息\n";
                    tipText = tipText .. tip;
                end
            end
        end
    end

    if (tipText == "") then
        tipText = "没有IP地址相同的玩家\n所有玩家已开启位置信息。";
    end
    if (distanceText == "") then
        distanceText = "没有位置距离信息";
    end
    return tipText, distanceText;
end

-- 计算距离
function TableManagerPoker:caculate_distance(playerInfo1, playerInfo2)

    if playerInfo1.locationData == nil or playerInfo2.locationData == nil then
        return "";
    end

    local playerInfoString1 = string.split(playerInfo1.locationData.gpsInfo, ",");
    local playerInfoLatitude1 = tonumber(playerInfoString1[1]);
    local playerInfoLongitude1 = tonumber(playerInfoString1[2]);

    local playerInfoString2 = string.split(playerInfo2.locationData.gpsInfo, ",");
    local playerInfoLatitude2 = tonumber(playerInfoString2[1]);
    local playerInfoLongitude2 = tonumber(playerInfoString2[2]);

    if (playerInfoLatitude1 ~= 0 and playerInfoLatitude2 ~= 0) then
        -- 计算距离
        local distance = TableUtil.caculate_distance(playerInfoLatitude1, playerInfoLongitude1, playerInfoLatitude2, playerInfoLongitude2);

        local distanceShow = math.ceil(distance) .. "米";
        if distance < 50 then
            distanceShow = "小于50米";
        end
        if distance >= 1000 then
            distanceShow = string.format("%.0f", distance / 1000) .. "公里";
        end
        -- print("距离：------- " .. distance)
        local tip = "<color=#b13a1f>" .. playerInfo1.playerName .. "</color>与<color=#b13a1f>" .. playerInfo2.playerName .. "</color>距离为:" .. distanceShow .. "\n";
        return tip;
    end
    return ""
end

-- 是否显示定位图标
function TableManagerPoker:isShowLocation(playerInfoList, buttonLocation)

    local isShowLocationIcon = false;

    if #playerInfoList == 2 then

        isShowLocationIcon = false;
    elseif #playerInfoList >= 3 then
        isShowLocationIcon = true;
    end
    buttonLocation.gameObject:SetActive(isShowLocationIcon);
end

TableManagerPoker:initialize("public")

return TableManagerPoker