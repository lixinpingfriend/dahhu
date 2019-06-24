
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local FirstRechargeModule = class("Public.FirstRechargeModule", ModuleBase)
-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function FirstRechargeModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "firstrecharge_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function FirstRechargeModule:on_module_inited()

end

-- 绑定module层的交互事件
function FirstRechargeModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)

    end)
    self:subscibe_package_event("Event_Package_Recharge_Success", function(eventHead, eventData)
        --self:updateRedInfo(eventData)
        print("首充充值成功")
        if self.isHide then
            return
        end
        ModuleCache.ModuleManager.hide_module("public", "firstrecharge")
    end )
    self:subscibe_package_event("Event_Click_BtnClose", function(eventHead, eventData)

        ModuleCache.ModuleManager.hide_module("public", "firstrecharge")
    end )
end

-- 绑定loginModel层事件，模块内交互
function FirstRechargeModule:on_model_event_bind()


end

function FirstRechargeModule:set_view_values()

end

function FirstRechargeModule:on_show(data)
    self.view:hide()
    self.view:show(true)
    self.data = data
    self.view:refreshView(data)

end

function FirstRechargeModule:on_click(obj, arg)
    print("点击", obj.name, obj.transform.parent.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnClose" then
        ModuleCache.ModuleManager.hide_module("public", "firstrecharge")
        return
    elseif obj.name == "BtnRecharge"  then
        if self.data then
            ModuleCache.PayManager().get_pay_type(self.data.appAwards[1])
        end

    end
end





return FirstRechargeModule



