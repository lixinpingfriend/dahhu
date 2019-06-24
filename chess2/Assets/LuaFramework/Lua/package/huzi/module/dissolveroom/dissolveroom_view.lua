
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local DissolveRoomView = Class('dissolveRoomView', View)
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local curTableData = nil
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

function DissolveRoomView:initialize(...)
	-- 初始View
	View.initialize(self, "huzi/module/dissolveroom/huzi_windowdissolveroom.prefab", "HuZi_WindowDissolveRoom", 2)
	curTableData = TableManager.phzTableData
	self.buttonAgree = GetComponentWithPath(self.root, "Center/Buttons/ButtonAgree", ComponentTypeName.Button)
	self.buttonAgreeText = GetComponentWithPath(self.root, "Center/Buttons/ButtonAgree/text", ComponentTypeName.Image)
	self.buttonRefuse = GetComponentWithPath(self.root, "Center/Buttons/ButtonRefuse", ComponentTypeName.Button)
	self.buttonRefuseText = GetComponentWithPath(self.root, "Center/Buttons/ButtonRefuse/text", ComponentTypeName.Image)
	self.textTitle = GetComponentWithPath(self.root, "Center/Panel/TextTitle", ComponentTypeName.Text)
	self.textTips = GetComponentWithPath(self.root, "Center/TextTips", ComponentTypeName.Text)
	self.textLeftSecs = GetComponentWithPath(self.root, "Center/LeftTime/Text", ComponentTypeName.Text)
	self.textBijiTips = GetComponentWithPath(self.root, "Center/PanelBiji/Text", ComponentTypeName.Text)
	self.stateSwitcher = GetComponentWithPath(self.root,"Center","UIStateSwitcher")
	self.Panel = GetComponentWithPath(self.root, "Center/Panel", ComponentTypeName.Transform).gameObject
	self.PanelBiji = GetComponentWithPath(self.root, "Center/PanelBiji", ComponentTypeName.Transform).gameObject
end

function DissolveRoomView:refresh_view(freeRoomData)
	self.stateSwitcher:SwitchState(freeRoomData.dataType)
	self.freeRoomData = freeRoomData
	self.beginTime = Time.realtimeSinceStartup
	self.timeDown = 0
	if(freeRoomData.dataType == "bullfight" or freeRoomData.dataType == AppData.BranchRunfastName) then
		self:showBullFight(freeRoomData)
	else
		self:showHenanmj(freeRoomData)
	end
end

function DissolveRoomView:showHenanmj(freeRoomData)
	ModuleCache.ComponentUtil.SafeSetActive(self.Panel, true)
	ModuleCache.ComponentUtil.SafeSetActive(self.PanelBiji, false)
	local index = 1
	for i=1,#freeRoomData.Action do
		local action = freeRoomData.Action[i]
		local playerId = curTableData.seatUserIdInfo[(i - 1) .. ""]
		TableUtilPaoHuZi.download_seat_detail_info(playerId,nil,function(playerInfo)
			local content = self:get_text_content(Util.filterPlayerName(playerInfo.playerName, 10), action)
			if(action ~= 1 and self.isDestroy ~= true) then
				local textContent = GetComponentWithPath(self.root, "Center/Panel/Text" .. index, ComponentTypeName.Text)
				index = index + 1
				textContent.text = content
			end
		end)
		if(i - 1 == curTableData.SeatID) then
			self.buttonAgree.interactable = (action == 0)
			self.buttonRefuse.interactable = (action == 0)

			if action == 0 then
				self.buttonAgreeText.color = Color.New(1, 1, 1, 1)
				self.buttonRefuseText.color = Color.New(1, 1, 1, 1)
			else
				self.buttonAgreeText.color = Color.New(1, 1, 1, 0.5)
				self.buttonRefuseText.color = Color.New(1, 1, 1, 0.5)
			end
		end
	end
end

function DissolveRoomView:showBullFight(freeRoomData)
	
	--print_table(self.freeRoomData)
	ModuleCache.ComponentUtil.SafeSetActive(self.Panel, false)
	ModuleCache.ComponentUtil.SafeSetActive(self.PanelBiji, true)
	table.sort(freeRoomData, function(t1, t2)
		if(t1.isSponsor and (not t2.isSponsor)) then
			return true
		elseif(t2.isSponsor and (not t1.isSponsor)) then
			return false
		end

		if(t1.isAnswered and (not t2.isAnswered)) then
			return true
		elseif(t2.isAnswered and (not t1.isAnswered)) then
			return false
		end
		return false
	end)
	
	if(freeRoomData.mySeatFreeRoomData.isAnswered) then
		self.buttonAgree.interactable = false
		self.buttonRefuse.interactable = false
	else
		self.buttonAgree.interactable = true
		self.buttonRefuse.interactable = true
	end
	
	local tmpText = ""
	tmpText = self:formatText(self.freeRoomData[1])
	for i = 2, # self.freeRoomData do
		tmpText = tmpText .. "\n" .. self:formatText(self.freeRoomData[i])
	end
	print(tmpText)
	self.textBijiTips.text = tmpText
