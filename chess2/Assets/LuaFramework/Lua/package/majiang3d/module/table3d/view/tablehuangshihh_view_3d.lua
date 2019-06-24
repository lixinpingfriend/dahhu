




local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableHuangShiHHView_3d:Table3dCommonView
local TableHuangShiHHView_3d = class('tableHuangShiHHView_3d', Base)

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color

local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")

function TableHuangShiHHView_3d:init_config()
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

function TableHuangShiHHView_3d:init_ui()
    Base.init_ui(self)
    self.Mj3dPool:setMjType(2) ---黄石晃晃用第二套麻将
    self.actionLiang = GetComponentWithPath(self.waitAction, "Button_Liang", ComponentTypeName.Transform).gameObject
end

---获取操作的声音
function TableHuangShiHHView_3d:get_action_sound(action)
    if(action == 14) then
        return 0
    end
    return Base.get_action_sound(self, action)
end

---获取操作的特效
function TableHuangShiHHView_3d:get_action_tx(action)
    if(action == 14) then
        return 0
    end
    return Base.get_action_tx(self, action)
end

--- 显示分数
function TableHuangShiHHView_3d:show_score(playerState, localSeat, serverSeat)
    local gameState = self.gameState
    ---@type SeatHolder3D
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
function TableHuangShiHHView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_head_add_text1(playerState.FanShu .. "番")
end

--- 设置手牌 handData 手牌数据 localSeat 本地座位 dataIndex 手牌数据索引 index 手牌索引
--- playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移
function TableHuangShiHHView_3d:set_hand_data(params)
    Base.set_hand_data(self, params)
    --[[---@type Mj3d
    local mj3d = params.mj3d
    if(not self:is_laizi(mj3d:Pai())) then
        for i=1,#self.gameState.HuaPai do
            if mj3d:Pai() == self.gameState.HuaPai[i] then
                local tex = self.tagSpriteH:FindSpriteByName(tostring(10)).texture
                mj3d:setTag(tex)
                break
            end
        end
    end--]]
end

function TableHuangShiHHView_3d:get_hand_tag_type(pai)
    local tagType = Base.get_hand_tag_type(self,pai)
    if(not self:is_laizi(pai)) then
        for i=1,#self.gameState.HuaPai do
            if pai == self.gameState.HuaPai[i] then
                tagType = self.ConfigData.huanghuangGangTag or 10
            end
        end
    end
    return tagType
end

--- 播放补花
function TableHuangShiHHView_3d:play_buhua(localSeat)

end

---本地模拟添加花牌
function TableHuangShiHHView_3d:local_simulation_add_hua(localSeat,pai)
    Base.local_simulation_add_hua(self,localSeat,pai)
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.mj3dHodler:addHuaPai(pai)
end

--- 设置弃牌 outData 弃牌数据 localSeat 本地座位 outIndex 索引 showPointer 显示箭头 lastOut 最后出的一个牌 serverSeat 服务器座位 playerState 玩家数据
function TableHuangShiHHView_3d:set_out_data(params)
    --params.notYellow = true
    Base.set_out_data(self, params)
end

function TableHuangShiHHView_3d:get_hua_tag_type(pai)
    local tagType = Base.get_hua_tag_type(self,pai)
    if(not self:is_laizi(pai)) then
        return 10
    end
end

--- 开始刷新gameState
function TableHuangShiHHView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_liang(gameState.KeLiangZFB)
end

---可亮
function TableHuangShiHHView_3d:show_ke_liang(show)
    self.actionLiang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 小结算时需要播放胡音效
function TableHuangShiHHView_3d:play_hu_sound_on_result()
    return false
end

---显示牌桌预览相关操作控件
function TableHuangShiHHView_3d:show_table_presettlement(show)
    Base.show_table_presettlement(self, show)
    self.preSettlementObj:SetActive(show)
end

--- 显示头像额外信息（跑漂等）
function TableHuangShiHHView_3d:show_head_add_info(localSeat, seatData, userState)
    if self.BriefOneResultPanel and self.BriefOneResultPanel.activeSelf then

    else
        Base.show_head_add_info(self,localSeat, seatData, userState)
    end
end

function TableHuangShiHHView_3d:show_brief_one_result(gameState)
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

return TableHuangShiHHView_3d