
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local CustomerServiceView = Class('customerServiceView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

function CustomerServiceView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/customerservice/public_customerservice.prefab", "Public_CustomerService", 1);
    View.set_1080p(self);

    -- 返回按钮
    self.buttonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button);
    -- 复制微信号按钮
    self.buttonCopyNumber = GetComponentWithSimple(self.root, "ButtonCopyNumber", ComponentTypeName.Button);
    -- 微信背景按钮
    self.buttonCustomerBg = GetComponentWithSimple(self.root, "SpriteCustomerService", ComponentTypeName.Button);
    -- 客服背景图
    self.spriteCustomerBg = GetComponentWithSimple(self.root, "SpriteCustomerService", ComponentTypeName.Image);

    -- 微信号标签
    self.labelNumber = GetComponentWithSimple(self.root, "LabelNumber", ComponentTypeName.Text);
end

function CustomerServiceView:init(data)

    self.customerData = data;

    -- 更新客服视图
    self:updateCustomerView();
end

-- 更新客服视图
function CustomerServiceView:updateCustomerView()

    -- 微信号
    self.labelNumber.text = self.customerData.custosmerService;
    -- 客服背景
    self.spriteCustomerBg.sprite = self.customerData.customerBgSprite;
end

return CustomerServiceView;