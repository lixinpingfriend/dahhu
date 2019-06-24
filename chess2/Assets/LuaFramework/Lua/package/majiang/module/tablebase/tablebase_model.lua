local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local Model = require('core.mvvm.model_base')
---@class TableBaseModel
local TableBaseModel = class('tablelBaseModel', Model)
local NetClientManager = ModuleCache.net.NetClientManager
local Time = Time


function TableBaseModel:initialize(...)
    Model.initialize(self, ...)
    self.sendMsgNetClientName = "gameServer"
    self.SeqNo = 0

    self.heartbeatRequestName = "1"
    -- self.heartbeatResponseName = "Login.PingRsp"
    self.heartbeatResponseName = "Msg_Heart_Beat"

    Model.subscibe_msg_event(self, {    --游戏状态推送
        msgName = "Msg_Heart_Beat",
        callback = function(msgName, msgBuffer)
            if(self.lastPingReqeustTime)then
                self.pingDelayTime = UnityEngine.Time.realtimeSinceStartup - self.lastPingReqeustTime
                self.lastPingReqeustTime = nil
                if(self.pingDelayTime == 0)then
                    self.pingDelayTime = 0.06
                end
            end
            -- self.lastReceiveHeartPackTime = Time.realtimeSinceStartup
            -- local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)    
            -- self.pingDelayTime = Time.realtimeSinceStartup - self.lastPingReqeustTime
            -- print('延迟:'..self.pingDelayTime * 1000)
            -- Model.dispatch_event(self, "Event_Msg_Heart_Beat", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --游戏状态推送
        msgName = "Msg_Table_GameStateNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            Model.dispatch_event(self, "Event_Msg_Table_GameStateNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --游戏重新开始
        msgName = "Msg_Table_Restart",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)     
            Model.dispatch_event(self, "Event_Msg_Table_Restart", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --用户信息推送
        msgName = "Msg_RoomUserInfoNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_RoomUserInfoNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --用户状态推送
        msgName = "Msg_Table_UserStateNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)      
            Model.dispatch_event(self, "Event_Msg_Table_UserStateNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --用户状态推送
        msgName = "Msg_Table_UserOfflineStateNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            Model.dispatch_event(self, "Event_Msg_Table_UserOfflineStateNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --房间内玩家上线
        msgName = "Msg_RoomUserOnlineNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_RoomUserOnlineNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --房间内玩家离线
        msgName = "Msg_RoomUserOfflineNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_RoomUserOfflineNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --房间解散状态回应
        msgName = "Msg_DismissNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_DismissNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --房间内玩家被踢出
        msgName = "Msg_KickedNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_KickedNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --相同用户已在另一地点登录，当前用户已被迫下线
        msgName = "Msg_SameUserLoginNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_SameUserLoginNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --房间已解散
        msgName = "Msg_RoomDismissedNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_RoomDismissedNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --玩家即时反馈的状态
        msgName = "Msg_ReportStateNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_ReportStateNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --单独聊天信息
        msgName = "Private_MessageNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Private_MessageNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --聊天信息
        msgName = "Msg_MessageNTF",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)    
            Model.dispatch_event(self, "Event_Msg_MessageNTF", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --退出房间
        msgName = "Msg_Exit_Room",
        callback = function(msgName, msgBuffer)
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
            Model.dispatch_event(self, "Event_Msg_Exit_Room", retData)
        end
    })

    Model.subscibe_msg_event(self, {     --还剩多少秒踢人
        msgName = "Msg_ReturnKickedTimeOutNTF",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
                Model.dispatch_event(self, "Event_Msg_ReturnKickedTimeOutNTF", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {     --房间奖励信息
        msgName = "Msg_RoomAwardMessageNTF",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Event_Msg_RoomAwardMessageNTF", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {     --提前开局广播
        msgName = "Msg_StartNowNTF",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                Model.dispatch_event(self, "Event_Msg_StartNowNTF", retData)
            end
        end
    })

    Model.subscibe_msg_event(self, {     --服务器广播临时缓存
    msgName = "Msg_UpdateTempInfoNTF",
    callback = function(msgName, msgBuffer)
        if msgBuffer.msgRetCode == 0 then
            local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)
            Model.dispatch_event(self, "Event_Msg_UpdateTempInfoNTF", retData)
        end
    end
})
end

function TableBaseModel:request_heartbeat()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Heart_Beat")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
    if(not self.lastPingReqeustTime)then
        self.lastPingReqeustTime = Time.realtimeSinceStartup
    end
end

function TableBaseModel:request_exit_room()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Exit_Room")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_chu_mj(pai, ting, coverdTable)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_ChuPai")
    request.Pai = pai
    request.Ting = ting or false
    if(coverdTable) then
        for i = 1, #coverdTable do
            table.insert(request.BuLiang, coverdTable[i])
        end
    end
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_kai_ju_ting_mj()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_TING")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_chi_mj(pai, chifa)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Chi")
    request.Pai = pai
    request.ChiFa = chifa
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_peng_mj(pai)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Peng")
    request.Pai = pai
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_gang_mj(pai)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Gang")
    request.Pai = pai
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_hu_mj(huType)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Hu")
    if(huType) then
        request.HuPaiLeiXing = huType
    end
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_guo_mj()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Guo")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_restart_mj(data)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Restart")
    request.Piao = data.Piao
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_maima_mj(pai)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_MaiMa")
    request.Pai = pai
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_kaigang_mj(pai)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_KaiGang")
    if(pai) then
        request.Pai = pai
    end
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_mopai_mj()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_MoPai")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_piaohua_mj()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_PiaoHua")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

-- 聊天信息（包括文字、表情、语音等）
function TableBaseModel:request_chat(msg)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Message")
    request.Message = ModuleCache.Json.encode(msg)
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

-- 1:申请解散 2:同意解散 3:拒绝解散
function TableBaseModel:request_dissolve_room(action)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Dismiss")
    request.Action = action
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

-- 踢出用户
function TableBaseModel:request_kick_player(playerId)
    local msgId, request = self.netMsgApi:create_request_data("Msg_KickUser")
    request.UserID = playerId
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

-- 上报状态 0 =正常 1=离开 
function TableBaseModel:request_report_player(state)
    local client = NetClientManager.get_client("gameServer")
    if(not client) then
        return
    end
    local msgId, request = self.netMsgApi:create_request_data("Msg_ReportState")
    request.State = state
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

-- 获取踢人倒计时
function TableBaseModel:request_get_kicked_timeout()
    local msgId, request = self.netMsgApi:create_request_data("Msg_GetKickedTimeOut")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

-- 补花
function TableBaseModel:request_buhua_mj()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_BuHua")
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableBaseModel:request_start_now(action,curPlayer)
    local msgId, request = self.netMsgApi:create_request_data("Msg_StartNow")
    request.Action = action  --- action 1:申请开始 2:同意开始 3:拒绝开始
    request.PlayerCount = curPlayer
    Model.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

return  TableBaseModel