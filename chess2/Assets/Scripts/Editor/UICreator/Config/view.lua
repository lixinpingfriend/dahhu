




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local ClassName = Class('ViewName', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName

function ClassName:initialize(...)
    -- 初始View 
    View.initialize(self, "AssetPath", "AssetName", 1)
end

return ClassName