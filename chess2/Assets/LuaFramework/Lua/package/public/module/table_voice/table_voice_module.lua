




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local list = require("list")
local ModuleBase = require('core.mvvm.module_base')
local BaseTableModule = class('tableModule', ModuleBase)

local CustomVoiceManager = ModuleCache.CustomVoiceManager
local Application = UnityEngine.Application
local CSmartTimer = ModuleCache.SmartTimer.instance

local GameSDKInterface = ModuleCache.GameSDKInterface
local SoundManager = ModuleCache.SoundManager

local ChatMsgType = {}
ChatMsgType.shotMsg = 1
ChatMsgType.emojiMsg = 2
ChatMsgType.text = 3
ChatMsgType.voiceMsg = 0


local voicePath = Application.persistentDataPath .. "/voice"
if(GameSDKInterface:GetPlatformName() == "WindowsEditor")then
	voicePath ="c:/tmpVoice"
end
ModuleCache.FileUtility.DirectoryDelete(voicePath, true)
ModuleCache.FileUtility.DirectoryCreate(voicePath)
local downloadedVoiceDataMap = {}

function BaseTableModule:initialize(...)
	ModuleBase.initialize(self, 'table_voice_view', nil, ...)

	self.CustomVoiceManager = CustomVoiceManager
	self.Application = Application
	self.CSmartTimer = CSmartTimer
	self.GameSDKInterface = GameSDKInterface
	self.SoundManager = SoundManager

	self.waitPlayVoiceQueue = list:new()
	self.waitDownVoiceQueue = list:new()
	self.downloadingVoiceMap = {}
	self.curPlayingVoiceData = nil
	self.curPlayerVoiceTimeEventId = nil
	self.voiceDataMap = {}
	self.curRecordPath = ''
	self:initGVoice()
end

function BaseTableModule:on_show(intentData)

end

function BaseTableModule:PauseMusic()
	self.SoundManager.audioMusic.mute = true
	self.SoundManager.audioSoundEffect.mute = true
	self.SoundManager.audioVoice.mute = true
end

function BaseTableModule:UnPauseMusic()
	self.SoundManager.audioMusic.mute = false
	self.SoundManager.audioSoundEffect.mute = false
	self.SoundManager.audioVoice.mute = false
end


function BaseTableModule:initGVoice()
	if(self.isGvoiceInited)then
		return
	end

	CustomVoiceManager.set_event_listener(
		function(fileid)
			if(not self or self._is_destroyed)then
				return
			end
			self:dispatch_package_event('Event_TableVoice_SendVoice', fileid)
			if(self.forbid_auto_play)then
				return
			end
			self:tryDownVoice()
		end,
		function(filePath, fileid)
			if(not self or self._is_destroyed)then
				return
			end
			local voiceData = self.downloadingVoiceMap[filePath]
			self.downloadingVoiceMap[filePath] = nil
			self:addToDownLoaded(filePath, voiceData)
			if(voiceData and not voiceData.stopPlay)then
				self.waitPlayVoiceQueue:push(voiceData)
			end
			self:tryPlayVoice()
		end,
		function(filePath)
			if(not self or self._is_destroyed)then
				return
			end
			local voiceData = self:getDownLoadedVoiceData(filePath)
			if(not voiceData) then
				print_debug("map中不存在此数据")
				return
			end
			self.curPlayingVoiceData = nil
			local playerId = voiceData.playerId
			self:dispatch_package_event('Event_TableVoice_StopPlayVoice', playerId)
			if(self.curPlayerVoiceTimeEventId)then
				self.CSmartTimer:Kill(self.curPlayerVoiceTimeEventId)
				self.curPlayerVoiceTimeEventId = nil
			end
			self:UnPauseMusic()
			if(not self:tryPlayVoice() and not self.isPress) then
				if(self:getTableKeyCount(self.downloadingVoiceMap) == 0) then

				end
			end
		end,
		--初始化完成
		function(codeStr)
			if(not self or self._is_destroyed)then
				return
			end
			self.view:show_initing(false)
			if(codeStr == '')then
				print('............................voice初始化成功')
				self.isGvoiceInited = true
				if(self.isPress and self.pressObj)then
					self:on_press_mic(self.pressObj, self.arg)
				else
					self:tryDownVoice()
				end
			elseif(codeStr ~= "")then
			print('............................voice初始化失败')
				self.isGvoiceInited = false
				self:initGVoice()
			end
		end)
	self.isGvoiceInited = true
end

function BaseTableModule:addToDownLoaded(filePath, voiceData)
	downloadedVoiceDataMap[filePath] = voiceData
end

function BaseTableModule:getDownLoadedVoiceData(filePath)
	return downloadedVoiceDataMap[filePath]
