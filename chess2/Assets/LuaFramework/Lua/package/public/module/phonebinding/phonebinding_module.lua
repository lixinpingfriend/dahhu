
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class PhoneBinding : Module
---@field view PhoneBindingView
---@field model PhoneBindingModel
local PhoneBindingModule = class("Public.PhoneBindingModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function PhoneBindingModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "PhoneBinding_view", "PhoneBinding_model", ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function PhoneBindingModule:on_module_inited()

end

-- 绑定module层的交互事件
function PhoneBindingModule:on_module_event_bind()

end

local coin = 0

-- 绑定Model层事件，模块内交互
function PhoneBindingModule:on_model_event_bind()
    self:subscibe_model_event("Event_GetVerify", function(eventHead, eventData)
        if (eventData.result) then
            self.view:get_btn_deal(false)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("验证码发送成功")
        end
    end)
    self:subscibe_model_event("Event_GetVerifyNoCheck", function(eventHead, eventData)
        self.view:get_btn_deal(false)
        self._phoneBindWechat = eventData.status == 1
    end)

    self:subscibe_model_event("Event_SubmitVerify", function(eventHead, eventData)
        if (eventData.result) then
            if self.intentShow == "Binding" then
                if coin > 0 then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(string.format("恭喜您绑定手机成功,获得%d钻石",coin))
                else
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("恭喜您绑定手机成功")
                end
                self:dispatch_package_event("Event_Package_User_BindingPhone", eventData.result)
            elseif self.intentShow == "ReBinding" then
                ModuleCache.ModuleManager.hide_module("public", "playerinfodetail")
            elseif self.intentShow == "Login" then

            end
            self:hide()
        else
            print(eventData.err)
            self.view.inputPhoneNum.interactable = true
        end
    end )

end

---intentShow: login binding rebinding
function PhoneBindingModule:on_show(intentShow)
    self.view.inputPhoneNum.enabled = true
    if intentShow.type then
        self.data = intentShow
        self.intentShow = intentShow.type
    else
        self.intentShow = intentShow
    end

    self.view.uiStateSwitcher:SwitchState(self.intentShow)
    if self.intentShow == "ReBinding" then
        self.view.textRebindingDesc.text = string.format("您当前绑定的手机号：%s", self.modelData.roleData.mobile)
    elseif self.intentShow == "Withdraw" then
        self.view.textRebindingDesc.text = self.data.tipTex
        self.view.inputPhoneNum.text = string.sub(self.data.mobile, 1,3).. "****".. string.sub(self.data.mobile, #self.data.mobile -3,#self.data.mobile)
        self.view.inputPhoneNum.enabled = false
    end
    --coin = coins
    --self.view:set_desc_text(coins)
end

function PhoneBindingModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

    local objName = obj.name
    if objName == "ButtonClose" then
        ModuleCache.ModuleManager.destroy_module("public", "phonebinding");
    elseif objName == "ButtonGet" then
        local phoneNum = self.view.inputPhoneNum.text
        if not tonumber(phoneNum) and self.data then --"186****5844"
            phoneNum = self.data.mobile
        end

        if string.len(phoneNum) ~= 11 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请填写正确的手机号")
        else
            if self.intentShow == "Login" then
                self._phoneBindWechat = false
                self.model:getVerifyNumNoCheck(phoneNum)
            elseif self.intentShow == "Withdraw" then
                self.model:getAgentVerifyNum()
            else
                self.model:getVerifyNum(phoneNum)
            end
        end
    elseif objName == "ButtonConfirm" then
        local verifyNum = self.view.inputVerifyNum.text
        local phoneNum = self.view.inputPhoneNum.text
        if not tonumber(phoneNum) and self.data then --"186****5844"
            phoneNum = self.data.mobile
        end

        if string.len(phoneNum) ~= 11 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请填写正确的手机号")
        elseif string.len(verifyNum) ~= 6 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请填写正确的验证码")
        else
            if self.intentShow == "Login" then
                local data =  {
                    result = true,
                    mobile = phoneNum,
                    verifyCode = verifyNum,
                    phoneBindWechat = self._phoneBindWechat
                }
                if ModuleCache.GameManager.isEditor then
                    data.phoneBindWechat = true
                end
                self:dispatch_package_event("Event_Package_GetVerifyStatusNoCheck", data)
            elseif self.intentShow == "Withdraw" then
                self:dispatch_package_event("Event_Package_GetVerifyStatusWithdraw", { verifyCode = verifyNum,extractType = self.data.extractType})
                self:hide()
            else
                self.model:submitverify(phoneNum, verifyNum)
            end



        end


    end
end





return PhoneBindingModule



