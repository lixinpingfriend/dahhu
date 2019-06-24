





local try = require('lib.try')
local catch = require('lib.catch')
local finally = require('lib.finally')
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class WebGameModule : Module
---@field view WebGameView
---@field WebGameView WebGameView
local WebGameModule = class("BullFight.WebGameModule", ModuleBase)
local ModuleEventBase = require('core.mvvm.module_event_base')

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local CSmartTimer = ModuleCache.SmartTimer.instance


function WebGameModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "webgame_view", nil, ...)
end

function WebGameModule:on_module_event_bind()
	self:subscibe_module_event("shopPayType", "CloseView", function(eventHead, eventData)
		self.view:SetVisibility(true);
	end)

	self:subscibe_module_event("hall", "urlSchemeIntentdata", function(eventHead, eventData)
		if eventData then
			self:on_js(eventData)
		end
	end)

	self:subscibe_app_focus_event(function(eventHead, eventData)
		if eventData then
			self.view:show()
			if(self.webViewInit)then
				self.view:SetVisibility(true);
				if(ModuleCache.ModuleManager.module_is_active('public', 'shoppaytype'))then
					ModuleCache.ModuleManager.destroy_module('public', 'shoppaytype')
					self.view:SetVisibility(true);
				end
			end
		end
	end)
end


function WebGameModule:on_show(intentData)
	ModuleCache.GameManager.webGameModuleShow = true
	ModuleCache.SoundManager.set_music_mute(true)
	self.intentData = intentData
	if intentData then
		if not ModuleCache.SDKInterface().is_support_webgame() then
			if intentData.style == 8 then
				intentData.style = 6
			end
		end

		ModuleCache.ModuleManager.show_public_module("netprompt")
		print("打开链接" .. intentData.link)
		intentData.module = self
		self.view:initUniWebView(intentData, function()
			if(not intentData.hide)then
				self.view:LoadURL(intentData.link)
				self.view:SetVisibility(true);
			end
		end)
		self._waitFinishLoadTimeEventId = self:subscibe_time_event(15, false, 0):OnComplete(function(t)
			self:showReloadDialog()
		end).id


		--if ModuleCache.GameManager.isEditor then
		--	self:subscibe_time_event_on(3, function ()
		--
		--		local intentData = {
		--			gameUserId = 37000945,
		--			cpUserId = "66666",
		--			itemId = "TY28C000610101",
		--			itemInfo = "60000金币",
		--			price = 6,
		--			orderId = "e270f11f54ff50",
		--			notifyUrl = "undefined/open/ve/pay/sincebest/h5/callback"
		--		}
		--
		--		local js = string.format("SBestH5GameSDK.payInDiamondFromUnity(%s)", ModuleCache.GameUtil.table_encode_to_json(intentData))
		--		--js = [[Unity.call('ua=' + navigator.userAgent)]]
		--		self.view.webview:EvaluateJS(js)
		--	end)
		--
		--	--self:subscibe_time_event_on(5, function ()
		--	--	local js = string.format("SBestH5GameSDK.closeGame()")
		--	--	--js = [[Unity.call('ua=' + navigator.userAgent)]]
		--	--	self.view.webview:EvaluateJS(js)
		--	--end)
		--end

		if intentData.hide then
			self.view:hide_view()
		end
		local data = {
			from = intentData.from or "",
			platform = ModuleCache.GameManager.platformIsAndroid and "Android" or "iOS"
		}
		ModuleCache.TalkingDataMgr().setEvent("Open_WebGame" .. (intentData.gameName or ""), data)

		self:report("Open")
	end
end

function WebGameModule:report(remark)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "dataProcess/addHotPointData?",
		params =
		{
			uid = self.modelData.roleData.userID,
			pageCode = self.intentData and self.intentData.from or "",
			code = self.intentData and self.intentData.gameName or "",
			remark = remark,
		},
	}
	self:http_get(requestData, function(wwwOperation)

	end)
end

function WebGameModule:load_javascript()
	if ModuleCache.SDKInterface().is_support_webgame() then
		return require('package.public.module.webgame.SinceBestH5GameSDK')
	else
		return require('package.public.module.webgame.SinceBestH5GameSDK_UniWebView')
	end

end

