
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
---@class TablePop2View
local TablePop2View = Class('tablePop2View', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function TablePop2View:initialize(...)
    -- 初始View
    View.initialize(self, "majiang/module/tablepop2/henanmj_tablepop2.prefab", "HeNanMJ_TablePop2", 1)
    self.xiaoji = GetComponentWithPath(self.root, "Center/Panel/Selects/XiaoJi", ComponentTypeName.Transform).gameObject
    self.pao = GetComponentWithPath(self.root, "Center/Panel/Selects/Pao", ComponentTypeName.Transform).gameObject
    self.xiaojiToggle = {}
    for i = 1, 3 do
        self.xiaojiToggle[i] = {}
        self.xiaojiToggle[i].toggle = GetComponentWithPath(self.root, "Center/Panel/Selects/XiaoJi/Group/" .. (i - 1), ComponentTypeName.Toggle)
        self.xiaojiToggle[i].text = GetComponentWithPath(self.xiaojiToggle[i].toggle.gameObject, "bg/text", ComponentTypeName.Text)
    end
    self.paoToggle = {}
    for i = 1, 3 do
        self.paoToggle[i] = {}
        self.paoToggle[i].toggle = GetComponentWithPath(self.root, "Center/Panel/Selects/Pao/Group/" .. (i - 1), ComponentTypeName.Toggle)
        self.paoToggle[i].text = GetComponentWithPath(self.paoToggle[i].toggle.gameObject, "bg/text", ComponentTypeName.Text)
    end
    self.toggles = {}
    table.insert(self.toggles, self.xiaojiToggle)
    table.insert(self.toggles, self.paoToggle)
    self.textTimeDown = GetComponentWithPath(self.root, "Center/Panel/Text", ComponentTypeName.Text)
    self.textXiaoJiTitle = GetComponentWithPath(self.root, "Center/Panel/Selects/XiaoJi/Group/textTitle", ComponentTypeName.Text)
    self.textPaoTitle = GetComponentWithPath(self.root, "Center/Panel/Selects/Pao/Group/textTitle", ComponentTypeName.Text)
    local config = TableManager.curTableData.gameRuleConfig
    local wanfaType = Config.GetWanfaIdx(TableManager.curTableData.ruleJsonInfo.GameType)
    if(wanfaType > #config.createRoomTable) then
        wanfaType = 1
    end
    self.ConfigData = config.createRoomTable[wanfaType]
end

function TablePop2View:get_send_data()
    local sendData = {}
    sendData.xiaojiScore = 0
    sendData.paoScore = 0
    if(self.xiaoji.activeSelf)  then
        if(self.xiaojiToggle[1].toggle.isOn) then
            sendData.xiaojiScore = 0
        elseif(self.xiaojiToggle[2].toggle.isOn) then
            sendData.xiaojiScore = 1
        elseif(self.xiaojiToggle[3].toggle.isOn) then
            sendData.xiaojiScore = 2
        end
    else
        sendData.xiaojiScore = -1
    end
    if(self.pao.activeSelf) then
        if(self.paoToggle[1].toggle.isOn) then
            sendData.paoScore = 0
        elseif(self.paoToggle[2].toggle.isOn) then
            sendData.paoScore = 1
        elseif(self.paoToggle[3].toggle.isOn) then
            sendData.paoScore = 2
        end
    else
        sendData.paoScore = -1
    end
    return sendData
end

return TablePop2View