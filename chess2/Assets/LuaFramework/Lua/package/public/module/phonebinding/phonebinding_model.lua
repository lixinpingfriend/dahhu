local class = require("lib.middleclass")
local ModelBase = require("core.mvvm.model_base")
---@class PhoneBindingModel
local PhoneBindingModel = class("Public.PhoneBinding", ModelBase)
local Model = require("core.mvvm.model_base")
local ModuleCache = ModuleCache

function PhoneBindingModel:initialize(...)
    ModelBase.initialize(self, ...)
end



-- 请求获取验证码
function PhoneBindingModel:getVerifyNum(phoneNum)
    local requestData = {
        --baseUrl = "http://114.55.99.139:9021/swagger-ui.html#!/real-name-auth-endpoint/qeryAuthUsingGET",
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "realNameAuth/getVilidateCode?",
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

-- 请求获取验证码
function PhoneBindingModel:getVerifyNumNoCheck(phoneNum)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/sendVerifyCodeNoCheck?",
        params = {
            phone = phoneNum,
            verifyBindWx = 1,
        },
        tips500Error = true
    }
    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            Model.dispatch_event(self, "Event_GetVerifyNoCheck", retData.data)
        end
    end, function(error)

    end)
end

-- 请求获取代理系统验证码
function PhoneBindingModel:getAgentVerifyNum()
    local requestData = {
        --baseUrl = "http://114.55.99.139:9021/swagger-ui.html#!/real-name-auth-endpoint/qeryAuthUsingGET",
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/bank/getVilidateCode?",
        params = {
            uid = self.modelData.roleData.userID,
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

--提交验证
function PhoneBindingModel:submitverify(phoneNum, verifyNum)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "realNameAuth/auth?",
        params = {
            uid = self.modelData.roleData.userID,
            phone = phoneNum,
            code = verifyNum,
        }
    }
    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            -- OK
            Model.dispatch_event(self, "Event_SubmitVerify", { result = true, mobile = phoneNum, verifyCode = verifyNum })
        end
    end, function(error)
        local msg =  ModuleCache.Json.decode(error.www.text)
        local errormsg = ModuleCache.Json.decode(msg.errMsg)
        Model.dispatch_event(self, "Event_SubmitVerify", { result = false, err = errormsg.message })
    end  )
end

return PhoneBindingModel