




local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableLiChuanMaJiangView_3d:Table3dCommonView
local TableLiChuanMaJiangView_3d = class('tableLiChuanMaJiangView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
local GameObject = UnityEngine.GameObject
local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
---@type Table3DHelper
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")


function TableLiChuanMaJiangView_3d:on_init_ui()
    Base.on_init_ui(self)

    self.actionBtBaoFeng = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoFeng", ComponentTypeName.Transform).gameObject
    self.actionBtBaoJiang = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoJiang", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTong = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTong", ComponentTypeName.Transform).gameObject
    self.actionBtBaoWan = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoWan", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTiao = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTiao", ComponentTypeName.Transform).gameObject

end


---获取操作的声音
function TableLiChuanMaJiangView_3d:get_action_sound(action)
    if action == 76 then
        return 25
    else
        return Base.get_action_sound(self,action)
    end
end
---获取操作的特效
function TableLiChuanMaJiangView_3d:get_action_tx(action)
    if action == 76 then
        return  25
    else
        return  Base.get_action_tx(self,action)
    end
end


--- 开始刷新gameState
function TableLiChuanMaJiangView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_bao(gameState)
end

---开始设置玩家状态（gameState）
function TableLiChuanMaJiangView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
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

function TableLiChuanMaJiangView_3d:show_player_ex_state(playerState,localSeat)
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
function TableLiChuanMaJiangView_3d:show_ke_bao(gameState)
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

function TableLiChuanMaJiangView_3d:check_lai_zi_need_simulation_add_to_hua()
    return false
end

---播放番癞子动画
function TableLiChuanMaJiangView_3d:playDisLaiGen(gameState,callBack)
    local laiGen = gameState.LaiGen
    if gameState.LaiGens and #gameState.LaiGens > 0 then
        laiGen = gameState.LaiGens[1]
    end

    if 0 == laiGen then
        if callBack then
            callBack()
        end
        return
    end

    self:hide_recommend_out_mj()

    local lastIndex = gameState.DunData.DunTiChu[1]
    if lastIndex then
        lastIndex = lastIndex + 1
    end
    ---@type Mj3d
    local anchorMj = self.Mj3dDun.dunMj3ds[lastIndex]
    if not anchorMj then
        anchorMj = self.Mj3dDun.dunMj3ds[#self.Mj3dDun.dunMj3ds]
    end
    if (not anchorMj) or (anchorMj.gameObject == nil) then
        if callBack then
            callBack()
        end
    end

    ---@type Mj3d
    local disMj3d = Mj3d:Create(laiGen,self.disLaiZiPoint.transform)
    disMj3d.transform.position = anchorMj.transform.position
    disMj3d.transform.eulerAngles = anchorMj.transform.eulerAngles
    disMj3d.transform.localScale = Vector3.one * 0.5
    disMj3d:setMj3dState(Mj3d.mj3dState.normal)

    local pos = self.disLaiZiPoint.transform.position
    local sequence = self:create_sequence()
    sequence:Append(disMj3d.transform:DOMove(pos,0.25)):OnComplete(function()
        disMj3d.transform.parent = self.aniLaiZiAnchorPoint.transform
        disMj3d.transform.localPosition = Vector3.zero
        disMj3d.transform.localEulerAngles = Vector3(0,0,90)
        disMj3d.transform.localScale = Vector3.one
        self.disLaiZiAniObj:SetActive(true)
        self:subscibe_time_event(1.3,false, 0):OnComplete(function()
            self.disLaiZiAniObj:SetActive(false)
            if 0 < #gameState.RecommendPai then
                self:show_recommend_out_mj(gameState.RecommendPai[1])
            end
            Mj3dHelper:clearMj3d(disMj3d)
            if callBack then
                callBack()
            end
        end)
    end)
end

function TableLiChuanMaJiangView_3d:playDiceAndDealAni(gameState,callBack)
    local handMjCountInfo = {}
    local ZhuangJia = gameState.ZhuangJia
    local count = ZhuangJia + 1 ---服务器的座位下标从0开始
    for i=1,#gameState.Player do
        if count > #gameState.Player then
            count = 1
        end
        local player = gameState.Player[count]
        count = count + 1
        local info = {}
        info.count = #player.ShouZhang
        info.localSeatIndex = self:server_to_local_seat(count - 1)
        info.optInidex = 1
        info.isCompate = false
        table.insert(handMjCountInfo,info)
    end
    local dunAniSpaceingTime = 0.02
    local indexOffset = gameState.DunStart
    local timeCount = 0
    local totalMjCount = #self.Mj3dDun.dunMj3ds - #gameState.Dun - 1---被玩家抓出去的牌
    self.Mj3dDun:optDunMjs(indexOffset,indexOffset + totalMjCount,function (mj3d)
        mj3d:setMj3Active(true)
        self:subscibe_time_event(dunAniSpaceingTime * timeCount, false, 0):OnComplete(function()
            mj3d:setMj3Active(false)
            self.Mj3dDun:processDunMjHover()
        end)
        timeCount = timeCount + 1
    end,true,true)
    if gameState.DunData then
        for i=1,#gameState.DunData.DunTiChu do
            local index = self.gameState.DunData.DunTiChu[i]
            if index then
                index = index + 1
            end
            local mj3d = self.Mj3dDun.dunMj3ds[index]
            if mj3d then
                self:subscibe_time_event(dunAniSpaceingTime * (timeCount - 1), false, 0):OnComplete(function()
                    mj3d:setMj3Active(false)
                    self.Mj3dDun:processDunMjHover()
                end)
            end
            timeCount = timeCount + 1
        end
    end
    local dunAniTotalTime = dunAniSpaceingTime * timeCount
    for i=1,#handMjCountInfo do
        local info = handMjCountInfo[i]
        local seat = self.seatHolderArray[info.localSeatIndex]
        self:subscibe_time_event(0.2 * (i-1), false, 0):OnComplete(function()
            self:playOneSeatDealAni(seat)
        end)
    end
    --[[self:subscibe_time_event(dunAniTotalTime, false, 0):OnComplete(function()
        self.Mj3dDun:processDunMjHover()
    end)--]]
    self:subscibe_time_event(dunAniTotalTime + 0.5, false, 0):OnComplete(function()
        if callBack then
            callBack()
        end
    end)
end

function TableLiChuanMaJiangView_3d:game_state_dun()
    Base.game_state_dun(self)

    if 0 ~= self.gameState.Dice1 and (not self.Diceed) then
        return
    end

    if self.gameState.DunData and self.gameState.DunData.DunTiChu then
        for i=1,#self.gameState.DunData.DunTiChu do
            local index = self.gameState.DunData.DunTiChu[i]
            if index then
                index = index + 1
            end
            ---@type Mj3d
            local mj3d = self.Mj3dDun.dunMj3ds[index]
            if mj3d then
                mj3d:setMj3Active(false)
            end
        end
    end

    self.Mj3dDun:processDunMjHover()
end

return  TableLiChuanMaJiangView_3d