
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local GoldAddModule = class("Public.GoldAddModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function GoldAddModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "goldadd_view", nil, ...)

end

-- 模块初始化完成回调，包含了view，Model初始化完成
function GoldAddModule:on_module_inited()
    --local that = self
    --self.view.inputOut.onEndEdit:AddListener(function(value)
    --    if value == "" then
    --        return
    --    end
    --    if string.sub(value, 1, 1) == "0" and #value > 1 then
    --        while string.sub(value, 1, 1) == "0" and #value > 1 do
    --            value = string.sub(value, 2, #value)
    --        end
    --        that.view.inputOut.text = value
    --    end
    --    --print("inputOut onValueChanged : "..value)
    --    if tonumber(value) > that.curStoreData.coffersAmount then
    --        that.view.inputOut.text = that.curStoreData.coffersAmount
    --    end
    --end)
end

-- 绑定module层的交互事件
function GoldAddModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        if self.view then
            self.view:refreshTili(self.modelData.roleData)
        end

    end)
end

-- 绑定Model层事件，模块内交互
function GoldAddModule:on_model_event_bind()


end

function GoldAddModule:on_show(data)
    self:dispatch_package_event("Event_Open_TableShop")
    ModuleCache.ComponentUtil.SafeSetActive(self.view.selectPayDialog, false)
    --self.changeId = ModuleCache.GameManager.curGameId
    --ModuleCache.GameManager.select_game_id(10)
    self.view:refreshTili(self.modelData.roleData)
    ModuleCache.PayManager().getUserNewMessage()
    self:GetDataFromServer_GetBigTabs()
    self:get_store_data()
end

function GoldAddModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == self.view.btnClose.name then
        --ModuleCache.GameManager.select_game_id(self.changeId)
        ModuleCache.ModuleManager.hide_module("public", "goldadd")
        self:dispatch_package_event("Event_Close_TableShop")
    elseif obj.name == self.view.btnStoreout.name then
        local inputText = tonumber(self.view.inputOut.text)
        if not inputText then
            return
        end
        if inputText < 1 or inputText > tonumber(self.curStoreData.coffersAmount) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您输入的数值有误，请确认后重新输入!")
            return
        end
        self:store_out(inputText)
    elseif obj.name == self.view.btnOutMax.name then
        self.view.inputOut.text = self.curStoreData.coffersAmount
    elseif obj.name == "BuyGoodsBtn" then
        local data = self.view:get_data(obj.transform.parent.gameObject)
        self.goodsData = data
        self:buy_gold_check(data)
    elseif obj.name == self.view.btnPayClose.name then
        ModuleCache.ComponentUtil.SafeSetActive(self.view.selectPayDialog, false)
    elseif obj.name == self.view.btnAli.name then
        ModuleCache.ComponentUtil.SafeSetActive(self.view.selectPayDialog, false)
        if (self.goodsData and self.pay_type) then
            if self.pay_type == "2" then
                self:buy_goods_2(self.goodsData.id, 2)
            else
                self:dahuPay(self.goodsData.id, self.pay_type, "2")
            end
        else
            print("没有获取商品信息！")
        end
    elseif obj.name == self.view.btnWechat.name then
        ModuleCache.ComponentUtil.SafeSetActive(self.view.selectPayDialog, false)
        if (self.goodsData and self.pay_type) then
            if self.pay_type == "2" then
                self:buy_goods_2(self.goodsData.id, 1)
            else
                self:dahuPay(self.goodsData.id, self.pay_type, "1")
            end
        else
            print("没有获取商品信息！")
        end
    end
end

function GoldAddModule:buy_gold_check(product)


    if self.modelData.roleData.coins == nil then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("体力不足，请充值体力!")
        return
    end

    if product == nil or product.productPrice == nil then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("商品信息错误!")
        return
    end

    if product.payType == 99 then
        self:get_pay_type(product.id)
        return
    end

    if self.modelData.roleData.coins < tonumber(product.productPrice) then
        --ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("体力不足，请充值体力!")
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("体力不足，请充值体力!")
        return
    end
    self:buy_gold(product.id, product.num)
end

-- 兑换金币
function GoldAddModule:buy_gold(id, num)
    if not num then
        num = 0
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "product/buy?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            productId = id
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            ModuleCache.PayManager().getUserNewMessage()
            if self.view.goldLimit.todayExchange then
                self.view.goldLimit.todayExchange = self.view.goldLimit.todayExchange + num
                self.view:showGoldLimit(self.view.goldLimit)
            else
                self:get_gold_limit()
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

function GoldAddModule:get_pay_type(id)

    --if not ModuleCache.GameConfigProject.developmentMode then
    --	self:buy_goods(id)
    --	return
    --end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getPayType?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if retData.data == "2" then
                self.pay_type = "2"
                ModuleCache.ComponentUtil.SafeSetActive(self.view.selectPayDialog, true)
            elseif retData.data == "3" then
                self.pay_type = "3"
                self:dahuPay(id, "3", "1")
            elseif retData.data == "4" then
                self:dahuPay(self.goodsData.id, self.pay_type, "2")
                --self.pay_type = "4"
                --ModuleCache.ComponentUtil.SafeSetActive(self.view.selectPayDialog,true)
            elseif retData.data == "5" then
                --self:dahuPay(id, "4","1")
                self.pay_type = "5"
                self:dahuPay(id, "5", "1")
                --ModuleCache.ComponentUtil.SafeSetActive(self.view.selectPayDialog, true)
            else
                self:buy_goods(id)
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

function GoldAddModule:dahuPay(id, pay_type, wap_ype)

    local sceneInfoStr = ""

    if pay_type == "3" then
        sceneInfoStr = self:create_h5_pay_scene_info()
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "pay/dahuPay?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            productId = id,
            payType = pay_type,
            wapType = wap_ype,
            sceneInfo = sceneInfoStr,
            packageName = UnityEngine.Application.identifier,
            WebViewShop = "false"
        }
    }
    if ModuleCache.GameConfigProject.showPackage == "WebViewShop" then
        requestData.params.WebViewShop = "true"
    end

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if self.pay_type then
                if self.pay_type == "3" or self.pay_type == "4" or self.pay_type == "5" then
                    self:start_pay(retData.data.result)
                end
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

