local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class ShopModule : Module
---@field view ShopView
---@field shopView ShopView
local ShopModule = class("BullFight.ShopModule", ModuleBase)
local Util = Util
-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

-- 上一次购买的商品种类，钻石或者体力
local LASTBUYTYPE = "SHOPLASTBUYTYPE"

local otherConfig = {
    [1] = {id = 21, name = "充值记录"},
    [2] = {id = 24, name = "兑换记录"},
    [3] = {id = 22, name = "消费记录"},
    [4] = {id = 23, name = "赠送记录"},
}
function ShopModule:initialize(...)
    -- 开始初始化                view        model           模块数据
    ModuleBase.initialize(self, "shop_view", nil, ...)
end

-- 传入相应的ID转到相应的tag
function ShopModule:on_show(data)
    self.view:hide()
    self.view:update_game_name_info()
    if (ModuleCache.GameManager.iosAppStoreIsCheck) then
        local _s = {
            productName = "60体力",
            salePrice = 6,
            payType = 99,
            num = 60,
            type = 5,
            productId = "dahu_tili_60",
        }
        ModuleCache.PayManager().appstoreRecharge(_s)
        return
    end

    self.curPageType = 1
    --ModuleCache.ComponentUtil.SafeSetActive(self.shopView.toggles[1].gameObject, true)
    self.isBuySometing = false -- 是否在界面内购买(用以刷新记录信息)
    self.isSendSomting = false -- 是否在界面内赠送
    self.isUsedDefault = false
    if (data ~= nil) then
        if type(data) == "table" then
            self.curPageType = data.showpage
            self.isUsedDefault = data.isUsedDefault
             --if data.showpage == 5 or data.showpage == 2 then
             --    self.isUsedDefault = true
             --    local PlayerPrefsLASTBUYTYPE = ModuleCache.PlayerPrefsManager.GetInt(LASTBUYTYPE, 0)
             --    if PlayerPrefsLASTBUYTYPE ~= 0 then
             --        self.curPageType = PlayerPrefsLASTBUYTYPE
             --    end
             --end
        else
            self.curPageType = data
        end

        self.isSpecial = false

    else
        self.isSpecial = false
    end
    self.shopData = {}
    self.shopView:refresh_role_info(self.modelData.roleData)
    self:GetDataFromServer_GetBigTabs()
end

function ShopModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        self.shopView:refresh_role_info(self.modelData.roleData)
        if (eventData.msg) then
            if eventData.msgType == 6 then
                local msgDecode = ModuleCache.Json.decode(eventData.msg)
                if tostring(msgDecode.itemIdList[1]) == tostring(self.goodsData.itemVoList[1].itemId) then
                    self:dispatch_package_event("Event_Refresh_Bag_Red")
                end
            end
        end
    end)


    self:subscibe_package_event("Event_Package_Recharge_Success", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self.shopData[21] = nil --收到充值得数据后 需要重置下 重新请求充值数据
        self:get_page_data()
        if (self.curPage == 1) then
            self:get_shop_server_data()
        end
        if self.isAgents then
            self:GetDataFromServer_GetBigTabs(true)
        end 
    end)
    self:subscibe_package_event("Event_Package_Recharge_Fail", function(eventHead, eventData)
        if self.isHide then
            return
        end
        if (self.curPage == 1) then
            self:get_shop_server_data()
        end
    end)
end

--获取数据
function ShopModule:get_page_data()
    if self.btnData.type then
        self:GetDataFromServer_GetContent(self.curPage, self.tagId,  function(data)
            self:set_shop_data(data)
        end )
        return 
    end 
    if self.curPage == 21 then
        self:get_recharge_server_data()
    elseif self.curPage == 22 then
        self:get_consume_server_data()
    elseif self.curPage == 23 then
        self:get_give_server_data()
    elseif self.curPage == 24 then
        --兑换记录
        self:get_exchange_server_data()
    end
end

--刷新界面
function ShopModule:refresh_view()
    if self.btnData.type then
        self.shopView:showShopView(self.shopData[self.curPage][self.tagId], self.curPage, self.isBind, self.btnData)
    else
        self.shopView:showRecordView(self.shopData[self.curPage][self.tagId], self.curPage)
    end
end

function ShopModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    print(obj.name)
    if obj == self.shopView.buttonClose.gameObject then
        ModuleCache.ModuleManager.hide_module("public", "shop")
        self.curToggle.isOn = false
        if ModuleCache.ModuleManager.get_module("public", "hall") then
            ModuleCache.ModuleManager.get_module("public", "hall"):update_userinfo()
            self:dispatch_package_event("Event_Show_Hall_Anim")
            self.view:clear_all_time_event()
        end
    elseif obj.name == "BuyGoodsBtn" then
        local data = self.shopView:get_data(obj.transform.parent.gameObject)
        self.goodsData = data
        self.isBuyLibao = false
        if(data.payType == self.view.PayTypeByName.RedPacket and data.productType == 9) then
            --检查兑换授权的状态
            self:GetDataFromServer_CheckAuthMp(function()
                self:buy_goods_check(data)
            end)
        else
            self:buy_goods_check(data)
        end
    elseif obj.name == "ButtonConfirm" then
        self:bind_invite_code(self.curCode)
    elseif obj.name == "ButtonCancel" then
        self.shopView.bindInviteDialog:SetActive(false)
    elseif "ButtonBind" == obj.name then
        self:bind_cdk(self.shopView.inputFieldInviteCode.text)
    elseif obj == self.shopView.bindPanelEnter then
        self:bind_cdk(self.shopView.bindPanelInput.text)
    elseif obj.name == "BtnCloseLibao" then
        ModuleCache.ComponentUtil.SafeSetActive(self.view.libaoDlg, false)
    elseif obj.name == "BtnBuyLibao" then
        ModuleCache.ComponentUtil.SafeSetActive(self.view.libaoDlg, false)
        self.isBuyLibao = true
        self:buy_goods_check(self.goodsData)
    elseif obj.name == "BtnStore" then
        ModuleCache.ComponentUtil.SafeSetActive(self.view.buyCplt, false)
    elseif obj.name == "BtnUse" or obj.name == "BtnSendTo" then
        ModuleCache.ComponentUtil.SafeSetActive(self.view.buyCplt, false)
        local post = {}
        post.title = "兑换"
        local token, timestamp = Util.get_tokenAndTimestamp(self.modelData.roleData.userID)
        local gameName = ModuleCache.AppData.get_url_game_name();
        post.link = self.goodsData.itemVoList[1].exchangeUrl .. "&uid=" .. self.modelData.roleData.userID .. "&timestamp=" .. timestamp .. "&token=" .. token .. "&gameName=" .. gameName .. "&apiUrl=" .. Util.encodeURL(ModuleCache.GameManager.netAdress.httpCurApiUrl)
        ModuleCache.ModuleManager.show_module("public", "agentpage", post);
    elseif obj == self.view.bindPanelClose then
        self:on_close_bind_panel()
    elseif obj.transform.parent.gameObject == self.view.smalltabObj then 
        self.tagId = tonumber(obj.name)
        self.view:refresh_top_btn(self.tagId)
        if (self.shopData[self.curPage] == nil or self.shopData[self.curPage][self.tagId] == nil) then
            self:get_page_data()
        else
            self:refresh_view()
        end 
    elseif obj.name == "BtnCloseExchangeInstructionsDialog" then
        print("==点击关闭兑换说明界面")
        ModuleCache.ComponentUtil.SafeSetActive(self.view.ExchangeInstructionsDialog, false)
    elseif obj.name == "BtnWeiXinShare" then
        ModuleCache.ShareManager().shareImage(false, false, false);
        ModuleCache.WechatManager.onSendMessageToWXResp = function(data)
            self.view.ExchangeInstructionsDialog:SetActive(false);
            local retData = ModuleCache.Json.decode(data)
            if (retData.errCode == 0) then

            end
        end
    end
end



--关闭绑定界面
function ShopModule:on_close_bind_panel()
    if self.shopData[self.curPage] ~= nil then
        if self.isBind == false and self.shopData[self.curPage].isShopingBind then
            --关闭所有的界面
            self.view.bindPanel:SetActive(false)
            self:on_click(self.shopView.buttonClose.gameObject)
        else
            self.view.bindPanel:SetActive(false)
        end
    else
        self.view.bindPanel:SetActive(false)
    end
