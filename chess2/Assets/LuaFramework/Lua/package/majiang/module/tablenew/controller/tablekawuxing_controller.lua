





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableKaWuXingController:TableCommonController
---@field view TableKaWuXingView
local TableKaWuXingController = class('tableKuWuXingController', Base)
local ModuleCache = ModuleCache
local TableManager = TableManager

function TableKaWuXingController:show_mai_ma(gameState)
    local maiMa = self:get_mai_ma_data(gameState)
    if(#maiMa > 0) then
        local waitTime = 2.5
        if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
            waitTime = 0
        else
            self.view:play_hu_sound(gameState)
        end
        self.module:subscibe_time_event(waitTime, false, 0):OnComplete(function(t)
            if(self.module:can_show_result(gameState)) then
                local tablepop = ModuleCache.ModuleManager.show_module("majiang", "tablepop", gameState)
                tablepop.OnMaiMaComplateCallBack = function()
                    local roomType = self.module.view.roomType
                    roomType:on_show_one_game_result(gameState)
                end
            end
        end)
    else
        Base.show_mai_ma(self, gameState)
    end
end

---自动换桌
function TableKaWuXingController:auto_change_table(eventData)
    Base.auto_change_table(self, eventData)
    TableManager.kaWuXingPiao = eventData and eventData.xiaojiScore or 0
end

--- 点击
function TableKaWuXingController:on_click(obj, arg)
    if (obj.name == "ButtonBegin") then
        self.module:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy",{xiaojiScore = self.curTableData.kaWuXingPiao, paoScore = -1})
    elseif(obj.name == "Button_SelectDone") then
        self.selectLiangDone = true
        self.view:select_coverd_done()
        self.selectLiang = false
    elseif (obj.name == "Button_BuLiang") then
        self:cancel_liang()
    elseif obj.name =="Button_Liang" then
        self:liang_mj(obj)
    else
        Base.on_click(self, obj, arg)
    end
end

--- 点击我的手牌
function TableKaWuXingController:click_my_hand_mj(obj)
    if(self.selectLiang) then
        self.view:click_select_coverd(self.view:get_mj(obj).pai)
    else
        Base.click_my_hand_mj(self, obj)
    end
end

--- 取消亮
function TableKaWuXingController:cancel_liang()
    if(self.selectLiang) then
        self.view.selectLiangObj:SetActive(false)
    else
        self.view.buliangObj:SetActive(false)
    end
    self.view.waitAction:SetActive(true)
    self.view.actionGuo:SetActive(true)
    self.selectLiang = false
    self.view.isMidTing = false
    self.view:cancel_liang()
end

--- 亮牌
function TableKaWuXingController:liang_mj(obj)
    local gameState = self.module.gameState
    self.view.actionGuo:SetActive(false)
    self.view.waitAction:SetActive(false)
    if(#gameState.BuLiang > 0 and #gameState.KeLiang > 1) then
        self.selectLiang = true
        self.view.selectLiangGray:SetActive(false)
        self.view.selectLiangObj:SetActive(true)
        self.view:show_select_covered()
    else
        self.view:mid_ting_handle(true)
        self.view.buliangObj:SetActive(true)
    end
    self.view.isMidTing = true
    self.view:hide_select_card_childs()
end

--- 出牌
function TableKaWuXingController:out_mj(pai)
    if(not self.selectLiangDone) then
        self.view.selectKeZi = nil
    end
    self.selectLiangDone = false
    self.model:request_chu_mj(pai,self.view.isMidTing,self.view.selectKeZi)
    if(self.view.isMidTing) then
        self.view:mid_ting_handle(false)
        self.view.selectKeZi = {}
    end
end

function TableKaWuXingController:on_earlystart_ok()
    self.module:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy",{xiaojiScore = TableManager.curTableData.kaWuXingPiao, paoScore = -1})
end

return TableKaWuXingController