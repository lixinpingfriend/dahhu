local class = require("lib.middleclass")
---@type Table3dCommonView
local BaseBase = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@type TableXueLiuChengHeView_3d
local Base = require('package.majiang3d.module.table3d.view.tablexueliuchenghe_view_3d')
---@class TableXueZhanDaoDiView_3d:TableXueLiuChengHeView_3d
local TableXueZhanDaoDiView_3d = class('tableXueZhanDaoDiView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

function TableXueZhanDaoDiView_3d:on_init_ui()
    self.bigHuaSwitchState:SwitchState("Normal")
    self.actionNang = GetComponentWithPath(self.waitAction, "Button_Nang", ComponentTypeName.Transform).gameObject
end

---获取操作的特效
function TableXueZhanDaoDiView_3d:get_action_tx(action)
    if(not self.curTableData.isPlayBack and action == self.actions.pass) then
        return 0
    end
    return action
end

---可听
function TableXueZhanDaoDiView_3d:show_ke_ting(show)
    if(#self.gameState.Dun <= 10) then
        return
    end
    self.actionNang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 可以显示过
function TableXueZhanDaoDiView_3d:can_show_guo()
    return not (self.actionHu.activeSelf and #self.gameState.Dun <= 10)
end


function TableXueZhanDaoDiView_3d:set_hand_data(params)
    if(not self.beginGame and self.selectSanZ and params.localSeat == 1) then
        return
    end
    BaseBase.set_hand_data(self, params)
end

function TableXueZhanDaoDiView_3d:play_action_tx(action, seatHolder)
    BaseBase.play_action_tx(self,action, seatHolder)
end

function TableXueZhanDaoDiView_3d:show_score(playerState, localSeat, serverSeat)
    BaseBase.show_score(self,playerState, localSeat, serverSeat)
end

TableXueZhanDaoDiView_3d.gold_table_show_score = nil

function TableXueZhanDaoDiView_3d:set_hua_data(params)
    BaseBase.set_hua_data(self,params)
    local localSeat = params.localSeat
    local playerState = params.playerState
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]
    local huaMj = seatHolder.mj3dHodler.HuaPaiMj
    for i=1,#huaMj do
        local mj3d = huaMj[i]
        local isZiMo = playerState.hupais[i].zimo
        if self:is_laizi(mj3d:Pai()) then
            local tex = self.tagSpriteH:FindSpriteByName(tostring(self.ConfigData.laiziTag or 4)).texture
            mj3d:setTag(tex)
        else
            local tex = nil
            if(isZiMo) then
                tex = self.huTagSpriteH:FindSpriteByName("0").texture
            else
                tex = self.huTagSpriteH:FindSpriteByName(playerState.hupais[i].pao .. "").texture
            end
            mj3d:setTag(tex)
        end
    end
end

function TableXueZhanDaoDiView_3d:set_hand_data(params)
    if(not self.beginGame and self.selectSanZ and params.localSeat == 1) then
        return
    end
    BaseBase.set_hand_data(self, params)
end

--- 花牌刷新之后 serverSeat 服务器座位 curHuaNum 当前花牌数量 preHuaNum 前次花牌数量
function TableXueZhanDaoDiView_3d:game_state_end_hua(params)
    BaseBase.game_state_end_hua(self,params)
end

return TableXueZhanDaoDiView_3d