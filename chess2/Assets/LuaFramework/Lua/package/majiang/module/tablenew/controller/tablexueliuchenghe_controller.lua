local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableXueLiuChengHeController
---@field view TableXueLiuChengHeView
---@field module TableMJModule
local TableXueLiuChengHeController = class('tableCommonController', Base)

local TableManager = TableManager


function TableXueLiuChengHeController:initialize(module)
    Base.initialize(self,module)
    if TableManager:cur_game_is_gold_room_type() then
        module.process_cahe_state_time_spaceing = 0.3
    end
end

--- 开始刷新gameState
function TableXueLiuChengHeController:game_state_begin(gameState)
    if(gameState.HuanSanZhang) then
        self.readyHuanSanZ = true
        self.waitHuanSanZ = (#gameState.Player[self.view.mySeat + 1].SanZhang == 0)
    end
    if(gameState.SanZhangType > 0 and self.readyHuanSanZ) then
        self.readyHuanSanZ = false
        self.waitHuanSanZ = false
        self.module:begin_cache_game_state()
        self.view:huan_san_zhang(gameState,
            function ()
                self.module:end_cache_game_state(self.module.gameState)
            end,
            function ()
                self.module:end_cache_game_state(self.module.gameState)
            end)
    end
    self:check_3d_action_effect_and_play(gameState)
end

--- 点击
function TableXueLiuChengHeController:on_click(obj, arg)
    if (obj.name == "Button_Huan") then
        self.model:request_huan_sanz(self.view.huanSanZhangPais)
    else
        Base.on_click(self, obj, arg)
    end
end

--- 点击我的手牌
function TableXueLiuChengHeController:click_my_hand_mj(obj)
    if(self.waitHuanSanZ) then
        self.view:click_select(obj)
    else
        Base.click_my_hand_mj(self, obj)
    end
end

function TableXueLiuChengHeController:check_3d_action_effect_and_play(gameState)
    local needCacheGameState = false
    for i=1,#gameState.Action do
        local action = gameState.Action[i]
        local serverSeat = action.SeatID
        local actionId = action.Action
        local realAction = self.view:get_action_tx(action.Action)
        local localSeat = self.view:server_to_local_seat(serverSeat)
        local seatHolder = self.view.seatHolderArray[localSeat]
        local playerState = gameState.Player[serverSeat + 1]

        if(realAction == 203 or realAction == 205) then
            if self.view.play_guafeng_effect then
                self.view:play_guafeng_effect(seatHolder)
            end
        elseif(realAction == 204) then
            if self.view.play_xiayu_effect then
                self.view:play_xiayu_effect()
            end
        end
    end
end

function TableXueLiuChengHeController:show_mai_ma(gameState,time)
    if TableManager:cur_game_is_gold_room_type() then
        time = time or 1.5
        if time < 1.5 then
            time = 1.5
        end
        local actions = gameState.Action
        local isZhuoHuaZhu = false
        for i=1,#actions do
            local action = actions[i]
            if action.Action == 42 or action.Action == 41 then
                isZhuoHuaZhu = true
                break
            end
        end
        if isZhuoHuaZhu then
            for i=1,#self.view.seatHolderArray do
                local seatHolder = self.view.seatHolderArray[i]
                local serverSeat = seatHolder.serverSeat
                local playerState = gameState.Player[serverSeat + 1]
                if playerState then
                    local change = playerState.ZongBeiShu - self.view.lastGameState.Player[serverSeat + 1].ZongBeiShu
                    if TableManager:cur_game_is_gold_room_type() then
                        change = 0
                        local scoreSettle =  gameState.ScoreSettle[serverSeat + 1]
                        if scoreSettle then
                            change = scoreSettle.ActualAmount
                        end
                    end
                    if 0 ~= change then
                        self.view:subscibe_time_event(1.5, false, 1):OnComplete(function(t)
                            self.view:show_player_score_change_display(seatHolder,change)
                            self.view:subscibe_time_event(1, false, 1):OnComplete(function(t)
                                self.view:hide_player_score_change_display(seatHolder.seatId)
                            end)  
                        end)
                        time = 2.5     
                    end
                end
            end
        else
            for i=1,#self.view.seatHolderArray do
                local seatHolder = self.view.seatHolderArray[i]
                local serverSeat = seatHolder.serverSeat
                local playerState = gameState.Player[serverSeat + 1]
                if playerState then
                    local change = playerState.ZongBeiShu - self.view.lastGameState.Player[serverSeat + 1].ZongBeiShu
                    if TableManager:cur_game_is_gold_room_type() then
                        change = 0
                        local scoreSettle =  gameState.ScoreSettle[serverSeat + 1]
                        if scoreSettle then
                            change = scoreSettle.ActualAmount
                        end
                    end
                    if 0 ~= change then
                        self.view:subscibe_time_event(1, false, 1):OnComplete(function(t)
                            self.view:show_player_score_change_display(seatHolder,change)
                            self.view:subscibe_time_event(1, false, 1):OnComplete(function(t)
                                self.view:hide_player_score_change_display(seatHolder.seatId)
                            end)  
                        end)
                        time = 2     
                    end
                end
            end
        end
        self.view:subscibe_time_event(2.5, false, 1):OnComplete(function(t)
            self.view:play_2d_effect_form_file("Effect_duizhanjieshu",2,self.view.table2dCenter.transform.position,self.view.table2dCenter)
        end)
        time = time + 1.5
        Base.show_mai_ma(self,gameState,time)
    else
        Base.show_mai_ma(self,gameState,time)
    end
end


return TableXueLiuChengHeController