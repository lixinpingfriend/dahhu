






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumAccModule = class("museumAccModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumAccModule:initialize(...)
	ModuleBase.initialize(self, "museumAcc_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumAccModule:on_module_inited()
	
end



-- 绑定module层的交互事件
function MuseumAccModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumAccModule:on_model_event_bind()
	
end

function MuseumAccModule:on_show(data)
	self.museumData =data
	self.view:update_museum_coins(self.museumData)
	self.view:update_game_name_info()
	self:getUserNewMessage()

end


function MuseumAccModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ButtonCancel" or obj.name == "BgMask" then
		ModuleCache.ModuleManager.hide_module("public", "museumacc")
		self:dispatch_module_event("chessmuseum", "Event_Update_OneChessMuseum")
	elseif(obj.name == "turnOutPowerBtn") then
		self:transferToMuseum(1)
	elseif(obj.name == "turnOutCashBtn") then
		self:transferToMuseum(2)
	elseif(obj.name == "powerBtn") then
		ModuleCache.ModuleManager.show_module("public", "shop",5)
	elseif(obj.name == "cashBtn") then
		ModuleCache.ModuleManager.show_module("public", "shop",2)

	elseif(obj.name == "buyBtn_agent") then
		ModuleCache.ModuleManager.hide_module("public", "museumacc")
		self:dispatch_module_event("chessmuseum", "Event_Update_OneChessMuseum")
		ModuleCache.ModuleManager.show_public_module("agentback",{
			parlorId =self.museumData.id,
			gameId =self.museumData.curBoxData.gameId
		})
	end
end

local urls = {"parlor/list/transferCoinsAccounts","parlor/list/transferCardsAccounts"}
function MuseumAccModule:transferToMuseum(t) -- t :1 体力    2 钻石

	--banMemberCharge  -- 禁止成员充值  0 关闭  1 打开
	if self.museumData.banMemberCharge == 1 and self.museumData.playerRole ~= "OWNER" and self.museumData.playerRole ~= "ADMIN" then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("普通成员不能充值到亲友圈余额。")
		return
	end

	local amount = 0
	local gameName = nil
	if t == 1 then
		amount = tonumber(self.view.inputField_power.text )
	else
		amount = tonumber(self.view.inputField_cash.text )
		gameName = self.museumData.curBoxData.gameId
	end

	if not amount or amount == 0 then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入有效转入数量")
		return
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. urls[t].."?",
		showModuleNetprompt = true,
		params =
		{
			uid = self.modelData.roleData.userID,
			amount = amount,
			parlorId = self.museumData.id,
			gameName = gameName
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = ModuleCache.Json.decode(wwwData.www.text)
		print_table(retData)
		if retData.ret == 0 then
			self.museumData.curBoxData.costData= retData.data
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("转入成功")
			self.view:update_museum_coins(self.museumData)
			self:getUserNewMessage()
		else

		end
	end , function(errorData)
		print(errorData.error)
		if tostring(errorData.error):find("500") ~= nil or tostring(errorData.error):find("error") ~= nil then
			if errorData.www.text then
				local retData = errorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
				end
			end
		end
	end )
end


function MuseumAccModule:getUserNewMessage()

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "msg/getNewMsg?",
		showModuleNetprompt = true,
		params =
		{
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = ModuleCache.Json.decode(wwwData.www.text)
		print_table(retData)
		if retData.ret == 0 then
			local data = retData.data
			self.view:update_my_coins(data)
		else

		end
	end , function(errorData)
		print(errorData.error)
	end )
end


return MuseumAccModule



