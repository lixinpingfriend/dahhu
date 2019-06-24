
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local AgentPageModule = class("Public.AgentPageModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function AgentPageModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "agentpage_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function AgentPageModule:on_module_inited()

end

-- 绑定module层的交互事件
function AgentPageModule:on_module_event_bind()

end

-- 绑定Model层事件，模块内交互
function AgentPageModule:on_model_event_bind()
	

end

function AgentPageModule:on_show(data)
	if data then
		ModuleCache.ModuleManager.show_public_module("netprompt")
		print("打开链接" .. data.link)
		if data.title then
			self.view.title.text = data.title
		end
		self.view:initUniWebView()
		self.view.webview:Load(data.link)
		self.view.webview.onLoadComplete = function( ... )
			print("加载完成")
			ModuleCache.ModuleManager.hide_public_module("netprompt")
			self.view.webview:Show()
		end
	end
end

function AgentPageModule:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

	if obj == self.view.btnClose.gameObject then
		self.view.webview:Hide()
		ModuleCache.ModuleManager.destroy_module("public", "agentpage")
	elseif obj == self.view.btnRefresh.gameObject then
		self:refresh()
	end
end

function AgentPageModule:refresh()
	self.view.webview:Hide()
	ModuleCache.ModuleManager.show_public_module("netprompt")
	self.view.webview:Reload()
end

function AgentPageModule:goBack()

end

function AgentPageModule:goForward()

end

return AgentPageModule



