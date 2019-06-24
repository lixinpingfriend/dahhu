
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local IOSNetErrorFixView = Class('iOSNetErrorFixView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName



function IOSNetErrorFixView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/iosneterrorfix/public_windowiosneterrorfix.prefab", "Public_WindowIOSNetErrorFix", 1)
    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    self.btnBack = GetComponentWithPath(self.root, "TopLeft/Child/ImageBack", ComponentTypeName.Button)    
end


return IOSNetErrorFixView