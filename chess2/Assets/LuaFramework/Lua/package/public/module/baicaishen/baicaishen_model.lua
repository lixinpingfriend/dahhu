





local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local json = require("cjson")

local ModuleCache = ModuleCache

local BaiCaiShenModel = class("baicaishenModel", Model)

function BaiCaiShenModel:initialize(...)
    Model.initialize(self, ...)
    self.activityCode = "call_money_god"
end

---获取拜财神活动ID
function BaiCaiShenModel:getActive(playerId,callback)
    if not callback or "function" ~= type(callback) then
        return
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityListByCode?",
        params = {
            uid = playerId,
            --gameId = gameId,
            code = self.activityCode,
        },
    }
    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end)
end

---获取拜财神奖励
function BaiCaiShenModel:getAwards(playerId,activityId,callback)
    if not callback or "function" ~= type(callback) then
        return
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getAwards?",
        params = {
            uid = playerId,
            --gameId = gameId,
            activityId = activityId,
        },
    }
    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("余额不足")
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end)
end

return BaiCaiShenModel