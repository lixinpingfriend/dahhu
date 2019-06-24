

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablehuangshihh_view')
---@class TableDaYeKaiKouFanView:TableHuangShiHHView
local TableDaYeKaiKouFanView = class('tableDaYeKaiKouFanView', Base)

--- 显示分数
function TableDaYeKaiKouFanView:show_score(playerState, localSeat, serverSeat)
    local gameState = self.gameState
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    local beishu = playerState.ZongBeiShu
    local change = playerState.ZongBeiShu - self.lastGameState.Player[serverSeat + 1].ZongBeiShu
    seatHolder:set_score(beishu)
    seatHolder:play_score_change_text(change)
end

return  TableDaYeKaiKouFanView