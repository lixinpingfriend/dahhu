---
--- Created by dengcheng.
--- DateTime: 2018/11/12 下午5:16
---
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

---@class AgentRegisterModule:ModuleBase
---@field model AgentRegisterModel
---@field view AgentRegisterView
local AgentRegisterModule = class("AgentRegisterModule", ModuleBase)

local ModuleCache = ModuleCache

function AgentRegisterModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "agentregister_view", "agentregister_model", ...)
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function AgentRegisterModule:on_model_event_bind()

    -- 获取申请状态回包
    self:subscibe_model_event("Event_Agent_GetBindStatus", function(eventHead, eventData)
        log_debug("on event Event_Agent_GetBindStatus")
        self.view:show()
        self.view:getBindStatus(eventData)
        --如果打开审核界面的时候，已经成为了代理，刷新大厅的显示
        self:dispatch_module_event("agentregister","Event_AgentRegister_GetIsAgent",eventData.hasAgents)
    end)
    --验证码回包
    self:subscibe_model_event("Event_GetVerify", function(eventHead, eventData)
        if (eventData.result) then
            self.view:get_btn_deal(false)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("验证码发送成功")
        end
    end)
end

function AgentRegisterModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonReq" then
        self:apply()
    elseif obj.name == "ButtonVerify" then
        self:reqVerifyCode()
    elseif obj.name == "ButtonWait" then
        self:openCustomerService()
    elseif obj.name == "ImageClose" then
        ModuleCache.ModuleManager.destroy_module("public","agentregister")
    elseif obj.name == "ButtonAgree" then
        self:showAgreement(true)
    elseif obj.name == "BtnCloseAgree" then
        self:showAgreement(false)
    end
end

function AgentRegisterModule:apply()
    log_debug("AgentRegisterModule apply");
    if self.view.toggleAgree.isOn then
        self.model:applyAgents(self.view.inputName.text,self.view.inputPhone.text,self.view.inputInviteCode.text,self.view.inputVerifyCode.text)
    else
        ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("请先阅读并同意合作协议！")
    end
end

function AgentRegisterModule:reqVerifyCode()
    local phoneNum = self.view.inputPhone.text
    if string.len(phoneNum) ~= 11 then
        ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("请填写正确的手机号")
    else
        self.model:getVerifyNum(phoneNum)
    end
end

function AgentRegisterModule:showAgreement(show)
    --self.view.agentAgree
    ModuleCache.ComponentUtil.SafeSetActive(self.view.agentAgree,show)
    ModuleCache.ComponentUtil.SafeSetActive(self.view.registerObj,not show)
end

function AgentRegisterModule:openCustomerService()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/isCustomer?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if retData.data then
                ModuleCache.ModuleManager.show_public_module("customerservicesystem");
                --self.view.spritecustomerServiceRed:SetActive(false)
            else
                ModuleCache.ModuleManager.show_module("public", "customerservice");
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function AgentRegisterModule:on_show()
    self.view:resetView()
    self.view:hide()
    self.model:getBindStatus(true)
end

return AgentRegisterModule