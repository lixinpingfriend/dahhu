
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class WebGameView : View
local WebGameView = Class('WebGameView', View)

local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

local ComponentTypeName = ModuleCache.ComponentTypeName
WebGameView.AdaptScreen = false

if ModuleCache.SDKInterface().is_support_webgame() then
    require("WebViewObject")
end


function WebGameView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/webgame/public_windowwebgame.prefab", "Public_WindowWebGame", 1)
    self:set_1080p()
    self._gameRoot = UnityEngine.GameObject.Find("GameRoot")
    self._canvas = ModuleCache.ComponentManager.GetComponentWithPath(self._gameRoot, "Game/UIRoot/UIWindowParent/Canvas", ComponentTypeName.RectTransform)
    self._camera = ModuleCache.ComponentManager.GetComponentWithPath(self._gameRoot, "Game/UIRoot/UICamera", ComponentTypeName.Camera)
    self._cameraWebGame = ModuleCache.ComponentManager.GetComponentWithPath(self._gameRoot, "Game/UIRoot/UICameraWebGame", ComponentTypeName.Camera)
    self._cameraWebGame.rect = self._camera.rect
end


function WebGameView:initUniWebView(intentData, onFinish)
    self.intentData = intentData
    if not intentData.style then
        intentData.style = 1
    end

    if intentData.style == 7 then
        self.canvas.worldCamera = self._cameraWebGame
    end

    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    local childNum = self.root.transform.childCount
    print("webview样式数量：",childNum)
    for i= 1,childNum do
        local c =  GetComponentWithPath(self.root, "Type" .. i, ComponentTypeName.Transform).gameObject
        ModuleCache.ComponentManager.SafeSetActive(c, i == intentData.style)
    end

    self.type = GetComponentWithPath(self.root, "Type" .. intentData.style, ComponentTypeName.Transform).gameObject
    --ModuleCache.ComponentManager.SafeSetActive(self.type, true)
    local buttonTest = GetComponentWithPath(self.type, "ButtonTest", ComponentTypeName.Button)
    if(buttonTest)then
        ModuleCache.ComponentUtil.SafeSetActive(buttonTest.gameObject, ModuleCache.GameManager.developmentMode or false)
    end

    self.buttonClose = GetComponentWithPath(self.type, "closeBtn", ComponentTypeName.Button)
    self.goWebview = GetComponentWithPath(self.type, "Center/WebView", ComponentTypeName.Transform).gameObject

    self.goLeftTop = GetComponentWithPath(self.type, "Center/LeftTop", ComponentTypeName.Transform).gameObject
    self.goRightBottom = GetComponentWithPath(self.type, "Center/RightBottom", ComponentTypeName.Transform).gameObject

    -- self.textUserAgreement = GetComponentWithPath(self.root, "Center/Panels/Agreenment/Text", ComponentTypeName.Text)
    self.inseideUI = ModuleCache.ComponentManager.Find(self.type, "BaseBackground/Inside")
    if self.inseideUI then
        ModuleCache.ComponentUtil.SafeSetActive(self.inseideUI, intentData.showType ~= 0)
    end
    if (intentData.showType ~= 0) then
        --self.goLeftTop.transform.anchoredPosition = Vector3.New(self.goLeftTop.transform.anchoredPosition.x, 220, 0)
    else
        --  self.goLeftTop.transform.anchoredPosition = Vector3.New(self.goLeftTop.transform.anchoredPosition.x, 290, 0)
    end

    local init_fun = function()
        if ModuleCache.SDKInterface().is_support_webgame() then
            self:init_webviewobject(intentData, onFinish)
        else
            self:init_uniwebview(intentData, onFinish)
        end

    end

    if(intentData.style == 7)then
        self.buttonGoBack = GetComponentWithPath(self.type, "Btns/goback/ButtonGoBack", ComponentTypeName.Button)
        self.buttonGoForward = GetComponentWithPath(self.type, "Btns/goforward/ButtonGoForward", ComponentTypeName.Button)
        self.buttonRefresh = GetComponentWithPath(self.type, "Btns/refresh/ButtonRefresh", ComponentTypeName.Button)
        self.buttonHome = GetComponentWithPath(self.type, "Btns/home/ButtonHome", ComponentTypeName.Button)
        self.sliderProgress = GetComponentWithPath(self.type, "Btns/line/Slider", ComponentTypeName.Slider)
        self:change_portrait_orientation(true, init_fun)
    elseif(intentData.style == 8)then
        self:change_portrait_orientation(true, init_fun)
    else
        init_fun()
    end
