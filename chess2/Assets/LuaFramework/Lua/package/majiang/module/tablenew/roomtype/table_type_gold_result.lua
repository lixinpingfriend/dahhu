

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.roomtype.table_type_gold')
---@class TableTypeGoldResult:TableTypeGold
---@field view TableCommonView
local TableTypeGoldResult = class('tableTypeGoldResult', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil

---刷新3D模式推荐按钮状态
function TableTypeGoldResult:on_refresh_goto3d_button_state()
    ComponentUtil.SafeSetActive(self.view.buttonGoTo3d,false)
    ComponentUtil.SafeSetActive(self.view.maskGoTo3d,false)
end

return  TableTypeGoldResult