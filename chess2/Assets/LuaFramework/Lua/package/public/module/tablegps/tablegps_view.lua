
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableGPSView = Class('tableGPSView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function TableGPSView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/tablegps/public_tablegps.prefab", "Public_TableGPS", 1)

    self.buttonClose = GetComponentWithPath(self.root, "Center/Child/ImageBack", ComponentTypeName.Button)
    self.textTip = GetComponentWithPath(self.root, "Center/Child/ScrollViewTip/mask/TextTip", ComponentTypeName.Text)
    self.textDistance = GetComponentWithPath(self.root, "Center/Child/ScrollViewDistance/mask/TextDistance", ComponentTypeName.Text)
end

return TableGPSView