




local BranchPackageName = AppData.BranchRunfastName
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local RoomDetailModule = class("RoomDetailModule", ModuleBase)
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function RoomDetailModule:initialize(...)
	ModuleBase.initialize(self, "roomDetail_view", nil, ...)
end

function RoomDetailModule:on_show(data)
	print("=====RoomDetailModule.on_show")
	print_table(data)
	self.roomInfo = 
	{
		roomNum = data.roomInfo.roomNumber,--房间号
		roomId = data.roomInfo.id,
		totalRoundCount = data.roomInfo.roundCount,--总局数
		creatorId = data.roomInfo.creatorId and data.roomInfo.creatorId,
		playRule = data.roomInfo.playRule
	}

	self.players = data.data.players
	--print_table(self.players)
	self.roomDetailView:initRoomInfo(data)
	self.roomDetailView:initLoopScrollViewList(data.data)
end


function RoomDetailModule:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.roomDetailView.buttonClose.gameObject then
		ModuleCache.ModuleManager.destroy_module(BranchPackageName, "historylist")
		ModuleCache.ModuleManager.destroy_module(BranchPackageName, "roomdetail")
		return	
	elseif obj == self.roomDetailView.buttonBack.gameObject then
		ModuleCache.ModuleManager.destroy_module(BranchPackageName, "roomdetail")
		return
	elseif obj.name == "shareBtn" then
		print("==分享的回放码="..self.roomDetailView:get_data(obj).recordId)
		TableManager:share_play_back_id(self.roomDetailView:get_data(obj).recordId,self.roomInfo.roomId)
	elseif obj.name == "playVideoBtn" then
		local clickData = self.roomDetailView:get_data(obj)
		self.roomInfo.curRoundNum = clickData.roundNumber
		TableManager:play_back_runfast(clickData, self.players,self.roomInfo, false)
	elseif obj == self.roomDetailView.lookGameBtn.gameObject then
		ModuleCache.ModuleManager.show_module("public", "playvideo")
	end
end


return RoomDetailModule