






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class ShareModule
---@field view ShareView
---@field shareView ShareView
local ShareModule = class("BullFight.ShareModule", ModuleBase)



-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local WechatManager = ModuleCache.WechatManager
local Util = Util

function ShareModule:initialize(...)
    ModuleBase.initialize(self, "share_view", nil, ...)
    self.data = nil;
    

    self.view.Center.gameObject:SetActive(true)
    self.view.CenterNew.gameObject:SetActive(false)
    


end



-- 模块初始化完成回调，包含了view，Model初始化完成  
function ShareModule:on_module_inited()

end



function ShareModule:initJiangLi(showShareReward)

    self.view.Center.gameObject:SetActive(false)
    self.view.CenterNew.gameObject:SetActive(false)
    local requestData = {
        params =
        {
            code = "share_sign",
            uid = self.modelData.roleData.userID,
            gameId = ModuleCache.GameManager.curGameId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityListByCode?",
    }


    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            local tableMingZi = {}


            --- 2钻石3体力4红包5cdkey6铜钱7元宝8抽奖券9金币10道具12商品购买特权
            tableMingZi[2] = "钻石"
            tableMingZi[3] = "体力"
            tableMingZi[9] = "金币"
            tableMingZi[10] = "道具"

        
            self.view.Center.gameObject:SetActive(false)
            self.view.CenterNew.gameObject:SetActive(false)
            if #retData.data == 0 then
                self.view.Center.gameObject:SetActive(true)
                self.view.spriteReward.gameObject:SetActive(showShareReward);
            else
                self.view.CenterNew.gameObject:SetActive(true)
                for i=1,5 do
                    self.view.OperateTable[i].go:SetActive(false)
                end
                for i,v in ipairs(retData.data) do
                    self.view.OperateTable[i].go:SetActive(true)
                    
                    local jiangli = v.appAwards[1]
                    local num = jiangli.amount
                    local mingzi = tableMingZi[jiangli.amountType]

                    if jiangli.amountType == 10 then
                        num = jiangli.itemNum
                        mingzi = jiangli.itemName
                        local img = self.view.OperateTable[i].Icon
                        ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(jiangli.itemIcon, function(err, spriteT)
                            if (err) then
                                print(err)
                            else
                                img.sprite = spriteT
                                --self.view.OperateTable[i].Icon:SetNativeSize()
                            end
                        end , nil, true)
                    else    
                        self.view.OperateTable[i].Icon.sprite = self.view.SpriteHolderGoods:FindSpriteByName(tostring(jiangli.amountType))
                        --self.view.OperateTable[i].Icon:SetNativeSize()
                    end 
                    self.view.OperateTable[i].Title.text = mingzi .. "X" .. num
                    if v.targetNum ~= nil then
                        self.view.OperateTable[i].Count.text = "累积" .. v.targetNum .. '次'
                    end
                    
                    self.view.OperateTable[i].BtnLingQu.gameObject:SetActive(false)
                    self.view.OperateTable[i].BtnLingQu1.gameObject:SetActive(false)
                    self.view.OperateTable[i].CountGo.gameObject:SetActive(false)


                    --0未领取 1已领取 2未达成 
                    if v.isReceive == 0 then
                        self.view.OperateTable[i].BtnLingQu.gameObject:SetActive(true)
                    elseif v.isReceive == 1 then
                        self.view.OperateTable[i].BtnLingQu1.gameObject:SetActive(true)
                    elseif v.isReceive == 2 then
                        self.view.OperateTable[i].CountGo.gameObject:SetActive(true)
                    end

                    self.view.CountAll.text = v.currentNum .. ''

                    local activityId = v.activityId
                    local isRes = v.isReceive == 0

                    self.activityIdTableHu = self.activityIdTableHu or {}
                    self.activityIdTableHu[i] = activityId

                    self.isResTable = self.isResTable or {}
                    self.isResTable[i] = isRes

                    self.tableJiaLe = self.tableJiaLe or {}

                    if not self.tableJiaLe[i] then
                        self:indexHuoDongButton(i)
                    end
                    self.tableJiaLe[i] = true
                end
            end
        else

        end
    end

    local onError = function(data)
        print(data.error);

        self.view.Center.gameObject:SetActive(true)
    end

    self:http_get(requestData, onResponse, onError);
end

function ShareModule:indexHuoDongButton(index)
    self.view.OperateTable[index].BtnLingQuReal.onClick:AddListener(
        function()
            if self.isResTable[index] then
                self:lingquJiangli(self.activityIdTableHu[index])
            end
            print(self.activityIdTableHu[index])
        end
    ) 
end

function ShareModule:on_click(obj, arg)
  
    self._shareAppDownloadLinkUrlToTimeline = false
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.shareView.buttonClose.gameObject or obj.name == "maskBtn" then
        ModuleCache.ModuleManager.hide_module("public", "share")
    elseif obj.name == "FenXiang" then
        if "WindowsEditor" == tostring(UnityEngine.Application.platform) or tostring(UnityEngine.Application.platform) =='WindowsPlayer' then
            self:ShangChuan()
        else
            ModuleCache.ShareManager().shareAppDownload(self.shareData, true);
            ModuleCache.WechatManager.onSendMessageToWXResp = function(data)
                local retData = ModuleCache.Json.decode(data)
                if retData.errCode == 0 then
                    self:ShangChuan()
                end
            end
        end



    elseif obj == self.shareView.buttonTimeLine.gameObject then
        self._shareAppDownloadLinkUrlToTimeline = true
        -- 大厅
        if self.data == nil then

            -- 请求获取图片分享配置协议
            self:getImageShareConfig(true);
            -- 亲友圈
        else

            ModuleCache.ShareManager().shareAppDownload(self.shareData, true);
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
                            -- local message = string.format("分享成功,获得<color=#AA391FFF>%d</color>钻石奖励!", activity.appAwards.amount);
                            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_receive("分享成功，点击领取即可获得钻石奖励", callback)
                        end
                    end
                end
                print_table(retData, "onSendMessageToWXResp")
            end
        end

        ModuleCache.ModuleManager.hide_module("public", "share")

        return
    elseif obj.name == "closeBtn1" then
        ModuleCache.ModuleManager.hide_module("public", "share")

    elseif obj.name == "closeBtn2" then
        ModuleCache.ModuleManager.hide_module("public", "share")
    elseif obj == self.shareView.buttonChat.gameObject then
        -- 大厅
        if self.data == nil then

            -- 请求获取图片分享配置协议
            self:getImageShareConfig(false);
            -- 亲友圈
        else
            ModuleCache.ShareManager().shareAppDownload(self.shareData, false)
        end
        ModuleCache.ModuleManager.hide_module("public", "share")
        return;

    elseif obj.name == "ButtonAdd" then
        self:get_user_info(self.view.inputFieid.text)
    elseif string.find(obj.name, "ButtonShare") then
        if self.view[obj.name] then
            self.view[obj.name]()
        end
    end
end


function ShareModule:add_parlor_user(userID)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/addParlorUser?",
        params =
        {
            uid = self.modelData.roleData.userID,
            userId = userID,
            parlorId = self.data.orginalParlorId or self.data.id,
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("添加成员成功！")
            -- retData.msg)
            self:dispatch_module_event("share", "Update_museumMembers")
        else

        end
    end , function(wwwErrorData)
        --if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
        --    if wwwErrorData.www.text then
        --        local retData = wwwErrorData.www.text
        --        retData = ModuleCache.Json.decode(retData)
        --        if retData.errMsg then
        --            retData = ModuleCache.Json.decode(retData.errMsg)
        --            --ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(retData.message, function()
        --            --    print(retData.message)
        --            --end )
        --        end
        --    end
        --end
    end )
