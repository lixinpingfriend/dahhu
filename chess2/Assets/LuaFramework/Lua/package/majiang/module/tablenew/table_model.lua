





local class = require("lib.middleclass")
local ModelBase = require('package.majiang.module.tablebase.tablebase_model')
---@class TableMJModel
local TableModel = class('tableModel', ModelBase)


function TableModel:initialize(...)
    ModelBase.initialize(self, ...)

    ModelBase.subscibe_msg_event(self, {    --托管
        msgName = "Msg_Table_Intrust",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = ModelBase.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                ModelBase.dispatch_event(self, "Event_Msg_Table_Intrust", retData)
            end
        end
    })

    ModelBase.subscibe_msg_event(self, {     --充值金币
        msgName = "Msg_AddGold",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = ModelBase.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                ModelBase.dispatch_event(self, "Event_Msg_AddGold", retData)
            end
        end
    })

    ModelBase.subscibe_msg_event(self, {     --充值金币完成
        msgName = "Msg_AddGoldDone",
        callback = function(msgName, msgBuffer)
            if msgBuffer.msgRetCode == 0 then
                local retData, error = ModelBase.unpack_msg(self, msgName, msgBuffer.dataBuffer)
                ModelBase.dispatch_event(self, "Event_Msg_AddGoldDone", retData)
            end
        end
    })
end

function TableModel:request_restart_mj(data)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Restart")
    if(data) then
        print_table(data)
        request.Piao = data.xiaojiScore
        request.Pao = data.paoScore
        request.DiTuo = data.DiTuo or false
    end
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_diao_dui(pai)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_DiaoDui")
    request.Pai = pai
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_piao()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_PiaoHua")
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_select_piao(data)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Piao")
    request.PiaoNum = data.xiaojiScore
    request.Pao = data.paoScore
    request.DiTuo = data.DiTuo or false
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_select_xuan_piao(data)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_XuanPiao")
    request.PiaoNum = data.PiaoNum 
    request.type  = data.type 
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_que_mj(index)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Que")
    request.Que = index
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_buzhang_mj(pai)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_BuZhang")
    request.Pai = pai
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_yahu_mj()
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_YaHu")
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_huan_sanz(huanTable,action)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_HuanSanz")
    if(huanTable) then
        for i = 1, #huanTable do
            table.insert(request.Pai, huanTable[i])
        end
    end
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

function TableModel:request_qi_sanz(qiTable)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_HuanSanz")
    request.action = 2
    if(qiTable) then
        for i = 1, #qiTable do
            table.insert(request.Pai, qiTable[i])
        end
    end
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

---托管
function TableModel:request_Intrust(state)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Intrust")
    request.type = state
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

---亮牌 
function TableModel:request_liang(liangType)
    local msgId, request = self.netMsgApi:create_request_data("Msg_Table_Liang")
    if liangType then
        request.type = liangType
    end
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

--- 充值金币
function TableModel:request_add_gold()
    local msgId, request = self.netMsgApi:create_request_data("Msg_AddGold")
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

--- 充值金币完成
function TableModel:request_add_gold_done()
    local msgId, request = self.netMsgApi:create_request_data("Msg_AddGoldDone")
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

---跑圈
function TableModel:request_paoquan(pai)
    local msgId, request = self.netMsgApi:create_request_data("Msg_ACTION_PAO_QUAN")
    request.Pai = pai
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
end

return  TableModel