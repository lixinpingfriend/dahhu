
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local FreeDiamondModule = class("freediamondModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function FreeDiamondModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "freediamond_view", nil, ...)

end

function FreeDiamondModule:on_show(data)

    local activityList = self.modelData.hallData.activityList;
    if activityList then
        -- 更新奖励视图
        self.view:updateRewardView(activityList, "share");
    end
end

function FreeDiamondModule:on_click(obj, arg)
    print(obj.name);
    self._shareAppDownloadLinkUrlToTimeline = false
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.buttonBack.gameObject then
        ModuleCache.ModuleManager.hide_module("public", "freediamond");
        -- 分享按钮
    elseif obj == self.view.buttonShare.gameObject then
        self._shareAppDownloadLinkUrlToTimeline = true

        -- 请求获取图片分享配置协议
        self:getImageShareConfig(true);
        ModuleCache.ModuleManager.hide_module("public", "freediamond");

    end
end

-- 请求获取活动奖励协议
function FreeDiamondModule:getActivityList()

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityList?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            -- OK

            self.modelData.hallData.activityList = retData.data;

            self:dispatch_module_event("hall", "Event_Hall_GetActivityList")
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 通过code获取活动数据
function FreeDiamondModule:getActivityByCode(code)

    local activity = nil;

    if self.modelData.hallData.activityList == nil then
        return;
    end

    for key, activityTemp in ipairs(self.modelData.hallData.activityList) do

        if activityTemp.code == code then

            activity = activityTemp;
            return activity;
        end
    end

    return activity;
end

-- 请求领取活动奖励协议
function FreeDiamondModule:getAwards(activityID, callback)

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            activityId = activityID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getAwards?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            local message = nil;
            -- OK
            for key, awards in ipairs(retData.data) do

                -- 金币
                if awards.amountType == 9 then
                    self.modelData.roleData.gold = self.modelData.roleData.gold + awards.amount;
                    message = string.format("获得<color=#FCC614FF>%d</color>金币", awards.amount);
                    -- 钻石
                elseif awards.amountType == 2 then

                    self.modelData.roleData.cards = self.modelData.roleData.cards + awards.amount;
                    message = string.format("获得<color=#FCC614FF>%d</color>钻石", awards.amount);
                    -- 体力
                elseif awards.amountType == 3 then
                    self.modelData.roleData.coins = self.modelData.roleData.coins + awards.amount;
                    message = string.format("获得<color=#FCC614FF>%d</color>体力", awards.amount);
                end
            end
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);

            -- 发送刷新玩家信息事件
            self:dispatch_module_event("hall", "Event_refresh_userinfo")

            if callback ~= nil then
                callback();
            end
            -- 请求获取活动奖励协议
            self:getActivityList();
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end

-- 通过code获取活动数据
function FreeDiamondModule:getActivityByCode(code)

    local activity = nil;

    if self.modelData.hallData.activityList == nil then
        return;
    end

    for key, activityTemp in ipairs(self.modelData.hallData.activityList) do

        if activityTemp.code == code then

            activity = activityTemp;
            return activity;
        end
    end

    return activity;
end

-- 请求获取图片分享配置协议
function FreeDiamondModule:getImageShareConfig(timeLine)
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            customData = ModuleCache.ShareManager().get_hall_share_custom_data()
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getImageShareConfig?",
    }



    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            local onDownLoadQR = function(spriteQR)

                if spriteQR ~= nil then

                    local onDownLoadShareBg = function(spriteShareBg)

                        -- 更新分享图片视图
                        self.view:updateShareImage(retData.data, spriteQR, spriteShareBg);
                        -- 调用微信图片分享功能
                        ModuleCache.ShareManager().shareImage(timeLine, true, false);
                        ModuleCache.WechatManager.onSendMessageToWXResp = function(data)
                            print(data, "onSendMessageToWXResp")
                            local retData = ModuleCache.Json.decode(data)
                            if (retData.errCode == 0 and self._shareAppDownloadLinkUrlToTimeline) then
                                local activity = self:getActivityByCode("share");
                                if activity ~= nil then

                                    -- 未领取奖励
                                    if activity.isReceive == 0 then

                                        local callback = function(args)

                                            local onGetAwards = function()

                                                self.modelData.shareData.isShare = false;
                                                self.modelData.hallData.activityList = nil;
                                            end
                                            -- 请求领取活动奖励协议
                                            self:getAwards(activity.activityId, onGetAwards);
                                        end
                                        -- local message = string.format("分享成功,获得<color=#FCC614FF>%d</color>钻石奖励!", activity.appAwards.amount);
                                        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_receive("分享成功，点击领取即可获得钻石奖励", callback)
                                    end
                                end
                            end
                            print_table(retData, "onSendMessageToWXResp")
                        end
                    end
                    -- 下载背景图片
                    self:image_load_sprite(nil, retData.data.backgroundImgUrl, onDownLoadShareBg);
                end
            end
            local url = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getQrCode?url=" .. Util.encodeURL(retData.data.bindUrl);
            -- 下载二维码图片
            self:image_load_sprite(nil, url, onDownLoadQR);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end

    self:http_get(requestData, onResponse, onError);
end


function FreeDiamondModule:on_destroy()
    self._shareAppDownloadLinkUrlToTimeline = false
    ModuleCache.WechatManager.onSendMessageToWXResp = nil
end


return FreeDiamondModule;
