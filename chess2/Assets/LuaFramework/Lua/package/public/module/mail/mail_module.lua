local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MailModule = class("MailModule", ModuleBase)
local Util = Util
-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function MailModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "mail_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MailModule:on_module_inited()

end

-- 绑定module层的交互事件
function MailModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        self:refreshPlayerInfo()
    end)
end

-- 绑定loginModel层事件，模块内交互
function MailModule:on_model_event_bind()


end

function MailModule:set_view_values()

end

function MailModule:on_show()

    self:refreshPlayerInfo()
    self:get_mail_data(function(info)
        self.chooseid = 1
        self.view:init_mail_view(info, 1)
        --if #info > 0 then
        --    if self.data[self.chooseid].status == 1 then
        --        self:read_mail(self.data[self.chooseid].msgId)
        --    end
        --end

    end)


end

function MailModule:refreshPlayerInfo()
    self.view:refreshPlayerInfo(self.modelData.roleData)

end

function MailModule:on_hide()
end

function MailModule:on_click(obj, arg)
    print("点击", obj.name, obj.transform.parent.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnClose" then
        ModuleCache.ModuleManager.hide_module("public", "mail")
    elseif obj.transform.parent.name == "Content" then
        local index = tonumber(obj.name)
        self.chooseid = index
        self.view:item_choose(index)
        if self.data[self.chooseid].status == 1 then
            self:read_mail(self.data[self.chooseid].msgId)
        end
    elseif obj.name == "GetBtn" then
        self:get_mail_award(self.data[self.chooseid].msgId)
    elseif obj.name == "GetAllBtn" then
        self:get_all_mail_award()
    elseif obj.name == "DetBtn" then
        self:det_all_mail()
    elseif (obj.name == "Gem") then
        ModuleCache.ModuleManager.show_module("public", "shop", { showpage = 2, isUsedDefault = true })
    elseif (obj.name == "Gold") then
        ModuleCache.ModuleManager.show_module("public", "shop", 1)
    end
end

function MailModule:redTips(data)
    local num = 0
    for i = 1, #data do
        if (#data[i].attachs > 0 and data[i].attachStatus == 1) or data[i].status == 1 then
            num = num + 1
        end
    end
    self:dispatch_package_event("Event_Package_RefreshTips", { module = "Mail", tips = num > 0 })
end

function MailModule:get_mail_data(func)
    local addStr = "sys/msg/getMsgByUser?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        --showModuleNetprompt = true,
        params = {
            gameId = AppData.get_app_and_game_name(),
            uid = self.modelData.roleData.userID,
            --pageNum = 1,
            msgType = 1,
            --pageSize = 60,
            dayNum = 30
        }
    }
    self:http_get(requestData, function(wwwData)

        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.data = retData.data
            if func then
                func(retData.data)
            end
            self:redTips(self.data)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function MailModule:get_all_mail_award()
    for i = 1, #self.data do
        if self.data[i].attachStatus ~= 2 then
            if #self.data[i].attachs > 0 then
                self:get_mail_award(self.data[i].msgId)
            end
        end
    end
end

function MailModule:get_mail_award(msgid, callback)
    local addStr = "sys/msg/receiveAttachs?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            msgId = msgid,
            uid = self.modelData.roleData.userID
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            for i = 1, #self.data do
                if self.data[i].msgId == msgid then
                    self.data[i].attachStatus = 2
                    table.remove(self.data, i)
                    self.chooseid = 1
                    break
                end
            end
            self.view:init_mail_view(self.data, self.chooseid)
            self:redTips(self.data)
            ModuleCache.PayManager().getUserNewMessage()
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("领取成功")
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errorMsg)
        end
        if callback ~= nil then
            callback()
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function MailModule:read_mail(msgid)
    local addStr = "sys/msg/read?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            msgId = msgid,
            uid = self.modelData.roleData.userID
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            for i = 1, #self.data do
                if self.data[i].msgId == msgid then
                    self.data[i].status = 2
                end
            end
            self.view:init_mail_view(self.data, self.chooseid)
            self:redTips(self.data)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function MailModule:det_all_mail()
    local ids = nil

    for i = 1, #self.data do
        if self.data[i].status == 2 then
            if #self.data[i].attachs <= 0 or self.data[i].attachStatus == 2 then
                ids = ids ~= nil and ids .. "," or ""
                ids = ids .. self.data[i].msgId
            end
        end
    end
    if not ids then
        return
    end
    local addStr = "sys/msg/batchDelete?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            msgIds = ids,
            uid = self.modelData.roleData.userID
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            --删除后重新拉一边邮件数据
            local id = self.data[self.chooseid].msgId
            self:get_mail_data(function(info)
                local index = 0
                for i = 1, #info do
                    if info[i].msgId == id then
                        self.chooseid = i
                        index = i
                    end
                end
                if index == 0 and #info > 0 then
                    self.chooseid = 1
                end
                self.view:init_mail_view(self.data, self.chooseid)
            end)

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

return MailModule



