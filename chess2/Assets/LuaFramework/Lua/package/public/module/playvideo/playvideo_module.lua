






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local PlayVideoModule = class("BullFight.PlayVideoModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine



function PlayVideoModule:initialize(...)

	ModuleBase.initialize(self, "playVideo_view", nil, ...)
	self.strRoomNum = ''
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function PlayVideoModule:on_module_inited()		
	
end


-- 绑定module层的交互事件
function PlayVideoModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function PlayVideoModule:on_model_event_bind()
	
end

function PlayVideoModule:on_show(intentData)
	self.onFinishGetVideoDataCallback = intentData
	self:cleanRoomNumAndRefreshView();
end

function PlayVideoModule:cleanRoomNumAndRefreshView()
	self.strRoomNum = ''
	self.playVideoView:refreshRoomNumText(self.strRoomNum);	
end

function PlayVideoModule:removeLastNum()
	local len = string.len(self.strRoomNum)
	if(len == 0) then
		self.strRoomNum = ''
	else
		self.strRoomNum = string.sub(self.strRoomNum, 1, len - 1)
	end		
end


function PlayVideoModule:on_click(obj, arg)	
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.playVideoView.buttonClose.gameObject then
		ModuleCache.ModuleManager.hide_module("public", "playvideo")
		return
	elseif obj == self.playVideoView.keyboardMap.buttonDelete.gameObject then
		self:removeLastNum()
		self.playVideoView:refreshRoomNumText(self.strRoomNum)
	elseif obj == self.playVideoView.keyboardMap.buttonClean.gameObject then
		self:cleanRoomNumAndRefreshView();				
	else
		local len = table.getn(self.playVideoView.keyboardMap)
		
		for i=0,len do
			if(obj == self.playVideoView.keyboardMap[i].gameObject) then 
				if(string.len(self.strRoomNum) >= 6) then					
					return
				end
				self.strRoomNum = self.strRoomNum .. i
				
				self.playVideoView:refreshRoomNumText(self.strRoomNum)
				if(string.len(self.strRoomNum) == 6) then					
					self:playVideo(self.strRoomNum)
					return
				end
			end
		end
	end
end

function  PlayVideoModule:playVideo(strVideoId)
	if(strVideoId == "") then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("回放码错误！请填写正确的回放码")
		return
	else
		TableManager:play_back_on_id(strVideoId, self.onFinishGetVideoDataCallback)
	end
	
end

return PlayVideoModule



