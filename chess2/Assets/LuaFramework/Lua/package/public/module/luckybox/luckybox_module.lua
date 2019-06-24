
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local LuckyBoxModule = class("Public.LuckyBoxModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local CSmartTimer = ModuleCache.SmartTimer.instance
local NetClientManager = ModuleCache.net.NetClientManager

local MatchingManager = require("package.public.matching_manager")

local ModuleEventBase = require('core.mvvm.module_event_base')
function LuckyBoxModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "luckybox_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function LuckyBoxModule:on_module_inited()

end

-- 绑定module层的交互事件
function LuckyBoxModule:on_module_event_bind()
    self:subscibe_package_event("Event_Lucky_Buy_End", function(eventHead, eventData)

        if self then
            ModuleCache.ModuleManager.hide_module("public", "luckybox")
        end
    end)
    self:subscibe_package_event("Event_Click_BtnClose", function(eventHead, eventData)

        ModuleCache.ModuleManager.hide_module("public", "luckybox")
    end )
    --self:subscibe_package_event("Event_Package_Recharge_Success", function(eventHead, eventData)
    --    self:dispatch_package_event('Event_Lucky_Buy_End')
    --    if self.modelData.hallData.smartTimer.luckybox then
    --        CSmartTimer:Kill(self.modelData.hallData.smartTimer.luckybox)
    --        self.modelData.hallData.smartTimer.luckybox = nil
    --    end
    --end)
end

-- 绑定loginModel层事件，模块内交互
function LuckyBoxModule:on_model_event_bind()


end

function LuckyBoxModule:set_view_values()

end

function LuckyBoxModule:box_open_status(data,open)
    self.data = data
    self.view:boxOpen(true,open)
    self.view:boxOpenView(data)
    self.view:show(true)
    if data.exprice > 0  then
        if self.modelData.hallData.smartTimer.luckybox then
            CSmartTimer:Kill(self.modelData.hallData.smartTimer.luckybox)
        end
        self.modelData.hallData.smartTimer.luckybox = CSmartTimer:Subscribe(data.exprice, false, 1):OnComplete(function( t )
            ModuleEventBase:dispatch_package_event('Event_Lucky_Buy_End')
        end).id
    end
end

function LuckyBoxModule:box_close_status()
    MatchingManager:get_luckybox_times(function(info) self:box_view(info) end)
end

function LuckyBoxModule:box_view(data)
    if data.remainderCount > 0 then
        print("显示幸运宝箱")
        self.activityId = data.activityId
        self.view:boxOpen(false)
        self.view:boxCloseView(data)
        self.view:show(true)
    else
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("次数不足")
        self:dispatch_package_event('Event_Lucky_Buy_End')
    end
end

function LuckyBoxModule:on_show(data)
    self.view:hide();
    MatchingManager:get_luckybox_status(function(info)
        self:box_open_status(info)
    end,
            function(info)
                self:box_close_status()
            end
    )
end

function LuckyBoxModule:on_click(obj, arg)
    print("点击", obj.name, obj.transform.parent.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnClose" then
        ModuleCache.ModuleManager.hide_module("public", "luckybox")
        return
    elseif obj.name == "BtnOpen" then
        self:open_box()
    elseif obj.name == "BtnGiveup" then

        self:giveup_box()
    elseif obj.name == "BtnBuy" then
        ModuleCache.PayManager().get_pay_type(self.data)
        self:dispatch_package_event('Event_Lucky_Buy_End')
        if self.modelData.hallData.smartTimer.luckybox then
            CSmartTimer:Kill(self.modelData.hallData.smartTimer.luckybox)
            self.modelData.hallData.smartTimer.luckybox = nil
        end
    end
end

function LuckyBoxModule:open_box()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getAwards?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name(),
            activityId = self.activityId
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self:box_open_status(retData.data[1],true)
            self:dispatch_package_event("Event_Package_RefreshUserInfo")
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end )
end

function LuckyBoxModule:giveup_box()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/closeChest?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            gameId = AppData.get_app_and_game_name()
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            if self.modelData.hallData.smartTimer.luckybox then
                CSmartTimer:Kill(self.modelData.hallData.smartTimer.luckybox)
                self.modelData.hallData.smartTimer.luckybox = nil
            end
            self:dispatch_package_event('Event_Lucky_Buy_End')
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end )
end

return LuckyBoxModule



