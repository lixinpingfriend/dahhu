
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance

local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
---@class GoldExchangeView
local GoldExchangeView = class('baseTableView', View)

local Util = Util

function GoldExchangeView:initialize(...)
    View.initialize(self, "public/module/goldexchange/public_windowgoldexchange.prefab", "Public_WindowGoldExchange", 2)

    self.goExchangeWindow = GetComponentWithPath(self.root, "ExchangeWindow", ComponentTypeName.Transform).gameObject
    self.textExchangeTitle = GetComponentWithPath(self.goExchangeWindow, "Background/Title/TextTitle", ComponentTypeName.Text)
    self.textExchangeContent = GetComponentWithPath(self.goExchangeWindow, "Content", ComponentTypeName.Text)
    self.buttonExchange = GetComponentWithPath(self.goExchangeWindow, "ButtonExchange", ComponentTypeName.Button)
    self.buttonRecharge = GetComponentWithPath(self.goExchangeWindow, "ButtonRecharge", ComponentTypeName.Button)
    self.textGooldsNum = GetComponentWithPath(self.goExchangeWindow, "Goods/num", ComponentTypeName.Text)
    self.imageExchangeGoodsIcon = GetComponentWithPath(self.goExchangeWindow, "Goods/icon", ComponentTypeName.Image)

    self.goResultWindow= GetComponentWithPath(self.root, "ResultWindow", ComponentTypeName.Transform).gameObject
    self.textResultContent = GetComponentWithPath(self.goResultWindow, "Content", ComponentTypeName.Text)
    self.imageResultGoodsIcon = GetComponentWithPath(self.goResultWindow, "Goods/icon", ComponentTypeName.Image)
    self.spriteHolder = GetComponentWithPath(self.root, "holder", 'SpriteHolder')

end

function GoldExchangeView:show_exchange_window(show, isNumNotEnough, productType, payType, iconSprite, moneyNum, productNum, nextProductType, nextProductNum)
    show = show or false
    ModuleCache.ComponentUtil.SafeSetActive(self.goExchangeWindow, show)
    if(not show)then
        return
    end
    local productName = self:get_product_name(productType)
    local productPayName = self:get_pay_name(payType)

    local nextProductName = self:get_product_name(nextProductType)

    if(isNumNotEnough)then
        self.textExchangeTitle.text = string.format('%s不足', productName)
    else
        self.textExchangeTitle.text = string.format('兑换%s', productName)
    end

    if(payType == 99)then
        if(nextProductName)then
            self.textExchangeContent.text = string.format('是否前往充值<color=#FF821DFF>%d</color>%s', productNum, productName)
        else
            self.textExchangeContent.text = string.format('是否前往充值<color=#FF821DFF>%d</color>%s，充值后将自动为您兑换<color=#FF821DFF>%d</color>%s',productNum, productName, nextProductNum, nextProductName)
        end

    else
        if(nextProductName and nextProductName ~= '')then
            self.textExchangeContent.text = string.format('<color=#FF821DFF>%d</color>%s兑换<color=#FF821DFF>%d</color>%s，兑换后将自动为您兑换<color=#FF821DFF>%d</color>%s', moneyNum, productPayName, productNum, productName, nextProductNum, nextProductName)
        else
            self.textExchangeContent.text = string.format('<color=#FF821DFF>%d</color>%s兑换<color=#FF821DFF>%d</color>%s', moneyNum, productPayName, productNum, productName)
        end

    end
    self.textGooldsNum.text = productNum
    self.imageExchangeGoodsIcon.sprite = iconSprite
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonExchange.gameObject, payType ~= 99)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonRecharge.gameObject, payType == 99)
end

function GoldExchangeView:show_result_window(show, content, iconSprite)
    show = show or false
    ModuleCache.ComponentUtil.SafeSetActive(self.goResultWindow, show)
    if(not show)then
        return
    end
    self.textResultContent.text = content
    self.imageResultGoodsIcon.sprite = iconSprite
end

function GoldExchangeView:get_product_name(productType)
    local productName = ''
    if(productType == 2)then
        productName = '钻石'
    elseif(productType == 5)then
        productName = '体力'
    elseif(productType == 1)then
        productName = '金币'
    elseif(productType == 3)then
        productName = '道具'
    end
    return productName
end

function GoldExchangeView:get_pay_name(payType)
    local productPayName = ''
    if(payType == 1)then
        productPayName = '钻石'
    elseif(payType == 2)then
        productPayName = '体力'
    elseif(payType == 3)then
        productPayName = '元宝'
    elseif(payType == 4)then
        productPayName = '铜钱'
    elseif(payType == 5)then
        productPayName = '金币'
    elseif(payType == 99)then
        productPayName = ''
    end
    return productPayName
end


return  GoldExchangeView