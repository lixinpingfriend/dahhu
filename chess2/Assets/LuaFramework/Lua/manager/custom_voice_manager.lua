




local ModuleCache = ModuleCache
local AssetBundleManager = LuaBridge.AssetBundleManager.instance

local soundRoot = UnityEngine.GameObject.Find("GameRoot/Sound")

local CustomVoiceManager = {}
local audioVoice = ModuleCache.ComponentManager.GetComponentWithPath(soundRoot, "RecordVoice", ModuleCache.ComponentTypeName.AudioSource)

local audio_clip
local startRecordTime
local recordLen = 0
local Microphone = UnityEngine.Microphone
local iPhoneSpeaker
local deviceName = 'record'
local voiceDataTable = {}
local curPath
local curOperation
local sampleRate = 8000
local totalLen = 60

function CustomVoiceManager:init()

end

function CustomVoiceManager.set_event_listener(onUploadReccordFileComplete, onDownloadRecordFileComplete, onPlayRecordFilComplete)
	CustomVoiceManager._onUploadReccordFileComplete = onUploadReccordFileComplete
	CustomVoiceManager._onDownloadRecordFileComplete = onDownloadRecordFileComplete
	CustomVoiceManager._onPlayRecordFilComplete = onPlayRecordFilComplete
end


-- 开始录音
function CustomVoiceManager.start_recording(recordPath)
	Microphone.End(nil)
	audio_clip = Microphone.Start(deviceName, true, totalLen, sampleRate)
	if ModuleCache.GameManager.customPlatformName == "IPhonePlayer" and ModuleCache.GameManager.appVersion == "1.6.1" then
		iPhoneSpeaker = iPhoneSpeaker or require("iPhoneSpeaker")
		if iPhoneSpeaker then
			iPhoneSpeaker.ForceToSpeaker()
		end
	end
	startRecordTime = Time.realtimeSinceStartup
	curPath = recordPath
end

-- 停止录音
function CustomVoiceManager.stop_recording()
	Microphone.End(deviceName)
	recordLen = Time.realtimeSinceStartup - startRecordTime
	voiceDataTable[curPath] = recordLen
	recordLen = math.min(recordLen, totalLen)
	CustomVoiceManager._saveClip(audio_clip, curPath, recordLen, totalLen)
	return curPath
end

-- 上传录音文件
function CustomVoiceManager.upload_recorded_file(recordPath,suffix)--suffix 包含后缀名 ".mp3"
	local key = 'voice/' .. Util.guid() .. '-' .. (CustomVoiceManager.uid or '')
	if suffix then
		key = key.. suffix
	end
	ModuleCache.OssManager.upload_file(key, recordPath, nil, function(key, path, bytes, url)
		if(CustomVoiceManager._onUploadReccordFileComplete)then
			local len = voiceDataTable[path]
			if(len)then
				local tmp = ModuleCache.Json.encode({key=key,len=len})
				CustomVoiceManager._onUploadReccordFileComplete(tmp)
			end
		end
	end,nil,"video/mpeg")
end

-- 下载录音文件
function CustomVoiceManager.download_recorded_file(field, downLoadPath)
	if string.sub(field, 1, 1) == "{" then
		local jsonData = ModuleCache.Json.decode(field)
		if(jsonData.key)then
			ModuleCache.OssManager.download_file(jsonData.key, downLoadPath, function(key, path, url)
				voiceDataTable[path] = jsonData.len
				if(CustomVoiceManager._onDownloadRecordFileComplete)then
					CustomVoiceManager._onDownloadRecordFileComplete(path, field)
				end
			end)
		end
	else
		ModuleCache.OssManager.download_file(field, downLoadPath, function(key, path, url)
			voiceDataTable[path] = "1"--TODO XLQ : 临时赋值
			if(CustomVoiceManager._onDownloadRecordFileComplete)then
				CustomVoiceManager._onDownloadRecordFileComplete(path, field)
			end
		end)
	end
end

-- 播放录音文件
function CustomVoiceManager.play_recorded_file(filePath, onFinishPlay)
	local len = voiceDataTable[filePath]
	if(not len)then
		return
	end
	local clip = CustomVoiceManager._loadClip(filePath)
	--print('-----------------------开始播放', len)
	local operation = ModuleCache.AudioPlayUtil.Create(audioVoice, clip, len)
	operation:Subscribe(function(op)
		curOperation = nil
		--print('-----------------------播放完成')
		if(CustomVoiceManager._onPlayRecordFilComplete)then
			CustomVoiceManager._onPlayRecordFilComplete(filePath)
		end
		if(onFinishPlay)then
			onFinishPlay(filePath)
		end
	end):Play()
	curOperation = operation
end

--停止播放录音文件
function CustomVoiceManager.stop_play_file()
	if(curOperation)then
		audioVoice:Stop()
		curOperation:Stop()
	end
end

function CustomVoiceManager._loadClip(filePath)
	local clip = ModuleCache.WavUtility.CustomToAudioClip(filePath, sampleRate)
	return clip
end

function CustomVoiceManager._saveClip(clip, filePath, realLen, totalLen)
	if(not clip or (not filePath) or filePath == '' or realLen <= 0 or totalLen <= 0)then
		return false
	end
	local bytes =  ModuleCache.WavUtility.CustomFromAudioClip(clip, realLen, totalLen)
	return ModuleCache.FileUtility.SaveFile(filePath, bytes, false)
end

return CustomVoiceManager