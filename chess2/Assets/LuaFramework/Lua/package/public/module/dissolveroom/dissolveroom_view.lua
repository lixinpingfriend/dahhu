
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local DissolveRoomView = Class('dissolveRoomView', View)
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local curTableData = nil

function DissolveRoomView:initialize(...)
	-- 初始View
	View.initialize(self, "public/module/dissolveroom/public_windowdissolveroom.prefab", "Public_WindowDissolveRoom", 2)
	local len = string.len(AppData.Game_Name)
	if string.sub(AppData.Game_Name, len - 1, len) == "ZP" then
		self.curTableData = TableManager.phzTableData
	else
		self.curTableData = TableManager.curTableData
	end
	
	self.buttonAgree = GetComponentWithPath(self.root, "Center/Buttons/ButtonAgree", ComponentTypeName.Button)
	self.buttonRefuse = GetComponentWithPath(self.root, "Center/Buttons/ButtonRefuse", ComponentTypeName.Button)
	self.textTips = GetComponentWithPath(self.root, "Center/TextTips", ComponentTypeName.Text)
	self.textLeftSecs = GetComponentWithPath(self.root, "Center/LeftTime/Text", ComponentTypeName.Text)
	self.imgLeftTime = GetComponentWithPath(self.root, "Center/LeftTime/quan/Image", ComponentTypeName.Image)
	self.Panel = GetComponentWithPath(self.root, "Center/Panel", ComponentTypeName.Transform).gameObject

	self.objDissolvePlayer = self.Panel.transform:Find("Avatar").gameObject
	self.objOtherPlayer = {}
	for i=1,5 do	--最多5个其他玩家
		self.objOtherPlayer[i] = self.Panel.transform:Find("grid/" .. i).gameObject
	end
end

function DissolveRoomView:refresh_view(freeRoomData)
	self.freeRoomData = freeRoomData
	self.beginTime = Time.realtimeSinceStartup
	self.timeDown = 0

	-- 只有麻将没有传dataTyp吗？
	if not freeRoomData.dataType then
		self:showHenanmj(freeRoomData)
	else
		self:showBullFight(freeRoomData)
	end
	
end

function DissolveRoomView:showHenanmj(freeRoomData)
	--先隐藏头像等信息
	for i=1,5 do
		ModuleCache.ComponentUtil.SafeSetActive(self.objOtherPlayer[i], false)
	end
	ModuleCache.ComponentUtil.SafeSetActive(self.Panel, true)
	local index = 1
	for i=1,#freeRoomData.Action do
		local action = freeRoomData.Action[i]
		local playerId
		local len = string.len(AppData.Game_Name)
		if string.sub(AppData.Game_Name, len - 1, len) == "ZP" then
			playerId = self.curTableData.seatUserIdInfo[(i - 1) .. ""]
		else
			playerId = self.curTableData.seatUserIdInfo[TableManager.seatNumTable[i] .. ""]
		end
		
		TableUtil.get_player_info(playerId,nil,function(playerInfo)
			local content = self:get_text_content(Util.filterPlayerName(playerInfo.playerName, 10), action)
			if(action ~= 1) then	--投票者
				local imgHead = GetComponentWithPath(self.objOtherPlayer[index], "Mask/Image", ComponentTypeName.Image)
				local txtName = GetComponentWithPath(self.objOtherPlayer[index], "Mask/NameTextbackground/Text", ComponentTypeName.Text)
				local txtState = GetComponentWithPath(self.objOtherPlayer[index], "txtState", ComponentTypeName.Text)
				imgHead.sprite = playerInfo.headImage
				txtName.text =  Util.filterPlayerName(playerInfo.playerName, 10)
				txtState.text = content
				ModuleCache.ComponentUtil.SafeSetActive(self.objOtherPlayer[index], true)
				index = index + 1
			else --发起解散者
				local imgHead = GetComponentWithPath(self.objDissolvePlayer, "Mask/Image", ComponentTypeName.Image)
				local txtName = GetComponentWithPath(self.objDissolvePlayer, "Mask/NameTextbackground/Text", ComponentTypeName.Text)
				local txtState = GetComponentWithPath(self.objDissolvePlayer, "txtState", ComponentTypeName.Text)
				imgHead.sprite = playerInfo.headImage
				txtName.text =  Util.filterPlayerName(playerInfo.playerName, 10)
			end
		end)
		local bDissolvePlayer = false
		if string.sub(AppData.Game_Name, len - 1, len) == "ZP" then	--字牌的判断
			bDissolvePlayer = (i - 1 == self.curTableData.SeatID)
		else
			bDissolvePlayer = (TableManager.seatNumTable[i] == self.curTableData.SeatID)
		end
		if bDissolvePlayer then
			self.buttonAgree.interactable = (action == 0)
			self.buttonRefuse.interactable = (action == 0)
		end
	end

	self.nCaleTime = freeRoomData.Time
	if self.nMaxCaleTime == nil then
		self.nMaxCaleTime =freeRoomData.Time 
	end
	self:clear_all_time_event()
	self:refresh_left_secs(self.nCaleTime)
	self:subscibe_time_event(self.nCaleTime, false, 2):OnUpdate(function (t)
		self:refresh_left_secs(self.nCaleTime)
	end)
