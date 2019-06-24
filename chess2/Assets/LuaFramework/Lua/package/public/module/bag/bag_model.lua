
local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local json = require("cjson")

local ModuleCache = ModuleCache

local BagModel = class("bagModel", Model)

function BagModel:initialize(...)
    Model.initialize(self, ...)
end

-- 请求点击红点协议
function BagModel:clickRedPoint(itemID)

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            itemId = itemID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "packetItem/getItemDetail?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            -- 获取背包详情协议
            self:getBagDetail();
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 获取背包详情协议
function BagModel:getBagDetail()

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "packetItem/queryGamePacketItemOnwerPage?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            Model.dispatch_event(self, "Event_Bag_GetBagDetail", retData.data.list);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 获取玩家信息协议
function BagModel:getUserInfo(bag, playerID)

    local requestData = {
        params =
        {
            uid = playerID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        cacheDataImmediatelyCallback = true,
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            retData.data.bag = bag;
            Model.dispatch_event(self, "Event_Bag_GetUserInfo", retData.data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

-- 请求赠送道具协议
function BagModel:giveItem(bag, playerID)

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            num = bag.giveNum,
            itemId = bag.itemId,
            receiveUid = playerID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "packetItem/giveItem?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            -- 获取背包详情协议
            self:getBagDetail();
            Model.dispatch_event(self, "Event_Bag_GiveItem", retData.data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

return BagModel;