end


-- 领取奖励
function ShareModule:lingquJiangli(activityId)
    -- 上报 服务器  成功后 刷新界面
    local requestData = {
        params =
        {
            activityId = activityId,
            uid = self.modelData.roleData.userID,
            gameId = ModuleCache.GameManager.curGameId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getAwards?",
    }


    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            self:initJiangLi()

            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("领取成功！")

        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("领取失败！")
        end
    end

    local onError = function(data)
        print(data.error);
        --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.error)
    end

    self:http_get(requestData, onResponse, onError);

end

function ShareModule:ShangChuan()
    -- 上报 服务器  成功后 刷新界面
    local requestData = {
        params =
        {
            targetType = 9,
            targetNum = 1,
            uid = self.modelData.roleData.userID,
            gameId = ModuleCache.GameManager.curGameId
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "statistics/add?",
    }


    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            self:initJiangLi()
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("分享成功！")
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("分享失败！")
        end
    end

    local onError = function(data)
        --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.error)
        print(data.error);
    end

    print("上报 服务器 分享成功了")

    self:http_get(requestData, onResponse, onError); 
end

function ShareModule:get_user_info(userID)
    print("---------------userID:", userID)
    if userID == nil or userID == "" then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先输入玩家ID")
        return
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params =
        {
            uid = userID,
        },
        cacheDataImmediatelyCallback = true,
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            if retData.data then
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common_image_tex({
                    topTex = "您正在通过ID添加成员，请确认玩家信息",
                    rightTex1 = retData.data.nickname ,
                    rightTex2 = "ID：0".. retData.data.userId,
                    headImg = retData.data.headImg
                }, function()
                    self:add_parlor_user(self.view.inputFieid.text)
                    self.view.inputFieid.text = ""
                end)
            end
        else
            if retData.errMsg then

            end
        end
    end , function(wwwErrorData)
        --if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
        --    if wwwErrorData.www.text then
        --        local retData = wwwErrorData.www.text
        --        retData = ModuleCache.Json.decode(retData)
        --        if retData.errMsg then
        --            retData = ModuleCache.Json.decode(retData.errMsg)
        --            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(retData.message, function()
        --                print(retData.message)
        --            end )
        --        end
        --    end
        --end
    end )