end

function BaseTableModule:getTableKeyCount(t)
	local count = 0
	for k, v in pairs(t) do
		count = count + 1
	end
	return count
end

function BaseTableModule:tryPlayVoice()
	if(self.curPlayingVoiceData or self.isRecording)then
		return false
	end
	if(self.curPlayerVoiceTimeEventId)then
		CSmartTimer:Kill(self.curPlayerVoiceTimeEventId)
		self.curPlayerVoiceTimeEventId = nil
	end
	local voiceData = self.waitPlayVoiceQueue:shift()
	if(voiceData)then
		if(voiceData.stopPlay)then
			return self:tryPlayVoice()
		end
		if(self:is_open_voice())then
			local playerId = voiceData.playerId --or ModuleCache.Json.decode(voiceData.fileid).key
			self:PauseMusic()
			self:dispatch_package_event('Event_TableVoice_StartPlayVoice', playerId)
			CustomVoiceManager.play_recorded_file(voiceData.savePath)
			self.curPlayingVoiceData = voiceData
			local timeEvent = self:subscibe_time_event(60, false, 0):OnComplete(function ( ... )
				self:dispatch_package_event('Event_TableVoice_StopPlayVoice', playerId)
				self.curPlayingVoiceData = nil
				self:tryPlayVoice()
			end)
			self.curPlayerVoiceTimeEventId = timeEvent.id
			return true
		else
			self.curPlayingVoiceData = nil
			return false
		end
	end
	return false
end

function BaseTableModule:get_record_time()
	self.start_record_time = self.start_record_time or 0
	self.stop_record_time = self.stop_record_time or 0
	return self.stop_record_time - self.start_record_time
end

function BaseTableModule:tryDownVoice()
	local donwVoiceFun = self.waitDownVoiceQueue:shift()
	if(donwVoiceFun)then
		donwVoiceFun()
		return true
	end
	return false
end

function BaseTableModule:is_open_voice()
	return (ModuleCache.PlayerPrefsManager.GetFloat("openVoiceVolume", 0.5) > 0)
end

function BaseTableModule:on_module_event_bind()
	self:subscibe_package_event("Event_TableVoice_VoiceComing", function(eventHead, eventData)
		self:on_voice_coming(eventData.playerId, eventData.fileid)
	end)
	self:subscibe_package_event("Event_TableVoice_VoiceCancel", function(eventHead, eventData)
		self:on_voice_cancel(eventData.playerId, eventData.fileid)
	end)
	self:subscibe_package_event("Event_TableVoice_OnPressMic", function(eventHead, eventData)
		self:on_press_mic(eventData.obj, eventData.arg)
	end)
	self:subscibe_package_event("Event_TableVoice_OnPressUpMic", function(eventHead, eventData)
		self:on_press_up_mic(eventData.obj, eventData.arg, eventData.suffix)
	end)
	self:subscibe_package_event("Event_TableVoice_OnDragMic", function(eventHead, eventData)
		self:on_drag_mic(eventData.obj, eventData.arg)
	end)
end

--客服系统 fileid：http://game.oss.sincebest.com/voice/05019acf-5346-b9d8-0443-1fdc2447ca4d-629.mp3
--其他地方语音  fileid：{"key":"voice\/dad24e51-5e0a-b812-07b8-d24ecbad00c6-629","len":0.89819040521979}
function BaseTableModule:on_voice_coming(playerId, fileid)
	print("##############",playerId, fileid)
	local voiceData = {}
	voiceData.fileid = fileid

	local down_voice_fun = function()
		CustomVoiceManager.download_recorded_file(voiceData.fileid, voiceData.savePath, 60000)
		self.downloadingVoiceMap[voiceData.savePath] = voiceData
	end

	if string.sub(voiceData.fileid, 1, 1) == "{" then
		local jsonData = ModuleCache.Json.decode(voiceData.fileid)
		if(jsonData.key)then
			voiceData.savePath = Application.persistentDataPath .. "/" .. jsonData.key .. ".data"
			voiceData.playerId = playerId
		else
			return
		end
	else
		voiceData.savePath = Application.persistentDataPath .. "/" .. fileid
		voiceData.playerId = playerId
	end
	local downloadedVoiceData = self:getDownLoadedVoiceData(voiceData.savePath)
	if(downloadedVoiceData)then		--已下载，直接进入待播放队列
		self:initGVoice()
		downloadedVoiceData.stopPlay = false
		self.voiceDataMap[downloadedVoiceData.savePath] = downloadedVoiceData
		self.waitPlayVoiceQueue:push(downloadedVoiceData)
		self:tryPlayVoice()
		return
	end
	local downloadingVoiceData = self.downloadingVoiceMap[voiceData.savePath]
	if(downloadedVoiceData)then		--正在下载，设置可播放状态
		downloadingVoiceData.stopPlay = false
		return
	end
	self.voiceDataMap[voiceData.savePath] = voiceData
	if(not self.isGvoiceInited)then
		self.waitDownVoiceQueue:push(down_voice_fun)
		self:initGVoice()
	else
		down_voice_fun()
	end