function GoldAddModule:create_h5_pay_scene_info()
    local sceneInfoStr = {}
    local h5_info = {}
    sceneInfoStr.h5_info = h5_info
    if ModuleCache.GameManager.customOsType == 2 then
        h5_info.type = "IOS"
    else
        h5_info.type = "Android"
    end
    h5_info.app_name = "七星棋牌"
    h5_info.bundle_id = "com.qixingqipai.qixingqipai"

    sceneInfoStr = ModuleCache.GameUtil.table_encode_to_json(sceneInfoStr)
    return sceneInfoStr
end

-- 微信H5支付
function GoldAddModule:buy_goods_wexinh5(id)
    local sceneInfoStr = {}
    local h5_info = {}
    sceneInfoStr.h5_info = h5_info
    if ModuleCache.GameManager.customOsType == 2 then
        h5_info.type = "IOS"
    else
        h5_info.type = "Android"
    end
    h5_info.app_name = "七星棋牌"
    h5_info.bundle_id = "com.qixingqipai.qixingqipai"

    sceneInfoStr = ModuleCache.GameUtil.table_encode_to_json(sceneInfoStr)

    print(sceneInfoStr)

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getWxH5PayUrl?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            productId = id,
            sceneInfo = sceneInfoStr,
            packageName = UnityEngine.Application.identifier
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            --local payTable = {}
            --payTable.appId = retData.data.order.app_id
            --payTable.partnerId = retData.data.order.partner_id
            --payTable.key = retData.data.order.key
            --payTable.payType = retData.data.order.wap_type
            --payTable.money = retData.data.order.money
            --payTable.pricePointDec = retData.data.order.subject
            --payTable.subject = self.goodsData.productName
            --payTable.sign = retData.data.order.sign
            --payTable.outTradeNo = retData.data.order.out_trade_no
            --print_table(payTable)

            --ModuleCache.WechatManager.common_recharge(payTable, function(errCode)
            --	if(errCode == 0 or errCode == "0")then
            --		print("I am in pay call back------------------------------------------")
            --		self.isBuySometing = true
            --
            --		ModuleCache.PayManager().getUserNewMessage()
            --	end
            --end)
            self:start_pay(retData.data)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end

        if (self.curPage == 1) then
            self:get_shop_server_data()
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
                    if (self.curPage == 1) then
                        self:get_shop_server_data()
                    end
                end
            end
        end
    end)
end

--发起支付
function GoldAddModule:start_pay(url)
    if ModuleCache.GameConfigProject.showPackage == "WebViewShop" then
        url = url .. "&webviewshop=true"
        local data = {
            link = url,
            showType = 0,
            hide = true
        }
        ModuleCache.ModuleManager.show_module("public", "webview", data);
    else
        UnityEngine.Application.OpenURL(url)
    end
    print("支付url:", url)
