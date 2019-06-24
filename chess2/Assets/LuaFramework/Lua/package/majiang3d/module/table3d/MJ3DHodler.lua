




local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
local Mj3dKan = require("package.majiang3d.module.table3d.Mj3dKan")
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")
local Mj3dThrowMj = require("package.majiang3d.module.table3d.Mj3dThrowMj")
local Vector3 = Vector3
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
---@class Mj3dHodler
local Mj3dHodler = {}

local Table3DEvent = require('package.majiang3d.module.table3D.table3d_event') ---3D事件系统

local CommonSpaceing = 2.63
local moZhangXOffset = 0.5
local readyOutMjYOffset = 0.5

---创建一个3DMJ手牌Hodler
function Mj3dHodler:Create(tableSeat,parent)
    ---@type Mj3dHodler
    local hodler = {}
    setmetatable(hodler, {__index = Mj3dHodler})
    hodler.tableSeat = tableSeat
    hodler.gameObject = parent.gameObject

    hodler.handMjTrans = GetComponentWithPath(hodler.gameObject, "HandMjs", ComponentTypeName.Transform)
    hodler.xiaMjTrans = GetComponentWithPath(hodler.gameObject, "XiaMjs", ComponentTypeName.Transform)
    hodler.throwTrans = GetComponentWithPath(hodler.gameObject, "ThrowMjs", ComponentTypeName.Transform)
    hodler.huaTrans = GetComponentWithPath(hodler.gameObject, "HuaMjs", ComponentTypeName.Transform)

    hodler.HandMj = {} ---手张 Mj3d对象的表
    ---处理不同手牌数量下控件的坐标
    if 1 == hodler.tableSeat.seatId then
        ---手张位置
        local pos = hodler.handMjTrans.localPosition
        if hodler.tableSeat.view.curWHRatio < hodler.tableSeat.view.originWHRatio then
            local magicOffset = 1.2 ---蜜汁常量，用来修正手牌和手牌摄像机之间存在夹角而他们又不在一个坐标系下导致偏移
            pos.y = pos.y  * (hodler.tableSeat.view.curWHRatio / hodler.tableSeat.view.originWHRatio) + magicOffset
        end
        hodler.handMjTrans.localPosition = pos
        hodler.handMjTrans.gameObject.layer = 9
    end
    ---下张位置
    --[[local pos = hodler.xiaMjTrans.localPosition
    if 14 == hodler.tableSeat.view.maxMjNum then
        pos.x = -30
    elseif 20 == hodler.tableSeat.view.maxMjNum then
        pos.x = -33
    end
    hodler.xiaMjTrans.localPosition = pos--]]

    hodler.HuaPaiMj = {}
    hodler.Kan = {} ---坎 Mj3dKan对象的表
    hodler.Throw = Mj3dThrowMj:Create(hodler.throwTrans) ---弃张  Mj3d对象的表

    return hodler
end

---获取3D麻将牌桌布局对象
function Mj3dHodler:layoutType()
   return self.tableSeat.view.layoutType
end

