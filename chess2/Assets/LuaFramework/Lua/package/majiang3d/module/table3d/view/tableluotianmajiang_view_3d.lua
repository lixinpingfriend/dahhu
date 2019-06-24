




local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableLuoTianMaJiangView:Table3dCommonView
local TableLuoTianMaJiangView_3d = class('tableLuoTianMaJiangView_3d', Base)
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

function TableLuoTianMaJiangView_3d:init_config()
    Base.init_config(self)
    self.actionSounds =
    {
        ["1"] = {"chi1"},
        ["2"] = {"peng1"},
        ["3"] = {"gang1"},
        ["4"] = {"gang1"},
        ["5"] = {"gang1"},
        ["6"] = {"dianpao1"},
        ["7"] = {"ting"},
        ["31"] = {"zimo1"},
        ["33"] = {"dianpao1"},
        ["52"] = {"gang_hongzhonggang"}, --红中杠
        ["53"] = {"gang_laizigang"}, --癞子杠
        ["54"] = {"hu_gangkai"}, --杠上开花
    }
end

function TableLuoTianMaJiangView_3d:on_init_ui()
    Base.on_init_ui(self)

    self.actionBtBaoFeng = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoFeng", ComponentTypeName.Transform).gameObject
    self.actionBtBaoJiang = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoJiang", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTong = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTong", ComponentTypeName.Transform).gameObject
    self.actionBtBaoWan = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoWan", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTiao = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTiao", ComponentTypeName.Transform).gameObject

end

--- 开始刷新gameState
function TableLuoTianMaJiangView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_bao(gameState)
end

---开始设置玩家状态（gameState）
function TableLuoTianMaJiangView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
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

function TableLuoTianMaJiangView_3d:show_player_ex_state(playerState,localSeat)
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
function TableLuoTianMaJiangView_3d:set_hand_data(params)
    params.notYellow = false
    Base.set_hand_data(self, params)
    ---@type Mj3d
    local mj3d = params.mj3d
    if(not self:is_laizi(mj3d:Pai())) then
        for i=1,#self.gameState.HuaPai do
            if mj3d:Pai() == self.gameState.HuaPai[i] then
                mj3d:setMj3dDefState(Mj3d.mj3dState.hlight)
                mj3d:setMj3dState(Mj3d.mj3dState.hlight)
                break  ---255 235 4
            end
        end
    else
        mj3d:setMj3dDefState(Mj3d.mj3dState.yellow)
        mj3d:setMj3dState(Mj3d.mj3dState.yellow)
    end
end

function TableLuoTianMaJiangView_3d:get_hand_tag_type(pai)
    local tagType = Base.get_hand_tag_type(self,pai)
    if(not self:is_laizi(pai)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType = 14
                break
            end
        end
    end
    return tagType
end

---显示可报牌
function TableLuoTianMaJiangView_3d:show_ke_bao(gameState)
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

function TableLuoTianMaJiangView_3d:set_hua_data(params)
    Base.set_hua_data(self, params)
    local localSeat = params.localSeat
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]
    local Mj3ds = seatHolder.mj3dHodler.HuaPaiMj
    for k=1,#Mj3ds do
        ---@type Mj3d
        local mj3d = Mj3ds[k]
        if(not self:is_laizi(mj3d:Pai())) then
            for i=1,#self.gameState.HuaPai do
                if mj3d:Pai() == self.gameState.HuaPai[i] then
                    mj3d:setMj3dDefState(Mj3d.mj3dState.hlight)
                    mj3d:setMj3dState(Mj3d.mj3dState.hlight)
                    break
                end
            end
        else
            mj3d:setMj3dDefState(Mj3d.mj3dState.yellow)
            mj3d:setMj3dState(Mj3d.mj3dState.yellow)
        end
    end
end