end


-- 新版本掌宜付购买房卡
function GoldAddModule:buy_goods_2(id, payType)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getZyPayParam?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            productId = id,
            wapType = payType,
            packageName = ModuleCache.UnityEngine.Application.identifier
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            local payTable = {}
            payTable.appId = retData.data.order.app_id
            payTable.partnerId = retData.data.order.partner_id
            payTable.key = retData.data.order.key
            payTable.payType = retData.data.order.wap_type
            payTable.money = retData.data.order.money
            payTable.pricePointDec = retData.data.order.subject
            payTable.subject = self.goodsData.productName
            payTable.sign = retData.data.order.sign
            payTable.outTradeNo = retData.data.order.out_trade_no
            print_table(payTable)

            ModuleCache.ModuleManager.show_public_module("netprompt")
            ModuleCache.WechatManager.common_recharge(payTable, function(errCode)

                if (errCode == 0 or errCode == "0") then

                    ModuleCache.PayManager().getUserNewMessage()
                    if self.view.goldLimit.todayExchange then
                        self.view.goldLimit.todayExchange = self.view.goldLimit.todayExchange + self.goodsData.num
                        self.view:showGoldLimit(self.view.goldLimit)
                    else
                        self:get_gold_limit()
                    end
                end
            end)
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

-- 初始版本微信 购买房卡
function GoldAddModule:buy_goods(id)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getWxPayParam?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            productId = id
        }
    }


    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if retData.data.payStatus == 1 then

                ModuleCache.PayManager().getUserNewMessage()
            else
                ModuleCache.WechatManager.recharge(retData.data.result, function(errCode)
                    if (errCode == 0 or errCode == "0") then

                        ModuleCache.PayManager().getUserNewMessage()
                    end
                end)
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




--获取标签数据
function GoldAddModule:GetDataFromServer_GetBigTabs()
    print("==获取数据:获取标签")
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl.."product/getShopingTabs?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData,"收到大标签数据")
        if retData.ret == 0 then
            for i = 1, #retData.data.list do
                if retData.data.list[i].type == 1 then --金币商城
                    self:GetDataFromServer_GetContent(retData.data.list[i].id, retData.data.list[i].tagList[1].id)
                end 
            end

        end
    end, function(errorData)
        print(errorData.error)
    end)
end

--通过标签ID 获取商城数据
function GoldAddModule:GetDataFromServer_GetContent(tabid, tagid, callBack)
    if tabid == nil or tagid == nil then return  end
    print("==Params_tabId="..tabid," Params_tagId="..tostring(tagid))
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl.."product/getProductByTabIdAndTagId?",
        showModuleNetprompt = true,
        params = {
            tabId = tabid,
            tagId = tagid,
            uid = self.modelData.roleData.userID,
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData,"收到内容数据")
        if retData.ret == 0 then
            if retData.data  then
                self.shopData = retData.data
                self.view:showShop(retData.data)
                if callBack ~= nil then  callBack(retData.data) end 
            end
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

-- function GoldAddModule:get_gold_limit()
--     local requestData = {
--         baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "product/getExchangeLimit?",
--         showModuleNetprompt = false,
--         params = {
--             uid = self.modelData.roleData.userID,
--             coinType = postId
--         }
--     }
--     self:http_get(requestData, function(wwwData)
--         local retData = ModuleCache.Json.decode(wwwData.www.text)
--         print_table(retData)
--         if retData.ret == 0 then
--             --local data = {}
--             --data.todayExchange = 100
--             --data.maxExchangeNum = 300
--             self.view:showGoldLimit(retData.data)
--         end
--     end, function(errorData)
--         print(errorData.error)
--     end)
-- end

-- 获取金币仓库初始数据
function GoldAddModule:get_store_data()

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/getGoldInfoAccount?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.curStoreData = retData.data
            self.view:refreshStore(self.curStoreData)
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

-- 取钱
function GoldAddModule:store_out(num)

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/userCoffersDecr?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            amount = num
        }
    }

    Util.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if retData.data then
                ModuleCache.PayManager().getUserNewMessage()
                self.curStoreData.goldAmount = self.curStoreData.goldAmount + num
                self.curStoreData.coffersAmount = self.curStoreData.coffersAmount - num
                self.view:refreshStore(self.curStoreData)
                self.view.inputOut.text = ""
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("取出失败！")
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


function GoldAddModule:on_destroy()
    --ModuleCache.GameManager.select_game_id(self.changeId)
end

return GoldAddModule



