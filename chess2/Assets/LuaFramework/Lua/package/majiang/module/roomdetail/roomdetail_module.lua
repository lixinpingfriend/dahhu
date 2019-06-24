






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local RoomDetailModule = class("BullFight.RoomDetailModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local Buffer = ModuleCache.net.Buffer

function RoomDetailModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "roomDetail_view", nil, ...)
end

function RoomDetailModule:on_show(data)
	if not data then
		return
	end
	self.roomId = data.roomInfo.id
	self.players = data.data.players
	self.roomDetailView:initRoomInfo(data)
	self.roomDetailView:initLoopScrollViewList(data)
end

function RoomDetailModule:on_click(obj, arg)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.roomDetailView.buttonClose.gameObject then
		ModuleCache.ModuleManager.hide_module("majiang", "roomdetail")
		return
	elseif obj == self.roomDetailView.buttonCheckRoundVideo.gameObject then
		ModuleCache.ModuleManager.show_module("public", "playvideo")
	elseif obj.name == "shareBtn" then
		TableManager:share_play_back_id(self.roomDetailView:get_data(obj).recordId, self.roomId)
	elseif obj.name == "playVideoBtn" then
		--self:play_back(self.roomDetailView:get_data(obj), self.players)
		TableManager:play_back(self.roomDetailView:get_data(obj), self.players,true)
	end
end


--[[function RoomDetailModule:play_back(data, players)
	self:get_play_back_info(data.recordId, function(gamestates, data)
		local index = 1
		for i = 1, #players do
			local userId = players[i].userId
			if (userId .. "" == self.modelData.roleData.userID) then
				index = i
			end
		end
		TableManager.curTableData = {
			isPlayBack = true,
			SeatID = index - 1,
			videoData = data,
			modelData = self.modelData,
			gamestates = gamestates,
			players = players
		}

		local excute = function()
			for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
				ModuleCache.ModuleManager.destroy_package(v.package_name)
			end
			ModuleCache.ModuleManager.destroy_package("public")
			self:show_majiang_table(data.gamerule)
			ModuleCache.ModuleManager.show_module("majiang", "playback")
		end

		local ruleTable = ModuleCache.Json.decode(data.gamerule)
		local packageName = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
		local Is3D = Config.get_mj3dSetting(ruleTable.GameID).Is3D
		local def3dOr2d = Config.get_mj3dSetting(ruleTable.GameID).def3dOr2d
		local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",ruleTable.GameType)
		local curSetIs3D = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey,def3dOr2d)
		if packageName == "majiang" and Is3D and Is3D == 1 and curSetIs3D == 1 then
			packageName = "majiang3d"
		end
		if "majiang3d" == packageName then
			ModuleCache.PackageManager.update_package_version(packageName, function()
				excute()
			end)
		else
			excute()
		end
	end)
end--]]

function RoomDetailModule:get_play_back_info(playbackId, callback)
	ModuleCache.ModuleManager.show_public_module("netprompt")
	local requestData = {
		params = {
			uid = self.modelData.roleData.userID,
			recordId = playbackId
		},
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/playback?",
	}

	ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
		local www = wwwOperation.www;
		if (string.find(www.text, "ret") ~= nil and string.find(www.text, "{") ~= nil) then
			local retData = ModuleCache.Json.decode(www.text)
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
			ModuleCache.ModuleManager.hide_public_module("netprompt")
			return
		end
		local buffer = Buffer.Create(0)  --会在C#层自动回收
		local videoData = buffer:GetPlayBackInfo(www.bytes)
		if not videoData then
			print("回放数据非法")
			return
		end
		local videoTable = nil
		if videoData.rule then
			videoTable = {}
			videoTable.gamerule = videoData.rule
		else
			videoTable = self:unpack_msg_new("Msg_VideoCode", videoData.headData)
		end
		local gamestates = {}
		for i = 1, videoData.frames.Count do
			local retData, error = self:unpack_msg_new("Msg_Table_GameStateNTF", videoData.frames[i - 1].buffer)
			table.insert(gamestates, retData)
		end

		callback(gamestates, videoTable)
		ModuleCache.ModuleManager.hide_public_module("netprompt")
	end, function(error)
		ModuleCache.ModuleManager.hide_public_module("netprompt")
	end)
end

function RoomDetailModule:unpack_msg_new(msgName, dataBuffer)
	local api = require("package.majiang.model.net.net_msg_data_map")
	local ret = api:create_ret_data(msgName)
	ret:ParseFromString(dataBuffer)
	return ret
end

function RoomDetailModule:show_majiang_table(rule)
	local ruleTable = ModuleCache.Json.decode(rule)
	local Is3D = Config.get_mj3dSetting(ruleTable.GameID).Is3D
	local def3dOr2d = Config.get_mj3dSetting(ruleTable.GameID).def3dOr2d
	if (Is3D) then
		local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",ruleTable.GameType)
		local curSetIs3D = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey,def3dOr2d)
		if (Is3D == 1 and curSetIs3D == 1) then
			ModuleCache.ModuleManager.show_module_only("majiang3d", "table3d")
		else
			ModuleCache.ModuleManager.show_module_only("majiang", "tablenew")
		end
	else
		ModuleCache.ModuleManager.show_module_only("majiang", "table")
	end
end

return RoomDetailModule



