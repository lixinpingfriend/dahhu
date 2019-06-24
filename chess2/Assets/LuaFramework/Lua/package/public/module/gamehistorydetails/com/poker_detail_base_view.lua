local Class = require("lib.middleclass")
---@type DetailComViewBase
local Base = require("package.public.module.gamehistorydetails.detailscom_view_base")
---@class PokerDetailComView:DetailComViewBase
local PokerDetailComView = Class("PokerDetailComView",Base)

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local Vector3 = Vector3
local GameObject = UnityEngine.GameObject
local ModuleCache = ModuleCache
local json = require "cjson"
local TableUtil = TableUtil
local TableManager = TableManager

function PokerDetailComView:on_Init(comViewRoot)
    comViewRoot.transform.localPosition = Vector3(0,-48.5,0)
    self.historyItemTemplate = GetComponentWithPath(comViewRoot,"Holder/HistoryItem",ComponentTypeName.Transform).gameObject
    self.historyItemGridParent = GetComponentWithPath(comViewRoot,"ListScrollView/Viewport/Content",ComponentTypeName.Transform).gameObject
    self.playersInfoParent = GetComponentWithPath(comViewRoot,"PlayerTitel/Bg/Players",ComponentTypeName.Transform).gameObject
    self.histtoryListItems = {}
    self.playerInfoHolder = {}
    for i=1,6 do
        local playerinfoObj = GetComponentWithPath(self.playersInfoParent,tostring(i),ComponentTypeName.Transform).gameObject
        local holder = {}
        holder.gameObject = playerinfoObj
        holder.infoObj = GetComponentWithPath(holder.gameObject,"InfoObj",ComponentTypeName.Transform).gameObject
        holder.nameText = GetComponentWithPath(holder.infoObj,"NameText",ComponentTypeName.Text)
        holder.headImage = GetComponentWithPath(holder.infoObj,"Mask/HeadImage",ComponentTypeName.Image)
        holder.disTag = GetComponentWithPath(holder.infoObj,"DisTag",ComponentTypeName.Transform).gameObject
        holder.roomMasterTag = GetComponentWithPath(holder.infoObj,"RoomMasterTag",ComponentTypeName.Transform).gameObject
        table.insert(self.playerInfoHolder,holder)
    end
end

function PokerDetailComView:on_destroy()
    
end

