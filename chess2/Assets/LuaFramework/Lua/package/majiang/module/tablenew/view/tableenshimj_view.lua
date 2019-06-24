

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableEnShiMJView:TableCommonView
local TableEnShiMJView = class('tableEnShiMJView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color

function TableEnShiMJView:init_config()
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
        ["67"] = {"gang1"},
    }
end

function TableEnShiMJView:init_ui()
    Base.init_ui(self)
    self.actionLiang = GetComponentWithPath(self.waitAction, "Button_Liang", ComponentTypeName.Transform).gameObject
end

---获取操作的声音
function TableEnShiMJView:get_action_sound(action)
    if(action == 14) then
        return 0
    end
    return Base.get_action_sound(self, action)
end

---获取操作的特效
function TableEnShiMJView:get_action_tx(action)
    if(action == 14) then
        return 0
    elseif (action == 62 or action == 64) then
        return 162
    elseif (action == 59 or action == 61) then
        return 160
    elseif (action == 63 or action == 65) then
        action = 164
    end
    return Base.get_action_tx(self, action)
end

---播放操作的特效
function TableEnShiMJView:play_action_tx(action, seatInfo)
    if (action == 45) then
        return seatInfo:play_multi_action_tx({44, 43})
    elseif (action == 73) then
        return seatInfo:play_multi_action_tx({44, 55})
    elseif (action == 74) then
        return seatInfo:play_multi_action_tx({56, 55})
    elseif (action == 75) then
        return seatInfo:play_multi_action_tx({44, 58})
    elseif (action == 76) then
        return seatInfo:play_multi_action_tx({56, 58})
    elseif (action == 77) then
        return seatInfo:play_multi_action_tx({44, 66})
    elseif (action == 78) then
        return seatInfo:play_multi_action_tx({56, 66})
    elseif (action == 80) then
        return seatInfo:play_multi_action_tx({44, 79})
    elseif (action == 81) then
        return seatInfo:play_multi_action_tx({66, 79})
    elseif (action == 82) then
        return seatInfo:play_multi_action_tx({56, 79})
    elseif (action == 83) then
        return seatInfo:play_multi_action_tx({44, 66, 79})
    end
    return Base.play_action_tx(self, action, seatInfo)
end

--- 显示分数
function TableEnShiMJView:show_score(playerState, localSeat, serverSeat)
    local gameState = self.gameState
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    local beishu = playerState.ZongBeiShu
    local change = playerState.ZongBeiShu - self.lastGameState.Player[serverSeat + 1].ZongBeiShu
    beishu = beishu / 10
    change = change / 10
    seatHolder:set_score(beishu)
    seatHolder:play_score_change_text(change)
end

---开始设置玩家状态（gameState）
function TableEnShiMJView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_head_add_text1(playerState.FanShu .. "番")
end

--- 设置手牌 handData 手牌数据 localSeat 本地座位 dataIndex 手牌数据索引 index 手牌索引
--- playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移
function TableEnShiMJView:set_hand_data(params)
    params.notYellow = true
    Base.set_hand_data(self, params)
    --[[local isHua = false
    ---@type Mj2D
    local mj = params.mj
    if(not self:is_laizi(params.handData.Pai)) then
        for i=1,#self.gameState.HuaPai do
            if mj.pai == self.gameState.HuaPai[i] then
                isHua = true
                mj:set_tag(13, mj.skinObj)
                break
            end
        end
    end--]]
end

function TableEnShiMJView:get_hand_tag_type(pai,gameState)
    local tagType = Base.get_hand_tag_type(self,pai,gameState)
    if(not self:is_laizi(pai,gameState)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType = 13
                break
            end
        end
    end
    return tagType
end

--- 播放补花
function TableEnShiMJView:play_buhua(localSeat)

end

--- 设置下张牌堆 downData 下张数据 localSeat 本地座位 serverSeat 服务器座位 downIndex 索引
function TableEnShiMJView:set_down_data(params)
    params.notYellow = true
    Base.set_down_data(self, params)
end

--- 设置花牌 huaData 花牌数据 localSeat 本地座位 huaIndex 索引 playerState 玩家数据
function TableEnShiMJView:set_hua_data(params)
    params.notYellow = true
    Base.set_hua_data(self, params)
    --[[---@type Mj2D
    local mj = params.mj
    if self:is_pizi(params.huaData) then 
        mj:set_tag(13, mj.skinObj)
    elseif(not self:is_laizi(params.huaData)) then
        mj:set_tag(10, mj.skinObj)
    end--]]
end

function TableEnShiMJView:get_hua_tag_type(pai,gameState)
    local tagType = Base.get_hua_tag_type(self,pai,gameState)
    for i=1,#self.gameState.HuaPai do
        if pai == self.gameState.HuaPai[i] then
            if self:is_pizi(pai,gameState) then
                tagType = 13
            elseif(self:is_laizi(pai,gameState)) then
                tagType = 3
            end
            break
        end
    end
    return tagType
end

--- 设置弃牌 outData 弃牌数据 localSeat 本地座位 outIndex 索引 showPointer 显示箭头 lastOut 最后出的一个牌 serverSeat 服务器座位 playerState 玩家数据
function TableEnShiMJView:set_out_data(params)
    params.notYellow = true
    Base.set_out_data(self, params)
end

--- 开始刷新gameState
function TableEnShiMJView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_liang(gameState.KeLiangZFB)
end

---可亮
function TableEnShiMJView:show_ke_liang(show)
    self.actionLiang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 小结算时需要播放胡音效
function TableEnShiMJView:play_hu_sound_on_result()
    return true
end

---显示牌桌预览相关操作控件
function TableEnShiMJView:show_table_presettlement(show)
    Base.show_table_presettlement(self, show)
    self.preSettlementObj:SetActive(show)
end

---癞根
function TableEnShiMJView:game_state_lai_gen(show)
    Base.game_state_lai_gen(self, show)
    if self.ConfigData.laigenTagTitle then
        self.laiGenText.text = self.ConfigData.laigenTagTitle
    else
        self.laiGenText.text = "痞子"
    end
    if self.ConfigData.isBaPiSiLai then
        local gameState = self.gameState
        self.laiGenMJ1:SetActive(true);
        -- local grid = GetComponentWithPath(self.baoPai, "Grid", ComponentTypeName.Transform).gameObject
        -- grid.transform.localPosition = Vector3.New(grid.transform.localPosition.x, 350, grid.transform.localPosition.z)
        local laiGen2 = self:get_laigen(gameState.LaiGen);
        TableUtil.set_mj(laiGen2, self.laiGenMJ1, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_bg(1, self.laiGenMJ1, self.mjColorSet)
        if self.ConfigData.laigenTagTitle then
            self.laiGenText1.text = self.ConfigData.laigenTagTitle
        else
            self.laiGenText1.text = "痞子"
        end
    end
    
end

--- 是否是癞根
function TableEnShiMJView:is_pizi(pai)
    if self.ConfigData.isBaPiSiLai then
        return pai ~= 0 and (self.gameState.LaiGen == pai or pai == self:get_laigen(self.gameState.LaiGen))
    else
        return pai ~= 0 and self.gameState.LaiGen == pai
    end
end

function TableEnShiMJView:get_laigen(laiGen)
    if (laiGen%9 == 1) then
        return laiGen + 8
    else
        return laiGen - 1
    end
end

return  TableEnShiMJView