---检测其他玩家是否出牌，如果有则播放出牌动画
function Mj3dHodler:checkOtherOutMj(playerState,gameState,serverIndex)
    if 1 ~= self.tableSeat.seatId then ---播放其他玩家的出牌动画
        for i=1,#gameState.Action do
            local action = gameState.Action[i]
            if action.SeatID == serverIndex then
                if action.Action == 8 or  action.Action == 9 then
                    local pai = playerState.QiZhang[#playerState.QiZhang]
                    self.tableSeat:PlayOutMjSound(pai)
                    self:displayMjOnScreen(pai,0.5,function ()
                    end)
                end
                break
            end
        end
    else
        for i=1,#gameState.Action do
            local action = gameState.Action[i]
            if action.SeatID == serverIndex then
                if action.Action == 8 then
                    local pai = playerState.QiZhang[#playerState.QiZhang]
                    if self.tableSeat.view:is_hua(pai,playerState) then
                        self.tableSeat.view:play_buhua(self.tableSeat.seatId)
                    end
                    if self.tableSeat.view.curTableData.isPlayBack   ---回放
                        or playerState.IntrustState == 1 ---托管模式
                        or self.tableSeat.view.curTableData.isGuidance then ---引导模式
                        self.tableSeat:PlayOutMjSound(pai)
                        self:displayMjOnScreen(pai,0.5,function ()
                        end)
                    end
                elseif action.Action == 9 then
                    local pai = playerState.QiZhang[#playerState.QiZhang]
                    if self.tableSeat.view:is_hua(pai,playerState) then
                        self.tableSeat.view:play_buhua(self.tableSeat.seatId)
                    end
                    self.tableSeat:PlayOutMjSound(pai)
                    self:displayMjOnScreen(pai,0.5,function ()
                    end)
                end
                break
            end
        end
    end
end

---添加手牌
function Mj3dHodler:addHandMj(playerState,shouZhangData,index,showHu,lastMjMove,dataIndex,notYellow)
    local mj3d = Mj3d:Create(shouZhangData.Pai,self.handMjTrans)  ---牌被创建时，缩放，旋转，局部坐标都会重置
    if 1 == self.tableSeat.seatId then
        mj3d:setLayer(9)
    else
        mj3d:setLayer(11)
    end
    mj3d.dataIndex = dataIndex
    table.insert(self.HandMj,index,mj3d)
    if 1 ~= self.tableSeat.seatId then
        mj3d:setColliderState(false) ---不是玩家自己，关闭麻将的碰撞
    end
    mj3d:setShowZhangData(shouZhangData)
    ---处理角标
    local tex = nil
    if self.tableSeat.view:show_ting(shouZhangData.Pai)  then  --todo:这个逻辑需要移到View中
        mj3d:setTingArrowState(true)
    end

    local tagType = self.tableSeat.view:get_hand_tag_type(shouZhangData.Pai)
    local texture = nil
    local sprite = self.tableSeat.view.tagSpriteH:FindSpriteByName(tostring(tagType))
    if sprite then
        texture = sprite.texture
    end
    mj3d:setTag(texture)
    if(self.tableSeat.view:is_laizi(shouZhangData.Pai)) then   --todo:这个逻辑需要移到View中
        if not notYellow then
            mj3d:setMj3dDefState(mj3d.mj3dState.hlight)
            mj3d:setMj3dState(mj3d.mj3dState.hlight)
        end
    end
    if showHu then   --todo:这个逻辑需要移到View中
        tex = self.tableSeat.view.tagSpriteH:FindSpriteByName(tostring(2)).texture
        mj3d:setTag(tex)
    end

    ---处理牌的亮倒
    local isOpen = self.tableSeat.view:pai_is_open(playerState, shouZhangData)
    local isCovered = self.tableSeat.view:pai_is_covered(shouZhangData)
    local pos = Vector3.zero
    if isOpen or isCovered then
        ---处理牌的亮倒和覆盖状态
        if 1 == self.tableSeat.seatId then ---自己亮倒和覆盖的特殊处理
            mj3d.gameObject.transform.localEulerAngles = Vector3.New(-90,0,0)
        else
            local xRotate = isOpen and 0 or 180
            mj3d.gameObject.transform.localEulerAngles = Vector3.New(xRotate,0,0)
            pos.y = -1.3
            mj3d:setShadowState(Mj3d.shadowState.down)  ---不是自己的手牌设置阴影
        end
    else
        ---处理牌的普通状态
        mj3d.gameObject.transform.localEulerAngles = Vector3.New(-90,0,0)
        if 1 ~= self.tableSeat.seatId then
            mj3d:setShadowState(Mj3d.shadowState.standing)  ---不是自己的手牌设置阴影
        end
    end

    ---处理麻将变灰,处于无法响应操作状态
    if shouZhangData.Gray then
        mj3d:setColliderState(false)
        mj3d:setMj3dDefState(Mj3d.mj3dState.gray)
        mj3d:resetDefState()
    end

    if lastMjMove and not showHu then
        if 1 == self.tableSeat.seatId then  ---是玩家自己则设置到出牌状态
            self:setHandMjOutState(mj3d,true)
        end
    end
    return mj3d
end
---处理手张布局
function Mj3dHodler:processHandMjLayout(hasMoZhang,HandMj)
    local count = 0
    HandMj = HandMj or self.HandMj
    self:layoutType():ProcessLayoutHand(hasMoZhang,HandMj)
    if hasMoZhang then
        if (1 ~= self.tableSeat.view:getOneClickOutMjSetting()) then  ---当开启单击出牌时，刷新手牌时，摸张不弹起
            self:setHandMjOutState(HandMj[#HandMj],true)
        end
        self.lastChuMjTime = UnityEngine.Time.time ---重置一下点击限制，再每次重新排序手张后，如果有进张，则限制一下
    end
end
---清空手牌
function Mj3dHodler:clearHandMj3d()
    Mj3dHelper:clearMj3dTabel(self.HandMj)
    self.curOutReadyMj3d = nil
end
---乱序自己的手牌
function Mj3dHodler:disorderHandMj(hasMoZhang,HandMj)
    HandMj = HandMj or self.HandMj
    math.randomseed(os.time())
    local disorder = {}
    local moZhang = nil
    for i = #HandMj,1,-1 do
        local mj3d = HandMj[i]
        if (not hasMoZhang) or (i ~= #HandMj) then
            local insertIndex = (#disorder > 1) and math.random(1,#disorder) or 1
            table.insert(disorder,insertIndex,mj3d)
        else
            moZhang = mj3d
        end
    end
    if moZhang then
        table.insert(disorder,moZhang)
    end
    self:processHandMjLayout(hasMoZhang,disorder)
    return disorder
end

---显示所有手牌
function Mj3dHodler:showAllHandMj()
    for i=1,#self.HandMj do
        self.HandMj[i]:setMj3Active(true)
    end
end
---隐藏所有手牌
function Mj3dHodler:hideAllHandMj()
    for i=1,#self.HandMj do
        self.HandMj[i]:setMj3Active(false)
    end
end
---设置手牌的碰撞状态
function Mj3dHodler:setHandMjColiderState(state)
    for i=1,#self.HandMj do
        local mj3d = self.HandMj[i]
        mj3d:setColliderState(state)
        local shouZhangData = mj3d:getShouZhangData()
        if shouZhangData and shouZhangData.Gray then ---如果麻将状态是灰，则麻将的碰撞状态总是关闭的
            mj3d:setColliderState(false)
        end
    end
end

---刷新坎
function Mj3dHodler:refreshKan(kans,jinZhanglocalSeats)
    Mj3dHelper:clearKanTable(self.Kan)
    local totalSeat = self.tableSeat.view.totalSeat
    for i=1,#kans do
        local kan = kans[i]
        ---创建 Mj3dKan 对象
        local formLocalSeatId = jinZhanglocalSeats[i]

        local formState = 0  ---坎的进张来源状态   1 自己, 2下家，3对家，4 上家

        if 4 == totalSeat then
            if formLocalSeatId == 1 then  ---来源是自己
                formState = 1
            elseif formLocalSeatId == 2 then ---对家
                formState = 2
            elseif formLocalSeatId == 3 then ---对家
                formState = 3
            elseif formLocalSeatId == 4 then ---上家
                formState = 4
            end       
        elseif 3 ==  totalSeat then
            if formLocalSeatId == 1 then  ---来源是自己
                formState = 1
            elseif formLocalSeatId == 2 then ---对家
                formState = 2
            elseif formLocalSeatId == 4 then ---上家
                formState = 4
            end  
        elseif 2 ==  totalSeat then
            if formLocalSeatId == 1 then  ---来源是自己
                formState = 1
            elseif formLocalSeatId == 3 then ---对家
                formState = 3
            end       
        end

        local mj3dKan = Mj3dKan:Create(kan,self.xiaMjTrans,formState)
        table.insert(self.Kan,mj3dKan)
    end
    self:layoutType():ProcessLayoutKan(self.Kan)
end

---清空弃张
function Mj3dHodler:clearThrow()
    self.Throw:clear()
end
---添加弃张
function Mj3dHodler:addThorw(pai,showPointer)
    local mj3d = self.Throw:AddThrowMj(pai,showPointer)
    return mj3d
end
---处理弃张布局
function Mj3dHodler:processThorwLayout()
    self:layoutType():ProcessLayoutThrow(self.Throw)
end
---清空所有麻将箭头
function Mj3dHodler:clearAllArrow()
    self.Throw:clearAllArrow()
end

---刷新花牌
function Mj3dHodler:refreshHuaPai(huaPai)
    Mj3dHelper:clearMj3dTabel(self.HuaPaiMj)
    if not huaPai then
        return
    end
    for i=1,#huaPai do
        local pai = huaPai[i]
        ---创建Mj3d 对象
        ---@type Mj3d
        local mj3d = Mj3d:Create(pai,self.huaTrans)  ---牌被创建时，缩放，旋转，局部坐标都会重置
        mj3d:setLayer(13)
        mj3d:setMj3dDefState(Mj3d.mj3dState.outline)
        mj3d:setMj3dState(Mj3d.mj3dState.outline)
        local tagType = self.tableSeat.view:get_hua_tag_type(mj3d:Pai())
        local texture = nil
        local sprite = self.tableSeat.view.tagSpriteH:FindSpriteByName(tostring(tagType))
        if sprite then
            texture = sprite.texture
        end
        mj3d:setTag(texture)
        table.insert(self.HuaPaiMj,mj3d)
    end
    self:layoutType():ProcessLayoutHua(self.HuaPaiMj)
end

function Mj3dHodler:addHuaPai(pai)
    ---@type Mj3d
    local mj3d = Mj3d:Create(pai,self.huaTrans)  ---牌被创建时，缩放，旋转，局部坐标都会重置
    mj3d:setMj3dDefState(Mj3d.mj3dState.outline)
    mj3d:setMj3dState(Mj3d.mj3dState.outline)
    mj3d:setLayer(13)
    table.insert(self.HuaPaiMj,mj3d)
    self:layoutType():ProcessLayoutHua(self.HuaPaiMj)
end

function Mj3dHodler:ClearHua()
    Mj3dHelper:clearMj3dTabel(self.HuaPaiMj)
end

---清空座位上所有的麻将显示
function Mj3dHodler:Clear()
    Mj3dHelper:clearMj3dTabel(self.HandMj)
    self:ClearKan()
    self.Throw:clear()
    self:ClearHua()
end

function Mj3dHodler:ClearKan()
    Mj3dHelper:clearKanTable(self.Kan)
end

---根据麻将实体获取mj3d对象
function Mj3dHodler:getMj3dByObj(obj)
    if obj.transform.parent == self.handMjTrans then
        for i=1,#self.HandMj do
            ---@type Mj3d
            local mj3d = self.HandMj[i]
            if mj3d.gameObject == obj then
                return mj3d
            end
        end
    end
end
---获取出牌屏幕展示位置对象
function Mj3dHodler:getDisOnScreenPoint()
    local disPoint = self.tableSeat.view.disOnScreenPoints[self.tableSeat.seatId]
    return disPoint
end
---设置手牌麻将准备出牌状态
function Mj3dHodler:setHandMjOutState(mj3d,state)
    if 1 ~= self.tableSeat.seatId then
        return
    end
    local localPosition =  mj3d.gameObject.transform.localPosition
    if state then
        localPosition = Vector3.New(localPosition.x,readyOutMjYOffset,localPosition.z)
        self.curOutReadyMj3d = mj3d  ---当前是出牌等待状态的牌
        self.tableSeat.view:show_ting_hu_grid(mj3d:Pai())
    else
        if self.curOutReadyMj3d == mj3d then
            self.curOutReadyMj3d = nil
        end
        localPosition = Vector3.New(localPosition.x,0,localPosition.z)
    end
    mj3d.gameObject.transform.localPosition = localPosition

    if true == state and (not self.tableSeat.view.curTableData.isPlayBack) then
        Mj3d:OptActiedMj3ds(function(mj)
            if mj ~= self.curOutReadyMj3d
                    and mj:Pai() == self.curOutReadyMj3d:Pai()
                    and mj.transform.parent  ~= self.handMjTrans then
                mj:setMj3dState(Mj3d.mj3dState.hlight)
            else
                mj:resetDefState()
            end
        end)
    end
end
---当手牌麻将被点击时
function Mj3dHodler:onHandMjClick(mjObj,sendFun)

    local canOutmj = self.tableSeat.view:can_out()
    if not canOutmj then
        return
    end

    local needOut = false

    for i=1,#self.HandMj do
        local mj3d = self.HandMj[i]
        if mj3d.gameObject == mjObj then
            if canOutmj  
                and ((self.curOutReadyMj3d == mj3d ) or (1 == self.tableSeat.view:getOneClickOutMjSetting())) then  ---如果是当前准备出牌状态的牌则发送出牌消息
                needOut = true
                self.curOutReadyMj3d = mj3d
            else
                self:setHandMjOutState(mj3d,true)
                self.tableSeat.view:play_voice("common/xuanpai")
            end
        else
            self:setHandMjOutState(mj3d,false)
        end
    end

    if needOut then
        local curMj3d = self.curOutReadyMj3d 
        Mj3d:OptActiedMj3ds(function(mj)
            mj:resetDefState()
        end)
        self:outMj(curMj3d,sendFun)
    end

end

function Mj3dHodler:onHandMjPress(mjObj,state)
    if state then
        self.lastPressTime = UnityEngine.Time.time
        ---@type Mj3d
        local mj3d = self:getMj3dByObj(mjObj)
        self.tableSeat.view:show_ting_hu_grid(mj3d:Pai())
    end
end

---当手牌麻将拖动时
function Mj3dHodler:onHandMjDrag(obj)
    local canOutmj = self.tableSeat.view:can_out()
    if not canOutmj then
        return
    end
    local Cam3d = Mj3dHelper:getModule().myHandMj3DEvent.Cam
    local screenPos = Mj3dHelper:getModule().myHandMj3DEvent:curScreenPos()   --Table3DEvent:curScreenPos()
    screenPos.z = self.tableSeat.view.disOnScreenTrans.position.z - self.tableSeat.view.myHandMjCam.transform.position.z
    local worldPos = Cam3d:ScreenToWorldPoint(screenPos)
    obj.transform:GetChild(0).position = worldPos
    --obj.transform.position = worldPos
end
---当手牌麻将拖放时
function Mj3dHodler:onHandMjDrop(obj,targetObj,sendFun)
    local canOutmj = self.tableSeat.view:can_out()
    ---判断麻将是否放回手牌的区域
    if targetObj then
        if obj.transform.parent.gameObject == targetObj
            or obj.transform.parent.gameObject == targetObj.transform.parent.gameObject then
            canOutmj = false
            if self.lastPressTime and UnityEngine.Time.time - self.lastPressTime <= 0.2 then  ---拖动的前0.2释放立即出牌
                canOutmj = self.tableSeat.view:can_out()
            end
        end
    end
    local needOut = false
    if canOutmj then
        local curMj3d = self:getMj3dByObj(obj)
        local child = obj.transform:GetChild(0)
        curMj3d.gameObject.transform.position = child.position
        child.localPosition = Vector3.zero
        self:setHandMjOutState(curMj3d,true)
        curMj3d.gameObject:SetActive(false)
        needOut = true
    else
        local curMj3d = self:getMj3dByObj(obj)
        obj.transform:GetChild(0).localPosition = Vector3.zero
        --[[self:processHandMjLayout(self.tableSeat.hasMoZhang) ---还原布局
        for i=1,#self.HandMj do
            local mj3d = self.HandMj[i]
            self:setHandMjOutState(mj3d,false)
        end
        if self.tableSeat.hasMoZhang then
            self:setHandMjOutState(curMj3d,true)
        end--]]
    end

    if needOut then
        local curMj3d = self.curOutReadyMj3d
        Mj3d:OptActiedMj3ds(function(mj)
            mj:resetDefState()
        end)
        self:outMj(curMj3d,sendFun)
    end
end

---出牌
function Mj3dHodler:outMj(curMj3d,sendFun)

    local scrollBack = function()
        curMj3d.gameObject:SetActive(true)
        curMj3d.transform:GetChild(0).localPosition = Vector3.zero
        self:processHandMjLayout(true)
        --self:setHandMjOutState(curMj3d,true)
    end

    if self.lastChuMjTime then  ---最短出牌间隔限制
        if UnityEngine.Time.time - self.lastChuMjTime < 0.5 then
            scrollBack()
            return
        end
    end
    self.lastChuMjTime = UnityEngine.Time.time

    local excute = function()
        self.tableSeat.view:play_voice("common/chupai")
        sendFun = sendFun or function()
            Mj3dHelper:getModel():request_chu_mj(curMj3d:Pai(),self.tableSeat.view.isMidTing)  ---发送出牌消息
        end
        sendFun()
        curMj3d.gameObject:SetActive(false)
        local pai = curMj3d:Pai()

        Mj3dHelper:getModule():begin_cache_game_state()
        self:setHandMjColiderState(false)

        local isHuaPai = self.tableSeat.view:is_hua(pai,self.tableSeat:getPlayerState())
        local laiNeedAddToHua = self.tableSeat.view:is_laizi(pai) and self.tableSeat.view:check_lai_zi_need_simulation_add_to_hua()
        if isHuaPai or laiNeedAddToHua then ---花牌直接打出去，不播放出牌动画
            self.tableSeat.view:clearArrow()
            self:processThorwLayout()
            ---这里调用View里面实现的模拟添加花牌接口，因为不同游戏不一定要模拟添加花牌
            self.tableSeat.view:local_simulation_add_hua(self.tableSeat.seatId,pai)
            self:playSortHandMjAni(curMj3d,function ()
                self.tableSeat.view:subscibe_time_event(0.01, false, 0):OnComplete(function()
                    Mj3dHelper:getModule():end_cache_game_state()
                end)
            end,0.01,0.01,0.01) ---播放理牌
        else
            self:simulationOutMj(pai,function ()
                self.tableSeat.view:clearArrow()
                self:addThorw(pai,true)
                self:processThorwLayout()
                self:playSortHandMjAni(curMj3d,function ()
                    self.tableSeat.view:subscibe_time_event(0.25, false, 0):OnComplete(function()
                        self.Throw:deleteMj3d(self.Throw:getLastMj3d())
                        Mj3dHelper:getModule():end_cache_game_state()
                    end)
                end) ---播放理牌
            end) ---模拟出牌
        end
        --self.tableSeat.view:hide_ting_hu_grid() ---出牌后，隐藏听胡列表
        self.tableSeat.view:hide_wait_action_select_card() ---隐藏Action 列表
    end

    Mj3dHelper:getModule().controller:chu_mj_pre_check(function ()
        excute()
    end,function ()
        scrollBack()
    end,curMj3d)
end

---模拟出牌
function Mj3dHodler:simulationOutMj(pai,callback)
    self:displayMjOnScreen(pai,0.5,nil)
    self.tableSeat.view:subscibe_time_event(0, false, 0):OnComplete(function(t)
        self.tableSeat:PlayOutMjSound(pai)
        if callback then
            callback()
        end
    end)
end

---在屏幕上展示麻将
---mj3d 用来展示的mj3d对象
---disTime 展示的事件
---onEnd 展示完成后的回调
function Mj3dHodler:displayMjOnScreen(pai,disTime,onEnd)
    local mj3d = Mj3d:Create(pai,self.gameObject.transform)
    mj3d:setLayer(14)
    mj3d:setKuangEffectState(true)
    mj3d.gameObject.transform.position = self:getDisOnScreenPoint().transform.position
    local eulerAngles = self.tableSeat.view.myHandMjCam.transform.eulerAngles
    eulerAngles.x = eulerAngles.x - 110
    mj3d.gameObject.transform.eulerAngles = eulerAngles
    self.tableSeat.view:subscibe_time_event(disTime, false, 0):OnComplete(function(t)
        Mj3dHelper:clearMj3d(mj3d)
        if onEnd then
            onEnd()
        end
    end)
end

--[[---播放播放玩家出牌动效
function Mj3dHodler:playOutMjAni(pai,onStart,onEnd)
    local nextLocalPos = self.Throw:getNextLocalPos(self.thorwMjRowMaxCount,self.throwMjColMaxCount)
    local nextWorldPos = self.Throw.gameObject.transform:TransformPoint(nextLocalPos)
    local nextEulerAngles = self.Throw.gameObject.transform.eulerAngles
    self.tableSeat.view:subscibe_time_event(0, false, 0):OnComplete(function(t)
        if onStart then
            onStart()
        end
    end)
    if onEnd then
        onEnd()
    end
end--]]

---播放出牌后的整理手牌动效
function Mj3dHodler:playSortHandMjAni(outMj3d,callback,upTime,moveTime,downTime)
    local needPlay = false
    for i=1,#self.HandMj do
        if self.HandMj[i] == outMj3d then
            if i ~= #self.HandMj then
                needPlay =  true
            end
            break
        end
    end
    local isCallBakc = false
    if needPlay then
        ---对出牌后的牌进行插入排序
        local sortMjs = {}
        for i=1,#self.HandMj do
            if self.HandMj[i] ~= outMj3d then
                local isLast = true
                for j=1,#sortMjs do
                    local mj = sortMjs[j]
                    if mj.dataIndex <= self.HandMj[i].dataIndex then
                        table.insert(sortMjs,j,self.HandMj[i])
                        isLast = false
                        break
                    end
                end
                if isLast then
                    table.insert(sortMjs,self.HandMj[i])
                end
            end
        end
        local nextMjx = {}
        for i = 1,#sortMjs do
            local x = -CommonSpaceing * i
            table.insert(nextMjx,x)
        end

        upTime = upTime or 0.1
        moveTime = moveTime or 0.15
        downTime = downTime or 0.1

        local lastMj = nil
        local lastMoveDis = nil
        local lastNetxMjx = nil
        for i = 1 ,#sortMjs do
            local mj = sortMjs[i]
            local moveDis = math.abs((mj.gameObject.transform.localPosition.x -  nextMjx[i]))
            if mj == self.HandMj[#self.HandMj] then
                lastMj = mj
                lastMoveDis = moveDis
                lastNetxMjx =  nextMjx[i]
            else
                if moveDis > 0.01 then
                    local targetPos = Vector3.New(nextMjx[i],
                    mj.gameObject.transform.localPosition.y,mj.gameObject.transform.localPosition.z)
                    mj.gameObject.transform:DOLocalMove(targetPos,moveTime):SetDelay(upTime)
                end
            end
        end
        if lastMoveDis > (CommonSpaceing + moZhangXOffset) then
            local upPos = Vector3.New(lastMj.gameObject.transform.localPosition.x,
                    3.5,lastMj.gameObject.transform.localPosition.z)
            local movePos = Vector3.New(lastNetxMjx,
                    3.5,lastMj.gameObject.transform.localPosition.z)
            local downPos = Vector3.New(lastNetxMjx,
                    0,lastMj.gameObject.transform.localPosition.z)
            lastMj.gameObject.transform:DOLocalMove(upPos,upTime):OnComplete(function ()
                lastMj.gameObject.transform:DOLocalMove(movePos,moveTime):OnComplete(function ()
                    lastMj.gameObject.transform:DOLocalMove(downPos,downTime):OnComplete(function ()
                        if callback then
                            callback()
                        end
                    end)
                end)
            end)
        else
            local targetPos = Vector3.New(lastNetxMjx,0,lastMj.gameObject.transform.localPosition.z) --lastMj.gameObject.transform.localPosition.y
            lastMj.gameObject.transform:DOLocalMove(targetPos,moveTime):SetDelay(upTime):OnComplete(function ()
                if callback then
                    callback()
                end
            end)
        end
    else
        if callback then
            callback()
        end
    end
end

return Mj3dHodler
