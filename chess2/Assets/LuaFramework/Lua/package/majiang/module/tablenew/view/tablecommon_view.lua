
local class = require("lib.middleclass")
local ViewBase = require('package.majiang.module.tablenew.table_view')
--- @class TableCommonView:TableMJView
local TableCommonView = class('tableCommonView', ViewBase)
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
local Color = UnityEngine.Color
local Util = Util
local Vector3 = Vector3
local math = math
local TableUtil = TableUtil
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local PlayerPrefs = UnityEngine.PlayerPrefs
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type SeatHolder2D
local SeatHolder2D = require('package.majiang.module.tablenew.seat.seatholder2d')
local rightWidthOffsets = -- 手张宽度偏移
{
    ["20"] = {82,35,38,35},
    ["14"] = {87,35,38,35}
}
local xiaZhangScaleAll = --下张麻将比例
{
    ["20"] = {0.65, 0.86, 0.385, 0.86},
    ["14"] = {0.85, 1, 0.5, 1},
}
local pointerPos =
{
    Vector3.New(0,-38,0),
    Vector3.New(38,0,0),
    Vector3.New(0,38,0),
    Vector3.New(-38,0,0),
}
TableCommonView.pointerPos = pointerPos
local lastMJOffset = 20 --最后一张牌位移
local outGridCell =  --弃张摆放宫格位移
{
    {82,104},
    {-54,36},
    {-82,-104},
    {54,-36},
}
local seatAnchors = {"BottomLeft", "Right", "Top", "Left"}

function TableCommonView:init_ui()
    ViewBase.init_ui(self)
    local gameEventCollector = ComponentUtil.GetComponent(self.root, "UGUIExtend.GameEventCollector")
    gameEventCollector.moduleName = "tablenew"

    self.tableBg1 = ModuleCache.ComponentUtil.Find(self.root, "Center/ImageBackground")
    self.tableBg2 = ModuleCache.ComponentUtil.Find(self.root, "Center/ImageBackground2")
    self.tableBg3 = ModuleCache.ComponentUtil.Find(self.root, "Center/ImageBackground3")

    self.tableBackgroundSprite = GetComponentWithPath(self.root, "Center/ImageBackground", ComponentTypeName.Image).sprite
    self.tableBackgroundSprite2 = GetComponentWithPath(self.root, "Center/ImageBackground2", ComponentTypeName.Image).sprite
    self.tableBackgroundSprite3 = GetComponentWithPath(self.root, "Center/ImageBackground3", ComponentTypeName.Image).sprite

    self.gameController = GetComponentWithPath(self.root, "Center/Child/GameController", ComponentTypeName.Transform).gameObject
    self.ImageRandom = GetComponentWithPath(self.root, "Center/Child/ImageRandom", ComponentTypeName.Transform).gameObject
    self.timeDown = GetComponentWithPath(self.gameController, "TimeDown", ComponentTypeName.Transform).gameObject
    self.waitObj = GetComponentWithPath(self.gameController, "Wait", ComponentTypeName.Transform).gameObject
    self.timer1imgSprite = GetComponentWithPath(self.timeDown, "Image1", "SpriteHolder")
    self.timer2imgSprite = GetComponentWithPath(self.timeDown, "Image2", "SpriteHolder")
    self.timer1img = GetComponentWithPath(self.timeDown, "Image1", ComponentTypeName.Image)
    self.timer2img = GetComponentWithPath(self.timeDown, "Image2", ComponentTypeName.Image)
    self.pointerObj = GetComponentWithPath(self.root, "Center/Child/Pointer", ComponentTypeName.Transform).gameObject
    self.lightObj = GetComponentWithPath(self.gameController, "Light", ComponentTypeName.Transform).gameObject
    self.jushuObj = GetComponentWithPath(self.gameController, "JuShu", ComponentTypeName.Transform).gameObject
    self.jushu = GetComponentWithPath(self.gameController, "JuShu/Text", ComponentTypeName.Text)
    self.remain = GetComponentWithPath(self.gameController, "Remain/Text", ComponentTypeName.Text)
    self.remainAni = GetComponentWithPath(self.gameController, "Remain/Text", "UnityEngine.Animation")
    self.frontSpriteH = GetComponentWithPath(self.root, "Center/FrontSpriteH", "SpriteHolder")
    self.tagSpriteH = GetComponentWithPath(self.root, "Center/TagSpriteH", "SpriteHolder")
    self.ceSpriteH = GetComponentWithPath(self.root, "Center/CeSpriteH", "SpriteHolder")
    self.huTagSpriteH = GetComponentWithPath(self.root, "Center/HuTagSpriteH", "SpriteHolder")
    self.bigHuaSwitchState =  GetComponentWithPath(self.root, "Center/Child/ImageRandom", "UIStateSwitcher")

    ---3D模式推荐按钮
    self.buttonGoTo3d = GetComponentWithPath(self.root, "TopLeft/Child/Ready/ButtonGoTo3d", ComponentTypeName.Transform).gameObject
    self.buttonGoTo3dFinger = GetComponentWithPath(self.root, "TopLeft/Child/Ready/ButtonGoTo3d/Finger", ComponentTypeName.Transform).gameObject
    self.maskGoTo3d = GetComponentWithPath(self.root, "TopLeft/Child/Ready/MaskGoTo3d", ComponentTypeName.Transform).gameObject
    self.buttonDontGoTo3d = GetComponentWithPath(self.root, "TopLeft/Child/Ready/MaskGoTo3d/ButtonDontGoTo3d", ComponentTypeName.Transform).gameObject
    ---End

    self.mjTopIconAtlas = GetComponentWithPath(self.root, "Center/MjTopIconAtlas", "SpriteHolder")

    self:on_init_ui()
