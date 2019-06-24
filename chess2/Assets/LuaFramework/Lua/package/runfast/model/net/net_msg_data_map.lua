local require = require

local NetMsgApi = {
    -- protol加载与缓存
    protolDataCache = {}
}

-- 此处必须与路径一致
local path = "package.runfast.model.net.protol."

function NetMsgApi:get_msg_data(msgName)
    local msgData = NetMsgApi.msgName2MsgData[msgName]
    return msgData
end


function NetMsgApi:get_protol(msgName, request)
    local msgData = NetMsgApi.msgName2MsgData[msgName]
    
    local pbName = request and msgData[5] or msgData[6]

    local protolData = NetMsgApi.protolDataCache[pbName]
    if not protolData then        
        protolData = require(path .. pbName)  
                  
        NetMsgApi.protolDataCache[pbName] = protolData
    end
    --print(path .. pbName)
    if request then        
        return msgData[1], protolData[msgData[2]]
    else        
        return msgData[3], protolData[msgData[4]]
    end
end

function NetMsgApi:get_protol_pbc(msgName, request)

end

function NetMsgApi:create_request_data(msgName)
    local msgId, data = self:get_protol(msgName, true)
    return msgId, data()
end

function NetMsgApi:create_ret_data(msgName)
    local msgId, data = self:get_protol(msgName, false)
    return data()
end
-- 命令名  --请求的命令ID 请求的proto结构体 收包的命令ID 收包的proto结构体 发包和收包proto结构体所在的proto文件名
NetMsgApi.msgName2MsgData = {}

