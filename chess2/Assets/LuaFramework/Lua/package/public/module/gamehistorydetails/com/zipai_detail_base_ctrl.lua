local Class = require("lib.middleclass")
---@type DetailComCtrlBase
local Base = require("package.public.module.gamehistorydetails.detailscom_ctrl_base")
---@class ZiPaiDetailComCtrl:DetailComCtrlBase
---@field comView ZiPaiDetailComView 
local ZiPaiDetailComCtrl = Class("ZiPaiDetailComCtrl",Base)

local TableManager = TableManager
local ModuleCache = ModuleCache

function ZiPaiDetailComCtrl:on_Init()

end

function ZiPaiDetailComCtrl:on_show(roomDetailsInfo)
    local newRoomDetailsInfo = self:sort_roomDetailsInfo(roomDetailsInfo)
    self.comView:refresh_player_info(newRoomDetailsInfo)
    self.comView:refresh_history_list(newRoomDetailsInfo)
end

function ZiPaiDetailComCtrl:sort_roomDetailsInfo(roomDetailsInfo)
    local newRoomDetailsInfo = {}
    setmetatable(newRoomDetailsInfo, { __index = roomDetailsInfo })
    local myUserId = tonumber(ModuleCache.GameManager.modeData.roleData.userID)

    for i=1,#newRoomDetailsInfo.players do
        local playerData = newRoomDetailsInfo.players[i]
        if playerData.userId == myUserId then
            table.remove(newRoomDetailsInfo.players,i)
            table.insert(newRoomDetailsInfo.players,1,playerData)
            break
        end
    end

    local roundInfos = newRoomDetailsInfo.roundInfos
    for i=1,#roundInfos do
        local roundInfo = roundInfos[i]
        for j=1,#roundInfo.players do
            local playerData = roundInfo.players[j]
            if playerData.userId == myUserId then
                table.remove(roundInfo.players,j)
                table.insert(roundInfo.players,1,playerData)
                break
            end
        end
    end
    return newRoomDetailsInfo
end

function ZiPaiDetailComCtrl:on_destroy()
    
end

function ZiPaiDetailComCtrl:on_click(obj, arg)
    --[[if obj.name == "PlayBackButton" then
        local curHisttoryItem = nil
        local playBackInitData = {}
        playBackInitData.replayRoundInfos = {}
        for i=1,#self.comView.histtoryListItems do
            local histtoryItem = self.comView.histtoryListItems[i]
            local roundInfo = histtoryItem.roundInfo
            if histtoryItem.playBackBtn == obj then
                curHisttoryItem = histtoryItem
                playBackInitData.curReplayIndex = i
            end
            table.insert(playBackInitData.replayRoundInfos,roundInfo)
        end
        if curHisttoryItem then
            local roundInfo = curHisttoryItem.roundInfo
            local data = {}
            data.recordId = roundInfo.replay
            local players = {}
            for i=1,#roundInfo.players do
                local player = {}
                player.userId = roundInfo.players[i].userId
                player.seatId =  roundInfo.players[i].seatId
                table.insert(players,player)
            end
            print("播放回放:"..data.recordId)
            TableManager:play_back(data,players,true,playBackInitData)
        end
    elseif obj.name == "ShareButton" then
        for i=1,#self.comView.histtoryListItems do
            local histtoryItem = self.comView.histtoryListItems[i]
            if histtoryItem.shareBtn == obj then
                local roundInfo = histtoryItem.roundInfo
                print("分享回放 replay:"..roundInfo.replay.." roomId:"..roundInfo.roomId)
                TableManager:share_play_back_id(roundInfo.replay,roundInfo.roomId)
                break
            end
        end
    end--]]
end


return ZiPaiDetailComCtrl