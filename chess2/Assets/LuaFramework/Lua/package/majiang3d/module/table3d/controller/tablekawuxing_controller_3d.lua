





local class = require("lib.middleclass")
---@type TableKaWuXingController
local Base = require('package.majiang.module.tablenew.controller.tablekawuxing_controller')
---@class TableKaWuXing3dController:TableKaWuXingController
local TableKaWuXing3dController = class('tableKaWuXing3dController', Base)

function  TableKaWuXing3dController:initialize(module)
    Base.initialize(self,module)
    ---@type Mj3dHodler
    self.myMJ3DHodler = self.view.seatHolderArray[1].mj3dHodler
end

--- 点击我的手牌
function TableKaWuXing3dController:click_my_hand_mj_3d(obj)
    if(self.selectLiang) then
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            ---@type Mj3d
            local mj3d = self.myMJ3DHodler:getMj3dByObj(obj)
            self.view:click_select_coverd(mj3d:Pai())
        end
    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjClick(obj,function ()
                self:out_mj(self.myMJ3DHodler:getMj3dByObj(obj):Pai())
            end)
        end
    end
end

function TableKaWuXing3dController:press_my_hand_mj_3d(obj,state)
    if(self.selectLiang) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjPress(obj,state)
        end
    end
end

--- 拖动我的手牌
function TableKaWuXing3dController:drag_my_hand_mj_3d(obj)
    if(self.selectLiang) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrag(obj)
        end
    end
end

--- 拖放我的手牌
function TableKaWuXing3dController:drop_my_hand_mj_3d(obj,targetObj)
    if(self.selectLiang) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrop(obj,targetObj,function ()
                self:out_mj(self.myMJ3DHodler:getMj3dByObj(obj):Pai())
            end)
        end
    end
end


return TableKaWuXing3dController