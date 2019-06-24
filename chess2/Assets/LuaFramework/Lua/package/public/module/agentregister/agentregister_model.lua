---
--- Created by dengcheng.
--- DateTime: 2018/11/12 下午5:16
---
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

---@class AgentRegisterModel
local AgentRegisterModel = Class("agentRegisterModel", Model)
local CSmartTimer = ModuleCache.SmartTimer.instance


function AgentRegisterModel:initialize(...)
    Model.initialize(self, ...)

end
--申请推广员
function AgentRegisterModel:applyAgents(name,mobile,inviteCode,verifyCode)
    log_debug(self.modelData.roleData.userID.."，inviteCode："..inviteCode)
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            name = name,
            mobile = mobile,
            inviteCode = inviteCode,
            verifyCode = verifyCode,
            gameId = self.modelData.gameId,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/info/applyAgents?",
    }
    log_debug("baseUrl:"..requestData.baseUrl);
    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            self:getBindStatus() --申请之后再请求数据，并跳转界面
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

--代理状态查询
function AgentRegisterModel:getBindStatus(circle)
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/info/getBindStatus?",
    }
    if circle then
        requestData.showModuleNetprompt = true
    end
    local onResponse = function(wwwOperation)
        --log_debug("receive getBindStatus response")
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            Model.dispatch_event(self, "Event_Agent_GetBindStatus", retData.data)
        else

        end
    end
    local onError = function(data)
        print(data.error);
    end
    self:http_get(requestData, onResponse, onError);
end

-- 请求获取验证码
function AgentRegisterModel:getVerifyNum(phoneNum)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "/user/sendVerifyCode?",
        params = {
            uid = self.modelData.roleData.userID,
            phone = phoneNum,
        }
    }
    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            Model.dispatch_event(self, "Event_GetVerify", { result = true})
        end
    end, function(error)
        local msg =  ModuleCache.Json.decode(error.www.text)
        local errormsg = ModuleCache.Json.decode(msg.errMsg)
        Model.dispatch_event(self, "Event_GetVerify", { result = false, err = errormsg.message })
    end)
end

return AgentRegisterModel