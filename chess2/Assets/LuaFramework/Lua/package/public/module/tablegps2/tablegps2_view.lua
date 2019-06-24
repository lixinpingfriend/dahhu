
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableGPSView2 = Class('tableGPSView2', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

function TableGPSView2:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/tablegps2/public_tablegps2.prefab", "Public_TableGPS2", 1)

    self.buttonClose = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button)
    self.textTip = GetComponentWithSimple(self.root, "LabelTip", ComponentTypeName.Text)
    self.textDistance = GetComponentWithSimple(self.root, "LabelDistance", ComponentTypeName.Text)
end

return TableGPSView2