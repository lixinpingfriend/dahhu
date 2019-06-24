






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumJoinModule = class("museumJoinModule", ModuleBase)
local GameManager = ModuleCache.GameManager
-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local PlayerPrefs = UnityEngine.PlayerPrefs
local AppData = AppData


function MuseumJoinModule:initialize(...)
	ModuleBase.initialize(self, "museumjoin_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumJoinModule:on_module_inited()		
	
end



-- 绑定module层的交互事件
function MuseumJoinModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumJoinModule:on_model_event_bind()
	
end

function MuseumJoinModule:on_show(data)
	if type(data) == "table" then
		self.parlorNum = data.parlorNum
		self.gameName = data.gameName
		self.BoxID = data.BoxID
	else
		self.parlorNum = data
		self.gameName = nil
		self.BoxID = nil
	end

end

function MuseumJoinModule:on_click(obj, arg)	
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ButtonCancel" then
		ModuleCache.ModuleManager.hide_module("public", "museumjoin")
	elseif(obj.name == "ButtonConfirm") then
		if self.BoxID then
			self:getParlorBoxById(self.BoxID)
		else
			local museumlist = ModuleCache.ModuleManager.get_module("public", "museumlist")
			if museumlist then
				self:join_museum(museumlist.curSelectMuseumData)
			else
				self:getParlorListByNum(self.parlorNum)
			end
		end


	end
end

function MuseumJoinModule:join_museum(data)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/applyMember?",
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = data.id or data.parlorId
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("申请成功，请等待圈主审核", function ()
				self:dispatch_module_event("chessmuseum", "Event_Update_OneChessMuseum")
				ModuleCache.ModuleManager.hide_module("public", "museumjoin")
			end)
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
			ModuleCache.ModuleManager.hide_module("public", "museumjoin")
		end
	end, function(wwwErrorData)
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

		ModuleCache.ModuleManager.hide_module("public", "museumjoin")
        print(wwwErrorData.error)
	end)
end


function MuseumJoinModule:getParlorListByNum(parlorNum)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorListByNum?",
		params = {
			uid = self.modelData.roleData.userID,
			parlorNum = parlorNum
		},
	}

	self:http_get(requestData, function(wwwOperation)
		local www = wwwOperation.www;
		local retData = ModuleCache.Json.decode(www.text)
		if (retData.success) then
			if #retData.data == 1 then
				self:join_museum(retData.data[1])

			elseif  #retData.data > 1 then
				ModuleCache.ModuleManager.show_module("public", "museumlist", {dataList =retData.data,callBack = function(data)
					self:join_museum(data)
				end})
			else
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈号不存在")

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

function MuseumJoinModule:getParlorBoxById(BoxID)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorBoxById?",
		params = {
			uid = self.modelData.roleData.userID,
			boxId = BoxID
		},
	}

	self:http_get(requestData, function(wwwOperation)
		local www = wwwOperation.www;
		local retData = ModuleCache.Json.decode(www.text)
		if (retData.success) then
			self:join_museum(retData.data)
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

return MuseumJoinModule



