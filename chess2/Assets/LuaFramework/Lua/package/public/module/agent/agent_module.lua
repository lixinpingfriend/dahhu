---
--- Created by dengcheng.
--- DateTime: 2018/11/14 上午10:28
---
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local ModuleEventBase = require('core.mvvm.module_event_base')

---@class AgentModule:ModuleBase
---@field model AgentModel
---@field view AgentView
local AgentModule = class("AgentModule", ModuleBase)

local ModuleCache = ModuleCache

function AgentModule:initialize(...)
    -- 开始初始化
    ModuleBase.initialize(self, "agent_view", "agent_model", ...)
    self.chargeToggleNames =
    {
        ToggleRechargeGame = "ToggleRechargeGame",
        ToggleRechargeAgent = "ToggleRechargeAgent",
        ToggleRechargeGuild = "ToggleRechargeGuild",
    }
    for k, v in ipairs(self.view.chargeToggles) do
        v.onValueChanged:AddListener(handler(self,self.onRechargeToggleValueChange))
    end
    self.recordToggleNames =
    {
        ToggleRechargeRecord = "ToggleRechargeRecord",
        ToggleGiveRecord = "ToggleGiveRecord",
    }
    for k, v in ipairs(self.view.recordToggles) do
        v.onValueChanged:AddListener(handler(self,self.onRecordToggleValueChange))
    end
    --self.model:getAccountStatus()
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function AgentModule:on_model_event_bind()

    -- 获取账户状态回包
    self:subscibe_model_event("Event_Agent_GetAccountStatus", function(eventHead, eventData)
        self.view:getAccountStatus()
        if eventData then
            self.receiveAccountStatus = true
            if self.receiveAccountStatus and self.receiveAccountProduct then
                --self:dispatch_module_event("agent","Event_Agent_ReceiveHttpMsg","ToggleRecharge")
                if self.callback then
                    self.callback()
                end
                self.view:show()
            end
        end
    end)
    --获取商品列表
    self:subscibe_model_event("Event_Agent_GetAccountProduct",function (eventHead, eventData)
        --self.view:showItmes(eventData)
        self:showAgentProducts()
        if eventData then
            self.receiveAccountProduct = true
            if self.receiveAccountStatus and self.receiveAccountProduct then
                --self:dispatch_module_event("agent","Event_Agent_ReceiveHttpMsg","ToggleRecharge")
                if self.callback then
                    self.callback()
                end
                self.view:show()
            end
        end
    end)
    --获取亲友圈列表
    self:subscibe_model_event("Event_Agent_GetParlorList",function (eventHead, eventData)
        self:showParlorList()
    end)
    --查询玩家结果
    self:subscibe_model_event("Event_Agent_CheckUserResult",function(eventHead, eventData)
        self.view:showCheckResult(eventData)
    end)
    --充值记录
    self:subscibe_model_event("Event_Agent_GetRechargeRecord",function(eventHead,eventData)
        self.view:showRechargeRecord(eventData)
    end)
    --赠送记录
    self:subscibe_model_event("Event_Agent_GetGiveRecord",function(eventHead,eventData)
        self.view:showGiveRecord(eventData)
    end)
    --赠送成功
    self:subscibe_model_event("Event_Agent_GetGiveSuccess",function(eventHead,eventData)
        self.view:showGiveNum(false)
    end)
end
function AgentModule:on_module_event_bind()
    --关闭充值记录界面事件
    self:subscibe_module_event("agentback","Event_AgentBack_CloseTitle",function (eventHead,eventData)
        self.view:switchUiState("normal") --关闭充值记录界面
    end)
    --切换游戏玩法事件
    self:subscibe_package_event("Event_Package_selectWanfaDone", function(eventHead, eventData)
        if eventData then
            --self.playMode = PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
            self.model:getAccountStatus(true) --重新请求数据
            self.model:getProductStatus(true)
            self.view:setGameName()
            if self:getRechargeType() == 3 then
                self.model:getParlorList() --如果当前是亲友圈充值,那么请求亲友圈列表
            end
        end
    end)
    --监听充值成功事件
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        self.model:getAccountStatus() --重新请求数据
    end)
    self:subscibe_package_event("Event_Package_Recharge_Success",function (eventHead, eventData)
        self.model:GetDataFromServer_GetBigTabs() --充值成功重新请求商品数据,因为需要用到佣金余额
    end)