function WebGameModule:on_js(msg)
	if ModuleCache.SDKInterface().is_support_webgame() then
		if(msg)then
			try
			{
				function()
					local msgData = ModuleCache.GameUtil.json_decode_to_table(msg)
					if(msgData)then
						self:findFunctionAndCall(msgData.funcName, msgData.params)
					end
				end,
				catch
				{
					function(errors)
						if(errors)then
							coroutine.start(function ()
								coroutine.wait(0)
								assert(not errors, string.format('msg=%s catch errors:%s', msg, errors))
							end)
						end
					end
				}
			}
		end
	else
		if type(msg) == "table" then
			self:findFunctionAndCall(msg.funcName, msg.params)
		end
	end

end

function WebGameModule:on_error(msg)
	print("on_error：" .. msg)
	ModuleCache.LogManager.custom_Log('on_js_error:' .. tostring(msg))
	if(self:isSameDomain(msg, self.intentData.link))then
		self:showReloadDialog()
	end
	--if string.find(msg, "to be offline") then
	--	ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("网络超时，请重试")
	--	ModuleCache.ModuleManager.destroy_module("public", "webgame")
	--else
	--	self:showReloadDialog(msg)
	--end
end

function WebGameModule:on_http_error(msg)
	print("on_http_error：" .. msg)
	ModuleCache.LogManager.custom_Log('on_js_http_error:' .. tostring(msg))
	--self:showReloadDialog(msg)
end

function WebGameModule:on_started(msg)

	print("on_started：" .. msg)
end

function WebGameModule:on_loaded(msg)
	if not self.webViewInit then
		self.webViewInit = true
	end
	self.view:EvaluateJS(self:load_javascript())
	if not ModuleCache.SDKInterface().is_support_webgame() then
		self.view:EvaluateJS(string.format("SBestH5GameSDK.setUrlScheme('%s')", ModuleCache.GameParameters.urlScheme))
	end
	self.view:refreshBtnsState()
	ModuleCache.ModuleManager.hide_public_module("netprompt")
	self.view:SetVisibility(true);
	if(self._waitFinishLoadTimeEventId)then
		CSmartTimer:Kill(self._waitFinishLoadTimeEventId)
		self._waitFinishLoadTimeEventId = nil
	end
	print("on_loaded：" .. (msg or ""))
end

function WebGameModule:isSameDomain(srcUrl, dstUrl)
	local startIndex = string.find(srcUrl, 'http')
	if(not startIndex)then
		return false
	end
	srcUrl = string.sub(srcUrl, startIndex)
	startIndex = string.find(srcUrl, '?')
	if(startIndex)then
		srcUrl = string.sub(srcUrl, 1, startIndex - 1)
	end

	startIndex = string.find(dstUrl, 'http')
	if(not startIndex)then
		return false
	end
	dstUrl = string.sub(dstUrl, startIndex)
	startIndex = string.find(dstUrl, '?')
	if(startIndex)then
		dstUrl = string.sub(dstUrl, 1, startIndex - 1)
	end
	return srcUrl == dstUrl
end

function WebGameModule:on_js_payinmiamond(data)
	if(type(data) == 'string')then
		data = ModuleCache.GameUtil.json_decode_to_table(Util.decodeURL(data))
	end
	self.view:SetVisibility(false)
	data.webGamePay = true
	data.webGameType = self.intentData.code
	if(self.intentData.style == 7 or self.intentData.style == 8)then
		data.resetRootScale = 0.8
	end
	data.goodsData = {
		productName = data.itemInfo
	}

	ModuleCache.PayManager().get_pay_type(data.goodsData, nil, nil, data)
	print("on_js_payinmiamond：" .. data.gameUserId)
	local data = {
		from = self.intentData.from or "",
		platform = ModuleCache.GameManager.platformIsAndroid and "Android" or "iOS"
	}
	ModuleCache.TalkingDataMgr().setEvent("Pay_WebGame" .. (self.intentData.gameName or ""), data)
	self:report("ShowPay")
end

function WebGameModule:on_js_closegame()
	self:close_webgame()
end