end

function WebGameView:init_webviewobject(intentData, onFinish)
    self.webview = ModuleCache.ComponentManager.AddComponent(self.goWebview, "WebViewObject")
    ModuleCache.ComponentUtil.SafeSetActive(self._camera.gameObject, false)
    ModuleCache.ComponentUtil.SafeSetActive(self._cameraWebGame.gameObject, true)
    self.webview:Init(function (msg) intentData.module:on_js(msg) end,
            false,
            "",
            function (msg) intentData.module:on_error(msg) end,
            function (msg) intentData.module:on_http_error(msg) end,
            function (msg) intentData.module:on_loaded(msg) end,
            true,
            function (msg) intentData.module:on_started(msg) end
    )
    --self.webview:ClearCookies()
    self:SetMargins(self.webview, self._cameraWebGame, self.goLeftTop.transform, self.goRightBottom.transform);
    self:refreshBtnsState()
    if(onFinish)then
        onFinish()
    end
end

function WebGameView:init_uniwebview(intentData, onFinish)
    self.webview = ModuleCache.ComponentManager.AddComponent(self.goWebview, "UniWebViewEx")
    ModuleCache.ComponentUtil.SafeSetActive(self._camera.gameObject, false)
    ModuleCache.ComponentUtil.SafeSetActive(self._cameraWebGame.gameObject, true)
    self.webview:Init()
    self.webview:SetEdgeInsets(self._cameraWebGame, self.goLeftTop, self.goRightBottom)
    self.webview.onLoadComplete = function(result, msg)
        if result then
            intentData.module:on_loaded(msg)
        end

    end


    self:refreshBtnsState()
    if(onFinish)then
        onFinish()
    end
end


function WebGameView:refreshBtnsState()
    local intentData = self.intentData
    if(not intentData)then
        return
    end
    if(not self.webview)then
        return
    end
    if(intentData.style == 7)then
        self:setButtonGrayAndDisable(self.buttonGoBack, not self.webview:CanGoBack())
        self:setButtonGrayAndDisable(self.buttonGoForward, not self.webview:CanGoForward())
    end
end

function WebGameView:setButtonGrayAndDisable(button, disable)
    print(button.name, disable)
    local uiSwitcher = ModuleCache.ComponentManager.GetComponent(button.gameObject, 'UIStateSwitcher')
    if(uiSwitcher)then
        if(disable)then
            uiSwitcher:SwitchState("Gray")
        else
            uiSwitcher:SwitchState("Normal")
        end
    end
    button.enabled = not disable
end

function WebGameView:change_portrait_orientation(isPortrait, onFinish, immediately)
    local canvas = self._canvas
    local camera = self._camera
    local cameraWebGame = self._cameraWebGame
    local lastScreenWidth = UnityEngine.Screen.width
    local lastScreenHeight = UnityEngine.Screen.height
    if(isPortrait and lastScreenWidth < lastScreenHeight)then
        if(onFinish)then
            onFinish()
        end
        return
    end
    local onFinishChange = function()
        if(isPortrait)then
            local canvasScale = canvas.localScale
            if(not self._lastCanvasScale)then
                self._lastCameraRect = camera.rect
                self._lastCanvasScale = canvas.localScale
            else
                canvasScale = self._lastCanvasScale
            end
            if ModuleCache.AppData.iPhoneIsinfinityDisplay then
                local newRect = UnityEngine.Rect(0, 0.05, 1, 0.9)
                cameraWebGame.rect = newRect
            else
                if(lastScreenWidth > lastScreenHeight and UnityEngine.Screen.height > lastScreenWidth)then
                    local offset = UnityEngine.Screen.height - lastScreenWidth
                    offset = offset / UnityEngine.Screen.height
                    local newRect = UnityEngine.Rect(0, 0, 1, 1 - offset)
                    cameraWebGame.rect = newRect
                end
            end
            local rectTran = self.root:GetComponent("RectTransform")
            rectTran.sizeDelta = UnityEngine.Vector2(canvas.sizeDelta.y, canvas.sizeDelta.x)
            rectTran.sizeDelta = rectTran.sizeDelta * 1.5

            local scale = canvasScale.x * canvas.sizeDelta.y / canvas.sizeDelta.x
            canvas.localScale = UnityEngine.Vector3(scale, scale, scale)
        else
            if(self._lastCameraRect)then
                cameraWebGame.rect = self._lastCameraRect
                canvas.localScale = self._lastCanvasScale
            end
        end
        if(onFinish)then
            onFinish()
        end
    end
    if(isPortrait)then
        ModuleCache.GameManager.change_portrait_orientation()

    else
        ModuleCache.GameManager.resume_orientation()
    end

    self:checkFinishChangeOrientation(isPortrait, onFinishChange, immediately)
