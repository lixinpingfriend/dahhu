
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local UserAgreementView = Class('userAgreementView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName


function UserAgreementView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/useragreement/public_windowuseragreement.prefab", "Public_WindowUserAgreement", 1)

    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    

    self.buttonClose = GetComponentWithPath(self.root, "Title/closeBtn", ComponentTypeName.Button)
    self.textUserAgreement = GetComponentWithPath(self.root, "Center/Panels/Agreenment/Text", ComponentTypeName.Text)
    self:initPanelUserAgreementText()
    self.gameObjectPanelText = ModuleCache.ComponentUtil.Find(self.root, "Center/Panels/Agreenment")
    self.gameObjectPanelText_HAOCAI = ModuleCache.ComponentUtil.Find(self.root, "Center/Panels/Agreenment_HAOCAI")
    self.gameObjectPanelTest = ModuleCache.ComponentUtil.Find(self.root, "Center/Panels/PanelTest")
    self.gameObjectPanelTestVerify = ModuleCache.ComponentUtil.Find(self.root, "Center/Panels/PanelTestVerify")
    self.inputTestVerify = GetComponentWithPath(self.root, "Center/Panels/PanelTestVerify/InputField", ComponentTypeName.InputField)
    self.toggleClear = ModuleCache.ComponentUtil.Find(self.root, "Center/Panels/PanelTest")

    self.toggleOpenDevelopModel = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Panels/PanelTest/ToggleOpenDevelopModel", ComponentTypeName.Toggle)
    self.toggleLockAsset = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Panels/PanelTest/ToggleLockAsset", ComponentTypeName.Toggle)
    self.toggleLockAsset.isOn = ModuleCache.GameManager.lockAssetUpdate

    self.dropdownChannel = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Panels/PanelTest/Channel/DropdownChannel", ComponentTypeName.Dropdown)
    self.dropdownChannel.captionText.text = ModuleCache.GameManager.channel
    self.dropdownChannel.options:Clear()
    local index = 0
    for k, v in pairs(ModuleCache.AppData.channelData) do
        local optionData = ModuleCache.UnityEngine.UI.Dropdown.OptionData(tostring(k))
        self.dropdownChannel.options:Add(optionData)
        if tostring(k) == ModuleCache.GameManager.channel then
            self.dropdownChannel.value = index
        end
        index = index + 1
    end

    self.dropdownChannel.onValueChanged:AddListener(function(idx)
        ModuleCache.GameManager.channel = self.dropdownChannel.captionText.text
        ModuleCache.GameConfigProject.channel = ModuleCache.GameManager.channel
        if ModuleCache.GameManager.channel == "HAOCAI" then
            ModuleCache.PlayerPrefsManager.DeleteAll()
        end
        ModuleCache.WechatManager.reset()
    end)

    self.toggleLockAsset.onValueChanged:AddListener(function(state)
        ModuleCache.GameManager.lockAssetUpdate = state
        if state then
            ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_LOCK_ASSET, 1)
        else
            ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_LOCK_ASSET, 0)
        end
    end)

    if ModuleCache.GameManager.channel == "HAOCAI" then
        self.gameObjectPanelText:SetActive(false)
        self.gameObjectPanelText_HAOCAI:SetActive(true)
    else
        self.gameObjectPanelText:SetActive(true)
        self.gameObjectPanelText_HAOCAI:SetActive(false)
    end

end

function UserAgreementView:initPanelUserAgreementText()
    
end



return UserAgreementView