function PokerDetailComView:refresh_player_info(roomDetailsInfo)
    local players = roomDetailsInfo.players 
    local disUsers = string.split(string.tostring(roomDetailsInfo.disUser),",")
    for i=1,#self.playerInfoHolder do
        local holder = self.playerInfoHolder[i]
        if i > #players then
            holder.infoObj:SetActive(false)
        else
            holder.infoObj:SetActive(true)
            local playerData = players[i]
            holder.nameText.text = Util.filterPlayerName(string.tostring(playerData.nickName), 10)
            holder.roomMasterTag:SetActive(roomDetailsInfo.creatorId == playerData.userId)
            holder.disTag:SetActive(disUsers and #disUsers > 0 and tonumber(disUsers[1]) == playerData.userId)

            local headUrl = string.tostring(playerData.headImg)
            if headUrl and headUrl ~= "" then
                ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(string.tostring(playerData.headImg), function(err, sprite)
                    if (err) then
                
                    else
                        holder.headImage.sprite = sprite
                    end
                end)
            end
        end
    end
end

function PokerDetailComView:refresh_history_list(roomDetailsInfo)
    self.roomDetailsInfo = roomDetailsInfo
	self:clear_history_list()
    local cacheCount = #self.histtoryListItems
    local roundInfos = roomDetailsInfo.roundInfos
    for i=1,#roundInfos do
        local itemObj = ComponentUtil.InstantiateLocal(self.historyItemTemplate,self.historyItemGridParent)
        itemObj.transform.localScale = Vector3.one
        itemObj.transform.localPosition = Vector3.zero
        local historyItem = self:init_history_item(itemObj)
        table.insert(self.histtoryListItems,historyItem)

        local roundInfo = roundInfos[i]
        historyItem.roundInfo = roundInfo
        historyItem.RoundText.text = tostring(i)
        historyItem.gameObject:SetActive(true)
        local playerInfos = roundInfo.players
        for j=1,#historyItem.Players do
            local holder = historyItem.Players[j]
            if j > #playerInfos then
                holder.infoObj:SetActive(false)
                holder.gameObject.name = "None"
            else
                holder.infoObj:SetActive(true)
                local playerInfo = playerInfos[j]
                holder.gameObject.name = tostring(playerInfo.userId)
                local scoreStr = playerInfo.factScore % 1 ~= 0 and tostring(playerInfo.factScore) or tostring(math.floor(playerInfo.factScore))
    			if playerInfo.factScore >= 0 then
                    scoreStr = "<color=#e62921>+"..scoreStr.."</color>"
                else
                    scoreStr = "<color=#2daa00>"..scoreStr.."</color>"
                end
                holder.scoreText.text = scoreStr
            end
        end
    end
    for i=1,#self.histtoryListItems do
        self:RegisterHistoryItemEvent(self.histtoryListItems[i])
    end
end

function PokerDetailComView:clear_history_list()
	if self.histtoryListItems then
		for i=1,#self.histtoryListItems do
			local historyItem = self.histtoryListItems[i]
			GameObject.Destroy(historyItem.gameObject)
		end
    end
    self.histtoryListItems = {}
end

function PokerDetailComView:init_history_item(gameObject)
	local historyItem = {}
	historyItem.gameObject = gameObject
	historyItem.Players = {}
	local playerRoot = GetComponentWithPath(historyItem.gameObject,"Players",ComponentTypeName.Transform).gameObject
	for i=1,6 do
		local player = {}
        player.gameObject = GetComponentWithPath(playerRoot,tostring(i),ComponentTypeName.Transform).gameObject
		player.infoObj = GetComponentWithPath(player.gameObject,"InfoObj",ComponentTypeName.Transform).gameObject
		player.scoreText = GetComponentWithPath(player.infoObj,"ScoreText",ComponentTypeName.Text)
		table.insert(historyItem.Players,player)
	end
	historyItem.RoundText = GetComponentWithPath(historyItem.gameObject,"Title/RoundText",ComponentTypeName.Text)
    historyItem.playBackBtn = GetComponentWithPath(historyItem.gameObject,"PlayBackButton",ComponentTypeName.Button)
    historyItem.shareBtn = GetComponentWithPath(historyItem.gameObject,"ShareButton",ComponentTypeName.Button)
    
	return historyItem
end

function PokerDetailComView:RegisterHistoryItemEvent(historyItem)
    historyItem.playBackBtn.onClick:RemoveAllListeners()
    historyItem.playBackBtn.onClick:AddListener(function()
        --replay
        --"gameName" = "DHGXQP_LZLZ_LZ"
        --"GameID" = "DHGXQP_LZLZ
        local playRuleInfo = self.roomDetailsInfo.playRuleInfo
        local gameId = playRuleInfo.GameID or playRuleInfo.gameId
        local roundInfo = historyItem.roundInfo
        local playBackInitData = {}
        playBackInitData.replayRoundInfos = {}
        for i=1,#self.histtoryListItems do
            local item = self.histtoryListItems[i]
            local roundInfo = item.roundInfo
            roundInfo.gameId = gameId
            roundInfo.gameName = gameId
            if item == historyItem then
                playBackInitData.curReplayIndex = i
            end
            table.insert(playBackInitData.replayRoundInfos,roundInfo)
        end
        local players = {}
        for i=1,#roundInfo.players do
            local player = {}
            player.userId = roundInfo.players[i].userId
            table.insert(players,player)
        end
        self:on_click_play_back_video(gameId, roundInfo.replay, players, playBackInitData)
    end);

    historyItem.shareBtn.onClick:RemoveAllListeners()
    historyItem.shareBtn.onClick:AddListener(function()
        local roundInfo = historyItem.roundInfo
        print("分享回放 replay:"..roundInfo.replay.." roomId:"..roundInfo.roomId)
        TableManager:share_play_back_id(roundInfo.replay,roundInfo.roomId,roundInfo.gameName)
    end);

end

function PokerDetailComView:on_click_play_back_video(gameId, recordId, players, playBackInitData)
    local data = {
        gameId = gameId,
        recordId = recordId,
        players = players,
        playBackInitData = playBackInitData,
    }
    TableManager:play_back_common_poker(data, data.players)
end


return PokerDetailComView