
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableLocationModule = class("tableLocationModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local TableUtil = TableUtil

function TableLocationModule:initialize(...)
    self.viewDynamicInit = true
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "tablelocation_view", nil, ...)

    -- 房间id
    self.roomID = 0;
    -- 作弊玩家id列表
    self.cheatPlayerIDList = { };

    self.previousLastTimesPlayerDataValue = "0";
    self.currentLastTimesPlayerDataValue = "0";
end

function TableLocationModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self:get_view().buttonBack.gameObject then
        self.showUI = false;
        ModuleCache.ModuleManager.hide_module("public", "tablelocation");
    end
end

function TableLocationModule:on_show(data)
    if (not self.showUI and self.view) then
        self:get_view():hide();
    end

    self.intentData = data

    --    -- 测试数据
    --    local playerInfoListTemp = { };

    --    for i = 1, 3 do

    --        local playerObject = { };
    --        playerObject.playerName = "玩家" .. i;
    --        playerObject.imgUrl = "http://www.th7.cn/d/file/p/2016/09/12/f7ef1bbfe2db9d1913e8e8c22ffc7619.jpg";
    --        playerObject.isShowDotGPS = true;
    --        playerInfoListTemp[i] = playerObject;
    --    end
    -- local playerLocationList = self:getPlayerLocationList(playerInfoListTemp);
    if ModuleCache.GameManager.developmentMode then
        print_table(data)
    end
    if data.roomID then
        self.roomID = data.roomID;
    end
    if data.buttonLocation then
        data.buttonLocation.gameObject:SetActive(true);
    end

    self.playerLocationList = nil
    local playerInfoCount = 0;
    if data.gameType == "majiang" then
        -- 获取玩家定位信息人数
        playerInfoCount = self:getPlayerInfoCount(data.seatHolderArray);
        -- 打牌阶段
        if data.isPlay then
            -- 玩家人数不等于牌桌人数,过滤掉以下功能
            if playerInfoCount ~= data.tableCount then
                return ;
            end
        end
        if playerInfoCount == 0 then
            return ;
        end
        --print("是否在打牌", isReady, "当前人数", playerInfoCount, "牌桌人数", data.tableCount);
        -- 获取玩家信息列表(麻将专用)
        self.playerLocationList = self:getPlayerInfoListByMJ(data.seatHolderArray, data.tableCount);
        -- local isLastTimesData = self:isLastTimesMJData(data.seatHolderArray);
        --        print("是否为最后一次==", isLastTimesData);
        --        if isLastTimesData == false then
        --            return;
        --        end
    elseif data.gameType == "biji" then

    elseif data.gameType == "paohuzi" or data.gameType == "huzi" or data.gameType == "huazhipai" then
        self.playerLocationList = self:getPlayerLocationList(data.seatHolderArray);

    elseif data.gameType == "runfast" or data.gameType == "doudizhu" or data.gameType == "guandan" then
        -- 获取玩家定位信息人数
        playerInfoCount = self:getPlayerInfoCountByRunfast(data.seatHolderArray);
        --print("当前人数:", playerInfoCount);
        if playerInfoCount == 0 then
            return ;
        end
        -- 获取玩家信息列表(跑得快专用)
        self.playerLocationList = self:getPlayerInfoListByRunfast(data.seatHolderArray, data.tableCount);
    end
    -- 是否直接显示GPS信息
    if data.isShowLocation then
        self.showUI = true
        self:show_view()

        local isNewPlayerCheat = self:isHaveNewCheatPlayer(self.playerLocationList);
        if isNewPlayerCheat then
            local playerLocationList = self.playerLocationList
            self:start_lua_coroutine(function()
                coroutine.wait(0)
                ModuleCache.LogManager.custom_Log(ModuleCache.Log.format_pbc_table(playerLocationList, "有作弊嫌疑"))
            end)
        end
    else
        -- 玩家大于2人
        if playerInfoCount > 2 then
            -- 是否有新的作弊玩家
            local isNewPlayerCheat = self:isHaveNewCheatPlayer(self.playerLocationList);
            if isNewPlayerCheat then
                self.showUI = true
                self:show_view()
                local playerLocationList = self.playerLocationList
                self:start_lua_coroutine(function()
                    coroutine.wait(0)
                    ModuleCache.LogManager.custom_Log(ModuleCache.Log.format_pbc_table(playerLocationList, "有作弊嫌疑"))
                end)
            end
        end
    end



    --TODO: 龙涛动态加载模块
    --self:get_view():init(playerLocationList);
end

function TableLocationModule:show_view()
    if self.playerLocationList then
        self:get_view():init(self.playerLocationList);
    end
    self:get_view():show();
end

