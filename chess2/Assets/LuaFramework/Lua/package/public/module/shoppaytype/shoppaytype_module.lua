





local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
--- @class ShopPayTypeModule : Module
---@field view ShopPayTypeView
local ShopPayTypeModule = class("ShopPayTypeModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function ShopPayTypeModule:initialize(...)
    -- 开始初始化                view        model           模块数据
    ModuleBase.initialize(self, "shoppaytype_view", nil, ...)
end

-- 传入相应的ID转到相应的tag
function ShopPayTypeModule:on_show(data)
    print_table(data)
    self.data = data
    if(data.resetRootScale and type(data.resetRootScale) == 'number')then
        self.view:set_root_scale(data.resetRootScale)
    else
        self.view:set_root_scale(1)
    end

    --payType
    self.view:init_with(data)

    --如果说只有一种支付方式，且不是代理的链接分享，就自动触发支付
    if #data.payTypeDatas == 1 then
        -- showType == 3 为显示方式,分享到微信
        if not self.data.canAgentsBuy and (data.payTypeDatas[1].showType ~= 3) then
            self:hide()
            self:request_pay()
        end
    end
end

function ShopPayTypeModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    local clickObjName = obj.name
    if clickObjName == "SharePayUrl" then
        --if self.data.museum then
        --    --pay_type,activityId,goods_data,realPrice
        --    ModuleCache.PayManager().otherPay(self.data.pay_type,  self.data.activityId,self.data.goods_data,self.data.realPrice)
        --else
        --    ModuleCache.PayManager().dahuPay(self.data.goods_data, self.data.pay_type, self.data.wap_type,nil,self.data.realPrice)
        --end
        self:hide()
        self:request_pay()
    elseif clickObjName == "ButtonClose" then
        self:hide()
        self:dispatch_module_event("shopPayType", "CloseView")
    elseif obj.transform.parent.name == "PayTypeSelect" then
    elseif clickObjName == "ButtonPay" then
        self:request_pay()
    end
end

function ShopPayTypeModule:request_pay()
    local payTypeIndex = self.view:get_on_toggle_paytype_index()
    if payTypeIndex ~= -1 then
        --需要考虑佣金支付
        print_table(self.data, payTypeIndex)
        if self.data.canAgentsBuy then
            self.data.isAgent = self.view.isSelectAgentPay
            self.data.realPrice = self.view.agentsPayRealPrice
        end
        ModuleCache.PayManager().begin_pay(payTypeIndex, self.data)
    end
end

function ShopPayTypeModule:get_real_price()
    local price = self.goodsData.salePrice and self.goodsData.salePrice or self.goodsData.productPrice
    local discounts = self.view.agencyIsChoose.activeSelf and self.commissionAmount or 0

    local realPrice = price - discounts
    return Util.GetPreciseDecimal(realPrice, 2)
end


function ShopPayTypeModule:on_module_event_bind()
    self:subscibe_module_event("jPush_manager", "jPush_parlor_activity_pay", function(eventHead, eventData)
        print("#####推送通知shoppaytype####", eventData.type, eventData.data)
        if eventData.type == "parlor_activity_pay" then
            self:hide()
        end
    end)

    self:subscibe_package_event("Event_Package_Recharge_Success", function(eventHead, eventData)
        if self.isHide then
            return
        end
        self:hide()
    end)
end

return ShopPayTypeModule


--32011368
