






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumFellowShipHistoryModule = class("museumFellowShipHistoryModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumFellowShipHistoryModule:initialize(...)
	ModuleBase.initialize(self, "museumFellowShipHistory_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumFellowShipHistoryModule:on_module_inited()
	
end



-- 绑定module层的交互事件
function MuseumFellowShipHistoryModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumFellowShipHistoryModule:on_model_event_bind()
	
end

function MuseumFellowShipHistoryModule:on_show(data)
	self.museumData = data
	self:getFellowshipParlorHistoryData()
end


function MuseumFellowShipHistoryModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ImageBack" then
		ModuleCache.ModuleManager.hide_module("public", "museumfellowshiphistory")

	elseif obj.name == "totalData" then
		local array = string.split(obj.transform.parent.gameObject.name, "_")
		local data = self.view.dataList[tonumber(array[2]) ]

		if not data.isCheckDay then
			data.isCheckDay = true
			self:getFellowshipParlorDayData(data)
			data.item.dataInfoParent:SetActive(true)

			data.item.openIcon.localScale = Vector3.New(1, -1, 1)
			data.item.museumDropdown.onValueChanged:RemoveAllListeners()
			data.item.museumDropdown.onValueChanged:AddListener(function(value)
				self:getFellowshipParlorDayData(data)
			end)
		else
			data.isCheckDay = false
			data.item.dataInfoParent:SetActive(false)
			data.item.openIcon.localScale = Vector3.New(1, 1, 1)

			local setPosEnd = function()
				--Yield(0)
				--Yield(0)
				--Yield(0)
				WaitForEndOfFrame()
				--WaitForSeconds(0.1)
				if not self.isDestroy then
					--data.item.contentSizeFitter_dataInfo:SetLayoutVertical()
					--data.item.verticalLayoutGroup_dataInfo:SetLayoutVertical()
					data.item.contentSizeFitter_dataInfo.enabled = false
					data.item.contentSizeFitter_dataInfo.enabled = true
					data.item.verticalLayoutGroup_dataInfo.enabled = false
					data.item.verticalLayoutGroup_dataInfo.enabled = true
					WaitForEndOfFrame()
					--data.item.contentSizeFitter:SetLayoutVertical()
					--data.item.verticalLayoutGroup:SetLayoutVertical()
					data.item.contentSizeFitter.enabled = false
					data.item.contentSizeFitter.enabled = true
					data.item.verticalLayoutGroup.enabled = false
					data.item.verticalLayoutGroup.enabled = true
					WaitForEndOfFrame()
					--self.view.contentSizeFitter_fellowShip:SetLayoutVertical()
					--self.view.verticalLayoutGroup_fellowShip:SetLayoutVertical()
					self.view.contentSizeFitter_fellowShip.enabled = false
					self.view.contentSizeFitter_fellowShip.enabled = true
					self.view.verticalLayoutGroup_fellowShip.enabled = false
					self.view.verticalLayoutGroup_fellowShip.enabled = true
				end
			end

			self:start_unity_coroutine(setPosEnd)
		end



	elseif obj.name == "LoadMoreFellowShipBtn" then
		self.historyData.currentPage = self.historyData.currentPage +1
		self:getFellowshipParlorHistoryData(true)

	elseif obj.name == "LoadMoreDayDataBtn" then
		local array = string.split(obj.transform.parent.gameObject.name, "_")
		local data = self.view.dataList[tonumber(array[2]) ]

		data.dayDataList.currentPage =  data.dayDataList.currentPage +1
		self:getFellowshipParlorDayData(data,true)
	end
end

-- 获取联谊历史记录
function MuseumFellowShipHistoryModule:getFellowshipParlorHistoryData(isloadMore)

	local curPageNum = 1
	if self.historyData and self.historyData.currentPage then
		curPageNum = self.historyData.currentPage
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/getFellowshipParlorHistoryData?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.museumData.orginalParlorId,
			pageNum = curPageNum
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			if isloadMore and self.historyData then
				for i =1, #retData.data.list do
					table.insert(self.historyData.list,#self.historyData.list +1, retData.data.list[i])
				end
			else
				self.historyData = retData.data
			end

			self.view:initLoopScrollViewList(self.historyData)

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--获取联谊数据每日详情
function MuseumFellowShipHistoryModule:getFellowshipParlorDayData(data,isloadMore)

	local curPageNum = 1
	if data.dayDataList and data.dayDataList.currentPage then
		curPageNum = data.dayDataList.currentPage
	end

	----筛选亲友圈id  选所有亲友圈传nil
	local slaveParlorId = self.museumData.orginalParlorId
	if data.item.parlorIdList and #data.item.parlorIdList > 0 then
		slaveParlorId = data.item.parlorIdList[tonumber(data.item.museumDropdown.value) +1]
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/getFellowshipParlorDayData?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			masterParlorId = data.masterParlorId,
			dateType = 3, --0今天 1前天 2昨天 3最近30天 4上个月
			parlorId = slaveParlorId or self.museumData.orginalParlorId,
			pageNum = curPageNum
		},
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			if isloadMore and data.dayDataList then
				for i =1, #retData.data.list do
					table.insert( data.dayDataList.list,# data.dayDataList.list +1, retData.data.list[i])
				end
			else
				data.dayDataList = retData.data
			end
			self.view:initLoopScrollViewList_dayData( data.dayDataList,data.item)

			local setPosEnd = function()
				--Yield(0)
				--Yield(0)
				--Yield(0)
				WaitForEndOfFrame()
				--WaitForSeconds(0.1)
				if not self.isDestroy then
					--data.item.contentSizeFitter_dataInfo:SetLayoutVertical()
					--data.item.verticalLayoutGroup_dataInfo:SetLayoutVertical()
					data.item.contentSizeFitter_dataInfo.enabled = false
					data.item.contentSizeFitter_dataInfo.enabled = true
					data.item.verticalLayoutGroup_dataInfo.enabled = false
					data.item.verticalLayoutGroup_dataInfo.enabled = true
					WaitForEndOfFrame()
					--data.item.contentSizeFitter:SetLayoutVertical()
					--data.item.verticalLayoutGroup:SetLayoutVertical()
					data.item.contentSizeFitter.enabled = false
					data.item.contentSizeFitter.enabled = true
					data.item.verticalLayoutGroup.enabled = false
					data.item.verticalLayoutGroup.enabled = true
					WaitForEndOfFrame()
					--self.view.contentSizeFitter_fellowShip:SetLayoutVertical()
					--self.view.verticalLayoutGroup_fellowShip:SetLayoutVertical()
					self.view.contentSizeFitter_fellowShip.enabled = false
					self.view.contentSizeFitter_fellowShip.enabled = true
					self.view.verticalLayoutGroup_fellowShip.enabled = false
					self.view.verticalLayoutGroup_fellowShip.enabled = true
				end
			end

			self:start_unity_coroutine(setPosEnd)
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

return MuseumFellowShipHistoryModule



