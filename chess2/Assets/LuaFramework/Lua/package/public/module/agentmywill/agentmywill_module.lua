
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local AgentMyWillModule = class("AgentMyWillModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function AgentMyWillModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "agentmywill_view", nil, ...)
    self.shareData = {}
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function AgentMyWillModule:on_module_inited()

end

-- 绑定module层的交互事件
function AgentMyWillModule:on_module_event_bind()

end

-- 绑定Model层事件，模块内交互
function AgentMyWillModule:on_model_event_bind()


end

function AgentMyWillModule:on_show(data)
    self.view:hide()
    if self.shareData[1] == nil or self.shareData[2] == nil then
        self:getShareData(1, self.view.invitePromoterImage , function ()
            self:getShareData(2, self.view.invitePlayerImage , function ()
                if data ~= nil then data() end
                self.view:show()
            end)
        end)
    else
        if data ~= nil then data() end
        self.view:show()
    end

end

function AgentMyWillModule:getShareData(type, imageSpr, callBack)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getAppAgentShareUrl?",
        params = {
            uid = self.modelData.roleData.userID,
            targetType = type,
        }
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            local url = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getQrCode?url=" ..Util.encodeURL(retData.data.url);
            self:image_load_sprite(nil, url, function (texture)
                if texture ~= nil then
                    imageSpr.sprite = texture
                    self.shareData[type] = {
                        QR = texture,
                        Number = self.modelData.roleData.inviteCode
                    }
                end
            end)
            if callBack ~= nil then callBack() end
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end

function AgentMyWillModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj ==  self.view.invitePlayerFBtn then
        self:get_shareBg(2, function ()
            ModuleCache.ShareManager().shareImage(false, true, true, "Wechat")
        end)
        --self.view:initInvitePlayerShare(1, self.shareData[1])

    elseif obj ==  self.view.invitePlayerFCBtn then
        --self.view:initInvitePlayerShare(1, self.shareData[1])
        self:get_shareBg(2, function ()
            ModuleCache.ShareManager().shareImage(true, true, true, "Wechat")
        end)
    elseif obj ==  self.view.invitePromoterFBtn then
        self:get_shareBg(1, function ()
            ModuleCache.ShareManager().shareImage(false, true, true, "Wechat")
        end)

    elseif obj ==  self.view.invitePromoterFCBtn then
        self:get_shareBg(1, function ()
            ModuleCache.ShareManager().shareImage(true, true, true, "Wechat")
        end)
    end
end


function AgentMyWillModule:get_shareBg(type, callBack)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/info/shareBackground?",
        params = {
            uid = self.modelData.roleData.userID,
            type = type,
        }
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            self:rawimage_load_sprite(nil, retData.data.top, function (texture)
                self.shareData[type].top = texture
                self:rawimage_load_sprite(nil, retData.data.bottom, function (texture)
                    self.shareData[type].bottom = texture
                    self.view:initInvitePlayerShare(self.shareData[type])
                    if callBack ~= nil then callBack() end
                end)
            end)
        else

        end
    end
    local onError = function(data)
        print(data.error)
    end
    self:http_get(requestData, onResponse, onError)
end



return AgentMyWillModule



