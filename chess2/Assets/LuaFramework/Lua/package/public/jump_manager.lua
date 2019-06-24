local Model = require('core.mvvm.model_base')
local class = require("lib.middleclass")
---@class JumpManager
local JumpManager = class('JumpManager', Model)

function JumpManager:initialize(...)
    Model.initialize(self, ...)
    self.modelData = require("package.public.model.model_data")
end

function JumpManager:ad_jump(url, data, onComplete)
    local from = data._from

    -- 跳转到商城界面
    if url == "shoping" then
        ModuleCache.ModuleManager.show_module("public", "shop",{ showpage = 2, isUsedDefault = true });
        ModuleCache.ModuleManager.hide_module("public", "activity");
    elseif url == "buyProduct" then
        if(data.productPayType)then

            local exchangeData = {
                productNum = data.productNum,
                productType = data.productType,
                productPayType = data.productPayType,
                productsConfig = {
                    products = {
                        {
                            id = data.productId,
                            num = data.productNum,
                            payType = data.productPayType,
                            salePrice = data.productSalePriceStr,
                            productType = data.productType,
                        },
                    },
                },
            }
            local onExchangeFinish = function()
                ModuleCache.ModuleManager.show_module("public", "goldexchange", exchangeData)
            end
            exchangeData.onExchangeFinish = onExchangeFinish
            ModuleCache.ModuleManager.show_module("public", "goldexchange", exchangeData)
            return
        end
        ModuleCache.ModuleManager.add_module("public", "shop"):get_pay_type(data.productId);
        --ModuleCache.ModuleManager.hide_module("public", "activity");
        -- 跳转到客服界面
    elseif url == "customerService" then
        ModuleCache.ModuleManager.show_module("public", "customerservice");
        ModuleCache.ModuleManager.hide_module("public", "activity");

        -- 跳转到实名认证界面
    elseif url == "realNameAuth" then
        if self.modelData.hallData.verifyData.status == 0 then
            ModuleCache.ModuleManager.show_module("public", "phonebinding", "Binding");
            ModuleCache.ModuleManager.hide_module("public", "activity");
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您已实名认证，无需再次实名认证！")
        end

        -- 跳转到分享界面
    elseif url == "share" then
        ModuleCache.ModuleManager.show_module("public", "share");
        ModuleCache.ModuleManager.hide_module("public", "activity");

    elseif string.find(url, '{') and string.find(url, '}') then
        local urlData = ModuleCache.Json.decode(url)
        if(urlData.type and urlData.type == 'web_game')then
            self:openWebGame(urlData.code, from, onComplete)
        end

        -- 跳转到浏览器
    else

        local data = {
            link = url,
            style = 3,
            hide = false
        }
        -- 展示h5界面
        ModuleCache.ModuleManager.show_module("public", "webview", data);
    end
end

function JumpManager:openWebGame(code, from, onComplete)
    local webGameDataList = self.modelData.roleData.webGameDataList
    local openFun = function(dataList)
        for i, data in pairs(dataList) do
            if(data.code == code)then
                data.extendData = ModuleCache.Json.decode(data.extendStr)
                local needShow = true
                if ModuleCache.GameManager.platformIsAndroid then
                    data.isOpen = data.status == 0 and ModuleCache.SDKInterface().is_support_webgame()
                else
                    data.isOpen = data.status == 0 -- and ModuleCache.SDKInterface().is_support_webgame()
                    if not ModuleCache.SDKInterface().is_support_webgame() and data.code == "zhangdu_xiaoshuo" then
                        needShow = false
                    end
                end
                if(not needShow or (not data.isOpen))then
                    if(onComplete)then
                        onComplete()
                    end
                    if(from == 'Ad' or from == 'Activity')then
                        return
                    end
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待")
                    return
                end

                local intentData = {
                    code = data.code,
                    link = data.visitUrl,
                    style = data.extendData.viewStyle,
                    gameName = data.name,
                    from = from,
                }
                if TableManager:try_get_cur_runing_table_module() then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("正在房间中无法进行小游戏")
                    if(onComplete)then
                        onComplete()
                    end
                    return
                end
                ModuleCache.ModuleManager.show_module("public", "webgame", intentData)
                if(onComplete)then
                    onComplete()
                end
                return
            end
        end
        if(onComplete)then
            onComplete()
        end
        if(from == 'Ad' or from == 'Activity')then
            return
        end
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待")
    end
    if(webGameDataList)then
        openFun(webGameDataList)
    else
        self:getWebGameList(openFun)
    end
end

function JumpManager:getWebGameList(callback)
    self._getWebGameListTimes = (self._getWebGameListTimes or 0) + 1
    local requestData = {
        baseUrl = "webGame/getWebGameList?",
        params = {
            uid = self.modelData.roleData.userID,
            webGameUserId = ModuleCache.AppData.getWebGameUserId(self.modelData.roleData.userID),
        },
        cacheDataKey = string.format("%suid=%s&gameName=%s", "webGame/getWebGameList", self.modelData.roleData.userID, ModuleCache.AppData.get_url_game_name()),
        cacheDataImmediatelyCallbackAndSuccessCallback = true
    }
    self:http(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self._getWebGameListTimes = 0
            self.modelData.roleData.webGameDataList = retData.data
            if(callback)then
                callback(retData.data)
            end
        else
            if(not self.modelData.roleData.webGameDataList)then
                if(self._getWebGameListTimes > 10)then
                    self._getWebGameListTimes = 0
                    return
                end
                self:getWebGameList(callback)
            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end


JumpManager:initialize('public')

return JumpManager