local Class = require("lib.middleclass")
---@type View
local View = require('core.mvvm.view_base')
---@class GameHistoryView : View
local GameHistoryView = Class('gameHistoryView', View)

local ModuleCache = ModuleCache
local GameObject = UnityEngine.GameObject
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local Vector3 = Vector3
local PlayModeUtil = ModuleCache.PlayModeUtil


function GameHistoryView:initialize(...)
	View.initialize(self, "public/module/gamehistory/public_wingamehistory.prefab", "Public_WinGameHistory", 1)

	self.closeBtn = GetComponentWithPath(self.root,"TopLeft/Child/ImageBack",ComponentTypeName.Transform).gameObject
	self.lookMatchBtn = GetComponentWithPath(self.root,"TopRight/Child/LookMatch",ComponentTypeName.Transform).gameObject

	self.timeDropdown = GetComponentWithPath(self.root,"Center/Child/Panels/AdmainTools/TimeDropdown",ComponentTypeName.Dropdown)
	self.pageControlObj =  GetComponentWithPath(self.root,"Center/Child/Panels/AdmainTools/PageControl",ComponentTypeName.Transform).gameObject
	self.pageInfoText = GetComponentWithPath(self.root,"Center/Child/Panels/AdmainTools/PageControl/PageInfoText",ComponentTypeName.Text)
	self.pageUpGray =  GetComponentWithPath(self.root,"Center/Child/Panels/AdmainTools/PageControl/PageUpGray",ComponentTypeName.Transform).gameObject
	self.pageDownGray = GetComponentWithPath(self.root,"Center/Child/Panels/AdmainTools/PageControl/PageDownGray",ComponentTypeName.Transform).gameObject
	self.pageUpGray:SetActive(false)
	self.pageDownGray:SetActive(false)
	
	self.searchTools = GetComponentWithPath(self.root,"Center/Child/Panels/AdmainTools/SearchTools",ComponentTypeName.Transform).gameObject
	self.searchInput = GetComponentWithPath(self.searchTools, "InputField",ComponentTypeName.InputField)
	self.searchTypeDropdown = GetComponentWithPath(self.searchTools,"SearchTypeDropdown",ComponentTypeName.Dropdown)
	self.searchBtn = GetComponentWithPath(self.searchTools,"SearchButton",ComponentTypeName.Transform).gameObject
	self.searchBtn:SetActive(true)
	self.searchBtnDisable = GetComponentWithPath(self.searchTools,"SearchButtonDisable",ComponentTypeName.Transform).gameObject
	self.searchBtnDisable:SetActive(false)
	self.searchCloseStateToggle =  GetComponentWithPath(self.searchTools,"CloseStateToggle",ComponentTypeName.Toggle)

	self.historyItemGridParent = GetComponentWithPath(self.root,"Center/Child/Panels/ListScrollView/Viewport/Content",ComponentTypeName.Transform).gameObject

	self.admainToolsObj = GetComponentWithPath(self.root,"Center/Child/Panels/AdmainTools",ComponentTypeName.Transform).gameObject

	self.spriteEmpty = GetComponentWithPath(self.root,"Center/Child/SpriteEmpty",ComponentTypeName.Transform).gameObject

	self.displayers = {}

	self.curHistoryListItems = {}

	self:fixed_tran_size(GetComponentWithPath(self.root, "TopRight", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
	self:fixed_tran_size(GetComponentWithPath(self.root, "TopLeft", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)

end

function GameHistoryView:get_displayer(displayerClassName)
	if not displayerClassName or ("" == displayerClassName) then
		return
	end
	---@type HistoryDisplayerBase
	local displayer = self.displayers[displayerClassName]
	if not displayer then
		displayer = require("package.public.module.gamehistory.displayer."..displayerClassName):new()
		displayer:init(self)
		self.displayers[displayerClassName] = displayer
	end
	return displayer
end

function GameHistoryView:set_admain_tool_state(state)
	state = state or false
	self.admainToolsObj:SetActive(true)
	self.searchTools:SetActive(state)
end

function GameHistoryView:sort_history_list(historyList)
	local sortedHistoryList = {}
	for i=#historyList,1,-1 do
		local historyData = historyList[i]
		if 0 == #sortedHistoryList or historyData.roundNum < historyData.roundCount then
			table.insert(sortedHistoryList,1,historyData)
		else
			table.insert(sortedHistoryList,historyData)
		end
	end
	return sortedHistoryList
end

function GameHistoryView:refresh_history_list(data,museumData) 
	self:clear_history_list()
	local historyList = data.list
	if museumData then
		--historyList = self:sort_history_list(historyList)
	end
	self.refreshCo = self:start_unity_coroutine(function ()
		for i=1,#historyList do
			local historyData = historyList[i]
			local gameType = historyData.gameType
			if gameType == "nil" or gameType ==  ModuleCache.Json.null then
				local playRule = ModuleCache.Json.decode(historyData.playRule)
				gameType = playRule.gameType == nil and 0 or playRule.gameType
			end
			local config = PlayModeUtil.getConfigByAppGameNameAndWanfaType(historyData.gameId, gameType)
			config = config or ModuleCache.PlayModeUtil.getConfigByAppGameNameAndWanfaType(historyData.gameId, tostring(math.floor(tonumber(gameType))))
			local displayerTypeName = ""
			if config.package == "majiang" or config.package == "changpai" then
				displayerTypeName = "majiangHistoryDisplayer"
			elseif AppData.isPokerGameByPackageName(config.package) then
				displayerTypeName = "majiangHistoryDisplayer" ---扑克与麻将样式一样，所以直接用麻将的
			elseif config.package == "huzi" or config.package == "huazhipai" then
				displayerTypeName = "zipaiHistoryDisplayer" 
			end
			---@type HistoryDisplayerBase
			local displayer = self:get_displayer(displayerTypeName)
			if displayer then
				local historyItem = displayer:get_history_item()
				displayer:fill_history_item_info(historyItem,historyData,museumData,config,displayer)
				table.insert(self.curHistoryListItems,historyItem)
			end
			ModuleCache.Coroutine.WaitForSeconds(0.03)
		end
	end)
	self.spriteEmpty:SetActive(#historyList <= 0)
end

function GameHistoryView:clear_history_list()
	if self.refreshCo then
		self:stop_unity_coroutine(self.refreshCo)
		self.refreshCo = nil
	end
	for i=1,#self.curHistoryListItems do
		local historyItem = self.curHistoryListItems[i]
		historyItem.displayer:clear_history_item(historyItem)
	end
	table.clear(self.curHistoryListItems)
	self.historyItemGridParent.transform.localPosition = Vector3(self.historyItemGridParent.transform.localPosition.x,0,
		self.historyItemGridParent.transform.localPosition.z)
end

function GameHistoryView:refresh_admain_tool_page_info(curPage,maxPage)
	local curPageStr = (curPage and curPage > 0) and curPage or 1
	local maxPageStr = (maxPage and maxPage > 0) and maxPage or 1
	self.pageInfoText.text = curPageStr.."/"..maxPageStr.."页"
	self.pageUpGray:SetActive(false)
	self.pageDownGray:SetActive(false)
	if 1 == curPageStr then
		self.pageDownGray:SetActive(true)
	end
	if curPageStr == maxPageStr then
		self.pageUpGray:SetActive(true)
	end
end

function GameHistoryView:disable_search_btn_state_timing(time)
	self.searchBtn:SetActive(false)
	self.searchBtnDisable:SetActive(true)
	self.disableSearchBtnTimingId = self:subscibe_time_event(time, false, 1):OnComplete(function(t)
		self.searchBtn:SetActive(true)
		self.searchBtnDisable:SetActive(false)
	end).id
end

return GameHistoryView                        