end

--取消语音的下载和播放
function BaseTableModule:on_voice_cancel(playerId, fileid)
	print('on_voice_cancel')
	local savePath
	if string.sub(fileid, 1, 1) == "{" then
		local jsonData = ModuleCache.Json.decode(fileid)
		if(jsonData.key)then
			savePath = Application.persistentDataPath .. "/" .. jsonData.key .. ".data"
		else
			return
		end
	else
		savePath = Application.persistentDataPath .. "/" .. fileid
	end
	local voiceData = self.voiceDataMap[savePath]
	print(voiceData, savePath)
	if(voiceData)then
		voiceData.stopPlay = true
		if(self.curPlayingVoiceData and voiceData.savePath == self.curPlayingVoiceData.savePath)then
			CustomVoiceManager.stop_play_file()
		end
	end
end

function BaseTableModule:on_press_up_mic(obj, arg,suffix)
	if(not ModuleCache.SDKInterface().is_have_record_permission())then
		return
	end
	if self.timeEvent_id then
		CSmartTimer:Kill(self.timeEvent_id)
		self.timeEvent_id = nil
	end
	self.view:show_speaking_amin(false)
	self.view:show_cancel_speaking_amin(false)
	self.isPress = false
	self.pressObj = nil
	self.arg = nil
	if(not self.isGvoiceInited)then
		return
	end
	self:UnPauseMusic()
	if(self.isRecording) then
		self.stop_record_time = Time.realtimeSinceStartup
		CustomVoiceManager.stop_recording()
		self.isRecording = false
	end
	self:tryPlayVoice()
	if(self.isUpload) then
		if(arg.pointerEnter and arg.pointerEnter.gameObject == obj) then
			local record_len = self:get_record_time()
			if(record_len < 0.5)then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("录音间隔时间太短，请稍后再尝试")
				return
			end
			self:initGVoice()
			CustomVoiceManager.upload_recorded_file(self.curRecordPath, suffix)
		end
		self.isUpload = false
	end
end

function BaseTableModule:on_drag_mic(obj, arg)
	if(not ModuleCache.SDKInterface().is_have_record_permission())then
		return
	end
	if(arg.pointerEnter and arg.pointerEnter.gameObject == obj) then
		self.view:show_speaking_amin(true)
		self.view:show_cancel_speaking_amin(false)
	else
		self.view:show_speaking_amin(false)
		self.view:show_cancel_speaking_amin(true)
	end
end

function BaseTableModule:on_press_mic(obj, arg)
	if(not ModuleCache.SDKInterface().is_have_record_permission())then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("录音失败，请检查是否开启麦克风权限")
		return
	end
	self.isPress = true
	self.pressObj = obj
	self.arg = arg
	if (not self.isGvoiceInited) then
		self.view:show_initing(true)
		self:initGVoice()
		return
	end
	self.isUpload = false
	self.isRecording = false
	--self:PauseMusic()
	CustomVoiceManager.stop_play_file()
	--if(self.curPlayerVoiceTimeEventId)then
	--	CSmartTimer:Kill(self.curPlayerVoiceTimeEventId)
	--	self.curPlayerVoiceTimeEventId = nil
	--end
	--if(self.curPlayingVoiceData)then
	--	local playerId = self.curPlayingVoiceData.playerId
	--	self:dispatch_package_event('Event_TableVoice_StopPlayVoice', playerId)
	--	self.curPlayingVoiceData = nil
	--end

	if self.timeEvent_id then
		CSmartTimer:Kill(self.timeEvent_id)
		self.timeEvent_id = nil
	end
	self.timeEvent_id = nil
	local tmpEvent = nil
	tmpEvent = self:subscibe_time_event(0.05, false, 0):OnComplete(function(t)
		self.isRecording = true
		self.isUpload = true
		self.start_record_time = Time.realtimeSinceStartup
		self.curRecordPath = voicePath .. "/" .. Util.guid() .. ".data"
		print("这里开始录制语音！！！！！！", self.curRecordPath);
		self.view:show_speaking_amin(true)
		self.view:show_cancel_speaking_amin(false)
		CustomVoiceManager.start_recording(self.curRecordPath)
	end)
	self.timeEvent_id = tmpEvent.id
end

return BaseTableModule 