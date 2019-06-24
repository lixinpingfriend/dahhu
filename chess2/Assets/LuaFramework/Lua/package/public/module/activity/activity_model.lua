
local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local json = require("cjson")
local DialogManager = require("manager.auto_dialog_manager");
local ModuleCache = ModuleCache

local ActivityModel = class("activityModel", Model)

function ActivityModel:initialize(...)
    Model.initialize(self, ...)

    -- 下载的广告图片列表
    self.spriteADList = { };
    -- 显示区域类型(大厅或牌桌)
    self.showRegionType = { };
    self.buttonActivity = { };
    self.spriteRedPoint = { };
end

-- 获取活动左侧列表协议
function ActivityModel:getActivityViewList(showType, showRegionType)

    self.showRegionType = showRegionType;
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        --showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityViewList?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            -- 没有数据
            if #retData.data == 0 then

                if showType == "Manual" then
                    local message = "活动暂未开放";
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);
                    return;
                elseif showType == "Auto" then
                    -- 打开优先级高的弹框
                    DialogManager.openPriorityDialog();
                    return;
                end
            end

            local activityADList = { };
            local index = 0;
            for key, activity in ipairs(retData.data) do

                if activity.imgUrl ~= nil and activity.imgUrl ~= "" then
                    index = index + 1;
                    activityADList[index] = activity;
                end
            end

            -- 活动列表没有广告图片链接,直接打开活动界面
            if #activityADList == 0 then
                if showType == "Manual" then

                    Model.dispatch_event(self, "Event_Activity_getActivityViewList", retData.data);
                elseif showType == "Auto" then
                    -- 活动列表中是否有红点
                    local isRedPoint = self:isRedPointByViewList(retData.data);
                    if isRedPoint then
                        Model.dispatch_event(self, "Event_Activity_getActivityViewList", retData.data);
                    else
                        self:isEveryDayMustAppearUsingGET(retData.data)
                    end
                end
                return;
            end

            -- 每次请求协议清空广告sprite列表
            self.spriteADList = { };
            -- 下载次数
            local downCount = 0;
            for key, activity in ipairs(activityADList) do

                local onStartComplete = function(sprite)

                    downCount = downCount + 1;
                    self.spriteADList[activity.showId] = sprite;

                    if downCount == #activityADList then
                        -- 所有广告图片下载是否已完成
                        local isAllDownComplete = self:isDownLoadComplete();
                        if isAllDownComplete then

                            if showType == "Manual" then

                                Model.dispatch_event(self, "Event_Activity_getActivityViewList", retData.data);
                            elseif showType == "Auto" then
                                -- 活动列表中是否有红点
                                local isRedPoint = self:isRedPointByViewList(retData.data);
                                if isRedPoint then
                                    Model.dispatch_event(self, "Event_Activity_getActivityViewList", retData.data);
                                else
                                    -- 打开优先级高的弹框
                                    DialogManager.openPriorityDialog();

                                    self:isEveryDayMustAppearUsingGET(retData.data)

                                end
                            end
                        end
                    end
                end
                self:image_load_sprite(nil, activity.imgUrl, onStartComplete);
            end
        else

        end
    end

    local onError = function(data)
        if showType == "Auto" then
            -- 打开优先级高的弹框
            DialogManager.openPriorityDialog();
        end

        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 显示活动按钮和红点(牌桌内使用)
function ActivityModel:showActivityIconAndRedPoint(buttonActivity, spriteRedPoint)

    if not buttonActivity or not spriteRedPoint then
        print("需要传入按钮和红点");
        return;
    end

    --先隐藏活动按钮和红点
    buttonActivity.gameObject:SetActive(false);
    spriteRedPoint.gameObject:SetActive(false);
    self.buttonActivity = buttonActivity;
    self.spriteRedPoint = spriteRedPoint;
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        --showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityViewListInner?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            if not buttonActivity or not spriteRedPoint then
                return;
            end
            -- 没有数据
            if #retData.data == 0 then

                buttonActivity.gameObject:SetActive(false);
                spriteRedPoint.gameObject:SetActive(false);
                return;
            end

            -- 活动列表中是否有红点
            local isRedPoint = self:isRedPointByViewList(retData.data);
            buttonActivity.gameObject:SetActive(true);
            spriteRedPoint.gameObject:SetActive(isRedPoint);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 获取活动左侧列表协议(仅获取活动类型,牌桌内使用)
function ActivityModel:getActivityViewListByActivity(showType, showRegionType)

    self.showRegionType = showRegionType;
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityViewListInner?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            -- 没有数据
            if #retData.data == 0 then

                if showType == "Manual" then
                    local message = "活动暂未开放";
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);
                    return;
                elseif showType == "Auto" then
                    return;
                end
            end

            if showType == "Manual" then
                Model.dispatch_event(self, "Event_Activity_getActivityViewList", retData.data);
            elseif showType == "Auto" then
                -- 活动列表中是否有红点
                local isRedPoint = self:isRedPointByViewList(retData.data);
                if isRedPoint then
                    Model.dispatch_event(self, "Event_Activity_getActivityViewList", retData.data);
                end
            end
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end