function TableLocationModule:isHavaZuoBiPlayer(seatHolderArray)
    local playerLocationList = self:getPlayerLocationList(seatHolderArray);

    for k, playerLocation2 in pairs(playerLocationList) do
        for key, locationObject in pairs(playerLocation2.locationList) do
            if locationObject.isDistanceNear or locationObject.isShowIP then
                return true
            end
        end
    end

    return false
end


----------------------------麻将专用------------------
-- 获取玩家定位信息人数
function TableLocationModule:getPlayerInfoCount(seatHolderArray)
    local seatInfoList = { }
    local seatIndex = 1;
    for i = 1, #seatHolderArray do
        local seatHolder = seatHolderArray[i]
        local playerInfo = TableUtil.get_user_info(seatHolder.playerId)
        if (playerInfo) then
            playerInfo.locationData = seatHolder.locationData;
            seatInfoList[seatIndex] = playerInfo;
            seatIndex = seatIndex + 1;
        end
    end

    return #seatInfoList;
end

-- 获取玩家信息列表(麻将专用)
function TableLocationModule:getPlayerInfoListByMJ(seatHolderArray, tableCount)
    local seatInfoList = { }
    local seatHolderArrayTemp = { };
    local seatIndex = 1;
    -- 去掉不可用的座位数据
    for key, seatHolder in ipairs(seatHolderArray) do
        if seatHolder.enable then
            seatHolderArrayTemp[seatIndex] = seatHolder;
            seatIndex = seatIndex + 1;
        end
    end

    for i = 1, #seatHolderArrayTemp do
        local seatHolder = seatHolderArrayTemp[i]
        local playerInfo = TableUtil.get_user_info(seatHolder.playerId)
        if (playerInfo) then
            playerInfo.locationData = seatHolder.locationData;
            -- 过滤玩家名字
            local filterPlayerName = Util.filterPlayerName(playerInfo.playerName, 10);
            playerInfo.playerName = filterPlayerName;
            seatInfoList[i] = playerInfo;
        end
    end

    -- 牌桌中剩余空位,使用默认空位信息
    for i = 1, tableCount do
        if seatInfoList[i] == nil then
            local seatInfoTemp = { };
            seatInfoTemp.headUrl = nil;
            seatInfoTemp.playerName = "";
            seatInfoTemp.locationData = nil;
            seatInfoTemp.ip = "0";
            seatInfoList[i] = seatInfoTemp;
        end
    end

    local playerInfoList = self:getPlayerLocationList(seatInfoList);
    return playerInfoList;
end
------------------------------------------------------------

-------------------------跑得快专用--------------------------
-- 获取玩家定位信息人数
function TableLocationModule:getPlayerInfoCountByRunfast(seatInfoList)
    local seatInfoListTemp = { }
    local seatIndex = 1;
    for key, seatInfo in ipairs(seatInfoList) do
        if (seatInfo.playerInfo) then
            seatInfoListTemp[seatIndex] = seatInfo.playerInfo;
            seatIndex = seatIndex + 1;
        end
    end

    return #seatInfoListTemp;
end
-- 获取玩家信息列表(跑得快专用)
function TableLocationModule:getPlayerInfoListByRunfast(seatInfoList, tableCount)
    local seatInfoListTemp = { }
    for key, seatInfo in ipairs(seatInfoList) do
        if (seatInfo.playerInfo) then
            -- 过滤玩家名字
            local filterPlayerName = Util.filterPlayerName(seatInfo.playerInfo.playerName, 10);
            seatInfo.playerInfo.playerName = filterPlayerName;
            if seatInfo.playerInfo.locationData then
                local gpsInfoSplit = string.split(seatInfo.playerInfo.locationData.gpsInfo, ",");
                seatInfo.playerInfo.locationData.latitude = tonumber(gpsInfoSplit[1]);
                seatInfo.playerInfo.locationData.longitude = tonumber(gpsInfoSplit[2]);
            end

            seatInfoListTemp[seatInfo.localSeatIndex] = seatInfo.playerInfo;
        end
    end

    -- 找到牌桌中空位,把默认空位数据插到空位中
    for i = 1, tableCount do
        if seatInfoListTemp[i] == nil then
            local seatInfoTemp = { };
            seatInfoTemp.headUrl = nil;
            seatInfoTemp.playerName = "";
            seatInfoTemp.locationData = nil;
            seatInfoTemp.ip = "0";
            seatInfoListTemp[i] = seatInfoTemp;
        end
    end

    local playerInfoList = self:getPlayerLocationList(seatInfoListTemp);
    return playerInfoList;
end
------------------------------------------------

-- 是否开启定位按钮
function TableLocationModule:isOpenLocation(playerInfoList)

    local isOpenLocation = false;
    if #playerInfoList > 2 then
        isOpenLocation = true;
    end

    return isOpenLocation;
