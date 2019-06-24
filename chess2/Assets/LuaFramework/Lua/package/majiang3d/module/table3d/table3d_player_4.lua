



local class = require("lib.middleclass")
local Base = require('package.majiang.module.table.table_player')
---@class Table3dPlayer4:TablePlayer
---@field view Table3dCommonView
local Table3dPlayer4 = class('table3dPlayer4', Base)

function Table3dPlayer4:update_seat_pointer()
    local masterSeat = 0
    local localZhuangJia = TableUtil.get_local_seat(masterSeat, self.view.mySeat, self.view.totalSeat)
    for i=1,4 do
        local index = localZhuangJia + i - 1
        if(index > 4) then
            index = index - 4
        end
        self.view.pointerObjs[i].transform.localPosition = pointerPos[index]
    end
end

return  Table3dPlayer4