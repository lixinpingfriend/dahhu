local Class = require("lib.middleclass")
---@type DetailComViewBase
local Base = require("package.public.module.gamehistorydetails.detailscom_view_base")
---@class ZiPaiDetailComView:DetailComViewBase
local ZiPaiDetailComView = Class("ZiPaiDetailComView",Base)

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local Vector3 = Vector3
local GameObject = UnityEngine.GameObject
local ModuleCache = ModuleCache
local json = require "cjson"
local TableUtil = TableUtil
local TableManager = TableManager

function ZiPaiDetailComView:on_Init(comViewRoot)
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

function ZiPaiDetailComView:on_destroy()
    
end

function ZiPaiDetailComView:refresh_player_info(roomDetailsInfo)
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

function ZiPaiDetailComView:refresh_history_list(roomDetailsInfo)
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
				if roundInfo.gameName == "DHHNQP_XXZP" or roundInfo.gameName == "DHHNQP_LDZP" then
					
					scoreStr = math.floor(scoreStr) --服务器给的有浮点处理  四舍五入下
				end
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

function ZiPaiDetailComView:clear_history_list()
	if self.histtoryListItems then
		for i=1,#self.histtoryListItems do
			local historyItem = self.histtoryListItems[i]
			GameObject.Destroy(historyItem.gameObject)
		end
    end
    self.histtoryListItems = {}
end

function ZiPaiDetailComView:init_history_item(gameObject)
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

function ZiPaiDetailComView:RegisterHistoryItemEvent(historyItem)
    historyItem.playBackBtn.onClick:RemoveAllListeners()
    historyItem.playBackBtn.onClick:AddListener(function()
        local playBackInitData = {}
        playBackInitData.replayRoundInfos = {}
        for i=1,#self.histtoryListItems do
            local item = self.histtoryListItems[i]
            local roundInfo = item.roundInfo
            if item == historyItem then
                playBackInitData.curReplayIndex = i
            end
            table.insert(playBackInitData.replayRoundInfos,roundInfo)
        end
        local roundInfo = historyItem.roundInfo
        local data = {}
        data.recordId = roundInfo.replay
        data.gameId = roundInfo.gameName
        data.gameName = roundInfo.gameName
        local players = {}
        for i=1,#roundInfo.players do
            local player = {}
            player.userId = roundInfo.players[i].userId
            player.seatId =  roundInfo.players[i].seatId
            table.insert(players,player)
        end
        print("播放回放:"..data.recordId)
        TableManager:play_back(data,players,true,playBackInitData)
    end);

    historyItem.shareBtn.onClick:RemoveAllListeners()
    historyItem.shareBtn.onClick:AddListener(function()
        local roundInfo = historyItem.roundInfo
        print("分享回放 replay:"..roundInfo.replay.." roomId:"..roundInfo.roomId)
        TableManager:share_play_back_id(roundInfo.replay,roundInfo.roomId,roundInfo.gameName)
    end);

end

return ZiPaiDetailComView