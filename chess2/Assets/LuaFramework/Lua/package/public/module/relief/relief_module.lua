
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class ReliefModule : Module
---@field view ReliefView
local ReliefModule = class("Public.ReliefModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
function ReliefModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "relief_view", nil, ...)
    ---@type BankruptcyInfo
    self.reliefData = nil
    ---@type ShopProducts
    self.goodsData = nil

end

-- 模块初始化完成回调，包含了view，Model初始化完成
function ReliefModule:on_module_inited()

end

-- 绑定module层的交互事件
function ReliefModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Recharge_Success", function(eventHead, eventData)
        if self.isHide then
            return
        end
        print("救济金充值成功")
        ModuleCache.ModuleManager.hide_module("public", "relief")
        if self.exchange_finish then
            self.exchange_finish()
        end
    end)
end

-- 绑定Model层事件，模块内交互
function ReliefModule:on_model_event_bind()


end

function ReliefModule:on_show(data)
    if data == "Auto" then
        self:get_view():hide();
        return
    end


    if ModuleCache.GameManager.iosAppStoreIsCheck then
        self:hide_view()
        self:dispatch_package_event("Event_GoldJump_error")
        return
    end
    if data and type(data) == "table"  then
        self.exchange_finish = data.exchange_finish
        self.exchange_cancel = data.exchange_cancel
    else
        self.exchange_finish = nil
        self.exchange_cancel = nil
    end
    self:hide_view()
    self:getDaylyRelief()
end

function ReliefModule:showUI()
    self.view:setDaylyRelief(self.reliefData)
    self.view:setDaylyBuy(self.goodsData)
    self:show_view(true)
end

function ReliefModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "btnClose" then
        ModuleCache.ModuleManager.hide_module("public", "relief")
        self:dispatch_package_event("Event_GoldJump_error")
        if  self.exchange_cancel then
            self.exchange_cancel()
        end
    elseif obj.name == "BtnGet" then
        self:getGold()
    elseif obj.name == "BtnBuy" then
        if self.goodsData then
            ModuleCache.PayManager().get_pay_type(self.goodsData)
            --self:get_pay_type(self.goodsData.id)
        end
    end
end

function ReliefModule:getGold()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/bankruptcy?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            --self:getUserNewMessage()
            self:dispatch_package_event("Event_Package_RefreshUserInfo")
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("领取" .. retData.data.amount .. "金币成功！")
            ModuleCache.ModuleManager.hide_module("public", "relief")
            print("领取救济金成功")
            if self.exchange_finish then
                self.exchange_finish()
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end

    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function ReliefModule:getDaylyRelief()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/getBankruptcyDetail?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self.reliefData = retData.data
            self:getDaylyBuy()
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end

    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function ReliefModule:getDaylyBuy()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/getReliefProduct?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            coinType = 5
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            if #retData.data > 0 then
                self.goodsData = retData.data[1]
            end
            self:showUI()
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end

    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end


return ReliefModule



