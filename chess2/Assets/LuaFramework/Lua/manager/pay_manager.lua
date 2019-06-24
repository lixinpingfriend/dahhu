local Util = Util
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local ModuleEventBase = require('core.mvvm.module_event_base')
local CSmartTimer = ModuleCache.SmartTimer.instance
local ApplicationEvent = ApplicationEvent
---@class PayManager
local PayManager = {}
function PayManager.init()
    PayManager.modelData = require("package.public.model.model_data")
end

PayManager.onAppFocusCallback = function(eventHead, state)
    if ModuleCache.GameManager.iosAppStoreIsCheck then
        return
    end
    if state then
        ApplicationEvent.unsubscibe_app_focus_event(PayManager.onAppFocusCallback)
        if PayManager.isH5Paying then
            PayManager.openUrl = false
            PayManager.isH5Paying = false;
            ModuleCache.ModuleManager.destroy_module("public", "webview");
            ModuleCache.ModuleManager.hide_public_module("netprompt")
            CSmartTimer:Subscribe(1, false, 0):OnComplete(function(t)
                PayManager.getUserNewMessage()
            end)
            CSmartTimer:Subscribe(3.5, false, 0):OnComplete(function(t)
                PayManager.getUserNewMessage()
            end)
        end
    end
end


--1：原生微信支付；3：微信h5支付；6:汇付宝H5支付（5 微信公众号） 30支付宝wap
function PayManager.get_pay_type(goodsData, shareCallback, realPrice, intentData)
    --print_table(goodsData)
    local id
    if goodsData then
        id = goodsData.id or goodsData.productId
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "pay/getPayTypeNew?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            productId = id
        }
    }


    if intentData and intentData.receiverType then
        requestData.params.receiverType = intentData.receiverType
    end

    if intentData and intentData.receiverId then
        requestData.params.receiverId = intentData.receiverId
    end

    if ModuleCache.GameManager.customOsType == 1 then
        requestData.params.config = 1
    end
    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            --pay_type = "1,3,6,30"
            --微信分享支付
            local intent = {
                payTypeDatas = retData.data,
                goodsData = goodsData,
                realPrice = realPrice,
                id = id,
            }

            if intentData then
                if intentData.webGamePay then
                    intent.webGamePay = intentData.webGamePay
                    if intentData.price then
                        intent.realPrice = intentData.price
                    end
                end
                if(intentData.webGameType)then
                    intent.webGameType = intentData.webGameType
                end
                if(intentData.resetRootScale)then
                    intent.resetRootScale = intentData.resetRootScale
                end
                intent.intentData = intentData

                if intentData.receiverType then
                    intent.receiverType = intentData.receiverType
                end
                if intentData.receiverId then
                    intent.receiverId = intentData.receiverId
                end

                intent.activityId = intentData.activityId
            end

            if shareCallback then
                shareCallback(intent)
                return
            end

            ModuleCache.ModuleManager.show_module("public", "shoppaytype", intent)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end
    end)
end

function PayManager.begin_pay(payTypeIndex, intentData)

    local payTypeData = intentData.payTypeDatas[payTypeIndex]
    intentData.selectPayTypeData = payTypeData

    if intentData.webGamePay then
        PayManager.webGamePay(intentData)
        return
    end

    if intentData.intentData.museum then
        PayManager.otherPay(intentData)
    else
        if payTypeData.showType == 1 then
            PayManager.buy_goods(intentData.id, intentData.isAgent, intentData.receiverId, intentData.receiverType)
        else
            ModuleCache.PayManager().dahuPay(intentData)
        end
    end
end

function PayManager.getPayTypeByMoney(num, activityId)
    local goodsData = {
        salePrice = num,
        productName = "亲友圈活动"
    }
    local intent = {
        goodsData = goodsData,
        realPrice = num,
        museum = true,
        activityId = activityId
    }
    PayManager.get_pay_type(goodsData, nil, num, intent)
end

