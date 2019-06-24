
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local ActivityRedPacketView = Class('activityRedPacketView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

function ActivityRedPacketView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/activity/activity_redpacket.prefab", "Activity_RedPacket", 1);

    self.buttonYes = GetComponentWithSimple(self.root, "ButtonYes", ComponentTypeName.Button);
    self.buttonMask = GetComponentWithSimple(self.root, "mask", ComponentTypeName.Button);
    local onButtonYes = function()
        self:onClickYesButton();
    end
    self.buttonYes.onClick:AddListener(onButtonYes);
    self.buttonMask.onClick:AddListener(onButtonYes);

    self.labelMoney = GetComponentWithSimple(self.root, "LabelMoney", ComponentTypeName.Text);
end

function ActivityRedPacketView:init(money)

    self.money = money;

    -- 更新红包视图
    self:updateRedPacketView();
end

-- 更新红包视图
function ActivityRedPacketView:updateRedPacketView()

    -- 金币数量
    self.labelMoney.text = string.format("¥  %s", self.money);
end

function ActivityRedPacketView:onClickYesButton()

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

    ModuleCache.ModuleManager.destroy_module("public", "activity_redpacket");
end

return ActivityRedPacketView