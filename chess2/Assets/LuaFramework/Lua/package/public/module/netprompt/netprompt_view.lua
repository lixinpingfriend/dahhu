
local class = require("lib.middleclass")
local ViewBase = require('core.mvvm.view_base')
-- ==========================================================================

---@class NetPromptView : View
local NetPromptView = class('Hall.NetPromptView', ViewBase)

local ModuleCache = ModuleCache

function NetPromptView:initialize(...)
    ViewBase.initialize(self, "public/module/public/public_windownetworkblock.prefab", "Public_WindowNetworkBlock", 2)

    self.imageDelay = ModuleCache.ComponentManager.Find(self.root, "ImageDelay")
end

return NetPromptView