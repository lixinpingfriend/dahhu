




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local AgentPageView = Class('agentPageView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local UnityEngine = UnityEngine

function AgentPageView:initialize(...)
    -- 初始View 
    View.initialize(self, "public/module/agentpage/public_windowagentpage.prefab", "Public_WindowAgentPage", 1)
    View.set_1080p(self)


    self.uiCamera      = GetComponentWithPath(UnityEngine.GameObject.Find("GameRoot"), "Game/UIRoot/UICamera", "UnityEngine.Camera")
    self.btnClose      = GetComponentWithPath(self.root, "Top/TitlePanel/closeBtn", ComponentTypeName.Button)
    self.btnRefresh    = GetComponentWithPath(self.root, "Top/TitlePanel/refreshBtn", ComponentTypeName.Button)
    self.webviewObj    = GetComponentWithPath(self.root, "Center/WebView", ComponentTypeName.Transform).gameObject
    self.goLeftTop     = GetComponentWithPath(self.root, "Center/LeftTop", ComponentTypeName.Transform).gameObject
    self.goRightBottom = GetComponentWithPath(self.root, "Center/RightBottom", ComponentTypeName.Transform).gameObject
    self.webview       = ModuleCache.ComponentManager.AddComponent(self.webviewObj, "UniWebViewEx")
    self.title         = GetComponentWithPath(self.root, "Top/TitlePanel/Text", ComponentTypeName.Text)
end

function AgentPageView:initUniWebView(showType)
    self.webview:Init()
    self.webview:SetEdgeInsets(self.uiCamera, self.goLeftTop, self.goRightBottom)
end

return AgentPageView