end

--绑定邀请码
function ShopModule:bind_cdk(inviteCode)
    if ((not inviteCode) or inviteCode == '') then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您输入的邀请码有误，请确认后重新输入")
        return
    end
    self.curCode = inviteCode
    self:get_invite_info(inviteCode)
end

function ShopModule:buy_goods_check(product)
    if product == nil or product.salePrice == nil then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("商品信息错误!")
        return
    end
    local payStr = ""
    if product.payType == self.view.PayTypeByName.RMB then
        self:is_agents_pay(product)
        return
    elseif product.payType == self.view.PayTypeByName.Diamond then
        --钻石
        payStr = "钻石"
        if self.modelData.roleData.cards == nil or self.modelData.roleData.cards < tonumber(product.salePrice) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("钻石不足，请充值钻石!")
            return
        end
    elseif product.payType == self.view.PayTypeByName.Stamina then
        --体力
        payStr = "体力"
        if self.modelData.roleData.coins == nil or self.modelData.roleData.coins < tonumber(product.salePrice) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("体力不足，请充值体力!")
            return
        end
    elseif product.payType == self.view.PayTypeByName.Ingot then
        --元宝
        payStr = "元宝"
        if self.modelData.roleData.ingot == nil or self.modelData.roleData.ingot < tonumber(product.salePrice) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("元宝不足，请充值元宝!")
            return
        end
    elseif product.payType == self.view.PayTypeByName.Coins then
        --铜钱
        payStr = "铜钱"
        if self.modelData.roleData.copper == nil or self.modelData.roleData.copper < tonumber(product.salePrice) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("铜钱不足，请兑换铜钱!")
            return
        end
    elseif product.payType == self.view.PayTypeByName.Gold then
        --金币
        payStr = "金币"
        if self.modelData.roleData.gold == nil or self.modelData.roleData.gold < tonumber(product.salePrice) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("金币不足，请兑换金币!")
            return
        end
    elseif product.payType == self.view.PayTypeByName.RedPacket then
        --红包券
        payStr = "红包券"
        if self.modelData.roleData.redPacket == nil or self.modelData.roleData.redPacket < tonumber(product.salePrice) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("红包券不足!")
            return
        end
    end
    local str = string.format("您确定用%s兑换%s吗", Util.filterPlayerGoldNum(tonumber(product.salePrice)) .. payStr, product.productName)
    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(str, function() 
        self.isBuySometing = true
        ModuleCache.PayManager().buy_gold(product.id, product.num, function()
            self.shopData[24] = nil --兑换成功后 重置下兑换记录 方便重新获取
            if product.isLimitNum then
                self.shopData[self.curPage][self.tagId] = nil
            end 
            self:refresh_view()
            self:get_page_data()
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("兑换成功")
            if product.itemVoList ~= nil and #product.itemVoList > 0  then
                local btnType = Util.split(product.itemVoList[1].itemButtonType, ",")
                for _, v in ipairs(btnType) do
                    if tonumber(v) == 4 then
                        local data = {
                            callBack = nil,
                            exchangeId = product.itemVoList[1].itemId,
                        }
                        ModuleCache.ModuleManager.show_public_module("goodsexchange", data)
                        return
                    end 
                end  
            end
        end)
    end)
end



-- 房卡商城数据获取
function ShopModule:get_shop_server_data()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/isBindInvite?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.view:show()
            self.shopData[1] = retData.data
            -- self.shopView:set_view(self.shopData, self.curPage)
            self:refresh_view()
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

--获取数据
function ShopModule:set_shop_data(retData)
    if self.shopData[self.curPage] == nil then 
        self.shopData[self.curPage] = {}
    end 
    if self.shopData[self.curPage][self.tagId] == nil then 
        self.shopData[self.curPage][self.tagId] = {}
    end 
    self.shopData[self.curPage][self.tagId] = retData
    self:refresh_view()
    
end

-- 充值记录数据获取
function ShopModule:get_recharge_server_data()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "rechargeHistory/page?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = 1,
            pageSize = 50,

        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.view:show()
            self.isBuySometing = false -- 获取了记录数据后重置
            self:set_shop_data(retData.data)
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

