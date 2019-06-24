local require = require

local NetMsgApi = {
    -- protol加载与缓存
    protolDataCache = {}
}

-- 此处必须与路径一致
local path = "package.huzi.model.net.protol."



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
NetMsgApi.msgName2MsgData = {
    Msg_Hall_Login = { "1", "CMD_Login", "1", "RSP_Login", "Login_pb" , "Login_pb"},
    --Msg_CreateRoom_Create = { "2", "CMD_CreateRoom", "2", "RSP_CreateRoom", "login_pb" , "login_pb"},
    --Msg_JoinRoom_Enter = { "3", "CMD_EnterRoom", "3", "RSP_EnterRoom", "login_pb" , "login_pb"},
    --Msg_Hall_Get_Login_GameData = { "1003", "gameipportreq", "1003", "gameipportres", "role_pb" , "role_pb"},   
}

NetMsgApi.msgName2MsgData.Msg_Table_Login_Skynet_GameServer = {"Login.LoginReq", "LoginReq", "Login.LoginRsp", "LoginRsp", "skynet_table.login_pb", "skynet_table.login_pb"}

NetMsgApi.msgName2MsgData.Msg_Table_CustomInfoChangeReq = {"Room.CustomInfoChangeReq", "CustomInfoChangeReq", "", "", "room_pb", ""}

--河南麻将的
--NetMsgApi.msgName2MsgData.Msg_Login = {"1", "CMD_Login", "1", "RSP_Login", "pbc.Login_pb", "pbc.Login_pb"}
NetMsgApi.msgName2MsgData.Msg_CreateRoom = {"2", "CMD_CreateRoom", "2", "RSP_CreateRoom", "Login_pb", "Login_pb"}
NetMsgApi.msgName2MsgData.Msg_EnterRoom = {"3", "CMD_EnterRoom", "3", "RSP_EnterRoom", "Login_pb", "Login_pb"}
NetMsgApi.msgName2MsgData.Msg_EnterHall = {"4", "CMD_EnterHall", "4", "RSP_EnterHall", "Login_pb", "Login_pb"}

--游戏服
NetMsgApi.msgName2MsgData.Msg_Heart_Beat = {"1", "CMD_HeartBeat", "1", "RSP_HeartBeat", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_Login_Server = {"2", "CMD_LoginServer", "2", "RSP_LoginServer", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_Exit_Room = {"3", "CMD_ExitRoom", "3", "RSP_ExitRoom", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_Message = {"4", "CMD_Message", "", "", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_QueryData = {"5", "CMD_QueryData", "5", "RSP_QueryData", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_Dismiss = {"6", "CMD_Dismiss", "", "", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_KickUser = {"7", "CMD_KickUser", "", "", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_PrivateMessage = {"8", "CMD_Private_Message", "", "", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_ReportState = {"9", "CMD_ReportState", "", "", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_GetKickedTimeOut = {"10", "CMD_GET_KICKED_TIMEOUT", "", "", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_StartNow = {"11", "CMD_StartNow", "", "", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_UpdateTempInfo = {"12", "CMD_UpdateTempInfo", "", "", "GameFrame_pb", "GameFrame_pb"}


NetMsgApi.msgName2MsgData.Msg_Table_Leave_Room = {"Room.LeaveReq", "LeaveReq", "Room.LeaveRsp", "LeaveRsp", "room_pb", "room_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Leave_Room_Notify = {"", "", "Room.LeaveBroadcast", "LeaveBroadcast", "", "room_pb"}


NetMsgApi.msgName2MsgData.Msg_RoomUserInfoNTF = {"", "", "101", "NTF_RoomUserInfo", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_SameUserLoginNTF = {"", "", "102", "NTF_SameUserLogin", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_RoomUserOnlineNTF = {"", "", "103", "NTF_RoomUserOnline", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_RoomUserOfflineNTF = {"", "", "104", "NTF_RoomUserOffline", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_RoomDismissedNTF = {"", "", "105", "NTF_RoomDismissed", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_MessageNTF = {"", "", "106", "NTF_Message", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_DismissNTF = {"", "", "107", "NTF_Dismiss", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_KickedNTF = {"", "", "108", "NTF_Kicked", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Private_MessageNTF = {"", "", "109", "NTF_Private_Message", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_ReportStateNTF = {"", "", "110", "NTF_ReportState", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_ReturnKickedTimeOutNTF = {"", "", "111", "NTF_RETURN_KICKED_TIMEOUT", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_RoomAwardMessageNTF = {"", "", "112", "NTF_RoomAwardMessage", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_StartNowNTF = {"", "", "113", "NTF_StartNow", "GameFrame_pb", "GameFrame_pb"}
NetMsgApi.msgName2MsgData.Msg_UpdateTempInfoNTF = {"", "", "114", "NTF_UpdateTempInfo", "GameFrame_pb", "GameFrame_pb"}

NetMsgApi.msgName2MsgData.Msg_User_Offline = {"", "", "1003", "USER_OFFLINE_STATE", "Game_pb", "Game_pb"}


NetMsgApi.msgName2MsgData.Msg_Table_ChuPai = {"1001", "ACTION_CHUPAI", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Chi = {"1002", "ACTION_CHI", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Peng = {"1003", "ACTION_PENG", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Pao = {"1004", "ACTION_PAO", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Hu = {"1005", "ACTION_HU", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Guo = {"1006", "ACTION_GUO", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Restart = {"1007", "ACTION_RESTART", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_PaiLieShouPai = {"1008", "PHZ_SORT", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_ACTION_SORT = {"1009", "ACTION_SORT", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Ting = {"1010", "ACTION_TING", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_ACTION_PIAO = {"1020", "ACTION_PIAO", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_Intrust = {"1100", "ACTION_INTRUST", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.ACTION_REFRESH_COINS = {"1029", "ACTION_REFRESH_COINS", "", "", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_GameStateNTF = {"", "", "1001", "GAME_STATE", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_Table_UserStateNTF = {"", "", "1002", "USER_STATE", "Game_pb", "Game_pb"}
NetMsgApi.msgName2MsgData.Msg_VideoCode = {"", "", "videoCode", "RecordConfig", "Game_pb", "Game_pb"}



return NetMsgApi


