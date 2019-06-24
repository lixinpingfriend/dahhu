




local Vector3 = Vector3
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")

local commonSpaceing = -2.63  ---墩间间隔
local dunUpMjYOffset = 1.788 ---一个墩上面麻将的Y轴坐标偏移
---@class Mj3dDun
local Mj3dDun = {}

function Mj3dDun:Init(view,parent)
    self.view = view
    self.rootTrans = parent
    self.seatsTrans = {}
    self.optSeatsTrans = {}
    self.dunMj3ds = {}
    for i=1,self.rootTrans.childCount do
        local seatTrans = GetComponentWithPath(self.rootTrans.gameObject,tostring(i).."/Dun", ComponentTypeName.Transform)
        table.insert(self.seatsTrans,seatTrans)
    end
end

---刷新用来操作的墩的顺序
function Mj3dDun:refreshOptSeatsTrans(ZhuangJiaSeat)
    local totalSeat = self.view.totalSeat
    local beginIndex = 0
    local mySeat = self.view.mySeat
    table.clear(self.optSeatsTrans)
    local index = self.view:server_to_local_seat(beginIndex)

    for i=1,#self.seatsTrans do
        if index > #self.seatsTrans then
            index = 1
        end
        local seatTrans = self.seatsTrans[index]
        table.insert(self.optSeatsTrans,seatTrans)
        index = index + 1
    end

    if totalSeat == 3  then
        if ZhuangJiaSeat == 2 then
            if mySeat == 2 then
                local first = self.optSeatsTrans[1]
                table.remove(self.optSeatsTrans,1)
                table.insert(self.optSeatsTrans,first)
            elseif mySeat == 0 then
                local first = self.optSeatsTrans[1]
                table.remove(self.optSeatsTrans,1)
                table.insert(self.optSeatsTrans,first)
            end
        elseif ZhuangJiaSeat == 1 then
            if mySeat == 2 then
                local first = self.optSeatsTrans[1]
                table.remove(self.optSeatsTrans,1)
                table.insert(self.optSeatsTrans,first)
            end
        end
    end
end

