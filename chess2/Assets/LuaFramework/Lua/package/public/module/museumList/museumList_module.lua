






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumListModule = class("museumListModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumListModule:initialize(...)
	ModuleBase.initialize(self, "museumList_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumListModule:on_module_inited()
	
end



-- 绑定module层的交互事件
function MuseumListModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumListModule:on_model_event_bind()
	
end

function MuseumListModule:on_show(data)--{dataList =retData.data,callBack = function(data)

	self.dataList = data.dataList
	self.callBack = data.callBack
	self.view:initLoopScrollViewList(self.dataList)
end


function MuseumListModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ButtonCancel" or obj.name == "BgMask" then
		ModuleCache.ModuleManager.hide_module("public", "museumlist")

	elseif( string.find( obj.name, "item_") ) then
		local array = string.split(obj.gameObject.name, "_")
		local data = self.dataList[tonumber(array[2]) ]
		self.curSelectMuseumData = data

		self.callBack(data)
		ModuleCache.ModuleManager.hide_module("public", "museumlist")
	end
end




return MuseumListModule



