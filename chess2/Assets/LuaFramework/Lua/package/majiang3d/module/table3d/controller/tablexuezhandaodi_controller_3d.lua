local class = require("lib.middleclass")
---@type TableXueZhanDaoDiController
local Base = require('package.majiang.module.tablenew.controller.tablexuezhandaodi_controller')
---@class TableXueZhanDaoDiController_3d:TableXueZhanDaoDiController
local TableXueZhanDaoDiController_3d = class('tableXueZhanDaoDiController_3d', Base)


function  TableXueZhanDaoDiController_3d:initialize(module)
    Base.initialize(self,module)
    ---@type Mj3dHodler
    self.myMJ3DHodler = self.view.seatHolderArray[1].mj3dHodler
end

--- 点击我的手牌
function TableXueZhanDaoDiController_3d:click_my_hand_mj_3d(obj)
    if(self.waitHuanSanZ) then
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            ---@type Mj3d
            local mj3d = self.myMJ3DHodler:getMj3dByObj(obj)
            self.view:click_select(mj3d)
        end
    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjClick(obj)
        end
    end
end

function TableXueZhanDaoDiController_3d:press_my_hand_mj_3d(obj,state)
    if(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjPress(obj,state)
        end
    end
end

--- 拖动我的手牌
function TableXueZhanDaoDiController_3d:drag_my_hand_mj_3d(obj)
    if(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrag(obj)
        end
    end
end

--- 拖放我的手牌
function TableXueZhanDaoDiController_3d:drop_my_hand_mj_3d(obj,targetObj)
    if(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrop(obj,targetObj)
        end
    end
end

return TableXueZhanDaoDiController_3d