--pay_type, intentData, intentData.activityId, intentData.goodsData, intentData.realPrice, intentData.receiverId, intentData.receiverType
function PayManager.otherPay(intentData)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "pay/otherPay?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            orderItemType = 1,
            orderItemId = intentData.activityId,
            bundleId = Util.identifier,
            payType = tonumber(intentData.selectPayTypeData.payType),
            wapType = intentData.selectPayTypeData.wapType,
            packageName = UnityEngine.Application.identifier,
        }
    }
    requestData.params.receiverId = intentData.receiverId
    requestData.params.receiverType = intentData.receiverType


    requestData.params.sceneInfo = PayManager.create_h5_pay_scene_info()

    --print_table(requestData.params,"===========:"..pay_type)

    Util.http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if retData.payStatus == 1 then
            PayManager.getUserNewMessage()
            ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("充值成功")
        else
            if tonumber(intentData.selectPayTypeData.payType) == 1 then
                ModuleCache.WechatManager.recharge(retData.result, function(errCode)
                    if (errCode == 0 or errCode == "0") then
                        PayManager.rechargeNormal = true
                        PayManager.getUserNewMessage()
                        ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
                    end
                end)
            else

                if intentData.selectPayTypeData.wapType == 2 then
                    --支付宝支付
                    PayManager.alipayDeal(retData.result)
                elseif intentData.selectPayTypeData.showType == 3 then
                    PayManager.sharePay(retData.result, intentData.goodsData, intentData.realPrice / 100)
                elseif intentData.selectPayTypeData.showType == 4 then  --微信小程序
                    PayManager.shareMiniProgramToWechat(ModuleCache.GameUtil.json_decode_to_table(retData.result) or retData.result)
                else
                    PayManager.start_pay(retData.result)
                end
            end
        end
        --pay_type 1:原生sdk支付。  其他：h5支付

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

-- 初始版本微信 购买房卡
function PayManager.buy_goods(id, isAgent, receiverId, receiverType)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getWxPayParam?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            productId = id,
        }
    }
    if receiverId then
        requestData.params.receiverId = receiverId
    end
    if receiverType then
        requestData.params.receiverType = receiverType
    end
    if isAgent then
        requestData.params.commissionBuy = 1
    else
        requestData.params.commissionBuy = 0
    end

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if retData.data.payStatus == 1 then
                PayManager.getUserNewMessage()
                ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("充值成功")
            else
                ModuleCache.WechatManager.recharge(retData.data.result, function(errCode)
                    if (errCode == 0 or errCode == "0") then
                        PayManager.rechargeNormal = true
                        PayManager.getUserNewMessage()
                        ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
                    end
                end)
            end

        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
            ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Fail")
        end


    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Fail")
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end


function PayManager.webGamePay(intentData)
    local sceneInfoStr = PayManager.create_h5_pay_scene_info()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "webGame/webGamePay?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            userId = intentData.intentData.gameUserId,
            payType = intentData.selectPayTypeData.payType,
            wapType = intentData.selectPayTypeData.wapType,
            sceneInfo = sceneInfoStr,
            body = intentData.intentData.itemInfo,
            amount = intentData.intentData.price,
            orderId = intentData.intentData.orderId,
            packageName = UnityEngine.Application.identifier,
            WebViewShop = "false",
            notifyType = 1,
            webGameType = intentData.webGameType,
            notifyUrl = intentData.intentData.notifyUrl,
            clientIp = "192.168.1.1"
        }
    }

    if intentData.isAgent then
        requestData.params.commissionBuy = 1
    else
        requestData.params.commissionBuy = 0
    end
    if ModuleCache.GameConfigProject.showPackage == "WebViewShop" then
        requestData.params.WebViewShop = "true"
    end

    if not intentData.goods_data then
        intentData.goods_data = intentData.intentData.goodsData
    end

    print_table(requestData)

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if retData.data.payStatus == 1 then
                PayManager.getUserNewMessage()
                ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
            else

                if intentData.selectPayTypeData.wapType == 2 then
                    --支付宝支付
                    PayManager.alipayDeal(retData.data.result)
                elseif intentData.selectPayTypeData.showType == 3 then
                    PayManager.sharePay(retData.data.result, intentData.goodsData, intentData.realPrice / 100)
                elseif intentData.selectPayTypeData.showType == 4 then  --微信小程序
                    PayManager.shareMiniProgramToWechat(ModuleCache.GameUtil.json_decode_to_table(retData.data.result)  or retData.data.result)
                else
                    PayManager.start_pay(retData.data.result)
                end
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
            ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Fail")
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
                    ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Fail")
                end
            end
        end
    end)
