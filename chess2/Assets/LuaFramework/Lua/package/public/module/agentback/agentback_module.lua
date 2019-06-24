---
--- Created by dc-pc.
--- DateTime: 2018/11/20 11:05
---
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local PlayModeUtil = ModuleCache.PlayModeUtil

---@class AgentBackModule:ModuleBase
---@field view AgentBackView
local AgentBackModule = class("AgentBackModule", ModuleBase)
local ModuleCache = ModuleCache
function AgentBackModule:initialize(...)
    -- 开始初始化
    ModuleBase.initialize(self, "agentback_view", nil, ...)
    self.leftTogglesNames =
    {
        ToggleRecharge = "ToggleRecharge",
        ToggleGain = "ToggleGain",
        TogglePromot = "TogglePromot",
    }
end

function AgentBackModule:on_module_event_bind()
    --标题名字切换
    self:subscibe_module_event("agent","Event_Agent_TitleName",function (eventHead,eventData)
        print("receive module event Event_Agent_TitleName:"..eventData)
        self.view:titleSwitchState(eventData)
    end)
end
--[[左侧toggle监听
function AgentBackModule:onLeftToggleValueChange(value)
    if not value then return end
    for k, v in ipairs(self.view.leftToggles) do
        self.view.leftToggleSwitchers[k]:SwitchState(v.isOn and "isOn" or "isOff")
        if v.isOn then
            if v.name == self.leftTogglesNames.ToggleRecharge then
                ModuleCache.ModuleManager.show_public_module("agent")
            elseif v.name == self.leftTogglesNames.ToggleGain then
                ModuleCache.ModuleManager.show_public_module("agentearnings")
            elseif v.name == self.leftTogglesNames.TogglePromot then
                ModuleCache.ModuleManager.show_public_module("agentmywill")
            end
        else
            if v.name == self.leftTogglesNames.ToggleRecharge then
                ModuleCache.ModuleManager.hide_public_module("agent")
            elseif v.name == self.leftTogglesNames.ToggleGain then
                ModuleCache.ModuleManager.hide_public_module("agentearnings")
            elseif v.name == self.leftTogglesNames.TogglePromot then
                ModuleCache.ModuleManager.hide_public_module("agentmywill")
            end
        end
    end
end
function AgentBackModule:setLeftToggleIsOn(toggleName)
    for k, v in ipairs(self.view.leftToggles) do
        --print("setLeftToggleIsOn name:"..v.name..(v.isOn and ":true" or ":false")..",toggleName:"..toggleName)
        if v.name == toggleName then
            if v.isOn then
                self:onLeftToggleValueChange(true)
            else
                v.isOn = true
            end
        end
    end
end
--]]
function AgentBackModule:startLeftButtonClick(buttonName)
    if not self.leftTogglesNames[buttonName] then
        print("非左侧按钮！不予处理！")
        return
    end
    if buttonName == self.lastClickButton then
        return
    end
    if buttonName == self.leftTogglesNames.ToggleRecharge then
        ModuleCache.ModuleManager.show_public_module("agent",function ()
            self.view:show()
            self:resultLeftButtonClick(buttonName)
        end)
    elseif buttonName == self.leftTogglesNames.ToggleGain then
        ModuleCache.ModuleManager.show_public_module("agentearnings",function()
            self:resultLeftButtonClick(buttonName)
        end)
    elseif buttonName == self.leftTogglesNames.TogglePromot then
        ModuleCache.ModuleManager.show_public_module("agentmywill",function()
            self:resultLeftButtonClick(buttonName)
        end)
    end
end

function AgentBackModule:resultLeftButtonClick(buttonName)
    --隐藏之前的模块
    if self.lastClickButton == self.leftTogglesNames.ToggleRecharge then
        ModuleCache.ModuleManager.hide_public_module("agent")
    elseif self.lastClickButton == self.leftTogglesNames.ToggleGain then
        ModuleCache.ModuleManager.hide_public_module("agentearnings")
    elseif self.lastClickButton == self.leftTogglesNames.TogglePromot then
        ModuleCache.ModuleManager.hide_public_module("agentmywill")
    end
    for k, v in ipairs(self.view.leftToggles) do
        if v.name == buttonName then
            self.view.leftToggleSwitchers[k]:SwitchState("isOn")
        else
            self.view.leftToggleSwitchers[k]:SwitchState("isOff")
        end
        self.lastClickButton = buttonName
    end
end

function AgentBackModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == self.lastClickButton then
        return --左边Button有Toggle的效果,不重复点击
    end
    if obj.name == "ImageClose" then --关闭按钮
        if self.view.titleStateName == "record" then
            self:dispatch_module_event("agentback","Event_AgentBack_CloseTitle") --关闭充值记录界面
            self.view:titleSwitchState("normal")
        else
            ModuleCache.ModuleManager.destroy_module("public","agentback")
            ModuleCache.ModuleManager.destroy_module("public","agent")
            ModuleCache.ModuleManager.destroy_module("public", "agentearnings")
            ModuleCache.ModuleManager.destroy_module("public", "agentmywill")
            ModuleCache.GameManager.change_game_by_gameName(AppData.App_Name_Temp .. "_" .. AppData.Game_Name_Temp) --将玩法改为之前的玩法
            if self.closeFunc then
                self.closeFunc()
                self.closeFunc = nil
            end
        end
    else
        self:startLeftButtonClick(obj.name)
    end
end

function AgentBackModule:on_show(intentData)
    if self.modelData.roleData.isAgentForbid then
        --ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("您的推广员账户已被禁用。")
        ModuleCache.ModuleManager.show_public_module_alertdialog():show_confirm_cancel("您的推广员账户已被禁用。",function ()
            MatchingManager:openCustomerService()
        end,nil,nil,nil,"联系客服","我知道了")
        ModuleCache.ModuleManager.destroy_module("public","agentback")
        return
    end
    if self.modelData.roleData.isSpecialAgent then
        ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("您当前为渠道账号，请在后台操作")
        ModuleCache.ModuleManager.destroy_module("public","agentback")
        return
    end
    if intentData then
        self:jump2PalorCharge(intentData)
    else
        self:startLeftButtonClick(self.leftTogglesNames.ToggleRecharge)
    end
    AppData.App_Name_Temp = AppData.App_Name
    AppData.Game_Name_Temp = AppData.Game_Name
    self.view:hide() --先隐藏
end
--跳转到亲友圈充值
function AgentBackModule:jump2PalorCharge(intentData)
    local data =
    {
        callback = function ()
            self.view:show()
            self:resultLeftButtonClick(self.leftTogglesNames.ToggleRecharge)
        end,
        data = intentData,
    }
    ModuleCache.ModuleManager.show_public_module("agent",data)
    self.closeFunc = function()
        self:dispatch_module_event("chessmuseum", "Event_Update_OneChessMuseum")
    end
end

return AgentBackModule