end

function TableCommonView:on_init_ui()
    self.bigHuaSwitchState:SwitchState("Normal")
end

function TableCommonView:on_init(maxNum)
    ViewBase.on_init(self, maxNum)
    self.xiaZhangScale = xiaZhangScaleAll[maxNum .. ""]
    self.rightWidthOffset = rightWidthOffsets[maxNum .. ""]
    self:refresh_mj_color_scale()
    self:refresh_table_bg()
    self:refresh_goto3d_button_state()
end

--- 初始化座位
function TableCommonView:init_seats()
    ViewBase.init_seats(self)
    self.pointerChilds = {}
    self.pointerObjs = TableUtil.get_all_child(self.pointerObj)
    self.lightChilds = TableUtil.get_all_child(self.lightObj)
    for i=1,4 do
        local seatPosTran = GetComponentWithPath(self.root, seatAnchors[i] .. "/Child/" .. i, ComponentTypeName.Transform).gameObject
        local seatHolder = SeatHolder2D:new(self, i)
        seatHolder:init(seatPosTran)
        self:init_seat(seatHolder, i)
        local pointerChild = GetComponentWithPath(self.pointerObjs[i], "Light", ComponentTypeName.Transform).gameObject
        table.insert(self.pointerChilds, pointerChild)
        table.insert(self.seatHolderArray, seatHolder)
    end
    ---@type Pool
    self.pool = require('package.majiang.module.tablenew.pool'):new(self.cloneParent)
end

--- 初始化单个座位
function TableCommonView:init_seat(seatHolder, index)

end

--- 重置状态 点击继续游戏
function TableCommonView:reset_state()
    ViewBase.reset_state(self)
    self.gameController:SetActive(false)
    for i=1,#self.lightChilds do
        self.lightChilds[i]:SetActive(false)
    end
    for i=1,#self.pointerChilds do
        self.pointerChilds[i]:SetActive(false)
    end
end
function TableCommonView:update_ready_end(userState)
    ViewBase.update_ready_end(self,userState)
    self.gameController:SetActive(self:all_is_ready() or self.gameState ~= nil)
    self.remain.text = self.gameState and self.gameState.TotalCount or ""
    self.playType:show_round(self.gameState)  ---这个gameState在未开局状态为空