end
--intentData.goodsData, pay_type, intentData.wapType, intentData.isAgent, intentData.realPrice, intentData.receiverId, intentData.receiverType
function PayManager.dahuPay(intentData)
    local id = intentData.goodsData.id
    local sceneInfoStr = PayManager.create_h5_pay_scene_info()

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "pay/dahuPay?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            productId = id,
            payType = intentData.selectPayTypeData.payType,
            wapType = intentData.selectPayTypeData.wapType,
            sceneInfo = sceneInfoStr,
            packageName = UnityEngine.Application.identifier,
            WebViewShop = "false",
        }
    }
    requestData.params.receiverId = intentData.receiverId
    requestData.params.receiverType = intentData.receiverType

    if intentData.isAgent then
        requestData.params.commissionBuy = 1
    else
        requestData.params.commissionBuy = 0
    end
    if ModuleCache.GameConfigProject.showPackage == "WebViewShop" then
        requestData.params.WebViewShop = "true"
    end

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if retData.data.payStatus == 1 then
                PayManager.getUserNewMessage()
                ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
            else
                if intentData.selectPayTypeData.wapType == 2 then
                    --支付宝支付
                    PayManager.alipayDeal(retData.data.result)
                elseif intentData.selectPayTypeData.showType == 3 then
                    PayManager.sharePay(retData.data.result, intentData.goodsData, intentData.realPrice)
                elseif intentData.selectPayTypeData.showType == 4 then  --微信小程序
                    PayManager.shareMiniProgramToWechat(ModuleCache.GameUtil.json_decode_to_table(retData.data.result) or retData.data.result)
                else
                    PayManager.start_pay(retData.data.result)
                end
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
            ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Fail")
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
                    ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Fail")
                end
            end
        end
    end)
end

--支付分享到小程序，ios可以通过链接分享"weixin://app/wx8d1873caf543503b/jumpWxa/?userName=gh_1fb92b96e5eb&path=pages%2FpayOrder%2Findex%3Fbody%3D%E6%94%AF%E4%BB%98%E5%AE%A2%E6%9C%8D%E5%BE%AE%E4%BF%A1%3Ajctx1234kf%26money%3D100%26orderNo%3D63a5ff45a781489ca810f12012c9c7ce&miniProgramType=0"
function PayManager.shareMiniProgramToWechat(data)
    if ModuleCache.GameManager.platformIsIphone then
        local url
        if type(data) == "string" then
            url = data
        else
            url = string.format("weixin://app/%s/jumpWxa/?userName=%s&path=%s&miniProgramType=0", data.openAppId, data.reqUserName, ModuleCache.GameUtil.encodeURL(data.reqPath))
        end
        PayManager.start_pay(url)
    else
        local data = {
            eventName = "CallWXLaunchMiniProgram",
            appId = data.openAppId,
            userName = data.reqUserName,
            path = data.reqPath,
        }
        ModuleCache.SDKInterface().common_request(data)
    end

end


function PayManager.create_h5_pay_scene_info()
    local sceneInfoStr = {}
    local h5_info = {}
    sceneInfoStr.h5_info = h5_info
    if ModuleCache.GameManager.customOsType == 2 then
        h5_info.type = "IOS"
    else
        h5_info.type = "Android"
    end
    h5_info.app_name = UnityEngine.Application.productName
    h5_info.bundle_id = UnityEngine.Application.identifier

    sceneInfoStr = ModuleCache.GameUtil.table_encode_to_json(sceneInfoStr)
    return sceneInfoStr
end


