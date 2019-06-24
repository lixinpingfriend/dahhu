local NetClientManager = ModuleCache.net.NetClientManager
local AppData = AppData
local class = require("lib.middleclass")
local Model = require('core.mvvm.model_base')
local ModuleEventBase = require('core.mvvm.module_event_base')
---@class MatchingManager
local MatchingManager = class('MatchingManager', Model)
local ModuleCache = ModuleCache
local Util = require('util.game_util')
local ComponentUtil = ModuleCache.ComponentUtil
local minRelifGold = 1000
local relifOpen = true
local firsrRechargeOpen = false
local luckyboxOpen = false

function MatchingManager:gold_jump(goldid, onFinish)
    local exchange_finish = function()
        self:gold_jump(goldid, onFinish)
    end
    local exchange_cancel = function()
        ModuleEventBase:dispatch_package_event("Event_GoldJump_error")
    end
    self:getGoldById(goldid, function(data)
        self:gold_jump_deal(data, exchange_finish, exchange_cancel, onFinish)
    end, function()
        ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
    end)
end
--小于2000 -> 救济金次数 > 0 -> 弹出救济金 否则弹出充值
function MatchingManager:gold_jump_deal(info, exchange_finish, exchange_cancel, onFinish)
    self:get_userinfo(function(roleData)
        if roleData.gold < info.minJoinCoin then
            if roleData.gold < minRelifGold and relifOpen then
                self:popup_relief(info.minJoinCoin, exchange_finish, exchange_cancel, roleData)
            else
                self:popup_firstrecharge(info.minJoinCoin, exchange_finish, exchange_cancel, roleData)
            end
        elseif roleData.gold > info.maxJoinCoin then
            self:get_quickJoin_data(function(data)
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
                        "您的金币超过<color=red>" .. info.maxJoinCoin .. "</color>,无法进入<color=red>" .. info.goldName .. "</color>!是否去往<color=red>" .. data.goldName .. "</color>", function()
                            TableManager:start_enter_gold_matching(self.modelData.roleData.userID, self.modelData.roleData.password, data.goldId, onFinish)
                        end, function()
                            ModuleEventBase:dispatch_package_event("Event_GoldJump_error")
                        end, true, "确定", "取消")
            end, function()
                ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
            end)
        else
            TableManager:start_enter_gold_matching(self.modelData.roleData.userID, self.modelData.roleData.password, info.goldId, onFinish)
        end
    end, function()
        ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
    end)
end

--牌桌弹出救济金
function MatchingManager:popup_relief(minJoinCoin, exchange_finish, exchange_cancel, roleData)
    self:jiujijin(function(times)
        if times > 0 then
            ModuleCache.ModuleManager.show_module("public", "relief", { exchange_finish = exchange_finish, exchange_cancel = exchange_cancel })
        else
            self:popup_firstrecharge(minJoinCoin, exchange_finish, exchange_cancel, roleData)
        end
    end, function()
        ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
    end)
end
--弹出首充
function MatchingManager:popup_firstrecharge(minJoinCoin, exchange_finish, exchange_cancel, roleData)
    if firsrRechargeOpen then
        self:get_first_recharge(function(data)
            if data and #data > 0 and data[1].isReceive == 0 then
                ModuleCache.ModuleManager.show_public_module("firstrecharge",
                        { rechargeData = data[1],
                          exchange_finish = exchange_finish,
                          exchange_cancel = exchange_cancel });
            else
                self:popup_luckybox(minJoinCoin, exchange_finish, exchange_cancel, roleData)
            end
        end, function()
            ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
        end)
    else
        self:popup_luckybox(minJoinCoin, exchange_finish, exchange_cancel, roleData)
    end

end

--弹出幸运宝箱
function MatchingManager:popup_luckybox(minJoinCoin, exchange_finish, exchange_cancel, roleData)
    if luckyboxOpen then
        local ls = function()
            self:get_luckybox_times(function(data)
                if data.remainderCount > 0 then
                    ModuleCache.ModuleManager.show_module("public", "luckybox", { exchange_finish = exchange_finish, exchange_cancel = exchange_cancel })
                else
                    self:goto_exchange(minJoinCoin, exchange_finish, exchange_cancel, roleData)
                end
            end, function()
                ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
            end)
        end
        local ops = function(data)
            if data.exprice > 0 then
                --时间大于5秒
                ModuleCache.ModuleManager.show_module("public", "luckybox",
                        { exchange_finish = exchange_finish, exchange_cancel = exchange_cancel })
            else
                ls()
            end
        end
        self:get_luckybox_status(ops, ls)
    else
        self:goto_exchange(minJoinCoin, exchange_finish, exchange_cancel, roleData)
    end

end

