






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class AgentWithdrawCashModule:ModuleBase
local AgentWithdrawCashModule = class("agentWithdrawCashModule", ModuleBase)


---@field view AgentWithdrawCashView

local GameManager = ModuleCache.GameManager
-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local PlayerPrefs = UnityEngine.PlayerPrefs
local AppData = AppData


function AgentWithdrawCashModule:initialize(...)
	ModuleBase.initialize(self, "agentwithdrawcash_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function AgentWithdrawCashModule:on_module_inited()
	
end



-- 绑定module层的交互事件
function AgentWithdrawCashModule:on_module_event_bind()
	--收到验证码并确认后
	self:subscibe_package_event("Event_Package_GetVerifyStatusWithdraw", function(eventHead, eventData)-- { verifyCode = verifyNum,extractType = self.data.extractType}
		local _money = 0
		local _cardId = nil
		if eventData.extractType == 1 then
			_money = tonumber(self.view.wcInput.text)
		else
			_money = tonumber(self.view.bcInput.text)
			_cardId = self.defaultCard.cardId
		end
		self:withDrawals({ extractType = eventData.extractType, money = _money, code = eventData.verifyCode, cardId = _cardId})
	end)

	self:subscibe_package_event("Event_Agent_BindBank_Success", function(eventHead, eventData)
		self:getCardList()
	end)


	self.view.wcInput.onEndEdit:AddListener(function(string)
		if self.view.wcInput.text ~= "" and  tonumber(self.view.wcInput.text) > tonumber(self.configData.commissionAmount) then
			self.view.wcInput.text = self.configData.commissionAmount
		end
	end)

	self.view.bcInput.onEndEdit:AddListener(function(string)
		if self.view.bcInput.text ~= "" and tonumber(self.view.bcInput.text) > tonumber(self.configData.commissionAmount) then
			self.view.bcInput.text = self.configData.commissionAmount
		end
	end)
end

-- 绑定loginModel层事件，模块内交互
function AgentWithdrawCashModule:on_model_event_bind()
	
end

function AgentWithdrawCashModule:on_show(data)
	self.view:hide()
	self.commissionAmount = data.commissionAmount
	self.view.cashNumTex_wechat.text = data.commissionAmount
	self.view.cashNumTex_card.text = data.commissionAmount

	self:checkAgentAuthMp()
	self:getCardList()

	self:getAgentsExtractConfig()
	self:getAgentsVo()
end

function AgentWithdrawCashModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "closeBtn" then
		ModuleCache.ModuleManager.destroy_module("public", "agentwithdrawcash")
	elseif(obj.name == "bcManger") then
		ModuleCache.ModuleManager.show_module("public", "agentbankcardmanager", {type = "manager"})
	elseif(obj.name == "bankCard") then
		if self.cardList and #self.cardList >0 then
			ModuleCache.ModuleManager.show_module("public", "agentbankcardmanager", {type = "change",callback = function(data)
				self.defaultCard = data

				self.view.cardTex.text = self.view:showCard( self.defaultCard)
			end})
		else
			ModuleCache.ModuleManager.show_module("public", "agentbankcardmanager", {type = "addCard"})
		end
	elseif(obj.name == "weChatMaxCashBtn" ) then
		if self.configData.redpackMaxExtractAmount/100 >= tonumber(self.configData.commissionAmount) then
			self.view.wcInput.text =self.configData.commissionAmount
		else
			self.view.wcInput.text = self.configData.redpackMaxExtractAmount/100
		end
	elseif(obj.name == "CardMaxCashBtn") then
		if self.configData.transitMaxExtractAmount/100  >= tonumber(self.configData.commissionAmount) then
			self.view.bcInput.text =self.configData.commissionAmount
		else
			self.view.bcInput.text = self.configData.transitMaxExtractAmount/100
		end
	elseif(obj.name == "wcWithdrawBtn") then
		if self.view.wcInput.text =="" or tonumber(self.view.wcInput.text) == 0 then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入提现金额")
			return
		end

		if self.configData.agentsExemptFeeLimit <=0 and tonumber(self.view.wcInput.text) <=  tonumber(self.configData.agentsFeeAmount/100) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("提现金额必须大于手续费")
			return
		end

		local realValue = tonumber(self.view.wcInput.text)
		if self.configData.agentsExemptFeeLimit <=0 then
			realValue = tonumber(self.view.wcInput.text) - tonumber(self.configData.agentsFeeAmount/100)
		end

		ModuleCache.ModuleManager.show_module("public", "phonebinding", {type = "Withdraw",tipTex = string.format("您正在提现%.2f元，实际到账金额%.2f元。 短信验证后即可提现。",self.view.wcInput.text, realValue ),extractType = 1,mobile = self.agentInfoData.mobile  } )
	elseif(obj.name == "bcWithdrawBtn") then

		if self.view.bcInput.text =="" or tonumber(self.view.bcInput.text) == 0 then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入提现金额")
		elseif self.configData.agentsExemptFeeLimit <=0 and tonumber(self.view.bcInput.text) <=  tonumber(self.configData.agentsFeeAmount/100)  then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("提现金额必须大于手续费")
		elseif not self.defaultCard then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请添加银行卡")
		else
			local realValue = tonumber(self.view.bcInput.text)
			if self.configData.agentsExemptFeeLimit <=0 then
				realValue = tonumber(self.view.bcInput.text) - tonumber(self.configData.agentsFeeAmount/100)
			end

			ModuleCache.ModuleManager.show_module("public", "phonebinding", {type = "Withdraw",tipTex = string.format("您正在提现%.2f元，实际到账金额%.2f元。 短信验证后即可提现。",self.view.bcInput.text, realValue),extractType = 2,mobile = self.agentInfoData.mobile})
		end

	elseif obj.name == "shareBtn" then
		ModuleCache.ShareManager().shareImage(false, true, false, "Wechat")


	elseif obj.name == "urlBtn" then
		self.view.helpPanel:SetActive(true)
	elseif obj.name == "closeBtn_help" then
		self.view.helpPanel:SetActive(false)

	elseif obj.name == "onclickWeChat" then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("提现到微信未开放。")
	elseif obj.name == "onclickBank" then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("提现到银行卡未开放。")
	end
end

--获取银行卡列表
function AgentWithdrawCashModule:getCardList()
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
			self.cardList = retData.data
			if # retData.data >0 then
				self.defaultCard = retData.data[1]
				self.view.bankCardStateSwitcher:SwitchState("hasBankCard")

				for i=1, # retData.data do
					if retData.data[i].isDefault  then
						self.defaultCard = retData.data[i]
					end
				end

				self.view.cardTex.text = self.view:showCard( self.defaultCard)
			else
				self.defaultCard = nil
				self.view.bankCardStateSwitcher:SwitchState("noBankCard")
			end

		--end
	end, function(wwwErrorData)
        print(wwwErrorData.error)
	end)
