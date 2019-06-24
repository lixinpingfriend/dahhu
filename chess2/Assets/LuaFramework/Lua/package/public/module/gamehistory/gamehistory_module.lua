local class = require("lib.middleclass")
---@type ModuleBase
local ModuleBase = require("core.mvvm.module_base")
---@class GameHistoryModule : ModuleBase
---@field view GameHistoryView
local GameHistoryModule = class("gameHistoryModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

function GameHistoryModule:initialize(...)
    ModuleBase.initialize(self, "gamehistory_view", nil, ...)
    self.view.searchInput.onValueChanged:AddListener(function(string)
		if self.view.searchInput.text == "" then
			
		end
	end)
	self.view.timeDropdown.onValueChanged:AddListener(function(idx)
		local dataType = self:get_pull_list_dataType(idx)
		self.curPage = 1
		self.totalPage = 1
		self:pullHistory(function (retData)
			self.curPage = retData.data.page
			self.totalPage = retData.data.totalPage
			self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			self.view:refresh_history_list(retData.data,self.museumData)
		end,self.curPage,self.pageSize,dataType,self:get_parlorId(),nil,nil,self:get_room_close_state_sreach_tag())
	end)

	self.pageSize = 50

	self.view.searchInput.onValueChanged:AddListener(function(value)
		self:on_search_value_change()
	end)	
	
	self.view.searchCloseStateToggle.onValueChanged:AddListener(function(value)
		self:save_close_state_toggle_state()
		local idx = self.view.timeDropdown.value
		local dataType = self:get_pull_list_dataType(idx)
		self.curPage = 1
		self:pullHistory(function (retData)
			self.curPage = retData.data.page
			self.totalPage = retData.data.totalPage
			self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			self.view:refresh_history_list(retData.data,self.museumData)
		end,self.curPage,self.pageSize,dataType,self:get_parlorId(),self:get_playerId(),self:get_roomId(),self:get_room_close_state_sreach_tag())
	end)
end

function GameHistoryModule:on_show(initData)
	if not initData then
		return
	end
	if initData.museumData then
		self.museumData = initData.museumData
	else
		self.museumData = nil
	end
	if self.museumData and (self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN") then
        self.view:set_admain_tool_state(true)
		self.curPage = 1
		self.totalPage = 1
		self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
		local dataType = self:get_pull_list_dataType(self.view.timeDropdown.value)

		local playerId = nil
		if initData.playerId then
			playerId = initData.playerId
		end

		local parlorId  = self:get_parlorId()
		if initData.parlorId  then
			parlorId  = initData.parlorId
		end

		self:init_close_state_toggle_state()

		self:pullHistory(function (retData)
			self.curPage = retData.data.page
			self.totalPage = retData.data.totalPage
			self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
            self.view:refresh_history_list(retData.data,self.museumData)
		end,self.curPage,self.pageSize,dataType,parlorId,playerId,nil,self:get_room_close_state_sreach_tag())

		self.view.pageControlObj.transform.anchoredPosition = Vector2(-129,self.view.pageControlObj.transform.anchoredPosition.y)

	else
		self.view:set_admain_tool_state(false)
		local dataType = self:get_pull_list_dataType(self.view.timeDropdown.value)
        self:pullHistory(function (retData)
			self.curPage = retData.data.page
			self.totalPage = retData.data.totalPage
			self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
            self.view:refresh_history_list(retData.data,self.museumData)
		end,self.curPage,self.pageSize,dataType,self:get_parlorId(),nil,nil,self:get_room_close_state_sreach_tag())

		self.view.pageControlObj.transform.anchoredPosition = Vector3(0,self.view.pageControlObj.transform.anchoredPosition.y)
    end
	self.view:hide()
end

function GameHistoryModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.view.closeBtn then
		ModuleCache.ModuleManager.destroy_module("public", "gamehistory")
	elseif obj == self.view.lookMatchBtn then
		ModuleCache.ModuleManager.show_module("public", "playvideo")
	elseif obj.transform.parent.gameObject == self.view.historyItemGridParent then
		for i=1,#self.view.curHistoryListItems do
			local histtoryItem = self.view.curHistoryListItems[i]
			if histtoryItem.gameObject == obj then
				local historyData = histtoryItem.historyData
				local config = ModuleCache.PlayModeUtil.getConfigByAppGameNameAndWanfaType(historyData.gameId, historyData.gameType)
				config = config or ModuleCache.PlayModeUtil.getConfigByAppGameNameAndWanfaType(historyData.gameId, tostring(math.floor(tonumber(historyData.gameType))))
				if config then
					if config.package == "majiang" then
						self:openRoomDetails(historyData, config)
					else
						self:openRoomDetails(historyData, config)
					end
				end
				break
			end
		end
	elseif obj.name == "stampBtn" then
		for i=1,#self.view.curHistoryListItems do
			local historyItem = self.view.curHistoryListItems[i]
			if historyItem.stampBtn == obj then
				local historyData = historyItem.historyData
				local stampValue = nil
				if 0 == historyData.stamp then
					stampValue = 1
				elseif 1 == historyData.stamp then
					stampValue = 0
				else
					stampValue = 0
				end
				self:pushStamp(stampValue,historyData,function(newhistoryData)
					if historyItem.historyData and historyItem.historyData == historyData then
						historyItem.historyData.stamp = newhistoryData.stamp
						if 1 == historyItem.historyData.stamp then
							historyItem.stampTag:SetActive(true)
						elseif 0 == historyItem.historyData.stamp then
							historyItem.stampTag:SetActive(false)
						end
					end
				end)
				break
			end
		end
	elseif obj.name == "SearchButton" then
		self:seachHistory()
	elseif obj.name == "ResetButton" then
		self:resetSeach()
	elseif obj.name == "PageUp" then
		if 0 == self.totalPage then
			return
		end
		local idx = self.view.timeDropdown.value
		local dataType = self:get_pull_list_dataType(idx)
		local nextPage = self.curPage + 1
		if nextPage > self.totalPage then
			nextPage = self.totalPage
		end 
		self:pullHistory(function (retData)
			self.curPage = retData.data.page
			self.totalPage = retData.data.totalPage
			self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			self.view:refresh_history_list(retData.data,self.museumData)
		end,nextPage,self.pageSize,dataType,self:get_parlorId(),self:get_playerId(),self:get_roomId(),self:get_room_close_state_sreach_tag())
	elseif obj.name == "PageDown" then
		if 0 == self.totalPage then
			return
		end
		local idx = self.view.timeDropdown.value
		local dataType = self:get_pull_list_dataType(idx)
		local nextPage = self.curPage - 1
		if nextPage < 1 then
			nextPage = 1
		end
		self:pullHistory(function (retData)
			self.curPage = retData.data.page
			self.totalPage = retData.data.totalPage
			self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			self.view:refresh_history_list(retData.data,self.museumData)
		end,nextPage,self.pageSize,dataType,self:get_parlorId(),self:get_playerId(),self:get_roomId(),self:get_room_close_state_sreach_tag())
	end
end

function GameHistoryModule:get_pull_list_dataType(idx)
	local dateType = 0  ---最近七天
	if 1 == idx then   ---今天
		dateType = 1
	elseif 2 == idx then  ---昨天
		dateType = 2
	elseif 3 == idx then ---前天
		dateType = 3
	end
	return dateType
end

function GameHistoryModule:get_parlorId()
	if self.museumData then
		return self.museumData.parlorId or self.museumData.id
	end
end

function GameHistoryModule:get_playerId()
	local playerId = nil
    if self.view.searchInput.text == "" then
        return playerId
	end
	local searchStr = self.view.searchInput.text
	if 1 == self.view.searchTypeDropdown.value then
		playerId = tonumber(searchStr)
	end
	return playerId
end

GameHistoryModule.close_toggle_save_key = "gameList_close_toggle_save_state"
function GameHistoryModule:init_close_state_toggle_state()
	local state = PlayerPrefsManager.GetInt(self.close_toggle_save_key,1)
	if 1 == state then
		self.view.searchCloseStateToggle.isOn = true
	elseif 0 == state then
		self.view.searchCloseStateToggle.isOn = false
	end
end
function GameHistoryModule:save_close_state_toggle_state()
    PlayerPrefsManager.SetInt(self.close_toggle_save_key,self.view.searchCloseStateToggle.isOn and 1 or 0)
end

function GameHistoryModule:get_room_close_state_sreach_tag()
	if self.museumData then
		if self.view.searchCloseStateToggle.isOn then
			return 1
		else
			return 2
		end
	end
	return 0
end

function GameHistoryModule:get_roomId()
	local roomNum = nil
    if self.view.searchInput.text ~= "" then
        return roomNum
	end
	local searchStr = self.view.searchInput.text
	if 2 == self.view.searchTypeDropdown.value then
		roomNum = searchStr
	end
	return roomNum
end

function GameHistoryModule:pullHistory(callBack,pageNum,pageSize,dateType,parlorId,playerId,roomNum,closeType)
    local addStr = "gameNewHistory/roomList?"
    local requestData = 
    {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = true,
        params = 
        {
            uid = self.modelData.roleData.userID,
            gameId = ModuleCache.GameManager.curGameId,
			pageNum = pageNum,
			pageSize = pageSize,
			dateType = dateType,
        }
	}
	if parlorId and type(parlorId) == "number" and tonumber(parlorId) > 0 then
		requestData.params.parlorId = parlorId
	end
	if playerId and type(playerId) == "number" and tonumber(playerId) > 0 then
		requestData.params.playerId = playerId
	end
	if roomNum then
		requestData.params.roomNum = roomNum
	end
	if closeType then
		requestData.params.closeType = closeType
	else
		requestData.params.closeType = 0
	end
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			if not self.view:is_active() then
				self.view:active()
			end
			if callBack then
				callBack(retData)
			end
		else
			ModuleCache.Log.report_exception("http获取历史战绩返回结果不正确", wwwData.www.text, "")
		end
    end, function(wwwErrorData)
		ModuleCache.Log.report_exception("http获取历史战绩出错", wwwErrorData.error, "")
        print(wwwErrorData.error)
    end)
end

local maxSearchTimeSpacing = 5

function GameHistoryModule:seachHistory()
    if self.view.searchInput.text == "" then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入正确的房号或玩家ID")
        return
	end
	if self.lastSeachTime and UnityEngine.Time.time - self.lastSeachTime < maxSearchTimeSpacing then
		local left = maxSearchTimeSpacing - math.floor(UnityEngine.Time.time - self.lastSeachTime)
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您搜索过于频繁,请在"..left.."秒后重试")
		return
	end

	self.lastSeachTime = UnityEngine.Time.time
	self.view:disable_search_btn_state_timing(maxSearchTimeSpacing)

	local searchStr = self.view.searchInput.text
	local playerId = nil
	local roomNum = nil
	if 1 == self.view.searchTypeDropdown.value then
		playerId = tonumber(searchStr)
	else
		roomNum = searchStr
	end
	local dataType = self:get_pull_list_dataType(self.view.timeDropdown.value)
	self.curPage = 1
	self:pullHistory(function (retData)
		self.curPage = retData.data.page
		self.totalPage = retData.data.totalPage
		self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
		self.view:refresh_history_list(retData.data,self.museumData)
	end,self.curPage,self.pageSize,dataType,self:get_parlorId(),playerId,roomNum,self:get_room_close_state_sreach_tag())
end

function GameHistoryModule:resetSeach()
	self.view.searchInput.text = ""
	self.view.searchTypeDropdown.value = 0
	self.view.timeDropdown.value = 0
	self.curPage = 1
	self.totalPage = 1
	local dataType = self:get_pull_list_dataType(self.view.timeDropdown.value)
	self:pullHistory(function (retData)
		self.curPage = retData.data.page
		self.totalPage = retData.data.totalPage
		self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
		self.view:refresh_history_list(retData.data,self.museumData)
	end,1,self.pageSize,dataType,self:get_parlorId(),nil,nil,self:get_room_close_state_sreach_tag())	
end

function GameHistoryModule:on_search_value_change()
	self.view.timeDropdown.value = 0
	self.curPage = 1
	self.totalPage = 1
	self.view:clear_history_list()
	self.view:refresh_admain_tool_page_info(self.curPage,self.totalPage)
end

function GameHistoryModule:openRoomDetails(historyData, config)
	self:pullHistoryRoomDetails(function(data)
		if ModuleCache.ModuleManager.module_is_active("public","gamehistorydetails") then
			ModuleCache.ModuleManager.destroy_module("public","gamehistorydetails")
		end
		local is_skynet_framework = false
		for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
			if(v.package_name == config.package)then
				is_skynet_framework = v.is_skynet_framework
			end
		end

		local initData = {}
		if config.package == "huzi" or config.package == "huazhipai" then
			initData.comType = "zipai_detail_base" --详情界面对应的组件
		elseif(is_skynet_framework)then
			initData.comType = "poker_detail_base" --详情界面对应的组件
		else
			initData.comType = "majiangdetailcom" --详情界面对应的组件
		end
		initData.comPrefabName = "MaJiangDetailCom" --详情界面对应的组件的预制
		initData.roomDetailsData = data
		ModuleCache.ModuleManager.show_module("public","gamehistorydetails",initData)
		
	end,historyData)
end

function GameHistoryModule:pullHistoryRoomDetails(callBack,historyData)
	local addStr = "gameNewHistory/roundInfo?"
    local requestData = 
    {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = true,
        params = 
        {
            uid = self.modelData.roleData.userID,
            gameId = historyData.gameId,
			gameName = historyData.gameId,
			roomId = historyData.roomId,
        }
	}
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if callBack then
                callBack(retData.data)
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end


function GameHistoryModule:pushStamp(stampValue,historyData,callBack)
	local addStr = "gameNewHistory/changeRoomInfo?"
    local requestData = 
    {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = true,
        params = 
        {
            uid = self.modelData.roleData.userID,
            gameId = historyData.gameId,
			gameName = historyData.gameId,
			roomId = historyData.roomId,
			stamp = stampValue,
        }
	}
    self:http_get(requestData,function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if callBack then
                callBack(retData.data)
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

return GameHistoryModule