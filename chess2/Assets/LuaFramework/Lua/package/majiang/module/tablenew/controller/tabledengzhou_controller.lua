





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableDengZhouController
local TableDengZhouController = class('tableDengZhouController', Base)

--- 点击
function TableDengZhouController:on_click(obj, arg)
    if (obj.name == "Button_Diao") then
        self:diao_mj(self.module.gameState.KeDiaoDui[1])
    else
        Base.on_click(self, obj, arg)
    end
end

--- 钓对
function TableDengZhouController:diao_mj(pai)
    print("123123123123123")
    self:guo_hu_action(function ()
        print("456456456456456546")
        self.model:request_diao_dui(pai)
        self.view:hide_wait_action_select_card()
    end)
end

return TableDengZhouController