local require = require
local class = require("lib.middleclass")
local NetMsgApi = class('BaseNetMsgApi')

local customPath = "package.public.model.net.protol."

function NetMsgApi:get_msg_data(msgName)
    local msgData = self.msgName2MsgData[msgName]
    return msgData
end


function NetMsgApi:get_protol(msgName, request)
    local msgData = self.msgName2MsgData[msgName]
    local pbName = request and msgData[5] or msgData[6]
    local path = msgData[7] or self.path
    local protolData = self.protolDataCache[pbName]
    if not protolData then
        protolData = require(path .. pbName)
        self.protolDataCache[pbName] = protolData
    end

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
    if data == nil then
        print(msgName .. "=========================的callBack 没有找到!!!")
        return nil
    end
    return data()
end

function NetMsgApi:initialize(...)
    -- 此处必须与路径一致
    self.path = "package.public.model.net.protol."
    self.protolDataCache = {}
    -- 命令名  --请求的命令ID 请求的proto结构体 收包的命令ID 收包的proto结构体 发包和收包proto结构体所在的proto文件名
    self.msgName2MsgData = {}

    self.msgName2MsgData.Msg_Table_Login = {"Login.LoginReq", "LoginReq", "Login.LoginRsp", "LoginRsp", "skynet_table.login_pb", "skynet_table.login_pb", customPath}
    self.msgName2MsgData.Msg_Table_Ping = {"Login.PingReq", "PingReq", "Login.PingRsp", "PingRsp", "skynet_table.login_pb", "skynet_table.login_pb", customPath}
    self.msgName2MsgData.Msg_Table_Enter_Room = {"Room.EnterReq", "EnterReq", "Room.EnterRsp", "EnterRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Ready = {"Room.ReadyReq", "ReadyReq", "Room.ReadyRsp", "ReadyRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Start = {"Room.StartReq", "StartReq", "Room.StartRsp", "StartRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Leave_Room = {"Room.LeaveReq", "LeaveReq", "Room.LeaveRsp", "LeaveRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Leave_Room_Notify = {"", "", "Room.LeaveBroadcast", "LeaveBroadcast", "", "skynet_table.room_pb", customPath}

    self.msgName2MsgData.Msg_Table_Chat = {"Room.ChatMsgReq", "ChatMsgReq", "Room.ChatMsgRsp", "ChatMsgRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Chat_Notify = {"", "", "Room.ChatMsgBroadcast", "ChatMsgBroadcast", "", "skynet_table.room_pb", customPath}

    self.msgName2MsgData.Msg_Table_Dissolve_Room = {"Room.FreeReq", "FreeReq", "Room.FreeRsp", "FreeRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}    --请求解散房间
    self.msgName2MsgData.Msg_Table_Dissolve_RoomRequest_Notify = {"", "", "Room.FreeBroadcast", "FreeBroadcast", "", "skynet_table.room_pb", customPath}    --请求解散房间通知
    self.msgName2MsgData.Msg_Table_Dissolve_Room_Notify = {"", "", "Room.FreeSuccessBroadcast", "FreeSuccessBroadcast", "", "skynet_table.room_pb", customPath}    --解散房间通知

    self.msgName2MsgData.Msg_Table_EnterRoom_Notify = {"", "", "Room.EnterBroadcast", "EnterBroadcast", "", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Reconnect_Notify = {"", "", "Room.ReconnBroadcast", "ReconnBroadcast", "", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Disconnect_Notify = {"", "", "Room.DisconnBroadcast", "DisconnBroadcast", "", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Ready_Notify = {"", "", "Room.ReadyBroadcast", "ReadyBroadcast", "", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Start_Notify = {"", "", "Room.StartBroadcast", "StartBroadcast", "", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Reset_Notify = {"", "", "Room.ResetBroadcast", "ResetBroadcast", "", "skynet_table.room_pb", customPath}

    self.msgName2MsgData.Msg_Table_CustomInfoChangeReq = {"Room.CustomInfoChangeReq", "CustomInfoChangeReq", "", "", "skynet_table.room_pb", "", customPath}
    self.msgName2MsgData.Msg_Table_CustomInfoChangeRsp = {"", "", "Room.CustomInfoChangeRsp", "CustomInfoChangeRsp", "", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_CustomInfoChangeBroadcast = {"", "", "Room.CustomInfoChangeBroadcast", "CustomInfoChangeBroadcast", "", "skynet_table.room_pb", customPath}

    self.msgName2MsgData.Msg_Table_KickPlayer = {"Room.KickPlayerReq", "KickPlayerReq", "Room.KickPlayerRsp", "KickPlayerRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_KickPlayer_Notify = {"", "", "Room.KickPlayerBroadcast", "KickPlayerBroadcast", "", "skynet_table.room_pb", customPath}

    --金币场金币变化通知
    self.msgName2MsgData.Msg_Table_ShotSettle_Notify = {"", "", "Room.OneShotSettleNotify", "OneShotSettleNotify", "", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_RefreshCoinBalance = {"Room.UserCoinBalanceReq", "UserCoinBalanceReq", "", "", "skynet_table.room_pb", "", customPath}
    --托管
    self.msgName2MsgData.Msg_Table_Intrust = {"Room.IntrustReq", "IntrustReq", "Room.IntrustRsp", "IntrustRsp", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_IntrustNotify = {"", "", "Room.IntrustNotify", "IntrustNotify", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    --充值
    self.msgName2MsgData.Msg_Table_Recharge = {"Room.RechargeReq", "RechargeReq", "", "", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
    self.msgName2MsgData.Msg_Table_Recharge_Notify = {"", "", "Room.RechargeNotify", "RechargeNotify", "skynet_table.room_pb", "skynet_table.room_pb", customPath}

    --红包雨
    self.msgName2MsgData.Msg_Table_RoomAwardMessage = {"", "", "Room.RoomAwardMessage", "RoomAwardMessage", "skynet_table.room_pb", "skynet_table.room_pb", customPath}
end
return NetMsgApi