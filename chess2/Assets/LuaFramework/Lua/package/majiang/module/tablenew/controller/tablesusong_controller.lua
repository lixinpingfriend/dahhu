





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableSuSongController
local TableSuSongController = class('tableCommonController', Base)

--- 刷新用户状态
function TableSuSongController:refresh_user_state(data)
    local gameState = self.module.gameState
    for i=1,#data.State do
        if(self.curTableData.SeatID == i - 1) then
            local zunCount = 0
            if(gameState) then
                zunCount = gameState.zunnum
            end
            if(zunCount == 5 and data.State[i].PiaoType == 1) then
                self.model:request_select_piao({xiaojiScore = zunCount, paoScore = -1})
            end
        end
    end
end

return TableSuSongController