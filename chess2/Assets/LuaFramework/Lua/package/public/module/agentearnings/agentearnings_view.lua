local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local GridEx = require('package.public.module.gridex.grid_ex')
local Manager = require("package.public.module.function_manager")
-- ==========================================================================
---@class AgentEarningsView
local AgentEarningsView = Class('AgentEarningsView', View)
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function AgentEarningsView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/agentearnings/public_agentearnings.prefab", "Public_AgentEarnings", 1)
    -- 初始View
    View.set_1080p(self)

    self.todayRecharge = GetComponentWithPath(self.root,"Top/TodayRecharge/Count",ComponentTypeName.Text) --今日充钻返佣
    self.todayParty = GetComponentWithPath(self.root,"Top/TodayParty/Count",ComponentTypeName.Text)   --今日牌局返佣
    self.todayEarnings = GetComponentWithPath(self.root,"Top/TodayEarnings/Count",ComponentTypeName.Text) --今日收益
    self.balance = GetComponentWithPath(self.root,"Top/Balance/Count",ComponentTypeName.Text) -- 账户余额

    self.btnLast =  GetComponentWithPath(self.root, "Center/FanYe/LastBtn", ComponentTypeName.Button)
    self.lastGray =  GetComponentWithPath(self.root, "Center/FanYe/LastBtn/Gray", ComponentTypeName.Transform).gameObject
    self.btnNext =  GetComponentWithPath(self.root, "Center/FanYe/NextBtn", ComponentTypeName.Button)
    self.nextGray =  GetComponentWithPath(self.root, "Center/FanYe/NextBtn/Gray", ComponentTypeName.Transform).gameObject
    self.btnYeLab =  GetComponentWithPath(self.root, "Center/FanYe/Text", ComponentTypeName.Text)

    self.togglesContents = TableUtil.get_all_child(GetComponentWithPath(self.root, "Center/Toggles", ComponentTypeName.Transform))
    self.toggles = {}
    self.switchers = {}
    for k, v in ipairs(self.togglesContents) do
        self.switchers[tonumber(v.name)] = ModuleCache.ComponentManager.GetComponent(v.gameObject, "UIStateSwitcher")
        self.toggles[tonumber(v.name)] = ModuleCache.ComponentManager.GetComponent(v.gameObject, ComponentTypeName.Toggle)
    end

    local panels = TableUtil.get_all_child(GetComponentWithPath(self.root, "Center/Panels", ComponentTypeName.Transform))
    self.panelTable = {}
    for k, v in ipairs(panels) do
        self.panelTable[tonumber(v.name)] = GetComponentWithPath(self.root, "Center/Panels/" .. v.name, ComponentTypeName.Transform).gameObject
    end
    self:initPanel()
end

function AgentEarningsView:showBaseInfo(baseData)
    self.balance.text = baseData.commissionAmount
    self.todayParty.text = baseData.todayRoomRewardAmount
    self.todayEarnings.text =  baseData.todayRewardAmount
    self.todayRecharge.text = baseData.todayOrderRewardAmount
end

--初始化panel
function AgentEarningsView:initPanel()
    local itemView = require("package.public.module.agentearnings.data_item_view")
    for pageCount, _ in pairs(self.panelTable) do
        local scrollView = GetComponentWithPath(self.panelTable[pageCount], "ScrollView", ComponentTypeName.Transform).gameObject
        local itemObj = GetComponentWithPath(self.panelTable[pageCount], "DataItem", ComponentTypeName.Transform).gameObject
        if self.GridExs == nil then self.GridExs = {} end
        self.GridExs[pageCount] = GridEx:new(scrollView, {useLoopItems = false, useClickEvent = false, layoutGroupMode = 1})
        self.GridExs[pageCount]:set_item_view(itemObj, itemView, {type = pageCount})
    end
end

function AgentEarningsView:update_item_panel(pageCount, datas)
    if datas == nil or #datas <= 0 then return end
    self.GridExs[pageCount]:set_datas(datas)
end

function AgentEarningsView:updateFanye(current, total)
    self.btnYeLab.text = string.format("第%d/%d页", current, total)
    self.lastGray:SetActive(false)
    self.nextGray:SetActive(false)
    self.btnNext.enabled = true
    self.btnLast.enabled = true
    if current <= 1 then
        self.lastGray:SetActive(true)
        self.btnLast.enabled = false
    end
    if current >= total then
        self.nextGray:SetActive(true)
        self.btnNext.enabled = false
    end
end


return AgentEarningsView