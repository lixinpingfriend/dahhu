
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local ActivityModule = class("activityModule", ModuleBase)
local DialogManager = require("manager.auto_dialog_manager");

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function ActivityModule:initialize(...)
    self.viewDynamicInit = true
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "activity_view", "activity_model", ...)

end

function ActivityModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonBack" then
        ModuleCache.ModuleManager.hide_module("public", "activity");
        if self.data.showType and  self.data.showType == "Auto" then
            -- 打开优先级高的弹框
            DialogManager.openPriorityDialog();
        end

        -- 邀请好友按钮
    elseif obj.name == "ButtonInviteFriend" then
        ModuleCache.ModuleManager.show_module("public", "share");
    end
end

function ActivityModule:on_show(data)
    if data == "Auto" then
        data = {
            showRegionType = "hall",
            showType="Auto",
        }
    end
    self.data = data

    if data.showRegionType and data.showType == "Auto" then
        self:get_view():hide();
    else
        if self.view then
            self:get_view():hide();
        end
    end
    


    -- 牌桌内活动按钮和红点
    if data.buttonActivity and data.spriteRedPoint then
        -- 显示活动按钮和红点(牌桌内使用)
        self.model:showActivityIconAndRedPoint(data.buttonActivity, data.spriteRedPoint);
    elseif data.showRegionType == "table" then
        -- 获取活动左侧列表协议(仅获取活动类型,牌桌内使用)
        self.model:getActivityViewListByActivity(data.showType, data.showRegionType);
    elseif data.showRegionType == "hall" then
        -- 获取活动左侧列表协议
        self.model:getActivityViewList(data.showType, data.showRegionType);
    end

    -- 请求获取图片分享配置协议
    -- self.model:getImageShareConfig();
end

function ActivityModule:on_hide(data)
    if self.view then
        self:get_view().currentShowID = nil;
    end
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function ActivityModule:on_model_event_bind()

    local onGetActivityViewList = function(eventHead, eventData)

        self:get_view():show();
        -- 初始化
        self:get_view():init(eventData, self);
    end
    -- 监听获取活动左侧列表事件
    self:subscibe_model_event("Event_Activity_getActivityViewList", onGetActivityViewList);

    local onGetImageShareConfig = function(eventHead, eventData)

        -- 更新微信视图
        self:get_view():updateWechatView(eventData.custosmerService);
    end
    -- 监听获取图片分享配置协议
    self:subscibe_model_event("Event_Activity_GetImageShareConfig", onGetImageShareConfig);

    local onGetActivityByViewId = function(eventHead, eventData)

        -- 初始化
        self:get_view():updateActivityRightView(eventData);
    end
    -- 监听获取活动右侧列表事件
    self:subscibe_model_event("Event_Activity_GetActivityByViewIdUid", onGetActivityByViewId);

    local onGetAwards = function(eventHead, eventData)

        -- 发送刷新玩家信息事件
        self:dispatch_package_event("Event_Package_Refresh_Userinfo")

        for key, awards in ipairs(eventData.awards) do

            local awardType = tonumber(awards.amountType);
            -- 金币
            if awardType == 9 then

                local message = string.format("获得%s金币", awards.amountShow);
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);

                -- 通过活动id获取活动右侧协议
                self.model:getActivityByViewId(eventData.activityLeft);
                -- 请求检查红点协议
                self.model:clickCheckRedPoint(eventData.spriteRed, eventData.activityLeft);
                -- 钻石
            elseif awardType == 2 then

                local message = string.format("获得%s钻石", awards.amountShow);
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);

                -- 通过活动id获取活动右侧协议
                self.model:getActivityByViewId(eventData.activityLeft);
                -- 请求检查红点协议
                self.model:clickCheckRedPoint(eventData.spriteRed, eventData.activityLeft);
                -- 体力
            elseif awardType == 3 then

                local message = string.format("获得%s体力", awards.amountShow);
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);

                -- 通过活动id获取活动右侧协议
                self.model:getActivityByViewId(eventData.activityLeft);
                -- 请求检查红点协议
                self.model:clickCheckRedPoint(eventData.spriteRed, eventData.activityLeft);
                -- 红包
            elseif awardType == 4 then

                -- 打开红包界面
                ModuleCache.ModuleManager.show_public_module("activity_redpacket", awards.amountShow);

                -- 通过活动id获取活动右侧协议
                self.model:getActivityByViewId(eventData.activityLeft);
                -- 请求检查红点协议
                self.model:clickCheckRedPoint(eventData.spriteRed, eventData.activityLeft);
                -- cdkey
            elseif awardType == 5 then

                -- 道具
            elseif awardType == 10 then

                local message = string.format("获得%s×%d", awards.itemName, awards.itemNum);
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);

                -- 通过活动id获取活动右侧协议
                self.model:getActivityByViewId(eventData.activityLeft);
                -- 请求检查红点协议
                self.model:clickCheckRedPoint(eventData.spriteRed, eventData.activityLeft);
            end
        end
    end
    -- 监听请求领取活动奖励协议
    self:subscibe_model_event("Event_Activity_GetAwards", onGetAwards);

    local onClickCheckRedPoint = function(eventHead, eventData)

        -- 根据后端返回的数据,判断是否显示红点
        eventData.spriteRed.gameObject:SetActive(eventData.isRedPoint);
    end
    -- 监听检查红点事件
    self:subscibe_model_event("Event_Activity_ClickCheckRedPoint", onClickCheckRedPoint);

end


return ActivityModule