






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local RoomDetailModule = class("HuZi.RoomDetailModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

local PlaybackDataManager = require("package.huzi.module.tablebase.playbackdata_manager")

function RoomDetailModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "roomDetail_view", nil, ...)
end

function RoomDetailModule:on_show(data)
	self.roomId = data.roomInfo.id
	self.players = data.data.players
	self.roomDetailView:initRoomInfo(data)
	self.roomDetailView:initLoopScrollViewList(data.data)
end

function RoomDetailModule:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.roomDetailView.buttonClose.gameObject then
		ModuleCache.ModuleManager.hide_module("huzi", "roomdetail")
		return	
	elseif obj == self.roomDetailView.buttonCheckRoundVideo.gameObject then
		ModuleCache.ModuleManager.show_module("public", "playvideo")
	elseif obj.name == "shareBtn" then
		TableManager:share_play_back_id(self.roomDetailView:get_data(obj).recordId, self.roomId)
	elseif obj.name == "playVideoBtn" then
		PlaybackDataManager:play_back(self.roomDetailView:get_data(obj), self.players)
	end
end

return RoomDetailModule