end

function WebGameView:checkFinishChangeOrientation(isPortrait, callback, immediately)
    if(ModuleCache.GameManager.isEditor)then
        if(callback)then
            callback()
        end
        return
    end
    local screenWidth = UnityEngine.Screen.width
    local screenHeight = UnityEngine.Screen.height
    if(isPortrait)then
        if(screenHeight > screenWidth or immediately)then
            if(callback)then
                callback()
            end
            return
        end
    else
        if(screenHeight < screenWidth or immediately)then
            if(callback)then
                callback()
            end
            return
        end
    end
    self:subscibe_time_event(0.1, false, 0):OnComplete(function()
        self:checkFinishChangeOrientation(isPortrait, callback)
    end)
end

function WebGameView:hide_view()
    ModuleCache.ComponentUtil.SafeSetActive(self.root, false)
end

function WebGameView:on_destroy()
    ModuleCache.ComponentUtil.SafeSetActive(self._camera.gameObject, true)
    ModuleCache.ComponentUtil.SafeSetActive(self._cameraWebGame.gameObject, false)
    if(self.intentData.style == 7 or self.intentData.style == 8)then
        self:change_portrait_orientation(false, nil, true)
    end
    self:init_camera(true)
end

function WebGameView:SetMargins(webView, camera, leftTopTran, rightBottomTran)
    local toNearestInt = function(num)
        return math.max(math.floor(num), 0)
    end
    local screenWidth = UnityEngine.Screen.width
    local screenHeight = UnityEngine.Screen.height
    local leftTopScreenPos = camera:WorldToScreenPoint(leftTopTran.position)
    local rightBottomScreenPos = camera:WorldToScreenPoint(rightBottomTran.position)
    webView:SetMargins(toNearestInt(leftTopScreenPos.x), toNearestInt(screenHeight - leftTopScreenPos.y), toNearestInt(screenWidth - rightBottomScreenPos.x), toNearestInt(rightBottomScreenPos.y))
end

function WebGameView:refreshProcessSlider(value)
    value = value or 0
    if(value == 1)then
        value = 0
    end
    local intentData = self.intentData
    if(not intentData)then
        return
    end
    if(not self.webview)then
        return
    end
    if(intentData.style == 7)then
        self.sliderProgress.value = value
    end
end

function WebGameView:SetVisibility(state)
    if ModuleCache.SDKInterface().is_support_webgame() then
        self.webview:SetVisibility(state)
    else
        if state then
            self.webview:Show()
        else
            self.webview:Hide()
        end
    end

end

function WebGameView:EvaluateJS(text)
    if ModuleCache.SDKInterface().is_support_webgame() then
        self.webview:EvaluateJS(text)
    else
        self.webview:EvaluatingJavaScript(text)
    end

end

function WebGameView:LoadURL(link)
    if ModuleCache.SDKInterface().is_support_webgame() then
        self.webview:LoadURL(link)
    else
        self.webview:Load(link)
    end
end

function WebGameView:Progress()
    if ModuleCache.SDKInterface().is_support_webgame() then
        return self.webview:Progress()
    else
        return 100
    end
end

function WebGameView:GetCookie(url, key)
    if ModuleCache.SDKInterface().is_support_webgame() then
        return ""
    else
        return self.webview:GetCookie(url, key)
    end
end






return WebGameView