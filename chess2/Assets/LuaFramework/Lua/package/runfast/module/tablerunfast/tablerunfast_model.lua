local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local class = require("lib.middleclass")
local Model = require('core.mvvm.model_base')
local TableRunfastModel = class('TableRunfastModel', Model)


------初始化
function TableRunfastModel:initialize( ... )
    Model.initialize(self, ...)
    self.sendMsgNetClientName = "bullfight"
    self.heartbeatRequestName = "Login.PingReq"
    self.heartbeatResponseName = "Msg_Table_Ping"


    --登录回调
    Model.subscibe_msg_event(self, {    
        msgName = "Msg_Table_Login",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
                Model.dispatch_event(self, "Event_Table_Login", retData)
            end
        end
    })

    --进入房间
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_Enter_Room",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)             
                Model.dispatch_event(self, "Msg_Table_Enter_Room", retData)
            end
        end
    })

    --准备的回应
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Ready",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Ready_Rsp", retData)                               
            end
        end
    })
    --准备的广播通知
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Ready_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Ready_Notify", retData)                               
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
    })--解散请求
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Dissolve_RoomRequest_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Dissolve_RoomRequest_Notify", retData)                               
            end
        end
    })--解散投票
	Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Dissolve_Room_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                print("====房间已解散")
                Model.dispatch_event(self, "Event_Table_Dissolve_Room_Notify", retData)                               
            end
        end
    })--已解散


    --牌桌中有玩家进入房间的通知
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_EnterRoom_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_EnterRoom_Notify", retData)                               
            end
        end
    })
    --牌桌中有玩家退出房间的通知
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Leave_Room_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Leave_Room_Notify", retData)                               
            end
        end
    })
    --退出房间的回应
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Leave_Room",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Leave_Room_Rsp", retData)                               
            end
        end
    })


    --牌桌中有玩家断线的通知
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Disconnect_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Disconnect_Notify", retData)                               
            end
        end
    })
    --牌桌中有玩家重连的通知
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Reconnect_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Reconnect_Notify", retData)                               
            end
        end
    })


    --开始的回应
    Model.subscibe_msg_event(self, {    
        msgName = "Msg_Table_Start",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
                Model.dispatch_event(self, "Event_Table_Start_Rsp", retData)
            end
        end
    })
    --开始广播通知
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Start_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Start_Notify", retData)                               
            end
        end
    })


    --牌桌重置的通知:下一流程??
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Reset_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                print("=====Msg_Table_Reset_Notify")
                --local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                --Model.dispatch_event(self, "Event_Table_Reset_Notify", retData)
            end
        end
    })

    --牌桌心跳
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

 
    --不懂
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_SynExpire_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                print("=====Msg_Table_SynExpire_Notify")
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_SynExpire_Notify", retData)                               
            end
        end
    })


    --聊天回应
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Chat",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Chat", retData)                               
            end
        end
    })
    --聊天广播通知
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Chat_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_Chat_Notify", retData)                               
            end
        end
    })

    --单播消息 游戏信息 登录重连时发送
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_GameInfo",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_GameInfo", retData)                               
            end
        end
    })


    --广播消息 小结信息 一把打玩发送
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_CurrentGameAccount",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_CurrentGameAccount", retData)                               
            end
        end
    })

    --广播消息 大结消息
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_TotalGameAccount",
        callback = function(msgName, msgBuffer)
            print("=====Msg_Table_TotalGameAccount")
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_TotalGameAccount", retData)                               
            end
        end
    })

    --收到出牌信息广播
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_DiscardNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_DiscardNotify", retData)                               
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_DiscardReply",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_DiscardReply", retData)                               
            end
        end
    })


    --位置自定义信息变化响应
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_CustomInfoChangeRsp",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                --print("====位置变化响应Msg_Table_CustomInfoChangeRsp")
            end
        end
    })
    --位置自定义信息变化广播
    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_CustomInfoChangeBroadcast",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                --print("====位置变化广播Msg_Table_CustomInfoChangeBroadcast")  
                Model.dispatch_event(self, "Event_Table_CustomInfoChangeBroadcast", retData)                            
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_KickPlayerRsp",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_KickPlayerRsp", retData)                            
            end
        end
    })


    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_KickPlayerBroadcast",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                         
                Model.dispatch_event(self, "Event_Table_KickPlayerBroadcast", retData)                            
            end
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Synchronize_Notify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)   
                Model.dispatch_event(self, "Event_Table_Synchronize_Notify", retData)                               
            end
        end
    })

    --快速组局踢人倒计时
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_KickPlayerExpire",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)

                Model.dispatch_event(self, "Event_Table_KickPlayerExpire", retData)
            end
        end
    })

    --红包奖励信息
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_RoomAwardMessage",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_RoomAwardMessage", retData)
            end
        end
    })

    --即使结算通知
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_OneShotSettleNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_OneShotSettleNotify", retData)
            end
        end
    })

    --托管回应
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_IntrustRsp",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_IntrustRsp", retData)
            end
        end
    })

    --托管广播
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_IntrustNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_IntrustNotify", retData)
            end
        end
    })


    -- --金币不足通知
    -- Model.subscibe_msg_event(self, {
    --     msgName = "Msg_Table_GoldNotEnoughNotify",
    --     callback = function(msgName, msgBuffer)
    --         if msgBuffer.msgRetCode == 0 then
    --             local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
    --             Model.dispatch_event(self, "Msg_Table_GoldNotEnoughNotify", retData)
    --         end
    --     end
    -- })


    --定时器通知
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_TimeoutNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_TimeoutNotify", retData)
            end
        end
    })

    --破产通知
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_BankruptNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_BankruptNotify", retData)
            end
        end
    })

    --充值通知
    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_RechargeNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_RechargeNotify", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_CardRecorderMsg",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_CardRecorderMsg", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_CardRecorderStatuRsp",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_CardRecorderStatuRsp", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_PlayerMatchRanksNotify",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_PlayerMatchRanksNotify", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {
        msgName = "Msg_Table_MatchRankRsp",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Msg_Table_MatchRankRsp", retData)
            end
        end
    })

