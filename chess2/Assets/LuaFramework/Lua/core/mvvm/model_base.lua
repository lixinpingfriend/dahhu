local require = require
local class = require("lib.middleclass")
local ModuleCache = ModuleCache
local log = require("util.log")

local NetClientManager = ModuleCache.net.NetClientManager

local MVVMBase = require('core.mvvm.mvvm_base')
---@class Model : MVVMBase
local Model = class('Model', MVVMBase)
local NetMsgHandler = ModuleCache.net.NetMsgHandler

local print_table = print_table

local GameConfigProject = ModuleCache.GameConfigProject
local coroutine = coroutine

function Model:initialize(packageName, modelData)
    self.packageName = packageName
    MVVMBase.initialize(self)

    self.modelData = modelData

    self.netMsgApi = require("package." .. packageName .. ".model.net.net_msg_data_map") --约定写法
    self.msgEventSubscibeData = {}
    self.sendMsgNetClientName = self.sendMsgNetClientName or 'login'
    self.heartbeatRequestName = nil
    self.heartbeatResponseName = nil
end

-- 订阅model层的事件，比如收到服务回包后回调给module层做逻辑处理

function Model:subscibe_event(eventName, callback)
    if not self.dispatcher then
        self.dispatcher = require("lib.event_dispatcher")()
    end
    self.dispatcher:on(eventName, callback)
end

-- 取消订阅model层的事件
function Model:unsubscibe_event(eventName, callback)
    if self.dispatcher then
        self.dispatcher:removeEventListener(eventName, callback)
    end
end

function Model:unsubscibe_event_by_name(eventName)
    if self.dispatcher then
        self.dispatcher:removeAllListeners(eventName)
    end
end

-- 分发model层的消息定义
function Model:dispatch_event(eventName, data)
    if self.dispatcher then
        self.dispatcher:emit(eventName, data)
    end
end


--- 订阅网络消息
-- subscibeData.clientName          连接名字                必填
-- subscibeData.msgName             消息名                  必填
-- subscibeData.callback            回调函数                必填
-- subscibeData.msgId               消息ID                  自动转换
-- subscibeData.errorTrigger    错误时是否也触发回调       选填（默认不触发）
-- subscibeData.append             回调是否为添加          选填（默认为替换前面的事件）
-- @param netClientName 绑定的net连接名字
function Model:subscibe_msg_event(subscibeData, netClientName)
    --if ModuleCache.GameManager.isEditor then
    --    for i, v in ipairs(self.msgEventSubscibeData) do
    --        if v and v.msgId == self.netMsgApi:get_msg_data(subscibeData.msgName)[3] then
    --
    --            return
    --        end
    --    end
    --end
    local data = self.netMsgApi:get_msg_data(subscibeData.msgName)
    if not data then
        if ModuleCache.GameManager.isEditor then
            error('subscibe_msg_event 错误：' .. subscibeData.msgName)
        end
        return
    end

    subscibeData.msgId = data[3]
    subscibeData.netClientName = netClientName or self.sendMsgNetClientName
    self.msgEventSubscibeData[#self.msgEventSubscibeData + 1] = subscibeData

    NetMsgHandler.subscibe_msg_event(subscibeData)
end


-- 取消订阅所有网络消息
function Model:unsubscibe_all_msg_event()
--    print_table(self.msgEventSubscibeData, self.packageName)
    for i, v in ipairs(self.msgEventSubscibeData) do
        if v then
            NetMsgHandler.unsubscibe_msg_event(v)
        end
    end
    self.msgEventSubscibeData = {}
end

-- 解包网络消息
function Model:unpack_msg(msgName, dataBuffer)
    local ret = self.netMsgApi:create_ret_data(msgName)
    -- print(string.byte(dataBuffer, 1, -1))
    ret:ParseFromString(dataBuffer)
    if ModuleCache.GameManager.tester then
        if GameConfigProject.netTransferDataShow and msgName ~= self.heartbeatResponseName then
            print_pbc_table(ret, "【" .. self.sendMsgNetClientName ..  "】收到消息包：" .. msgName)
        end
    end
    --记录日志
    if msgName == self.heartbeatResponseName then
    else
        local str = string.format('\n【%s】%s', os.date("%m%d %H:%M:%S"), msgName)
        self:start_write_log(ret._fields, str)
    end
    return ret
end

--- 给服务器发包
-- @param requestData 消息体，会自动转成proto格式
-- @param msgName 消息名，会自动转换成id
-- @param netClientName 发送消息的客户端名字
function Model:send_msg(msgName, requestData, netClientName, sendMsgHeadUseData)
    if ModuleCache.GameManager.tester then
        if GameConfigProject.netTransferDataShow and msgName ~= self.heartbeatRequestName then
            print_pbc_table(requestData, "【" .. (netClientName or self.sendMsgNetClientName) ..  "】请求发送消息包：" .. msgName)
        end
    end

    local sendClientName = netClientName or self.sendMsgNetClientName
    local client = NetClientManager.get_client(sendClientName)
    if client then
        client:send_msg(requestData:SerializeToString(), msgName, sendMsgHeadUseData or self.sendMsgHeadUseData)
        --记录日志
        if msgName == self.heartbeatRequestName then
        else
            local str = string.format('\n【%s】发包 %s', os.date("%m%d %H:%M:%S"), msgName)
            self:start_write_log(requestData._fields, str)
        end
    else
        print_pbc_table(requestData, "【" .. (netClientName or self.sendMsgNetClientName) ..  "】发送消息包失败，client为nil：" .. msgName)
        local str = string.format('\n【%s】发包失败, client为nil %s', os.date("%m%d %H:%M:%S"), msgName)
        self:start_write_log(requestData._fields, str)
    end
end

function Model:send_empty_msg_pbc(msgName, requestData, netClientName, sendMsgHeadUseData)
    local sendClientName = netClientName or self.sendMsgNetClientName
    NetClientManager.get_client(sendClientName):send_msg(nil, msgName, sendMsgHeadUseData or self.sendMsgHeadUseData)
end

function Model:send_empty_msg(msgName, netClientName, sendMsgHeadUseData)
    local sendClientName = netClientName or self.sendMsgNetClientName
    NetClientManager.get_client(sendClientName):send_msg(nil, msgName, sendMsgHeadUseData or self.sendMsgHeadUseData)
end

function Model:start_write_log(_fields, str)
    self:start_lua_coroutine(function()
        coroutine.wait(0)
        local logStr = log.format_pbc_table_tojson(_fields, str)
        ModuleCache.LogManager.raw_Log(logStr)
    end)
end

-- 销毁Model层
function Model:destroy()
    MVVMBase.base_destroy(self)
    self.isDestroy = true
    self:unsubscibe_all_msg_event()
    if self.dispatcher then
        self.dispatcher:removeAllListeners()
    end

    if self.on_destroy then
        self:on_destroy()
    end
    self._is_destroyed = true
end

return Model



