






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumFellowShipMsgModule = class("museumFellowShipMsgModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumFellowShipMsgModule:initialize(...)
	ModuleBase.initialize(self, "museumFellowShipMsg_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumFellowShipMsgModule:on_module_inited()
	
end



-- 绑定module层的交互事件
function MuseumFellowShipMsgModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumFellowShipMsgModule:on_model_event_bind()
	
end

function MuseumFellowShipMsgModule:on_show(data)
	self.museumData = data
	self:getParlorUserRecord()
end


function MuseumFellowShipMsgModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "closeBtn" then
		ModuleCache.ModuleManager.hide_module("public", "museumfellowshipmsg")

	end
end

-- 获取联谊消息记录
function MuseumFellowShipMsgModule:getParlorUserRecord()

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/getParlorUserRecord?",
		showModuleNetprompt = true,
		hideTips500Error = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.museumData.id,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			self.view:initLoopScrollViewList(retData.data)
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end


return MuseumFellowShipMsgModule



