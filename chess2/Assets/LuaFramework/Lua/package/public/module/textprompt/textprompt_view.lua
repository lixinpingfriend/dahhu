
local class = require("lib.middleclass")
local ViewBase = require('core.mvvm.view_base')
-- ==========================================================================

---@class TextPromptView
local TextPromptView = class('Hall.TextPromptView', ViewBase)

local ModuleCache = ModuleCache

function TextPromptView:initialize(...)
    ViewBase.initialize(self, "public/module/public/public_windowtextprompt.prefab", "Public_WindowTextPrompt", 2)

    self.centerTipsBaseItem = self.rootTransform:Find("CenterTips/BaseItem")
    self.centerTipsBaseItem.gameObject:SetActive(false)
    self.centerTipsBaseItemRedPacket = self.rootTransform:Find("CenterTips/BaseItemRedPacket")
    self.centerTipsBaseItemRedPacket.gameObject:SetActive(false)

    self.systemAnnounceRoot = ModuleCache.ComponentUtil.Find(self.root, "SystemAnnounce")
    self.systemAnnounceTextTransform = self.rootTransform:Find("SystemAnnounce/Image/Mask/Text")
    self.systemAnnounceText = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "SystemAnnounce/Image/Mask/Text", ModuleCache.ComponentTypeName.Text)
    self.systemAnnounceRoot:SetActive(false)
    --    self.systemAnnounceText = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "SystemAnnounce/Image/Mask/Text", ModuleCache.ComponentTypeName.Text)
end




return TextPromptView