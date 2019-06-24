






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local DissolveRoomModule = class("HuZi.DissolveRoomModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine



function DissolveRoomModule:initialize(...)
	ModuleBase.initialize(self, "dissolveRoom_view", nil, ...)


	self:start_lua_coroutine(
		function ()
			while self.view do
				coroutine.wait(0.1)
				self:on_updateSelf()
			end
		end
	)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function DissolveRoomModule:on_module_inited()		
	
end



-- 绑定module层的交互事件
function DissolveRoomModule:on_module_event_bind()
	
end

-- 绑定loginModel层事件，模块内交互
function DissolveRoomModule:on_model_event_bind()

end

function DissolveRoomModule:on_show(freeRoomData)
	self.dissolveRoomView:refresh_view(freeRoomData)
	--UpdateBeat:Add(self.update_beat, self)
end


function DissolveRoomModule:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.dissolveRoomView.buttonAgree.gameObject then
		print("-----Agree-----")
		self:dispatch_module_event("dissolveroom", "Event_DissolvedRoom", 2)
		self:dispatch_package_event("Event_DissolvedRoom", 2)
	elseif obj == self.dissolveRoomView.buttonRefuse.gameObject then
		self:dispatch_module_event("dissolveroom", "Event_DissolvedRoom", 3)
		self:dispatch_package_event("Event_DissolvedRoom", 3)
	end	
end


--function DissolveRoomModule:on_hide()
--	UpdateBeat:Remove(self.update_beat, self)
--end
--
--function DissolveRoomModule:on_destroy()
--	UpdateBeat:Remove(self.update_beat, self)
--end


function DissolveRoomModule:on_updateSelf()
	if self.view then
		self.view:update_beat()
	end
end

return DissolveRoomModule



