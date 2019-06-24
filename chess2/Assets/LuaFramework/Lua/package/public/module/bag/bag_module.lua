
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local BagModule = class("bagModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function BagModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "bag_view", "bag_model", ...)

end

function BagModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.buttonBack.gameObject then
        -- ModuleCache.ModuleManager.hide_module("public", "bag");
        self.view.itemBox:SetActive(false);

        -- 道具详情弹框遮罩
    elseif obj == self.view.buttonItemDetailBack.gameObject then
        self.view.itemDetailBox:SetActive(false);

        -- 道具赠送弹框遮罩
    elseif obj == self.view.buttonItemGiveBack.gameObject then
        self.view.itemGiveBox:SetActive(false);
        self.view:removeUpdate();

        -- 道具确认赠送弹框遮罩和取消赠送按钮
    elseif obj == self.view.buttonGiveSureBack.gameObject or self.view.buttonUserGiveCancel.gameObject then
        self.view.itemGiveSureBox:SetActive(false);
    end
end

function BagModule:on_show(data)

    -- self.view:hide();
    self.view.itemBox:SetActive(false);
    self.view.itemDetailBox:SetActive(false);
    self.view.itemGiveBox:SetActive(false);
    self.view.itemGiveSureBox:SetActive(false);

    -- 主界面
    if data.showType == 1 then
        -- 获取背包详情协议
        self.model:getBagDetail();
        -- 道具详情界面
    elseif data.showType == 2 then
        --        data = { };
        --        local test = { };
        --        test.itemId = 24;
        --        test.itemCode = "3";
        --        test.itemName = "兑换券";
        --        test.itemIcon = "http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180123_007f4d61a6a84485bb02656b63dc4f1c.jpg";
        --        test.itemDesc = "兑换券";
        --        test.coins = 1;
        --        test.coinsType = 2;
        --        test.onwerNum = 2;
        --        test.itemButtonType = "3,1";
        --        test.exchangeUrl = "http://test.activeweb.sincebest.com/ahqp/exchange/?alchemyId=3&itemId=25";
        --        test.effectStr = "有效期:永久";
        --        test.highlight = false;
        --        data.bag = test;
        --        -- 更新道具详情视图
        --        self.view:updateItemDetailView(data.bag);
    end

    --   local bag={"itemId":24,"itemCode":"3","itemName":"兑换券","itemIcon":"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180123_007f4d61a6a84485bb02656b63dc4f1c.jpg","itemDesc":"兑换券","coins":1,"coinsType":2,"onwerNum":2,"itemButtonType":"3,1","exchangeUrl":"http://test.activeweb.sincebest.com/ahqp/exchange/?alchemyId=3&itemId=25","openEffct":false,"effectStartTime":"2018-01-25 16:00","effectEndTime":"2028-01-25 16:00","effectStr":"有效期:永久","highlight":false}
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function BagModule:on_model_event_bind()

    local onGetBagDetail = function(eventHead, eventData)

        -- self.view:show();
        self.view.itemBox:SetActive(true);
        -- 初始化
        self.view:init(eventData, self);
    end
    -- 监听获取背包详情事件
    self:subscibe_model_event("Event_Bag_GetBagDetail", onGetBagDetail);

    local onGetUserInfo = function(eventHead, eventData)

        -- 更新玩家信息视图
        self.view:updateUserInfoView(eventData.bag, eventData);
    end
    -- 监听获取玩家信息事件
    self:subscibe_model_event("Event_Bag_GetUserInfo", onGetUserInfo);

    local onGiveItem = function(eventHead, eventData)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("赠送成功");
        -- 关闭用户信息弹框
        self.view.itemGiveSureBox:SetActive(false);
    end
    -- 监听请求赠送道具事件
    self:subscibe_model_event("Event_Bag_GiveItem", onGiveItem);
end

return BagModule;