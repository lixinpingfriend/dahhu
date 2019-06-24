local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableLiuZhouMaJiangController:TableCommonController
local TableLiuZhouMaJiangController = class('tableLiuZhouMaJiangController', Base)
local TableManager = TableManager
local ModuleCache = ModuleCache

--- 点击
--- 获取买马数据
function TableLiuZhouMaJiangController:get_mai_ma_data(gameState)
    local mySeat = self.view.newMySeat or self.view.mySeat
    local maiMa = {}
    for i=1,#gameState.Player do
        local playerState =  gameState.Player[i]
        if #playerState.MaPai > 0 then
            maiMa = playerState.MaPai
            break
        end
    end
    for i=1,#gameState.Player do
        local localSeat = self.view:server_to_local_seat(i - 1)
        local playerState =  gameState.Player[i]
        if 1 == localSeat and #playerState.MaPai > 0 then
            maiMa = playerState.MaPai
        end
    end
    if #maiMa <= 0 then
       maiMa = gameState.MaiMa
    end
    return maiMa
end

--- 显示买马 结算界面
function TableLiuZhouMaJiangController:show_mai_ma(gameState,time)
    time = 2
    local defWaitTime = self.view:need_use_brief_one_game_result(gameState.Result) and 0.5 or 2
    local waitTime = time or defWaitTime
    local maiMa = self:get_mai_ma_data(gameState)
    if # maiMa >0 then
        waitTime = #maiMa * 0.2 + 1.5 + waitTime
        self.module:subscibe_time_event(1.5, false, 0):OnComplete(function(t)
            if(self.module:can_show_result(gameState)) then
                ModuleCache.ModuleManager.show_module("majiang", "maima", 
                {
                    gameState = gameState,
                    userMultiple = true,
                })
            end
        end)
    end
    self.view:play_hu_sound(gameState)
    self.showOneResult = true
    self.module:subscibe_time_event(waitTime, false, 0):OnComplete(function(t)
        if(self.module:can_show_result(gameState)) then
            if(ModuleCache.ModuleManager.module_is_active("majiang", "maima")) then
                ModuleCache.ModuleManager.destroy_module("majiang", "maima")
            end
            local roomType = self.module.view.roomType
            roomType:on_show_one_game_result(gameState)
        end
    end)
end



return TableLiuZhouMaJiangController