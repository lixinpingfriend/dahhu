




local class = require("lib.middleclass")
---@type TableXueLiuChengHeController
local Base = require('package.majiang.module.tablenew.controller.tablexueliuchenghe_controller')
---@class TableXueLiuChengHe3dController:TableXueLiuChengHeController
local TableXueLiuChengHe3dController = class('tableXueLiuChengHe3dController', Base)


function  TableXueLiuChengHe3dController:initialize(module)
    Base.initialize(self,module)
    ---@type Mj3dHodler
    self.myMJ3DHodler = self.view.seatHolderArray[1].mj3dHodler
end

--- 点击我的手牌
function TableXueLiuChengHe3dController:click_my_hand_mj_3d(obj)
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

function TableXueLiuChengHe3dController:press_my_hand_mj_3d(obj,state)
    if(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjPress(obj,state)
        end
    end
end

--- 拖动我的手牌
function TableXueLiuChengHe3dController:drag_my_hand_mj_3d(obj)
    if(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrag(obj)
        end
    end
end

--- 拖放我的手牌
function TableXueLiuChengHe3dController:drop_my_hand_mj_3d(obj,targetObj)
    if(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrop(obj,targetObj)
        end
    end
end

return TableXueLiuChengHe3dController