end
--- 开始刷新gameState
function TableCommonView:game_state_begin(gameState)
    ViewBase.game_state_begin(self, gameState)
    self.gameController:SetActive(gameState.Result == 0)
end

---结束刷新gameState
function TableCommonView:game_state_end()
    ViewBase.game_state_end(self)
    if(self.gameState.Result ~= 0) then
        for i=1,#self.pointerChilds do
            self.pointerChilds[i]:SetActive(false)
        end
    end
end

--- 更新座位指向
function TableCommonView:update_seat_pointer()
    local masterSeat = 0
    local localZhuangJia = self:server_to_local_seat(masterSeat)
    local addNum = 0
    for i=1,4 do
        local index = localZhuangJia + i - 1
        if(self.totalSeat == 4) then
            if(index > 4) then
                index = index - 4
            end
            self.pointerObjs[i].transform.localPosition = pointerPos[index]
        elseif(self.totalSeat == 3) then
            self.pointerObjs[i]:SetActive(i <= self.totalSeat)
            if(i <= self.totalSeat) then
                if(index == 3) then
                    addNum = 1
                end
                index = index + addNum
                if(index > 4) then
                    index = index - 4
                end
                self.pointerObjs[i].transform.localPosition = pointerPos[index]
            end
        elseif(self.totalSeat == 2) then
            if(localZhuangJia == 1 and index ~= 1) then
                index = 3
            end
            if(localZhuangJia == 3 and index ~= 3) then
                index = 1
            end
            self.pointerObjs[i]:SetActive(i <= self.totalSeat)
            if(i <= self.totalSeat) then
                self.pointerObjs[i].transform.localPosition = pointerPos[index]
            end
        end
    end
end

--- 准备拖动
function TableCommonView:ready_drag_mj(obj, isDrag)
    if(not isDrag) then
        self:play_voice("common/xuanpai")
    end
    local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(obj == mj.gameObject) then
            self:handle_mjs_out_hand_mj(pai)
        else
            mj:set_local_pos(Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z))
        end
    end
end

--- 手牌已经弹起可以直接打出去
function TableCommonView:hand_mj_is_outing(obj)
    local isOuting = (obj.transform.localPosition.y > 1) or (1 == self:getOneClickOutMjSetting())
    return isOuting
end

--- 可出牌的情况下点击手牌（手牌未弹起时）
function TableCommonView:click_hand_mj_can_out(obj, isDrag)
    if(not isDrag) then
        self:play_voice("common/xuanpai")
    end
    obj.transform.localPosition = Vector3.New(obj.transform.localPosition.x, lastMJOffset, obj.transform.localPosition.z)
    local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(obj == mj.gameObject) then
            self:handle_mjs_out_hand_mj(pai)
        else
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
        end
    end
end

--- 出不了牌的情况下点击手牌（点击又有反应）
function TableCommonView:click_hand_mj_cant_out(obj)
    if(obj.transform.localPosition.y > 0) then
        obj.transform.localPosition = Vector3.New(obj.transform.localPosition.x, 0, obj.transform.localPosition.z)
    else
        obj.transform.localPosition = Vector3.New(obj.transform.localPosition.x, lastMJOffset, obj.transform.localPosition.z)
    end
    local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        if(obj ~= mj.gameObject) then
            mj.transform.localPosition = Vector3.New(mj.transform.localPosition.x, 0, mj.transform.localPosition.z)
        end
    end
end

--- 设置自己手牌麻将位置
function TableCommonView:set_hand_mj_pos(mj, index)
    local seatHolder = self.seatHolderArray[1]
    mj:set_local_pos(seatHolder.handMjBeginPos + Vector3.New(self.rightWidthOffset[1] * (index - 1), 0 , 0))
end

