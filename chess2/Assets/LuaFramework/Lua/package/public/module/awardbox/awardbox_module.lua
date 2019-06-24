
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local AwardBoxModule = class("awardBoxModule", ModuleBase)
local DialogManager = require("manager.auto_dialog_manager");

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function AwardBoxModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "awardBox_view", nil, ...)

    self.onClickYesButton = nil;

    -- 打开领取界面入口类型
    self.openType = { };
end

function AwardBoxModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    print(obj.name);
    -- 确定按钮
    if obj == self.view.buttonYes.gameObject then
        if self.onClickYesButton then
            self.onClickYesButton();
        end
        -- 七日奖励或转盘左侧领取的奖励,才会触发自动弹窗机制
        if self.openType == "sevenDayAward" or self.openType == "turnTableLeft" then
            -- 打开优先级高的弹框
            DialogManager.openPriorityDialog();
        end
        ModuleCache.ModuleManager.hide_module("public", "awardBox");
    end
end

function AwardBoxModule:on_show(data)
    self.view:hide()
    self.view:show(true)
    if data and type(data) == "table" then
        self.openType = data.openType;
    end


    --self.view:init(data.data);

    -- 动态sortOrder赋值
    self.view:setSortOrder();
end

function AwardBoxModule:ShowAward(title,award,onClickYes)
    self:setTitleName(title)
    self.view:init(award);
    self:settingOnClickYesButton(onClickYes)
end

-- 点击确定按钮回调
function AwardBoxModule:settingOnClickYesButton(callback)

    self.onClickYesButton = callback;
end

-- 设置标题名字
function AwardBoxModule:setTitleName(tileName)

    -- 更新标题文字
    self.view:updateTiltle(tileName);
end

-- 设置确定按钮名字
function AwardBoxModule:setYesName(yesName)

    -- 更新确定文字
    self.view:updateYes(yesName);
end

return AwardBoxModule;