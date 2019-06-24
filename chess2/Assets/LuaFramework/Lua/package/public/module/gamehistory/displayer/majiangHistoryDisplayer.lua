local Class = require("lib.middleclass")
local Base = require("package.public.module.gamehistory.displayer.historyDisplayerBase")
---@class MajiangHistoryDisplayer
local MajiangHistoryDisplayer = Class('majiangHistoryDisplayer',Base)

local ModuleCache = ModuleCache
local GameObject = UnityEngine.GameObject
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local Vector3 = Vector3
local PlayModeUtil = ModuleCache.PlayModeUtil
local json = require "cjson"
local TableUtil = TableUtil

MajiangHistoryDisplayer.itemTemplateName = "MaJiangHistoryItem"

MajiangHistoryDisplayer.historyPlayerInfoSpacings = {155,155,155,155,71.5,21.25}


function MajiangHistoryDisplayer:init_history_item(gameObject)
	local historyItem = {}
	historyItem.gameObject = gameObject
	historyItem.Players = {}
	local playerRoot = GetComponentWithPath(historyItem.gameObject,"Players",ComponentTypeName.Transform).gameObject
	historyItem.playersHorLayoutGrid = GetComponentWithPath(playerRoot,"","UnityEngine.UI.HorizontalLayoutGroup")
	for i=1,6 do
		local player = {}
		player.gameObject = GetComponentWithPath(playerRoot,tostring(i),ComponentTypeName.Transform).gameObject
		player.headImage = GetComponentWithPath(player.gameObject,"Mask/HeadImage",ComponentTypeName.Image)
		player.nameText = GetComponentWithPath(player.gameObject,"Mask/Bg/NameText",ComponentTypeName.Text)
		player.scoreText = GetComponentWithPath(player.gameObject,"ScoreText",ComponentTypeName.Text)
		player.roomMasterTag = GetComponentWithPath(player.gameObject,"RoomMasterTag",ComponentTypeName.Transform).gameObject
		player.selfTag = GetComponentWithPath(player.gameObject,"Bg/SelfTag",ComponentTypeName.Transform).gameObject
		player.dissTag = GetComponentWithPath(player.gameObject,"Bg/DissTag",ComponentTypeName.Transform).gameObject

        player.parlorNumText = GetComponentWithPath(player.gameObject,"Mask/Bg (1)/parlorNumText",ComponentTypeName.Text)

        player.viewPayTag = GetComponentWithPath(player.gameObject,"ViewPayTag",ComponentTypeName.Transform).gameObject
        player.idText = GetComponentWithPath(player.gameObject,"IdText",ComponentTypeName.Text)



		table.insert(historyItem.Players,player)
	end
	historyItem.roomNameText = GetComponentWithPath(historyItem.gameObject,"Title/RoomNameText",ComponentTypeName.Text)
	historyItem.timeText = GetComponentWithPath(historyItem.gameObject,"Title/TimeText",ComponentTypeName.Text)
    historyItem.zhanjituBtn = GetComponentWithPath(historyItem.gameObject,"Title/zhanjituBtn",ComponentTypeName.Text)
    historyItem.stampBtn = GetComponentWithPath(historyItem.gameObject,"Title/stampBtn",ComponentTypeName.Transform).gameObject
    historyItem.stampTag = GetComponentWithPath(historyItem.gameObject,"Title/stampBtn/stampTag",ComponentTypeName.Transform).gameObject
	historyItem.clearCount = 0
	return historyItem
end

function MajiangHistoryDisplayer:clear_history_item(historyItem)
	historyItem.gameObject:SetActive(false)
	for j=1,#historyItem.Players do
		local holder = historyItem.Players[j]
		holder.headImage.sprite = nil
		holder.nameText.text = ""
		holder.scoreText.text = ""	
		holder.roomMasterTag:SetActive(false)
		holder.selfTag:SetActive(false)

        holder.parlorNumText.transform.parent.gameObject:SetActive(false)
        holder.viewPayTag:SetActive(false)
        holder.idText.text = ""	
	end
	historyItem.clearCount = historyItem.clearCount + 1
    historyItem.historyData = nil
end