--- 出牌之后更新手牌位置 outIndex 出的索引 getIndex 上次摸牌的索引
function TableCommonView:out_mj_update_data(playerState, outIndex, getIndex)
    if not playerState.MoZhang or playerState.MoZhang == 0 then
        return
    end
    local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        local mj = mjs[i]
        local index = mj.dataIndex
        if(index > outIndex) then
            index = index - 1
        end
        self:set_hand_mj_pos(mj, index)
    end
end

--- 打出普通牌
function TableCommonView:play_custom(pai, localSeat)
    local seatInfo = self.seatHolderArray[localSeat]
    if(self.mjSounds[tonumber(pai)]) then
        if(seatInfo.gender == 1) then
            self:play_voice("femalesound_hn/" .. string.lower(self.mjSounds[tonumber(pai)]))
        else
            self:play_voice("malesound_hn/" .. string.lower(self.mjSounds[tonumber(pai)]))
        end
    end
    if(localSeat ~= 1) then
        local newChuMJ = TableUtil.poor("ChuMJ", seatInfo.chuMJPos, Vector3.zero, self.poorObjs, self.clones)
        TableUtil.set_mj(pai, newChuMJ, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_bg(1, newChuMJ, self.mjColorSet)
        self:subscibe_time_event(0.5, false, 0):OnComplete(function(t)
            self.poorObjs = TableUtil.add_poor(newChuMJ, self.poorObjs, self.cloneParent)
        end)
    end
end

--- 刷新麻将样式和背景颜色
function TableCommonView:refresh_mj_color_scale(refreshState)
    local config = self.curTableData.playModelData
    local defaultScale = 0
    local defaultColor = 0
    if(config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        if(strs[1]) then
            defaultScale = tonumber(strs[1])
        end
        if(strs[2]) then
            defaultColor = tonumber(strs[2])
        end
    end
    self.mjScaleSet = PlayerPrefs.GetInt(string.format("%s_MJScale",self.curTableData.ruleJsonInfo.GameType), defaultScale)
    self.mjColorSet = PlayerPrefs.GetInt(string.format("%s_MJColor",self.curTableData.ruleJsonInfo.GameType), defaultColor)
    if(refreshState) then
        self:refresh_all_mj_skin()
    end
end

--- 刷新牌桌背景颜色
function TableCommonView:refresh_table_bg()
    local config = self.curTableData.playModelData
    local defaultBg = 1
    if(config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        if(strs[3]) then
            defaultBg = tonumber(strs[3])
        end
    end
    local tableBg = PlayerPrefs.GetInt(string.format("%s_MJBackground",self.curTableData.ruleJsonInfo.GameType), defaultBg)
    self.tableBg1:SetActive(tableBg == 1)
    self.tableBg2:SetActive(tableBg == 2)
    self.tableBg3:SetActive(tableBg == 3)
end

--- 手牌刷新之前 serverSeat 服务器座位
function TableCommonView:game_state_begin_hand(serverSeat)
    local localSeat = self:server_to_local_seat(serverSeat)
    self.handOffset = 0
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.handPoint:SetActive(true)
    local handChilds = TableUtil.get_all_child(seatHolder.handPoint)
    for i = 1,#handChilds do
        handChilds[i]:SetActive(false)
    end
end

--- 手牌刷新之后 serverSeat 服务器座位
function TableCommonView:game_state_end_hand(serverSeat)
    local localSeat = self:server_to_local_seat(serverSeat)
    if(localSeat == 2) then
        local seatHolder = self.seatHolderArray[localSeat]
        for i = 2, #seatHolder.handObjs do
            local obj = seatHolder.handObjs[i]
            if(obj.activeSelf) then
                obj.transform:SetAsFirstSibling()
            end
        end
    end
end

--- 设置手牌 handData 手牌数据 localSeat 本地座位 index 位置索引 playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移 dataIndex 数据索引
function TableCommonView:set_hand_data(params)
    self:set_common_data(params)
    params.seatHolder.mjHeapHand:add_mj(params)
end

--- 弃牌刷新之前 serverSeat 服务器座位
function TableCommonView:game_state_begin_out(serverSeat)
    local localSeat = self:server_to_local_seat(serverSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    local outChilds = TableUtil.get_all_child(seatHolder.outPoint)
    if(self.curTableData.isPlayBack) then
        for i = 1,#outChilds do
            outChilds[i]:SetActive(false)
        end
    end
end

--- 弃牌刷新之后 serverSeat 服务器座位 curOutNum 当前弃牌数量 preOutNum 前次弃牌数量
function TableCommonView:game_state_end_out(params)
    params.localSeat = self:server_to_local_seat(params.serverSeat)
    local seatHolder = self.seatHolderArray[params.localSeat]
    local outChilds = TableUtil.get_all_child(seatHolder.outPoint)
    if(params.curOutNum < params.preOutNum) then
        if(params.localSeat == 1 or params.localSeat == 2) then
            for i = 1, params.preOutNum - params.curOutNum do
                outChilds[i]:SetActive(false)
                outChilds[i].transform:SetAsLastSibling()
            end
        else
            for i = params.curOutNum + 1, params.preOutNum do
                outChilds[i]:SetActive(false)
                outChilds[i].transform:SetAsLastSibling()
            end
        end
    end
end

--- 设置基础牌数据
function TableCommonView:set_common_data(params)
    if(params.localSeat == 2 or params.localSeat == 4) then
        params.spriteHolder = self.ceSpriteH
    else
        params.spriteHolder = self.frontSpriteH
    end
    params.tagSpriteHolder = self.tagSpriteH
    params.seatHolder = self.seatHolderArray[params.localSeat]
end

--- 设置弃牌 outData 弃牌数据 localSeat 本地座位 outIndex 索引 showPointer 显示箭头 lastOut 最后出的一个牌 serverSeat 服务器座位 playerState 玩家数据
function TableCommonView:set_out_data(params)
    self:set_common_data(params)
    if(params.lastOut) then
        self:play_voice("common/chupai")
    end
    params.seatHolder.mjHeapOut:add_mj(params)
end

--- 刷新下张之前 serverSeat 服务器座位
function TableCommonView:game_state_begin_down(serverSeat)
    local localSeat = self:server_to_local_seat(serverSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    local downChilds = TableUtil.get_all_child(seatHolder.downPoint)
    for i = 1,#downChilds do
        downChilds[i]:SetActive(false)
    end
    self.downOffset = 0
end

--- 刷新下张之后 changeType 0 不变 1 增加 2 减少 serverSeat 服务器座位
function TableCommonView:game_state_end_down(serverSeat, changeType)
    local localSeat = self:server_to_local_seat(serverSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    if (localSeat == 1) then
        seatHolder.handPoint.transform.localPosition = seatHolder.handBeginPos + Vector3.New(self.downOffset, 0 , 0)
    elseif (localSeat == 2) then
        seatHolder.handPoint.transform.localPosition = seatHolder.handBeginPos + Vector3.New(0, self.downOffset , 0)
    elseif (localSeat == 3) then
        seatHolder.handPoint.transform.localPosition = seatHolder.handBeginPos + Vector3.New(-self.downOffset, 0 , 0)
    elseif (localSeat == 4) then
        seatHolder.handPoint.transform.localPosition = seatHolder.handBeginPos + Vector3.New(0, -self.downOffset , 0)
    end
end

--- 设置下张牌堆 downData 下张数据 localSeat 本地座位 serverSeat 服务器座位 downIndex 索引
function TableCommonView:set_down_data(params)
    self:set_common_data(params)
    params.seatHolder.mjHeapDown:add_mj(params)
end

--- 花刷新之前 serverSeat 服务器座位
function TableCommonView:game_state_begin_hua(serverSeat)
    local localSeat = self:server_to_local_seat(serverSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    local huaChilds = TableUtil.get_all_child(seatHolder.huaPoint)
    if(self.curTableData.isPlayBack) then
        for i = 1,#huaChilds do
            huaChilds[i]:SetActive(false)
        end
    end
end

--- 花牌刷新之后 serverSeat 服务器座位 curHuaNum 当前花牌数量 preHuaNum 前次花牌数量
function TableCommonView:game_state_end_hua(params)
    params.localSeat = self:server_to_local_seat(params.serverSeat)
    local seatHolder = self.seatHolderArray[params.localSeat]
    local huaChilds = TableUtil.get_all_child(seatHolder.huaPoint)
    if(params.curHuaNum < params.preHuaNum) then
        if(params.localSeat == 4) then
            for i = 1, params.preHuaNum - params.curHuaNum do
                huaChilds[i]:SetActive(false)
                huaChilds[i].transform:SetAsLastSibling()
            end
        else
            for i = params.curHuaNum + 1, params.preHuaNum do
                huaChilds[i]:SetActive(false)
                huaChilds[i].transform:SetAsLastSibling()
            end
        end
    end
end

--- 设置花牌 huaData 花牌数据 localSeat 本地座位 huaIndex 索引 playerState 玩家数据
function TableCommonView:set_hua_data(params)
    self:set_common_data(params)
    params.seatHolder.mjHeapHua:add_mj(params)
end

---设置墩
function TableCommonView:game_state_dun()
    local remainNum = #self.gameState.Dun
    if(not self.remainNum) then
        self.remainNum = remainNum
        self.remain.text = #self.gameState.Dun .. ""
    end
    if(self.remainNum ~= remainNum) then
        if(remainNum < 10) then
            if(self.remainAni.isPlaying) then
                self.remainAni:Stop()
                self.remain.color = Color.New(self.remain.color.r,self.remain.color.g,self.remain.color.b,0.7)
                self.remain.transform.localScale = Vector3.New(1,1,1) / 1.5
            end
            self.remainAni:Play()
            self:subscibe_time_event(0.49, false, 0):OnComplete(function(t)
                self.remainAni:Stop()
                self.remain.text = #self.gameState.Dun .. ""
                self.remain.color = Color.New(self.remain.color.r,self.remain.color.g,self.remain.color.b,0.7)
                self.remain.transform.localScale = Vector3.New(1,1,1) / 1.5
            end)
        else
            if(self.remainAni.isPlaying) then
                self.remainAni:Stop()
                self.remain.color = Color.New(self.remain.color.r,self.remain.color.g,self.remain.color.b,0.7)
                self.remain.transform.localScale = Vector3.New(1,1,1) / 1.5
            end
            self.remain.text = #self.gameState.Dun .. ""
        end
        self.remainNum = remainNum
    end
end
---拦牌状态
function TableCommonView:game_state_wait_action()
    for i=1,#self.pointerChilds do
        self.pointerChilds[i]:SetActive(false)
    end
    for i=1,#self.lightChilds do
        self.lightChilds[i]:SetActive(false)
    end
    self.timeDown:SetActive(false)
    self.waitObj:SetActive(true)
    self:end_time_down()
    self.roomType:on_game_state_wait_action()
end
---光标指向对应玩家
function TableCommonView:game_state_pointer_player()
    self.timeDown:SetActive(true)
    self.waitObj:SetActive(false)
    local localTargetSeat = self:server_to_local_seat(self.gameState.CurPlayer, 0)
    for i=1,#self.pointerChilds do
        self.pointerChilds[i]:SetActive(self:pointer_is_light(localTargetSeat, i))
    end
    local localSeat = self:server_to_local_seat(self.gameState.CurPlayer)
    for i=1,#self.lightChilds do
        self.lightChilds[i]:SetActive(i == localSeat)
    end
    self.playType:show_time_down()
end

--- 显示倒计时
function TableCommonView:show_time_down(t)
    self.timer1img.sprite = self.timer1imgSprite:FindSpriteByName(math.floor(t/10) .. "")
    self.timer2img.sprite = self.timer2imgSprite:FindSpriteByName((t % 10) .. "")
end

---刷新3D模式推荐按钮状态
function TableCommonView:refresh_goto3d_button_state()
    self.roomType:on_refresh_goto3d_button_state()
end

return  TableCommonView