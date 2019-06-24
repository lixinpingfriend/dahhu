





local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableLiChuanMaJiangView:TableCommonView
local TableLiChuanMaJiangView = class('tableLiChuanMaJiangView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color


function TableLiChuanMaJiangView:on_init_ui()
    Base.on_init_ui(self)

    self.actionBtBaoFeng = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoFeng", ComponentTypeName.Transform).gameObject
    self.actionBtBaoJiang = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoJiang", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTong = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTong", ComponentTypeName.Transform).gameObject
    self.actionBtBaoWan = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoWan", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTiao = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTiao", ComponentTypeName.Transform).gameObject

end

---获取操作的声音
function TableLiChuanMaJiangView:get_action_sound(action)
    if action == 76 then
        return 25
    else
        return Base.get_action_sound(self,action)
    end
end
---获取操作的特效
function TableLiChuanMaJiangView:get_action_tx(action)
    if action == 76 then
        return  25
    else
        return  Base.get_action_tx(self,action)
    end
end

--- 开始刷新gameState
function TableLiChuanMaJiangView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_bao(gameState)
end

---开始设置玩家状态（gameState）
function TableLiChuanMaJiangView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    local gangTex = ""
    if playerState.FanShu > 0 then
        gangTex = playerState.FanShu .. "杠"
    end
    seatHolder:show_head_add_text1(gangTex)
    seatHolder:show_head_add_text2("")
    self:show_player_ex_state(playerState,localSeat)
end

function TableLiChuanMaJiangView:show_player_ex_state(playerState,localSeat)
    Base.show_player_ex_state(self)
    local playerExStateHolders = self.PlayerExStateHolders
    local stateHodler = playerExStateHolders[localSeat]
    local tagName = nil
    stateHodler:hideTag()
    if 1 == playerState.Que then
        tagName = "qingyise"
    elseif 2 == playerState.Que then
        tagName = "qingyise"
    elseif 3 == playerState.Que then
        tagName = "qingyise"
    elseif 4 == playerState.Que then
        tagName = "fengyise"
    elseif 5 == playerState.Que then
        tagName = "jiangyise"
    end
    stateHodler:showTag(tagName)
end

---显示可报牌
function TableLiChuanMaJiangView:show_ke_bao(gameState)
    local KeBao = gameState.KeBao
    local show = #KeBao > 0

    self.actionBtBaoFeng:SetActive(false)
    self.actionBtBaoJiang:SetActive(false)
    self.actionBtBaoTong:SetActive(false)
    self.actionBtBaoWan:SetActive(false)
    self.actionBtBaoTiao:SetActive(false)

    for i=1,#KeBao do
        local baoValue = KeBao[i]
        if 1 == baoValue then  ---条
        self.actionBtBaoTiao:SetActive(true)
        elseif 2 == baoValue then ---万
        self.actionBtBaoWan:SetActive(true)
        elseif 3 == baoValue then ---筒
        self.actionBtBaoTong:SetActive(true)
        elseif 4 == baoValue then ---风
        self.actionBtBaoFeng:SetActive(true)
        elseif 5 == baoValue then ---将
        self.actionBtBaoJiang:SetActive(true)
        end
    end
    if(show) then
        self:show_wait_action()
    end
end

return  TableLiChuanMaJiangView