end

--获取提现配置
function AgentWithdrawCashModule:getAgentsExtractConfig()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/reward/getAgentsExtractConfig?",
		params = {
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		--if(retData.success) then
		self.configData = retData.data
		self.configData.commissionAmount =self.commissionAmount

		self.view:initView(self.configData)
		--end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--提现
function AgentWithdrawCashModule:withDrawals(info)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/reward/withDrawals?",
		params = {
			uid = self.modelData.roleData.userID,
			extractType = info.extractType,
			money =info.money * 100,
			code =info.code,
			cardId = info.cardId,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		--if(retData.success) then
		if retData.data then
			self:dispatch_package_event('Event_Agent_Withdraw', retData.data)
			if retData.data.auditStatus == 1 then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("提现审核中，请稍后")
			else
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("提现成功。")
			end

			ModuleCache.ModuleManager.hide_module("public", "agentwithdrawcash")
		end
		--end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end
--检测是否微信授权
function AgentWithdrawCashModule:checkAgentAuthMp()
	print("AgentWithdrawCashModule checkAgentAuthMp")
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/info/checkAgentAuthMp?",
		params = {
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		--if(retData.success) then
		if retData.success then
			self.view:showWcImage(retData.data)

			self.view:show(true)
		end
		--end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--获取代理详情/
function AgentWithdrawCashModule:getAgentsVo()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "agents/info/getAgentsVo?",
		params = {
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.agentInfoData = retData.data
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

return AgentWithdrawCashModule



