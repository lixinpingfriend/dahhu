




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local GoldAddView = Class('goldAddView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName

local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

function GoldAddView:initialize(...)
    -- 初始View 
    View.initialize(self, "public/module/goldadd/public_windowgoldadd.prefab", "Public_WindowGoldAdd", 1)
    GoldAddView.set_1080p(self)

    -- buttons
    self.btnClose        =  GetComponentWithPath(self.root, "Title/closeBtn",                    ComponentTypeName.Button)
    self.btnStoreout     =  GetComponentWithPath(self.root, "Center/Right/OutBtn",               ComponentTypeName.Button)
    self.btnOutMax       =  GetComponentWithPath(self.root, "Center/Right/OutMaxBtn",            ComponentTypeName.Button)

    -- inputs
    self.inputOut        =  GetComponentWithPath(self.root, "Center/Right/OutGoldInput",         ComponentTypeName.InputField)

    -- card
    self.textOwnTiliNum  = GetComponentWithPath(self.root, "Title/TiliCard/TextNum",             ComponentTypeName.Text)
    self.storeTextNum    =  GetComponentWithPath(self.root, "Center/Right/txtGold",              ComponentTypeName.Text)

    self.slider          = GetComponentWithPath(self.root,"Center/Left/PanelCool/Slider",        ComponentTypeName.Slider)
    self.sliderText      = GetComponentWithPath(self.root,"Center/Left/PanelCool/Slider/Text",   ComponentTypeName.Text)

    self.content         = GetComponentWithPath(self.root,"Center/Left/Scroll/Viewport/Content", ComponentTypeName.Transform)
    self.cloneObj        = GetComponentWithPath(self.root,"Center/Left/ItemPrefabHolder/Item",   ComponentTypeName.Transform).gameObject
    self.noneTips        = GetComponentWithPath(self.root,"Center/Left/NoneTips",                ComponentTypeName.Transform).gameObject

    self.selectPayDialog = GetComponentWithPath(self.root,"SelectPayDialog",                     ComponentTypeName.Transform).gameObject
    self.btnAli          = GetComponentWithPath(self.selectPayDialog,"Center/BtnAli",            ComponentTypeName.Button)
    self.btnWechat       = GetComponentWithPath(self.selectPayDialog,"Center/BtnWechat",         ComponentTypeName.Button)
    self.btnPayClose     = GetComponentWithPath(self.selectPayDialog,"Center/BtnClosePay",       ComponentTypeName.Button)

end

function GoldAddView:showShop(data)
    -- self.isBindInvite = data.isBindInvite

    -- if(data.isBindInvite) then
    --     self:setShopScroll(data.discountProducts)
    -- else
    --     self:setShopScroll(data.products)
    -- end
    self:setShopScroll(data)
end

function GoldAddView:setShopScroll(productData)
    self.products = productData
    local content = self.content
    local noneTips = self.noneTips
    local cloneObj = self.cloneObj
    local contents = TableUtil.get_all_child(content)

    for i=1,#contents do
        ComponentUtil.SafeSetActive(contents[i], false)
    end
    for i=1,#self.products do
        local obj = nil
        local item = {}
        if(i<=#contents) then
            obj = contents[i]
        else
            obj = TableUtil.clone(cloneObj,content.gameObject,Vector3.zero)
        end
        obj.name = i .. ""
        ComponentUtil.SafeSetActive(obj, true)
        item.gameObject = obj
        item.data = self.products[i]
        self:fillShopItem(item, i)
    end
    ComponentUtil.SafeSetActive(noneTips, #self.products <= 0)
end

function GoldAddView:fillShopItem(item, index)
    local data = item.data
    local textRoomCardNum = GetComponentWithPath(item.gameObject, "NumLbl", ComponentTypeName.Text)
    local textRoomCardNumLeft = GetComponentWithPath(item.gameObject, "NumLbl_Left", ComponentTypeName.Text)
    local textPrice = GetComponentWithPath(item.gameObject, "Price/NumText", ComponentTypeName.Text)
    local buttonBuy = GetComponentWithPath(item.gameObject, "BuyGoodsBtn", ComponentTypeName.Button)
    local buttonBg = GetComponentWithPath(item.gameObject, "BuyGoodsBtn/bg", ComponentTypeName.Transform).gameObject
    local buttonBgDisable = GetComponentWithPath(item.gameObject, "BuyGoodsBtn/bgDisable", ComponentTypeName.Transform).gameObject
    local goods = GetComponentWithPath(item.gameObject, "goods", ComponentTypeName.Transform).gameObject
    local name2 = GetComponentWithPath(item.gameObject, "TextName2", ComponentTypeName.Text)
    local name3 = GetComponentWithPath(item.gameObject, "TextName3", ComponentTypeName.Text)

    local limitPanel = GetComponentWithPath(item.gameObject, "Limit", ComponentTypeName.Transform).gameObject
    local limitText = GetComponentWithPath(item.gameObject, "Limit/Text", ComponentTypeName.Text)

    local uiState = GetComponentWithPath(item.gameObject, "Limit", "UIStateSwitcher")
    ComponentUtil.SafeSetActive(limitPanel, false)

    if(data.isLimitNum or data.isLimitTime) then
        -- 先判断字段 若服务器没有同步到所有玩法，也不至于游戏崩溃
        ComponentUtil.SafeSetActive(limitPanel, (data.isLimitNum or isLimitTime))
        if(data.isLimitNum)then
            uiState:SwitchState("Num")
        end
        if(data.isLimitTime) then
            uiState:SwitchState("Time")
            local curTime = os.time()
            local endTime = self:getDateByString(data.activityEndTime)
            if endTime then
                local sec = tonumber(endTime) - tonumber(curTime)
                ComponentUtil.SafeSetActive(limitPanel, sec > 0)
                if(sec > 0) then
                    self:subscibe_time_event(sec, false, 1):OnUpdate(function(t)
                        t = t.surplusTimeRound
                        limitText.text = self:getTimeString(t)
                    end):OnComplete(function(...)
                        ModuleCache.ModuleManager.get_module("public","shop"):get_shop_server_data()
                    end)
                end
            end

        end
    end

    name2.text = ""
    name3.text = ""
    self:clearGoods(goods)
    if(index > 6) then index = 6 end
    local goodsIndex = index
    if(string.find(data.productName,"体力"))then
        goodsIndex = goodsIndex + 6
    elseif(string.find(data.productName,"金币"))then
        if data.num >= 50000 then
            goodsIndex = 6
        elseif data.num >= 20000  then
            goodsIndex = 5
        elseif data.num >= 10000  then
            goodsIndex = 4
        elseif data.num >= 5000  then
            goodsIndex = 3
        elseif data.num >= 2000  then
            goodsIndex = 2
        else
            goodsIndex = 1
        end
    end

    local goodsItem = GetComponentWithPath(goods, "goods"..goodsIndex, ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(goodsItem, true)

    --local goExtenal = GetComponentWithPath(item.gameObject, "Title/Extenal", ComponentTypeName.Transform).gameObject
    --local textExtenalRoomCardNum = GetComponentWithPath(goExtenal, "numLbl", ComponentTypeName.Text)
    --local diamon = GetComponentWithPath(goExtenal, "icon1", ComponentTypeName.Transform).gameObject
    --local tili = GetComponentWithPath(goExtenal, "icon2", ComponentTypeName.Transform).gameObject

    --goExtenal:SetActive(data.giveNum > 0)
    --if(data.giveType) then
    --    if(data.giveType == 2) then
    --        ComponentUtil.SafeSetActive(diamon, false)
    --        ComponentUtil.SafeSetActive(tili, true)
    --    else
    --        ComponentUtil.SafeSetActive(diamon, true)
    --        ComponentUtil.SafeSetActive(tili, false)
    --    end
    --
    --end
    --
    --textExtenalRoomCardNum.text = data.giveNum .. ''

    textRoomCardNum.text = data.productName .. ""
    textPrice.text = "￥" .. data.productPrice
    if data.payType == 1 then
        textPrice.text = data.productPrice.."钻石"
    elseif data.payType == 2 then
        textPrice.text = data.productPrice.."体力"
    end

    buttonBuy.interactable = false
    local cantBuy = GetComponentWithPath(item.gameObject, "cantBuy", ComponentTypeName.Transform).gameObject
    if self.goldLimit then
        local isOverBuy = data.num + self.goldLimit.todayExchange > self.goldLimit.maxExchangeNum
        buttonBuy.interactable = not isOverBuy
        ComponentUtil.SafeSetActive(cantBuy, isOverBuy)
    end
end

function GoldAddView:clearGoods(goods)
    for i=1,12 do
        local obj = GetComponentWithPath(goods, "goods"..i, ComponentTypeName.Transform).gameObject
        ComponentUtil.SafeSetActive(obj, false)
    end
end

function GoldAddView:showGoldLimit(data)

    self.goldLimit = data
    self.sliderText.text = data.todayExchange.."/"..data.maxExchangeNum
    self.slider.value = data.todayExchange/data.maxExchangeNum
    self:setShopScroll(self.products)
end

function GoldAddView:refreshStore(goldData)
    --self.goldTextNum.text = goldData.goldAmount
    self.storeTextNum.text = goldData.coffersAmount
end

function GoldAddView:refreshTili(data)
    if data.coins then
        self.textOwnTiliNum.text = data.coins
    else
        self.textOwnTiliNum.text = 0
    end
end

function GoldAddView:get_data(obj)
    return self.products[tonumber(obj.name)]
end

return GoldAddView