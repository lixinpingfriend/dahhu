





local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableSuSongView_3d:Table3dCommonView
local TableSuSongView_3d = class('tableSuSongView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

function TableSuSongView_3d:init_ui()
    Base.init_ui(self)
    self.selectZun = GetComponentWithPath(self.root, "Bottom/Child/SelectZun", ComponentTypeName.Transform).gameObject
    self.selectZunChilds = TableUtil.get_all_child(self.selectZun)
end

--- 初始化单个座位
function TableSuSongView_3d:init_seat(seatHolder, index)
    Base.init_seat(self,seatHolder, index)
    seatHolder.waitZun = GetComponentWithPath(seatHolder.seatRoot, "Info/TextWaitZun", ComponentTypeName.Text)
end

--- 开始刷新gameState
function TableSuSongView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self.selectZun:SetActive(false)
end

function TableSuSongView_3d:show_table_pop(userState, i)
    Base.show_table_pop(self, userState, i)
    local state = userState.State[i]
    if(self:is_me(nil, state.SeatID) and state.PiaoType == 1) then
        local zunCount = 0
        if(self.gameState) then
            zunCount = self.gameState.zunnum
        end
        if(zunCount < 5) then
            self.selectZun:SetActive(true)
            for i=1,6 do
                self.selectZunChilds[i + 6]:SetActive(i - 1 < zunCount)
                self.selectZunChilds[i]:SetActive(not (i - 1 < zunCount))
            end
        end
    end
end

--- 隐藏牌桌额外弹窗（选跑漂等）
function TableSuSongView_3d:hide_table_pop()
    Base.hide_table_pop(self)
    self.selectZun:SetActive(false)
end

--- 别个已经准备的显示
function TableSuSongView_3d:show_other_ready(localSeat, seatData)
    local allReady = self:all_is_ready()
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.waitZun.gameObject:SetActive(allReady and seatData.PiaoType == 1)
end

function TableSuSongView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self,playerState, localSeat, serverSeat)
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_head_add_text3("")
    if playerState.FanShu > 0 and self:all_is_ready() then
        seatHolder:show_head_add_text3("花奖x"..tostring(playerState.FanShu))
    end
end

function TableSuSongView_3d:play_action_tx(action, seatInfo)
    if 77 == action then
        self:play_huajiang(seatInfo.seatId)
    else
        Base.play_action_tx(self,action, seatInfo)
    end
end

--- 播放花奖
function TableSuSongView_3d:play_huajiang(localSeat)
    ---@type SeatHolder3D
    local seatInfo = self.seatHolderArray[localSeat]
    seatInfo.huaAnimation:SetActive(true)
    local buhua = TableUtil.poor("HuaJiangTX", seatInfo.huaAnimation, Vector3.zero, self.poorObjs, self.clones)
    self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
        self.poorObjs = TableUtil.add_poor(buhua, self.poorObjs, self.cloneParent)
    end)
end

return  TableSuSongView_3d