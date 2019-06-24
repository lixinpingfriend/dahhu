local class = require("lib.middleclass")
---@type TableTypeGold
local Base = require('package.majiang.module.tablenew.roomtype.table_type_gold')
---@class Table3dTypeGold:TableTypeGold
---@field view TableCommonView
local Table3dTypeGold = class('table3dTypeGold', Base)
local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local Vector3 = Vector3
local ModuleCache = ModuleCache
local Util = Util

function Table3dTypeGold:on_initialize()
    Base.on_initialize(self)
    self.Mj3dCenterCom = self.view.Mj3dCenterCom
    self.Mj3dCenterCom:switchDisableTagType(self.Mj3dCenterCom.disableStyle.gold)
end

--- 显示局数
function Table3dTypeGold:show_round(gameState)
    if gameState then
        Base.show_round(self,gameState)
        self.view.jushu.text = "底分:"..tostring(gameState.BaseCoinScore)
    end
end

---进入拦牌状态
function Table3dTypeGold:on_game_state_wait_action()
    Base.on_game_state_wait_action(self)
    self.view:begin_time_down(15, function (t)
        if not self.view.gameState then
            return
        end
        self.view:show_time_down(t)
        if(t == 3) then
            if(self.view.gameState.Result == 0) then
                self.view:play_voice("common/timedown")
            end
        end
        if t == 0 and self.view.gameState and  self.view.gameState.KeChu then
            if(self.view.openShake) then
                ModuleCache.GameSDKInterface:ShakePhone(1000)
            end
        end
    end)
end

--- 结束刷新gameState
--[[function Table3dTypeGold:game_state_end()
    Base.game_state_end(self)
    local gameState = self.view.gameState
    if self.view.gameState.Result == 1 then
        self:play_hu_hand_mj_effect(gameState)
    end
end

function Table3dTypeGold:play_hu_hand_mj_effect(gameState)
    local huPaiIndexs = {}
    for i=1,#gameState.Player do
        local state = gameState.Player[i]
        if(state.HuPai and #state.HuPai > 0) then 
            table.insert(huPaiIndexs,i)
        end
    end
    for i=1,#huPaiIndexs do
        local localSeat = self.view:server_to_local_seat(huPaiIndexs[i] - 1)
        ---@type SeatHolder3D 
        local seatHolder = self.view.seatHolderArray[localSeat]
        local hanMj = seatHolder.mj3dHodler.HandMj
        for i=1,#hanMj do
            ---@type Mj3d
            local mj3d = hanMj[i]
            local worldPos = mj3d.transform.position
            local effectObj = self.view:play_3d_effect_form_file("Effect_hupai_pai",2,worldPos,mj3d.transform.parent.gameObject)
        end
    end
end--]]

return Table3dTypeGold