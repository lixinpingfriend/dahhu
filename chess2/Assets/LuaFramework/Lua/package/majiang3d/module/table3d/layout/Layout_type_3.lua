





local class = require("lib.middleclass")
local base = require("package.majiang3d.module.table3d.layout.Layout_type_1")

---@class MjTable3dlayout2:MjTable3dlayoutCommon
local layout3 = class('table3dView', base)

local Vector3 = Vector3

function layout3:Init(view)
    base.Init(self,view)
    self.view.myHandMjCam.orthographicSize = 0.042
    for i=1,#self.view.seatHolderArray do
        ---@type SeatHolder3D
        local seatHodler = self.view.seatHolderArray[i]
        if 1 == i then
            seatHodler.mj3dHodler.handMjTrans.localPosition = Vector3(24.7,30.4,-51.6)
            local pos = seatHodler.mj3dHodler.handMjTrans.localPosition
            if self.view.curWHRatio < self.view.originWHRatio then
                local magicOffset = 0.5 ---蜜汁常量，用来修正手牌和手牌摄像机之间存在夹角而他们又不在一个坐标系下导致偏移
                pos.y = pos.y  * (self.view.curWHRatio / self.view.originWHRatio) + magicOffset
            end
            seatHodler.mj3dHodler.handMjTrans.localPosition = pos
            seatHodler.mj3dHodler.xiaMjTrans.localPosition = Vector3(-37.7,-1,-27.47)
        elseif 2 == i then
            seatHodler.mj3dHodler.xiaMjTrans.localPosition = Vector3(-18,-1.1,-36.2)
        elseif 3 == i then
            seatHodler.mj3dHodler.xiaMjTrans.localPosition = Vector3(-33.01,-1,-34)
            seatHodler.mj3dHodler.handMjTrans.localPosition = Vector3(30.4,-0.07,-34.1)
        elseif 4 == i then
            seatHodler.mj3dHodler.xiaMjTrans.localPosition = Vector3(-28.9,-1,-37.26)
        end
    end
end

return layout3