end


-- 请求获取活动奖励协议
function ShareModule:getActivityList()

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
function ShareModule:getActivityByCode(code)

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
function ShareModule:getAwards(activityID, callback)

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
function ShareModule:getActivityByCode(code)

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

function ShareModule:on_show(data)
    if (type(data) == "table" and data.from == "hall") then
        self.view.stateSwitcher:SwitchState("normal")
        self:initJiangLi(data.showShareReward)
    else
        self.data = data;
        if data ~= nil and data.type == 3 then
            -- 亲友圈成员列表添加功能 和 亲友圈设置添加功能
            self.view.stateSwitcher:SwitchState("museumShare")
        else
            self.view.stateSwitcher:SwitchState("normal")
        end

        self.shareData = { }
        self.shareData.userID = self.modelData.roleData.userID
        self.shareData.roomType = 0
        if (data) then
            self.shareData.type = data.type
            self.shareData.parlorId = data.orginalParlorNum .. ""
            self.shareData.realParlorId = data.orginalParlorId       --TODO XLQ ADD 亲友圈添加成员分享需要亲友圈id
        else
            self.shareData.type = 1
        end

        if data == nil then

            local activityList = self.modelData.hallData.activityList;

            if activityList then
                -- 更新奖励视图
                self.shareView:updateRewardView(activityList, "share");
            end
        else
            self.shareView.spriteReward.gameObject:SetActive(false);
            --self.shareView.labelReward.gameObject:SetActive(false);
        end
    end
end

-- 请求获取图片分享配置协议
function ShareModule:getImageShareConfig(timeLine)

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


function ShareModule:on_destroy()
    self._shareAppDownloadLinkUrlToTimeline = false
    ModuleCache.WechatManager.onSendMessageToWXResp = nil
end


return ShareModule



