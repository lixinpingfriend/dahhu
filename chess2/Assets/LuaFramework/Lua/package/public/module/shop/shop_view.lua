
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
---@class ShopView
local ShopView = Class('shopView', View)

local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local Util = Util
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

function ShopView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/shop/public_windowshop.prefab", "Public_WindowShop", 1)
    View.set_1080p(self)
    --支付类型
    self.PayTypeByName = {
        Diamond = 1, --钻石
        Stamina = 2, --体力
        Ingot = 3, --元宝
        Coins = 4, --铜钱
        Gold = 5, --金币
        RedPacket = 7, -- 红包
        RMB = 99, -- 人民币
    }
    self.buttonClose = GetComponentWithPath(self.root, "Top/TopLeft/closeBtn", ComponentTypeName.Button)
    self.toggleScroll = GetComponentWithPath(self.root, "Center/Toggles/Scroll", ComponentTypeName.ScrollRect)
    self.toggleContent = GetComponentWithPath(self.root, "Center/Toggles/Scroll/Viewport/Content", ComponentTypeName.RectTransform)

	self.tranBackGround = GetComponentWithPath(self.root, "BaseBackground", ComponentTypeName.Transform)
	self.tranCenter = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform)
	self:fixed_tran_size(self.tranBackGround)
	self:fixed_tran_size(self.tranCenter)

    -- BindCode  钻石
    self.objInviteCode = GetComponentWithPath(self.root, "Top/PanelBindInviteCodePrompt", ComponentTypeName.Transform).gameObject
    self.buttonBindInviteCode = GetComponentWithPath(self.objInviteCode, "ButtonBind", ComponentTypeName.Button)
    self.inputFieldText = GetComponentWithPath(self.objInviteCode, "InputFieldInviteCode/Placeholder", ComponentTypeName.Text)
    self.inputFieldInviteCode = GetComponentWithPath(self.objInviteCode, "InputFieldInviteCode", ComponentTypeName.InputField)

    self.cashTileText = GetComponentWithPath(self.root, "Center/Panels/1/InfoImg/TextInfoEx (2)", ComponentTypeName.Text)

    -- 已弃用的text
    self.bindInfoText = GetComponentWithPath(self.root, "Center/TextBindInfo", ComponentTypeName.Text)

    -- Top TextInfo
    --self.textInfo = GetComponentWithPath(self.root, "Top/Child/TextInfo", ComponentTypeName.Text)

    -- Bottom TextInfo
    self.textInfoEx = GetComponentWithPath(self.root, "Top/TopLeft/TextInfoEx", ComponentTypeName.Text)

    -- roomCard
    self.diamondObj = GetComponentWithPath(self.root, "Top/TopRight/RoomCard", ComponentTypeName.Transform).gameObject
    self.goldObj = GetComponentWithPath(self.root, "Top/TopRight/GoldCard", ComponentTypeName.Transform).gameObject
    self.redPacketObj = GetComponentWithPath(self.root, "Top/TopRight/RedCard", ComponentTypeName.Transform).gameObject
    self.textOwnRoomCardNum = GetComponentWithPath(self.root, "Top/TopRight/RoomCard/TextNum", ComponentTypeName.Text)
    self.textOwnTiliNum = GetComponentWithPath(self.root, "Top/TopRight/TiliCard/TextNum", ComponentTypeName.Text)
    self.textOwnGoldNum = GetComponentWithPath(self.root, "Top/TopRight/GoldCard/TextNum", ComponentTypeName.Text)
    self.textOwnRedNum = GetComponentWithPath(self.root, "Top/TopRight/RedCard/TextNum", ComponentTypeName.Text)

    --确认绑定界面
    self.bindInviteDialog = GetComponentWithPath(self.root, "BindInviteDialog", ComponentTypeName.Transform).gameObject
    self.bindInviteHeadImg = GetComponentWithPath(self.root, "BindInviteDialog/Center/Avatar/headImg", ComponentTypeName.Image)
    self.bindInviteNickTex = GetComponentWithPath(self.root, "BindInviteDialog/Center/nickTex", ComponentTypeName.Text)
    self.bindInviteInfoTex = GetComponentWithPath(self.root, "BindInviteDialog/Center/TextTipInfo", ComponentTypeName.Text)

    self.spriteAtlas = GetComponentWithPath(self.root, "Center/Panels", "SpriteHolder")


    self.slider = GetComponentWithPath(self.root, "Center/Panels/5/PanelCool/Slider", ComponentTypeName.Slider)
    self.sliderText = GetComponentWithPath(self.root, "Center/Panels/5/PanelCool/Slider/Text", ComponentTypeName.Text)


    --强制绑定邀请码
    self.bindPanel = GetComponentWithPath(self.root, "BindPanel", ComponentTypeName.Transform).gameObject
    self.bindPanelInput = GetComponentWithPath(self.bindPanel, "Center/Input", ComponentTypeName.InputField)
    self.bindPanelEnter = GetComponentWithPath(self.bindPanel, "Center/BtnOK", ComponentTypeName.Transform).gameObject
    self.bindPanelClose = GetComponentWithPath(self.bindPanel, "Center/BtnClose", ComponentTypeName.Transform).gameObject

    -- 钻石商城的显示区域需要动态改变
    self.dimScroll = GetComponentWithPath(self.root, "Center/Panels/1/Scroll", ComponentTypeName.RectTransform)
    self.tiliScroll = GetComponentWithPath(self.root, "Center/Panels/2/Scroll", ComponentTypeName.RectTransform)

    local panels = TableUtil.get_all_child(GetComponentWithPath(self.root, "Center/Panels", ComponentTypeName.Transform))
    self.panelTable = {}
    for k, v in ipairs(panels) do
        self.panelTable[tonumber(v.name)] = GetComponentWithPath(self.root, "Center/Panels/" .. v.name, ComponentTypeName.Transform).gameObject
    end
    self.contentItems = {}
    self.content = GetComponentWithPath(self.panelTable[1].gameObject, "Scroll/Viewport/Content", ComponentTypeName.Transform)
    self.cloneObj = GetComponentWithPath(self.panelTable[1].gameObject, "ItemPrefabHolder/Item", ComponentTypeName.Transform).gameObject
    self.cloneObj:SetActive(false)

    self.imageGameIcon = GetComponentWithPath(self.root, "Top/GameInfo/ImageGameIcon", ComponentTypeName.Image)
    self.textGameName = GetComponentWithPath(self.root, "Top/GameInfo/Text", ComponentTypeName.Text)

	self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)

    --self.textInfo.gameObject:SetActive(false)
    self.textInfoEx.gameObject:SetActive(false)
    self.bindInviteDialog:SetActive(false)
    --兑换授权弹框
    self.ExchangeInstructionsDialog = GetComponentWithPath(self.root,"ExchangeInstructionsDialog", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(self.ExchangeInstructionsDialog, false)
    self.WeiXinShareQR = GetComponentWithPath(self.root,"ExchangeInstructionsDialog/Center/WeiXinShareQR", ComponentTypeName.Image)

    self.toggleItems = {}
    self.toggleObj  = GetComponentWithPath(self.root, "Center/Toggles/Scroll/Viewport/Content/toggleItem", ComponentTypeName.Transform).gameObject
    self.topLabelBtns = {}
    self.smalltabObj = GetComponentWithPath(self.root, "Top/SmallTabs/SmallTabType", ComponentTypeName.Transform).gameObject
    self.topLabelBtnObj = GetComponentWithPath(self.root, "Top/SmallTabs/SmallTabType/item", ComponentTypeName.Transform).gameObject    
end

function ShopView:update_game_name_info()
    local playMode = ModuleCache.PlayModeUtil.getConfigByAppAndGameName(ModuleCache.AppData.get_real_app_and_game_name())
    self.textGameName.text = playMode.name
    self.imageGameIcon.sprite = ModuleCache.PlayModeUtil.getHeadIconRes(playMode)
    self.imageGameIcon:SetNativeSize()
end

function ShopView:showShopView(shopData, curPage, isBindInvite, btnData)
    if (shopData == nil) then
        return
    end
    self.curPageType = btnData.type == nil and 1  or btnData.type
    local panel = self.panelTable[1]
    self.isBindInvite = isBindInvite
    self.inputFieldInviteCode.text = ""
    self.defaultInviteCode = ""
    self:setShopScroll(shopData, panel)
end

--重新动态设置物品区域
function ShopView:changeScrollValue(panel)
    local scroll = GetComponentWithPath(panel.gameObject, "Scroll", ComponentTypeName.RectTransform)
    local offsetMin = Vector2.New(scroll.offsetMin.x, scroll.offsetMin.y)
    if (self.objInviteCode.activeSelf or self.curPageType == 3)  then
        scroll.offsetMax = Vector2.New(scroll.offsetMax.x, -26)
    else
        scroll.offsetMax = Vector2.New(scroll.offsetMax.x, 80)
    end
    scroll.offsetMin  = Vector2.New(offsetMin.x, offsetMin.y)
end

function ShopView:setShopScroll(productData, panel)
    self.products = productData
    local noneTips = GetComponentWithPath(panel.gameObject, "NoneTips", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(noneTips, false)
    for i = 1, #self.products do
        local obj = nil
        local item = {}
        if (i <= #self.contentItems) then
            obj = self.contentItems[i]
        else
            obj = TableUtil.clone(self.cloneObj, self.content.gameObject, Vector3.zero)
            self.contentItems[i] = obj
        end
        obj.name = i .. ""
        ComponentUtil.SafeSetActive(obj, true)
        item.gameObject = obj
        item.data = self.products[i]
        self:fillShopItem(item, i)
    end

    ComponentUtil.SafeSetActive(noneTips, #self.products <= 0)
    --兑换商城特殊处理
    if self.curPageType == 3  then 
        self.objInviteCode:SetActive(false)
    else
        self.objInviteCode:SetActive(not self.isBindInvite) 
    end 
    self:changeScrollValue(panel)
end

function ShopView:fillShopItem(item, index)
    local data = item.data
    local textRoomCardNum = GetComponentWithPath(item.gameObject, "NumLbl", ComponentTypeName.Text)

    local priceSwitch = GetComponentWithPath(item.gameObject, "Price", "UIStateSwitcher")
    local textPrice = GetComponentWithPath(item.gameObject, "Price/PayPrice", ComponentTypeName.Text)
    local iconPrice = GetComponentWithPath(item.gameObject, "Price/PayIcon/PayPrice", ComponentTypeName.Text)
    local imagePrice = GetComponentWithPath(item.gameObject, "Price/PayIcon", ComponentTypeName.Image)

    local buttonBuy = GetComponentWithPath(item.gameObject, "BuyGoodsBtn", ComponentTypeName.Button)
    local buttonBg = GetComponentWithPath(item.gameObject, "BuyGoodsBtn/bg", ComponentTypeName.Transform).gameObject
    local iconImage = GetComponentWithPath(item.gameObject, "goods", ComponentTypeName.Image)
    --限时限购显示
    local limitTime = GetComponentWithPath(item.gameObject, "LimitTime", ComponentTypeName.Transform).gameObject
    local limitTimeLab = GetComponentWithPath(item.gameObject, "LimitTime/Text", ComponentTypeName.Text)
    local limitCount = GetComponentWithPath(item.gameObject, "LimitCount", ComponentTypeName.Transform).gameObject
    local limitCountLab = GetComponentWithPath(item.gameObject, "LimitCount/lb", ComponentTypeName.Text)

    ComponentUtil.SafeSetActive(limitCount,data.stock ~= ModuleCache.Json.null and  data.stock ~= "")
    ComponentUtil.SafeSetActive(limitTime, data.isLimitTime)
    if (data.stock ~= ModuleCache.Json.null and data.stock ~= "" ) then --是否限购
        limitCountLab.text =  data.stock
    end
    if (data.isLimitTime) then
        --是否限时
        local curTime = os.time()
        local endTime = self:getDateByString(data.activityEndTime)
        if endTime then
            local sec = tonumber(endTime) - tonumber(curTime)
            ComponentUtil.SafeSetActive(limitTime, sec > 0)
            if (sec > 0) then
                self:subscibe_time_event(sec, false, 1):OnUpdate(function(t)
                    t = t.surplusTimeRound
                    limitTimeLab.text = self:getTimeString(t)
                end):OnComplete(function(...)
                    ModuleCache.ModuleManager.get_module("public", "shop"):get_shop_server_data()
                end)
            end
        end
    end

    --体力 金币 钻石商城ICON
    iconImage.gameObject:SetActive(false)
    if (self.curPageType == 1 or self.curPageType == 2 or self.curPageType == 5 or self.curPageType == 6) then
        local goodsIndex = self.curPageType
        if data.num >= 50000 then
            goodsIndex = 6
        elseif data.num >= 20000 then
            goodsIndex = 5
        elseif data.num >= 10000 then
            goodsIndex = 4
        elseif data.num >= 5000 then
            goodsIndex = 3
        elseif data.num >= 2000 then
            goodsIndex = 2
        else
            goodsIndex = 1
        end
        goodsIndex = (self.curPageType == 6 and 2 or self.curPageType)  .. goodsIndex
        iconImage.gameObject:SetActive(true)
        iconImage.sprite = self.spriteAtlas:FindSpriteByName(goodsIndex)
        iconImage:SetNativeSize()
    end

    local goExtenal = GetComponentWithPath(item.gameObject, "Title/Extenal", ComponentTypeName.Transform).gameObject
    local textExtenalRoomCardNum = GetComponentWithPath(goExtenal, "numLbl", ComponentTypeName.Text)
    local extenalImage = GetComponentWithPath(goExtenal, "Image", ComponentTypeName.Image)
    extenalImage.gameObject:SetActive(true)

    goExtenal:SetActive(data.giveNum > 0)
    if (data.giveType) then
        extenalImage.sprite = self.spriteAtlas:FindSpriteByName("giveType" .. data.giveType)
    end

    textExtenalRoomCardNum.text = data.giveNum .. ''

    textRoomCardNum.text = data.productName .. ""
    --textRoomCardNumLeft.text = data.productName .. ""

    --处理显示价格
    if data.payType == self.PayTypeByName.RMB then
        priceSwitch:SwitchState("Price")
        if data.salePrice then
            textPrice.text = "￥" .. Util.filterPlayerGoldNum(tonumber(data.salePrice))
        else
            textPrice.text = "￥" .. Util.filterPlayerGoldNum(tonumber(data.productPrice))
        end
    else
        priceSwitch:SwitchState("IconPrice")
        local payStr = ""
        if data.payType == self.PayTypeByName.Diamond then
            payStr = "price_zuanshi"
        elseif data.payType == self.PayTypeByName.Stamina then
            payStr = "price_tili"
        elseif data.payType == self.PayTypeByName.RedPacket then
            payStr = "price_hongbao"
        elseif data.payType == self.PayTypeByName.Gold then
            payStr = "price_jinbi"
        end
        iconPrice.text = Util.filterPlayerGoldNum(tonumber(data.salePrice))
        imagePrice.sprite = self.spriteAtlas:FindSpriteByName(payStr)
    end
    ----挂件 and商品UI
    -- local AttachRoot = GetComponentWithPath(item.gameObject,"Title/Extenal", ComponentTypeName.Transform).gameObject
    -- ModuleCache.ComponentUtil.SafeSetActive(AttachRoot.gameObject, false)
    local showIconUrl = nil
    if (data.attachList ~= nil and #data.attachList >= 1) then
        for i = 1, #data.attachList do
            local attachData = data.attachList[i]
            if attachData.attachType == 1 then
                if goExtenal then
                    self:downImg(attachData.url, function(sprite)
                        extenalImage.sprite = sprite
                        ComponentUtil.SafeSetActive(goExtenal, true)
                        ComponentUtil.SafeSetActive(extenalImage.gameObject, true)
                    end)
                end
            elseif attachData.attachType == 3 then
                showIconUrl = attachData.url
            -- elseif attachData.attachType == 4 then
            --     ModuleCache.ComponentUtil.SafeSetActive(AttachRoot.gameObject, true)
            --     local AttachRootChild = AttachRootChilds[1]
            --     ModuleCache.ComponentUtil.SafeSetActive(AttachRootChild.gameObject, true)
            --     local attachImage = ModuleCache.ComponentManager.GetComponent(AttachRootChild.gameObject,ComponentTypeName.Image)
            --     self:downImg(attachData.url, function(downsprite)
            --         attachImage.sprite = downsprite
            --         attachImage:SetNativeSize()
            --     end)
            end
        end
    end

    if (showIconUrl == nil) and  #data.itemVoList > 0 then
        showIconUrl = data.itemVoList[1].itemIcon
    end 

    if showIconUrl ~= nil then
        self:downImg(showIconUrl, function(downsprite)
            iconImage.sprite = downsprite
            iconImage.gameObject:SetActive(true)
            iconImage:SetNativeSize()
        end)
    end 
end

function ShopView:downImg(url, callback)
    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(url, function(err, sprite)
        if (err) then
            print('error down load ' .. url .. 'failed:' .. err.error)
            if string.find(err.error, 'Network Timeout') and string.find(url, 'http') == 1 then
                if (self) then
                    -- self:image_load_sprite(targetImage, url, callback)
                end
            end
        else
            if (not self.isDestroy) then
                if callback then
                    callback(sprite)
                end
            end
        end
    end, nil, false)
end

function ShopView:on_hide()
    self:clear_all_time_event()
end

function ShopView:getDateByString(dateStr)
    if (#dateStr < 16) then
        return nil
    end
    local Y = string.sub(dateStr, 1, 4)
    local M = string.sub(dateStr, 6, 7)
    local D = string.sub(dateStr, 9, 10)
    local H = string.sub(dateStr, 12, 13)
    local MM = string.sub(dateStr, 15, 16)
    local dateTime = os.time { year = Y, month = M, day = D, hour = H, min = MM, sec = 0 }
    return dateTime
end

-- 将秒数时间转换为 00:00:00
function ShopView:getTimeString(second)
    local day = math.floor(second / 86400)
    local hour = math.fmod(math.floor(second / 3600), 24)
    local min = math.fmod(math.floor(second / 60), 60)
    local sec = math.fmod(second, 60)
    if (#tostring(hour) == 1) then
        hour = "0" .. hour
    end
    if (#tostring(min) == 1) then
        min = "0" .. min
    end
    if (#tostring(sec) == 1) then
        sec = "0" .. sec
    end
    local str = hour .. ":" .. min .. ":" .. sec
    if day > 0 then
        str = day .. "天 " .. hour .. ":" .. min .. ":" .. sec
    end

    --if self.curPageType == 6 then
    str = "限时" .. str
    --end

    return str
end

-- 显示记录类界面
function ShopView:showRecordView(recordData, curPage)
    if (recordData == nil) then
        return
    end
    self.curPageType = curPage
    local panel = self.panelTable[curPage]
    print(panel.name)
    self:setRecordView(recordData.list, panel)
end

function ShopView:setRecordView(recordList, panel)
    ModuleCache.ModuleManager.show_public_module("netprompt")
    local content = GetComponentWithPath(panel.gameObject, "Scroll/Viewport/Content", ComponentTypeName.GridLayoutGroup)
    local contentRt = GetComponentWithPath(panel.gameObject, "Scroll/Viewport", ComponentTypeName.RectTransform)
    content.cellSize = Vector2.New(contentRt.rect.width, content.cellSize.y)
    local contents = TableUtil.get_all_child(content.transform)
    local cloneObj = GetComponentWithPath(panel.gameObject, "ItemPrefabHolder/Item", ComponentTypeName.Transform).gameObject

    local noneTips = GetComponentWithPath(panel.gameObject, "NoneTips", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(noneTips, false)

    for i = 1, #contents do
        ComponentUtil.SafeSetActive(contents[i], false)
    end
    for i = 1, #recordList do
        local data = recordList[i]
        if data and data.title and type(data.title) ~= "userdata" then
            local obj = nil
            local item = {}
            if (i <= #contents) then
                obj = contents[i]
            else
                obj = TableUtil.clone(cloneObj, content.gameObject, Vector3.zero)
            end
            obj.name = i .. ""
            ComponentUtil.SafeSetActive(obj, true)
            item.gameObject = obj
            item.data = data
            self:fillRecordItem(item, i)
        end
    end
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    ComponentUtil.SafeSetActive(noneTips, #recordList <= 0)
    self:changeScrollValue(panel)
end

function ShopView:fillRecordItem(item, index)
    local txtTitle = GetComponentWithPath(item.gameObject, "Title", ComponentTypeName.Text)
    local txtTime = GetComponentWithPath(item.gameObject, "Time", ComponentTypeName.Text)
    local txtInfo = GetComponentWithPath(item.gameObject, "Info", ComponentTypeName.Text)
    local data = item.data
    txtTitle.text = data.title
    txtTime.text = data.time
    txtInfo.text = data.content
end

function ShopView:get_data(obj)
    return self.products[tonumber(obj.name)]
end

function ShopView:refresh_role_info(roleData)
    if (roleData.cards) then
        self.textOwnRoomCardNum.text = Util.filterPlayerGoldNum(roleData.cards)
    end

    if roleData.coins then
        self.textOwnTiliNum.text = Util.filterPlayerGoldNum(roleData.coins)
    end

    if roleData.gold then
        self.textOwnGoldNum.text = Util.filterPlayerGoldNum(roleData.gold)
    end

    if roleData.redPacket then
        self.textOwnRedNum.text = Util.filterPlayerGoldNum(roleData.redPacket)
    end 
end

function ShopView:setToggleScroll()
    local activeObjs = 0
    for k, v in ipairs(self.toggleItems) do
        if v.Obj.activeSelf then
            activeObjs = activeObjs + 1
        end
    end
    self.toggleContent.anchoredPosition = Vector2.New(0, self.toggleContent.anchoredPosition.y)
end

--显示代理
function ShopView:show_agents_pay(goodsData, commissionAmount, share)
    if goodsData == nil or commissionAmount == nil then
        return
    end
    self.agencyPayDialog:SetActive(true)
    self.agencyPayDialogTitle.text = goodsData.productName
    self.agencybalance.text = "可用余额: " .. commissionAmount .. "元"
    local price = goodsData.salePrice and goodsData.salePrice or goodsData.productPrice
    local discounts = self.agencyIsChoose.activeSelf and commissionAmount or 0
    Util.GetPreciseDecimal(price - discounts, 2)
    self.wxPayCount.text = ((price - discounts) < 0 and 0 or Util.GetPreciseDecimal(price - discounts, 2)) .. "元"
    if price - discounts > 0 then
        self.agencyPayBtn:SetActive(not share)
        self.agencySharePayBtn:SetActive(share)
    else
        self.agencyPayBtn:SetActive(true)
        self.agencySharePayBtn:SetActive(false)
    end
end

--初始化左侧按钮and顶部按钮
function ShopView:init_toggle(tabDatas)
    for i = 1, #tabDatas do
        if self.toggleItems[i] == nil then
            self.toggleItems[i] = {}
            self.toggleItems[i].Obj = TableUtil.clone(self.toggleObj,self.toggleObj.transform.parent.gameObject, Vector3.zero)
            self.toggleItems[i].OffLable = GetComponentWithPath(self.toggleItems[i].Obj, "Checkmark/OffLabel", ComponentTypeName.Text)
            self.toggleItems[i].OnLable = GetComponentWithPath(self.toggleItems[i].Obj, "Checkmark/OnLabel", ComponentTypeName.Text)
            self.toggleItems[i].Switchers = ModuleCache.ComponentManager.GetComponent(self.toggleItems[i].Obj, "UIStateSwitcher")
            self.toggleItems[i].Toggles = ModuleCache.ComponentManager.GetComponent(self.toggleItems[i].Obj, ComponentTypeName.Toggle)
        end 
        self.toggleItems[i].Obj.name = tabDatas[i].id
        self.toggleItems[i].OffLable.text = tabDatas[i].name
        self.toggleItems[i].OnLable.text = tabDatas[i].name
        self.toggleItems[i].Data = tabDatas[i]
        self.toggleItems[i].Obj:SetActive(true)
        --先写死吧 只有兑换商城有
        if tabDatas[i].tagList ~= nil and #tabDatas[i].tagList > 1 then
            for index =  1, #tabDatas[i].tagList do
                if self.topLabelBtns[index] == nil then
                    self.topLabelBtns[index] = {}
                    local obj = TableUtil.clone(self.topLabelBtnObj,self.smalltabObj, Vector3.zero)
                    self.topLabelBtns[index].CheckMark = GetComponentWithPath(obj, "Checkmark", ComponentTypeName.Transform).gameObject
                    self.topLabelBtns[index].CheckMarkLab = GetComponentWithPath(obj, "Checkmark/Label", ComponentTypeName.Text)
                    self.topLabelBtns[index].NameLab = GetComponentWithPath(obj, "Bg/Label", ComponentTypeName.Text)
                    self.topLabelBtns[index].Obj = obj
                end
                self.topLabelBtns[index].CheckMarkLab.text = tabDatas[i].tagList[index].name
                self.topLabelBtns[index].NameLab.text = tabDatas[i].tagList[index].name
                self.topLabelBtns[index].Obj.name = tabDatas[i].tagList[index].id
                self.topLabelBtns[index].Data = tabDatas[i].tagList[index]
                self.topLabelBtns[index].Obj:SetActive(true)
            end
            if #tabDatas[i].tagList < #self.topLabelBtns then
                for tempIndex = #tabDatas[i].tagList + 1, #self.topLabelBtns do
                    self.topLabelBtns[tempIndex].Obj:SetActive(false)
                    self.topLabelBtns[tempIndex].Data = nil
                end 
            end 
        end 
    end

    if #tabDatas < #self.toggleItems then
        for i = #tabDatas + 1, #self.toggleItems do
            self.toggleItems[i].Obj:SetActive(false)
        end 
    end 
end 

--刷新顶部菜单按钮
function ShopView:refresh_top_btn(id)
    if id == nil then return end
    for _, obj in ipairs(self.contentItems) do
        obj:SetActive(false)
    end
    for _, btnItem in pairs(self.topLabelBtns) do
        if btnItem.Data ~= nil then
            btnItem.CheckMark:SetActive(id == btnItem.Data.id)
            if id == btnItem.Data.id then
                self.smallName = btnItem.Data.name
            end 
        end 
    end
end 

--授权二维码
function ShopView:Refresh_WeiXinShareQR(url)
    self:downImg(url, function(downsprite)
        self.WeiXinShareQR.sprite = downsprite
    end)
end

return ShopView 