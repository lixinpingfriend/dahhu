

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableDongHaiView:TableCommonView
local TableDongHaiView = class('tableDongHaiView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

--- 可以显示过
function TableDongHaiView:can_show_guo()
    return not self.actionHu.activeSelf
end

return  TableDongHaiView