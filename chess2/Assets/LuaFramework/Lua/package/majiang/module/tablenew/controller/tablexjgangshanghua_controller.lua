





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableXJGangShangHuaController
local TableXJGangShangHuaController = class('tableXJGangShangHuaController', Base)

--- 点击
function TableXJGangShangHuaController:on_click(obj, arg)
    if (obj.name == "Button_YaHu") then
        self.model:request_yahu_mj()
        self.view:hide_wait_action_select_card()
    else
        Base.on_click(self, obj, arg)
    end
end

return TableXJGangShangHuaController