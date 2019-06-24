local class = require("lib.middleclass")
---@type Table3dCommonView
local BaseBase = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@type TableXueLiuChengHeView_3d
local Base = require('package.majiang3d.module.table3d.view.tablexueliuchenghe_view_3d')
---@class TableRenShouXueZhanDaoDiView_3d:TableXueLiuChengHeView_3d
local tableRenShouXueZhanDaoDiView_3d = class('tableRenShouXueZhanDaoDiView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

function tableRenShouXueZhanDaoDiView_3d:on_init_ui()
    self.bigHuaSwitchState:SwitchState("Normal")
    self.actionNang = GetComponentWithPath(self.waitAction, "Button_Nang", ComponentTypeName.Transform).gameObject

    self.rsxzWaitStateTagsObj = GetComponentWithPath(self.root, "WaitStateTags",ComponentTypeName.Transform).gameObject
end

---获取操作的特效
function tableRenShouXueZhanDaoDiView_3d:get_action_tx(action)
    if(not self.curTableData.isPlayBack and action == self.actions.pass) then
        return 0
    end
    return action
end

---可听
function tableRenShouXueZhanDaoDiView_3d:show_ke_ting(show)
    --[[if(#self.gameState.Dun <= 10) then
        return
    end--]]
    self.actionNang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 可以显示过
function tableRenShouXueZhanDaoDiView_3d:can_show_guo()
    --return not (self.actionHu.activeSelf and #self.gameState.Dun <= 4)
    return true
end

function tableRenShouXueZhanDaoDiView_3d:game_state_begin(gameState)
    Base.game_state_begin(self,gameState)
    if self.ruleJsonInfo.isDoubleQuan then ---如果是跑圈而不是局数模式
        local roundCountText = "圈"..tostring(gameState.QuanData.currentQuan).."第"..tostring(gameState.QuanData.currentZhuang).."/"..tostring(gameState.QuanData.maxZhuang).."庄"
        self.jushu.text = roundCountText    
    end
end

function tableRenShouXueZhanDaoDiView_3d:show_ding_que(allQue)
    if 3 ~= self.totalSeat then
        Base.show_ding_que(self,allQue)
    end
end


---开始设置玩家状态（gameState）
function tableRenShouXueZhanDaoDiView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    self:show_player_ex_state(playerState,localSeat)
end

function tableRenShouXueZhanDaoDiView_3d:show_player_ex_state(playerState,localSeat)
    Base.show_player_ex_state(self)
    self.PlayerExStatePanel.transform:SetSiblingIndex(self.rsxzWaitStateTagsObj.transform:GetSiblingIndex())

    local playerExStateHolders = self.PlayerExStateHolders
    local stateHodler = playerExStateHolders[localSeat]
    local tagName = nil
    stateHodler:hideTag()
    if 1 == playerState.huPaiSep then
        tagName = "HuIndex1"
    elseif 2 == playerState.huPaiSep then
        tagName = "HuIndex2"
    elseif 3 == playerState.huPaiSep then
        tagName = "HuIndex3"
    end
    if self.gameState.Result ~= 0 then
        tagName = nil
    end
    stateHodler:showTag(tagName)
    stateHodler.bgImage.enabled = false
end

function tableRenShouXueZhanDaoDiView_3d:show_brief_one_result(gameState)
    Base.show_brief_one_result(self,gameState)
    local mySeat = self.newMySeat or self.mySeat
    for i=1,#gameState.Player do
        local localSeat = self:server_to_local_seat(i - 1,mySeat)
        local holder = self.BORPlayerHolders[localSeat]
        local playerState = gameState.Player[i]
        local ScoreSettle = gameState.ScoreSettle[i]
        local text = ""
        local count = 1
        for k=1,#playerState.HuFa do
            local hufa = playerState.HuFa[k]
            if hufa.display_type == 1 then
                local rTex = ""
                if count % 2 == 0 then
                    rTex = "\n"
                end
                text = text.."【"..tostring(hufa.Name).."】"..rTex
                count = count + 1
            end
        end
        holder.text.text = text
        local w = holder.text.preferredWidth > 280 and holder.text.preferredWidth or 280
        local h = 80 + holder.text.preferredHeight
        holder.bgImage.transform.sizeDelta = Vector2(w,h)
    end
end

function tableRenShouXueZhanDaoDiView_3d:game_state_end_down(serverSeat,changeType)
    Base.game_state_end_down(self,serverSeat,changeType)

    local localSeat = self:server_to_local_seat(serverSeat)
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]  
    ---@type Mj3dHodler
    local mj3dhodler = seatHolder.mj3dHodler
    local kans = mj3dhodler.Kan
    for i=1,#kans do
        ---@type Mj3dKan
        local kan = kans[i]
        if kan.kanType ~= kan.kanTypeEnum.jiegang then
            for j=1,#kan.Mj3ds do
                ---@type Mj3d
                local mj3d = kan.Mj3ds[j]
                mj3d:setMj3dDefState(mj3d.mj3dState.normal)
                mj3d:resetDefState()
            end
        end
    end
end

function tableRenShouXueZhanDaoDiView_3d:set_hand_data(params)
    if(not self.beginGame and self.selectSanZ and params.localSeat == 1) then
        return
    end
    BaseBase.set_hand_data(self, params)
end

function tableRenShouXueZhanDaoDiView_3d:play_action_tx(action, seatHolder)
    BaseBase.play_action_tx(self,action, seatHolder)
end

function tableRenShouXueZhanDaoDiView_3d:show_score(playerState, localSeat, serverSeat)
    BaseBase.show_score(self,playerState, localSeat, serverSeat)
end

tableRenShouXueZhanDaoDiView_3d.gold_table_show_score = nil

function tableRenShouXueZhanDaoDiView_3d:set_hua_data(params)
    BaseBase.set_hua_data(self,params)
    local localSeat = params.localSeat
    local playerState = params.playerState
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[localSeat]
    local huaMj = seatHolder.mj3dHodler.HuaPaiMj
    for i=1,#huaMj do
        local mj3d = huaMj[i]
        local isZiMo = playerState.hupais[i].zimo
        if self:is_laizi(mj3d:Pai()) then
            local tex = self.tagSpriteH:FindSpriteByName(tostring(self.ConfigData.laiziTag or 4)).texture
            mj3d:setTag(tex)
        else
            local tex = nil
            if(isZiMo) then
                tex = self.huTagSpriteH:FindSpriteByName("0").texture
            else
                tex = self.huTagSpriteH:FindSpriteByName(playerState.hupais[i].pao .. "").texture
            end
            mj3d:setTag(tex)
        end
    end
end

function tableRenShouXueZhanDaoDiView_3d:set_hand_data(params)
    if(not self.beginGame and self.selectSanZ and params.localSeat == 1) then
        return
    end
    BaseBase.set_hand_data(self, params)
end

--- 花牌刷新之后 serverSeat 服务器座位 curHuaNum 当前花牌数量 preHuaNum 前次花牌数量
function tableRenShouXueZhanDaoDiView_3d:game_state_end_hua(params)
    BaseBase.game_state_end_hua(self,params)
end

return tableRenShouXueZhanDaoDiView_3d