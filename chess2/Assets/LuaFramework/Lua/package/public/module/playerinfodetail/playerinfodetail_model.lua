
local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local json = require("cjson")

local ModuleCache = ModuleCache

local PlayerInfoDetailModel = class("playerInfoDetailModel", Model)

function PlayerInfoDetailModel:initialize(...)
    Model.initialize(self, ...)


end

-- 请求获取用户信息协议
function PlayerInfoDetailModel:getUserInfo(data)

    self:get_general_data(data.uid, function (userdata)
        local userInfoObject =
        {
            data = userdata,
            showType = data.showType;
        }
        Model.dispatch_event(self, "Event_PlayerInfo_GetUserInfo", userInfoObject);
    end)

    --local requestData = {
    --    params =
    --    {
    --        uid = data.uid,
    --    },
    --    baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
    --    cacheDataImmediatelyCallback = true,
    --}
    --
    --local onResponse = function(wwwOperation)
    --
    --    local www = wwwOperation.www;
    --    local retData = ModuleCache.Json.decode(www.text)
    --    if retData.ret and retData.ret == 0 then
    --
    --        local userInfoObject =
    --        {
    --            data = retData.data,
    --            showType = data.showType;
    --        }
    --        Model.dispatch_event(self, "Event_PlayerInfo_GetUserInfo", userInfoObject);
    --    else
    --
    --    end
    --end
    --
    --local onError = function(data)
    --    print(data.error);
    --end
    --
    --self:http_get(requestData, onResponse, onError);
end

-- 请求保存签名协议
function PlayerInfoDetailModel:saveSign(signText)

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            signature = signText,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/savePersonalizedSignature?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            Model.dispatch_event(self, "Event_PlayerInfo_SaveSign", retData.data);
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

-- 请求保存签名协议
function PlayerInfoDetailModel:rebindingwx(wechatCode, callback)
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            code = wechatCode
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/changeWxUnionId?",
        tips500Error = true
    }

    self:http_get(requestData, function(wwwOperation)
        local retData = ModuleCache.Json.decode(wwwOperation.www.text)
        if retData.ret and retData.ret == 0 then
            if callback then
                callback(retData.data)
            end
        end
    end)
end

return PlayerInfoDetailModel;