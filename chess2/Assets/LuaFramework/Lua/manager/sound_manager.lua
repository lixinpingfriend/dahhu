




local ModuleCache = ModuleCache
local AssetBundleManager = LuaBridge.AssetBundleManager.instance

local soundRoot = UnityEngine.GameObject.Find("GameRoot/Sound")

---@class SoundManager
local SoundManager = {}
SoundManager.audioMusic = ModuleCache.ComponentManager.GetComponentWithPath(soundRoot, "Music", ModuleCache.ComponentTypeName.AudioSource)
SoundManager.audioSoundEffect = ModuleCache.ComponentManager.GetComponentWithPath(soundRoot, "Sound", ModuleCache.ComponentTypeName.AudioSource)
SoundManager.audioVoice = ModuleCache.ComponentManager.GetComponentWithPath(soundRoot, "Voice", ModuleCache.ComponentTypeName.AudioSource)
SoundManager.audioRecordVoice = ModuleCache.ComponentManager.GetComponentWithPath(soundRoot, "RecordVoice", ModuleCache.ComponentTypeName.AudioSource)
SoundManager.audioSoundEffectPool = {}
SoundManager.audioClipCache = {}




-- 加载声音文件
local function _loadAudioClip(assetFullName, assetName)
	--error("加载声音文件格式出错。。。")
	if not assetFullName or not assetName then
		print("加载声音文件格式出错。。。")
		return nil
	end

	local audioClip = SoundManager.audioClipCache[assetFullName]
	if not audioClip then
		 --print_table(SoundManager.audioClipCache, "加载音效文件：" .. assetFullName)
		local audioClipAssetBundle = AssetBundleManager:LoadAssetBundle(assetFullName)
		if not audioClipAssetBundle then
			print("没找到对应的音效资源：" .. assetFullName)
			return nil
		-- elseif not audioClipAssetBundle.assetBundle then
		-- 	print("没找到对应的音效资源：" .. assetFullName)
		-- 	return nil
		end
		audioClip = audioClipAssetBundle:GetAsset(assetName, false)
		ModuleCache.PackageManager.unloadLoadedAssetBundle(audioClipAssetBundle, false)
		if audioClip then
			SoundManager.audioClipCache[assetFullName] = audioClip
		end
		--  print("加载音效资源：" .. assetFullName)
	end
	return audioClip
end

--释放声音文件
function SoundManager.unload_audio_clip_cache(assetBundleName)
	--print("重置音效：" .. assetBundleName)
	SoundManager.audioClipCache[assetBundleName] = nil
end

-- 播放音乐
function SoundManager.play_music(packageName, assetFullName, assetName, loopPlay)
	local audioClip = _loadAudioClip(assetFullName, assetName)
	if not audioClip then
		return
	end
	SoundManager.audioMusic.clip = audioClip
	if loopPlay then
		SoundManager.audioMusic.loop = true
	else
		SoundManager.audioMusic.loop = false
	end
	SoundManager.audioMusic:Play()
	--    SoundManager.audioMusic:DOFade(0.2, 2)
end


-- 播放音效-- 预加载资源
function SoundManager.play_soundReady(packageName, assetFullName, assetName)
	local audioClip = _loadAudioClip(assetFullName, assetName)
end


-- 播放音效
function SoundManager.play_sound(packageName, assetFullName, assetName)
	local audioClip = _loadAudioClip(assetFullName, assetName)
	if not audioClip then
		return
	end
	local audioSource = SoundManager.audioSoundEffect
	audioSource:PlayOneShot(audioClip)
end

-- 播放音效
function SoundManager.play_voice(packageName, assetFullName, assetName)
	local audioClip = _loadAudioClip(assetFullName, assetName)
	if not audioClip then
		return
	end
	SoundManager.audioVoice:PlayOneShot(audioClip)
end


-- 停止音乐
function SoundManager.stop_music()
	SoundManager.audioMusic.clip = nil
	SoundManager.audioMusic:Stop()
end

-- 暂停音乐
function SoundManager.pause_music(packageName, assetFullName, assetName)
	local audioClip = _loadAudioClip(assetFullName, assetName)
	if not audioClip then
		return
	end
	SoundManager.audioMusic.clip = audioClip
	SoundManager.audioMusic:Pause()
end

-- 继续音乐
function SoundManager.unpause_music(packageName, assetFullName, assetName)
	local audioClip = _loadAudioClip(assetFullName, assetName)
	if not audioClip then
		return
	end
	SoundManager.audioMusic.clip = audioClip
	SoundManager.audioMusic:UnPause()
end

-- 停止音效
function SoundManager.stop_sound(packageName, assetFullName, assetName)
	for i, v in ipairs(SoundManager.audioSoundEffectPool) do
		if(v.clip and v.clip.name == assetName) then
			v:Stop()
		end
	end
end


function SoundManager.stop_all_sound()
	if(SoundManager.audioSoundEffect.isPlaying) then
		SoundManager.audioSoundEffect:Stop()
	end
	if(SoundManager.audioVoice.isPlaying) then
		SoundManager.audioVoice:Stop()
	end
end

-- 停止音效
function SoundManager.stop_voice(packageName, assetFullName, assetName)
	local audioClip = _loadAudioClip(assetFullName, assetName)
	if not audioClip then
		return
	end
	SoundManager.audioVoice.clip = audioClip
	SoundManager.audioVoice:Stop()
end

-- 设置音乐音量
function SoundManager.set_music_volume(volume)
	SoundManager.audioMusic.volume = volume
	ModuleCache.PlayerPrefsManager.SetFloat("GameMusicVolume", volume)
end

-- 获取音乐音量
function SoundManager.get_music_volume()
	local volume = ModuleCache.PlayerPrefsManager.GetFloat("GameMusicVolume", 0.5)
	return volume
end

-- 获取语音录音音量
function SoundManager.get_record_voice_volume()
	local volume = ModuleCache.PlayerPrefsManager.GetFloat("openVoiceVolume", 1)
	return volume
end

-- 设置静音
function SoundManager.set_music_mute(mute)
	SoundManager.audioMusic.mute = mute
end

-- 设置音效音量
function SoundManager.set_sound_volume(volume)
	for i, v in ipairs(SoundManager.audioSoundEffectPool) do
		v.volume = volume
	end
	SoundManager.audioSoundEffect.volume = volume
	ModuleCache.PlayerPrefsManager.SetFloat("GameSoundVolume", volume)
end

-- 设置音效音量
function SoundManager.set_record_sound_volume(volume)
	SoundManager.audioRecordVoice.volume = volume
	ModuleCache.PlayerPrefsManager.SetFloat("openVoiceVolume", volume)
end

-- 获取音效音量
function SoundManager.get_sound_volume()
	local volume = ModuleCache.PlayerPrefsManager.GetFloat("GameSoundVolume", 0.5)
	return volume
end

-- function SoundManager.play_music()

-- end

local defaultVolume = SoundManager.get_sound_volume()
SoundManager.audioSoundEffect.volume = defaultVolume
SoundManager.audioVoice.volume = defaultVolume
SoundManager.audioMusic.volume = SoundManager.get_music_volume()
SoundManager.audioRecordVoice.volume = SoundManager.get_record_voice_volume()

return SoundManager