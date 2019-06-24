





local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
--- @class AppstoreShopModule : Module
local AppstoreShopModule = class("AppstoreShopModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function AppstoreShopModule:initialize(...)
    -- 开始初始化                view        model           模块数据
    ModuleBase.initialize(self, "appstoreshop_view", nil, ...)

    local onAppFocusCallback = function(eventHead, state)
        if ModuleCache.GameManager.iosAppStoreIsCheck then
            return
        end
    end

    self:subscibe_app_focus_event(onAppFocusCallback)
end

-- 传入相应的ID转到相应的tag
function AppstoreShopModule:on_show(data)
    ModuleCache.PayManager().getUserNewMessage()
    self.view:iosCheckView()
end

function AppstoreShopModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    print("obj.name = " .. obj.name)
    if obj.name == "BuyGoodsBtn" then
        local data = self.view:iosCheckData()[tonumber(obj.transform.parent.name)]
        self:buy_goods_appstore(data)
    elseif obj.name == "closeBtn" then
        ModuleCache.ModuleManager.hide_module("public", "appstoreshop")
    end
end

function AppstoreShopModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        if self.view then
            self.view:refresh_tili(self.modelData.roleData.cards)
        end

    end)

end

function AppstoreShopModule:buy_goods_appstore(data)
    print_table(data, "appstore data")
    ModuleCache.WechatManager.onAppstorePaySucess = function()
        print("shopmodule__onAppstorePaySucess", data.productId, data.num, data.type)
        self:chargeByAd(2, data.num)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("充值" .. data.num .. "体力成功")
    end
    ModuleCache.GameSDKInterface:BuyAppStoreProduct(data.productId)
end
function AppstoreShopModule:chargeByAd(t, n)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "charge/chargeByAd?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            accountType = t,
            coins = n
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if (retData.ret and retData.ret == 0) then
            if (retData.data) then
                ModuleCache.PayManager().getUserNewMessage()
            end
        end

    end, function(errorData)
        print(errorData.error)
    end)
end


return AppstoreShopModule



