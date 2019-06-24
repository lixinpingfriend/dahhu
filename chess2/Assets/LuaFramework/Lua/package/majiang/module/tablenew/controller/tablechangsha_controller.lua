





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableChangShaController:TableCommonController
---@field view TableChangShaView
local TableChangShaController = class('tableChangShaController', Base)

--- 点击
function TableChangShaController:on_click(obj, arg)
    if(obj.name == "Button_BuHua") then
        Base.gang_mj(self)
    elseif(string.sub(obj.name, 1, 8) == "ButtonCS") then
        local array = string.split(obj.name, "_")
        local actionType = tonumber(array[2])
        local actionPai = tonumber(array[3])
        if(actionType == 1) then
            local chiList = self.view:ke_chi_kai_gang(actionPai)
            if(#chiList == 1) then
                self:chi_mj(actionPai, chiList[1])
            else
                self.view:show_select_card_kai_gang(obj.transform.parent.parent.gameObject)
            end
        elseif(actionType == 2) then
            self:peng_mj(actionPai)
        elseif(actionType == 3) then
            self:gang_mj(actionPai)
        elseif(actionType == 4) then
            Base.gang_mj(self, actionPai)
        elseif(actionType == 5) then
            self:hu_mj()
        end
    elseif (obj.name == "Button_HaiDi") then
        self.model:request_mopai_mj()
    elseif(string.sub(obj.name, 1, 4) == "CSHu") then
        local array = string.split(obj.name, "_")
        self.model:request_hu_mj(tonumber(array[2]))
        self.view:hide_wait_action_select_card()
    elseif(obj.name == "BtnNoSelectCardCS") then
        obj.transform.parent.gameObject:SetActive(false)
    elseif(string.sub(obj.name, 1, 7) == "BuZhang") then
        local array = string.split(obj.name, "_")
        self.model:request_buzhang_mj(self.gameState.KeBuZhang[tonumber(array[2])])
    else
        Base.on_click(self, obj, arg)
    end
end

--- 杠牌（长沙开杠）
function TableChangShaController:gang_mj()
    if (#self.module.gameState.KeKaiGang2 == 1) then
        self:gang_one_mj(self.module.gameState.KeKaiGang2[1],true)
    else
        self.view:show_kai_gang_grid()
    end
end

--- 杠单个牌
function TableChangShaController:gang_one_mj(pai,isKaiGang)
    if isKaiGang then
        self:guo_hu_action(function ()
            self.model:request_kaigang_mj(pai)
            self.view:hide_wait_action_select_card()
            self.view:hide_ting_hu_grid()
        end)
    else
        Base.gang_one_mj(self,pai)
    end
end

return TableChangShaController