end

function AgentModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonGive" then --赠送按钮
        self.view:showGiveNum(true)
    elseif obj.name == "giveNumButtonGive" then --确认赠送钻石按钮
        local inputNum = self.view.inputGiveNum.text
        if inputNum == "" or tonumber(inputNum) <= 0 then
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("请输入赠送数量")
            return
        end
        if not self.model.checkedUserID or not (tostring(self.model.checkedUserID) == self.view.inputGiveID.text) then
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("请先检查输入的玩家ID")
            return
        end
        self.model:giveNum2UserWithTip(self.view.inputGiveNum.text,self.model.checkedUserID,self.model.checkedUserName)
    elseif obj.name == "giveNumBtnCloseGive" then --赠送钻石框关闭按钮
        self.view:showGiveNum(false)
    elseif obj.name == "giveNumButtonCheck" then  --赠送钻石检查ID按钮
        self.model:checkUserID(self.view.inputGiveID.text)
    elseif obj.name == "RechargeButtonGive" then --商品赠送按钮
        self.giveData = {}
        local data,guild = self.view:getData(obj.transform.parent.parent.name)
        self.giveData.data = data
        self.giveData.guildId = guild
        self.giveData.type = self:getRechargeType()
        self.view:showGiveProduct(true,self.giveData.data)
    elseif obj.name == "giveProductButtonGive" then --确认赠送商品按钮
        if not self.model.checkedUserID or not (tostring(self.model.checkedUserID) == self.view.pro_inputGiveID.text) then
            ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("请先检查输入的玩家ID")
            return
        end
        if self.giveData then
            self.model:giveProduct(self.giveData.data,self.giveData.type,self.model.checkedUserID,self.model.checkedUserName)
        end
    elseif obj.name == "giveProductBtnCloseGive" then --赠送商品框关闭按钮
        self.view:showGiveProduct(false)
    elseif obj.name == "giveProductButtonCheck" then --赠送商品检查ID按钮
        self.model:checkUserID(self.view.pro_inputGiveID.text)
    elseif obj.name == "ButtonRechargeRecord" then --充值记录按钮
        self.view:switchUiState("record")
        self:setRecordToggleValueChange(self.recordToggleNames.ToggleRechargeRecord)
        self:dispatch_module_event("agent","Event_Agent_TitleName","record") --改变标题
    elseif obj.name == "RechargeButtonBuy" then --商品购买按钮
        local data,guildId = self.view:getData(obj.transform.parent.parent.name)
        local type = self:getRechargeType()
        self.model:buyProduct(data,type,guildId)
    elseif obj.name == "ButtonWait" then --等太久按钮
        self:openCustomerService()
    elseif obj.name == "Switch" then
        print(ModuleCache.AppData.Is_Independent_App)
        if not ModuleCache.AppData.Is_Independent_App then
            --if self.curGameName then
            --    ModuleCache.GameManager.change_game_by_gameName(self.curGameName, true)
            --end
            local intentData = {
                openProvince = ModuleCache.GameManager.curProvince,
                museumOpen = true
            }
            ModuleCache.ModuleManager.show_module('public', "setplaymode",  intentData)
        else
            ModuleCache.ModuleManager.show_module("public", "switchgame", "chessmuseum_select_wanfa")
        end
    elseif obj.name == "nextPage" then
        if self.model.curPage then
            self:getRecordByPage(self.model.curPage + 1)
        end
    elseif obj.name == "previousPage" then
        if self.model.curPage then
            self:getRecordByPage(self.model.curPage - 1)
        end
    elseif obj.name == "buyAgain" then
        local recordData = self.view:getRecordData(obj.transform.parent.name)
        self.model:buyProductAgain(recordData)
    elseif obj.name == "giveAgain" then
        local recordData = self.view:getRecordData(obj.transform.parent.name)
        self.model:giveNumAgain(recordData)
    end
