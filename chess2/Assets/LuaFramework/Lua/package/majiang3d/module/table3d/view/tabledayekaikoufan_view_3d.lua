





local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.tablehuangshihh_view_3d')
---@class TableDaYeKaiKouFanView_3d:TableHuangShiHHView_3d
local TableDaYeKaiKouFanView_3d = class('tableDaYeKaiKouFanView_3d', Base)

--- 显示分数
function TableDaYeKaiKouFanView_3d:show_score(playerState, localSeat, serverSeat)
    local gameState = self.gameState
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]
    local beishu = playerState.ZongBeiShu
    local change = playerState.ZongBeiShu - self.lastGameState.Player[serverSeat + 1].ZongBeiShu
    seatHolder:set_score(beishu)
    seatHolder:play_score_change_text(change)
end

return  TableDaYeKaiKouFanView_3d