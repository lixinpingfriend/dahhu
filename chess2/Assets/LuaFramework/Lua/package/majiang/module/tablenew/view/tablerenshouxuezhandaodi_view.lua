local class = require("lib.middleclass")
---@type TableCommonView
local BaseBase = require('package.majiang.module.tablenew.view.tablecommon_view')
local Base = require('package.majiang.module.tablenew.view.tablexueliuchenghe_view')
---@class TableRenShouXueZhanDaoDiView:TableXueLiuChengHeView
local TableRenShouXueZhanDaoDiView = class('tableRenShouXueZhanDaoDiView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

function TableRenShouXueZhanDaoDiView:on_init_ui()
    self.bigHuaSwitchState:SwitchState("Normal")
    self.actionNang = GetComponentWithPath(self.waitAction, "Button_Nang", ComponentTypeName.Transform).gameObject

    self.rsxzWaitStateTagsObj = GetComponentWithPath(self.root, "WaitStateTags",ComponentTypeName.Transform).gameObject
end

---获取操作的特效
function TableRenShouXueZhanDaoDiView:get_action_tx(action)
    if(not self.curTableData.isPlayBack and action == self.actions.pass) then
        return 0
    end
    return action
end

---可听
function TableRenShouXueZhanDaoDiView:show_ke_ting(show)
    --[[if(#self.gameState.Dun <= 10) then
        return
    end--]]
    self.actionNang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 可以显示过
function TableRenShouXueZhanDaoDiView:can_show_guo()
    --return not (self.actionHu.activeSelf and #self.gameState.Dun <= 4)
    return true
end

function TableRenShouXueZhanDaoDiView:game_state_begin(gameState)
    Base.game_state_begin(self,gameState)
    if self.ruleJsonInfo.isDoubleQuan then ---如果是跑圈而不是局数模式
        local roundCountText = "圈"..tostring(gameState.QuanData.currentQuan).."第"..tostring(gameState.QuanData.currentZhuang).."/"..tostring(gameState.QuanData.maxZhuang).."庄"
        self.jushu.text = roundCountText    
    end
end

function TableRenShouXueZhanDaoDiView:show_ding_que(allQue)
    if 3 ~= self.totalSeat then
        Base.show_ding_que(self,allQue)
    end
end

---开始设置玩家状态（gameState）
function TableRenShouXueZhanDaoDiView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    self:show_player_ex_state(playerState,localSeat)
end

function TableRenShouXueZhanDaoDiView:show_player_ex_state(playerState,localSeat)
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

function TableRenShouXueZhanDaoDiView:show_brief_one_result(gameState)
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


function TableRenShouXueZhanDaoDiView:set_down_data(params)
    local needProcess = true
    local Kan = params.downData
    if #Kan.Pai == 4 then
        local hasValueCount = 0
        for i=1,#Kan.Pai do
            if 0 ~= Kan.Pai[i] then
                hasValueCount = hasValueCount + 1
            end
        end
        if hasValueCount ~= 1 then
            local isJieGang = Kan.DianGang ~= -1 and Kan.DianGang ~= -2
            if isJieGang then
                needProcess = false ---接杠不处理，依然变色
            end
        end
    end
    if needProcess then
        Kan.JinZhang = -1
    end
    Base.set_down_data(self,params)
end

--[[function TableRenShouXueZhanDaoDiView:game_state_end_down(serverSeat,changeType)
    Base.game_state_end_down(self,serverSeat,changeType)

    local playerState = self.gameState.Player[serverSeat + 1]

    local needProcessIndexTable = {}
    for i=1,#playerState.XiaZhang do
        local Kan = playerState.XiaZhang[i]
        if #Kan.Pai == 4 then
            local hasValueCount = 0
            for i=1,#Kan.Pai do
                if 0 ~= Kan.Pai[i] then
                    hasValueCount = hasValueCount + 1
                end
            end
            if hasValueCount ~= 1 then
                local isJieGang = Kan.DianGang ~= -1 and Kan.DianGang ~= -2
                if isJieGang then
                    table.insert(needProcessIndexTable,i)
                end
            end
        end
    end

    local localSeat = self:server_to_local_seat(serverSeat)
    ---@type SeatHolder2d
    local seatHolder = self.seatHolderArray[localSeat]
    ---@type Mj2DHeapDown
    local mjHeapDown = seatHolder.mjHeapDown
    local mj2ds = mjHeapDown:list()
    for i=1,#mj2ds do
        
    end
end--]]

function TableRenShouXueZhanDaoDiView:play_action_tx(action, seatHolder)
    BaseBase.play_action_tx(self,action, seatHolder)
end


return  TableRenShouXueZhanDaoDiView