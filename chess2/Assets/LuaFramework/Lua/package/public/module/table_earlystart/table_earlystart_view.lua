local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class EarlyStartView
local EarlyStartView = Class('earlyStartView', View)
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName

local TableManager = TableManager
local TableUtil = TableUtil
local string = string
local Time = Time

function EarlyStartView:initialize(...)
    -- 初始View
    View.initialize(self, "publictable/module/tableearlystart/public_windoweearlystart.prefab", "Public_WindoweEarlyStart", 2)
    self.curTableData = TableManager.curTableData
    self.buttonAgree = GetComponentWithPath(self.root, "Center/Buttons/ButtonAgree", ComponentTypeName.Button)
    self.buttonRefuse = GetComponentWithPath(self.root, "Center/Buttons/ButtonRefuse", ComponentTypeName.Button)


    self.textLeftSecs = GetComponentWithPath(self.root, "Center/LeftTime/TimingText", ComponentTypeName.Text)
    self.leftSecsImage = GetComponentWithPath(self.root,"Center/LeftTime/TimingImage", ComponentTypeName.Image)

    self.applyPlayerInfoHodler = self:init_player_info_holder(
        GetComponentWithPath(self.root,"Center/ActionStates/ApplyPlayerInfo", ComponentTypeName.Transform).gameObject
    )
    self.otherPlayerInfoHolders = {}
    for i=1,5 do 
        local gameObject = GetComponentWithPath(self.root,"Center/ActionStates/Grid/"..tostring(i), ComponentTypeName.Transform).gameObject
        local holder = self:init_player_info_holder(gameObject)
        table.insert(self.otherPlayerInfoHolders,holder)
    end

    self.baseBackground = GetComponentWithPath(self.root, "BaseBackground", ComponentTypeName.Transform).gameObject
    self.center = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform).gameObject

    self.applyPanel = GetComponentWithPath(self.root, "ApplyPanel", ComponentTypeName.Transform).gameObject
    self.applyNotice_Toggle = GetComponentWithPath(self.applyPanel, "background/Center/Toggle", ComponentTypeName.Toggle)
    self.applyOk_Button = GetComponentWithPath(self.applyPanel, "background/Bottom/Button_Ok", ComponentTypeName.Transform).gameObject
    self.applyEixt_Button =  GetComponentWithPath(self.applyPanel, "background/TopRight/ButtonExit", ComponentTypeName.Transform).gameObject
end


function EarlyStartView:init_player_info_holder(gameObject)
    local holder = {}
    holder.gameObject = gameObject
    holder.nameText = GetComponentWithPath(gameObject, "Bg/NameText", ComponentTypeName.Text)
    holder.agreeStateText = GetComponentWithPath(gameObject, "Bg/AgreeStateText", ComponentTypeName.Text)
    holder.headImage = GetComponentWithPath(gameObject, "Bg/Mask/HeadImage", ComponentTypeName.Image)
    return holder
end

function EarlyStartView:show_apply_window()
    ModuleCache.ComponentUtil.SafeSetActive(self.applyPanel, true)
    local isNotice = ModuleCache.PlayerPrefsManager.GetInt(string.format("%s_EarlyStartNotice",ModuleCache.GameManager.curGameId),2)
    self.applyNotice_Toggle.isOn = (1 == isNotice)
    ModuleCache.ComponentUtil.SafeSetActive(self.center, false)
    ModuleCache.ComponentUtil.SafeSetActive(self.baseBackground, false)
end

function EarlyStartView:hide_apply_window()
    ModuleCache.ComponentUtil.SafeSetActive(self.applyPanel, false)
    ModuleCache.ComponentUtil.SafeSetActive(self.center, true)
    ModuleCache.ComponentUtil.SafeSetActive(self.baseBackground, true)
end

function EarlyStartView:refresh_view(earlyStartData, isPokerGame)
    self.earlyStartData = earlyStartData
    local newLeftTime = earlyStartData and earlyStartData.Time or 0
    if not self.leftTime or math.abs(self.leftTime - self.timeDown - newLeftTime) > 1  then
        self.beginTime = Time.realtimeSinceStartup
        self.leftTime = newLeftTime
        self.timeDown = 0
    end
    -- 只有麻将没有传dataTyp吗？
    if isPokerGame then
        self:showBullFight(earlyStartData)
    else
        self:showHenanmj(earlyStartData)
    end
end

