local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableXueLiuChengHeView_3d:Table3dCommonView
local TableXueLiuChengHeView_3d = class('tableXueLiuChengHeView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
local DG = DG
local lastMJOffset = 1
local Color = Color
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')

local TableManager = TableManager
---@type Table3DHelper
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")
---@type Mj3d
local Mj3d = require("package.majiang3d.module.table3d.Mj3d")


function TableXueLiuChengHeView_3d:init_ui()
    Base.init_ui(self)
    self.xlszObj = GetComponentWithPath(self.root, "Left/Child/XLSZ", ComponentTypeName.Transform).gameObject
    self.xlszGrid = GetComponentWithPath(self.root, "Left/Child/XLSZ/Grid", ComponentTypeName.Transform).gameObject
    self.xlszChilds = TableUtil.get_all_child(self.xlszGrid)
    self.xlszTitleText = GetComponentWithPath(self.root, "Left/Child/XLSZ/ImageText", ComponentTypeName.Text)
    self.buttongHuanSZ = GetComponentWithPath(self.root, "Center/Child/HuanTip/Button_Huan", ComponentTypeName.Transform).gameObject
    self.buttongHuanSZDisable = GetComponentWithPath(self.root, "Center/Child/HuanTip/Button_HuanDisable", ComponentTypeName.Transform).gameObject
    self.huanSanzTip = GetComponentWithPath(self.root, "Center/Child/HuanTip", ComponentTypeName.Transform).gameObject
    self.huTagSpriteH = GetComponentWithPath(self.root, "Root3D/HuTagSpriteH", "SpriteHolder")
    
    self.table2dCenter = GetComponentWithPath(self.root, "Center/Child", ComponentTypeName.Transform).gameObject

end

function TableXueLiuChengHeView_3d:on_init_ui()
    self.bigHuaSwitchState:SwitchState("BigHua")
end

--- 初始化单个座位
function TableXueLiuChengHeView_3d:init_seat(seatHolder, index)
    Base.init_seat(self,seatHolder, index)
    seatHolder.sanZObj = GetComponentWithPath(self.root, "Center/Child/ImageRandom/SanZ/" .. index, ComponentTypeName.Transform).gameObject
    seatHolder.sanZPos = seatHolder.sanZObj.transform.localPosition
    seatHolder.sanzObjChilds = TableUtil.get_all_child(seatHolder.sanZObj)
    if(index ~= 1) then
        seatHolder.sanzTipObj =  GetComponentWithPath(seatHolder.seatPosTran, "SanzTip", ComponentTypeName.Transform).gameObject
    end
end

function TableXueLiuChengHeView_3d:readyPlayDiceAndDealAni()
    Base.readyPlayDiceAndDealAni(self)
    for i=1,#self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        seatHolder.sanZObj:SetActive(false)
    end
    self.buttongHuanSZ:SetActive(false)
    self.buttongHuanSZDisable:SetActive(false)
    self.huanSanzTip:SetActive(false)
    for i=1,#self.seatHolderArray do
        ---@type SeatHolder3D
        local seatHolder = self.seatHolderArray[i]
        if seatHolder.sanzTipObj then
            seatHolder.sanzTipObj:SetActive(false)
        end
    end
end

function TableXueLiuChengHeView_3d:endPlayDiceAndDealAni()
    Base.endPlayDiceAndDealAni(self)
    for i=1,self.totalSeat do
        local localSeat = self:server_to_local_seat(i-1)
        local seatHolder = self.seatHolderArray[localSeat]
        local playerState = self.gameState.Player[i]
        seatHolder.sanZObj:SetActive(self.gameState.SanZhangType == 0 and #playerState.SanZhang > 0)
    end
    if(self.gameState.HuanSanZhang and #self.gameState.Player[self.mySeat + 1].SanZhang == 0) then
        self.buttongHuanSZDisable:SetActive(true)
        self.huanSanzTip:SetActive(true)
        self:init_hsz()
        self:recommend_san_zhang()
        for i=1,#self.seatHolderArray do
            ---@type SeatHolder3D
            local seatHolder = self.seatHolderArray[i]
            if seatHolder.enable then
                local playerState = self.gameState.Player[seatHolder.serverSeat + 1]
                if seatHolder.sanzTipObj and playerState and playerState.SanZhang == 0 then
                    seatHolder.sanzTipObj:SetActive(true)
                end            
            end
        end
    end
end

---开始设置玩家状态（gameState）
function TableXueLiuChengHeView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.sanZObj:SetActive(self.gameState.SanZhangType == 0 and #playerState.SanZhang > 0)
    if(seatHolder.sanZObj.activeSelf) then
        seatHolder.sanZObj.transform.localPosition = seatHolder.sanZPos
        for i = 1, #seatHolder.sanzObjChilds do
            local mj = Mj2D:new(0, nil, {gameObject = seatHolder.sanzObjChilds[i]})
            mj.state = 1
            mj:set_skin(self.mjColorSet, self.mjScaleSet)
            MjManager.insert(mj, MjManager.mjType.custom)
        end
        if(localSeat == 1) then
            self.buttongHuanSZ:SetActive(false)
            self.buttongHuanSZDisable:SetActive(false)
            self.huanSanzTip:SetActive(false)
        end
    end
    if(localSeat == 1) then
        if(playerState.SanZhangToOther and #playerState.SanZhangToOther > 0) then
            self.xlszObj:SetActive(true)
            local titles = {"换下家","换上家","换对家"}
            local huanType = 1
            for j = 1, #playerState.SanZhangToOther do
                local data = playerState.SanZhangToOther[j]
                huanType = data.type
                ---@type Mj2D
                local mj = Mj2D:new(data.pai, nil, {gameObject = self.xlszChilds[j], spriteHolder = self.frontSpriteH})
                mj:set_skin(self.mjColorSet, self.mjScaleSet)
                MjManager.insert(mj, MjManager.mjType.custom)
            end
            self.xlszTitleText.text = titles[huanType]
        end
    end
    self.selectSanZ = false --- 我在选三张（不能刷新自己的手牌）
    if(self.gameState.HuanSanZhang and #playerState.SanZhang == 0) then
        if(localSeat == 1) then
            self.selectSanZ = true
        else
            seatHolder.sanzTipObj:SetActive(true)
        end
    elseif(localSeat ~= 1) then
        seatHolder.sanzTipObj:SetActive(false)
    end
end

--- 手牌刷新之前 serverSeat 服务器座位
function TableXueLiuChengHeView_3d:game_state_begin_hand(serverSeat)
    if(not self.beginGame and self.selectSanZ and serverSeat == self.mySeat) then
        return
    end
    Base.game_state_begin_hand(self, serverSeat)
end

--- 设置手牌 handData 手牌数据 localSeat 本地座位 index 位置索引 playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移 dataIndex 数据索引
function TableXueLiuChengHeView_3d:set_hand_data(params)
    if(not self.beginGame and self.selectSanZ and params.localSeat == 1) then
        return
    end
    Base.set_hand_data(self, params)
    local showHu = params.showHu
    if showHu and  1 ~= params.localSeat then
        ---@type Mj3d
        local mj3d = params.mj3d
        local worldPos = mj3d.transform.position
        
        local gameState = self.gameState
        local ziMoIndex = 0
        for i=1,#gameState.Player do
            local state = gameState.Player[i]
            if(state.HuPai and #state.HuPai > 0 and gameState.DianPao == -1 and ziMoIndex == 0) then --没有点炮
                ziMoIndex = i
            end
        end
        local effectObj = nil
        if 0 ~= ziMoIndex and params.localSeat == self:server_to_local_seat(ziMoIndex - 1) then
            effectObj = self:play_3d_effect_form_file("Effect_hupai_zimo",2,worldPos,mj3d.transform.parent.gameObject)
        else
            effectObj = self:play_3d_effect_form_file("Effect_hupai_fangpao",2,worldPos,mj3d.transform.parent.gameObject)
        end
        effectObj.transform.localPosition = Vector3(effectObj.transform.localPosition.x,
            -7,
            effectObj.transform.localPosition.z)
    end
end

--- 手牌刷新之后 serverSeat 服务器座位
function TableXueLiuChengHeView_3d:game_state_end_hand(serverSeat)
    if(not self.beginGame and self.selectSanZ and serverSeat == self.mySeat) then
        return
    end
    Base.game_state_end_hand(self,serverSeat,self.gameState)
end

function TableXueLiuChengHeView_3d:get_action_tx(action)
    if(action == self.actions.mingGang or action == self.actions.anGang or action == self.actions.dianGang) then
        return 200 + action
    end
    return Base.get_action_tx(self, action)
end

function TableXueLiuChengHeView_3d:play_action_tx(action, seatHolder)
    if TableManager:cur_game_is_gold_room_type() then
        if 41 == action then
            self:play_2d_effect_form_file("Effect_chadajiao",2,seatHolder.chuTXPos.transform.position,seatHolder.chuTXPos,0.75)
        elseif 42 == action then
            self:play_2d_effect_form_file("Effect_chahuazhu",2,seatHolder.chuTXPos.transform.position,seatHolder.chuTXPos,0.75)
        elseif action == self.actions.chi then
            self:play_2d_effect_form_file("Effect_common_chi",2,seatHolder.chuTXPos.transform.position,seatHolder.chuTXPos,0.75)
        elseif action == self.actions.peng then
            self:play_2d_effect_form_file("Effect_common_peng",2,seatHolder.chuTXPos.transform.position,seatHolder.chuTXPos,0.75)
        elseif action == self.actions.mingGang then
            self:play_2d_effect_form_file("Effect_common_gang",2,seatHolder.chuTXPos.transform.position,seatHolder.chuTXPos,0.75)
        elseif action == self.actions.hu then
            self:play_2d_effect_form_file("Effect_common_hu",2,seatHolder.chuTXPos.transform.position,seatHolder.chuTXPos,0.75)
        elseif action == self.actions.zimo then
            self:play_2d_effect_form_file("Effect_common_zimo",2,seatHolder.chuTXPos.transform.position,seatHolder.chuTXPos,0.75)
        else
            Base.play_action_tx(self,action, seatHolder)
        end
    else
        Base.play_action_tx(self,action, seatHolder)
    end
end

---显示听牌标志
function TableXueLiuChengHeView_3d:show_ting_pai_tag(localSeat, show)

end

--- 设置花牌 huaData 花牌数据 localSeat 本地座位 huaIndex 索引 playerState 玩家数据
function TableXueLiuChengHeView_3d:set_hua_data(params)
    Base.set_hua_data(self,params)
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

--- 花牌刷新之后 serverSeat 服务器座位 curHuaNum 当前花牌数量 preHuaNum 前次花牌数量
function TableXueLiuChengHeView_3d:game_state_end_hua(params)
    Base.game_state_end_hua(self,params)
    if TableManager:cur_game_is_gold_room_type() then
        local serverSeat = params.serverSeat
        local localSeat = self:server_to_local_seat(serverSeat)
        ---@type SeatHolder3D
        local seatHolder = self.seatHolderArray[localSeat]
        local huaMj = seatHolder.mj3dHodler.HuaPaiMj
        local playerState = self.gameState.Player[serverSeat + 1]
        local isInitRefresh = (self.gameState == self.lastGameState)
        local preHuaNum = params.preHuaNum
    
        local needPlayeEffectInfoTable = {}
        for i=1,#huaMj do
            local mj3d = huaMj[i]
            local isZiMo = playerState.hupais[i].zimo
            if i > preHuaNum and (not isInitRefresh) then
                local effectInfo = {}
                effectInfo.isZiMo = isZiMo
                effectInfo.mj3d = mj3d
                table.insert(needPlayeEffectInfoTable,effectInfo)
            end
        end
    
        if #needPlayeEffectInfoTable > 0 then
            local fangPaoLocalSeat = nil
            local fangpaoPai = nil
            local fangpaoServerSeat = nil
            local fangpaoLastPlayerState = nil
            for i=1,#self.lastGameState.Player do
                local ps = self.lastGameState.Player[i]
                if ps.ChuPaiCnt > 0 then
                    fangpaoServerSeat = i - 1
                    fangPaoLocalSeat = self:server_to_local_seat(fangpaoServerSeat)
                    fangpaoLastPlayerState = self.lastGameState.Player[i]
                    fangpaoPai = ps.QiZhang[#ps.QiZhang - (ps.ChuPaiCnt - 1)]
                    break
                end
            end
    
            local hasJiePao = false
            for i=1,#needPlayeEffectInfoTable do
                local mj3d = needPlayeEffectInfoTable[i].mj3d
                local isZiMo = needPlayeEffectInfoTable[i].isZiMo
                if not isZiMo then
                    hasJiePao = true
                    break
                end
            end
    
            if not hasJiePao then
                fangPaoLocalSeat = nil
            end
    
            local playEffect = function ()
                for i=1,#needPlayeEffectInfoTable do
                    local mj3d = needPlayeEffectInfoTable[i].mj3d
                    local isZiMo = needPlayeEffectInfoTable[i].isZiMo
                    local effectObj = nil
                    if isZiMo then
                        effectObj = self:play_3d_effect_form_file("Effect_hupai_zimo",2,mj3d.transform.position,mj3d.transform.parent.gameObject)
                    else
                        effectObj = self:play_3d_effect_form_file("Effect_hupai_fangpao",2,mj3d.transform.position,mj3d.transform.parent.gameObject)
                    end
                    effectObj.transform.localPosition = Vector3(effectObj.transform.localPosition.x,
                        -7,
                        effectObj.transform.localPosition.z)
                end
            end
    
            if fangPaoLocalSeat then
                ---@type SeatHolder3D
                local fangpaoSeatHolder = self.seatHolderArray[fangPaoLocalSeat]
                ---@type Mj3dThrowMj
                local throw = fangpaoSeatHolder.mj3dHodler.Throw
                local tempOutMj3d = Mj3d:Create(fangpaoPai,throw.gameObject.transform)
                tempOutMj3d.transform.localPosition = throw.Mjs[#throw.Mjs] and throw.Mjs[#throw.Mjs].transform.localPosition or tempOutMj3d.transform.localPosition
                local effectObj = self:play_3d_effect_form_file("Effect_hupai_fangpao",2,tempOutMj3d.transform.position,tempOutMj3d.transform.parent.gameObject)
                effectObj.transform.localPosition 
                    = Vector3(effectObj.transform.localPosition.x,-7,effectObj.transform.localPosition.z)
                for i=1,#needPlayeEffectInfoTable do
                    needPlayeEffectInfoTable[i].mj3d.gameObject:SetActive(false)
                end
                Mj3dHelper:getModule():begin_cache_game_state()
                self:subscibe_time_event(1, false, 0):OnComplete(function(t) 
                    Mj3dHelper:clearMj3d(tempOutMj3d)
                    for i=1,#needPlayeEffectInfoTable do
                        needPlayeEffectInfoTable[i].mj3d.gameObject:SetActive(true)
                    end
                    playEffect()
                    local change = playerState.ZongBeiShu - self.lastGameState.Player[serverSeat + 1].ZongBeiShu
                    local fangPaoChange = self.gameState.Player[fangpaoServerSeat + 1].ZongBeiShu - fangpaoLastPlayerState.ZongBeiShu
                    if TableManager:cur_game_is_gold_room_type() then
                        change = 0
                        fangPaoChange = 0 
                        for i=1,#self.gameState.ScoreSettle do
                            local scoresettle = self.gameState.ScoreSettle[i]
                            if scoresettle.SeatID == serverSeat then
                                change = scoresettle.ActualAmount
                            elseif scoresettle.SeatID == fangpaoServerSeat then
                                fangPaoChange = scoresettle.ActualAmount
                            end
                        end
                    end
                    self:subscibe_time_event(1, false, 0):OnComplete(function(t) 
                        self:play_hu_hand_mj3d_effect(localSeat)
                        self:subscibe_time_event(1, false, 0):OnComplete(function(t) 
                            if 0 ~= change or 0 ~= fangPaoChange then
                                if 0 ~= change then
                                    self:show_player_score_change_display(seatHolder,change) 
                                end
                                if 0 ~= fangPaoChange then
                                    self:show_player_score_change_display(fangpaoSeatHolder,fangPaoChange)
                                end
                                self:subscibe_time_event(1, false, 1):OnComplete(function(t)
                                    self:hide_player_score_change_display(seatHolder.seatId)
                                    self:hide_player_score_change_display(fangpaoSeatHolder.seatId)
                                    Mj3dHelper:getModule():end_cache_game_state()
                                end)  
                            else
                                Mj3dHelper:getModule():end_cache_game_state()
                            end
                        end)
                    end)
                end)
            else
                playEffect()
                local change = playerState.ZongBeiShu - self.lastGameState.Player[serverSeat + 1].ZongBeiShu
                local otherChange = {}
                if TableManager:cur_game_is_gold_room_type() then
                    change = 0
                    for i=1,#self.gameState.ScoreSettle do
                        local scoresettle = self.gameState.ScoreSettle[i]
                        if scoresettle.SeatID == serverSeat then
                            change = scoresettle.ActualAmount
                        else
                            table.insert(otherChange,
                            {
                                SeatID = scoresettle.SeatID,
                                ActualAmount = scoresettle.ActualAmount,
                            })
                        end
                    end
                end
                Mj3dHelper:getModule():begin_cache_game_state()
                self:subscibe_time_event(1, false, 0):OnComplete(function(t) 
                    self:play_hu_hand_mj3d_effect(localSeat)
                    self:subscibe_time_event(1, false, 0):OnComplete(function(t) 
                        if 0 ~= change then
                            for i=1,#otherChange do
                                if otherChange[i].SeatID ~= serverSeat then
                                    local localSeatPos = self:server_to_local_seat(otherChange[i].SeatID)
                                    self:show_player_score_change_display(self.seatHolderArray[localSeatPos],otherChange[i].ActualAmount)
                                    self:subscibe_time_event(1, false, 1):OnComplete(function(t)
                                        self:hide_player_score_change_display(localSeatPos)
                                    end)
                                end
                            end
                            self:show_player_score_change_display(seatHolder,change)
                            self:subscibe_time_event(1, false, 1):OnComplete(function(t)
                                self:hide_player_score_change_display(seatHolder.seatId)
                                Mj3dHelper:getModule():end_cache_game_state()
                            end)
                        else
                            Mj3dHelper:getModule():end_cache_game_state()
                        end
                    end)
                end)
            end
        end
    end
end

--- 小结算时需要播放胡音效
function TableXueLiuChengHeView_3d:play_hu_sound_on_result()
    return false
end

--- 可以显示过
function TableXueLiuChengHeView_3d:can_show_guo()
    return not (#self.gameState.Player[self.mySeat + 1].HuaPai > 0 and self.actionHu.activeSelf)
end

--- 是否是观察者模式
function TableXueLiuChengHeView_3d:is_observer_mode()
    return self.isHuanSanZhang or Base.is_observer_mode(self)
end

--- 换三张 callback 刚换完牌之后的回调 callback1 我换来的三张牌插入动画之后的回调
function TableXueLiuChengHeView_3d:huan_san_zhang(gameState, callback, callback1)
    local height = 224
    self.isHuanSanZhang = true
    self.waitHSZ = false
    if(gameState.SanZhangType == 1) then --顺时针
        for i = 1, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            local pathVectors = {}
            for j = 1, 5 do
                local x,y=0
                if(i == 1) then
                    y = -height+(height/5)*j
                    x = -self:get_ellipse_x(y)
                elseif(i == 2) then
                    y = -(height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 3) then
                    y = height-(height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 4) then
                    y = (height/5)*j
                    x = -self:get_ellipse_x(y)
                end
                if 3 == self.totalSeat and seatHolder.seatId == 4 then
                    pathVectors = {}
                    table.insert(pathVectors, Vector3.New(0,0,0))
                    table.insert(pathVectors, Vector3.New(382,0,0))
                end
                table.insert(pathVectors, Vector3.New(x,y,0))
            end
            seatHolder.sanZObj.transform:DOLocalPath(pathVectors, 1, DG.Tweening.PathType.CatmullRom)
        end
    elseif(gameState.SanZhangType == 2) then
        for i = 1, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            local pathVectors = {}
            for j = 1, 5 do
                local x,y=0
                if(i == 1) then
                    y = -height+(height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 2) then
                    y = (height/5)*j
                    x = self:get_ellipse_x(y)
                elseif(i == 3) then
                    y = height-(height/5)*j
                    x = -self:get_ellipse_x(y)
                elseif(i == 4) then
                    y = -(height/5)*j
                    x = -self:get_ellipse_x(y)
                end
                table.insert(pathVectors, Vector3.New(x,y,0))
            end
            if 3 == self.totalSeat and seatHolder.seatId == 2 then
                pathVectors = {}
                table.insert(pathVectors, Vector3.New(0,0,0))
                table.insert(pathVectors, Vector3.New(-382,0,0))
            end
            seatHolder.sanZObj.transform:DOLocalPath(pathVectors, 1, DG.Tweening.PathType.CatmullRom)
        end
    elseif(gameState.SanZhangType == 3) then
        for i = 1, #self.seatHolderArray do
            local seatHolder = self.seatHolderArray[i]
            if(i == 1) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[3].sanZPos, 1, false)
            elseif(i == 2) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[4].sanZPos, 1, false)
            elseif(i == 3) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[1].sanZPos, 1, false)
            elseif(i == 4) then
                seatHolder.sanZObj.transform:DOLocalMove(self.seatHolderArray[2].sanZPos, 1, false)
            end
        end
    end
    self:subscibe_time_event(2, false, 0):OnComplete(function(t)
        if(callback) then
            callback()
        end
        self:add_san_zhang_animation(callback1)
    end)
end

--- 添加三张动画
function TableXueLiuChengHeView_3d:add_san_zhang_animation(callback)
    local aniObjs = {}
    ---@type SeatHolder3D
    local mySeatHolder = self.seatHolderArray[1]
    local myHandMj = mySeatHolder.mj3dHodler.HandMj
    for i = 1, #myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        if(mj3d.shouZhangData.IsFromOther) then
            table.insert(aniObjs, mj3d.gameObject)
            mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, lastMJOffset, 0)
        end
    end
    for i = 1, #aniObjs do
        aniObjs[i].transform:DOLocalMoveY(0, 0.8, false)
    end
    self:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
        self.isHuanSanZhang = false
        if(callback) then
            callback()
        end
    end)
end

--- 计算椭圆的x值
function TableXueLiuChengHeView_3d:get_ellipse_x(y)
    local width = 382
    local height = 224
    return math.sqrt((1-(y*y)/(height*height))*(width*width))
end

---定缺条件
function TableXueLiuChengHeView_3d:can_ding_que()
    return not self.isHuanSanZhang and not self.gameState.HuanSanZhang
end

--- 初始化换三张的牌
function TableXueLiuChengHeView_3d:init_hsz()
    self.huanSanZhangPais = {}
    ---@type SeatHolder3D
    local mySeatHolder = self.seatHolderArray[1]
    local myHandMj = mySeatHolder.mj3dHodler.HandMj
    for i = 1,#myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        local pai = mj3d:Pai()
        mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, 0, mj3d.transform.localPosition.z)
    end
    --[[self.huanSanZhangPais = {}
    ---@type SeatHolder3D
    local mySeatHolder = self.seatHolderArray[1]
    local myHandMj = mySeatHolder.mj3dHodler.HandMj
    for i = 1,#myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        local pai = mj3d:Pai()
        local isGray = not self:not_need_gray(pai)
        mj3d:setColliderState(not isGray)
        if(isGray) then
            mj3d:setMj3dDefState(mj3d.mj3dState.gray)
        else
            mj3d:setMj3dDefState(mj3d.mj3dState.normal)
        end
        mj3d:resetDefState()
    end--]]
end

function TableXueLiuChengHeView_3d:pai_is_same_type(pai1,pai2)
    if ((1 <= pai1) and (pai1 <= 9) and (1 <= pai2) and (pai2 <= 9)) then
        return true
    elseif ((10 <= pai1) and (pai1 <= 18) and (10 <= pai2) and (pai2 <= 18)) then
        return true
    elseif ((19 <= pai1) and (pai1 <= 27) and (19 <= pai2) and (pai2 <= 27)) then
        return true
    end
    return false
end

--- 点击选择换三张
function TableXueLiuChengHeView_3d:click_select(mj3d)
    local pai = mj3d:Pai()
    local needInit = false
    for i=1,#self.huanSanZhangPais do
        local pai2 = self.huanSanZhangPais[i]
        if not self:pai_is_same_type(pai,pai2) then
            needInit = true
            break
        end
    end
    if needInit then
        self:init_hsz()
        mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, lastMJOffset, mj3d.transform.localPosition.z)
        table.insert(self.huanSanZhangPais, pai)
        self.buttongHuanSZ:SetActive(#self.huanSanZhangPais == 3)
        self.buttongHuanSZDisable:SetActive(#self.huanSanZhangPais ~= 3)
    else
        if(mj3d.transform.localPosition.y < lastMJOffset and #self.huanSanZhangPais < 3) then
            mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, lastMJOffset, mj3d.transform.localPosition.z)
            table.insert(self.huanSanZhangPais, pai)
        elseif(mj3d.transform.localPosition.y > 0) then
            mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, 0, mj3d.transform.localPosition.z)
            TableUtil.remove_table_index(self.huanSanZhangPais, pai)
        end
        if(#self.huanSanZhangPais == 0) then
            self:init_hsz()
        else
            self.buttongHuanSZ:SetActive(#self.huanSanZhangPais == 3)
            self.buttongHuanSZDisable:SetActive(#self.huanSanZhangPais ~= 3)
        end
    end
    --[[local pai = mj3d:Pai()

    if(mj3d.transform.localPosition.y < lastMJOffset and #self.huanSanZhangPais < 3) then
        mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, lastMJOffset, mj3d.transform.localPosition.z)
        table.insert(self.huanSanZhangPais, pai)
    elseif(mj3d.transform.localPosition.y > 0) then
        mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, 0, mj3d.transform.localPosition.z)
        TableUtil.remove_table_index(self.huanSanZhangPais, pai)
    end

    if(#self.huanSanZhangPais == 0) then
        self:init_hsz()
    else
        local paiType = 0
        local upPai = self.huanSanZhangPais[1]
        if(upPai >= 1 and upPai <= 9) then
            paiType = 1
        elseif(upPai >= 10 and upPai <= 18) then
            paiType = 2
        elseif(upPai >= 19 and upPai <= 27) then
            paiType = 3
        end
        ---@type SeatHolder3D
        local mySeatHolder = self.seatHolderArray[1]
        local myHandMj = mySeatHolder.mj3dHodler.HandMj
        for i = 1, #myHandMj do
            ---@type Mj3d
            local mj3d = myHandMj[i]
            local pai = mj3d:Pai()
            local isGray = not self:not_need_gray_select(pai, paiType)
            mj3d:setColliderState(not isGray)
            if(isGray) then
                mj3d:setMj3dDefState(mj3d.mj3dState.gray)
            else
                mj3d:setMj3dDefState(mj3d.mj3dState.normal)
            end
            mj3d:resetDefState()
        end
        self.buttongHuanSZ:SetActive(#self.huanSanZhangPais == 3)
        self.buttongHuanSZDisable:SetActive(#self.huanSanZhangPais ~= 3)
    end--]]
end

--- 选三张时不需要灰显的牌
function TableXueLiuChengHeView_3d:not_need_gray_select(pai, paiType)
    return (pai >= 1 and pai <= 9 and paiType == 1) or (pai >= 10 and pai <= 18 and paiType == 2) or (pai >= 19 and pai <= 27 and paiType == 3)
end

--- 换三张初始化不需要灰显的牌
function TableXueLiuChengHeView_3d:not_need_gray(pai)
    local table1 = {}
    local table2 = {}
    local table3 = {}
    ---@type SeatHolder3D
    local mySeatHolder = self.seatHolderArray[1]
    local myHandMj = mySeatHolder.mj3dHodler.HandMj
    for i = 1, #myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        local pai = mj3d:Pai()
        if(pai >= 1 and pai <= 9) then
            table.insert(table1, pai)
        end
        if(pai >= 10 and pai <= 18) then
            table.insert(table2, pai)
        end
        if(pai >= 19 and pai <= 27) then
            table.insert(table3, pai)
        end
    end
    return (pai >= 1 and pai <= 9 and #table1 >= 3) or (pai >= 10 and pai <= 18 and #table2 >= 3) or (pai >= 19 and pai <= 27 and #table3 >= 3)
end

--- 开始游戏
function TableXueLiuChengHeView_3d:begin_game(gameState)
    Base.begin_game(self, gameState)
    self.beginGame = true
end

---结束刷新gameState
function TableXueLiuChengHeView_3d:game_state_end()
    Base.game_state_end(self)
    ---@type SeatHolder3D
    local mySeatHolder = self.seatHolderArray[1]
    ---@type Mj3dHodler
    local mj3dHodler = mySeatHolder.mj3dHodler
    if not self.handMjTransOriginLocalPos then
        self.handMjTransOriginLocalPos = mj3dHodler.handMjTrans.localPosition
    end
    if(self.beginGame and self.gameState.HuanSanZhang and #self.gameState.Player[self.mySeat + 1].SanZhang == 0) then
        --self.buttongHuanSZDisable:SetActive(true)
        --self.huanSanzTip:SetActive(true)
        self:init_hsz()
        mj3dHodler.handMjTrans.localPosition =  mj3dHodler.handMjTrans.localPosition + Vector3(1.8,0,0)
    else
        mj3dHodler.handMjTrans.localPosition =  self.handMjTransOriginLocalPos
    end
    self.beginGame = false
end

function TableXueLiuChengHeView_3d:reset_state()
    Base.reset_state(self)
    self.xlszObj:SetActive(false)
end

function TableXueLiuChengHeView_3d:play_guafeng_effect(seatHolder)
    local localSeat = seatHolder.seatId
    local worldPos = self.Mj3dDun.seatsTrans[localSeat].position
    local effectObj = self:play_3d_effect_form_file("Effect_xuezhan_guafeng",2,worldPos,self.Mj3dDun.seatsTrans[localSeat].gameObject)
    effectObj.transform.localPosition = Vector3(22,0,0)
end
function TableXueLiuChengHeView_3d:play_xiayu_effect()
    self:play_3d_effect_form_file("Effect_xuezhan_xiayu",2,self.tableStyleRoot.transform.position,self.tableStyleRoot)
end

function TableXueLiuChengHeView_3d:is_can_show_score(gameState)
    local actions = gameState.Action
    local isOk = true
    for i=1,#actions do
        local action = actions[i]
        --[[if action.Action == 42 or action.Action == 41 then
            isOk = false
        end--]]
        if action.Action == self.actions.hu 
            or action.Action == self.actions.zimo
            or action.Action == self.actions.dianPao 
            or action.Action == 32 then
            isOk = false
        end
       --[[local realAction = self:get_action_tx(action.Action)
        if(realAction == 203 or realAction == 205 or realAction == 204) then
            isOk = false
        end--]]
    end
    return isOk
end

function TableXueLiuChengHeView_3d:play_hu_hand_mj3d_effect(localSeat)
    ---@type SeatHolder3D 
    local seatHolder = self.seatHolderArray[localSeat]
    local hanMj = seatHolder.mj3dHodler.HandMj
    for i=1,#hanMj do
        ---@type Mj3d
        local mj3d = hanMj[i]
        local worldPos = mj3d.transform.position
        local effectObj = self:play_3d_effect_form_file("Effect_hupai_pai",2,worldPos,mj3d.transform.parent.gameObject)
    end
end


function TableXueLiuChengHeView_3d:show_score(playerState, localSeat, serverSeat)
    --[[local seatHolder = self.seatHolderArray[localSeat]
    local beishu = playerState.ZongBeiShu
    seatHolder:set_score(beishu)
    if not self:is_can_show_score(self.gameState) then
        return
    end
    local lastPlayerState = self.lastGameState.Player[serverSeat + 1]
    local change = playerState.ZongBeiShu - lastPlayerState.ZongBeiShu
    if 0 ~= change then
        Mj3dHelper:getModule():begin_cache_game_state()
        self:subscibe_time_event(1.5, false, 1):OnComplete(function(t)
            self:show_player_score_change_display(seatHolder,change)
            self:subscibe_time_event(1, false, 1):OnComplete(function(t)
                self:hide_player_score_change_display(seatHolder.seatId)
                Mj3dHelper:getModule():end_cache_game_state()
            end)  
        end)
    end--]]
    Base.show_score(self,playerState, localSeat, serverSeat)
end

function TableXueLiuChengHeView_3d:gold_table_show_score(playerState, localSeat, serverSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_gold_balance(Util.filterPlayerGoldNum(playerState.Balance)) ---金币场剩余金币
    if not self:is_can_show_score(self.gameState) then
        return
    end
    local change = 0
    for i=1,#self.gameState.ScoreSettle do
        local scoresettle = self.gameState.ScoreSettle[i]
        if scoresettle.SeatID == serverSeat then
            change = scoresettle.ActualAmount
            break
        end
    end
    if 0 ~= change then
        Mj3dHelper:getModule():begin_cache_game_state()
        self:subscibe_time_event(1.5, false, 1):OnComplete(function(t)
            self:show_player_score_change_display(seatHolder,change)
            self:subscibe_time_event(1, false, 1):OnComplete(function(t)
                self:hide_player_score_change_display(seatHolder.seatId)
                Mj3dHelper:getModule():end_cache_game_state()
            end)  
        end)
    end
end


----------------------推荐换三张相关-----------------------------------------
function TableXueLiuChengHeView_3d:recommend_san_zhang()
    ---@type SeatHolder3D
    local mySeatHolder = self.seatHolderArray[1]
    local myHandMj = {}
    for i=1,#mySeatHolder.mj3dHodler.HandMj do
        local isLast = true
        for j=1,#myHandMj do
            local mj = myHandMj[j]
            if mj:Pai() > mySeatHolder.mj3dHodler.HandMj[i]:Pai() then
                table.insert(myHandMj,j,mySeatHolder.mj3dHodler.HandMj[i])
                isLast = false
                break
            end
        end
        if isLast then
            table.insert(myHandMj,mySeatHolder.mj3dHodler.HandMj[i])
        end
    end

    local mj3dTables = 
    {
        {}, ---万
        {}, ---条
        {}, ---筒
    }

    for i = 1,#myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        local pai = mj3d:Pai()
        if (10 <= pai) and (pai <= 18)then
            table.insert(mj3dTables[1],mj3d)
        elseif (1 <= pai) and (pai <= 9)  then
            table.insert(mj3dTables[2],mj3d)
        elseif (19 <= pai) and (pai <= 27) then
            table.insert(mj3dTables[3],mj3d)
        end
    end

    local minSizeMjTable = nil
    for i = 1,#mj3dTables do
        local mjTable = mj3dTables[i]
        if (#mjTable >= 3) and ((not minSizeMjTable) or #minSizeMjTable > #mjTable) then
            minSizeMjTable = mjTable
        end
    end

    local result = self:combination(minSizeMjTable,3)

    local leftCombination = {}
    for i=1,#result do 
        local combinationMjTable = result[i]
        local leftMjTable = {}
        for k=1,#myHandMj do
            local needAdd = true
            for j=1,#combinationMjTable do
                if myHandMj[k] == combinationMjTable[j] then
                    needAdd = false
                end
            end
            if needAdd then
                table.insert(leftMjTable,myHandMj[k])
            end
        end
        table.insert(leftCombination,leftMjTable)
    end
   
    local maxPointIndex = nil
    local maxPoint = nil
    for i=1,#leftCombination do 
        --print(i.." ===============================================")
        local LeftMjTable = leftCombination[i]

        --print("#LeftMjTable : "..#LeftMjTable)
        --print_table(LeftMjTable)

        local point = self:check_combination_point(LeftMjTable)

        --print_table(result[i])
        --print("#result[i] : "..tostring(#result[i]))
        --print("point : "..point)
        --print("++++++++++++++++++++++++++++++++++++++++++++++++++++")
        --print("")

        if not maxPoint or maxPoint < point then
            maxPoint = point
            maxPointIndex = i
        end
    end

    local maxPointMjTable = result[maxPointIndex]
    for k=1,#maxPointMjTable do
        self:click_select(maxPointMjTable[k])
    end
end
function TableXueLiuChengHeView_3d:combination(atable, n)
    if n > #atable then
        return {}
    end
    local len = #atable
    local meta = {}
    for i=1, len do
        if i <= n then
            table.insert(meta, 1)
        else
            table.insert(meta, 0)
        end
    end
    local result = {}
    local tmp = {}
    for i=1, len do
        if meta[i] == 1 then
            table.insert(tmp, atable[i])
        end
    end
    table.insert(result, tmp)
    while true do
        local zero_count = 0
        for i=1, len-n do
            if meta[i] == 0 then
                zero_count = zero_count + 1
            else
                break
            end
        end
        if zero_count == len-n then
            break
        end
        local idx
        for j=1, len-1 do
            if meta[j]==1 and meta[j+1] == 0 then
                meta[j], meta[j+1] = meta[j+1], meta[j]
                idx = j
                break
            end
        end
        local k = idx-1
        local count = 0
        while count <= k do
            for i=k, 2, -1 do
                if meta[i] == 1 then
                    meta[i], meta[i-1] = meta[i-1], meta[i]
                end
            end
            count = count + 1
        end
        local tmp = {}
        for i=1, len do
            if meta[i] == 1 then
                table.insert(tmp, atable[i])
            end
        end
        table.insert(result, tmp)
    end
    return result
end
function TableXueLiuChengHeView_3d:check_combination_point(mjTable)
    local leftTable = mjTable
    local gangTables = self:check_gang(mjTable)
    local kanTables =  self:check_kan(mjTable)
    local shunTables = self:check_shun(mjTable)
    local duiTables = self:check_dui(mjTable)
    local liangTouKanTables = self:check_liang_tou_kan(mjTable)
    local jiaKanTables = self:check_jia_kan(mjTable)
    local bianKanTables = self:check_bian_kan(mjTable)
    

    --print("#gangTables : "..#gangTables)
    --print("#kanTables : "..#kanTables)
    --print("#shunTables : "..#shunTables)
    --print("#duiTables : "..#duiTables)
    --print("#liangTouKanTables : "..#liangTouKanTables)
    --print("#jiaKanTables : "..#jiaKanTables)
    --print("#bianKanTables : "..#bianKanTables)

    local point = #mjTable 
        + #bianKanTables * 4
        + #jiaKanTables * 6
        + #liangTouKanTables * 8
        + #duiTables * 16
        + #shunTables * 32
        + #kanTables * 32
        + #gangTables * 64

    return point
end
function TableXueLiuChengHeView_3d:check_gang(mjTable)
    local gangTables = {}
    local leftCount = #mjTable 
    for i=1,leftCount do
        local index1 = i
        local index2 = i + 1
        local index3 = i + 2
        local index4 = i + 3
        if index4 > #mjTable then
            break
        end
        local mj1 = mjTable[index1]
        local mj2 = mjTable[index2]
        local mj3 = mjTable[index3]
        local mj4 = mjTable[index4]
        if  mj1:Pai() == mj2:Pai() 
            and mj2:Pai() == mj3:Pai()
            and  mj3:Pai() == mj4:Pai() then
            gangTables[#gangTables + 1] = {mj1,mj2,mj3,mj4}
            TableUtil.remove_table_index(mjTable, mj1)
            TableUtil.remove_table_index(mjTable, mj2)
            TableUtil.remove_table_index(mjTable, mj3)
            TableUtil.remove_table_index(mjTable, mj4)
            i=1
            leftCount = #mjTable
        end
    end
    return gangTables
end
function TableXueLiuChengHeView_3d:check_kan(mjTable)
    local kanTables = {}
    local leftCount = #mjTable 
    for i=1,leftCount do
        local index1 = i
        local index2 = i + 1
        local index3 = i + 2
        if index3 > #mjTable then
            break
        end
        local mj1 = mjTable[index1]
        local mj2 = mjTable[index2]
        local mj3 = mjTable[index3]
        if mj1:Pai() == mj2:Pai() 
            and mj2:Pai() == mj3:Pai() then
            kanTables[#kanTables + 1] = {mj1,mj2,mj3}
            TableUtil.remove_table_index(mjTable, mj1)
            TableUtil.remove_table_index(mjTable, mj2)
            TableUtil.remove_table_index(mjTable, mj3)
            i=1
            leftCount = #mjTable
        end
    end
    return kanTables
end
function TableXueLiuChengHeView_3d:check_shun(mjTable)
    local shunTables = {}
    local leftCount = #mjTable 
    for i=1,leftCount do
        local index1 = i
        local index2 = i + 1
        local index3 = i + 2
        if index3 > #mjTable then
            break
        end
        local mj1 = mjTable[index1]
        local mj2 = mjTable[index2]
        local mj3 = mjTable[index3]
        if  self:pai_is_same_type(mj1:Pai(),mj2:Pai())
            and self:pai_is_same_type(mj2:Pai(),mj3:Pai())
            and mj1:Pai() + 1 == mj2:Pai() 
            and mj2:Pai() + 1 == mj3:Pai() then
            shunTables[#shunTables + 1] = {mj1,mj2,mj3}
            TableUtil.remove_table_index(mjTable, mj1)
            TableUtil.remove_table_index(mjTable, mj2)
            TableUtil.remove_table_index(mjTable, mj3)
            i=1
            leftCount = #mjTable
        end
    end
    return shunTables
end
function TableXueLiuChengHeView_3d:check_dui(mjTable)
    local duiTables = {}
    local leftCount = #mjTable 
    for i=1,leftCount do
        local index1 = i
        local index2 = i + 1
        if index2 > #mjTable then
            break
        end
        local mj1 = mjTable[index1]
        local mj2 = mjTable[index2]
        if mj1:Pai() == mj2:Pai() then
            duiTables[#duiTables + 1] = {mj1,mj2}
            TableUtil.remove_table_index(mjTable, mj1)
            TableUtil.remove_table_index(mjTable, mj2)
            i=1
            leftCount = #mjTable
        end
    end
    return duiTables
end
function TableXueLiuChengHeView_3d:check_liang_tou_kan(mjTable)
    local liangTouKanTables = {}
    local leftCount = #mjTable 
    for i=1,leftCount do
        local index1 = i
        local index2 = i + 1
        if index2 > #mjTable then
            break
        end
        local mj1 = mjTable[index1]
        local mj2 = mjTable[index2]
        if  self:pai_is_same_type(mj1:Pai(),mj1:Pai() - 1)
            and self:pai_is_same_type(mj2:Pai(),mj2:Pai() + 1)
            and mj1:Pai() + 1 == mj2:Pai() then
            liangTouKanTables[#liangTouKanTables + 1] = {mj1,mj2}
            TableUtil.remove_table_index(mjTable, mj1)
            TableUtil.remove_table_index(mjTable, mj2)
            i=1
            leftCount = #mjTable
        end
    end
    return liangTouKanTables
end
function TableXueLiuChengHeView_3d:check_jia_kan(mjTable)
    local jiaKanTables = {}
    local leftCount = #mjTable 
    for i=1,leftCount do
        local index1 = i
        local index2 = i + 1
        if index2 > #mjTable then
            break
        end
        local mj1 = mjTable[index1]
        local mj2 = mjTable[index2]
        if  self:pai_is_same_type(mj1:Pai(),mj2:Pai())
            and mj1:Pai() + 2 == mj2:Pai() then
            jiaKanTables[#jiaKanTables + 1] = {mj1,mj2}
            TableUtil.remove_table_index(mjTable, mj1)
            TableUtil.remove_table_index(mjTable, mj2)
            i=1
            leftCount = #mjTable
        end
    end
    return jiaKanTables
end
function TableXueLiuChengHeView_3d:check_bian_kan(mjTable)
    local bianKanTables = {}
    local leftCount = #mjTable 
    for i=1,leftCount do
        local index1 = i
        local index2 = i + 1
        if index2 > #mjTable then
            break
        end
        local mj1 = mjTable[index1]
        local mj2 = mjTable[index2]
        if  self:pai_is_same_type(mj1:Pai(),mj2:Pai())
            and mj1:Pai() + 1 == mj2:Pai() 
            and 
            (
                (self:pai_is_same_type(mj1:Pai(),mj1:Pai() - 1)
                    and (not self:pai_is_same_type(mj1:Pai(),mj1:Pai() - 2)))
                or                   
                (self:pai_is_same_type(mj2:Pai(),mj2:Pai() + 1)
                    and (not self:pai_is_same_type(mj1:Pai(),mj1:Pai() + 2)))
            ) then
            bianKanTables[#bianKanTables + 1] = {mj1,mj2}
            TableUtil.remove_table_index(mjTable, mj1)
            TableUtil.remove_table_index(mjTable, mj2)
            i=1
            leftCount = #mjTable
        end
    end
    return bianKanTables
end
----------------------End----------------------------------------------------

return  TableXueLiuChengHeView_3d