function MatchingManager:goto_exchange(minJoinCoin, exchange_finish, exchange_cancel, roleData)
    local goldExchangeData = {
        --合集参数
        productNum = minJoinCoin - roleData.gold,
        productType = 1,
        isNumNotEnough = true,
        onExchangeFinish = exchange_finish,
        onCancelExchange = exchange_cancel,
        --欢乐参数
        minGold = minJoinCoin,
        exchange_finish = exchange_finish,
        exchange_cancel = exchange_cancel
    }
    ModuleCache.ModuleManager.show_module("public", "goldexchange", goldExchangeData)
end



--牌桌外弹出救济金
function MatchingManager:jump_jiujijin()
    self:get_userinfo(function(roleData)
        if roleData.gold < minRelifGold then
            self:jiujijin(function(times)
                if times > 0 then
                    ModuleCache.ModuleManager.show_module("public", "relief")
                end
            end)
        end
    end)
end



-- 通过code获取活动数据
function MatchingManager:get_first_recharge(successCallback, errorCallback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityListByCode?",
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name(),
            code = "privilege_product"
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if retData.success then
            if successCallback then
                successCallback(retData.data)
            end
        else
            if errorCallback then
                errorCallback()
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if errorCallback then
            errorCallback()
        end
    end)
end
function MatchingManager:getGoldById(goldid, func, errorcallback)
    local addStr = "gold/getById?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            goldId = goldid,
            uid = self.modelData.roleData.userID
        }
    }
    Util.http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            func(retData.data)
        else
            ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
            if errorcallback then
                errorcallback()
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
        if errorcallback then
            errorcallback()
        end
    end)
end

--获取救济金数据
function MatchingManager:jiujijin(f, errorcallback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/getBankruptcyDetail?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if retData.ret == 0 then
            f(retData.data.receiveCount - retData.data.receiveNum)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
            if errorcallback then
                errorcallback()
            end
        end

    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
        if errorcallback then
            errorcallback()
        end
    end)
end
function MatchingManager:get_quickJoin_data(f, errorcallback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/quickJoin?",
        params = {
            uid = self.modelData.roleData.userID
        }
    }
    Util.http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            if type(retData.data) == "table" then
                f(retData.data)
            else
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel("您的金币不足，是否需要充值？", function()
                    ModuleCache.ModuleManager.show_module("public", "shop", 1)
                end, function()
                    print("点击取消充值，销毁牌桌")
                    ModuleEventBase:dispatch_package_event("Event_GoldJump_error")
                end, true, "充值", "关闭", "金币不足")
            end
        else
            if errorcallback then
                errorcallback()
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if errorcallback then
            errorcallback()
        end
    end)
end

function MatchingManager:getmatchbyid(id, successCallback, errorCallback, stageId)
    local addStr = "match/getById?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            matchId = id
        }
    }
    if stageId then
        requestData.params.stageNum = stageId
    end
    Util.http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) and successCallback then
            successCallback(retData.data)
        else
            if errorCallback then
                errorCallback()
            end

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if errorCallback then
            errorCallback()
        end
    end)
end

function MatchingManager:goodsName(type, num, name, othername)

    if type == 10 then
        return name .. " x" .. num
    elseif type == 12 then
        return othername .. " x" .. num
    elseif type == 1 then
        return "钻石x" .. num
    elseif type == 5 then
        return "金币x" .. Util.filterPlayerGoldNumWan(num)
    elseif type == 7 then
        return "红包券x" .. num / 100
    else
        return num .. ""
    end
end
function MatchingManager:goodsNameAndIcon(type, icon, text, num, name, url, othername, othericon, spriteholder, resetIcon)
    local resetCallback
    if resetIcon then
        resetCallback = function()
            icon:SetNativeSize();
        end
    end
    local path = "public/module/public/public_publicimage1080.atlas"
    if type == 10 then
        self:image_load_sprite(icon, url, resetCallback)
        text.text = name .. " x" .. num
    elseif type == 12 then
        self:image_load_sprite(icon, othericon, resetCallback)
        text.text = othername  --.. " x" .. num
    elseif type == 11 then
        text.text = "红包" .. num
        icon.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(path, "Gold coin yard_红包")
    elseif type == 13 then
        text.text = "随机物品"
        if icon then
            ComponentUtil.SafeSetActive(icon.transform.gameObject, false);
        end
    elseif type == 1 or type == 5 or type == 7 then
        local iconImgName = ""
        if type == 1 then
            iconImgName = "Public_货币_钻石"
        elseif type == 5 then
            iconImgName = "Public_货币_金币"
        elseif type == 7 then
            iconImgName = "Gold coin yard_红包"
        end
        icon.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(path, iconImgName)
        if icon and resetIcon then
            icon:SetNativeSize();
        end
        if type == 7 then
            num = num / 100
        end
        text.text = Util.filterPlayerGoldNumWan(num)
    else
        text.text = ""
        if icon then
            ComponentUtil.SafeSetActive(icon.transform.gameObject, false);
        end
    end