---初始化墩上的麻将
function Mj3dDun:InitDunMjs(Dun,ZhuangJiaSeat,TotalCount)
    Mj3dHelper:clearMj3dTabel(self.dunMj3ds)
    self:refreshOptSeatsTrans(ZhuangJiaSeat)
    local leftCount = #Dun ---墩上剩余的牌数
    local dunCount = TotalCount / 2 ---总墩数
    local blanceCount = math.floor(dunCount / #self.optSeatsTrans)  ---除去尾数每个座位多少墩

    local eachDirCount = dunCount / 4
    if eachDirCount >= 16 then  ---根据牌的总数，适应墩上麻将的缩放
        for i=1,#self.optSeatsTrans do
           local trans = self.optSeatsTrans[i]
            trans.localScale = Vector3.one * (1 - (math.ceil(eachDirCount - 16) / 16))
        end
    end

    local dunCountInfo = {}
    for i=1,#self.optSeatsTrans do
        table.insert(dunCountInfo,blanceCount)
    end
    local left = dunCount % #self.optSeatsTrans
    if 1 == left then
        dunCountInfo[1] = dunCountInfo[1] + 1
    elseif 2 == left then
        dunCountInfo[1] = dunCountInfo[1] + 1
        dunCountInfo[3] = dunCountInfo[3] + 1
    elseif 3 == left then
        dunCountInfo[1] = dunCountInfo[1] + 1
        dunCountInfo[2] = dunCountInfo[2] + 1
        dunCountInfo[3] = dunCountInfo[3] + 1
    end
    local countT = 0
    for i=1,#self.optSeatsTrans do
        local tempCount = dunCountInfo[i] ---当前座位前面的墩数
        local trans = self.optSeatsTrans[i]
        for j=1, tempCount do ---从最后一个墩开始
        ---一个墩造两个麻将
        local xOffset = -commonSpaceing * j
            ---造上面的
            ---@ type Mj3d
            local mj3dUp = Mj3d:Create(-1,trans)
            mj3dUp.gameObject.transform.localPosition = Vector3.New(xOffset,dunUpMjYOffset,0)
            table.insert(self.dunMj3ds,mj3dUp)
            mj3dUp.gameObject.name = tostring(countT)
            mj3dUp:setColliderState(false)---关闭碰撞
            countT = countT + 1
            ---造下面的
            ---@type Mj3d
            local mj3dDown = Mj3d:Create(-1,trans)
            mj3dDown.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
            table.insert(self.dunMj3ds,mj3dDown)
            mj3dDown.gameObject.name = tostring(countT)
            mj3dDown:setColliderState(false)---关闭碰撞
            countT = countT + 1
        end
    end
end

---清空墩上的麻将
function Mj3dDun:Clear()
    self.lastDelDunMjIndex = nil
    Mj3dHelper:clearMj3dTabel(self.dunMj3ds)
end

---刷新墩
function Mj3dDun:refreshDuns(Dun,TotalCount,DunStart,ZhuangJiaSeat,DunData)
    TotalCount = (DunData and DunData.TotalCount ~= 0) and DunData.TotalCount or TotalCount
    DunStart = (DunData and DunData.DunStart ~= 0)  and  DunData.DunStart or DunStart
    if  0 >= #self.dunMj3ds then
        self:InitDunMjs(Dun,ZhuangJiaSeat,TotalCount)
    end
    local leftCount = #Dun ---墩上剩余的牌数
    local startIndex = DunStart
    local count = startIndex
    local delCount = #self.dunMj3ds - leftCount
    for i=1,#self.dunMj3ds do
        if count < 1 then
            count = #self.dunMj3ds
        end
        local mj3d = self.dunMj3ds[count]
        if  i <= delCount then
            mj3d:setMj3Active(false)
            self.lastDelDunMjIndex = count
        else
            mj3d:setMj3Active(true)
        end
        count = count - 1
    end
    self:processDunMjHover()
end

---处理墩麻将,下面的麻将被删除,上面的麻将浮空的问题
function Mj3dDun:processDunMjHover()
    for i=1,#self.dunMj3ds do
        ---@type Mj3d
        local mj3d = self.dunMj3ds[i]
        local need = ((i % 2) ~= 0)
        mj3d:setShadowState(Mj3d.shadowState.none)
        if need then
            ---@type Mjd
            local downMj = self.dunMj3ds[i+1]
            if downMj and mj3d.gameObject.activeSelf and (not downMj.gameObject.activeSelf ) then
                local pos = mj3d.transform.localPosition
                pos.y = 0
                mj3d.transform.localPosition = pos
                mj3d:setShadowState(Mj3d.shadowState.down)
            else
                local pos = mj3d.transform.localPosition
                pos.y = dunUpMjYOffset
                mj3d.transform.localPosition = pos
            end
        else
            mj3d:setShadowState(Mj3d.shadowState.down)
        end
    end
end

function Mj3dDun:resetHoverProcess()
    for i=1,#self.dunMj3ds do
        ---@type Mj3d
        local mj3d = self.dunMj3ds[i]
        local need = ((i % 2) ~= 0)
        if need then
            local pos = mj3d.transform.localPosition
            pos.y = dunUpMjYOffset
            mj3d.transform.localPosition = pos
        else
            local pos = mj3d.transform.localPosition
            pos.y = 0
            mj3d.transform.localPosition = pos
        end
    end
end


---操作墩上的麻将
function Mj3dDun:optDunMjs(startIndex,endIndex,optCallBack,isLoop,isReverse)
    local len = endIndex - startIndex
    if len <= 0 then
        return
    end
    if isReverse then
        if not isLoop then
            local count = 0
            for i=startIndex,1,-1 do
                if i < 1 or count > len  then
                    return
                end
                if optCallBack then
                    optCallBack(self.dunMj3ds[i])
                end
                count = count + 1
            end
        else
            local index = startIndex
            local count = 0
            for i=1,#self.dunMj3ds do
                if count > len then
                    return
                end
                if index < 1 then
                    index = #self.dunMj3ds
                end
                if optCallBack then
                    optCallBack(self.dunMj3ds[index])
                end
                index = index - 1
                count = count + 1
            end
        end
    else
        if not isLoop then
            local count = 0
            for i=startIndex,#self.dunMj3ds do
                if i > #self.dunMj3ds or count > len  then
                    return
                end
                if optCallBack then
                    optCallBack(self.dunMj3ds[i])
                end
                count = count + 1
            end
        else
            local index = startIndex
            local count = 0
            for i=1,#self.dunMj3ds do
                if count > len then
                    return
                end
                if index > #self.dunMj3ds then
                    index = 1
                end
                if optCallBack then
                    optCallBack(self.dunMj3ds[index])
                end
                index = index + 1
                count = count + 1
            end
        end
    end
end
---获取墩上被删除的最后一个麻将在墩中的索引
function Mj3dDun:getLastDelDunMjIndex()
    return self.lastDelDunMjIndex or 1
end
---删除一个墩上的麻将
function Mj3dDun:delDunMj(index)
    local mj3d = self.dunMj3ds[index]
    if not mj3d then
        return
    end
    mj3d:setMj3Active(false)
end

return Mj3dDun