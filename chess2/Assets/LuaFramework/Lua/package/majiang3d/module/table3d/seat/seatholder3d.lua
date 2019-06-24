




local SeatHolder2D = require("package.majiang.module.tablenew.seat.seatholder2d")
---@class SeatHolder3D:SeatHolder2D
local SeatHolder3D = {}
setmetatable(SeatHolder3D, { __index = SeatHolder2D }) ---继承与2DHodler

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

local MJ3DHodler = require("package.majiang3d.module.table3d.MJ3DHodler")

--- 创建
function SeatHolder3D:new(view, localSeat)
    local seatHolder = {}
    seatHolder.view = view
    seatHolder.seatId = localSeat
    seatHolder.root = seatHolder.view.root
    setmetatable(seatHolder, { __index = SeatHolder3D })
    return seatHolder
end

---当初始化座位
function SeatHolder3D:init(seatPosTran)
    SeatHolder2D.init(self,seatPosTran)
    if 3 == self.seatId then  ---因为3D麻将的2D UI 与2D麻将的UI预制是保持同步的，所以3号玩家的座位偏移使用代码控制
        local pos =self.seatParent.transform.anchoredPosition
        pos.x = pos.x + 50
        self.seatParent.transform.anchoredPosition = pos
    end
    local mj3dHodlerParent = GetComponentWithPath(self.view.root, "Root3D/3DObjs/Seats/"..self.seatId.."/Seat", ComponentTypeName.Transform)
    ---@type Mj3dHodler
    self.mj3dHodler = MJ3DHodler:Create(self,mj3dHodlerParent)  ---初始化一个MJ3DHodler
end

function SeatHolder3D:init_head_info(root, seatPosTran)
    SeatHolder2D.init_head_info(self,root, seatPosTran)
    self.NotSeatDownImageStyle1 = GetComponentWithPath(root, "NotSeatDown/Style1", ComponentTypeName.Transform).gameObject
    self.NotSeatDownImageStyle2 = GetComponentWithPath(root, "NotSeatDown/Style2", ComponentTypeName.Transform).gameObject
end


---重置座位
function SeatHolder3D:on_reset()
    SeatHolder2D.on_reset(self)
    if self.mj3dHodler then
        self.mj3dHodler:Clear()
    end
end
---设置3D麻将手牌
function SeatHolder3D:update_hand_mj(playerState, gameState, lastMjMove,index)
    self.mj3dHodler:refreshShouZhang(playerState, gameState, lastMjMove,index)
end
---添加手张
function SeatHolder3D:add_Hand_Mj(playerState,shouZhangData,index,showHu,lastMjMove,dataIndex,notYellow)
    local mj3d = self.mj3dHodler:addHandMj(playerState,shouZhangData,index,showHu,lastMjMove,dataIndex,notYellow)
    if lastMjMove then
        self.hasMoZhang = true
    end
    return mj3d
end
---开始手张刷新
function SeatHolder3D:begin_refresh_mj3d()
    self.mj3dHodler:clearHandMj3d()
    self.hasMoZhang = false
end
---结束手张刷新
function SeatHolder3D:end_refresh_mj3d(serverSeat,gameState)
    self.mj3dHodler:processHandMjLayout(self.hasMoZhang)
    self.mj3dHodler:checkOtherOutMj(gameState.Player[serverSeat + 1],gameState,serverSeat)
    -- canOutmj = self.view:can_out()
    --self.mj3dHodler:setHandMjColiderState(canOutmj)
end
---更新3D麻将下张
function SeatHolder3D:update_down_mj(playerState,localSeat)
    local jinZhanglocalSeats = {}
    for i=1,# playerState.XiaZhang do
        local targetSeat = self.serverSeat
        local xiaZhangData = playerState.XiaZhang[i]
        local xiaZhangSeat = self.view:server_to_local_seat(xiaZhangData.Seat,targetSeat)
        table.insert(jinZhanglocalSeats,xiaZhangSeat)
    end
    self.mj3dHodler:refreshKan(playerState.XiaZhang,jinZhanglocalSeats)
end
---开始更新弃张
function SeatHolder3D:begin_update_out_mj()

end
---添加弃张
function SeatHolder3D:add_out_mj(pai,showPointer)
    local mj3d = self.mj3dHodler:addThorw(pai,showPointer)
    return mj3d
end
---结束更新弃张
function SeatHolder3D:end_update_out_mj(curOutNum,preOutNum)
    if preOutNum > curOutNum or #self.mj3dHodler.Throw.Mjs > curOutNum then
        self.mj3dHodler.Throw:deleteMj3d(self.mj3dHodler.Throw:getLastMj3d())
    end
    self.mj3dHodler:processThorwLayout()
end
---更新3D麻将花牌
function SeatHolder3D:update_hua_mj(playerState)
    self.mj3dHodler:refreshHuaPai(playerState.HuaPai)
end

---获取自己当前的PlayerState
function SeatHolder3D:getPlayerState()
    local gameState = self.view.gameState
    if not gameState then
        return nil
    end
    for i=1,#gameState.Player do
        local localSeat = self.view:server_to_local_seat(i - 1)
        if localSeat == self.seatId then
            return gameState.Player[i]
        end
    end
end
---播放出牌声音
function SeatHolder3D:PlayOutMjSound(pai)
    local playerState = self:getPlayerState()
    if(self.view:is_hua(pai,playerState)) then
        self.view:play_buhua(self.seatId)
    else
        self.view:play_custom(pai,self.seatId)
    end
end

function SeatHolder3D:InitEvent()
    self.mj3dHodler:InitEvent()
end

function SeatHolder3D:clearArrow()
    local outmjs = self.mj3dHodler.Throw.Mjs
    for i=1,#outmjs do
        local mj3d = outmjs[i]
        mj3d:setArrowState(false)
    end
end

return SeatHolder3D