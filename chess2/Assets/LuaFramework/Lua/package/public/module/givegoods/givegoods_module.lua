local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local GiveGoodsModule = class("giveGoodsModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function GiveGoodsModule:initialize(...)
    -- 开始初始化                view        model           模块数据
    ModuleBase.initialize(self, "givegoods_view", nil, ...)

end

function GiveGoodsModule:on_show(data)
    self.giveUserId = nil
    self.goodsData = data.goodsData
    self.curPage = data.curPage
    -- print_table(data)
    self.view:refresh_view(data)
end

function GiveGoodsModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.buttonClose.gameObject then
        ModuleCache.ModuleManager.hide_module("public", "givegoods")
    elseif obj == self.view.btnCheck.gameObject then
        if (self:checkIdFail()) then
            return nil
        end
        self:get_userinfo(self.view.inputText.text)
    elseif obj == self.view.btnGive.gameObject then
        if (self:checkIdFail()) then
            return nil
        end
        if (self.giveUserId == nil) then
            self:get_userinfo(self.view.inputText.text, function()
                ModuleCache.PayManager().buy_gold(self.goodsData.id, nil, function()
                    ModuleCache.ModuleManager.hide_module("public", "givegoods")
                end)
            end)
        else
            ModuleCache.PayManager().buy_gold(self.goodsData.id, nil, function()
                ModuleCache.ModuleManager.hide_module("public", "givegoods")
            end)
        end
    end
end

-- 检查输入框输入的ID是否非法 true:非法，无法进行赠送
function GiveGoodsModule:checkIdFail()
    if (self.view.inputText.text == nil or self.view.inputText.text == "") then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入正确的用户ID！")
        return true
    end
    if (self.modelData.roleData.userID == self.view.inputText.text) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("赠送体力需填入他人ID！")
        return true
    end
    return false
end

function GiveGoodsModule:get_userinfo(userId, callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = userId,
        },
        cacheDataKey = "user/info?uid=" .. userId,
        cacheDataImmediatelyCallback = true,
    }

    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            --OK
            print("retData:")
            print_table(retData)
            self.view:showPlayer(retData.data)
            self.giveUserId = retData.data.userId
            if (callback ~= nil and type(callback) == "function") then
                callback()
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("用户不存在")
        end
    end, function(error)
        print(error.error)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then
            --OK
            print("cacheData:")
            print_table(retData)
            self.view:showPlayer(retData.data)
            self.giveUserId = retData.data.userId
        else
            -- ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("用户不存在")	
        end
    end)
end


return GiveGoodsModule