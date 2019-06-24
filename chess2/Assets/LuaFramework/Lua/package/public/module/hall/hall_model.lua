
local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local json = require("cjson")


local ModuleCache = ModuleCache

--- @class HallModel : Model
local HallModel = class("hallModel", Model)
local Util = Util

function HallModel:initialize(...)
    Model.initialize(self, ...)
end


function HallModel:get_userinfo(callFromError)
    --if callFromError then
    --    self.callFromErrorCount = (self.callFromErrorCount or 1) + 1
    --    if self.callFromErrorCount > 2 then
    --        return
    --    end
    --end

    self:get_currency_data(self.modelData.roleData.userID, function (userdata)
        self:SetRoleData(userdata)
        Model.dispatch_event(self, "Event_Hall_GetUserInfo", userdata)
    end)

    --self:get_is_agent()
    self:getAgentStatus()
    --local requestData = {
    --    baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
    --    params =
    --    {
    --        uid = self.modelData.roleData.userID,
    --    },
    --    cacheDataKey = "user/info?uid=" .. self.modelData.roleData.userID .. "&gameName=" .. (ModuleCache.AppData.get_url_game_name()),
    --    cacheDataImmediatelyCallbackAndSuccessCallback = true,
    --}
    --
    --self:http_get(requestData, function(wwwOperation)
    --    local www = wwwOperation.www;
    --    local retData = ModuleCache.Json.decode(www.text)
    --    if retData.ret and retData.ret == 0 then
    --        self:SetRoleData(retData.data)
    --        ModuleCache.PlayerPrefsManager.SetString("user/info?uid=" .. tostring(self.modelData.roleData.userID), www.text)
    --    end
    --
    --    Model.dispatch_event(self, "Event_Hall_GetUserInfo", retData)
    --end , function(error)
    --    self:get_userinfo(true)
    --    print(error.error)
    --end , function(cacheDataText)
    --    if self.isDestroy then
    --        return
    --    end
    --    local retData = ModuleCache.Json.decode(cacheDataText)
    --    if retData.ret and retData.ret == 0 then
    --        self:SetRoleData(retData.data)
    --    end
    --    Model.dispatch_event(self, "Event_Hall_GetUserInfo", retData)
    --end )
end

function HallModel:get_adcontentinfo(needGetUserInfo)

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getAppGlobalConfig?",
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        cacheDataKey = "httpcache:public/getAppGlobalConfig?uid=" ..(self.modelData.roleData.userID or "0")
    }

    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)

        if (retData.ret and retData.ret == 0) then
            self:setAppGlobalConfig(retData.data)
            Model.dispatch_event(self, "Event_Hall_GetAppGlobalConfig", { data = retData })
        else
            Model.dispatch_event(self, "Event_Hall_GetAppGlobalConfig", { err = "retData.ret ~= 0" })
        end
        if needGetUserInfo then
            self:get_userinfo()
        end

    end , function(error)
        print(error)

    end , function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if (retData.ret and retData.ret == 0) then
            self:setAppGlobalConfig(retData.data)
            Model.dispatch_event(self, "Event_Hall_GetAppGlobalConfig", { data = retData })
        else
            Model.dispatch_event(self, "Event_Hall_GetAppGlobalConfig", { err = "retData.ret ~= 0" })
        end
    end )
end

function HallModel:get_notice_list(callback)
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        notRequiredToken = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "notice/list?",
        cacheDataKey = "httpcache:notice/list?uid=" ..(self.modelData.roleData.userID or "0")
    }
    self:http_get(requestData, function(wwwData)
        -- print(wwwData.www.text)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        callback(retData)
    end , function(errorData)
        print(errorData.error)
    end , function(cacheDataText)
        if self.isDestroy then
            -- 要注意缓存回调时有可能view已经销毁了
            return
        end

        local retData = ModuleCache.Json.decode(cacheDataText)
        callback(retData)
    end )
end