-- 消费记录数据获取
function ShopModule:get_consume_server_data()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "consumeHistory/page?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = 1,
            pageSize = 50,

        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.view:show()
            self:set_shop_data(retData.data)
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

-- 赠送记录数据获取
function ShopModule:get_give_server_data()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "giveHistory/page?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = 1,
            pageSize = 50,

        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.view:show()
            self:set_shop_data(retData.data)
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

function ShopModule:get_exchange_server_data()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "product/queryExchangeOrderPage?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            pageNum = 1,
            pageSize = 50,

        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.view:show()
            self:set_shop_data(retData.data)
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

function ShopModule:get_invite_info(inviteCode)
    print("inviteCode = " .. inviteCode)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getSysUserByInviteCode?",
        params = {
            uid = self.modelData.roleData.userID,
            inviteCode = inviteCode
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if retData.success ~= true then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您输入的邀请码有误，请确认后重新输入")
            self.shopView.inputFieldInviteCode.text = ""
        else
            self.view.bindPanel:SetActive(false)
            self.shopView.bindInviteDialog:SetActive(true)
            -- retData.data.headImg = nil
            self.shopView.bindInviteHeadImg.gameObject:SetActive(retData.data.headImg ~= nil)
            if retData.data.headImg then
                self.shopView.bindInviteNickTex.text = retData.data.realname
            else
                self.shopView.bindInviteNickTex.text = "" .. retData.data.realname
            end

            self.shopView.bindInviteInfoTex.text = "确认输入【<color=#B4381EFF>" .. retData.data.realname .. "</color>】的优惠码【<color=#B4381EFF>" .. inviteCode .. "</color>】？\n<color=#B4381EFF>确认后即可获得钻石赠送</color>"

            if retData.data.headImg then
                self:image_load_sprite(self.shopView.bindInviteHeadImg, retData.data.headImg)
                self.shopView.bindInviteNickTex.transform.localPosition = Vector3.New(14, self.shopView.bindInviteNickTex.transform.localPosition.y, self.shopView.bindInviteNickTex.transform.localPosition.z)
                self.shopView.bindInviteNickTex.alignment = UnityEngine.TextAnchor.MiddleLeft
            else
                self.shopView.bindInviteNickTex.transform.localPosition = Vector3.New(-212.9, self.shopView.bindInviteNickTex.transform.localPosition.y, self.shopView.bindInviteNickTex.transform.localPosition.z)
                self.shopView.bindInviteNickTex.alignment = UnityEngine.TextAnchor.MiddleCenter
            end
        end
    end, function(wwwErrorData)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(wwwErrorData.error)
    end)
end


-- 绑定邀请码
function ShopModule:bind_invite_code(inviteCode)

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/bindInvite?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            inviteCode = inviteCode
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 and retData.data then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("绑定邀请码成功")
            self.shopView.bindInviteDialog:SetActive(false)

            self.isBind = true
            self.shopView:showShopView(self.shopData[self.curPage][self.tagId], self.curPage, self.isBind, self.btnData)

            ModuleCache.PayManager().getUserNewMessage()
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

--代理支付
function ShopModule:is_agents_pay(goodsData)
    local intentData = {}
    if self.curPageType == 6 then
        intentData.receiverType = 2
        intentData.receiverId = self.modelData.roleData.userID
    end
    if self.isAgents and goodsData.payType == 99 then
        ModuleCache.PayManager().get_pay_type(goodsData, function(intentData)
            intentData.commissionAmount = self.commissionAmount
            -- 是否可以代理购买
            intentData.canAgentsBuy = true
            --self.view:show_agents_pay(goodsData, self.commissionAmount, share)

            ModuleCache.ModuleManager.show_module("public", "shoppaytype", intentData)
        end, nil, intentData)

    else
        self.isBuySometing = true

        ModuleCache.PayManager().get_pay_type(goodsData, nil, nil, intentData)
    end
end

function ShopModule:on_hide()
    if ModuleCache.ModuleManager.get_module("public", "shoppaytype") then
        ModuleCache.ModuleManager.hide_module("public", "shoppaytype")
    end
end