end

function DissolveRoomView:get_text_content(name, action)
	local content = ""
	local playerName = Util.filterPlayerName(name, 10)
	content = content .. "【" .. playerName .. "】"
	if(action == 1) then
		if self.textTitle and playerName then
			self.textTitle.text = "【" .. playerName .. "】" .. "申请解散房间，是否同意？"
		end
	elseif(action == 2) then
		content = content .. TableUtilPaoHuZi.color_text("619e22", "已同意")
	elseif(action == 3) then
		content = content .. TableUtilPaoHuZi.color_text("b13a1f", "已拒绝")
	else
		content = content .. "未回应"
	end

	
	return content
end

function DissolveRoomView:formatText(freeSeatRoomData)
	local text = ""
	local playerName = "..."
	local dissolveRoomStr = "申请解散房间，是否同意？"
    local playerInfo = freeSeatRoomData.seatInfo.playerInfo
	if playerInfo then
		text = "【" .. Util.filterPlayerName(playerInfo.playerName, 6) .. "】"
	else
		text = "【" .. playerName .. "】"
		self:get_userinfo(freeSeatRoomData.seatInfo.playerId, function(err, data)
			local playerInfo = {}
			playerInfo.playerId = freeSeatRoomData.seatInfo.playerId
			playerInfo.playerName = data.nickname
			playerInfo.headUrl = data.headImg
			playerInfo.gender = data.gender
			freeSeatRoomData.seatInfo.playerInfo = playerInfo
			self:showBullFight(self.freeRoomData)
		end);
	end
	if(freeSeatRoomData.isSponsor) then
		text = text .. dissolveRoomStr
	else
		if(freeSeatRoomData.isAnswered) then
			if(freeSeatRoomData.agree) then
				text = text .. "已同意"
			else
				text = text .. "已拒绝"
			end
		else
			text = text .. "正在投票..."
		end
	end
	return text
end

function DissolveRoomView:get_userinfo(playerId, callback)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
		params = {
			uid = playerId,
		},
		cacheDataKey = "user/info?uid=" .. playerId,
		cacheDataImmediatelyCallback = true,
	}

	self:http_get(requestData, function(wwwOperation)
		local www = wwwOperation.www;
		local retData = ModuleCache.Json.decode(www.text)
		if retData.ret and retData.ret == 0 then    --OK
			callback(nil, retData.data)
		else
			callback(retData.ret, nil)
		end
	end, function(error)
		print(error.error)
		callback(error.error, nil);
	end, function(cacheDataText)
		local retData = ModuleCache.Json.decode(cacheDataText)
		if retData.ret and retData.ret == 0 then    --OK
			callback(nil, retData.data)
		else
			callback(retData.ret, nil)
		end
	end)

end

function DissolveRoomView:update_beat()
	if self.freeRoomData then
		if(self.freeRoomData.Time) then
			self:refresh_left_secs(self.freeRoomData.Time)
		else
			self:refresh_left_secs2(self.freeRoomData.expire - self:getServerNowTime())
		end
	end
end

function DissolveRoomView:refresh_left_secs(leftTime)
	if(leftTime >= self.timeDown and Time.realtimeSinceStartup - self.beginTime >= self.timeDown) then
		self.textLeftSecs.text = string.format("剩余解散时间 %02d:%02d", math.floor((leftTime - self.timeDown) / 60), (leftTime - self.timeDown) % 60)
		self.timeDown = self.timeDown + 1
	end 
end

function DissolveRoomView:refresh_left_secs2(leftTime)
	if(leftTime >= 0) then
		self.textLeftSecs.text = string.format("剩余解散时间 %02d:%02d", math.floor(leftTime / 60), leftTime % 60)
	end 
end

function DissolveRoomView:getServerNowTime()
	local  offset = 0
	if(self.modelData.curTableData.roomInfo)then
		offset = self.modelData.curTableData.roomInfo.timeOffset 
	end
	return offset + os.time()
end


return DissolveRoomView 