




local class = require("lib.middleclass")
local base = require("package.majiang3d.module.table3d.layout.Layout_type_1")

---@class MjTable3dlayout2:MjTable3dlayoutCommon
local layout2 = class('table3dView', base)

local Vector3 = Vector3


function layout2:Init(view)
    self.view = view
    self.ConfigData = self.view.ConfigData

    self.handSpaceing = 2.63
    self.handMoZhangXOffset = 0.5

    self.huaMaxRowCount = 4
    self.huaXSpaceing = 2.64
    self.huaYSpaceing = 1.98

    ---处理不同人数下弃张的布局
    if 2 == self.view.totalSeat then
        self.thorwMjRowMaxCount = 12
    else
        self.thorwMjRowMaxCount = 8
    end

    self.throwMjColMaxCount = self.ConfigData.IsUse3dThrowUpLayout and 2 or 0

    for i=1,#self.view.seatHolderArray do
        ---@type SeatHolder3D
        local seatHodler = self.view.seatHolderArray[i]
        if 1 == i then
            seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-6.5,-0.95,-8.9)
            seatHodler.mj3dHodler.Throw.gameObject.transform.localScale = Vector3(1.35,1.35,1.35)

            seatHodler.mj3dHodler.huaTrans.localScale = Vector3(0.9,0.9,0.9)
            seatHodler.mj3dHodler.huaTrans.localPosition = Vector3(29.21,-0.78,-18.33)
        elseif 2 == i then
            seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-4.69,-0.95,-11.1)
            seatHodler.mj3dHodler.Throw.gameObject.transform.localScale = Vector3(1.3,1.3,1.3)

            seatHodler.mj3dHodler.xiaMjTrans.localPosition = Vector3(-18,-1,-36.2)
            seatHodler.mj3dHodler.xiaMjTrans.localScale = Vector3(1.35,1.35,1.35)

            seatHodler.mj3dHodler.huaTrans.localScale = Vector3(0.9,0.9,0.9)
            seatHodler.mj3dHodler.huaTrans.localPosition = Vector3(25.54,-0.78,-27.9)

        elseif 3 == i then
            seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-6.7,-0.95,-13.9)
            seatHodler.mj3dHodler.Throw.gameObject.transform.localScale = Vector3(1.35,1.35,1.35)

            seatHodler.mj3dHodler.xiaMjTrans.localPosition = Vector3(-24.35,-1,-34)

            seatHodler.mj3dHodler.huaTrans.localScale = Vector3(0.9,0.9,0.9)
            seatHodler.mj3dHodler.huaTrans.localPosition = Vector3(24.26,-0.78,-29.82)
        elseif 4 == i then
            seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-9.4,-0.95,-10.9)
            seatHodler.mj3dHodler.Throw.gameObject.transform.localScale = Vector3(1.35,1.35,1.35)

            seatHodler.mj3dHodler.xiaMjTrans.localPosition = Vector3(-28.9,-1,-37.26)
            seatHodler.mj3dHodler.xiaMjTrans.localScale = Vector3(1.3,1.3,1.3)

            seatHodler.mj3dHodler.huaTrans.localScale = Vector3(0.9,0.9,0.9)
            seatHodler.mj3dHodler.huaTrans.localPosition = Vector3(14.08,-0.78,-28.88)
        end
    end

    if 2 == self.view.totalSeat then
        for i=1,#self.view.seatHolderArray do
            ---@type SeatHolder3D
            local seatHodler = self.view.seatHolderArray[i]
            if 1 == i then
                seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-20.5,-0.95,-8.9)
            elseif 3 == i then
                seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-20.5,-0.95,-13.9)
            end
        end
    end
end

function layout2:ProcessLayoutHua(HuaPaiMj)
    for i=1,#HuaPaiMj do
        ---@type Mj3d
        local mj3d = HuaPaiMj[i]
        mj3d:setMj3Active(false)
    end
end

function layout2:ProcessLayoutThrow(Throw)
    Throw:processLayout(self.thorwMjRowMaxCount,self.throwMjColMaxCount)
end

return layout2