function MajiangHistoryDisplayer:fill_history_item_info(historyItem,historyData,museumData,config)
    Base.fill_history_item_info(self,historyItem,historyData,museumData,config)
	local myUserId = tonumber(ModuleCache.GameManager.modeData.roleData.userID)
    local disUsers = string.split(string.tostring(historyData.disUser),",")
    local appRoomUserList = historyData.appRoomUserList
    historyItem.playersHorLayoutGrid.spacing = self.historyPlayerInfoSpacings[#appRoomUserList]
    local newAppRoomUserList= {}
    for i=1,#appRoomUserList do
        table.insert(newAppRoomUserList,appRoomUserList[i])
    end
    local bigWiner = 0
    if not museumData then
        historyItem.stampBtn:SetActive(false)
        historyItem.timeText.transform.anchoredPosition = Vector3(0,-33,0)
        for i=1,#newAppRoomUserList do
            local appRoomUser = newAppRoomUserList[i]
            if myUserId == appRoomUser.userId then
                table.remove(newAppRoomUserList,i)
                table.insert(newAppRoomUserList,1,appRoomUser)
                break
            end
        end
    else
        historyItem.stampBtn:SetActive(true)
        historyItem.timeText.transform.anchoredPosition = Vector3(-75,-33,0)
        if historyData.stamp == 0 then
            historyItem.stampTag:SetActive(false)
        elseif historyData.stamp == 1 then
            historyItem.stampTag:SetActive(true)
        end
        local bigWinerIndex = nil
        local maxFactScore = nil
        for i=1,#newAppRoomUserList do
            local appRoomUser = newAppRoomUserList[i]
            if nil == maxFactScore or (appRoomUser.factScore > maxFactScore) then
                maxFactScore = appRoomUser.factScore
                bigWinerIndex = i
            end
        end
        if bigWinerIndex then
            local appRoomUser = newAppRoomUserList[bigWinerIndex]
            table.remove(newAppRoomUserList,bigWinerIndex)
            table.insert(newAppRoomUserList,1,appRoomUser)
            bigWiner = appRoomUser.userId
        end
	end
    for j=1,#historyItem.Players do
        local player = historyItem.Players[j]
        if j > #newAppRoomUserList then
            player.gameObject:SetActive(false)
        else
            local appRoomUser = newAppRoomUserList[j]
            player.gameObject:SetActive(true)
            player.headImage.sprite = nil
            player.nameText.text = Util.filterPlayerName(string.tostring(appRoomUser.nickName), 10)


            player.parlorNumText.transform.parent.gameObject:SetActive(appRoomUser.sourceParlorNum and appRoomUser.sourceParlorNum ~= ModuleCache.Json.null and appRoomUser.sourceParlorNum ~=0)
            if appRoomUser.sourceParlorNum and appRoomUser.sourceParlorNum ~= ModuleCache.Json.null and appRoomUser.sourceParlorNum ~=0 then
                player.parlorNumText.text = "0".. appRoomUser.sourceParlorNum
            end

            local score =  appRoomUser.factScore == json.null and 0 or tonumber(appRoomUser.factScore)
            local scoreStr = tostring(score)
            if score >= 0 then
                scoreStr = "<color=#e62921>+"..scoreStr.."</color>"
            else
                scoreStr = "<color=#2daa00>"..scoreStr.."</color>"
            end
            player.scoreText.text = scoreStr
            player.roomMasterTag:SetActive(historyData.creatorId == appRoomUser.userId)
            if 0 ~= bigWiner then
                player.selfTag:SetActive(bigWiner == appRoomUser.userId)
            else
                player.selfTag:SetActive(myUserId == appRoomUser.userId)
            end
            player.dissTag:SetActive(false)
            player.viewPayTag:SetActive(appRoomUser.viewPay)
            player.idText.text = tostring(appRoomUser.userId)
            local clearCount = historyItem.clearCount
            ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(appRoomUser.headImg, function(err, sprite)
                if (err) then
            
                else
                    if clearCount == historyItem.clearCount then
                        player.headImage.sprite = sprite
                    end
                end
            end)
        end
    end
    local roomTitelStr = "房号:"..string.tostring(historyData.roomNum)
    local gameNameStr =  config and config.name or ""

    local roundStr = historyData.roundNum.."/"..historyData.roundCount.."局"
    roundStr = self:process_round_text_color(roundStr,historyData.roundCount)

    local playRule = TableUtil.convert_rule(historyData.playRule)
    if playRule.isDoubleQuan then
        roundStr = historyData.roundNum.."/"..historyData.roundCount.."圈"
    end

    local parlorStr = (historyData.parlorNum ~= json.null and historyData.parlorNum ~= 0) and "圈号:"..historyData.parlorNum or ""
    historyItem.roomNameText.text = roomTitelStr.." "..gameNameStr.." "..roundStr.." "..parlorStr

    local startTimeStr = "开始:"..string.tostring(historyData.playTime)
    if json.null == historyData.playTime then
        startTimeStr = ""
    end
    local endTimeStr = "结束:"..string.tostring(historyData.closeTime)
    if json.null == historyData.closeTime then
        endTimeStr = ""
    end
    local timeStr = startTimeStr.." "..endTimeStr
    timeStr = string.gsub(timeStr, "-", "/")
    historyItem.timeText.text = timeStr
end

function MajiangHistoryDisplayer:process_round_text_color(roundStr,maxRoundNum)
    local colorHead = "<color=#7a5844>"
    if maxRoundNum < 6 then
        colorHead = "<color=#4ea72e>"
    elseif 6 <= maxRoundNum and maxRoundNum < 9 then
        colorHead = "<color=#c6680c>"
    elseif 9 <= maxRoundNum and maxRoundNum < 13 then
        colorHead = "<color=#9d3e3e>"
    elseif 13 <= maxRoundNum and maxRoundNum < 17 then
        colorHead = "<color=#4ea72e>"
    elseif 17 <= maxRoundNum then
        colorHead = "<color=#4ea72e>"
    end
    local colorEnd = "</color>"
    roundStr = colorHead..roundStr..colorEnd
    return roundStr
end

return MajiangHistoryDisplayer                        