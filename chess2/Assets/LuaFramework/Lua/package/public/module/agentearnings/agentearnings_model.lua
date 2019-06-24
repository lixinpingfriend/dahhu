local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
local ModuleCache = ModuleCache
---@class AgentEarningsModel
local AgentEarningsModel = Class("AgentEarningsModel", Model)

function AgentEarningsModel:initialize(...)
    Model.initialize(self, ...)
     self.DataType = {
        OrderReward = 1,
        RoomReward  = 2,
        LatelyWith  = 3,
    }
    self.isNotNewDataByType = {}
    self.dataIndexByType    = {}
    self.dataListByType     = {}
    for _, v in pairs(self.DataType) do
        self.isNotNewDataByType[v]  = false
        self.dataIndexByType[v]     = 0
        self.dataListByType[v]      =  {}
    end
end

--获取今日基本的统计信息
function AgentEarningsModel:getTodayReward()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/reward/getTodayRewardStatistics?",
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            Model.dispatch_event(self,"Event_Agent_TodayReward", retData.data)
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end

--充值返佣记录
function AgentEarningsModel:getOrderRewardDetail()
    if self.isNotNewDataByType[self.DataType.OrderReward] then return end
    self.dataIndexByType[self.DataType.OrderReward] = self.dataIndexByType[self.DataType.OrderReward] + 1
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/reward/queryOrderRewardDetail?",
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = self.dataIndexByType[self.DataType.OrderReward],
            pageSize = 20,
        }
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            if retData.data.list ~= nil and #retData.data.list > 0 then
                self.dataListByType[self.DataType.OrderReward][#self.dataListByType[self.DataType.OrderReward] + 1] = retData.data.list
                Model.dispatch_event(self,"Event_Agent_OrderRewardDetail",{data = self.dataListByType[self.DataType.OrderReward], totlePage = retData.data.totalPage})
            else
                self.isNotNewDataByType[self.DataType.OrderReward] = true
            end
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end


--牌局返佣记录
function AgentEarningsModel:getRoomRewardDetail()
    if self.isNotNewDataByType[self.DataType.RoomReward] then return end
    self.dataIndexByType[self.DataType.RoomReward] = self.dataIndexByType[self.DataType.RoomReward] + 1
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/reward/queryRoomRewardDetail?",
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = self.dataIndexByType[self.DataType.RoomReward],
            pageSize = 20,
        }
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            if retData.data.list ~= nil and #retData.data.list > 0 then
                self.dataListByType[self.DataType.RoomReward][#self.dataListByType[self.DataType.RoomReward] + 1] = retData.data.list
                Model.dispatch_event(self,"Event_Agent_RoomRewardDetail", {data = self.dataListByType[self.DataType.RoomReward], totlePage = retData.data.totalPage})
            else
                self.isNotNewDataByType[self.DataType.RoomReward] = true
            end
        else

        end

    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end


--余额消耗记录
function AgentEarningsModel:getLatelyWithDrawals(reset)
    if reset then
        self.isNotNewDataByType[self.DataType.LatelyWith]  = false
        self.dataIndexByType[self.DataType.LatelyWith]     = 0
        self.dataListByType[self.DataType.LatelyWith]      =  {}
    end
    if self.isNotNewDataByType[self.DataType.LatelyWith] then return end
    self.dataIndexByType[self.DataType.LatelyWith] = self.dataIndexByType[self.DataType.LatelyWith] + 1
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/reward/getLatelyWithDrawals?",
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = self.dataIndexByType[self.DataType.LatelyWith],
            pageSize = 20,
        }
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            if retData.data.list ~= nil and #retData.data.list > 0 then
                self.dataListByType[self.DataType.LatelyWith][#self.dataListByType[self.DataType.LatelyWith] + 1] = retData.data.list
                Model.dispatch_event(self,"Event_Agent_LatelyWithDrawals", {data = self.dataListByType[self.DataType.LatelyWith], totlePage = retData.data.totalPage})
            else
                self.isNotNewDataByType[self.DataType.LatelyWith] = true
            end
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end


return AgentEarningsModel