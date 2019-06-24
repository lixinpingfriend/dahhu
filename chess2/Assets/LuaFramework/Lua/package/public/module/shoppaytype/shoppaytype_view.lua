
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
---@class ShopPayTypeView
local ShopPayTypeView = Class('ShopPayTypeView', View)

local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local TableUtil = TableUtil
function ShopPayTypeView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/shop/public_windowshoppaytype.prefab", "Public_WindowShopPayType", 1)
    View.set_1080p(self)
    self._lastScale = self.root.transform.localScale
    --self.tiliNumText = GetComponentWithPath(self.root, "Center/TiliCard/TextNum", ComponentTypeName.Text)
    --self.itemObj = GetComponentWithPath(self.root, "Center/Panels/1/Scroll/Viewport/Content/Item", ComponentTypeName.Transform).gameObject
    --self.itemObj:SetActive(false)
    --self.content = GetComponentWithPath(self.root, "Center/Panels/1/Scroll/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.uiStateSwitcher = GetComponentWithPath(self.root, "PayTypeSelect", "UIStateSwitcher")
    self.textBuygoodName = GetComponentWithPath(self.root, "Background/Title/Text", ComponentTypeName.Text)
    self.goPanelAgent =ModuleCache.ComponentManager.Find(self.root, "PanelAgent")
    self.textAgencybalance = GetComponentWithPath(self.root, "PanelAgent/YjPayPanel/PayTips", ComponentTypeName.Text)
    self.textAgentsPayCount = GetComponentWithPath(self.root, "PanelAgent/WxPayPanel/PayCount", ComponentTypeName.Text)
    self.toggleAgencyIsChoose = GetComponentWithPath(self.root, "PanelAgent/YjPayPanel/ToggleChoose", ComponentTypeName.Toggle)
    self.toggleAgencyIsChoose.onValueChanged:AddListener(function (state)
        self:on_toggle_agency_state_change(state)
    end)

    local on_toggle_paytypes_change = function(state)
        if state then
            self:_on_toggle_paytypes_change()
        end
    end


    local togglePayTypes = {}
    --微信原生
    togglePayTypes["1_1"] = {toggle = GetComponentWithPath(self.root, "PayTypeSelect/1_1", ComponentTypeName.Toggle), show = false}
    -- 微信H5
    togglePayTypes["2_1"] = {toggle = GetComponentWithPath(self.root, "PayTypeSelect/2_1", ComponentTypeName.Toggle),  show = false}
    -- 支付宝H5
    togglePayTypes["2_2"] = {toggle = GetComponentWithPath(self.root, "PayTypeSelect/2_2", ComponentTypeName.Toggle),  show = false}
    -- 微信公众号，分享链接
    togglePayTypes["3_5"] = {toggle = GetComponentWithPath(self.root, "PayTypeSelect/3_5", ComponentTypeName.Toggle),  show = false}
    -- 微信小程序打开
    togglePayTypes["4_12"] = {toggle = GetComponentWithPath(self.root, "PayTypeSelect/4_12", ComponentTypeName.Toggle),  show = false}

    --togglePayTypes["30"] = {go = GetComponentWithPath(self.root, "PayTypeSelect/30", ComponentTypeName.Toggle), show = false}
    --togglePayTypes["6"] = {GetComponentWithPath(self.root, "PayTypeSelect/6", ComponentTypeName.Toggle)}
    --togglePayTypes["7"] = GetComponentWithPath(self.root, "PayTypeSelect/7", ComponentTypeName.Toggle)
    self.togglePayTypesPrefabs = togglePayTypes

    for i, v in pairs(self.togglePayTypesPrefabs) do
        v.toggle.onValueChanged:AddListener(on_toggle_paytypes_change)
        v.toggle.gameObject:SetActive(false)
        v.toggle.isOn = false
    end

    self.textButtonPay = GetComponentWithPath(self.root, "ButtonPay/Text", ComponentTypeName.Text)
end

function ShopPayTypeView:on_toggle_agency_state_change(state)
    self:show_agents_pay()
end

function ShopPayTypeView:init_with(data)
    self.data = data
    self.textBuygoodName.text = data.goodsData.productName

    -- 郁闷，挪到上面就好了
    if data.canAgentsBuy then
        self.goPanelAgent:SetActive(true)
        self:show_agents_pay(data)
        self.uiStateSwitcher:SwitchState("Agent")
    else
        self.goPanelAgent:SetActive(false)
        self.uiStateSwitcher:SwitchState("Normal")
    end

    if self.togglePayTypes then
        for i, v in pairs(self.togglePayTypesPrefabs) do
            v.toggle.gameObject:SetActive(false)
            v.toggle.isOn = false
            v.show = false
        end

        for i, v in pairs(self.togglePayTypes) do
            v.toggle.gameObject:SetActive(false)
            v.toggle.isOn = false
            v.show = false
        end
    end


    --for i, v in pairs(self.togglePayTypes) do
    --    v.gameObject:SetActive(false)
    --    v.isOn = false
    --end

    self.togglePayTypes = {}
    for i = 1, #data.payTypeDatas do
        local key = data.payTypeDatas[i].showType .. "_" .. data.payTypeDatas[i].wapType
        local targetGo
        local targetToggle
        if not self.togglePayTypesPrefabs[key].show then
            targetToggle = self.togglePayTypesPrefabs[key].toggle
            targetGo = targetToggle.gameObject
            self.togglePayTypesPrefabs[key].show = true
        else
            targetGo = ModuleCache.ComponentUtil.InstantiateLocal(self.togglePayTypesPrefabs[key].toggle.gameObject, self.togglePayTypesPrefabs[key].toggle.gameObject.transform.parent.gameObject)
            targetToggle = ModuleCache.ComponentManager.GetComponent(targetGo, ComponentTypeName.Toggle)
        end

        key = i .. "_" .. key
        targetGo.name = key
        self.togglePayTypes[i] = {toggle = targetToggle, index = i }
        targetGo:SetActive(true)
    end



    local selectPayTypeTmp = 1
    print_table(self.togglePayTypes, selectPayTypeTmp)
    if self.selectPayTypeDatasIndex and self.togglePayTypes[self.selectPayTypeDatasIndex].toggle.gameObject.activeSelf then
        selectPayTypeTmp = self.selectPayTypeDatasIndex
    end
    self.togglePayTypes[selectPayTypeTmp].toggle.isOn = true

    self:_on_toggle_paytypes_change()


end

function ShopPayTypeView:get_on_toggle_paytype_index()
    for i, v in pairs(self.togglePayTypes) do
        if v.toggle.isOn then
            self.selectPayTypeDatasIndex = v.index
            return v.index
        end
    end
    return -1
end

function ShopPayTypeView:_on_toggle_paytypes_change()
    local payType = self:get_on_toggle_paytype_index()
    if self.data.payTypeDatas[payType].showType  == "3" then  -- 6为微信链接分享支付
        if self.data.canAgentsBuy then
            self:show_agents_pay()
        else
            self.textButtonPay.text = "分享支付链接"
        end
    else
        self.textButtonPay.text = "确认支付"
    end
end
function ShopPayTypeView:get_real_price()
    local price = self.goodsData.salePrice and self.goodsData.salePrice or self.goodsData.productPrice
    local discounts = self.view.agencyIsChoose.activeSelf and self.commissionAmount or 0

    local realPrice = price - discounts
    return Util.GetPreciseDecimal(realPrice, 2)
end


--显示代理
function ShopPayTypeView:show_agents_pay()
    local data = self.data
    self.textAgencybalance.text = "可用余额: " .. data.commissionAmount .. "元"
    local price = data.goodsData.salePrice and data.goodsData.salePrice or data.goodsData.productPrice
    local discounts = self.toggleAgencyIsChoose.isOn and data.commissionAmount or 0
    self.agentsPayRealPrice = Util.GetPreciseDecimal(price - discounts, 2)
    -- 是否选择了佣金支付
    self.isSelectAgentPay = self.toggleAgencyIsChoose.isOn
    self.textAgentsPayCount.text = ((price - discounts) < 0 and 0 or self.agentsPayRealPrice) .. "元"
    print(self.selectPayTypeDatasIndex)
    if price - discounts > 0 and self.selectPayTypeDatasIndex then
        if data.payTypeDatas[self.selectPayTypeDatasIndex].showType  == 3  then
            self.textButtonPay.text = "分享支付链接"
        else
            self.textButtonPay.text = "确认支付"
        end
        --self.agencyPayBtn:SetActive(not data.payType == 6)
        --self.agencySharePayBtn:SetActive(data.payType == 6)
    else
        self.textButtonPay.text = "确认支付"
        --self.agencyPayBtn:SetActive(true)
        --self.agencySharePayBtn:SetActive(false)
    end

end

function ShopPayTypeView:set_root_scale(factor)
    self.root.transform.localScale = self._lastScale * factor
end

return ShopPayTypeView