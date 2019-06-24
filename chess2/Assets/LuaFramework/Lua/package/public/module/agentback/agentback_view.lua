---
--- Created by dc-pc.
--- DateTime: 2018/11/20 11:05
---
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class AgentBackView
local AgentBackView = Class('agentbackView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponent = ModuleCache.ComponentManager.GetComponent
local FindGameObject = ModuleCache.ComponentManager.FindGameObject
local ComponentUtil = ModuleCache.ComponentUtil

function AgentBackView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/agent/public_agentback.prefab", "Public_AgentBack", 0)
    -- 初始View
    View.set_1080p(self)

    self.titleSwitcher = GetComponentWithPath(self.root,"Top","UIStateSwitcher")
    --左边toggle,改为Button
    self.leftToggles = {}
    self.leftToggleSwitchers = {}
    self.leftTogglesObj = FindGameObject(self.root,"Left/toggles")
    local leftToggles = TableUtil.get_all_child(self.leftTogglesObj)
    for k, v in ipairs(leftToggles) do
        self.leftToggles[k] = GetComponent(v, ComponentTypeName.Button)
        self.leftToggleSwitchers[k] = GetComponent(v, "UIStateSwitcher")
    end
end

function AgentBackView:titleSwitchState(stateName)
    self.titleSwitcher:SwitchState(stateName)
    self.titleStateName = stateName
end

return AgentBackView