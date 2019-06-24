local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class AgentEarningsModule:ModuleBase
local AgentEarningsModule = class("AgentEarningsModule", ModuleBase)
local ModuleCache = ModuleCache

function AgentEarningsModule:initialize(...)

    -- 开始初始化
    ModuleBase.initialize(self, "agentearnings_view", "agentearnings_model", ...)
    self.curPage = 1
    self.curYeIndexByType = {}
    self.totleYeByType = {}
    ModuleCache.ComponentUtil.SafeSetActive(self.view.toggles[1].gameObject, true)
    self.pageData = {}
    for k, v in ipairs(self.view.togglesContents) do
        self.pageData[tonumber(v.name)] = nil  -- 按照toggle顺序存储data 此处重置
        self.curYeIndexByType[tonumber(v.name)] = 0
        self.totleYeByType[tonumber(v.name)] = 0
    end
    for k, v in ipairs(self.view.togglesContents) do
        self.view.toggles[tonumber(v.name)].onValueChanged:AddListener(function()
            if (self.view.toggles[tonumber(v.name)].isOn) then
                self.curPage = tonumber(v.name)
                self.view.switchers[tonumber(v.name)]:SwitchState("isOn")
                self.view.panelTable[tonumber(v.name)]:SetActive(true)
                -- 若无数据更新则选择不重新获取服务器数据
                self.view:updateFanye(self.curYeIndexByType[self.curPage], self.totleYeByType[self.curPage])
                if (self.pageData[tonumber(v.name)] == nil) then
                    self:get_page_data()
                end
            else
                self.view.switchers[tonumber(v.name)]:SwitchState("isOff")
                self.view.panelTable[tonumber(v.name)]:SetActive(false)
            end
        end)
    end
end

function AgentEarningsModule:on_show(data)
    self.openCallBack = data
    self.view:hide()
    for k, v in ipairs(self.view.togglesContents) do
        local i = tonumber(v.name)
        self.view.toggles[i].isOn = false
        if (i == self.curPage) then
            self.view.toggles[self.curPage].isOn = true
        end
    end
    self.model:getTodayReward()
end

function AgentEarningsModule:get_page_data()
    if self.curPage == self.model.DataType.OrderReward  then
        self.model:getOrderRewardDetail()
    elseif self.curPage == self.model.DataType.RoomReward then
        self.model:getRoomRewardDetail()
    elseif self.curPage == self.model.DataType.LatelyWith then
        self.model:getLatelyWithDrawals()
    end
end

function AgentEarningsModule:on_module_event_bind()
    self:subscibe_package_event("Event_Agent_Withdraw", function(eventHead, eventData)
        ---TODO:不置空的话会不显示按钮
        self.openCallBack = nil
        self.model:getTodayReward()
        self.model:getLatelyWithDrawals(true)
    end)
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function AgentEarningsModule:on_model_event_bind()
    self:subscibe_model_event("Event_Agent_TodayReward", function(eventHead, eventData)
        self.agentCashData = eventData
        self.view:showBaseInfo(eventData);
        self.view:show()
        if self.openCallBack ~= nil then self.openCallBack() end
    end)

    self:subscibe_model_event("Event_Agent_OrderRewardDetail", function(eventHead, eventData)
        self.pageData[self.model.DataType.OrderReward] = eventData.data
        self.totleYeByType[self.model.DataType.OrderReward] = eventData.totlePage
        self.curYeIndexByType[self.model.DataType.OrderReward] = #eventData.data
        self.view:update_item_panel(self.model.DataType.OrderReward, self.pageData[self.model.DataType.OrderReward][#self.pageData[self.model.DataType.OrderReward]])
        self.view:updateFanye(#self.pageData[self.model.DataType.OrderReward], self.totleYeByType[self.model.DataType.OrderReward])
    end)

    self:subscibe_model_event("Event_Agent_RoomRewardDetail", function(eventHead, eventData)
        self.pageData[self.model.DataType.RoomReward] = eventData.data
        self.totleYeByType[self.model.DataType.RoomReward] = eventData.totlePage
        self.view:update_item_panel(self.model.DataType.RoomReward, self.pageData[self.model.DataType.RoomReward][#self.pageData[self.model.DataType.RoomReward]])
        self.curYeIndexByType[self.model.DataType.RoomReward] = #eventData.data
        self.view:updateFanye(#self.pageData[self.model.DataType.RoomReward], self.totleYeByType[self.model.DataType.RoomReward])
    end)

    self:subscibe_model_event("Event_Agent_LatelyWithDrawals", function(eventHead, eventData)
        self.pageData[self.model.DataType.LatelyWith] = eventData.data
        self.curYeIndexByType[self.model.DataType.LatelyWith] = #eventData.data
        self.totleYeByType[self.model.DataType.LatelyWith] = eventData.totlePage
        self.view:update_item_panel(self.model.DataType.LatelyWith, self.pageData[self.model.DataType.LatelyWith][#self.pageData[self.model.DataType.LatelyWith]])
        if self.curPage == self.model.DataType.LatelyWith then
            self.view:updateFanye(#self.pageData[self.model.DataType.LatelyWith], self.totleYeByType[self.model.DataType.LatelyWith])
        end
    end)
end

function AgentEarningsModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnWithdraw" then
        ModuleCache.ModuleManager.show_module("public", "agentwithdrawcash",self.agentCashData)
    elseif obj == self.view.btnLast.gameObject or obj == self.view.btnNext.gameObject then
        if obj == self.view.btnLast.gameObject then
            self.curYeIndexByType[self.curPage] = self.curYeIndexByType[self.curPage] - 1
        else
            self.curYeIndexByType[self.curPage] = self.curYeIndexByType[self.curPage] + 1
        end
        local datas = self:get_data_by_index()
        if datas ~= nil then
            self.view:update_item_panel(self.curPage, datas)
            self.view:updateFanye(self.curYeIndexByType[self.curPage], self.totleYeByType[self.curPage])
        end
    end
end

function AgentEarningsModule:get_data_by_index()
    local datas = self.pageData[self.curPage][self.curYeIndexByType[self.curPage]]
    if datas == nil then
        self:get_page_data()
    else
        return datas
    end

end

return AgentEarningsModule