end


------------------------------------------------------------------------------------------
------解散房间请求
function TableRunfastModel:request_dissolve_room(agree)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Dissolve_Room")
    request.agree = agree
    Model.send_msg(self, msgId, request, "bullfight")
end

------准备的请求
function TableRunfastModel:request_ready()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Ready")
    request.isReady = 1
    Model.send_msg(self, msgId, request)
end

--[[
------取消准备请求
function TableRunfastModel:request_ready()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Ready")
    request.isReady = 0
    Model.send_msg(self, msgId, request)
end
]]

------开始请求
function TableRunfastModel:request_start()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Start")
    Model.send_msg(self, msgId, request)
end



------心跳
function TableRunfastModel:request_ping()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Ping")
    Model.send_msg(self, msgId, request)
    if(not self.lastPingReqeustTime)then
        self.lastPingReqeustTime = Time.realtimeSinceStartup
    end
end

------
function TableRunfastModel:request_exit_room()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Leave_Room")
    Model.send_msg(self, msgId, request)
end

------聊天请求
function TableRunfastModel:request_chat(msgType, text)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Chat")    
    request.chatMsg.msgType = msgType
    request.chatMsg.text = text
    Model.send_msg(self, msgId, request)
end

------出牌请求:你要出的牌的列表ThrowCardList
function TableRunfastModel:request_discardInfo(ThrowCardList,discard_serial_no,clientClickMethod)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_DiscardInfo")
    request.is_passed = (ThrowCardList == nil or #ThrowCardList <= 0) --是否要不起，即过牌
    request.discard_serial_no = discard_serial_no
    if(ThrowCardList ~= nil and #ThrowCardList > 0 ) then
        for i=1,#ThrowCardList do
           table.insert(request.cards, ThrowCardList[i])    
        end
    end
    
    if(clientClickMethod ~= nil) then
        request.client_click_method = clientClickMethod or ""
    end
    
    Model.send_msg(self, msgId, request)
end

function TableRunfastModel:request_CardRecorderStatuReq()
    --print("====请求记牌是否已经购买")
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_CardRecorderStatuReq")
    Model.send_msg(self, msgId, request)
end

function TableRunfastModel:request_MatchRankReq()
    --print("====实时排行榜申请")
    local matchInfo = self.modelData.curTableData.roomInfo.matchInfo
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_MatchRankReq")
    request.matchId = matchInfo.matchId
    request.stageId = matchInfo.stageId
    Model.send_msg(self, msgId, request)
end

--破产
function TableRunfastModel:request_BankruptConfirmReq(action)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_BankruptConfirmReq")
    request.action = action
    Model.send_msg(self, msgId, request)
end

--请求补充金币
function TableRunfastModel:request_RechargeReq(open)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_RechargeReq")
    request.open = open
    Model.send_msg(self, msgId, request)
end

--请求更新余额
function TableRunfastModel:request_UserCoinBalanceReq()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_UserCoinBalanceReq")
    Model.send_msg(self, msgId, request)
end


function TableRunfastModel:request_IntrustReq(IsApplyIntrust)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_IntrustReq")
    if(IsApplyIntrust) then
        request.action = 1 --1 代表申请托管  2 代表取消托管
    else
        request.action = 2
    end
    Model.send_msg(self, msgId, request)
end

------位置信息变化请求
function TableRunfastModel:request_CustomInfoChange(customInfoJsonString)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_CustomInfoChangeReq")
    request.customInfo = customInfoJsonString
    Model.send_msg(self, msgId, request)
end

------发送踢人
function TableRunfastModel:request_KickPlayerReq(_player_id)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_KickPlayerReq")
    request.player_id = _player_id
    Model.send_msg(self, msgId, request)
end

return  TableRunfastModel