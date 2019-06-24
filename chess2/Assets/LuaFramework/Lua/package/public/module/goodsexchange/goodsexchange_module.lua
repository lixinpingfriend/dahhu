local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

local GoodsExchangeModule = class("GoodsExchangeModule", ModuleBase)

local ModuleCache = ModuleCache

function GoodsExchangeModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "goodsexchange_view", nil, ...)
end

function GoodsExchangeModule:on_show(data)
    self.view:hide()
    if data then
        self.exchangeId = data.exchangeId
        self.callBack = data.callBack
        self.view:initShow()
        self.view:show()
    end 
end

function GoodsExchangeModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnCloseExchangeInfo" then
        ModuleCache.ModuleManager.hide_module("public", "goodsexchange")
    elseif obj.name == "BtnExchangeInfoEnter" then
        self:get_exchange()
    elseif obj.name == "GetKey" then
        self:GetVerifyCode()
    end
end


--兑换物品
function GoodsExchangeModule:get_exchange()
    if self.view.phoneInPut.text == "" or self.view.dizhiIput.text == "" or self.view.nameInPut.text == "" then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请填写正确的联系信息！")
        return 
    end 
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .."packetItem/exchange?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            mobile = self.view.phoneInPut.text,
            verifyCode = 111111, --跟后台协商，写死
            address = self.view.dizhiIput.text,
            itemId =  self.exchangeId,
            realName = self.view.nameInPut.text
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if retData.ret == 0 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("兑换成功")
            if self.callBack ~= nil then
                self.callBack()
                self.callBack = nil
            end 
            ModuleCache.ModuleManager.hide_module("public", "goodsexchange")
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("兑换失败")
        end
    end, function(errorData)
        print(errorData.error)
    end)
end 


return GoodsExchangeModule