function TableLuoTianMaJiangView_3d:get_hua_tag_type(pai)
    local tagType = Base.get_hua_tag_type(self,pai)
    if(not self:is_laizi(pai)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType = 14
                break
            end
        end
    end
    return tagType
end

---播放番癞子动画
function TableLuoTianMaJiangView_3d:playDisLaiGen(gameState,callBack)
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

    local lastIndex = gameState.DunData.DunTiChu[1] + 1
    local anchorMj = self.Mj3dDun.dunMj3ds[lastIndex]

    ---@type Mj3d
    local disMj3d = Mj3d:Create(laiGen,anchorMj.transform.parent)
    disMj3d.transform.position = anchorMj.transform.position
    disMj3d.transform.eulerAngles = anchorMj.transform.eulerAngles
    disMj3d:setMj3dDefState(Mj3d.mj3dState.hlight)
    disMj3d:setMj3dState(Mj3d.mj3dState.hlight)
    disMj3d:setColliderState(false)
    disMj3d.gameObject.name = anchorMj.gameObject.name
    local effectObj = self:play_3d_effect("DaPai",nil,disMj3d.transform.position,self.Mj3dDun.rootTrans)
    self.cam3d.gameObject.transform.position = disMj3d.transform.position
    self.Mj3dDun.dunMj3ds[lastIndex] = disMj3d
    self.Mj3dDun:processDunMjHover()

    if "2" == anchorMj.transform.parent.parent.name then
        self.cam3d.gameObject.transform.localPosition = self.cam3d.gameObject.transform.localPosition + Vector3(15,13,5)
        self.cam3d.gameObject.transform.eulerAngles = Vector3(34,-110,0)
    elseif "3" == anchorMj.transform.parent.parent.name then
        self.cam3d.gameObject.transform.localPosition = self.cam3d.gameObject.transform.localPosition + Vector3(0,18,-23)
        self.cam3d.gameObject.transform.eulerAngles = Vector3(34,0,0)
    else
        self.cam3d.gameObject.transform.localPosition = self.cam3d.gameObject.transform.localPosition + Vector3(8,18,-23)
        self.cam3d.gameObject.transform.eulerAngles = Vector3(34,-20,0)
    end

    self.seatHolderArray[1].mj3dHodler:hideAllHandMj()
    Mj3dHelper:clearMj3d(anchorMj)

    self:subscibe_time_event(2,false, 0):OnComplete(function()
        self.cam3d.gameObject.transform.position = self.cam3dPos
        self.cam3d.gameObject.transform.eulerAngles = self.cam3deulerAngles
        self.seatHolderArray[1].mj3dHodler:showAllHandMj()
        GameObject.Destroy(effectObj)
        --disMj3d:setMj3dState(Mj3d.mj3dState.normal)
        if callBack then
            callBack()
        end
    end)
end

function TableLuoTianMaJiangView_3d:playDiceAndDealAni(gameState,callBack)
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
    local totalMjCount = #self.Mj3dDun.dunMj3ds - #gameState.Dun - 1 ---被玩家抓出去的牌
    self.Mj3dDun:optDunMjs(indexOffset,indexOffset + totalMjCount,function (mj3d)
        mj3d:setMj3Active(true)
        self:subscibe_time_event(dunAniSpaceingTime * timeCount, false, 0):OnComplete(function()
            mj3d:setMj3Active(false)
            self.Mj3dDun:processDunMjHover()
        end)
        timeCount = timeCount + 1
    end,true,true)
 
    local dunAniTotalTime = dunAniSpaceingTime * timeCount
    for i=1,#handMjCountInfo do
        local info = handMjCountInfo[i]
        local seat = self.seatHolderArray[info.localSeatIndex]
        self:subscibe_time_event(0.2 * (i-1), false, 0):OnComplete(function()
            self:playOneSeatDealAni(seat)
        end)
    end
    self:subscibe_time_event(dunAniTotalTime + 0.5, false, 0):OnComplete(function()
        if callBack then
            callBack()
        end
    end)
end

function TableLuoTianMaJiangView_3d:game_state_dun()
    Base.game_state_dun(self)

    if 0 ~= self.gameState.Dice1 and (not self.Diceed) then
        return
    end

    local laiGen = 0
    for i=1,#self.gameState.Dun do
        local dunPai = self.gameState.Dun[i]
        if 0 ~= dunPai then
            laiGen = dunPai
            break
        end
    end

    if self.gameState.Result ~= 0 then
        laiGen = 0
    end

    if 0 == laiGen then
        return
    end
    local lastIndex = 0
    if #self.gameState.DunData.DunTiChu > 0 then
        lastIndex = self.gameState.DunData.DunTiChu[1] + 1
    end
    if 0 == lastIndex then
        return
    end

    local anchorMj = self.Mj3dDun.dunMj3ds[lastIndex]
    local disMj3d = Mj3d:Create(laiGen,anchorMj.transform.parent)
    disMj3d.transform.position = anchorMj.transform.position
    disMj3d.transform.eulerAngles = anchorMj.transform.eulerAngles
    disMj3d:setMj3dDefState(Mj3d.mj3dState.hlight)
    disMj3d:setMj3dState(Mj3d.mj3dState.hlight)
    disMj3d:setColliderState(false)
    disMj3d.gameObject.name = anchorMj.gameObject.name
    self.Mj3dDun.dunMj3ds[lastIndex] = disMj3d
    Mj3dHelper:clearMj3d(anchorMj)

    self.Mj3dDun:processDunMjHover() 
end

---获取操作的声音
function TableLuoTianMaJiangView_3d:get_action_sound(action)
    if 67 == action then
        action = 3
    end
    local sound = Base.get_action_sound(self, action)
    if action == self.actions.hu then
        sound = 6
    end
    return sound
end

---获取操作的特效
function TableLuoTianMaJiangView_3d:get_action_tx(action)
    if 67 == action then
        action = 3
    end
    return Base.get_action_tx(self, action)
end

--- 小结算时需要播放胡音效
function TableLuoTianMaJiangView_3d:play_hu_sound_on_result()
    return false
end

--- 播放补花
function TableLuoTianMaJiangView_3d:play_buhua(localSeat) ---屏蔽补花

end

function TableLuoTianMaJiangView_3d:endPlayDiceAndDealAni()
    Base.endPlayDiceAndDealAni(self)
    local LaiZi = self.gameState.LaiZi
    if self.gameState.LaiZis and #self.gameState.LaiZis > 0 then
        LaiZi = self.gameState.LaiZis[1]
    end
    self:subscibe_time_event(0.05, false, 1):OnComplete(function(t)
        if self.ruleJsonInfo.FengBao and 28 <= LaiZi and LaiZi <= 34 then
            Base.show_player_ex_state(self)
            local playerExStateHolders = self.PlayerExStateHolders
            local stateHodler = playerExStateHolders[1]
            stateHodler:hideTag()
            stateHodler:showTag("fengbao")
            self:subscibe_time_event(2.5, false, 1):OnComplete(function(t)
                stateHodler:hideTag()
            end)    
        end
    end)    
end

return TableLuoTianMaJiangView_3d