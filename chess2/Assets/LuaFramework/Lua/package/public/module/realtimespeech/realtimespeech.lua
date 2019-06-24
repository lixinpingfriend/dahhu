local Manager = require("package.public.module.function_manager")
local class       = require("lib.middleclass")
local RealTimeSpeech = class('RealTimeSpeech')

--实时语音参数
local RealTimeSpeechParam = 
{
	module,				--该模块
	nSeatID,			--座位号
	btnMicro,			--主动说话的麦克风按钮
	btnVoiceOpened,		--实时语音打开的按钮 点击关闭
	btnVoiceClosed,		--实时语音关闭的按钮 点击打开
	imgMicroStates,		--麦克风状态		数组 按照服务器顺序排序
}

--初始化
function RealTimeSpeech:Init(param)
	self.data = param
	self.module = self.data.module

	self:InitShiShiYuYin()
	self.module:start_lua_coroutine(function ()
		coroutine.wait(3.5)
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您已进入实时语音房间，请注意保护隐私")
		while true do
			coroutine.wait(10)		--10秒检测一次麦克风等状态
			self:CheckState()
		end
	end)
end

--改变参数
function RealTimeSpeech:UpdateParam(param)
	self.data = param
end

function RealTimeSpeech:InitShiShiYuYin()
    local ruleInfo = ModuleCache.Json.decode(TableManager.curTableData.Rule)
	if ruleInfo.ShiShiYuYin then
		self:ShiShiYuYin()
	end
end

function RealTimeSpeech:ShiShiYuYin_AnNiu() 
    self.data.btnMicro.gameObject:SetActive(false)
    self.data.btnVoiceOpened.gameObject:SetActive(false)
    self.data.btnVoiceClosed.gameObject:SetActive(false)
    local key = "实时语音" .. AppData.Game_Name
    local r = ModuleCache.PlayerPrefsManager.GetInt(key, 1)

    if r == 1 then
        self.data.btnVoiceOpened.gameObject:SetActive(true)
        ModuleCache.GVoiceManager().openSpeaker()
    else
        self.data.btnVoiceClosed.gameObject:SetActive(true)
        ModuleCache.GVoiceManager().closeSpeaker()
    end
end

-- 实时语音功能 
function RealTimeSpeech:ShiShiYuYin()
    local key = "实时语音" .. AppData.Game_Name

    self.data.btnVoiceClosed.onClick:AddListener(
        function()
            ModuleCache.PlayerPrefsManager.SetInt(key, 1)
            self:ShiShiYuYin_AnNiu()
        end
    )

    self.data.btnVoiceOpened.onClick:AddListener(
        function()
            ModuleCache.PlayerPrefsManager.SetInt(key, 2)
            self:ShiShiYuYin_AnNiu()
        end
    )

    self:ShiShiYuYin_AnNiu()
     
    ModuleCache.GVoiceManager().joinTeam(TableManager.phzTableData.RoomID,function()
		print('刷新咯')
        self:ShiShiYuYin_AnNiu()
	end)
	
    ModuleCache.PlayerPrefsManager.SetString("房间号语音", TableManager.phzTableData.RoomID)

    self.bDestroyShiShiYuYin = true
end

function RealTimeSpeech:ShiShiYuYin_TuiChu()
    local roomID = ModuleCache.PlayerPrefsManager.GetString("房间号语音")

    if roomID then
        --ModuleCache.GVoiceManager().quitTeam(roomID, 5000)
    end
end

function RealTimeSpeech:request_update_tempInfo()
	local data = {}
	data.bVoiceReceive 	= self.data.btnVoiceOpened.gameObject.activeSelf		--听筒是否开启
	if ModuleCache.GVoiceManager and (tostring(UnityEngine.Application.platform) ~= "WindowsPlayer" ) then
		local bRecoedVoice = ModuleCache.GVoiceManager().PermissionCheck("android.permission.RECORD_AUDIO")
		data.bMicroOpen = bRecoedVoice
	else
		data.bMicroOpen		= true		--PC平台下 麦克风常开 (没有麦克风 测试用)
	end
	local str = ModuleCache.Json.encode(data)
	self.module.model.request_update_tempInfo(1, str)
end

--刷新麦克风状态
function RealTimeSpeech:UpdateState(data)
	for i=1, #data.TempData do
		if data.TempData[i].Data[1] ~= nil and data.TempData[i].Data[1].Id == 1 then
			for j=1, #data.TempData[i].Data do
				local state = ModuleCache.Json.decode(data.TempData[i].Data[j].Note)
				if state.bMicroOpen ~= nil and self.data.imgMicroStates[j] ~= nil then
					self.data.imgMicroStates[j].gameObject:SetActive(state.bMicroOpen ~= nil and state.bMicroOpen)
				end
				if j == self.data.nSeatID then	--记录自己的状态
					self.myState = {}
					self.myState.bMicroOpen = state.bMicroOpen
					self.myState.bVoiceReceive = state.bVoiceReceive
				end
			end
		end
	end
end

function RealTimeSpeech:CheckState()
	if self.myState == nil then
		return
	end
	local bVoiceReceive 	= self.data.btnVoiceOpened.gameObject.activeSelf		--听筒是否开启
	local bMicroOpen 
	if ModuleCache.GVoiceManager and (tostring(UnityEngine.Application.platform) ~= "WindowsPlayer" ) then
		local bRecoedVoice = ModuleCache.GVoiceManager().PermissionCheck("android.permission.RECORD_AUDIO")
		bMicroOpen = bRecoedVoice
	else
		bMicroOpen		= true		--PC平台下 麦克风常开 (没有麦克风 测试用)
	end
	if self.myState.bMicroOpen ~= bMicroOpen then		--目前只同步麦克风状态  听筒状态不用同步		--由消息回调刷新状态
		self:request_update_tempInfo()
	end
end

return RealTimeSpeech