





local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableKaWuxingView_3d:Table3dCommonView
local TableKaWuxingView_3d = class('tableKaWuxingView_3d', Base)

local TableKaWuXingView = class('tableKaWuxingView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color
local lastMJOffset = 0.5
local Vector3 = Vector3
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
---@type Mj3d
local Mj3d = require("package.majiang3d.module.table3d.Mj3d")


--- 初始化配置数据
function TableKaWuxingView_3d:init_config()
    Base.init_config(self)
    self.actions.liang = 25
    self.actionSounds["7"] = {"xg_liangdao"}
end

--- 初始化ui
function TableKaWuxingView_3d:init_ui()
    Base.init_ui(self)
    self.actionLiang = GetComponentWithPath(self.waitAction, "Button_Liang", ComponentTypeName.Transform).gameObject
    self.buliangObj = GetComponentWithPath(self.root, "BuLiangBg", ComponentTypeName.Transform).gameObject
    self.selectLiangObj = GetComponentWithPath(self.root, "SelectLiangBg", ComponentTypeName.Transform).gameObject
    self.selectLiangGray = GetComponentWithPath(self.root, "SelectLiangBg/Button_SelectGray", ComponentTypeName.Transform).gameObject
end

--- 初始化座位
function TableKaWuxingView_3d:init_seats()
    Base.init_seats(self)
    if 2 == self.totalSeat then
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[3]
        seatHolder.buttonKick.transform.anchoredPosition = Vector3(-96,86,0)
    end
end

---显示听牌标志
function TableKaWuxingView_3d:show_ting_pai_tag(localSeat, show)

end

---可亮
function TableKaWuxingView_3d:show_ke_liang(show)
    self.actionLiang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 开始刷新gameState
function TableKaWuxingView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    if(gameState.Result == 0 and #gameState.MaiMa >0 and self.ruleJsonInfo.ZiXuanMa) then
        self:play_hu_sound(gameState)
        self:subscibe_time_event(2.5, false, 0):OnComplete(function(t)
            ModuleCache.ModuleManager.show_module("majiang", "tablepop", gameState)
        end)
    end
    self:show_ke_liang(#gameState.KeLiang > 0)
end

--- 手张是否灰显
function TableKaWuxingView_3d:pai_is_gray(pai)
    local playerState = self.gameState.Player[self.mySeat + 1]
    for i = 1, #playerState.ShouZhang do
        local shouZhangData = playerState.ShouZhang[i]
        if(shouZhangData.Gray and pai == shouZhangData.Pai) then
            return true
        end
    end
    return false
end

--- 取消选择亮
function TableKaWuxingView_3d:cancel_liang()
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[1]
    local handMj = seatHolder.mj3dHodler.HandMj
    for i = 1, #handMj do
        ---@type Mj3d
        local mj3d = handMj[i]
        local pai = mj3d:Pai()
        local isGray = self:pai_is_gray(pai)
        mj3d:setColliderState(not isGray)
        seatHolder.mj3dHodler:setHandMjOutState(mj3d,false)
        if isGray then
            mj3d:setMj3dState(mj3d.mj3dState.gray)
        else
            mj3d:setMj3dDefState(mj3d.mj3dState.normal)
            mj3d:resetDefState()
        end
    end
    --[[local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(mj.gameObject.activeSelf) then
            local isGray = self:pai_is_gray(pai)
            mj:set_disable(isGray)
            if(isGray) then
                mj:set_color(Color.gray, mj.skinObj)
            else
                mj:set_color(Color.white, mj.skinObj)
            end
        end
    end--]]
end

--- 选择刻子结束
function TableKaWuxingView_3d:select_coverd_done()
    if(#self.selectKeZi == 0) then
        for i = 1, #self.gameState.KeLiang[1].KeChu do
            table.insert(self.keChuPai, self.gameState.KeLiang[1].KeChu[i].ChuPai)
        end
    end
    self.selectLiangObj:SetActive(false)

    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[1]
    local handMj = seatHolder.mj3dHodler.HandMj
    for i = 1, #handMj do
        ---@type Mj3d
        local mj3d = handMj[i]
        local pai = mj3d:Pai()
        local isGray = not TableUtil.have_table_index(self.keChuPai, pai)
        mj3d:setColliderState(not isGray)
        if isGray then
            mj3d:setMj3dDefState(mj3d.mj3dState.gray)
            mj3d:setMj3dState(mj3d.mj3dState.gray)
        else
            mj3d:setMj3dDefState(mj3d.mj3dState.normal)
            mj3d:resetDefState()
        end
    end

    --[[local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(mj.gameObject.activeSelf) then
            local isGray = not TableUtil.have_table_index(self.keChuPai, pai)
            mj:set_disable(isGray)
            if(isGray) then
                mj:set_color(Color.gray, mj.skinObj)
            else
                mj:set_color(Color.white, mj.skinObj)
            end
        end
    end--]]
end

--- 点击选择刻子 需要不亮
function TableKaWuxingView_3d:click_select_coverd(selectPai)
    self.keChuPai = {}
    local num = 0

    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[1]
    local handMj = seatHolder.mj3dHodler.HandMj
    for i = 1, #handMj do
        ---@type Mj3d
        local mj3d = handMj[i]
        local pai = mj3d:Pai()
        if(selectPai == pai and num < 3) then
            if(mj3d.transform.localPosition.y < lastMJOffset) then
                mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, lastMJOffset, mj3d.transform.localPosition.z)
                if(not TableUtil.have_table_index(self.selectKeZi, pai)) then
                    table.insert(self.selectKeZi, pai)
                end
            else
                mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, 0, mj3d.transform.localPosition.z)
                if(TableUtil.have_table_index(self.selectKeZi, pai)) then
                    TableUtil.remove_table_index(self.selectKeZi, pai)
                end
            end
            num = num + 1
        end
    end

    if(#self.selectKeZi == 0) then
        for i = 1, #self.gameState.KeLiang[1].KeChu do
            table.insert(self.keChuPai, self.gameState.KeLiang[1].KeChu[i].ChuPai)
        end
    else
        local liangIndex = 0
        for i = 1, #self.gameState.KeLiang do
            if(#self.gameState.KeLiang[i].Pai == #self.selectKeZi) then ---可选择不亮的牌数量与选择的刻子数量相等
            local keZiNum = 0
                for j = 1, #self.selectKeZi do
                    if(not TableUtil.have_table_index(self.gameState.KeLiang[i].Pai, self.selectKeZi[j])) then
                        break
                    end
                    keZiNum = keZiNum + 1
                end
                if(keZiNum == #self.selectKeZi) then
                    liangIndex = i
                    break
                end
            end
        end
        if(liangIndex ~= 0) then
            for i = 1, #self.gameState.KeLiang[liangIndex].KeChu do
                table.insert(self.keChuPai, self.gameState.KeLiang[liangIndex].KeChu[i].ChuPai)
            end
        end
    end
    if(#self.keChuPai == 0) then ---没有可出的牌
        self.selectLiangGray:SetActive(true)
    else
        self.selectLiangGray:SetActive(false)
    end
end

--- 选择不亮时牌的展示
function TableKaWuxingView_3d:show_select_covered()
    self:handle_mjs_out_hand_mj(0)
    self.selectKeZi = {}
    self.keChuPai = {}

    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[1]
    local handMj = seatHolder.mj3dHodler.HandMj
    for i = 1, #handMj do
        ---@type Mj3d
        local mj3d = handMj[i]
        seatHolder.mj3dHodler:setHandMjOutState(mj3d,false)
        local isGray = not self:pai_can_covered(mj3d:Pai())
        if isGray then
            mj3d:setColliderState(false)
            mj3d:setMj3dState(mj3d.mj3dState.gray)
        else
            mj3d:setColliderState(not mj3d.shouZhangData.Gray)
            mj3d:resetDefState()
        end
    end

    --[[local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(mj.gameObject.activeSelf) then
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
            local isGray = not self:pai_can_covered(pai)
            mj:set_disable(isGray)
            if(isGray) then
                mj:set_color(Color.gray, mj.skinObj)
            else
                mj:set_color(Color.white, mj.skinObj)
            end
        end
    end--]]
end

--- 牌可以不亮
function TableKaWuxingView_3d:pai_can_covered(pai)
    for i = 1, #self.gameState.BuLiang do
        if(pai == self.gameState.BuLiang[i]) then
            return true
        end
    end
    return false
end

--- 这个弃张是否是胡的牌
function TableKaWuxingView_3d:is_hu_on_out(pai)
    local huPai = 0
    for i = 1, #self.gameState.Player do
        local playerState = self.gameState.Player[i]
        if(#playerState.HuPai > 0) then
            huPai = playerState.HuPai[1]
            break
        end
    end
    if(huPai ~= 0 and pai == huPai) then
        return true
    end
    return false
end

--- 弃牌刷新之后 serverSeat 服务器座位 curOutNum 当前弃牌数量 preOutNum 前次弃牌数量
function TableKaWuxingView_3d:game_state_end_out(params)
    Base.game_state_end_out(self, params)
    --[[local seatHolder = self.seatHolderArray[params.localSeat]
    local childs = TableUtil.get_all_child(seatHolder.outPoint)
    local lastObj = childs[params.curOutNum]
    if(params.localSeat == 1 or params.localSeat == 2) then
        lastObj = childs[1]
    end
    if(lastObj and lastObj.activeSelf) then
        local lastMj = self:get_mj(lastObj)
        if(self:is_hu_on_out(lastMj.pai)) then
            local effectObj = ComponentUtil.GetComponentWithPath(lastObj, "Effect", ComponentTypeName.Transform).gameObject
            seatHolder.huEffectOut.transform.position = effectObj.transform.position
            seatHolder.huEffectOut:SetActive(true)
        end
    end--]]
end

--- 设置手牌 handData 手牌数据 localSeat 本地座位 dataIndex 手牌数据索引 index 手牌索引
--- playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移
function TableKaWuxingView_3d:set_hand_data(params)
    Base.set_hand_data(self,params)
    --self:set_common_data(params)
    --local mj = params.seatHolder.mjHeapHand:add_mj(params)
    --local effectObj = GetComponentWithPath(mj.gameObject, "Down/Effect", ComponentTypeName.Transform).gameObject
    --effectObj:SetActive(params.showHu and self.gameState.DianPao == -1)
end

---开始设置玩家状态（gameState）
function TableKaWuxingView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    self:update_hu_list_other(playerState, localSeat)
end

---显示其他玩家胡的列表
function TableKaWuxingView_3d:update_hu_list_other(playerState, localSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    if(seatHolder.huGridParent) then
        seatHolder.huGridParent:SetActive(#playerState.YiTing > 0)
        if(localSeat == 2) then
            if(#playerState.YiTing > 8) then
                seatHolder.huGridParent.transform.localPosition = Vector3.New(169, seatHolder.huGridParent.transform.localPosition.y, 0)
            else
                seatHolder.huGridParent.transform.localPosition = Vector3.New(49, seatHolder.huGridParent.transform.localPosition.y, 0)
            end
        end
        if(localSeat == 4) then
            if(#playerState.YiTing > 8) then
                seatHolder.huGridParent.transform.localPosition = Vector3.New(-320, seatHolder.huGridParent.transform.localPosition.y, 0)
            else
                seatHolder.huGridParent.transform.localPosition = Vector3.New(-203, seatHolder.huGridParent.transform.localPosition.y, 0)
            end
        end
        seatHolder.huGrid:SetActive(true)
        seatHolder.jianZiHu.gameObject:SetActive(false)
        local allHuChilds = TableUtil.get_all_child(seatHolder.huGrid)
        for i=2,#allHuChilds do
            allHuChilds[i]:SetActive(false)
        end
        for i=1,#playerState.YiTing do
            local setPai = playerState.YiTing[i]
            ---@type Mj2D
            local mj = Mj2D:new(setPai, seatHolder.huGrid, {cloneName = "HuMJ", index = i, spriteHolder = self.frontSpriteH})
            mj:set_skin(self.mjColorSet, self.mjScaleSet)
            MjManager.insert(mj, MjManager.mjType.custom)
            local remainDi = GetComponentWithPath(mj.gameObject, "ImageDi", ComponentTypeName.Transform).gameObject
            local remainObj = GetComponentWithPath(mj.gameObject, "Text", ComponentTypeName.Transform).gameObject
            remainDi:SetActive(false)
            remainObj:SetActive(false)
        end
    end
end

--- 游戏未开始时（整个牌局） --- 此时不是所有玩家都准备了
function TableKaWuxingView_3d:set_game_not_begin_ui()
    --Base.set_game_not_begin_ui(self)
    for i = 1, #self.seatHolderArray do
        local seatHolder = self.seatHolderArray[i]
        if 1 == i then
            seatHolder:set_game_begin_ui()
        else
            seatHolder:set_game_not_begin_ui()
        end
        self.roomType:set_game_not_begin_ui(seatHolder)
    end
end

--- 自己还没准备的显示
function TableKaWuxingView_3d:show_me_not_ready(seatData)
    if(not self.gameState) then
        if(not ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
            ModuleCache.ModuleManager.show_module("majiang", "tablepop")
        end
    end
end

---获取操作的特效
function TableKaWuxingView_3d:get_action_tx(action)
    if(action == self.actions.ting) then
        return self.actions.liang
    end
    return Base.get_action_tx(self, action)
end

--- 可以显示头像旁的额外信息（跑漂等）
function TableKaWuxingView_3d:can_show_head_add_info()
    return true
end

--- 隐藏操作以及弹出的操作列表
function TableKaWuxingView_3d:hide_wait_action_select_card()
    Base.hide_wait_action_select_card(self)
    self.selectLiangObj:SetActive(false)
    self.buliangObj:SetActive(false)
end

---显示牌桌预览相关操作控件
function TableKaWuxingView_3d:show_table_presettlement(show)
    self.roomType:show_table_presettlement(show)
end


return  TableKaWuxingView_3d