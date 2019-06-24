




local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableDongHaiView_3d:Table3dCommonView
local TableDongHaiView_3d = class('tableDongHaiView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

--- 可以显示过
function TableDongHaiView_3d:can_show_guo()
    return not self.actionHu.activeSelf
end

return TableDongHaiView_3d