--获取标签数据
function ShopModule:GetDataFromServer_GetBigTabs(isupdateAmount)
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
           
            self.commissionAmount = retData.data.commisionAccount --代理佣金
            if not isupdateAmount then
                self.bigtabdatas = retData.data.list
                --self.view:RefreshBigTabList(retData.data.list)
                self.isAgents = retData.data.isAgent
                self.isBind = retData.data.isBind
                --获取默认标签 2 钻石 和 5 体力 需要去看下 是否有默认商城
                if self.isUsedDefault then
                    for i = 1, #self.bigtabdatas do
                        -- if retData.data.defaultShop == 1 or retData.data.defaultShop == 2 or retData.data.defaultShop == 3 or retData.data.defaultShop == 6 then
                        if self.bigtabdatas[i].isDefault then
                            self.curPageType = self.bigtabdatas[i].type
                            break
                        end 
                    end
                end 
                
                for i = 1, #otherConfig do
                    self.bigtabdatas[#self.bigtabdatas + 1] = otherConfig[i]
                end
                self.view:init_toggle(self.bigtabdatas)
                self:register_toggle_event()
                self.view:show()
            end
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

--通过标签ID 获取商城数据
function ShopModule:GetDataFromServer_GetContent(tabid, tagid, callBack)
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
            --去掉代理商品 和小游戏商品
            if retData.data  then
                if callBack ~= nil then  callBack(retData.data) end 
            end
            
            self:refresh_view()
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

--注册按钮事件
function ShopModule:register_toggle_event()
    for k, v in ipairs(self.bigtabdatas) do
        local toggleObj = self.view.toggleItems[k]
        local panelType = v.type == nil and v.id or 1
        toggleObj.Toggles.onValueChanged:RemoveAllListeners()
        toggleObj.Toggles.onValueChanged:AddListener(function()
            if (toggleObj.Toggles.isOn) then
                for i = 1, #self.view.contentItems do
                    self.view.contentItems[i]:SetActive(false)
                end
                self.curPage = v.id
                self.tagId = v.tagList == nil and 1 or  v.tagList[1].id
                self.btnData = v
                self.curPageType = v.type == nil and v.id or v.type
                self.curToggle = toggleObj.Toggles
                toggleObj.Switchers:SwitchState("isOn")
                self.view.panelTable[panelType]:SetActive(true)
                if v.tagList ~= nil and #v.tagList > 1 then --需要优化的地方
                    self.view.smalltabObj:SetActive(true)
                    self.view:refresh_top_btn(self.tagId)
                else
                    self.view.smalltabObj:SetActive(false)
                end 
                -- 若无数据更新则选择不重新获取服务器数据
                if (self.shopData[v.id] == nil or self.shopData[v.id][self.tagId] == nil) then
                    self:get_page_data()
                else
                    if (self.curPage == 21) and self.isBuySometing then
                        self.isBuySometing = false
                        self:get_page_data()
                    elseif self.curPage == 23 and self.isSendSomting then
                        self:get_page_data()
                    else
                        self:refresh_view()
                    end
                end     
            else
                toggleObj.Switchers:SwitchState("isOff")
                self.view.panelTable[panelType]:SetActive(false)
            end
        end)
    end
    for k, v in ipairs(self.bigtabdatas) do
        self.shopData[v.id] = nil
        self.view.toggleItems[k].Toggles.isOn = false
        local showType = v.type == nil and v.id or v.type
        if (showType == self.curPageType) then
            self.view.toggleItems[k].Toggles.isOn = true
        end
    end
    self.view:setToggleScroll()
end


function ShopModule:GetDataFromServer_CheckAuthMp(AuthorizationCallBack)
    print("==获取数据:授权数据")
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .."activity/checkAuthMp?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData,"收到授权数据")
        if retData.ret == 0 then
            if(retData.data) then
                if(retData.data.geted) then
                    print("==已经授权")
                    if(AuthorizationCallBack) then
                        AuthorizationCallBack()
                    end
                else
                    print("==没有授权")
                    local url = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getQrCode?url=" ..Util.encodeURL(retData.data.result);
                    ModuleCache.ComponentUtil.SafeSetActive(self.view.ExchangeInstructionsDialog,true)
                    self.view:Refresh_WeiXinShareQR(url)
                end
            end
        end
    end, function(errorData)
        print(errorData.error)
    end)
end




return ShopModule



