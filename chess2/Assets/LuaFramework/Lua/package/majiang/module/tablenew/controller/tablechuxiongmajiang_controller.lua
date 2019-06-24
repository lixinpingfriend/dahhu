local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableChuXiongController
local TableChuXiongController = class('tableChuXiongController', Base)

local ModuleCache = ModuleCache
local Time = UnityEngine.Time

--- 过牌
function TableChuXiongController:guo_mj()
    if self.view.lastShowActionWaitTime then
        if Time.time - self.view.lastShowActionWaitTime < 0.5 then  ---在每次显示过按钮之后，0.5秒内无视点击操作，防止玩家误操作
            return
        end
    end
    if self.lastGuoTime then  ---限制过操作的最短间隔时间
        local passTime = Time.time - self.lastGuoTime
        if passTime < 0.5 then
            return
        end
    end
    self.lastGuoTime = Time.time
    if self.view:can_hu() then
        self:guo_hu_action(function ()
            if(self.module.tingPaiState == 2) then
                self.tingPaiState = 0
                self.view:mid_ting_handle(false)
            end
            self.model:request_guo_mj()
            self.view:hide_wait_action_select_card()
        end)
    else
        self:guo_gang_action(function ()
            self.model:request_guo_mj()
            self.view:hide_wait_action_select_card()
        end)
    end
end

---出牌之前的检测
function TableChuXiongController:chu_mj_pre_check(callback,nocallback,mj)
    if(self.view.openGuoHu and self.view:can_hu()) then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确认放弃胡牌吗？"), function()
            if(callback) then
                callback()
            end
        end, function ()
            if nocallback then
                nocallback()
            end
        end)
    elseif self.view.openGuoHu and mj.isKeGang and not self.curRoundDontGuoGangActionCheck then
        local initData = {}
        initData.okCallBack = callback
        initData.noCallBack = nocallback
        initData.totelText = "过杠提示"
        local paiName = self.view.paiName[mj.pai]
        initData.contectText = [[您确认打出"]]..paiName..[["放弃杠牌吗？]]
        initData.checkBoxTex = "本局不再弹出此窗口"
        initData.onCheckBoxChange = function (isOn)
            if isOn then
                self.curRoundDontGuoGangActionCheck = true
            end
        end
        ModuleCache.ModuleManager.show_module("majiang", "guoaction",initData)
    elseif(callback) then
        callback()
    end
end

function TableChuXiongController:guo_gang_action(callback,nocallback,pai)
    if(self.view.openGuoHu 
        and self.view.actionGang.activeSelf and not self.curRoundDontGuoGangActionCheck) then
        local initData = {}
        initData.okCallBack = callback
        initData.noCallBack = nocallback
        initData.totelText = "过杠提示"
        initData.contectText = "您确认放弃本次杠牌吗？"
        initData.checkBoxTex = "本局不再弹出此窗口"
        initData.onCheckBoxChange = function (isOn)
            if isOn then
                self.curRoundDontGuoGangActionCheck = true
            end
        end
        ModuleCache.ModuleManager.show_module("majiang", "guoaction",initData)
    elseif(callback) then
        callback()
    end
end

function TableChuXiongController:on_reset_state()
    self.curRoundDontGuoGangActionCheck = false
end

return TableChuXiongController