end
function MatchingManager:goodsNameAndIcon2(type, icon, textNum, textName, num, name, url, othername, othericon, spriteholder)
    local path = "public/module/public/public_publicimage1080.atlas"
    if type == 10 then
        self:image_load_sprite(icon, url)
        textNum.text = "x" .. num
        textName.text = name
    elseif type == 12 then
        self:image_load_sprite(icon, othericon)
        textNum.text = "x" .. 1
        textName.text = othername
    elseif type == 11 then
        textNum.text = "x" .. num
        textName.text = "红包"
        icon.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(path, "Gold coin yard_红包")
    elseif type == 13 then
        textNum.text = "x" .. 1
        textName.text = "随机物品"
        ComponentUtil.SafeSetActive(icon.transform.gameObject, false);
    elseif type == 2 then
        textNum.text = "x" .. num
        textName.text = "体力"
        icon.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(path, "Public_货币_体力")
    elseif type == 1 or type == 5 or type == 7 then
        local iconImgName = ""
        if type == 1 then
            iconImgName = "Public_货币_钻石"
        elseif type == 5 then
            iconImgName = "Public_货币_金币"
        elseif type == 7 then
            iconImgName = "Gold coin yard_红包"
        end
        icon.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(path, iconImgName)
        if type == 7 then
            num = num / 100
        end
        textNum.text = "x" .. Util.filterPlayerGoldNumWan(num)
        if type == 1 then
            textName.text = "钻石"
        elseif type == 5 then
            textName.text = "金币"
        elseif type == 7 then
            textName.text = "红包券"
        end
    else
        textName.text = ""
        ComponentUtil.SafeSetActive(icon.transform.gameObject, false);
    end
end

function MatchingManager:goodsNameAndIcon3(type, icon, textNum, itemNum, itemName, itemIcon, itemMount, spriteholder)
    if type == 10 then
        self:image_load_sprite(icon, itemIcon)
        textNum.text = " x" .. itemMount
    elseif type == 12 then
        textNum.text = itemName
        ComponentUtil.SafeSetActive(icon.transform.gameObject, false);
    elseif type == 9 or type == 2 or type == 14 then
        if type == 14 then
            itemNum = itemNum / 100
        end
        textNum.text = "x" .. itemNum
        icon.sprite = spriteholder:FindSpriteByName(type .. "");
    end
end


--下载头像
function MatchingManager:startDownLoadHeadIcon(targetImage, url, resetIcon)
    local reset
    if resetIcon then
        reset= function()
            targetImage:SetNativeSize();
        end
    end
    self:image_load_sprite(targetImage, url, reset)
end
--显示名次
function MatchingManager:matchAwards(matchid, stageid, rank, circle)
    local data = {
        matchId = matchid,
        stageId = stageid,
        rank = rank,
        circle = circle
    }
    ModuleCache.ModuleManager.show_public_module("matchawards", data)
end

-- 获取背包详情协议
function MatchingManager:getBagData(successCallback, errorCallback)
    local requestData = {
        params = {
            uid = self.modelData.roleData.userID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "packetItem/queryGamePacketItemOnwerPage?",
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            self.modelData.roleData.bagData = retData.data.list
            if successCallback then
                successCallback(retData.data.list)
            end
        else
            if errorCallback then
                errorCallback()
            end
        end
    end
    local onError = function(data)
        print(data.error);
        if errorCallback then
            errorCallback()
        end
    end
    self:http_get(requestData, onResponse, onError);
end


--获取幸运宝箱次数
function MatchingManager:get_luckybox_times(callback, errorcallback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getActivityListByCode?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name(),
            code = "open_chest"
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) and retData.data and #retData.data > 0 then
            if callback then
                callback(retData.data[1])
            end
        else
            if errorcallback then
                errorcallback()
            end

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if errorcallback then
            errorcallback()
        end
    end)
end

--获取幸运宝箱开启状态
function MatchingManager:get_luckybox_status(callback, errorcallback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getOpenChest?",
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name()
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) and callback then
            callback(retData.data)
        else
            if errorcallback then
                errorcallback()
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if errorcallback then
            errorcallback()
        end
    end)
end

-- 这个不能用缓存，需要使用实时的货币数据
function MatchingManager:get_userinfo(callback, errorcallback)
    if not self.modelData.roleData.userID then
        return
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = self.modelData.roleData.userID,
        },
        cacheDataKey = "user/info?uid=" .. self.modelData.roleData.userID
    }
    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            -- OK
            callback(retData.data)
        else
            if errorcallback then
                errorcallback()
            end
        end
    end, function(error)
        print(error.error)
        if errorcallback then
            errorcallback()
        end

    end, nil)
end

function MatchingManager:openCustomerService()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/isCustomer?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if retData.data then
                ModuleCache.ModuleManager.show_public_module("customerservicesystem");
                --self.view.spritecustomerServiceRed:SetActive(false)
            else
                ModuleCache.ModuleManager.show_module("public", "customerservice");
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function MatchingManager:initialize(...)
    Model.initialize(self, ...)
    self.modelData = require("package.public.model.model_data")
end

MatchingManager:initialize('public')

return MatchingManager