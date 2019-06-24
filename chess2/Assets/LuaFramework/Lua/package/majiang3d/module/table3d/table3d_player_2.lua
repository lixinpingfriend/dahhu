



local class = require("lib.middleclass")
local Base = require('package.majiang.module.table.table_player')
---@class Table3dPlayer2:TablePlayer
---@field view Table3dCommonView
local Table3dPlayer2 = class('table3dPlayer4', Base)

function Table3dPlayer2:update_seat_pointer()
    local masterSeat = 0
    local localZhuangJia = self.gData.TableUtil.get_local_seat(masterSeat, self.view.mySeat, self.view.totalSeat)
    for i=1,4 do
        local index = localZhuangJia + i - 1
        if(localZhuangJia == 1 and index ~= 1) then
            index = 3
        end
        if(localZhuangJia == 3 and index ~= 3) then
            index = 1
        end
        self.gData.ComponentUtil.SafeSetActive(self.view.pointerObjs[i], i <= self.totalSeat)
        if(i <= self.totalSeat) then
            self.view.pointerObjs[i].transform.localPosition = self.gData.pointerPos[index]
        end
    end
end

function Table3dPlayer2:pointer_is_light(localTargetSeat, index)
    return Base.pointer_is_light(self, ...) or (localTargetSeat == 3 and index == 2)
end

return  Table3dPlayer2