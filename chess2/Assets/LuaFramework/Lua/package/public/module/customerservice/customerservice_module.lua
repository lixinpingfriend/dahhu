
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local CustomerServiceModule = class("customerServiceModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function CustomerServiceModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "customerservice_view", "customerservice_model", ...)

end

function CustomerServiceModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.buttonBack.gameObject then
        ModuleCache.ModuleManager.destroy_module("public", "customerservice");

        -- 复制微信号按钮
    elseif obj == self.view.buttonCopyNumber.gameObject or obj == self.view.buttonCustomerBg.gameObject then

        local number = self.view.labelNumber.text;
        -- 复制微信号到剪切板
        ModuleCache.GameSDKInterface:CopyToClipboard(number);

        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("客服微信已复制");
    end
end

function CustomerServiceModule:on_show(data)

    self.view:hide();

    -- 请求客服配置协议
    self.model:getImageShareConfig();
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function CustomerServiceModule:on_model_event_bind()

    local onGetImageShareConfig = function(eventHead, eventData)

        self.view:show();
        -- 更新微信视图
        self.view:init(eventData);
    end
    -- 监听获取客服配置协议
    self:subscibe_model_event("Event_CustomerService_GetImageShareConfig", onGetImageShareConfig);
end

return CustomerServiceModule;