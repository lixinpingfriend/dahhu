




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
---@class PhoneBindingView
local PhoneBindingView = Class('PhoneBindingView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
function PhoneBindingView:initialize(...)
    View.initialize(self, "public/module/phonebind/public_windowphonebind.prefab", "Public_WindowPhoneBind", 1)
    self:set_1080p()

    self.buttonClose = GetComponentWithPath(self.root, "ButtonClose", ComponentTypeName.Button)
    self.buttonGet = GetComponentWithPath(self.root, "Verify/ButtonGet", ComponentTypeName.Button)
    self.buttonGrey = GetComponentWithPath(self.root, "Verify/ButtonGrey", ComponentTypeName.Button)
    self.buttonConfirm = GetComponentWithPath(self.root, "ButtonConfirm", ComponentTypeName.Button)
    self.textDesc = GetComponentWithPath(self.root, "Desc", ComponentTypeName.Text)
    self.inputPhoneNum = GetComponentWithPath(self.root, "Phone/InputField", ComponentTypeName.InputField)
    self.inputVerifyNum = GetComponentWithPath(self.root, "Verify/InputField", ComponentTypeName.InputField)
    self.textGet = GetComponentWithPath(self.root, "Verify/ButtonGrey/Text", ComponentTypeName.Text)
    self.uiStateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    self.textRebindingDesc = GetComponentWithPath(self.root, "TextRebindingDesc", ComponentTypeName.Text)
end




function PhoneBindingView:set_desc_text(coins)
    --self.textDesc.text = string.format("填写正确的身份信息，通过验证后可获得%d钻石的奖励", coins)
end

function PhoneBindingView:get_btn_deal(canclick)
    self.buttonGet.gameObject:SetActive(false)
    self.buttonGrey.gameObject:SetActive(true)
    self.inputPhoneNum.interactable = false
    self:subscibe_time_event(60, false, 1):OnUpdate(
    function( t )
        self.textGet.text = string.format("%d秒后获取", t.surplusTimeRound)
    end
    ):OnComplete(function( t )
        self.buttonGrey.gameObject:SetActive(false)
        self.buttonGet.gameObject:SetActive(true)
        self.inputPhoneNum.interactable = true
    end)
end

return PhoneBindingView