end
--充值toggle监听
function AgentModule:onRechargeToggleValueChange(value)
    log_debug("onRechargeToggleValueChange:"..(value and "true" or "false"))
    if not value then return end
    for k, v in ipairs(self.view.chargeToggles) do
        self.view.chargeToggleSwitchers[k]:SwitchState(v.isOn and "isOn" or "isOff")
        if v.isOn then
            if v.name == self.chargeToggleNames.ToggleRechargeGuild then
                self.view:switchRechargeState("palor")
                self.model:getParlorList()
            else
                self.view:switchRechargeState("game")
            end
        end
    end
    if not self.model.agentsProducts then
        self.model:getProductStatus(true)
    else
        self:showAgentProducts()
    end
end
function AgentModule:setRechargeToggleIsOn(toggleName)
    for k, v in ipairs(self.view.chargeToggles) do
        --print("setRechargeToggleIsOn name:"..v.name..(v.isOn and "true" or "false"))
        if v.name == toggleName then
            if v.isOn then
                self:onRechargeToggleValueChange(true)
            else
                v.isOn = true
            end
        end
    end
end
function AgentModule:getRechargeType()
    for k, v in ipairs(self.view.chargeToggles) do
        if v.isOn then
            if v.name == self.chargeToggleNames.ToggleRechargeGuild then
                return 3
            end
            if v.name == self.chargeToggleNames.ToggleRechargeGame then
                return 2
            end
            if v.name == self.chargeToggleNames.ToggleRechargeAgent then
                return 1
            end
        end
    end
end
--记录toggle
function AgentModule:onRecordToggleValueChange(value)
    if not value then return end
    for k, v in ipairs(self.view.recordToggles) do
        self.view.recordToggleSwitchers[k]:SwitchState(v.isOn and "isOn" or "isOff")
        if v.isOn then
            if v.name == self.recordToggleNames.ToggleRechargeRecord then
                self.model:getRechargeRecord(1)
            elseif v.name == self.recordToggleNames.ToggleGiveRecord then
                self.model:getGiveRecord(1)
            end
        end
    end
end
function AgentModule:getRecordByPage(pageNum)
    for k, v in ipairs(self.view.recordToggles) do
        if v.isOn then
            if v.name == self.recordToggleNames.ToggleRechargeRecord then
                self.model:getRechargeRecord(pageNum)
            elseif v.name == self.recordToggleNames.ToggleGiveRecord then
                self.model:getGiveRecord(pageNum)
            end
        end
    end
end
function AgentModule:setRecordToggleValueChange(toggleName)
    for k, v in ipairs(self.view.recordToggles) do
        print("setRecordToggleValueChange name:"..v.name..(v.isOn and "true" or "false"))
        if v.name == toggleName then
            if v.isOn then
                self:onRecordToggleValueChange(true)
            else
                v.isOn = true
            end
        end
    end
end

function AgentModule:showAgentProducts()
    print("showAgentProducts")
    if self.model.agentsProducts then
        self.view:showItmes(self.model.agentsProducts,self:getRechargeType())
    end
end
function AgentModule:showParlorList()
    if self.model.parlorList then
        print(self.parlorId)
        self.view:showParlorList(self.model.parlorList,self.parlorId)
        self.parlorId = nil
    end
end

function AgentModule:openCustomerService()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/isCustomer?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if retData.data then
                ModuleCache.ModuleManager.show_public_module("customerservicesystem");
                --self.view.spritecustomerServiceRed:SetActive(false)
            else
                ModuleCache.ModuleManager.show_module("public", "customerservice");
            end
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

function AgentModule:on_show(intentData)
    if type(intentData) == "function" then
        self.callback = intentData
        self.view:showView()
        self:setRechargeToggleIsOn(self.chargeToggleNames.ToggleRechargeGame)
    elseif type(table) == "table" then
        self.callback = intentData.callback
        ModuleCache.GameManager.change_game_by_gameName(intentData.data.gameId, true)
        self:setRechargeToggleIsOn(self.chargeToggleNames.ToggleRechargeGuild)
        --TODO 选中默认亲友圈
        self.parlorId = intentData.data.parlorId
        self.view:showSwitch(false)
    end
    self.model:getAccountStatus(true)
    self.view:setGameName()
    self:hide()

end

return AgentModule