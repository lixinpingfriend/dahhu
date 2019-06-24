local require = require

local NetMsgApi = {
    -- protol加载与缓存
    protolDataCache = {}
}

-- 此处必须与路径一致
local path = "package.public.model.net.protol."

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


NetMsgApi.msgName2MsgData.Msg_Ping = {"5", "CMD_Ping", "5", "RSP_Ping", "Login_pb", "Login_pb", path}
--比赛服 报名
NetMsgApi.msgName2MsgData.Msg_Matching_SignUp = {"9", "CMD_MatchSignUp", "9", "RSP_MatchSignUp", "Login_pb", "Login_pb", path}
--比赛服 退赛
NetMsgApi.msgName2MsgData.Msg_Matching_Withdraw = {"10", "CMD_MatchWithdraw", "10", "RSP_MatchWithdraw", "Login_pb", "Login_pb", path}
--比赛服 动态
NetMsgApi.msgName2MsgData.Msg_Matching_Notify_MatchDynamic = {"", "", "11", "Notify_MatchEvent", "Login_pb", "Login_pb", path}
--比赛服 匹配成功
NetMsgApi.msgName2MsgData.Msg_Matching_Notify_RoomInfo = {"", "", "12", "Notify_MatchRoomInfo", "Login_pb", "Login_pb", path}
--比赛服 进入比赛场
NetMsgApi.msgName2MsgData.Msg_Matching_Enter = {"13", "CMD_MatchEnter", "13", "RSP_MatchEnter", "Login_pb", "Login_pb", path}
--账号被挤
NetMsgApi.msgName2MsgData.Msg_Extrusion = {"", "", "14", "Notify_Extrusion", "Login_pb", "Login_pb", path}
--退出比赛场
NetMsgApi.msgName2MsgData.Msg_Matching_Exit = {"15", "CMD_MatchQuit", "15", "", "Login_pb", "Login_pb", path}
--金币场匹配服 开始匹配
NetMsgApi.msgName2MsgData.Msg_GoldMatching_Enter = {"6", "CMD_GoldEnter", "6", "RSP_GoldEnter", "Login_pb", "Login_pb", path}
--金币场匹配服 退赛
NetMsgApi.msgName2MsgData.Msg_GoldMatching_Quit = {"7", "CMD_GoldQuit", "7", "RSP_GoldQuit", "Login_pb", "Login_pb", path}
--金币场匹配服 匹配成功
NetMsgApi.msgName2MsgData.Msg_GoldMatching_Notify_RoomInfo = {"", "", "8", "Notify_GoldRoomInfo", "Login_pb", "Login_pb", path}


NetMsgApi.msgName2MsgData.Msg_Table_Login_Skynet_GameServer = {"Login.LoginReq", "LoginReq", "Login.LoginRsp", "LoginRsp", "skynet_table.login_pb", "skynet_table.login_pb"}

--河南麻将的
--NetMsgApi.msgName2MsgData.Msg_Login = {"1", "CMD_Login", "1", "RSP_Login", "pbc.Login_pb", "pbc.Login_pb"}
NetMsgApi.msgName2MsgData.Msg_CreateRoom = {"2", "CMD_CreateRoom", "2", "RSP_CreateRoom", "Login_pb", "Login_pb"}
NetMsgApi.msgName2MsgData.Msg_EnterRoom = {"3", "CMD_EnterRoom", "3", "RSP_EnterRoom", "Login_pb", "Login_pb"}
NetMsgApi.msgName2MsgData.Msg_EnterHall = {"4", "CMD_EnterHall", "4", "RSP_EnterHall", "Login_pb", "Login_pb"}
NetMsgApi.msgName2MsgData.Msg_Login_Server = {"2", "CMD_LoginServer", "2", "RSP_LoginServer", "GameFrame_pb", "GameFrame_pb"}


return NetMsgApi


