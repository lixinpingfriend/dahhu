





local print = print

local NetMsgHandler = {
    --三层结构  client  msgIdData  msgCallbackData
    _netClientMsgDatas = {}
}

--订阅网络消息事件
-- subscibeData
-- subscibeData.clientName          连接名字                必填
-- subscibeData.msgName             消息名                  必填
-- subscibeData.callback            回调函数                必填

-- subscibeData.msgId               消息ID                  自动转换
-- subscibeData.errorTrigger    错误时是否也触发回调       选填（默认不触发）
-- subscibeData.append             回调是否为添加          选填（默认为替换前面的事件）
function NetMsgHandler.subscibe_msg_event(subscibeData)
--    print_table(subscibeData, "NetClient:subscibe_msg_event")
    local clientMsgDatas = NetMsgHandler._netClientMsgDatas[subscibeData.netClientName]
    if not clientMsgDatas then
        clientMsgDatas = {}
        NetMsgHandler._netClientMsgDatas[subscibeData.netClientName] = clientMsgDatas
    end

    local msgIdData = clientMsgDatas[subscibeData.msgId]
    if msgIdData == nil then
        msgIdData = {}
        clientMsgDatas[subscibeData.msgId] = msgIdData
    end
    msgIdData[#msgIdData + 1] = subscibeData
end

--取消订阅连接事件监听
function NetMsgHandler.unsubscibe_msg_event(subscibeData)
--    print_table(subscibeData, '取消订阅')
    local clientMsgDatas = NetMsgHandler._netClientMsgDatas[subscibeData.netClientName]

    if clientMsgDatas then
        local msgIdData = clientMsgDatas[subscibeData.msgId]
        if msgIdData then
            local len = #msgIdData local funitem local reindex
            for i = 1, len do
                funitem = msgIdData[i]
                if funitem.callback == subscibeData.callback then
                    reindex = i
                end
            end
            if reindex then

                table.remove(msgIdData, reindex)
            end
        end
    end
end

function NetMsgHandler.clear_msg_event(netClientName)
    local clientMsgDatas = NetMsgHandler._netClientMsgDatas[netClientName]
    if clientMsgDatas then
        NetMsgHandler._netClientMsgDatas[netClientName] = nil
    end
end

function NetMsgHandler.clear_all_msg_event()
    NetMsgHandler._netClientMsgDatas = {}
end

-- 分发服务器消息
function NetMsgHandler.handle_net_message_pack(netClientName, msgBuffer)
    local clientMsgDatas = NetMsgHandler._netClientMsgDatas[netClientName]
    -- print_table(clientMsgDatas, "1111")
    if clientMsgDatas then
        local msgIdData = clientMsgDatas[msgBuffer.messageName]
        
        if msgIdData then
            local len = #msgIdData local subscibeData
            for i = 1, len do
                subscibeData = msgIdData[i]
                if subscibeData then
                    subscibeData.callback(subscibeData.msgName, msgBuffer)
                end
            end
        else
            print("没找到对应的消息监听函数，请检查net_msg_data_map!!! messageName=" .. msgBuffer.messageName)
        end
    else
        print("NetMsgHandler无对应的数据：" .. netClientName)
    end
end


return NetMsgHandler