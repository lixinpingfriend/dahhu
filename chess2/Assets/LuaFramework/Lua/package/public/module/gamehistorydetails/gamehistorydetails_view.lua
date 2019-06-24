local Class = require("lib.middleclass")
---@type View
local View = require('core.mvvm.view_base')
---@class GameHistoryDetailsView : View
local GameHistoryDetailsView = Class('gameHistoryDetailsView', View)

local ModuleCache = ModuleCache
local GameObject = UnityEngine.GameObject
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local Vector3 = Vector3

function GameHistoryDetailsView:initialize(...)
    View.initialize(self, "public/module/gamehistorydetails/public_wingamehistorydetails.prefab", "Public_WinGameHistoryDetails", 1)
    
	self.closeBtn = GetComponentWithPath(self.root,"TopLeft/Child/ImageBack",ComponentTypeName.Transform).gameObject
    self.lookMatchBtn = GetComponentWithPath(self.root,"TopRight/Child/LookMatch",ComponentTypeName.Transform).gameObject
    
    ---规则label
    self.ruleText = GetComponentWithPath(self.root,"Center/Child/RuleText",ComponentTypeName.Text)
    --解散原因label
    self.dissInfoText = GetComponentWithPath(self.root,"Center/Child/DissInfoText",ComponentTypeName.Text)
    ---com对象的父级
    self.comRootParent = GetComponentWithPath(self.root,"Center/Child",ComponentTypeName.Transform).gameObject

    self.gameEventCollector = ComponentUtil.GetComponent(self.root, "UGUIExtend.GameEventCollector")
end

return GameHistoryDetailsView