--发起支付
function PayManager.start_pay(url, html)
    if not html then
        url = url .. "&webviewshop=true"
    end

    if true then
        local data = {
            link = url,
            showType = 1,
            hide = true
        }
        if ModuleCache.GameManager.isEditor then
            data.hide = false
        end
        ModuleCache.ModuleManager.destroy_module("public", "webview");
        ApplicationEvent.subscibe_app_focus_event(PayManager.onAppFocusCallback)
        PayManager.isH5Paying = true
        ModuleCache.ModuleManager.show_module("public", "webview", data);
    else
        if PayManager.openUrl then
            --防止连点
            return
        end
        --无法唤起webview 用浏览器打开支付链接
        PayManager.openUrl = true
        UnityEngine.Application.OpenURL(url)
    end

    print("支付url:", url)
end

function PayManager.alipayDeal(str)
    local packageName = "alipays://"
    if ModuleCache.GameManager.customOsType == 1 then
        packageName = "com.eg.android.AlipayGphone"
    end
    if not ModuleCache.GameSDKInterface:IsAppExist(packageName) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先安装支付宝")
        return
    end
    local path = UnityEngine.Application.persistentDataPath .. "/pay/"
    local filePath = path .. "/ali.html"
    if (not ModuleCache.FileUtility.DirectoryExists(path)) then
        ModuleCache.FileUtility.DirectoryCreate(path)
    end

    str = Util.decodeBase64(str)
    --str = Util.decodeURL(str)
    print("==============:", str)

    local save = ModuleCache.FileUtility.SaveFile(filePath, str)
    if save then
        local p = filePath
        p = string.gsub(p, "//", "/")
        p = "file://" .. p
        PayManager.start_pay(p, true)
    else
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("支付失败")
    end

end

function PayManager.sharePay(url, goods_data, realPrice)
    local price = goods_data and goods_data.salePrice or nil
    if realPrice and type(realPrice) == "number" then
        price = realPrice
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getShareConfig?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            type = 4,
            ["local"] = goods_data.productName,
            ruleName = PayManager.modelData.roleData.nickname,
            ruleMsg = tostring(price)
        },
    }
    if goods_data and goods_data.museum then
        requestData.params.type = 5
    end
    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        ModuleCache.WechatManager.share_url(0, retData.data.title, retData.data.message, url)
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




-- 兑换
function PayManager.buy_gold(id, num, callback)
    if not num then
        num = 0
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "product/buy?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            productId = id
        }
    }

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            PayManager.getUserNewMessage()
            if callback then
                callback()
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
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

function PayManager.getUserNewMessage()
    if not PayManager.modelData.roleData.userID then
        return
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "msg/getNewMsg?",
        params = {
            uid = PayManager.modelData.roleData.userID,
        }
    }
    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if retData.ret == 0 then
            local data = retData.data
            PayManager.modelData.roleData.cards = data.cards
            PayManager.modelData.roleData.coins = data.coins
            PayManager.modelData.roleData.gold = data.gold
            PayManager.modelData.roleData.redPacket = data.redPacket
            print_table(data, "=====paymanager,getUserNewMessage======")
            ModuleEventBase:dispatch_package_event("Event_Package_Refresh_Userinfo", data)
            if data.msg then
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(data.msg)
            end
            if data.msgType == 1 or data.msgType == 2 or data.msgType == 3 or data.msgType == 4 or data.msgType == 5 then
                if not PayManager.rechargeNormal then
                    ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
                else
                    PayManager.rechargeNormal = false
                end
            end
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

function PayManager.appstoreRecharge(data)
    ModuleCache.WechatManager.onAppstorePaySucess = function()
        print("shopmodule__onAppstorePaySucess", data.productId, data.num, data.type)
        PayManager.chargeByAd(2, data.num)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("充值" .. data.num .. "体力成功")
    end
    ModuleCache.GameSDKInterface:BuyAppStoreProduct(data.productId)
end

function PayManager.chargeByAd()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "charge/chargeByAd?",
        showModuleNetprompt = true,
        params = {
            uid = PayManager.modelData.roleData.userID,
            adid = ModuleCache.SecurityUtil.GetMd5HashFromStr("adid" .. os.time() .. PayManager.modelData.roleData.userID)
        }
    }
    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if (retData.ret and retData.ret == 0) then
            if (retData.data) then
                PayManager.getUserNewMessage()
                --ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("充值成功!")
            end
        else

        end

    end, function(errorData)
        print(errorData.error)
    end)
end

PayManager.init()
return PayManager