function ActivityModel:isEveryDayMustAppearUsingGET(dataShow)

    -- 该逻辑 一天只执行一次 (服务器要求)
    local today = tostring(os.date("%Y-%m-%d",os.time()))
    local str = "isEveryDayMustAppearUsingGET" .. ModuleCache.AppData.get_app_and_game_name() .. self.modelData.roleData.userID

    if ModuleCache.PlayerPrefsManager.GetString(str) ~= today then
        ModuleCache.PlayerPrefsManager.SetString(str, today)
    else
        return
    end

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            gameId = ModuleCache.GameManager.curGameId,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/isEveryDayMustAppear?",
    }

    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            if retData.data == true then
                Model.dispatch_event(self, "Event_Activity_getActivityViewList", dataShow);
            end
        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 通过活动id获取活动右侧协议
function ActivityModel:getActivityByViewId(activity)

    local requestData = {
        params =
        {
            showId = activity.showId,
            uid = self.modelData.roleData.userID,
        },
        --showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityByViewIdUid?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            local activityObject =
            {
                leftActivity = activity;
                rightActivity = retData.data;

            };
            Model.dispatch_event(self, "Event_Activity_GetActivityByViewIdUid", activityObject);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 请求领取活动奖励协议
function ActivityModel:getAwards(spriteRed, activityLeft, activityID, recordID)
    local requestData = nil;
    if not recordID then
        requestData = {
            params =
            {
                uid = self.modelData.roleData.userID,
                activityId = activityID,
            },
            showModuleNetprompt = true,
            baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getAwards?",
        }
    else
        requestData = {
            params =
            {
                uid = self.modelData.roleData.userID,
                activityId = activityID,
                unionId = recordID,
            },
            showModuleNetprompt = true,
            baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getAwards?",
        }
    end

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            -- 请求刷新牌桌内的活动按钮和红点
            if self.showRegionType == "table" then
                -- 显示活动按钮和红点(牌桌内使用)
                self:showActivityIconAndRedPoint(self.buttonActivity, self.spriteRedPoint);
            end

            -- 更新货币
            for key, awards in ipairs(retData.data) do

                local awardType = tonumber(awards.amountType);
                -- 钻石
                if awardType == 2 then
                    if self.modelData.roleData.cards then
                        self.modelData.roleData.cards = self.modelData.roleData.cards + awards.amount;
                    end
                    -- 体力
                elseif awardType == 3 then
                    if self.modelData.roleData.coins then
                        self.modelData.roleData.coins = self.modelData.roleData.coins + awards.amount;
                    end
                    -- 金币
                elseif awardType == 9 then
                    if self.modelData.roleData.gold then
                        self.modelData.roleData.gold = self.modelData.roleData.gold + awards.amount;
                    end
                end
            end

            local data =
            {
                activityLeft = activityLeft,
                awards = retData.data,
                spriteRed = spriteRed,
            }
            Model.dispatch_event(self, "Event_Activity_GetAwards", data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

-- 请求检查红点协议
function ActivityModel:clickCheckRedPoint(spriteRed, activity)

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            showId = activity.showId,
            showType = activity.showType,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/clickCheckRedPoint?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            local data =
            {
                isRedPoint = retData.data,
                spriteRed = spriteRed,
            }

            Model.dispatch_event(self, "Event_Activity_ClickCheckRedPoint", data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 请求获取图片分享配置协议
function ActivityModel:getImageShareConfig()

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getImageShareConfig?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            Model.dispatch_event(self, "Event_Activity_GetImageShareConfig", retData.data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end


-- 所有广告图片下载是否已完成
function ActivityModel:isDownLoadComplete()

    local isAllDownComplete = true;
    for showIDTemp, spriteAD in pairs(self.spriteADList) do

        if spriteAD == nil then

            isAllDownComplete = false;
            return isAllDownComplete;
        end
    end

    return isAllDownComplete;
end

-- 根据showID获取对应的广告图片
function ActivityModel:getSpriteADByShowID(showID)

    local spriteAD = nil;
    for showIDTemp, spriteADTemp in pairs(self.spriteADList) do

        if tonumber(showID) == tonumber(showIDTemp) then

            spriteAD = spriteADTemp;
            return spriteAD;
        end
    end

    return spriteAD;
end

-- 活动列表中是否有红点
function ActivityModel:isRedPointByViewList(activityViewList)

    local isRedPoint = false;

    for key, activity in ipairs(activityViewList) do

        local redPoint = tonumber(activity.redPoint);
        -- 有红点
        if redPoint == 1 then

            redPoint = true;
            return redPoint;
        end
    end

    return isRedPoint;
end

return ActivityModel;