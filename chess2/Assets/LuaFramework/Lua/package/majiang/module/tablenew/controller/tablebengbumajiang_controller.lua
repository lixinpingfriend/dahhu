local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableBengBuMaJiangController
local TableBengBuMaJiangController = class('tableBengBuMaJiangController', Base)
local ModuleCache = ModuleCache

--- 点击
function TableBengBuMaJiangController:on_click(obj, arg)
    if self.module.view and obj == self.module.view.actionCancel then
        self:cancel_mj(obj)
    else
        Base.on_click(self, obj, arg)
    end
end

--- 听
function TableBengBuMaJiangController:ting_mj(obj)
    self:guo_hu_action(function ()
        if self.module.tingPaiState == 1 then --- tingPaiState = 1 开局可听    tingPaiState = 2 牌局过程中的可以听
            self.model:request_kai_ju_ting_mj()
            self.view:hide_wait_action_select_card()
        elseif self.module.tingPaiState == 2 then
            self.view:mid_ting_handle(true)
            obj:SetActive(false)
            self.view.waitAction:SetActive(false)
            self.view.actionGuo:SetActive(false)
            self.module.view.actionCancel:SetActive(true)
        end
    end)
end

function TableBengBuMaJiangController:cancel_mj(obj)
    obj:SetActive(false)
    if self.module.view.isMidTing then
        self.module.view:mid_ting_handle(false)
        self.view.actionTing:SetActive(true)
        self.view.actionGuo:SetActive(true)
        self.view.waitAction:SetActive(true)
    end
end

return TableBengBuMaJiangController