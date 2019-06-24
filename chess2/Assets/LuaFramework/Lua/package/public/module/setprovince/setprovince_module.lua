
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local SetProvinceModule = class("Public.SetProvinceModule", ModuleBase)

-- 常用模块引用

local ModuleCache = ModuleCache
local AppData = ModuleCache.AppData
local UnityEngine = UnityEngine
local NetClientManager = ModuleCache.net.NetClientManager
local callback = ''
local configs = ModuleCache.PlayModeUtil.provinceConfig

function SetProvinceModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "setprovince_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function SetProvinceModule:on_module_inited()

end

-- 绑定module层的交互事件
function SetProvinceModule:on_module_event_bind()
	self:subscibe_package_event("Event_Set_Play_Mode",function(eventHead, eventData)

		if eventData then
			ModuleCache.ModuleManager.hide_module("public",'setprovince')
		end

		if ModuleCache.GameManager.curProvince ~= 0 then
			self.view:tweenSelect()
		end
	end

	)
end

-- 绑定Model层事件，模块内交互
function SetProvinceModule:on_model_event_bind()
	

end

function SetProvinceModule:on_show(data)

	if ModuleCache.GameManager.curProvince == 0 then
		self:getCurLocation()
	else
		self.view:tweenSelect()
	end


end

function SetProvinceModule:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == self.view.btnBack.name then
		ModuleCache.ModuleManager.hide_module("public",'setprovince')
	end

	local provinceName = obj.name
	if obj.name == "Pop" then
		provinceName = obj.transform.parent.name
	end

	for key,value in ipairs(ModuleCache.PlayModeUtil.provinceConfig.provinceList) do

		if value.btnName == provinceName then
			local postData = {}
			postData.id = value.id
			postData.sd = 0
			ModuleCache.ModuleManager.show_module("public","setplaymode", postData)
			break
		end
	end
end


function SetProvinceModule:getCurLocation()
	local requestData = {
		baseUrl = "http://restapi.amap.com/v3/ip?key=4a231f552cc4503249c0906934ae3e02",
	}
	self:http_get(requestData, function(wwwData)
		local retData = ModuleCache.Json.decode(wwwData.www.text)
		--print_table(retData)
		--retData.province = "云南省"
		if(retData.status and retData.status == "1" and type(retData.province) == "string")then
			print("ModuleCache.GameManager.curProvince = ".. ModuleCache.GameManager.curProvince)
			if ModuleCache.GameManager.curProvince == 0 then
				for i = 1, #configs.provinceList do
					if(string.find(retData.province, configs.provinceList[i].name)) then
						ModuleCache.GameManager.select_province_id(configs.provinceList[i].id)
						--TODO 湖北省的红中麻将没有默认开启，需要选择3跑得快
						if configs.provinceList[i].id == 10 then
							ModuleCache.GameManager.select_game_id(3)
						end
						ModuleCache.ModuleManager.show_module("public","setplaymode", configs.provinceList[i].id)

						break
					end
				end
			end
			print("ModuleCache.GameManager.curProvince = ".. ModuleCache.GameManager.curProvince)
			self.view:tweenSelect()
		else
			print(wwwData.www.text)
		end

	end, function(errorData)
		print(errorData.error)
	end)
end


function SetProvinceModule:doCallback()
	if(type(callback) == "function")then
		--print("!!!!!! call back")
		if ModuleCache.GameManager.curGameId == 0 then
			ModuleCache.GameManager.select_province_id(0)
		end
		callback()
	end
	callback = ''
end

return SetProvinceModule



