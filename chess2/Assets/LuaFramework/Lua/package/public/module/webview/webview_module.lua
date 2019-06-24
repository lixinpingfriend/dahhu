






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local WebViewModule = class("BullFight.WebViewModule", ModuleBase)
local ModuleEventBase = require('core.mvvm.module_event_base')

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function WebViewModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "webview_view", nil, ...)
end

function WebViewModule:on_module_event_bind()

	self:subscibe_module_event("hall", "urlSchemeIntentdata", function(eventHead, eventData)
		if eventData and eventData.funcName and eventData.funcName == "closeView" then
			self.webViewView.webview:Hide()
			ModuleCache.ModuleManager.destroy_module("public", "webview")
		end
	end)

end


function WebViewModule:on_show(intentData)
	if intentData then
		ModuleCache.ModuleManager.show_public_module("netprompt")
		print("打开链接" .. intentData.link)
		self.webViewView:initUniWebView(intentData.showType,intentData.style)
		self:subscibe_time_event(12, false, 0):OnComplete(function(t)
			ModuleCache.ModuleManager.hide_public_module("netprompt")
		end)
		self.webViewView.webview:Load(intentData.link)
		self.webViewView.webview.onLoadComplete = function( ... )
			self.view.webview:EvaluatingJavaScript(self:load_javascript())
			if ModuleCache.GameManager.isEditor then
				self.view.webview:EvaluatingJavaScript(string.format("SBestH5SDK.setUrlScheme('%s')", "uniwebview"))
			else
				self.view.webview:EvaluatingJavaScript(string.format("SBestH5SDK.setUrlScheme('%s')", ModuleCache.GameParameters.urlScheme))
			end
			ModuleCache.ModuleManager.hide_public_module("netprompt")
			self.webViewView.webview:Show()
		end

		self.webViewView.webview.onReceivedMessage = function(text)
			self.webViewView.webview:Hide()
			ModuleCache.ModuleManager.destroy_module("public", "webview")
		end

		--self:subscibe_time_event(5, false, 0):OnComplete(function(text)
		--	local js = "SBestH5SDK.closeView()"
		--	self.view.webview:EvaluatingJavaScript(js)
		--end)

		if intentData.hide then
			self.view:hide_view()
		end
	end
end

function WebViewModule:load_javascript()
	return require('package.public.module.webview.SinceBestH5SDK')
end


function WebViewModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.webViewView.buttonClose.gameObject then
        if self.onBackButton then
            self.onBackButton();
            self.onBackButton = nil;
        end
        self.webViewView.webview:Hide()
        ModuleCache.ModuleManager.destroy_module("public", "webview")
    end
end

-- 添加返回按钮监听
function WebViewModule:addBackButtonListener(callback)

    self.onBackButton = callback;
end

function WebViewModule:on_destroy()
	--ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
end

return WebViewModule



