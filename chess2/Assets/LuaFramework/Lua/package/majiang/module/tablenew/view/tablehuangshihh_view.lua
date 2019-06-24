

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableHuangShiHHView:TableCommonView
local TableHuangShiHHView = class('tableHuangShiHHView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color

function TableHuangShiHHView:init_config()
    Base.init_config(self)
    self.actionSounds =
    {
        ["1"] = {"chi1","chi2"},
        ["2"] = {"peng1","peng2"},
        ["3"] = {"gang_bugang"},
        ["4"] = {"gang_angang"},
        ["5"] = {"gang1","gang2"},
        ["25"] = {"liangzhongfabai"},
        ["66"] = {"hu_pengpenghu"},
        ["44"] = {"hu_qingyise"},
        ["51"] = {"gang_fachaigang"},
        ["52"] = {"gang_hongzhonggang"},
        ["53"] = {"gang_laizigang"},
        ["54"] = {"hu_gangkai"},
        ["55"] = {"hu_haohuaqidui"},
        ["56"] = {"hu_jiangyise"},
        ["57"] = {"hu_zimoqidui"},
        ["58"] = {"hu_jiepaoqidui"},
        ["59"] = {"hu_menqingzimo"},
        ["61"] = {"hu_ruanmenqingzimo"},
        ["62"] = {"hu_pihu"},
        ["63"] = {"hu_ruanhuzimo"},
        ["64"] = {"hu_yinghujiepao"},
        ["65"] = {"hu_yingzimo"},
        ["31"] = {"zimo1"},
        ["33"] = {"dianpao1"},
    }
end

function TableHuangShiHHView:init_ui()
    Base.init_ui(self)
    self.actionLiang = GetComponentWithPath(self.waitAction, "Button_Liang", ComponentTypeName.Transform).gameObject
end

---获取操作的声音
function TableHuangShiHHView:get_action_sound(action)
    if(action == 14) then
        return 0
    end
    return Base.get_action_sound(self, action)
end

---获取操作的特效
function TableHuangShiHHView:get_action_tx(action)
    if(action == 14) then
        return 0
    end
    return Base.get_action_tx(self, action)
end

--- 显示分数
function TableHuangShiHHView:show_score(playerState, localSeat, serverSeat)
    local gameState = self.gameState
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    local beishu = playerState.ZongBeiShu
    local change = playerState.ZongBeiShu - self.lastGameState.Player[serverSeat + 1].ZongBeiShu
    beishu = beishu / (self.ConfigData.resultBeiShuScale or 1)
    change = change / (self.ConfigData.resultBeiShuScale or 1)
    seatHolder:set_score(beishu)
    local briefResultSetting  = self:getBriefOneGameResultSetting()
    local isBriefResult = self.ConfigData.useBriefOneGameResult and (briefResultSetting == 1)
    if isBriefResult then
        return
    end
    seatHolder:play_score_change_text(change)
end

---开始设置玩家状态（gameState）
function TableHuangShiHHView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_head_add_text1(playerState.FanShu .. "番")
end

--- 设置手牌 handData 手牌数据 localSeat 本地座位 dataIndex 手牌数据索引 index 手牌索引
--- playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移
function TableHuangShiHHView:set_hand_data(params)
    params.notYellow = true
    Base.set_hand_data(self, params)
    local isHua = false
    --[[---@type Mj2D
    local mj = params.mj
    if(not self:is_laizi(params.handData.Pai)) then
        for i=1,#self.gameState.HuaPai do
            if mj.pai == self.gameState.HuaPai[i] then
                isHua = true
                mj:set_tag(10, mj.skinObj)
                break
            end
        end
    end--]]
end

function TableHuangShiHHView:get_hand_tag_type(pai,gameState)
    local tagType = Base.get_hand_tag_type(self,pai,gameState)
    if(not self:is_laizi(pai,gameState)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType = self.ConfigData.huanghuangGangTag or 10
            end
        end
    end
    return tagType
end

--- 播放补花
function TableHuangShiHHView:play_buhua(localSeat)

end

--- 设置下张牌堆 downData 下张数据 localSeat 本地座位 serverSeat 服务器座位 downIndex 索引
function TableHuangShiHHView:set_down_data(params)
    params.notYellow = true
    Base.set_down_data(self, params)
end

--- 设置花牌 huaData 花牌数据 localSeat 本地座位 huaIndex 索引 playerState 玩家数据
function TableHuangShiHHView:set_hua_data(params)
    params.notYellow = true
    Base.set_hua_data(self, params)
    --[[---@type Mj2D
    local mj = params.mj
    if(not self:is_laizi(params.huaData)) then
        mj:set_tag(10, mj.skinObj)
    end--]]
end

function TableHuangShiHHView:get_hua_tag_type(pai,gameState)
    local tagType = Base.get_hua_tag_type(self,pai,gameState)
    if(not self:is_laizi(pai,gameState)) then
        return 10
    end
end

--- 设置弃牌 outData 弃牌数据 localSeat 本地座位 outIndex 索引 showPointer 显示箭头 lastOut 最后出的一个牌 serverSeat 服务器座位 playerState 玩家数据
function TableHuangShiHHView:set_out_data(params)
    params.notYellow = true
    Base.set_out_data(self, params)
end

--- 开始刷新gameState
function TableHuangShiHHView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_liang(gameState.KeLiangZFB)
end

---可亮
function TableHuangShiHHView:show_ke_liang(show)
    self.actionLiang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 小结算时需要播放胡音效
function TableHuangShiHHView:play_hu_sound_on_result()
    return false
end

---显示牌桌预览相关操作控件
function TableHuangShiHHView:show_table_presettlement(show)
    Base.show_table_presettlement(self, show)
    self.preSettlementObj:SetActive(show)
end

--- 显示头像额外信息（跑漂等）
function TableHuangShiHHView:show_head_add_info(localSeat, seatData, userState)
    if self.BriefOneResultPanel and self.BriefOneResultPanel.activeSelf then

    else
        Base.show_head_add_info(self,localSeat, seatData, userState)
    end
end

function TableHuangShiHHView:show_brief_one_result(gameState)
    Base.show_brief_one_result(self,gameState)
    local mySeat = self.newMySeat or self.mySeat
    for i=1,#gameState.Player do
        local localSeat = self:server_to_local_seat(i - 1,mySeat)
        local playerState = gameState.Player[i]
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[localSeat]
        seatHolder:show_head_add_text1(playerState.FanShu .. "番")
    end
end

return  TableHuangShiHHView