end

---------------------存储作弊玩家id--------------
-- 是否有作弊玩家
function TableLocationModule:isHaveNewCheatPlayer(playerLocationList)
    -- 是否有新的作弊玩家
    local isHaveCheatPlayer = false;
    -- 获取临时的作弊玩家信息
    local cheatPlayerInfoTemp = self:getCheatPlayerInfo();
    -- 从硬盘中获取作弊玩家信息
    local cheatPlayerInfo = self:getSaveCheatPlayerInfo();
    --print("作弊玩家信息==", cheatPlayerInfoTemp, cheatPlayerInfo);

    if cheatPlayerInfoTemp ~= cheatPlayerInfo then
        isHaveCheatPlayer = true;
        -- 存储作弊玩家信息到硬盘
        self:saveCheatPlayerInfo(cheatPlayerInfoTemp);
    end
    return isHaveCheatPlayer;
end

-- 设置作弊玩家id
function TableLocationModule:setCheatPlayer(playerID)
    -- 为空表,添加第一个元素
    if next(self.cheatPlayerIDList) == nil then
        table.insert(self.cheatPlayerIDList, playerID);
        return ;
    end
    -- 列表中是否有相同玩家id
    local isSamePlayerID = false;
    -- 去重复玩家id
    for key, playerIDTemp in ipairs(self.cheatPlayerIDList) do
        if playerID == playerIDTemp then
            isSamePlayerID = true;
            return ;
        end
    end
    -- 没有相同玩家id,向列表中添加玩家id
    if isSamePlayerID == false then
        table.insert(self.cheatPlayerIDList, playerID);
    end
end

-- 从硬盘中获取作弊玩家信息
function TableLocationModule:getSaveCheatPlayerInfo()
    local playerInfo = ModuleCache.PlayerPrefsManager.GetString("tableLocation");
    return playerInfo;
end

-- 存储作弊玩家信息到硬盘
function TableLocationModule:saveCheatPlayerInfo(cheatPlayerInfo)
    -- 保存作弊玩家信息
    ModuleCache.PlayerPrefsManager.SetString("tableLocation", cheatPlayerInfo);
end

-- 获取临时的作弊玩家信息
function TableLocationModule:getCheatPlayerInfo()
    local playerInfo = self.roomID;
    for key, playerID in ipairs(self.cheatPlayerIDList) do
        playerInfo = playerInfo .. "|" .. playerID;
    end
    return playerInfo;
end
-----------------------------------------------------------------

-- 获取玩家位置信息列表
function TableLocationModule:getPlayerLocationList(playerInfoList)

    local playerInfoListNew = { };

    if playerInfoList == nil then
        return
    end
    local errorData = false
    -- 遍历所有玩家的信息
    for i = 1, #playerInfoList do
        local currentPlayerInfo = playerInfoList[i];

        --        -- 玩家名字为空,说明是断线重连方式进入,不执行防作弊检测
        --        if currentPlayerInfo.playerName == nil then
        --            -- return tipText, distanceText;
        --        end
        local playerInfoObject = { };

        print_table(currentPlayerInfo)
        -- 玩家头像地址
        playerInfoObject.imgUrl = currentPlayerInfo.headUrl;

        playerInfoObject.spriteHeadImage = currentPlayerInfo.spriteHeadImage
        -- playerInfoObject.spriteHeadImage = currentPlayerInfo.spriteHeadImage
        -- 玩家名字
        playerInfoObject.playerName = Util.filterPlayerName(currentPlayerInfo.playerName, 10)



        -- 未开启位置获取功能
        if currentPlayerInfo.locationData then
            if currentPlayerInfo.locationData.latitude == 0 and currentPlayerInfo.locationData.longitude == 0 then
                playerInfoObject.isShowDotGPS = true;
                -- 设置作弊玩家id
                self:setCheatPlayer(currentPlayerInfo.playerId);
            else
                playerInfoObject.isShowDotGPS = false;
            end
        else
            playerInfoObject.isShowDotGPS = false;
        end


        local locationList = { };
        -- 按顺序遍历当前玩家与其他玩家信息进行比较
        for j = i + 1, #playerInfoList do
            local nextPlayerInfo = playerInfoList[j];

            local locationObject = { };
            local isSameIp = self:isPlayerIpSame(currentPlayerInfo, nextPlayerInfo);
            -- 当前玩家与下一玩家ip地址相同
            if isSameIp then
                locationObject.isShowIP = true;
                -- 设置作弊玩家id
                self:setCheatPlayer(currentPlayerInfo.playerId);
                -- 设置作弊玩家id
                self:setCheatPlayer(nextPlayerInfo.playerId);
            else
                locationObject.isShowIP = false;
            end

            -- 开启位置获取功能
            if currentPlayerInfo.locationData then
                if currentPlayerInfo.locationData.latitude == 0 and currentPlayerInfo.locationData.longitude == 0 then
                    locationObject.distance = "";
                    locationObject.isDistanceNear = false;
                else
                    -- 计算距离
                    local distance, isDistanceNear = self:caculate_distance(currentPlayerInfo, nextPlayerInfo);
                    if distance == "???" then
                        errorData = true
                    end
                    -- 距离文字描述
                    locationObject.distance = distance;
                    -- 是否距离过近
                    locationObject.isDistanceNear = isDistanceNear;
                    if isDistanceNear then
                        -- 设置作弊玩家id
                        self:setCheatPlayer(currentPlayerInfo.playerId);
                        -- 设置作弊玩家id
                        self:setCheatPlayer(nextPlayerInfo.playerId);
                    end

                    locationObject.name1 = currentPlayerInfo.playerName
                    locationObject.name2 = nextPlayerInfo.playerName


                end
            else
                locationObject.distance = "";
                locationObject.isDistanceNear = false;
            end

            locationList[j - i] = locationObject;
        end
        playerInfoObject.locationList = locationList;
        playerInfoListNew[i] = playerInfoObject;


    end
    if errorData then
        --ModuleCache.LogManager.custom_Log(ModuleCache.Log.print_table(playerInfoList))
        self:start_write_log(playerInfoList)
    end
    return playerInfoListNew;
