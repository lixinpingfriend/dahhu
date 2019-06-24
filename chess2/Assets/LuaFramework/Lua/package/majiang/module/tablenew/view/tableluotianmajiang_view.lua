




local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableLuoTianMaJiangView:TableCommonView
local TableLuoTianMaJiangView = class('tableLuoTianMaJiangView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color

function TableLuoTianMaJiangView:init_config()
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


function TableLuoTianMaJiangView:on_init_ui()
    Base.on_init_ui(self)

    self.actionBtBaoFeng = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoFeng", ComponentTypeName.Transform).gameObject
    self.actionBtBaoJiang = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoJiang", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTong = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTong", ComponentTypeName.Transform).gameObject
    self.actionBtBaoWan = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoWan", ComponentTypeName.Transform).gameObject
    self.actionBtBaoTiao = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_BaoTiao", ComponentTypeName.Transform).gameObject

end

--- 开始刷新gameState
function TableLuoTianMaJiangView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_bao(gameState)
end

---结束刷新gameState
function TableLuoTianMaJiangView:game_state_end()
    Base.game_state_end(self)
    local LaiZi = self.gameState.LaiZi
    if self.gameState.LaiZis and #self.gameState.LaiZis > 0 then
        LaiZi = self.gameState.LaiZis[1]
    end
    self:subscibe_time_event(0.01, false, 1):OnComplete(function(t)
        if 0 ~= self.gameState.Dice1 and (not self.Diceed) then
            self.Diceed = true
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
        end
    end)  
end

function TableLuoTianMaJiangView:reset_state()
    Base.reset_state(self)
    self.Diceed = false
end

---开始设置玩家状态（gameState）
function TableLuoTianMaJiangView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
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

function TableLuoTianMaJiangView:show_player_ex_state(playerState,localSeat)
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
function TableLuoTianMaJiangView:set_hand_data(params)
    params.notYellow = false
    Base.set_hand_data(self, params)
    ---@type Mj2D
    local mj = params.mj
    if(not self:is_laizi(params.handData.Pai)) then
        for i=1,#self.gameState.HuaPai do
            if mj.pai == self.gameState.HuaPai[i] then
                mj:set_color(Color(255/255,143/255,0/255),mj.skinObj)
                break
            end
        end
    end
end

function TableLuoTianMaJiangView:get_hand_tag_type(pai,gameState)
    local tagType = Base.get_hand_tag_type(self,pai,gameState)
    if(not self:is_laizi(pai,gameState)) then
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
function TableLuoTianMaJiangView:show_ke_bao(gameState)
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

function TableLuoTianMaJiangView:set_hua_data(params)
    Base.set_hua_data(self, params)
    local mj = params.mj
    if(not self:is_laizi(mj.pai)) then
        for i=1,#self.gameState.HuaPai do
            if mj.pai == self.gameState.HuaPai[i] then
                mj:set_color(Color(255/255,143/255,0/255),mj.skinObj)
                break
            end
        end
    end
end

function TableLuoTianMaJiangView:get_hua_tag_type(pai,gameState)
    local tagType = Base.get_hua_tag_type(self,pai,gameState)
    if(not self:is_laizi(pai,gameState)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType = 14
                break
            end
        end
    end
    return tagType
end

---获取操作的声音
function TableLuoTianMaJiangView:get_action_sound(action)
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
function TableLuoTianMaJiangView:get_action_tx(action)
    if 67 == action then
        action = 3
    end
    return Base.get_action_tx(self, action)
end

--- 小结算时需要播放胡音效
function TableLuoTianMaJiangView:play_hu_sound_on_result()
    return false
end

--- 播放补花
function TableLuoTianMaJiangView:play_buhua(localSeat) ---屏蔽补花

end


return TableLuoTianMaJiangView