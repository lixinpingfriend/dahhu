
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local FirstRechargeView = Class('firstRechargeView', View)

local ModuleCache = ModuleCache
local MatchingManager = require("package.public.matching_manager")
local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
function FirstRechargeView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/firstrecharge/public_windowfirstrecharge.prefab", "Public_WindowFirstRecharge", 1, nil, 2)
    View.set_1080p(self)

    self.price1Text = GetComponentWithPath(self.root, "Center/Price1", ComponentTypeName.Text)
    self.price2Text = GetComponentWithPath(self.root, "Center/Price2", ComponentTypeName.Text)
    self.goodsObj = GetComponentWithPath(self.root, "Center/Goods/Ex", ComponentTypeName.Transform).gameObject
    self.goodsSprite = GetComponentWithPath(self.root, "Center/Goods", "SpriteHolder")
    self.centerCavans = GetComponentWithPath(self.root, "Center", "UnityEngine.Canvas")
    self.centerCavans.sortingOrder = self.canvas.sortingOrder + 12
    self.cloneGoods = {}
    ComponentUtil.SafeSetActive(self.goodsObj, false)
end

function FirstRechargeView:refreshView(data)
    print(data.appAwards[1].productSalePriceStr, data.appAwards[1].productPriceStr)
    --self.descText.text= "首充" .. data.appAwards[1].productSalePriceStr .. "元，可得价值" .. data.appAwards[1].productPriceStr .. "元大礼包"
    self.price1Text.text = tonumber(data.appAwards[1].productSalePriceStr) .. ""
    self.price2Text.text = tonumber(data.appAwards[1].productPriceStr) .. ""
    for _, v in pairs(self.cloneGoods) do
        if v then
            v:SetActive(false)
        end
    end
    if data.appAwards[1].productNum > 0 then
        local c
        if self.cloneGoods[1] then
            c = self.cloneGoods[1]

        else
            c = self:clone("clone", self.goodsObj, self.goodsObj.transform.parent)
            self.cloneGoods[1] = c

        end
        c:SetActive(true)
        local icon = GetComponentWithPath(c, "Icon", ComponentTypeName.Image)
        local num = GetComponentWithPath(c, "Num", ComponentTypeName.Text)
        local name = GetComponentWithPath(c, "Name", ComponentTypeName.Text)
        MatchingManager:goodsNameAndIcon2(data.appAwards[1].productType, icon, num, name,
                data.appAwards[1].productNum, nil, nil, nil, nil, self.goodsSprite, true)
        num.text = num.text

    end
    if data.appAwards[1].productGiveNum > 0 then
        local c
        if self.cloneGoods[2] then
            c = self.cloneGoods[2]
        else
            c = self:clone("clone", self.goodsObj, self.goodsObj.transform.parent)
            self.cloneGoods[2] = c

        end
        c:SetActive(true)
        local icon = GetComponentWithPath(c, "Icon", ComponentTypeName.Image)
        local num = GetComponentWithPath(c, "Num", ComponentTypeName.Text)
        local name = GetComponentWithPath(c, "Name", ComponentTypeName.Text)
        MatchingManager:goodsNameAndIcon2(data.appAwards[1].productGiveType, icon, num, name,
                data.appAwards[1].productGiveNum, nil, nil, nil, nil, self.goodsSprite, true)
        num.text = num.text
    end
    if #data.appAwards[1].productItemList > 0 then
        for i = 1, #data.appAwards[1].productItemList do
            local c
            if self.cloneGoods[2 + i] then
                c = self.cloneGoods[2 + i]
            else
                c = self:clone("clone", self.goodsObj, self.goodsObj.transform.parent)
                self.cloneGoods[2 + i] = c

            end
            c:SetActive(true)
            local icon = GetComponentWithPath(c, "Icon", ComponentTypeName.Image)
            local num = GetComponentWithPath(c, "Num", ComponentTypeName.Text)
            local name = GetComponentWithPath(c, "Name", ComponentTypeName.Text)
            MatchingManager:goodsNameAndIcon2(10, icon, num, name,
                    data.appAwards[1].productItemList[i].num, data.appAwards[1].productItemList[i].itemName,
                    data.appAwards[1].productItemList[i].itemIcon, nil, nil, self.goodsSprite, true)
        end
    end
end

function FirstRechargeView:clone(name, obj, parent)
    local target = ComponentUtil.InstantiateLocal(obj, Vector3.zero)
    if not parent then
        parent = obj.transform.parent
    end
    target.transform:SetParent(parent.transform)
    target.transform.localScale = Vector3.one
    target.name = tostring(name)
    ComponentUtil.SafeSetActive(target, true)
    return target
end

return FirstRechargeView