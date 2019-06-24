local Class = require("lib.middleclass")
---@type MajiangHistoryDisplayer
local Base = require("package.public.module.gamehistory.displayer.majiangHistoryDisplayer")
---@class ZiPaiHistoryDisplayer:MajiangHistoryDisplayer
local ZiPaiHistoryDisplayer = Class('ziPaiHistoryDisplayer',Base)

local json = require "cjson"

function ZiPaiHistoryDisplayer:fill_history_item_info(historyItem,historyData,museumData,config)
    Base.fill_history_item_info(self,historyItem,historyData,museumData,config)
    local roomTitelStr = "房号:"..string.tostring(historyData.roomNum)
    local gameNameStr =  config and config.name or ""
    local roundStr = historyData.roundNum.."/"..historyData.roundCount.."局"
    if historyData.gameId == "DHHNQP_XXZP" or historyData.gameId == "DHHNQP_LDZP"then
        roundStr = historyData.roundNum.."局"
    end
    roundStr = self:process_round_text_color(roundStr,historyData.roundCount)
    local parlorStr = (historyData.parlorNum ~= json.null and historyData.parlorNum ~= 0) and "圈号:"..historyData.parlorNum or ""
    historyItem.roomNameText.text = roomTitelStr.." "..gameNameStr.." "..roundStr.." "..parlorStr
end

return ZiPaiHistoryDisplayer                       