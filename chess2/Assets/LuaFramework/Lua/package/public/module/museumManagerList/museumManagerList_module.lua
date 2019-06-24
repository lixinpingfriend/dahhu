






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumManagerListModule = class("museumManagerListModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumManagerListModule:initialize(...)
	ModuleBase.initialize(self, "museumManagerList_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumManagerListModule:on_module_inited()
	
end



-- 绑定module层的交互事件
function MuseumManagerListModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumManagerListModule:on_model_event_bind()
	
end

function MuseumManagerListModule:on_show(data)--{dataList =retData.data,callBack = function(data)
	self.modelData.joinRoomMuseum = true
	self.dataList = data.dataList
	self.callBack = data.callBack
	self.view:initLoopScrollViewList(self.dataList)
end


function MuseumManagerListModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ImageClose" then
		ModuleCache.ModuleManager.hide_module("public", "museummanagerlist")

	elseif( string.find( obj.name, "item_") ) then
		local array = string.split(obj.gameObject.name, "_")
		local data = self.dataList[tonumber(array[2]) ]

		if (data.isShowRecommend) then
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您尚未加入此亲友圈，是否申请加入？"), function()
				ModuleCache.ModuleManager.show_module("public", "museumjoin",data.parlorNum)
			end, nil)
		else
			if ModuleCache.ModuleManager.get_module("public", "chessmuseum") then
				self.callBack(self.dataList, tonumber(array[2]))
			else
				ModuleCache.ModuleManager.show_module("public", "chessmuseum")
				ModuleCache.ModuleManager.hide_module("public", "museummanagerlist")
			end


			--ModuleCache.ModuleManager.hide_module("public", "museummanagerlist")
		end


	elseif obj.name == "CreateMuseumBtn" then
		self.modelData.joinRoomMuseum = true
		ModuleCache.ModuleManager.show_module("public", "joinroom",{mode =2})
	elseif obj.name == "JoinMuseumBtn" then
		self.modelData.joinRoomMuseum = true
		ModuleCache.ModuleManager.show_module("public", "joinroom",{mode =8})
	end
end


function MuseumManagerListModule:on_hide(data)
	self.modelData.joinRoomMuseum = false
end

function MuseumManagerListModule:on_destroy()
	self.modelData.joinRoomMuseum = false
end

function MuseumManagerListModule:on_update_per_second()
	if self:view_is_active() then
		if self.lastUpdateBeatTime and self.lastUpdateBeatTime + 10 > Time.realtimeSinceStartup then
			return
		end

		self.lastUpdateBeatTime = Time.realtimeSinceStartup
		self:getUserParlorList()
	end

end

function MuseumManagerListModule:getUserParlorList()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getUserParlorList?",
		--showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			all = 1,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			if AppData.Is_Independent_App then
				local data = {}
				for i = 1, #retData.data do
					if self:independent_app_is_need_show_parlor(retData.data[i].gameId) then
						table.insert(data, retData.data[i])

						if retData.data[i].boxGameNameList then
							local boxList ={}
							local tempBox = nil
							for j = 1, #retData.data[i].boxGameNameList do
								tempBox = retData.data[i].boxGameNameList[j]
								if self:independent_app_is_need_show_parlor(tempBox.gameId) then
									table.insert(boxList, tempBox)
								end
							end

							retData.data[i].boxGameNameList = boxList
						end
					end
				end
				self.dataList = data
			else
				self.dataList = retData.data
			end

			self.view:initLoopScrollViewList(self.dataList)

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

-- 独立App过滤牌友圈和包间
function MuseumManagerListModule:independent_app_is_need_show_parlor(gameId)
	if string.find(gameId, ModuleCache.AppData.Const_App_Name) then
		return true
	end

	if string.find(gameId, ModuleCache.AppData.Poker_App_Name) then
		if ModuleCache.AppData.Const_App_Name ~= "AQMJ" then
			for i = 1, #AppData.AQMJ_Only_Have_AppGameName do
				if gameId == AppData.AQMJ_Only_Have_AppGameName[i] then
					return false
				end
			end
		end
		return true
	end
end

return MuseumManagerListModule



