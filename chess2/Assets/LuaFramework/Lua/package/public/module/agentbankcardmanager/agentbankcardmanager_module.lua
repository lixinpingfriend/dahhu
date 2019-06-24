

local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local AgentBankCardmManagerModule = class("agentBankCardmManagerModule", ModuleBase)
local GameManager = ModuleCache.GameManager
-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local PlayerPrefs = UnityEngine.PlayerPrefs
local AppData = AppData
local CSmartTimer = ModuleCache.SmartTimer.instance


function AgentBankCardmManagerModule:initialize(...)
	ModuleBase.initialize(self, "agentbankcardmanager_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function AgentBankCardmManagerModule:on_module_inited()
	self.view.province_dropdown.onValueChanged:AddListener(function(idx)
		self.view:updateCityData(idx)
		self.view.city_dropdown.value = 0
		self.view.city_dropdown:RefreshShownValue()
	end)
end



-- 绑定module层的交互事件
function AgentBankCardmManagerModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function AgentBankCardmManagerModule:on_model_event_bind()
	
end

function AgentBankCardmManagerModule:on_show(data)
	--{type = "change",data = self.cardList}
	self.data = data
	self.view.stateSwitcher:SwitchState(self.data.type)
	self:hide_view()
	self:getCardList()
end

function AgentBankCardmManagerModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "closeBtn" or obj.name == "BgMask" then
		ModuleCache.ModuleManager.hide_module("public", "agentbankcardmanager")
	elseif(obj.name == "okBtn") then
		self:bindBankCard()
	elseif(obj.name == "bankCard") then
		self.view.stateSwitcher:SwitchState("addCard")
	elseif(obj.name == "getIDCodeBtn") then
		self:getVilidateCode()
	elseif(string.sub(obj.name, 1, 4) == "item")then

		local idx = tonumber(string.split(obj.name, "_")[2])
		if self.data.type == "change" then
			if self.data.callback then
				self.data.callback( self.cardList[idx] )
			end
			ModuleCache.ModuleManager.hide_module("public", "agentbankcardmanager")
		elseif self.data.type == "manager" then
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确定要解绑该银行卡吗？解绑后不能再提现到该银行卡"), function()
				self:unbindBankCard(idx)
			end, nil)
		end


	end
end

function AgentBankCardmManagerModule:getCardList()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/bank/getCardList?",
		params = {
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		--if(retData.success) then
			self:show_view()
			self.cardList = retData.data
			self.view:initLoopScrollViewList(self.cardList,self.data )

		--end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

function AgentBankCardmManagerModule:getVilidateCode()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/bank/getVilidateCode?",
		params = {
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.view.getIdCodeObj:SetActive(false)
			self.view.getIdCode_cdTex.gameObject:SetActive(true)
			if self.cdId then
				CSmartTimer:Kill(self.cdId)
			end
			self.cdId = self:subscibe_time_event(60, false, 0):OnUpdate(function(t)
				t = t.surplusTimeRound
				self.view.getIdCode_cdTex.text = t.."s"
			end):OnComplete(function(t)
				self.view.getIdCodeObj:SetActive(true)
				self.view.getIdCode_cdTex.gameObject:SetActive(false)
			end).id
		end
	end, function(wwwErrorData)
        print(wwwErrorData.error)
	end)
end

function AgentBankCardmManagerModule:bindBankCard()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/bank/bind?",
		params = {
			uid = self.modelData.roleData.userID,
			bankProvince = self.view.province_dropdown.captionText.text,
			bankCity = self.view.city_dropdown.captionText.text,
			bankSubbranch =self.view.bankSubbranchInput.text,
			bankAccountName =self.view.bankAccountNameInput.text,
			bankCardNo =self.view.bankCardNoInput.text,
			smsCode =self.view.smsCodeInput.text,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		--if(retData.success) then
			if retData.data then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("银行卡绑定成功")
				self:dispatch_package_event("Event_Agent_BindBank_Success")
				ModuleCache.ModuleManager.hide_module("public", "agentbankcardmanager")
			end
		--end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

function AgentBankCardmManagerModule:unbindBankCard(idx)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/bank/unbind?",
		params = {
			uid = self.modelData.roleData.userID,
			cardId = self.cardList[idx].cardId
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		--if(retData.success) then
		if retData.data then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("银行卡解绑成功")
			self:getCardList()
		end
		--end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

return AgentBankCardmManagerModule



