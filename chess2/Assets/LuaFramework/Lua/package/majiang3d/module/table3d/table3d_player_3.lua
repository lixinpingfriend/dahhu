



local class = require("lib.middleclass")
local Base = require('package.majiang.module.table.table_player')
---@class Table3dPlayer3:TablePlayer
---@field view Table3dCommonView
local Table3dPlayer3 = class('table3dPlayer4', Base)

function Table3dPlayer3:update_seat_pointer()
    local masterSeat = 0
    local addNum = 0
    local localZhuangJia = self.gData.TableUtil.get_local_seat(masterSeat, self.view.mySeat, self.view.totalSeat)
    for i=1,4 do
        local index = localZhuangJia + i - 1
        self.gData.ComponentUtil.SafeSetActive(self.view.pointerObjs[i], i <= self.view.totalSeat)
        if(i<=self.view.totalSeat) then
            if(index == 3) then
                addNum = 1
            end
            index = index + addNum
            if(index > 4) then
                index = index - 4
            end
            self.view.pointerObjs[i].transform.localPosition = self.gData.pointerPos[index]
        end
    end
end

function Table3dPlayer3:pointer_is_light(localTargetSeat, index)
    return Base.pointer_is_light(self, ...) or (localTargetSeat == 4 and index == 3)
end

return  Table3dPlayer3