end

function DissolveRoomView:showBullFight(freeRoomData)
	--先隐藏头像等信息
	for i=1,5 do
		ModuleCache.ComponentUtil.SafeSetActive(self.objOtherPlayer[i], false)
	end
	ModuleCache.ComponentUtil.SafeSetActive(self.Panel, true)
	local index = 1
	for i=1,#freeRoomData do
		local action = freeRoomData[i]
		local playerId = action.seatInfo.playerId
		local curIndex = index
		TableUtil.get_player_info(playerId,nil,function(playerInfo)
			local content = self:get_text_content_poker(Util.filterPlayerName(playerInfo.playerName, 10), action)
			if(not action.isSponsor) then	--投票者
				local imgHead = GetComponentWithPath(self.objOtherPlayer[curIndex], "Mask/Image", ComponentTypeName.Image)
				local txtName = GetComponentWithPath(self.objOtherPlayer[curIndex], "Mask/NameTextbackground/Text", ComponentTypeName.Text)
				local txtState = GetComponentWithPath(self.objOtherPlayer[curIndex], "txtState", ComponentTypeName.Text)
				imgHead.sprite = playerInfo.headImage
				if playerInfo.headImage == nil then
					UnityLogError("aaa")
				end
				txtName.text =  Util.filterPlayerName(playerInfo.playerName, 10)
				txtState.text = content
				ModuleCache.ComponentUtil.SafeSetActive(self.objOtherPlayer[curIndex], true)
				index = index + 1
			else --发起解散者
				local imgHead = GetComponentWithPath(self.objDissolvePlayer, "Mask/Image", ComponentTypeName.Image)
				local txtName = GetComponentWithPath(self.objDissolvePlayer, "Mask/NameTextbackground/Text", ComponentTypeName.Text)
				local txtState = GetComponentWithPath(self.objDissolvePlayer, "txtState", ComponentTypeName.Text)
				imgHead.sprite = playerInfo.headImage
				txtName.text =  Util.filterPlayerName(playerInfo.playerName, 10)
			end
		end)
		
		if(freeRoomData.mySeatFreeRoomData.isAnswered) then
			self.buttonAgree.interactable = false
			self.buttonRefuse.interactable = false
		else
			self.buttonAgree.interactable = true
			self.buttonRefuse.interactable = true
		end
	end

	self.nCaleTime = freeRoomData.expire - self:getServerNowTime()
	if self.nMaxCaleTime == nil then
		self.nMaxCaleTime = freeRoomData.expire - self:getServerNowTime()
	end
	self:clear_all_time_event()
	self:refresh_left_secs(self.nCaleTime)
	self:subscibe_time_event(self.nCaleTime, false, 2):OnUpdate(function (t)
		self:refresh_left_secs(self.nCaleTime)
	end)
end

function DissolveRoomView:get_text_content(name, action)
	local content = ""
	local playerName = Util.filterPlayerName(name, 10)
	--content = content .. "【" .. playerName .. "】"
	if(action == 1) then
		--self.textTitle.text = "【" .. playerName .. "】" .. "申请解散房间，是否同意？"
	elseif(action == 2) then
		content = content .. TableUtil.color_text("619e22", "已同意")
	elseif(action == 3) then
		content = content .. TableUtil.color_text("b13a1f", "已拒绝")
	else
		content = content .. TableUtil.color_text("995004", "等待中")
	end
	return content
end

function DissolveRoomView:get_text_content_poker(name, action)
	local content = ""
	if(action.isSponsor) then
		--self.textTitle.text = "【" .. playerName .. "】" .. "申请解散房间，是否同意？"
	elseif(action.agree) then
		content = content .. TableUtil.color_text("619e22", "已同意")
	elseif(not action.isAnswered) then
		content = content .. TableUtil.color_text("995004", "等待中")
	else
		content = content .. TableUtil.color_text("b13a1f", "已拒绝")
	end
	
	return content
end

function DissolveRoomView:update_beat()
	
end

function DissolveRoomView:refresh_left_secs(leftTime)
	if leftTime >= 0 then
		self.textLeftSecs.text = leftTime .. "s"
		if self.nMaxCaleTime > 0 then
			self.imgLeftTime.fillAmount = (leftTime / self.nMaxCaleTime)
		end
		self.nCaleTime = self.nCaleTime - 1
	end
end

function DissolveRoomView:getServerNowTime()
	local  offset = 0
	if(self.modelData.curTableData.roomInfo)then
		offset = self.modelData.curTableData.roomInfo.timeOffset 
	end
	return offset + os.time()
end


function DissolveRoomView:getServerNowTime()
	local  offset = 0
	if(self.modelData.curTableData.roomInfo)then
		offset = self.modelData.curTableData.roomInfo.timeOffset 
	end
	return offset + os.time()
end

function DissolveRoomView:GetFilterNickName(playerInfo)
	if(playerInfo.RealName) then
		return Util.filterPlayerName(playerInfo.RealName, 8)
	else
		return Util.filterPlayerName(playerInfo.playerName, 8)
	end
end


return DissolveRoomView 