function WebGameModule:on_click(obj, arg)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "CloseBtn" or obj.name == 'closeBtn' then
		if self.onBackButton then
			self.onBackButton();
			self.onBackButton = nil;
		end
		self:close_webgame()
		ModuleCache.ModuleManager.hide_public_module("netprompt")
	elseif obj.name == 'ButtonShowWebView' then
		self.view:SetVisibility(true)
	elseif obj.name == 'ButtonTest' then
		self:on_click_test_btn()
	elseif obj.name == 'ButtonGoBack' then
		self:on_click_goback_btn()
	elseif obj.name == 'ButtonGoForward' then
		self:on_click_goforward_btn()
	elseif obj.name == 'ButtonRefresh' then
		self:on_click_refresh_btn()
	elseif obj.name == 'ButtonHome' then
		self:on_click_home_btn()
	end
end

function WebGameModule:on_click_test_btn()
	self:call_js_function('SBestH5GameSDK.pageBack')
end

function WebGameModule:on_click_goback_btn()
	if(self.view.webview:CanGoBack())then
		self.view.webview:GoBack()
		self.view:refreshBtnsState()
	end
end

function WebGameModule:on_click_goforward_btn()
	if(self.view.webview:CanGoForward())then
		self.view.webview:GoForward()
		self.view:refreshBtnsState()
	end
end

function WebGameModule:on_click_refresh_btn()
	self:call_js_function('SBestH5GameSDK.refreshWeb')
end

function WebGameModule:on_click_home_btn()
	self.view.webview:LoadURL(self.intentData.link)
	self.view:SetVisibility(true);
end

function WebGameModule:close_webgame()
	self.view:SetVisibility(false);
	--self.view.webview:Hide()
	--self.view.webview:Close()
	ModuleCache.ModuleManager.destroy_module("public", "webgame")
end

-- 添加返回按钮监听
function WebGameModule:addBackButtonListener(callback)

	self.onBackButton = callback;
end

function WebGameModule:on_update()
	if(self.intentData and self.intentData.style == 7 and self.view.webview)then
		local progress = self.view:Progress()
		self.view:refreshProcessSlider(progress * 0.01)

		if ModuleCache.GameManager.customOsType == 1 and ModuleCache.UnityEngine.Input.GetKeyDown(ModuleCache.UnityEngine.KeyCode.Escape)then
			self:on_click_goback_btn()
		end
	end
end



function WebGameModule:on_destroy()
	--ModuleEventBase:dispatch_package_event("Event_Package_Recharge_Success")
	ModuleCache.SoundManager.set_music_mute(false)
end

function WebGameModule:findFunctionAndCall(funcName, params, callAll)
	local hasCalled = self:find_and_call_registed_function(funcName, params)
	if(hasCalled and not callAll)then
		return true
	end
	local fun = self[funcName]
	if(fun and type(fun) == 'function')then
		fun(self, params)
		return true
	end
	return hasCalled or false
end

function WebGameModule:regist_js_call_function(key, func)
	self._funcTable = self._funcTable or {}
	local list = self._funcTable[key]
	if(not list)then
		list = {}
		self._funcTable[key] = list
	end
	table.insert(list, func)
end

function WebGameModule:find_and_call_registed_function(key, params)
	if(self._funcTable)then
		local list = self._funcTable[key]
		if(not list or #list == 0)then
			return false
		end
		for i = 1, #list do
			list[i](params)
		end
		return true
	end
	return false
end

function WebGameModule:call_js_function(fullFuncName, params)
	local js
	if(params)then
		if(type(params) == 'table')then
			params = ModuleCache.GameUtil.table_encode_to_json(params)
		elseif(type(params) == 'number')then
			params = tostring(params)
		end
		js = string.format("%s(%s)", fullFuncName, params)
	else
		js = string.format("%s()", fullFuncName)
	end
	self.view.webview:EvaluateJS(js)
end

function WebGameModule:showReloadDialog(msg)
	msg = msg or '加载失败'
	msg = msg .. '，请重试'
	local resetRootScale = nil
	if(self.intentData.style == 7 or self.intentData.style == 8)then
		resetRootScale = 0.8
	end
	ModuleCache.ModuleManager.hide_public_module("netprompt")
	self.view:SetVisibility(false)
	ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(msg, function()
		self:on_show(self.intentData)
	end, function()
		ModuleCache.ModuleManager.destroy_module("public", "webgame")
	end, nil, nil, nil, nil, resetRootScale)
end

function WebGameModule:showAlert(text)
	local js = string.format('window.alert("%s")', text)
	self.view.webview:EvaluateJS(js)
end

return WebGameModule



