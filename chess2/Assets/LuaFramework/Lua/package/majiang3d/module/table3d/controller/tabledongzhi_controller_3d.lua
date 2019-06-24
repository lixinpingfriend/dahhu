

local class = require("lib.middleclass")
---@type TableDongZhiController
local Base = require('package.majiang.module.tablenew.controller.tabledongzhi_controller')
---@class TableDongZhiController_3d:TableDongZhiController
---@field view TableDongZhiView_3d
local TableDongZhiController_3d = class('tableDongZhiController_3d', Base)

function  TableDongZhiController_3d:initialize(module)
    Base.initialize(self,module)
    ---@type Mj3dHodler
    self.myMJ3DHodler = self.view.seatHolderArray[1].mj3dHodler
end

function TableDongZhiController_3d:on_click_pao_quan_mj(clickMj3d)
    ---@type Mj3dHodler
    local myHandMj =  self.myMJ3DHodler.HandMj
    for i=1,#myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        if 1 == mj3d.isReadyPaoFeng and mj3d == clickMj3d then
            mj3d.isReadyPaoFeng = 2
        elseif 2 == mj3d.isReadyPaoFeng and mj3d == clickMj3d then
            self:request_paoquan(mj3d:Pai())
        else
            mj3d.isReadyPaoFeng = 1
        end
    end
end

function TableDongZhiController_3d:click_my_hand_mj_3d(obj)
    if(self.view.isPaoFengState) then
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            ---@type Mj3d
            local mj3d = self.myMJ3DHodler:getMj3dByObj(obj)
            self:on_click_pao_quan_mj(mj3d)
        end
    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjClick(obj)
        end
    end
end

function TableDongZhiController_3d:press_my_hand_mj_3d(obj,state)
    if(self.view.isPaoFengState) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjPress(obj,state)
        end
    end
end

function  TableDongZhiController_3d:drag_my_hand_mj_3d(obj)
    if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
        self.myMJ3DHodler:onHandMjDrag(obj)
    end
end

function TableDongZhiController_3d:drop_my_hand_mj_3d(obj,targetObj)
    if self.view.isPaoFengState then
        local myHandMj = self.myMJ3DHodler.HandMj
        for i=1,#myHandMj do
            ---@type Mj3d
            local mj3d = myHandMj[i]
            if (1 == mj3d.isReadyPaoFeng or 2 == mj3d.isReadyPaoFeng) and mj3d.gameObject == obj then
                self:request_paoquan(mj3d:Pai())
            end
        end
    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrop(obj,targetObj,function ()
                self:out_mj(self.myMJ3DHodler:getMj3dByObj(obj):Pai())
            end)
        end
    end
end

return TableDongZhiController_3d
