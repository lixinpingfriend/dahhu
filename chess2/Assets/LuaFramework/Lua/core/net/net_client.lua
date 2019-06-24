local class = require('lib.middleclass')

local ModuleCache = ModuleCache
local Buffer = ModuleCache.net.Buffer
--local CNetworkManager = ModuleCache.net.NetworkManager
local NetMsgHandler = require('core.net.net_msg_handler')
local CSmartTimer = ModuleCache.SmartTimer.instance
local Time = Time
local ApplicationEvent = ApplicationEvent
local GameWebSocketClient = ModuleCache.net.GameWebSocketClient

-- 类名
---@class NetClient
local NetClient = class("NetClient")

-- 连接间隔时间
local connectIntervalTime = 1

-- 初始化init
function NetClient:init(name, msgProtocolType)
    --print('NetClient:init', name, msgProtocolType)
    local client = GameWebSocketClient.New(name, msgProtocolType);
    self.client = client
    self.name = name                -- 名字
    self.connectTime = 0            --连接次数
    self.connectSubscriber = {}     -- 连接事件
    self.msgSubscriberDatas = {}    -- 消息订阅
    self.msgProtocolType = msgProtocolType    -- 协议的类型
    self.lastConnecTime = self.lastConnecTime or 0
    self._appLoseFocus = false
    client.onEventChangeFn = function(state, errorCode, errorMsg)
        -- print(state, errorCode, errorMsg)
        self:handle_connect_event(state)
    end
    client.onReceiveMessageFn = function(msgBuffer)
        -- 郁闷，在TCP的协议中，有可能会出现能收包，但不能发包的情况。所以刷新时间需要以心跳为准
        -- 比如有一种情况，在打牌中，我已经不能
        if msgBuffer.messageName == "1" or msgBuffer.messageName == "5" or msgBuffer.messageName == "Login.PingRsp"  then
            self.lastReceivePackTime = Time.realtimeSinceStartup
        end
        NetMsgHandler.handle_net_message_pack(self.name, msgBuffer)
    end

    --if true or (not self._subscibeAppFocusEvent and ModuleCache.GameManager.runtimePlatform == "Android") then
    --    if name ~= "login" then
    --        self._subscibeAppFocusEvent = true
    --        local focusEvent = function(eventHead, eventData)
    --            --print("focusEvent", tostring(eventData) .. self.name)
    --            self._appLoseFocus = eventData
    --            self.lastConnecTime = Time.realtimeSinceStartup + 0.8
    --        end
    --        ApplicationEvent.subscibe_app_focus_event(focusEvent)
    --    end
    --end
end

--连接网络，带有连接间隔的判断。因为在断线重连的时候，网络出于不可用时一连接就会触发错误。所以连接需要带有一定延时
function NetClient:connect(address)
    if Time.realtimeSinceStartup - self.lastConnecTime < connectIntervalTime then
        self.isConnecting = true
        local connectDelayTiem = connectIntervalTime - (Time.realtimeSinceStartup - self.lastConnecTime)
        if connectDelayTiem > 1 then
            connectDelayTiem = 1
        end
        --print("connectDelayTiem", connectDelayTiem)
        self.connectBeginTimeId = CSmartTimer:Subscribe(connectDelayTiem, false, 0):OnComplete(function(t)
            self:_connect_server(address)
        end).id
    else
        if not self.isConnecting then
            self:_connect_server(address)
        end
        -- 先打个保险
        self.isConnecting = false
    end
end

function NetClient:_connect_server(address)
    self.lastConnecTime = Time.realtimeSinceStartup
    --print('connect -', "ws://" .. address)
    self.client:Connect("ws://" .. address)
    -- 设置连接超时的逻辑
    self.connectTimeId = CSmartTimer:Subscribe(8, false, 0):OnComplete(function(t)
        self.connectTimeId = nil
        self.client:CloseWebSocket()
        self:handle_connect_event("ConnectTimeOut")
    end).id
end


function NetClient:reconnect()
    --print("reconnect")
    self.client:Reconnect()
end

