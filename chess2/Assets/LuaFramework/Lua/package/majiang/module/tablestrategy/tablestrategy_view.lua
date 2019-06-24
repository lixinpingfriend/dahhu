
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableStrategyView = Class('tableStrategyView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

function TableStrategyView:initialize(...)
    -- 初始View
    View.initialize(self, "majiang/module/tablestrategy/henanmj_tablestrategy.prefab", "HeNanMJ_TableStrategy", 1)

    self.gameTypePanel = {}
    self.toggles = {}
    self:init_DZMJ_about()
    self:init_AQHN_about()
    self:init_HN_about()
    self.textTimeDown = GetComponentWithPath(self.root, "Center/Text", ComponentTypeName.Text)
end

function TableStrategyView:init_DZMJ_about()
    self.dzmjPanel = GetComponentWithPath(self.root, "Center/DZMJ", ComponentTypeName.Transform).gameObject
    table.insert(self.gameTypePanel,self.dzmjPanel)
    local selectObj = GetComponentWithPath(self.dzmjPanel, "Selects", ComponentTypeName.Transform).gameObject
    self.diTuoToggle = {}
    self.diTuoToggle[1] = GetComponentWithPath(selectObj, "DiTuo/Image/DiTuo", ComponentTypeName.Toggle)
    self.diceToggle = {}
    self.diceToggle[1] = GetComponentWithPath(selectObj, "ResetDice/ResetDice", ComponentTypeName.Toggle)
    self.frontToggle = {}
    self.frontToggle[1] = GetComponentWithPath(selectObj, "Image/FrontPiao/10", ComponentTypeName.Toggle)
    self.frontToggle[2] = GetComponentWithPath(selectObj, "Image/FrontPiao/20", ComponentTypeName.Toggle)
    self.backToggle = {}
    self.backToggle[1] = GetComponentWithPath(selectObj, "Image/BackPiao/10", ComponentTypeName.Toggle)
    self.backToggle[2] = GetComponentWithPath(selectObj, "Image/BackPiao/20", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.diTuoToggle)
    table.insert(self.toggles, self.diceToggle)
    table.insert(self.toggles, self.frontToggle)
    table.insert(self.toggles, self.backToggle)
    self.diTuo = GetComponentWithPath(self.dzmjPanel, "Selects/DiTuo/Image/DiTuo/textTitle", ComponentTypeName.Text)
end

function TableStrategyView:init_AQHN_about()
    self.aqhnPanel = GetComponentWithPath(self.root, "Center/AQHN", ComponentTypeName.Transform).gameObject
    table.insert(self.gameTypePanel,self.aqhnPanel)
    local selectObj = GetComponentWithPath(self.aqhnPanel, "Selects", ComponentTypeName.Transform).gameObject

    self.aqhm_DanDiao = {}
    self.aqhm_DanDiao[1] = GetComponentWithPath(selectObj, "HuFa/Image/DanDiao", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.aqhm_DanDiao)
    self.aqhm_ZiMo = {}
    self.aqhm_ZiMo[1] = GetComponentWithPath(selectObj, "HuFa/Image/ZiMo", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.aqhm_ZiMo)
    self.aqhm_QueMen = {}
    self.aqhm_QueMen[1] = GetComponentWithPath(selectObj, "HuFa/Image/QueMen", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.aqhm_QueMen)

    self.aqhm_XiaZero = {}
    self.aqhm_XiaZero[1] = GetComponentWithPath(selectObj, "Piao/Image/XiaZero", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.aqhm_XiaZero)
    self.aqhm_XiaOne = {}
    self.aqhm_XiaOne[1] = GetComponentWithPath(selectObj, "Piao/Image/XiaOne", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.aqhm_XiaOne)
    self.aqhm_XiaTwo = {}
    self.aqhm_XiaTwo[1] = GetComponentWithPath(selectObj, "Piao/Image/XiaTwo", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.aqhm_XiaTwo)
end

function TableStrategyView:init_HN_about()
    self.hnPanel = GetComponentWithPath(self.root, "Center/HN", ComponentTypeName.Transform).gameObject
    table.insert(self.gameTypePanel,self.hnPanel)
    local selectObj = GetComponentWithPath(self.hnPanel, "Selects", ComponentTypeName.Transform).gameObject

    self.hn_DanDiao = {}
    self.hn_DanDiao[1] = GetComponentWithPath(selectObj, "HuFa/Image/DanDiao", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.hn_DanDiao)
    self.hn_ZiMo = {}
    self.hn_ZiMo[1] = GetComponentWithPath(selectObj, "HuFa/Image/ZiMo", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.hn_ZiMo)
    self.hn_QueMen = {}
    self.hn_QueMen[1] = GetComponentWithPath(selectObj, "HuFa/Image/QueMen", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.hn_QueMen)

    self.hn_XiaZero = {}
    self.hn_XiaZero[1] = GetComponentWithPath(selectObj, "Piao/Image/XiaZero", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.hn_XiaZero)
    self.hn_XiaOne = {}
    self.hn_XiaOne[1] = GetComponentWithPath(selectObj, "Piao/Image/XiaOne", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.hn_XiaOne)
    self.hn_XiaTwo = {}
    self.hn_XiaTwo[1] = GetComponentWithPath(selectObj, "Piao/Image/XiaTwo", ComponentTypeName.Toggle)
    table.insert(self.toggles, self.hn_XiaTwo)
end

function TableStrategyView:refresh_dice_toggle()
    self.diceToggle[1].interactable = self.diTuoToggle[1].isOn
    local selectObj = GetComponentWithPath(self.diceToggle[1].gameObject, "bg/select", ComponentTypeName.Image).gameObject
    local grayObj = GetComponentWithPath(self.diceToggle[1].gameObject, "bg/gray", ComponentTypeName.Image).gameObject
    ComponentUtil.SafeSetActive(selectObj, self.diTuoToggle[1].isOn)
    ComponentUtil.SafeSetActive(grayObj, not self.diTuoToggle[1].isOn)
end

function TableStrategyView:update_beat(timeDown)
    self.textTimeDown.text =  string.format("等待其他玩家选择，<color=#b13a1f><size=30>%s</size></color> 秒后自动开始", timeDown)
end

function TableStrategyView:get_send_data()
    if self.gameName == "DZMJ" then
        local sendData = {}
        sendData.DiTuo = self.diTuoToggle[1].isOn
        sendData.xiaojiScore = 0
        sendData.paoScore = 0
        if(self.frontToggle[1].isOn) then
            sendData.xiaojiScore = 10
        elseif(self.frontToggle[2].isOn) then
            sendData.xiaojiScore = 20
        end
        if(self.backToggle[1].isOn) then
            sendData.paoScore = 10
        elseif(self.backToggle[2].isOn) then
            sendData.paoScore = 20
        end
        return sendData
    elseif self.gameName == "AQHN"then
        local sendData = {}
        sendData.xiaojiScore = 0
        sendData.paoScore = 0

        if(self.aqhm_DanDiao[1].isOn) then
            sendData.paoScore = 1
        elseif(self.aqhm_ZiMo[1].isOn) then
            sendData.paoScore = 0
        elseif(self.aqhm_QueMen[1].isOn) then
            sendData.paoScore = 2
        end
        if(self.aqhm_XiaZero[1].isOn) then
            sendData.xiaojiScore = 0
        elseif(self.aqhm_XiaOne[1].isOn) then
            sendData.xiaojiScore = 1
        elseif(self.aqhm_XiaTwo[1].isOn) then
            sendData.xiaojiScore = 2
        end
        return sendData
    elseif self.gameName == "HN" then
        local sendData = {}
        sendData.xiaojiScore = 0
        sendData.paoScore = 0

        if(self.hn_DanDiao[1].isOn) then
            sendData.paoScore = 1
        elseif(self.hn_ZiMo[1].isOn) then
            sendData.paoScore = 0
        elseif(self.hn_QueMen[1].isOn) then
            sendData.paoScore = 2
        end
        if(self.hn_XiaZero[1].isOn) then
            sendData.xiaojiScore = 0
        elseif(self.hn_XiaOne[1].isOn) then
            sendData.xiaojiScore = 1
        elseif(self.hn_XiaTwo[1].isOn) then
            sendData.xiaojiScore = 2
        end
        return sendData
    end
end

return TableStrategyView