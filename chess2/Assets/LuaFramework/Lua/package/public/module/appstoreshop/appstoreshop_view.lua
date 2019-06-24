
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local AppstoreShopView = Class('AppstoreShopView', View)

local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local TableUtil = TableUtil
function AppstoreShopView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/shop/public_windowappstoreshop.prefab", "Public_WindowAppstoreShop", 1)
    View.set_1080p(self)

    self.tiliNumText = GetComponentWithPath(self.root, "Center/TiliCard/TextNum", ComponentTypeName.Text)
    self.itemObj = GetComponentWithPath(self.root, "Center/Panels/1/Scroll/Viewport/Content/Item", ComponentTypeName.Transform).gameObject
    self.itemObj:SetActive(false)
    self.content = GetComponentWithPath(self.root, "Center/Panels/1/Scroll/Viewport/Content", ComponentTypeName.Transform).gameObject
end

function AppstoreShopView:iosCheckData()
    local data1 = {
        {
            productName = "60体力",
            salePrice = 6,
            payType = 99,
            num = 60,
            type = 5,
            productId = "dahu_tili_60",
        },
        {
            productName = "120体力",
            salePrice = 12,
            payType = 99,
            num = 120,
            type = 5,
            productId = "dahu_tili_120",
        },
        {
            productName = "300体力",
            salePrice = 30,
            payType = 99,
            num = 300,
            type = 5,
            productId = "dahu_tili_300",
        },
        {
            productName = "600体力",
            salePrice = 60,
            payType = 99,
            num = 600,
            type = 5,
            productId = "dahu_tili_600",
        },
        {
            productName = "1280体力",
            salePrice = 128,
            payType = 99,
            num = 1280,
            type = 5,
            productId = "dahu_tili_1280",
        },
        {
            productName = "3480体力",
            salePrice = 348,
            num = 3480,
            type = 5,
            productId = "dahu_tili_3480",
        },
    }
    return data1
end

function AppstoreShopView:iosCheckView()
    local contents = TableUtil.get_all_child(self.content)
    for i = 1, #contents do
        ComponentUtil.SafeSetActive(contents[i], false)
    end
    local data = self:iosCheckData()
    for i = 1, #data do
        local obj = nil
        if (i <= #contents) then
            obj = contents[i]
        else
            obj = TableUtil.clone(self.itemObj, self.content.gameObject, Vector3.zero)
        end
        obj.name = i .. ""
        ComponentUtil.SafeSetActive(obj, true)
        local titleText = GetComponentWithPath(obj, "NumLbl", ComponentTypeName.Text)
        local priceText = GetComponentWithPath(obj, "Price/NumText", ComponentTypeName.Text)
        titleText.text = data[i].productName
        priceText.text = "￥" .. data[i].salePrice
    end
end

function AppstoreShopView:refresh_tili(num)
    self.tiliNumText.text = num
end

return AppstoreShopView