function HallModel:SetRoleData(data)
    if not data.userId then
        return
    end
    --郁闷不能直接替换的
    --self.modelData.roleData = data
    --self.modelData.roleData.userID = tostring(data.userId)
    self.modelData.roleData.cards = data.cards
    self.modelData.roleData.coins = data.coins
    self.modelData.roleData.male = data.gender == 1
    self.modelData.roleData.gender = data.gender
    self.modelData.roleData.hasBind = data.hasBind
    self.modelData.roleData.headImg = data.headImg
    self.modelData.roleData.lostCount = data.lostCount
    self.modelData.roleData.nickname = data.nickname
    self.modelData.roleData.score = data.score
    self.modelData.roleData.tieCount = data.tieCount
    self.modelData.roleData.winCount = data.winCount
    self.modelData.roleData.userId = data.userId
    self.modelData.roleData.breakRate = data.breakRate
    self.modelData.roleData.unionId = data.unionId
    self.modelData.roleData.ip = data.ip
    self.modelData.roleData.gold = data.gold
    self.modelData.roleData.mobile = data.mobile
    self.modelData.roleData.isRedName = data.isRedName
    self.modelData.roleData.uiContractionsNickname = data.uiContractionsNickname
    self.modelData.roleData.uiUserId = data.uiUserId
    self.modelData.roleData.headSprite = data.headSprite
    self.modelData.roleData.redPacket = data.redPacket
    self.modelData.roleData.parlorStyleType = data.parlorStyleType  --牌友圈样式 1:默认2d  2: 3d

    ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_PLAYGAMECOUNT .. ModuleCache.AppData.App_Name, data.winCount + data.lostCount + data.tieCount)
end

function HallModel:setAppGlobalConfig(data)
    self.modelData.AppGlobalConfig.rank_url = data.key_parlor_rank_url
    self.modelData.AppGlobalConfig.card_conis = tonumber(data.cards_conis)
    self.modelData.AppGlobalConfig.sys_ads = { }
    self.modelData.AppGlobalConfig.key_wx_num = data.key_wx_num
    self.modelData.AppGlobalConfig.parlor_push_settle_enable = data.parlor_push_settle_enable
    --self.modelData.AppGlobalConfig.twoPersonEqThree = data.twoPersonEqThree
    local sys_ads = data.sys_ads
    local len = #sys_ads
    for i = 1, len do
        local adData = sys_ads[i]
        table.insert(self.modelData.AppGlobalConfig.sys_ads, adData)
    end

end

-- 请求获取活动奖励协议
function HallModel:getActivityList()

    local requestData = {
        params =
        {
            gameId = ModuleCache.GameManager.curGameId,
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityList?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.data and #retData.data > 0 then
            -- OK
            self.modelData.hallData.activityList = retData.data;
            Model.dispatch_event(self, "Event_Hall_GetActivityList", nil);
        else
            self.modelData.hallData.activityList = nil;
            Model.dispatch_event(self, "Event_Hall_GetActivityList", nil);
        end
    end

    local onError = function(data)
        print(data.error);
        self.modelData.hallData.activityList = nil;
        Model.dispatch_event(self, "Event_Hall_GetActivityList", nil);
    end

    self:http_get(requestData, onResponse, onError);
end


-- 请求大厅红点协议
function HallModel:getMainRedPoint()

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getMainHighlight?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            Model.dispatch_event(self, "Event_Hall_GetMainRedPoint", retData.data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 是否为代理
function HallModel:get_is_agent()
    local requestData = {
        url = "user/isAgent?",
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if retData.success then
            self.modelData.roleData.agentUrl = retData.data
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

--代理状态查询
function HallModel:getAgentStatus()
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = "agents/info/getBindStatus?",
    }
    local onResponse = function(wwwOperation)
        --log_debug("receive getBindStatus response")
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            self.modelData.roleData.isAgent = retData.data.hasAgents
            if retData.data.hasAgents then
                self.modelData.roleData.isAgentForbid = retData.data.userStatus == 0
                if retData.data.agentsVo then
                    self.modelData.roleData.isSpecialAgent = retData.data.agentsVo.type == 1
                    self.modelData.roleData.inviteCode = retData.data.agentsVo.inviteCode
                end
            end
            Model.dispatch_event(self, "Event_Hall_GetIsAgent", retData.data.hasAgents)
        else

        end
    end
    local onError = function(data)
        print(data.error);
    end
    self:http(requestData, onResponse, onError);
end

--亲友圈对局活动
function HallModel:getParlorAgentTableActivity(callback)
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getCurrentParlorAgentTableActivity?",
    }
    local onResponse = function(wwwOperation)
        --log_debug("receive getBindStatus response")
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if callback then
            callback(retData)
        end
    end
    local onError = function(data)
        print(data.error);
    end
    self:http_get(requestData, onResponse, onError);
end


function HallModel:get_config(...)

end


return HallModel