





local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local Model = require('core.mvvm.model_base')
local BaseTableModel = class('baseTableModel', Model)


function BaseTableModel:initialize(...)

    Model.initialize(self, ...)
    self.sendMsgNetClientName = "bullfight"
    self.heartbeatRequestName = "Login.PingReq"

    self.heartbeatResponseName = "Msg_Table_Ping"
    Model.subscibe_msg_event(self, {    --登录回调
        msgName = "Msg_Table_Login",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
                Model.dispatch_event(self, "Event_Table_Login", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {    --进入房间
        msgName = "Msg_Table_Enter_Room",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
                print_debug("Event_Table_Enter_Room")      
                Model.dispatch_event(self, "Event_Table_Enter_Room", retData)                        
            end
        end
    })


    Model.subscibe_msg_event(self, {    
        msgName = "Msg_Table_Start",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
                Model.dispatch_event(self, "Event_Table_Start_Rsp", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Ready",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Ready_Rsp", retData)                               
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Leave_Room",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Leave_Room_Rsp", retData)                               
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Leave_Room_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Leave_Room_Notify", retData)                               
            end
        end
    })


    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_EnterRoom_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_EnterRoom_Notify", retData)                               
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Ready_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Ready_Notify", retData)                               
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Start_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Start_Notify", retData)                               
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Reset_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Reset_Notify", retData)                               
            end
        end
    })

    
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Ping",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                if(self.lastPingReqeustTime)then
                    self.pingDelayTime = UnityEngine.Time.realtimeSinceStartup - self.lastPingReqeustTime
                    self.lastPingReqeustTime = nil
                    if(self.pingDelayTime == 0)then
                        self.pingDelayTime = 0.06
                    end
                end
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)   
                Model.dispatch_event(self, "Event_Table_Ping", retData)                               
            end
        end
    })


    -- Model.subscibe_msg_event(self, {   
    --     msgName = "Msg_Table_SetBanker_Notify",
    --     callback = function(msgName, msgBuffer)
    --         if msgBuffer.msgRetCode == 0 then
    --             local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)   
    --             print_debug("Msg_Table_SetBanker_Notify")         
    --             Model.dispatch_event(self, "Event_Table_SetBanker_Notify", retData)                               
    --         end
    --     end
    -- })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Reconnect_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Reconnect_Notify", retData)                               
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Disconnect_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Disconnect_Notify", retData)                               
            end
        end
    })

    --聊天相关
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Chat",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Chat", retData)                               
            end
        end
    })
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Chat_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Chat_Notify", retData)                               
            end
        end
    })

    --解散房间相关
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Dissolve_Room",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Dissolve_Room_Rsp", retData)                               
            end
        end
    })
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Dissolve_RoomRequest_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Dissolve_RoomRequest_Notify", retData)                               
            end
        end
    })
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Dissolve_Room_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Dissolve_Room_Notify", retData)                               
            end
        end
    })

    -- --暂时离开
    -- Model.subscibe_msg_event(self, {   
    --     msgName = "Msg_Table_TemporaryLeave",
    --     callback = function(msgName, msgBuffer)
    --         if msgBuffer.msgRetCode == 0 then
    --             local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
    --             Model.dispatch_event(self, "Event_Table_TemporaryLeave", retData)                               
    --         end
    --     end
    -- })
    -- --暂时离开
    -- Model.subscibe_msg_event(self, {   
    --     msgName = "Msg_Table_TemporaryLeave_Notify",
    --     callback = function(msgName, msgBuffer)
    --         if msgBuffer.msgRetCode == 0 then
    --             local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
    --             Model.dispatch_event(self, "Event_Table_TemporaryLeave_Notify", retData)                               
    --         end
    --     end
    -- })

    --位置自定义信息变化响应
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_CustomInfoChangeRsp",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                print("====位置变化响应Msg_Table_CustomInfoChangeRsp")                             
            end
        end
    })
    --位置自定义信息变化广播
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_CustomInfoChangeBroadcast",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                print("====位置变化广播Msg_Table_CustomInfoChangeBroadcast")  
                Model.dispatch_event(self, "Event_Table_CustomInfoChangeBroadcast", retData)                            
            end
        end
    })

    --踢人相关
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_KickPlayer",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_KickPlayer", retData)                               
            end
        end
    })
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_KickPlayer_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_KickPlayer_Notify", retData)                               
            end
        end
    })

    -- 玩家金币变化通知
    Model.subscibe_msg_event(self,{
        msgName = "Msg_Table_ShotSettle_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Event_Table_ShotSettle_Notify", retData)
            end
        end
    })

    -- 托管请求返回
    Model.subscibe_msg_event(self,{
        msgName = "Msg_Table_Intrust",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Event_Table_Intrust", retData)
            end
        end
    })

    -- 托管通知
    Model.subscibe_msg_event(self,{
        msgName = "Msg_Table_IntrustNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Event_Table_IntrustNotify", retData)
            end
        end
    })

    -- 充值通知
    Model.subscibe_msg_event(self,{
        msgName = "Msg_Table_Recharge_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Event_Table_Recharge_Notify", retData)
            end
        end
    })

    -- 红包雨 房间奖励信息
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_RoomAwardMessage",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Event_Msg_Table_RoomAwardMessage", retData)
            end
        end
    })
end



---------------------------------------------------------------------------------


function BaseTableModel:request_ping()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Ping")
    Model.send_msg(self, msgId, request) 
    if(not self.lastPingReqeustTime)then
        self.lastPingReqeustTime = Time.realtimeSinceStartup
    end
end


function BaseTableModel:request_exit_room()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Leave_Room")
    Model.send_msg(self, msgId, request)
end


function BaseTableModel:request_ready()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Ready")
    request.isReady = 1
    Model.send_msg(self, msgId, request)
end

function BaseTableModel:request_start()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Start")
    Model.send_msg(self, msgId, request)
end


--聊天相关
--//消息类型，0:快捷短语,1:表情,2:语音
--//消息内容，当msgType==0时，为快捷短语id，当msgType==1时，为表情id;当msgType==2时为语音id
function BaseTableModel:request_chat(msgType, text)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Chat")    
    request.chatMsg.msgType = msgType
    request.chatMsg.text = text
    Model.send_msg(self, msgId, request)
end

--解散房间请求
function BaseTableModel:request_dissolve_room(agree)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Dissolve_Room")
    request.agree = agree
    Model.send_msg(self, msgId, request)
end

-- --暂时离开
-- function BaseTableModel:request_TempLeave(leave)
--     local msgId, request = self.netMsgApi:create_request_data("Msg_Table_TemporaryLeave")
--     request.is_temporary_leave = leave
--     Model.send_msg(self, msgId, request) 
-- end

------位置信息变化请求
function BaseTableModel:request_CustomInfoChange(customInfoJsonString)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_CustomInfoChangeReq")
    request.customInfo = customInfoJsonString
    Model.send_msg(self, msgId, request)
end

--踢人请求
function BaseTableModel:request_kick_player(player_id)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_KickPlayer")
    request.player_id = player_id    
    Model.send_msg(self, msgId, request)
end

--刷新玩家金币数请求
function BaseTableModel:request_refresh_user_coin()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_RefreshCoinBalance")
    Model.send_msg(self, msgId, request)
end

--充值请求 true 打开充值页面 false 关闭充值页面
function BaseTableModel:request_recharge(open)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Recharge")
    request.open = open
    Model.send_msg(self, msgId, request)
end

--申请托管请求 1 代表申请  2 代表取消
function BaseTableModel:request_intrust(action)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Intrust")
    request.action = action
    Model.send_msg(self, msgId, request)
end

return  BaseTableModel