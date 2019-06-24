
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local WebViewView = Class('webViewView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName


function WebViewView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/webview/public_windowwebview.prefab", "Public_WindowWebView", 1)

    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    self.uiCamera = GetComponentWithPath(UnityEngine.GameObject.Find("GameRoot"), "Game/UIRoot/UICamera", "UnityEngine.Camera")

end

function WebViewView:initUniWebView(showType, style)
    if not style then
        style = 1
    end
    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    local childNum = self.root.transform.childCount
    print("webview样式数量：",childNum)
    for i= 1,childNum do
        local c =  GetComponentWithPath(self.root, "Type" .. i, ComponentTypeName.Transform).gameObject
        ModuleCache.ComponentManager.SafeSetActive(c, i == style)
    end

    self.type = GetComponentWithPath(self.root, "Type" .. style, ComponentTypeName.Transform).gameObject
    --ModuleCache.ComponentManager.SafeSetActive(self.type, true)


    self.buttonClose = GetComponentWithPath(self.type, "closeBtn", ComponentTypeName.Button)
    local go = GetComponentWithPath(self.type, "Center/WebView", ComponentTypeName.Transform).gameObject

    self.goLeftTop = GetComponentWithPath(self.type, "Center/LeftTop", ComponentTypeName.Transform).gameObject
    self.goRightBottom = GetComponentWithPath(self.type, "Center/RightBottom", ComponentTypeName.Transform).gameObject
    self.webview = ModuleCache.ComponentManager.AddComponent(go, "UniWebViewEx")
    -- self.textUserAgreement = GetComponentWithPath(self.root, "Center/Panels/Agreenment/Text", ComponentTypeName.Text)
    self.inseideUI = GetComponentWithPath(self.type, "BaseBackground/Inside", ComponentTypeName.Transform).gameObject

    ModuleCache.ComponentUtil.SafeSetActive(self.inseideUI, showType ~= 0)
    if (showType ~= 0) then
        self.goLeftTop.transform.anchoredPosition = Vector3.New(self.goLeftTop.transform.anchoredPosition.x, 220, 0)
    else
        --  self.goLeftTop.transform.anchoredPosition = Vector3.New(self.goLeftTop.transform.anchoredPosition.x, 290, 0)
    end
    self.webview:Init()
    self.webview:SetEdgeInsets(self.uiCamera, self.goLeftTop, self.goRightBottom)
end

function WebViewView:hide_view()
    ModuleCache.ComponentUtil.SafeSetActive(self.root, false)
end

return WebViewView