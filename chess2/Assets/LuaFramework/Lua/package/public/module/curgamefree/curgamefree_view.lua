
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local CurGameFreeView = Class('curGameFreeView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName

function CurGameFreeView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/curgamefree/public_curgamefree.prefab", "Public_CurGameFree", 1)
    View.set_1080p(self)
    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

    self.bgSprite = GetComponentWithPath(self.root, "BaseBackground", ComponentTypeName.Image)

end


return CurGameFreeView