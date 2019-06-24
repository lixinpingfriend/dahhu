






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumActiveRecordModule = class("museumActiveRecordModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumActiveRecordModule:initialize(...)
	ModuleBase.initialize(self, "museumActiveRecord_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumActiveRecordModule:on_module_inited()
	
end



-- 绑定module层的交互事件
function MuseumActiveRecordModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumActiveRecordModule:on_model_event_bind()
	
end

function MuseumActiveRecordModule:on_show(data)
	self.museumData =data
	self.view:reset()
	self:getAllParlorRecordPage(self.museumData)
end


function MuseumActiveRecordModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "closeButton" or obj.name == "BgMask" then
		ModuleCache.ModuleManager.hide_module("public", "museumactiverecord")

	elseif obj.name == "loadButton" then
		self:getAllParlorRecordPage(self.museumData,true)
	end
end

function MuseumActiveRecordModule:getAllParlorRecordPage(data,isloadMore)
	local curPageNum = 1
	if self.DataTab and self.DataTab.page then
		curPageNum = self.DataTab.page
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getAllParlorRecordPage?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = data.id,
			pageSize = 50,
			pageNum = curPageNum

		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.retData = retData.data

			if isloadMore and self.DataTab then
				for i =1, #retData.data.list do
					table.insert(self.DataTab.list,#self.DataTab.list +1, retData.data.list[i])
				end
			else
				self.DataTab = retData.data
			end

			self.view:initLoopScrollViewList(self.DataTab)
		end
	end, function(errorData)
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
	end)
end



return MuseumActiveRecordModule