NetMsgApi.msgName2MsgData.Msg_Table_Login = {"Login.LoginReq", "LoginReq", "Login.LoginRsp", "LoginRsp", "table.login_pb", "table.login_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Ping = {"Login.PingReq", "PingReq", "Login.PingRsp", "PingRsp", "table.login_pb", "table.login_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Enter_Room = {"Room.EnterReq", "EnterReq", "Room.EnterRsp", "EnterRsp", "table.room_pb", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Ready = {"Room.ReadyReq", "ReadyReq", "Room.ReadyRsp", "ReadyRsp", "table.room_pb", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Start = {"Room.StartReq", "StartReq", "Room.StartRsp", "StartRsp", "table.room_pb", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Leave_Room = {"Room.LeaveReq", "LeaveReq", "Room.LeaveRsp", "LeaveRsp", "table.room_pb", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Leave_Room_Notify = {"", "", "Room.LeaveBroadcast", "LeaveBroadcast", "", "table.room_pb"}

NetMsgApi.msgName2MsgData.Msg_Table_Chat = {"Room.ChatMsgReq", "ChatMsgReq", "Room.ChatMsgRsp", "ChatMsgRsp", "table.room_pb", "table.room_pb"}    
NetMsgApi.msgName2MsgData.Msg_Table_Chat_Notify = {"", "", "Room.ChatMsgBroadcast", "ChatMsgBroadcast", "", "table.room_pb"}

NetMsgApi.msgName2MsgData.Msg_Table_CustomInfo = {"", "", "Room.CustomInfo", "CustomInfo", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_CustomInfoChangeReq = {"Room.CustomInfoChangeReq", "CustomInfoChangeReq", "", "", "table.room_pb", ""}
NetMsgApi.msgName2MsgData.Msg_Table_CustomInfoChangeRsp = {"", "", "Room.CustomInfoChangeRsp", "CustomInfoChangeRsp", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_CustomInfoChangeBroadcast = {"", "", "Room.CustomInfoChangeBroadcast", "CustomInfoChangeBroadcast", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_KickPlayerExpire = {"", "", "Room.KickPlayerExpire", "KickPlayerExpire", "", "table.room_pb"}


NetMsgApi.msgName2MsgData.Msg_Table_KickPlayerReq = {"Room.KickPlayerReq", "KickPlayerReq", "", "", "table.room_pb", ""} --发送踢人
NetMsgApi.msgName2MsgData.Msg_Table_KickPlayerRsp = {"", "", "Room.KickPlayerRsp", "KickPlayerRsp", "", "table.room_pb"} --踢人回馈
NetMsgApi.msgName2MsgData.Msg_Table_KickPlayerBroadcast = {"", "", "Room.KickPlayerBroadcast", "KickPlayerBroadcast", "", "table.room_pb"} --踢人广播

NetMsgApi.msgName2MsgData.Msg_Table_Dissolve_Room = {"Room.FreeReq", "FreeReq", "Room.FreeRsp", "FreeRsp", "table.room_pb", "table.room_pb"}    --请求解散房间
NetMsgApi.msgName2MsgData.Msg_Table_Dissolve_RoomRequest_Notify = {"", "", "Room.FreeBroadcast", "FreeBroadcast", "", "table.room_pb"}    --请求解散房间通知
NetMsgApi.msgName2MsgData.Msg_Table_Dissolve_Room_Notify = {"", "", "Room.FreeSuccessBroadcast", "FreeSuccessBroadcast", "", "table.room_pb"}    --解散房间通知


NetMsgApi.msgName2MsgData.Msg_Table_SynExpire_Notify = {"", "", "Room.SynExpireBroadcast", "SynExpireBroadcast", "", "table.room_pb"}


NetMsgApi.msgName2MsgData.Msg_Table_EnterRoom_Notify = {"", "", "Room.EnterBroadcast", "EnterBroadcast", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Reconnect_Notify = {"", "", "Room.ReconnBroadcast", "ReconnBroadcast", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Disconnect_Notify = {"", "", "Room.DisconnBroadcast", "DisconnBroadcast", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Ready_Notify = {"", "", "Room.ReadyBroadcast", "ReadyBroadcast", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Start_Notify = {"", "", "Room.StartBroadcast", "StartBroadcast", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Reset_Notify = {"", "", "Room.ResetBroadcast", "ResetBroadcast", "", "table.room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Synchronize_Notify = {"", "", "Room.SynchronizeBroadcast", "SynchronizeBroadcast", "", "table.room_pb"}


--单播消息 游戏信息 登录重连时发送
NetMsgApi.msgName2MsgData.Msg_Table_GameInfo = {"", "", "Game.GameInfo", "GameInfo", "", "mytable.game_pb"}
--广播消息 小结信息 一把打玩发送
NetMsgApi.msgName2MsgData.Msg_Table_CurrentGameAccount = {"", "", "Game.CurrentGameAccount", "CurrentGameAccount", "", "mytable.game_pb"}
--广播消息 大结消息
NetMsgApi.msgName2MsgData.Msg_Table_TotalGameAccount = {"", "", "Game.TotalGameAccount", "TotalGameAccount", "", "mytable.game_pb"}
--双向消息 下发是广播消息 出牌信息
NetMsgApi.msgName2MsgData.Msg_Table_DiscardNotify = {"Game.DiscardNotify", "DiscardNotify", "Game.DiscardNotify", "DiscardNotify", "mytable.game_pb", "mytable.game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_DiscardInfo = {"Game.DiscardInfo", "DiscardInfo", "", "", "mytable.game_pb", ""}
NetMsgApi.msgName2MsgData.Msg_Table_DiscardReply = {"", "", "Game.DiscardReply", "DiscardReply", "", "mytable.game_pb"}

NetMsgApi.msgName2MsgData.Msg_Table_RoomAwardMessage = {"", "", "Room.RoomAwardMessage", "RoomAwardMessage", "", "table.room_pb"}

--托管请求
NetMsgApi.msgName2MsgData.Msg_Table_IntrustReq = {"Room.IntrustReq", "IntrustReq", "", "", "table.room_pb", ""}
--托管回应
NetMsgApi.msgName2MsgData.Msg_Table_IntrustRsp = {"", "", "Room.IntrustRsp", "IntrustRsp", "", "table.room_pb"}
--托管通知
NetMsgApi.msgName2MsgData.Msg_Table_IntrustNotify = {"", "", "Room.IntrustNotify", "IntrustNotify", "", "table.room_pb"}
--金币不足通知
-- NetMsgApi.msgName2MsgData.Msg_Table_GoldNotEnoughNotify = {"", "", "Game.GoldNotEnoughNotify", "GoldNotEnoughNotify", "", "mytable.game_pb"}
--请求更新余额
NetMsgApi.msgName2MsgData.Msg_Table_UserCoinBalanceReq = {"Room.UserCoinBalanceReq", "UserCoinBalanceReq", "", "", "table.room_pb", ""}
--请求补充金币
NetMsgApi.msgName2MsgData.Msg_Table_RechargeReq = {"Room.RechargeReq", "RechargeReq", "", "", "table.room_pb", ""}
--补充金币通知
NetMsgApi.msgName2MsgData.Msg_Table_RechargeNotify = {"", "", "Room.RechargeNotify", "RechargeNotify", "", "table.room_pb"}
--即使结算通知
NetMsgApi.msgName2MsgData.Msg_Table_OneShotSettleNotify = {"", "", "Room.OneShotSettleNotify", "OneShotSettleNotify", "", "table.room_pb"}
--定时器通知
NetMsgApi.msgName2MsgData.Msg_Table_TimeoutNotify = {"", "", "Room.TimeoutNotify", "TimeoutNotify", "", "table.room_pb"}
--破产确认请求
NetMsgApi.msgName2MsgData.Msg_Table_BankruptConfirmReq = {"Room.BankruptConfirmReq", "BankruptConfirmReq", "", "", "table.room_pb", ""}
--破产通知
NetMsgApi.msgName2MsgData.Msg_Table_BankruptNotify = {"", "", "Room.BankruptNotify", "BankruptNotify", "", "table.room_pb"}
--计牌器通知
NetMsgApi.msgName2MsgData.Msg_Table_CardRecorderMsg = {"", "", "Game.CardRecorderMsg", "CardRecorderMsg", "", "mytable.game_pb"}
--记牌状态请求
NetMsgApi.msgName2MsgData.Msg_Table_CardRecorderStatuReq = {"Game.CardRecorderStatuReq", "CardRecorderStatuReq", "", "", "mytable.game_pb", ""}
--记牌状态回应
NetMsgApi.msgName2MsgData.Msg_Table_CardRecorderStatuRsp = {"", "", "Game.CardRecorderStatuRsp", "CardRecorderStatuRsp", "", "mytable.game_pb"}
--//玩家比赛名次通知消息
NetMsgApi.msgName2MsgData.Msg_Table_PlayerMatchRanksNotify = {"", "", "Game.PlayerMatchRanksNotify", "PlayerMatchRanksNotify", "", "mytable.game_pb"}
--实时排行榜申请
NetMsgApi.msgName2MsgData.Msg_Table_MatchRankReq = {"Game.MatchRankReq", "MatchRankReq", "", "", "mytable.game_pb", ""}
--实时排行榜响应
NetMsgApi.msgName2MsgData.Msg_Table_MatchRankRsp = {"", "", "Game.MatchRankRsp", "MatchRankRsp", "", "mytable.game_pb"}


return NetMsgApi