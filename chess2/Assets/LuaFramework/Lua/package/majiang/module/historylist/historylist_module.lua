local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class MaJiangHistoryListModule
local HistoryListModule = class("BullFight.HistoryListModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local GameManager = ModuleCache.GameManager


function HistoryListModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "historyList_view", nil, ...)

	self.historyListView.searchInput.onValueChanged:AddListener(function(string)
		if self.historyListView.searchInput.text == "" then
			self.historyListView:initLoopScrollViewList(self.historyListData)
		end

	end)

	self.historyListView.timeDropdown.onValueChanged:AddListener(function(idx)
		local startTime,endTime = self:get_pull_list_start_end_time(idx)
		self.curPage = 1
		self.totalPage = 1
		self:pullHistory(function (retData)
			self.curPage = retData.page.page
			self.totalPage = retData.page.totalPage
			self.historyListView:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			self:refresh_history_list_data(retData.page.list)
		end,self.museumData.parlorId or self.museumData.id,self.museumData.parlorNum,startTime,endTime,self.pageSize,self.curPage)
	end)

	self.pageSize = 50
end


function HistoryListModule:on_show(data)
	if not data then
		return
	end

	if data.museumData then
		self.museumData = data.museumData
		data = data.list
	else
		self.museumData = nil
	end

	if self.museumData and (self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN") then
		self.historyListView.stateSwitcher:SwitchState("museum")

		self.curPage = 1
		self.totalPage = 1
		self.historyListView:refresh_admain_tool_page_info(self.curPage,self.totalPage)
		local startTime,endTime = self:get_pull_list_start_end_time(self.historyListView.timeDropdown.value)  ---打开界面默认显示之前3天全部的
		self:pullHistory(function (retData)
			self.curPage = retData.page.page
			self.totalPage = retData.page.totalPage
			self.historyListView:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			print("?????????????????????????????????????")
			print_table(retData)
			self:refresh_history_list_data(retData.page.list)
		end,self.museumData.parlorId or self.museumData.id,self.museumData.parlorNum,startTime,endTime,self.pageSize,self.curPage)
	else
		self.historyListView.stateSwitcher:SwitchState("normal")
	end

	self:refresh_history_list_data(data)
	print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
	print_table(data)
end

function HistoryListModule:refresh_history_list_data(list)
	self.historyListData = list
	self.historyListView:initLoopScrollViewList(self.historyListData)
end


function HistoryListModule:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.historyListView.buttonClose.gameObject then
		ModuleCache.ModuleManager.destroy_module("majiang", "historylist")
		self:dispatch_package_event("Event_Show_Hall_Anim")
	elseif obj == self.historyListView.buttonCheckRoundVideo.gameObject then
		ModuleCache.ModuleManager.show_module("public", "playvideo")
	elseif obj.transform.parent.gameObject == self.historyListView.content then
		self:getRoomList(self.historyListView:get_data(obj))

	elseif obj.name == "SearchButton" then
		self:seachHistory()
	elseif obj.name == "PageUp" then
		if 0 == self.totalPage then
			return
		end
		local idx = self.historyListView.timeDropdown.value
		local startTime,endTime = self:get_pull_list_start_end_time(idx)
		local nextPage = self.curPage + 1
		if nextPage > self.totalPage then
			nextPage = self.totalPage
		end
		self:pullHistory(function (retData)
			self.curPage = retData.page.page
			self.totalPage = retData.page.totalPage
			self.historyListView:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			self:refresh_history_list_data(retData.page.list)
		end,self.museumData.parlorId or self.museumData.id,self.museumData.parlorNum,startTime,endTime,self.pageSize,nextPage)

	elseif obj.name == "PageDown" then
		if 0 == self.totalPage then
			return
		end
		local idx = self.historyListView.timeDropdown.value
		local startTime,endTime = self:get_pull_list_start_end_time(idx)
		local nextPage = self.curPage - 1
		if nextPage < 1 then
			nextPage = 1
		end
		self:pullHistory(function (retData)
			self.curPage = retData.page.page
			self.totalPage = retData.page.totalPage
			self.historyListView:refresh_admain_tool_page_info(self.curPage,self.totalPage)
			self:refresh_history_list_data(retData.page.list)
		end,self.museumData.parlorId or self.museumData.id,self.museumData.parlorNum,startTime,endTime,self.pageSize,nextPage)
	end
end

function HistoryListModule:get_pull_list_start_end_time(idx)
	local nowTime = os.time() * 1000
	local endTime = nowTime
	local startTime = nowTime - (24*60*60*1000) * 2  ---最近三天
	if 1 == idx then   ---今天
		endTime = nowTime
		startTime = nowTime
	elseif 2 == idx then  ---昨天
		endTime = nowTime - (24*60*60*1000) * 1
		startTime = nowTime - (24*60*60*1000) * 1
	elseif 3 == idx then ---前天
		endTime = nowTime - (24*60*60*1000) * 2
		startTime = nowTime - (24*60*60*1000) * 2
	end
	return startTime,endTime
end


function HistoryListModule:on_begin_drag(obj, arg)	
	if(obj.transform.parent.name == "Content")then
		self.dragObj = obj
	end	
end

function HistoryListModule:on_end_drag(obj, arg)
	if(obj.transform.parent.name == "Content")then
		if(self.dragObj == obj)then
			if(self.historyListView.lastScrollValue and self.historyListView.lastScrollValue < 0)then

			end
		end
	end	
end

function HistoryListModule:getRoomList(roomInfo)
	print_table(roomInfo)
	local requestData = {
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			roomid = roomInfo.id
		},
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gamehistory/roundlist/v3?",
	}
	
    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then    --OK
			local sendData = 
			{
				roomInfo = roomInfo,
				data = retData.data,
			}
            ModuleCache.ModuleManager.show_module("majiang", "roomdetail", sendData)
        else
            
        end
    end, function(error)
        print(error.error)
    end)
end



---根据条件拉取历史战绩
---@type fun(type:function,type:number,type:number,type:number,type:number,type:number,type:number)
function HistoryListModule:pullHistory(callBack,parlorId,parlorNum,startTime,endTime,pageSize,pageIndex)
	local addStr = "gamehistory/roomlist/parlor?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = true,
        params = {
			uid = self.modelData.roleData.userID,
			gameId = ModuleCache.GameManager.curGameId,

            platformName = ModuleCache.GameManager.customPlatformName,
			assetVersion = ModuleCache.GameManager.appAssetVersion,
			
			parlorId = parlorId,
			--parlorNum = parlorNum,
			
			startTime = startTime,
			endTime = endTime,
			pageSize = pageSize,
			pageNum = pageIndex,
        }
    }
	print("%&^$&^%&^%&^%^&%^&%^&% requestData")
	print_table(requestData)
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


function HistoryListModule:seachHistory()
	if self.historyListView.searchInput.text == "" then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入正确的房号或玩家ID")
		return
	end

	local search = {}
	local temp = nil
	for i =1,#self.historyListData do
		temp = self.historyListData[i]
		if tonumber(temp.roomNumber) == tonumber(self.historyListView.searchInput.text) then
			table.insert(search,  temp)
		end

		for j =1,#temp.players do
			if tonumber(temp.players[j].userId) == tonumber(self.historyListView.searchInput.text) then
				table.insert(search,  temp)
			end
		end
	end

	if #search ==0 then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("当页找不到该玩家或房号")
		self.historyListView:initLoopScrollViewList(self.historyListData)
	else
		self.historyListView:initLoopScrollViewList(search)
	end
end



return HistoryListModule