function EarlyStartView:showHenanmj(earlyStartData)
    self.applyPlayerInfoHodler.gameObject:SetActive(false)
    for i=1,#self.otherPlayerInfoHolders do
        self.otherPlayerInfoHolders[i].gameObject:SetActive(false)
    end
	local strurl = TableManager.curTableData.Game_Name or ModuleCache.AppData.Game_Name
    local len = string.len(strurl)
    
    local curPlayerCount = 0
    for i=1,#earlyStartData.Action do
		local playerId
        if string.sub(strurl, len - 1, len) == "ZP" then
			playerId = TableManager.phzTableData.seatUserIdInfo[(i-1)..""]
		else
			playerId = self.curTableData.seatUserIdInfo[TableManager.seatNumTable[i] .. ""]
        end
        if playerId and 0 ~= tonumber(playerId) then
            curPlayerCount = curPlayerCount + 1
        end
    end

    local index = 1
    for i=1,#earlyStartData.Action do
		local action = earlyStartData.Action[i]
		local playerId
		if string.sub(strurl, len - 1, len) == "ZP" then
			playerId = TableManager.phzTableData.seatUserIdInfo[(i-1)..""]
		else
			playerId = self.curTableData.seatUserIdInfo[TableManager.seatNumTable[i] .. ""]
        end
        if playerId and 0 ~= tonumber(playerId) then
            local holder = nil
            if 1 == action then
                holder = self.applyPlayerInfoHodler
            else
                holder = self.otherPlayerInfoHolders[index]
                index = index + 1
            end
            TableUtil.download_seat_detail_info(playerId,function (playerInfo)
                holder.gameObject:SetActive(true)
                holder.headImage.sprite = playerInfo.headImage
            end,function(playerInfo)
                holder.gameObject:SetActive(true)
                holder.nameText.text = Util.filterPlayerName(playerInfo.playerName, 10)
            end)
            if(action == 0) then
                holder.agreeStateText.text = "<color=#995004>未回应</color>";
            elseif(action == 1) then
                holder.agreeStateText.text = "<color=#995004>发起"..curPlayerCount.."人开局，是否同意？</color>"
            elseif(action == 2) then
                holder.agreeStateText.text = "<color=#2daa00>已同意</color>"
            elseif(action == 3) then
                holder.agreeStateText.text = "<color=#995004>已拒绝</color>"
            end
        end
		if string.sub(strurl, len - 1, len) == "ZP" then
			if(i-1 == self.curTableData.SeatID) then
				self.buttonAgree.interactable = (action == 0)
				self.buttonRefuse.interactable = (action == 0)
			end
		else
			if(TableManager.seatNumTable[i] == self.curTableData.SeatID) then
				self.buttonAgree.interactable = (action == 0)
				self.buttonRefuse.interactable = (action == 0)
			end
		end
    end
end

function EarlyStartView:showBullFight(earlyStartData)
	if earlyStartData.ErrCode ~= 0 then	--宜昌 关闭此界面就好
		self:hide()
		return
	end
    self.applyPlayerInfoHodler.gameObject:SetActive(false)
    for i=1,#self.otherPlayerInfoHolders do
        self.otherPlayerInfoHolders[i].gameObject:SetActive(false)
    end
	local strurl = TableManager.curTableData.Game_Name or ModuleCache.AppData.Game_Name
    local len = string.len(strurl)
    
    local curPlayerCount = 0
    for i=1,#earlyStartData.Action do
		local playerId
		if self.curTableData.modelData.curTableData.roomInfo.seatInfoList[i] then
			playerId = self.curTableData.modelData.curTableData.roomInfo.seatInfoList[i].player_id
		end
        if playerId and 0 ~= tonumber(playerId) then
            curPlayerCount = curPlayerCount + 1
        end
    end

    local index = 1
    for i=1,#earlyStartData.Action do
		local action = earlyStartData.Action[i]
		local playerId
		if self.curTableData.modelData.curTableData.roomInfo.seatInfoList[i] then
			playerId = self.curTableData.modelData.curTableData.roomInfo.seatInfoList[i].player_id
		end
        if playerId and 0 ~= tonumber(playerId) then
            local holder = nil
            if 1 == action then
                holder = self.applyPlayerInfoHodler
            else
                holder = self.otherPlayerInfoHolders[index]
                index = index + 1
            end
            TableUtil.download_seat_detail_info(playerId,function (playerInfo)
                holder.gameObject:SetActive(true)
                holder.headImage.sprite = playerInfo.headImage
            end,function(playerInfo)
                holder.gameObject:SetActive(true)
                holder.nameText.text = Util.filterPlayerName(playerInfo.playerName, 10)
            end)
            if(action == 0) then
                holder.agreeStateText.text = "<color=#995004>未回应</color>";
            elseif(action == 1) then
                holder.agreeStateText.text = "<color=#995004>发起"..curPlayerCount.."人开局，是否同意？</color>"
            elseif(action == 2) then
                holder.agreeStateText.text = "<color=#2daa00>已同意</color>"
            elseif(action == 3) then
                holder.agreeStateText.text = "<color=#995004>已拒绝</color>"
            end
        end

		if(i == self.curTableData.SeatID) then
			self.buttonAgree.interactable = (action == 0)
			self.buttonRefuse.interactable = (action == 0)
		end

    end
end

function EarlyStartView:update_beat()
    if self.leftTime then
        self:refresh_left_secs(self.leftTime)
    end
end

function EarlyStartView:refresh_left_secs(leftTime)
    if(leftTime >= self.timeDown and Time.realtimeSinceStartup - self.beginTime >= self.timeDown) then
        self.textLeftSecs.text = tostring(leftTime - self.timeDown).."s"
        self.leftSecsImage.fillAmount = (leftTime - self.timeDown) / leftTime
        self.timeDown = self.timeDown + 1
    end
end

return EarlyStartView