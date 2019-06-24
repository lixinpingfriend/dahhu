local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableYingKouMaJiangController
local TableYingKouMaJiangController = class('tableYingKouMaJiangController', Base)

--- 点击
function TableYingKouMaJiangController:on_click(obj, arg)
    if obj.name =="Button_Liang" then
        self:liang()
    elseif obj.name =="Liang_ZFB" then
        self.model:request_liang(1)
    elseif obj.name =="Liang_DNXB" then
        self.model:request_liang(2)
    else
        Base.on_click(self, obj, arg)
    end
end

function TableYingKouMaJiangController:liang()
    local gameState = self.module.gameState
    local liangTypeTable = {}
    for i=1,#gameState.ExtraDatas do
        local extraData = gameState.ExtraDatas[i]
        if 2 == extraData.ExtraID then
            liangTypeTable[#liangTypeTable + 1] = 1
        elseif 3 == extraData.ExtraID then
            liangTypeTable[#liangTypeTable + 1] = 2
        end
    end
    if 1 == #liangTypeTable then
        self.model:request_liang(liangTypeTable[1])
    else
        self.view:show_liang_grid(liangTypeTable)
    end
end

return TableYingKouMaJiangController