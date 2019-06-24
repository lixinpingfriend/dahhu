




local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableXiShuiMaJiangView:TableCommonView
local TableXiShuiMaJiangView = class('tableXiShuiMaJiangView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

function TableXiShuiMaJiangView:on_init_ui()
    Base.on_init_ui(self)

    self.actionBtBaoFeng = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoFeng", ComponentTypeName.Transform).gameObject
    self.actionBtBaoJiang = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoJiang", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTong = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTong", ComponentTypeName.Transform).gameObject
    self.actionBtBaoWan = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoWan", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTiao = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTiao", ComponentTypeName.Transform).gameObject

end

--- 开始刷新gameState
function TableXiShuiMaJiangView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_bao(gameState)
end

---开始设置玩家状态（gameState）
function TableXiShuiMaJiangView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
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

function TableXiShuiMaJiangView:show_player_ex_state(playerState,localSeat)
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
function TableXiShuiMaJiangView:set_hand_data(params)
    params.notYellow = true
    Base.set_hand_data(self, params)
    ---@type Mj2D
    local mj = params.mj
    if(not self:is_laizi(params.handData.Pai)) then
        --[[for i=1,#self.gameState.HuaPai do
            if mj.pai == self.gameState.HuaPai[i] then
                mj:set_tag(12, mj.skinObj)
                break
            end
        end--]]
    else
        mj:set_color(Color.yellow,mj.skinObj)
    end
end

function TableXiShuiMaJiangView:get_hand_tag_type(pai,gameState)
    local tagType = Base.get_hand_tag_type(self,pai,gameState)
    if(not self:is_laizi(pai,gameState)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType = 12
            end
        end
    end
    return tagType
end

---显示可报牌
function TableXiShuiMaJiangView:show_ke_bao(gameState)
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
function TableXiShuiMaJiangView:set_hua_data(params)
    params.notYellow = true
    Base.set_hua_data(self, params)
end

--- 播放补花
function TableXiShuiMaJiangView:play_buhua(localSeat) ---屏蔽补花

end

---获取操作的声音
function TableXiShuiMaJiangView:get_action_sound(action)
    if 67 == action or 53 ==  action then
        action = 3
    end
    return Base.get_action_sound(self, action)
end

---获取操作的特效
function TableXiShuiMaJiangView:get_action_tx(action)
    if 67 == action or 53 ==  action then
        action = 3
    end
    return Base.get_action_tx(self, action)
end

--- 打出普通牌
function TableXiShuiMaJiangView:play_custom(pai, localSeat)
    if self:is_laizi(pai) then
        return
    end
    Base.play_custom(self,pai,localSeat)
end

--- 显示头像额外信息（跑漂等）
function TableXiShuiMaJiangView:show_head_add_info(localSeat, seatData, userState)
    if self.BriefOneResultPanel and self.BriefOneResultPanel.activeSelf then

    else
        Base.show_head_add_info(self,localSeat, seatData, userState)
    end
end

--- 显示头像额外信息（跑漂等）
function TableXiShuiMaJiangView:show_head_add_info(localSeat, seatData, userState)
    if self.BriefOneResultPanel and self.BriefOneResultPanel.activeSelf then

    else
        Base.show_head_add_info(self,localSeat, seatData, userState)
    end
end

function TableXiShuiMaJiangView:show_brief_one_result(gameState)
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

return TableXiShuiMaJiangView