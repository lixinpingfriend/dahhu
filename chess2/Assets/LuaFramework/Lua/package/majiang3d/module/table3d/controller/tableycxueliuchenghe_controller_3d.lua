---宜昌血流成河 controller
local class = require("lib.middleclass")
---@type TableYCXueLiuChengHeController
local Base = require('package.majiang.module.tablenew.controller.tableycxueliuchenghe_controller')
---@class TableYCXueLiuChengHe3dController:TableYCXueLiuChengHeController
local TableYCXueLiuChengHe3dController = class('tableYCXueLiuChengHe3dController', Base)

function TableYCXueLiuChengHe3dController:initialize(module)
    Base.initialize(self,module)
    ---@type Mj3dHodler
    self.myMJ3DHodler = self.view.seatHolderArray[1].mj3dHodler
end

--- 点击我的手牌
function TableYCXueLiuChengHe3dController:click_my_hand_mj_3d(obj)
    if(self.waitQiSanZ) then
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            ---@type Mj3d
            local mj3d = self.myMJ3DHodler:getMj3dByObj(obj)
            self.view:qisanzhang_click_select(mj3d)
        end
    elseif(self.waitHuanSanZ) then
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

function TableYCXueLiuChengHe3dController:press_my_hand_mj_3d(obj,state)
    if(self.waitQiSanZ) then

    elseif(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjPress(obj,state)
        end
    end
end

--- 拖动我的手牌
function TableYCXueLiuChengHe3dController:drag_my_hand_mj_3d(obj)
    if(self.waitQiSanZ) then

    elseif(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrag(obj)
        end
    end
end

--- 拖放我的手牌
function TableYCXueLiuChengHe3dController:drop_my_hand_mj_3d(obj,targetObj)
    if(self.waitQiSanZ) then

    elseif(self.waitHuanSanZ) then

    else
        if obj.transform.parent == self.myMJ3DHodler.handMjTrans then
            self.myMJ3DHodler:onHandMjDrop(obj,targetObj)
        end
    end
end

return TableYCXueLiuChengHe3dController