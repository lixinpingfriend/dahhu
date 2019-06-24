





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableHuangShiHHController
local TableEnShiMJController = class('tableEnShiMJController', Base)
local ModuleCache = ModuleCache

--- 点击
function TableEnShiMJController:on_click(obj, arg)
    if obj.name =="Button_Liang" then
        self.model:request_liang()
    else
        Base.on_click(self, obj, arg)
    end
end

return TableEnShiMJController