end

function TableLocationModule:start_write_log(playerInfoList)
    self:start_lua_coroutine(function()
        coroutine.wait(0)
        ModuleCache.Log.report_exception("GPS数据处理异常：",  self.modelData.roleData.userID)
        ModuleCache.LogManager.custom_Log(ModuleCache.Log.print_table(playerInfoList))
    end)
end

-- 判断两个玩家是否ip相同
function TableLocationModule:isPlayerIpSame(playerInfo1, playerInfo2)

    local isSameIp = false;

    if not playerInfo1.ip or not playerInfo2.ip or playerInfo1.ip == "0" or playerInfo2.ip == "0" then
        isSameIp = false;
    elseif playerInfo1.ip == playerInfo2.ip then
        isSameIp = true;
    end

    return isSameIp;
end

-- 计算距离
function TableLocationModule:caculate_distance(playerInfo1, playerInfo2)

    -- 距离描述
    local distanceText = "";
    -- 是否距离过近
    local isDistanceNear = false;

    -- 不存在定位数据,不执行以下代码
    if not playerInfo1.locationData or not playerInfo2.locationData then
        return distanceText, isDistanceNear;
    end

    local playerInfoLatitude1 = nil;
    local playerInfoLongitude1 = nil;
    if playerInfo1.locationData.gpsInfo == nil then
        playerInfoLatitude1 = tonumber(playerInfo1.locationData.latitude);
        playerInfoLongitude1 = tonumber(playerInfo1.locationData.longitude);
    else
        local playerInfoString1 = string.split(playerInfo1.locationData.gpsInfo, ",");
        playerInfoLatitude1 = tonumber(playerInfoString1[1]);
        playerInfoLongitude1 = tonumber(playerInfoString1[2]);
    end

    local playerInfoLatitude2 = nil;
    local playerInfoLongitude2 = nil;
    if playerInfo2.locationData.gpsInfo == nil then
        playerInfoLatitude2 = tonumber(playerInfo2.locationData.latitude);
        playerInfoLongitude2 = tonumber(playerInfo2.locationData.longitude);
    else
        local playerInfoString2 = string.split(playerInfo2.locationData.gpsInfo, ",");
        playerInfoLatitude2 = tonumber(playerInfoString2[1]);
        playerInfoLongitude2 = tonumber(playerInfoString2[2]);
    end

    if (playerInfoLatitude1 ~= 0 and playerInfoLatitude2 ~= 0) then
        -- 计算距离，要考虑到非法坐标
        local distance = TableUtil.caculate_distance(playerInfoLatitude1, playerInfoLongitude1, playerInfoLatitude2, playerInfoLongitude2);
        if distance >= 1000 then
            distanceText = string.format("%.0f", distance / 1000) .. "公里";
        else
            -- 小于0代表是非法坐标，用???表示
            if distance < 0 then
                distanceText = "???"
                --TODO: 当是非法坐标时，需要上报日志
            elseif distance < 50 then
                distanceText = "小于50米";
            else
                distanceText = string.format("%.0f", distance) .. "米";
            end

            if distance > 0 and distance <= 100 then
                isDistanceNear = true;
            else
                isDistanceNear = false;
            end
        end
    end
    return distanceText, isDistanceNear;
end

return TableLocationModule;