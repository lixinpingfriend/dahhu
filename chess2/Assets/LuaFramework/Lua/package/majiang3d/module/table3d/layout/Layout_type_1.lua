




local class = require("lib.middleclass")

---@class MjTable3dlayoutCommon
local layoutCommon = class("mjTable3dlayoutCommon")

local Vector3 = Vector3

function layoutCommon:Init(view)
    self.view = view
    self.ConfigData = self.view.ConfigData

    self.handSpaceing = 2.63
    self.handMoZhangXOffset = 0.5

    self.huaMaxRowCount = 4
    self.huaXSpaceing = -2.64
    self.huaZSpaceing = 3.65

    ---处理不同人数下弃张的布局
    if 2 == self.view.totalSeat then
        self.huaXSpaceing = 2.64
        self.thorwMjRowMaxCount = 13
        for i=1,#self.view.seatHolderArray do
            ---@type SeatHolder3D
            local seatHodler = self.view.seatHolderArray[i]
            if 1 == i then
                seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-20.5,-0.95,-8.19)
                seatHodler.mj3dHodler.huaTrans.localPosition = Vector3(29.5,-0.78,-16.01)
            elseif 3 == i then
                seatHodler.mj3dHodler.Throw.gameObject.transform.localPosition = Vector3(-20.5,-0.95,-12.6)
                seatHodler.mj3dHodler.huaTrans.localPosition = Vector3(28.94,-0.78,-22.3)
            end
        end
    else
        self.thorwMjRowMaxCount = 5
    end
    self.throwMjColMaxCount = self.ConfigData.IsUse3dThrowUpLayout and 3 or 0
end

function layoutCommon:ProcessDunLayout(mj3dDun)

end

function layoutCommon:ProcessLayoutHand(hasMoZhang,HandMj)
    local count = 0
    for i = #HandMj,1,-1 do
        local mj3d = HandMj[i]
        local pos = Vector3.zero
        pos.x = -self.handSpaceing * (hasMoZhang and count or count + 1)
        if hasMoZhang and i == #HandMj then
            pos.x = pos.x + self.handMoZhangXOffset
        end
        mj3d.gameObject.transform.localPosition = pos
        count = count + 1
    end
end

function layoutCommon:ProcessLayoutKan(Kan)
    local kan = Kan
    local xoffset = 0
    for i=1,#kan do
        local mj3dKan = kan[i]
        local kanSpaceing = mj3dKan.xSpaceing
        mj3dKan.gameObject.transform.localPosition = Vector3.New(xoffset,0,0)
        xoffset = xoffset + kanSpaceing
    end
end

function layoutCommon:ProcessLayoutHua(HuaPaiMj)
    local curRowCount = 0
    local lineCount = 0
    for i=1,#HuaPaiMj do
        if curRowCount >= self.huaMaxRowCount then
            curRowCount = 0
            lineCount = lineCount + 1
        end
        local mj3d = HuaPaiMj[i]
        mj3d.gameObject.transform.localPosition = Vector3.New(self.huaXSpaceing * curRowCount,0,self.huaZSpaceing * lineCount)
        curRowCount = curRowCount + 1
    end
end

function layoutCommon:ProcessLayoutThrow(Throw)
    Throw:processLayout(self.thorwMjRowMaxCount,self.throwMjColMaxCount)
end

return layoutCommon