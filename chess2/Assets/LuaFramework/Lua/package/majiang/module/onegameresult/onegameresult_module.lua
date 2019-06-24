





local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local ModuleBase = require('core.mvvm.module_base')
local OneGameResultModule = class('oneGameResultModule', ModuleBase)
local PlayerPrefs = UnityEngine.PlayerPrefs
local TableManager = TableManager


function OneGameResultModule:initialize(...)
    ModuleBase.initialize(self, "onegameresult_view", nil, ...)
	self.netClient = self.modelData.bullfightClient
end


function OneGameResultModule:on_module_inited()

end

function OneGameResultModule:on_module_event_bind()

end

function OneGameResultModule:on_click(obj, arg)	
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if(self.lastClickInviteTime and self.lastClickInviteTime + 1 > Time.realtimeSinceStartup)then
		return
	end
	if(obj.name == "BtnRestart" or obj.name == "BtnContinue") then
		if TableManager:cur_game_is_gold_room_type() then
			self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
		else
			if(self.gameState.Result ~= 3) then
				local sendData = nil
				if(self.view.ConfigData.isKaWuXing and TableManager.curTableData.ruleJsonInfo.YouPiao) then
					sendData = {xiaojiScore = TableManager.curTableData.kaWuXingPiao, paoScore = -1}
				end
				self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy", sendData)
			else
				self:dispatch_module_event("tablestrategy", "Event_QiShouHu_Continue")
			end
		end
		ModuleCache.ModuleManager.destroy_module("majiang", "onegameresult")
	elseif(obj.name == "BtnLookTotal") then
		self.view:show_totalgameresult_module()	-- 显示总结算
	elseif(obj.name == "BtnShare") then
		ModuleCache.ShareManager().shareImage(false)
	elseif(obj.name == "ButtonExit") then
		if TableManager:cur_game_is_gold_room_type() then
			self:dispatch_module_event("tablestrategy", "Event_Gold_Room_Quit")  ---金币场直接退出房间
		else
			self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
		end
	elseif(obj.name == "ButtonChangeTable") then
		---金币场没有换桌了
	elseif(obj.name == "BtnReturn") then
		self:dispatch_module_event("onegameresult", "Event_Close_OneGameResult")
		ModuleCache.ModuleManager.destroy_module("majiang", "onegameresult")
		--[[if TableManager:cur_game_is_gold_room_type() then
			self:dispatch_module_event("tablestrategy", "Event_Gold_Room_Quit") ---金币场直接退出房间
		end--]]
	elseif(obj.name == "BtnPreTabel") then
		self:dispatch_module_event("onegameresult", "Event_Close_OneGameResult")
		ModuleCache.ModuleManager.destroy_module("majiang", "onegameresult")
	elseif(string.sub(obj.name, 1, 9) == "ButtonPao") then
		local pao = tonumber(string.sub(obj.name, 10, 10)) - 1
		if(self.view.ConfigData.isKaWuXing) then
			PlayerPrefs.SetInt(string.format("%s_kawuxing_piao",TableManager.curTableData.ruleJsonInfo.GameType), pao + 1)
			self.view:kawuxing_piao()
			return
		end
	end
end

function OneGameResultModule:on_show(initData)
	if not initData.tableView then
		initData.tableView = {} ---兼容老框架没有传入tableView
	end

	self:get_detail()
	self.initData = initData
	self.view.initData = initData
	self.gameState = initData.gameState
	self.view:refresh_view(self.gameState)
	if # self.gameState.MaiMa >0 then
		self.view:Init_MaiMaPanel(self.gameState)
	end
end

---设置自动跳转大结算
function OneGameResultModule:set_auto_goto_total_result(autoOpenTotalResultTime)
	if self.view.btnLookTotal.activeSelf and autoOpenTotalResultTime then  ---定时自动打开大结算
	self.view.timeEventID = self:subscibe_time_event(autoOpenTotalResultTime, false, 0):OnComplete(function(t)
		self.view:show_totalgameresult_module()
	end).id
	end
end

function OneGameResultModule:reconnect()
	self.oneGameResultModel.clientConnected = false
	self.oneGameResultModel:connect_server()
end

function OneGameResultModule:get_detail()
	local  cachKey = string.format("parlor/list/getParlorDetail?%s", TableManager.curTableData.HallID)
	local text = ModuleCache.PlayerPrefsManager.GetString(cachKey, "")
	if text ~= "" then
		local retData = ModuleCache.Json.decode(text)
		if(retData.success) then
			self.view.museumData = retData.data
		end
	else
		self.view.museumData = self.museumData
	end

	--local rulejson = TableManager.curTableData.Rule or TableManager.curTableData.videoData.gamerule
	--local rule = TableUtil.convert_rule(rulejson)
	--local requestData = {
	--	baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorDetail?",
	--	showModuleNetprompt = true,
	--	params = {
	--		uid = self.modelData.roleData.userID,
	--		page = 1,
	--		rows = 20,
	--		id = TableManager.curTableData.HallID,
	--		gameName = rule.GameID or rule.gameId
	--	},
	--	cacheDataKey = string.format("parlor/list/getParlorDetail?%s", TableManager.curTableData.HallID),
	--	cacheDataImmediatelyCallbackAndIngoreSuccessCallback = true
	--}
	--self:http_get(requestData, function(wwwData)
	--	local retData = wwwData.www.text
	--	retData = ModuleCache.Json.decode(retData)
	--	if(retData.success) then
	--		self.view.museumData = retData.data
    --
	--	end
	--end, function(wwwErrorData)
	--	print(wwwErrorData.error)
	--	-- 没有缓存亲友圈详情数据 默认显示头像
	--	self.museumData = {preventionCheat = 0}
	--	self.view.museumData = self.museumData
	--end)
end

return  OneGameResultModule