-- 主动断线关闭，会抛出错误信息
function NetClient:disconnect()
    if self._appLoseFocus then
        self.lastConnecTime = Time.realtimeSinceStartup + 0.7
    else
        -- 暂时性的延迟关闭，加这个判断因为Android长时间后台运行再激活是，有可能触发ANR卡顿
        if self.lastConnecTime < Time.realtimeSinceStartup then
            self.lastConnecTime = Time.realtimeSinceStartup
        end
    end

    self.clientConnected = false
    -- 郁闷，之前的本地代码是先抛出异常，再清空关闭Close，就会出现问题。所以现在Lua代码中处理
    -- self.client:ForceDisconnect(false)
    self.client:CloseWebSocket()
    self:handle_connect_event("ConnectError")
end

-- 直接关闭不会有抛出异常
function NetClient:close(notTriggerCloseEvent)
    if self.connectTimeId then 
        CSmartTimer:Kill(self.connectTimeId)
        self.connectTimeId = nil
    end

    if self.connectBeginTimeId then 
        CSmartTimer:Kill(self.connectBeginTimeId)
        self.connectBeginTimeId = nil
    end

    self.clientConnected = false
    if self.client then
        if not notTriggerCloseEvent then
            self:handle_connect_event("Closed")
        end
        self.client.clientName = self.client.clientName .. "Abandoned"
        self.client:CloseWebSocket()
    end
end

-- 给服务器发送数据，data为pbc数据
function NetClient:send_msg(proData, messageID, useData)
    local buffer = Buffer.Create(self.msgProtocolType)  --会在C#层自动回收
    buffer:WriteBufferMsgProtolType1(proData, messageID, useData or 0)
    self.client:SendBuffer(buffer, true)
    buffer = nil
end

-- 添加连接事件监听，只有唯一的一个监听者
function NetClient:subscibe_connect_event(fun)
    self.connectSubscriber = fun
--    local data = self.connectSubscriber
--    data[#data + 1] = fun
--    print_table(data, "subscibe_connect_event")
end

-- 取消订阅连接事件监听
function NetClient:clear_subscibe_connect_event()
    self.connectSubscriber = nil
end


-- 销毁
function NetClient:destroy()
    self.client.onEventChangeFn = nil
    self.client.onReceiveMessageFn = nil
    self.client = nil
    self.name = nil
    self.connectSubscriber = nil
    self.msgSubscriberDatas = nil
    if self.connectTimeId then 
        CSmartTimer:Kill(self.connectTimeId)
        self.connectTimeId = nil
    end
    if self.connectBeginTimeId then 
        CSmartTimer:Kill(self.connectBeginTimeId)
        self.connectBeginTimeId = nil
    end
end

-- 服务器状态改变
-- Closed               网络关闭
-- Connecting           网络正在连接
-- Connected            网络已经连接
-- Disconnected         网络断线，上一次状态为连接状态
-- ConnectingTimeout    网络连接超时
-- Error                网络连接错误
-- DnsParseError        DNS解析错误。有可能是网络无法连接
-- DnsParseTimeout      DNS解析超时。网络状态不太好
function NetClient:handle_connect_event(state)
    self.isConnecting = false
    -- 清空事件回调
    if state == "ConnectError" then
        self.client.clientName = self.client.clientName .. "Abandoned"
        self.client:CloseWebSocket()
    end

    -- self.lastConnecTime = Time.realtimeSinceStartup
    local lastState = self.state
    if lastState == "Connected" and state == "ConnectError" then
        self.lastConnecTime = Time.realtimeSinceStartup - 0.8
        state = "Disconnected"
    end

    if self.connectTimeId then 
        CSmartTimer:Kill(self.connectTimeId)
        self.connectTimeId = nil
    end
    
    --print(self.name .. " handle state: " .. state)
    self.state = state
    if state == "Connected" then
        self.clientConnected = true
        self.lastReceivePackTime = Time.realtimeSinceStartup
    else
        self.clientConnected = false
    end

    local connectSubscriber = self.connectSubscriber
    if connectSubscriber then
        connectSubscriber(state)
    end
end

---重置protobuf压缩对象
function NetClient:reset_cdecompress()
    local t1 = typeof('DNet.GameWebSocketClient')
    local t3 = typeof('CDecompress')
    local flag = bit.bor(32,4)
    local field = tolua.getfield(t1,"msgDataDecompresser",flag)
    local funcReset = tolua.getmethod(t3,'Reset',typeof('System.UInt32'))
    local obj = field:Get(self.client)
    funcReset:Call(obj,1024*1024)
end


return NetClient