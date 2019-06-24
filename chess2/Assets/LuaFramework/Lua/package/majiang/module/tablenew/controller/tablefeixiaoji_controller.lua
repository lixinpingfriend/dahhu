





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableFeiXiaoJiController
local TableFeiXiaoJiController = class('tableFeiXiaoJiController', Base)

--- 点击
function TableFeiXiaoJiController:on_click(obj, arg)
    if (string.sub(obj.name, 1, 7) == "BuZhang") then
        local array = string.split(obj.name, "_")
        self.model:request_buzhang_mj(self.module.gameState.KeBuZhang[tonumber(array[2])])
    else
        Base.on_click(self, obj, arg)
    end
end

return TableFeiXiaoJiController