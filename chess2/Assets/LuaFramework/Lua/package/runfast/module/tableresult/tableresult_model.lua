
local BranchPackageName = AppData.BranchRunfastName
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")

local ModuleCache = ModuleCache
-- ==========================================================================
local TableResultModel = Class("tableResultModel", Model)

function TableResultModel:initialize(...)
    Model.initialize(self, ...)    
end

function TableResultModel:get_userinfo(playerId, callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = playerId,
        },
        cacheDataKey = "user/info?uid=" .. playerId,
        cacheDataImmediatelyCallback = true,
    }

    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.errMsg, retData)
        end
    end, function(error)
        print(error.error)
        self:get_userinfo(playerId, callback)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.errMsg, retData)
        end
    end)

end

return TableResultModel