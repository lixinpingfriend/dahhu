





local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableXiShuiMaJiangView_3d:Table3dCommonView
local TableXiShuiMaJiangView_3d = class('tableXiShuiMaJiangView_3d', Base)

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color
local Vector3 = Vector3
local GameObject = UnityEngine.GameObject


local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")

function TableXiShuiMaJiangView_3d:on_init_ui()
    Base.on_init_ui(self)

    self.actionBtBaoFeng = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoFeng", ComponentTypeName.Transform).gameObject
    self.actionBtBaoJiang = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoJiang", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTong = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTong", ComponentTypeName.Transform).gameObject
    self.actionBtBaoWan = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoWan", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTiao = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTiao", ComponentTypeName.Transform).gameObject
end

--- 开始刷新gameState
function TableXiShuiMaJiangView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_bao(gameState)
end

---开始设置玩家状态（gameState）
function TableXiShuiMaJiangView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
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

function TableXiShuiMaJiangView_3d:show_player_ex_state(playerState,localSeat)
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

--- 设置手牌 handData 手牌数据 localSeat 本地座位 dataIndex 手牌数据索引 index 手牌索引
--- playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移
function TableXiShuiMaJiangView_3d:set_hand_data(params)
    Base.set_hand_data(self, params)
    ---@type Mj3d
    local mj3d = params.mj3d
    --[[if(not self:is_laizi(mj3d:Pai())) then
        for i=1,#self.gameState.HuaPai do
            if mj3d:Pai() == self.gameState.HuaPai[i] then
                local tex = self.tagSpriteH:FindSpriteByName(tostring(12)).texture
                mj3d:setTag(tex)
                break
            end
        end
    else
        local tex = self.tagSpriteH:FindSpriteByName(tostring(4)).texture
        mj3d:setTag(tex)
    end--]]
end

function TableXiShuiMaJiangView_3d:get_hand_tag_type(pai)
    local tagType = Base.get_hand_tag_type(self,pai)
    if(not self:is_laizi(pai)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType =  12
            end
        end
    end
    return tagType
end

---显示可报牌
function TableXiShuiMaJiangView_3d:show_ke_bao(gameState)
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

--- 设置花牌 huaData 花牌数据 localSeat 本地座位 huaIndex 索引 playerState 玩家数据
function TableXiShuiMaJiangView_3d:set_hua_data(params)
    params.notYellow = true
    Base.set_hua_data(self, params)
end


---播放番癞子动画
function TableXiShuiMaJiangView_3d:playDisLaiGen(gameState,callBack)
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
    if not anchorMj then
        if callBack then
            callBack()
        end
        return
    end

    ---@type Mj3d
    local disMj3d = Mj3d:Create(laiGen,self.disLaiZiPoint.transform)
    disMj3d.transform.position = anchorMj.transform.position
    disMj3d.transform.eulerAngles = anchorMj.transform.eulerAngles
    disMj3d.transform.localScale = Vector3.one * 0.5
    disMj3d:setMj3dState(Mj3d.mj3dState.normal)
    anchorMj:setMj3Active(false)

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

function TableXiShuiMaJiangView_3d:game_state_dun()
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

--- 播放补花
function TableXiShuiMaJiangView_3d:play_buhua(localSeat) ---屏蔽补花

end

---获取操作的声音
function TableXiShuiMaJiangView_3d:get_action_sound(action)
    if 67 == action or 53 ==  action then
        action = 3
    end
    return Base.get_action_sound(self, action)
end

---获取操作的特效
function TableXiShuiMaJiangView_3d:get_action_tx(action)
    if 67 == action or 53 ==  action then
        action = 3
    end
    return Base.get_action_tx(self, action)
end

--- 打出普通牌
function TableXiShuiMaJiangView_3d:play_custom(pai, localSeat)
    if self:is_laizi(pai) then
        return
    end
    Base.play_custom(self,pai,localSeat)
end

--- 显示头像额外信息（跑漂等）
function TableXiShuiMaJiangView_3d:show_head_add_info(localSeat, seatData, userState)
    if self.BriefOneResultPanel and self.BriefOneResultPanel.activeSelf then

    else
        Base.show_head_add_info(self,localSeat, seatData, userState)
    end
end

function TableXiShuiMaJiangView_3d:show_brief_one_result(gameState)
    Base.show_brief_one_result(self,gameState)
    local mySeat = self.newMySeat or self.mySeat
    for i=1,#gameState.Player do
        local localSeat = self:server_to_local_seat(i - 1,mySeat)
        local playerState = gameState.Player[i]
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[localSeat]
        seatHolder:show_head_add_text1(playerState.FanShu .. "杠")
    end
end

return TableXiShuiMaJiangView_3d