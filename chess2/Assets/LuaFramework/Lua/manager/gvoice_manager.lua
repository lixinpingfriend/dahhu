---@class GVoiceManager
local GVoiceManager = {}
local manager = nil
if not LuaBridge.GVoiceManager then
    if not ModuleCache.AppData.Is_Independent_App then
        require("GVoiceManager")
        GVoiceManager._requireGVoiceManager = true
    else
        GVoiceManager._requireGVoiceManager = false
    end
    --require("gcloud_voice.IGCloudVoice")
    --gCooiceVoice = require("gcloud_voice.GCloudVoice").GetEngine()
else
    GVoiceManager._requireGVoiceManager = true
end

-- 上一次加入的房间
local PLAYER_PREFS_KEY_LastJoinGVoiceTeamName = "LastJoinGVoiceTeamName"
-- 上一次退出Gvoice的房间
local PLAYER_PREFS_KEY_LastQuitGVoiceTeamName = "LastQuitGVoiceTeamName"


if LuaBridge.GVoiceManager then
    manager = LuaBridge.GVoiceManager.instance
end


local msTimeout = 20000

--加入房间的索引，因为C#那边的回调可能会有多次
local joinTeamRoomState = false
--是否使用C#来调用
local call_with_csharp = true

local json = require("cjson")
local ModuleCache = ModuleCache
local GameSDKInterface = ModuleCache.GameSDKInterface
local GameManager = ModuleCache.GameManager
local tolua = tolua
local typeof = typeof
local CSmartTimer = ModuleCache.SmartTimer.instance
local AppData = ModuleCache.AppData
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
-- 初始化语音
function GVoiceManager.init(gameId, gameKey, openId, msTimeout)
    if (GVoiceManager.inited) then
        if GVoiceManager._onInitComplete then
            GVoiceManager._onInitComplete('')
        end
        return
    end
    if (GVoiceManager.started_init) then
        return
    end
    manager:Init(gameId, gameKey, openId, msTimeout)
    GVoiceManager.started_init = true

    manager:SetEventListener(function(fileid)
        if GVoiceManager._onUploadReccordFileComplete then
            GVoiceManager._onUploadReccordFileComplete(fileid)
        end
    end, function(filePath, fileid)
        if GVoiceManager._onDownloadRecordFileComplete then
            GVoiceManager._onDownloadRecordFileComplete(filePath, fileid)
        end
    end, function(filePath)
        if GVoiceManager._onPlayRecordFilComplete then
            GVoiceManager._onPlayRecordFilComplete(filePath)
        end

        if GVoiceManager._playFinishCallback then
            GVoiceManager._playFinishCallback(filePath)
            GVoiceManager._playFinishCallback = nil
        end
    end
    , function(err)
                if (err == '') then
                    GVoiceManager.inited = true
                else
                    GVoiceManager.inited = false
                    GVoiceManager.started_init = false
                end
                if GVoiceManager._onInitComplete then
                    GVoiceManager._onInitComplete(err)
                end
            end
    )
end

function GVoiceManager.set_event_listener(onUploadReccordFileComplete, onDownloadRecordFileComplete, onPlayRecordFilComplete, onInitComplete)
    GVoiceManager._onUploadReccordFileComplete = onUploadReccordFileComplete
    GVoiceManager._onDownloadRecordFileComplete = onDownloadRecordFileComplete
    GVoiceManager._onPlayRecordFilComplete = onPlayRecordFilComplete
    GVoiceManager._onInitComplete = onInitComplete
end

function GVoiceManager.clear_event_listener()
    GVoiceManager._onUploadReccordFileComplete = nil
    GVoiceManager._onDownloadRecordFileComplete = nil
    GVoiceManager._onPlayRecordFilComplete = nil
end

-- 开始录音
function GVoiceManager.start_recording(recordPath)
    manager:StartRecording(recordPath)
end

-- 停止录音
function GVoiceManager.stop_recording()
    manager:StopRecording()
end

-- 上传录音文件
function GVoiceManager.upload_recorded_file(recordPath, num)
    manager:UploadRecordedFile(recordPath, num)
end

-- 下载录音文件
function GVoiceManager.download_recorded_file(field, downLoadPath, num)
    manager:DownloadRecordedFile(field, downLoadPath, num)
end

-- 播放录音文件
function GVoiceManager.play_recorded_file(downLoadPath, playFinishCallback)
    if playFinishCallback then
        GVoiceManager._playFinishCallback = playFinishCallback
    end

    manager:PlayRecordedFile(downLoadPath)
end

--停止播放录音文件
function GVoiceManager.stop_play_file()
    manager:StopPlayFile()
end

function GVoiceManager.versionSize(version)
    local versionSplit = { tonumber(string.sub(GameManager.appVersion, 1, 1)), tonumber(string.sub(GameManager.appVersion, 3, 3)),
                           tonumber(string.sub(GameManager.appVersion, 5, 5)) }
    local appVersionSplit = { tonumber(string.sub(version, 1, 1)), tonumber(string.sub(version, 3, 3)),
                              tonumber(string.sub(version, 5, 5)) }

    if (versionSplit[1] > appVersionSplit[1]) or
            (versionSplit[1] == appVersionSplit[1] and versionSplit[2] > appVersionSplit[2]) or
            (versionSplit[1] == appVersionSplit[1] and versionSplit[2] == appVersionSplit[2] and versionSplit[3] >= appVersionSplit[3]) then
        print("is gvoice version")
        return true
    else
        return false
    end
end

--如果大于这个版本就使用原生
function GVoiceManager.gvoiceVersion()
    return false
    --local iosVersion = "1.7.0"
    --local androidVersion = "1.7.1"
    ----Android 或者 IPhonePlayer
    --if GVoiceManager.isGVoiceVersion ~= nil then
    --    return GVoiceManager.isGVoiceVersion
    --else
    --    if GameManager.customPlatformName == "Android" then
    --        GVoiceManager.isGVoiceVersion = GVoiceManager.versionSize(androidVersion)
    --        return GVoiceManager.isGVoiceVersion
    --    elseif GameManager.customPlatformName == "IPhonePlayer" then
    --        GVoiceManager.isGVoiceVersion = GVoiceManager.versionSize(iosVersion)
    --        return GVoiceManager.isGVoiceVersion
    --    else
    --        return true
    --    end
    --end
end

--实时语音相关

local function onMemberVoice(members, count)
    local membersInfo = ""
    for i = 1, members.Length do
        membersInfo = membersInfo .. ", " .. members[i - 1]
    end
    print(membersInfo, count)
end

function GVoiceManager.init_app()

end

function GVoiceManager.report_event(eventName, result)
    local data = {
        eventId = eventName,
        result = string.format("%s_%s_%s", ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0"), result, tostring(os.date("%Y-%m-%d %H:%M:%S")))
    }
    ModuleCache.TalkingDataMgr().setEventData(data)
end

function GVoiceManager._get_type_engine_instance()
    if not GVoiceManager._type_engine_instance then
        local getEngine = tolua.getmethod(typeof('gcloud_voice.GCloudVoice'), 'GetEngine')
        GVoiceManager._type_engine_instance = getEngine:Call()
    end
    return GVoiceManager._type_engine_instance
end


function GVoiceManager.initTeam()
    --if GVoiceManager._initTeamSucess then
    --    return 0
    --end

    local openId = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0")

    local initResult
    if (GVoiceManager.gvoiceVersion()) then
        initResult = manager:InitTeam(GameParameters.GVoiceCloudID, GameParameters.GVoiceCloudKey, openId, msTimeout)
        --print("c# govicev初始化结果：", initResult)
        --gCooiceVoice.OnMemberVoice = gCooiceVoice.OnMemberVoice + onMemberVoice
    else
        local field = tolua.getfield(typeof('gcloud_voice.GCloudVoiceMode'), 'RealTime')
        local mGCloudVoiceMode = field:Get(nil)

        local SetAppInfo = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'SetAppInfo', typeof('System.String'), typeof('System.String'), typeof('System.String'))
        local Init = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'Init')
        local ApplyMessageKey = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'ApplyMessageKey', typeof('System.Int32'))
        local SetMode = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'SetMode', typeof('gcloud_voice.GCloudVoiceMode'))
        --print("============", tostring(getEngine))

        SetAppInfo:Call(GVoiceManager._get_type_engine_instance(), GameParameters.GVoiceCloudID, GameParameters.GVoiceCloudKey, openId)  --instance,mGCloudVoiceMode
        initResult = Init:Call(GVoiceManager._get_type_engine_instance())  --instance,mGCloudVoiceMode
        ApplyMessageKey:Call(GVoiceManager._get_type_engine_instance(), msTimeout)  --instance,mGCloudVoiceMode
        SetMode:Call(GVoiceManager._get_type_engine_instance(), mGCloudVoiceMode)  --instance,mGCloudVoiceMode
        print("反射gvoice初始化结果：", initResult)
    end

    if initResult == 0 then
        GVoiceManager._initTeamSucess = true
    else
        GVoiceManager.report_event("GVoice_InitTeam", initResult)
    end
    return initResult
end
function GVoiceManager.joinTeam(roomName, callback)
    if ModuleCache.GameManager.isEditor or not GVoiceManager._requireGVoiceManager then
        return
    end

    roomName = tostring(roomName)

    -- 怎么知道是重启的
    if GVoiceManager.get_Last_join_team_name() == roomName and GVoiceManager._type_engine_instance then
        print("GVoice_Has_JoinTeam", roomName)
        if callback then
            callback(0)
        end
        return
    end


    print("准备开始加入房间：", roomName)
    local init = GVoiceManager.initTeam()
    if init == 0 then
        if (GVoiceManager.gvoiceVersion()) then
            local join = 0
            joinTeamRoomState = false
            join = manager:JoinTeamRoom(roomName, msTimeout, function(code, _roomName, memberID)
                print("c# gvoice加入房间最终回调结果（1 成功 其他失败）：", code)
                if joinTeamRoomState then
                    print("JoinTeam多次回调")
                end
                if code == 1 then
                    PlayerPrefsManager.SetString(PLAYER_PREFS_KEY_LastJoinGVoiceTeamName, _roomName)
                    if not joinTeamRoomState then
                        joinTeamRoomState = true
                        PlayerPrefsManager.SetString(PLAYER_PREFS_KEY_LastJoinGVoiceTeamName, _roomName)
                        GVoiceManager.setAutoPause(false)
                        local result = GVoiceManager.openMic()
                        if result ~= 0 then
                            --GCLOUD_VOICE_REALTIME_STATE_ERR 语音实时模式状态错误，当前成员不在房间内，请先调用进房方法进房，再调用开麦方法
                            if result == 8193 then
                                GVoiceManager.joinFailDeal(roomName, callback)
                            end
                            return
                        end
                        GVoiceManager.join_auto_open_speaker()
                        GVoiceManager.joinTimes = 0
                        if callback then
                            callback(0)
                        end
                    end
                else
                    GVoiceManager.joinFailDeal(roomName, callback)
                    GVoiceManager.report_event("GVoice_JoinTeam", code)
                end
            end)
            if join ~= 0 then
                GVoiceManager.joinFailDeal(roomName, callback)
            end
        else
            GVoiceManager._join_team_room(roomName,function (joinResult)
                if joinResult == 0 then
                    PlayerPrefsManager.SetString(PLAYER_PREFS_KEY_LastJoinGVoiceTeamName, roomName)
                    GVoiceManager.join_auto_open_speaker(true)
                else
                    GVoiceManager.joinFailDeal(roomName, callback)
                end
            end)
        end
    else
        print("gvoice加入房间初始化失败", init)
        GVoiceManager.joinFailDeal(roomName, callback)
    end
end

function GVoiceManager._join_team_room(roomName, callback)
    local result
    if (GVoiceManager.gvoiceVersion()) then
        print("c# gvoice加入房间初步结果（0 成功 其他失败）：", result)
    else
        if not GVoiceManager._JoinTeamRoom then
            GVoiceManager._JoinTeamRoom = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'JoinTeamRoom', typeof('System.String'), typeof('System.Int32'))
        end
        result = GVoiceManager._JoinTeamRoom:Call(GVoiceManager._get_type_engine_instance(), roomName, msTimeout)
        coroutine.start(function ()
            coroutine.wait(2)
            for i = 1, 10 do
                result = GVoiceManager.openMic(true)
                --result = GVoiceManager._JoinTeamRoom:Call(GVoiceManager._get_type_engine_instance(), roomName, msTimeout)
                if result == result then
                    result = 0
                    break
                end
                print("反射 gvoice加入房间：", result)
                coroutine.wait(1)
            end
            if callback then
                callback(result)
            end
            print("反射 gvoice加入房间初步结果（0 成功 其他失败）：", result)
        end)

    end
    return result
end



function GVoiceManager.joinFailDeal(roomName, callback)
    if not GVoiceManager.joinTimes then
        GVoiceManager.joinTimes = 0
    end
    if GVoiceManager.joinTimes < 5 then
        print("gvoice加入房间失败,准备再次加入房间，失败次数：", GVoiceManager.joinTimes)
        GVoiceManager.reJoinTeam(roomName, callback)
    elseif GVoiceManager.joinTimes < 20 then
        GVoiceManager.reJoinEventId = CSmartTimer:Subscribe(3, false, 1):OnComplete(function(t)
            GVoiceManager.reJoinTeam(roomName, callback)
        end).id
        if callback then
            callback(-1)
        end
        if GVoiceManager.joinTimes == 5 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("实时语音同步失败，重试中...")
            --ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("实时语音同步失败，重试中...")
        end
    else
        print("gvoice加入房间失败,重复加入20次都没成功，实在没办法了")
        GVoiceManager.joinTimes = 0
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("实时语音同步失败")
        --ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("实时语音同步失败")
    end
end

function GVoiceManager.reJoinTeam(roomName, callback)
    GVoiceManager.joinTimes = GVoiceManager.joinTimes + 1
    GVoiceManager.quitTeam(roomName, function(code, _roomName, memberID)
        GVoiceManager.joinTeam(roomName, callback)
    end, true)
end

function GVoiceManager.get_Last_join_team_name()
    return PlayerPrefsManager.GetString(PLAYER_PREFS_KEY_LastJoinGVoiceTeamName, "")
end


function GVoiceManager.quitTeam(roomName, callback)
    if not GVoiceManager._initTeamSucess or not GVoiceManager.get_Last_join_team_name() then
        return
    end

    roomName = GVoiceManager.get_Last_join_team_name()
    PlayerPrefsManager.SetString(PLAYER_PREFS_KEY_LastQuitGVoiceTeamName, roomName)

    if GVoiceManager.quitEventId then
        CSmartTimer:Kill(GVoiceManager.quitEventId)
        GVoiceManager.quitEventId = nil
    end
    if GVoiceManager.joinEventId then
        CSmartTimer:Kill(GVoiceManager.joinEventId)
        GVoiceManager.joinEventId = nil
    end
    --退出房间没有处理异常判断
    print("开始退出房间：", roomName)

    if (GVoiceManager.gvoiceVersion()) then
        local result = manager:QuitTeamRoom(roomName, msTimeout, function(code, _roomName, memberID)
            print("c# 退出房间回调，退出结果：", code)
            GVoiceManager.closeMic()
            GVoiceManager._close_speaker()
            if code == 6 then
                PlayerPrefsManager.SetString(PLAYER_PREFS_KEY_LastJoinGVoiceTeamName, "")
            end
            if callback then
                callback(code, _roomName, memberID)
            end
        end)
        if result == 0 then
            if callback then
                callback()
            end
        end

        if result == 8193 then
            --实时语音状态不对，比如已经退房了，需要先调用进房方法进房后才能再次退房
            PlayerPrefsManager.SetString(PLAYER_PREFS_KEY_LastJoinGVoiceTeamName, "")
            if callback then
                callback()
            end
        elseif result == 8195 then
            if callback then
                callback()
            end
        end
        --8195 退房失败，请检查退房房间名是否存在
    else
        if not GVoiceManager._typeQuitRoom then
            GVoiceManager._typeQuitRoom = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'QuitRoom', typeof('System.String'), typeof('System.Int32'))
        end
        local result = GVoiceManager._typeQuitRoom:Call(GVoiceManager._get_type_engine_instance(), roomName, msTimeout)
        GVoiceManager.quitEventId = CSmartTimer:Subscribe(2, false, 1):OnComplete(function(t)
            GVoiceManager.closeMic()
            GVoiceManager._close_speaker()
            print("反射 退出房间")
            if callback then
                callback()
            end
        end).id
    end
end

function GVoiceManager.openMic(reflect)
    if not GVoiceManager._initTeamSucess then
        return
    end

    local result
    if (GVoiceManager.gvoiceVersion()) then
        result = manager:OpenMic()
    else
        if not GVoiceManager._typeOpenMic then
            GVoiceManager._typeOpenMic = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'OpenMic')
        end
        result = GVoiceManager._typeOpenMic:Call(GVoiceManager._get_type_engine_instance())
    end
    if result ~= 0 then
        if reflect then
            GVoiceManager.report_event("GVoice_OpenMic_Reflect", result)
        else
            GVoiceManager.report_event("GVoice_OpenMic", result)
        end

        if result == 12291 then
            --麦克风权限关闭
            --if ModuleCache.GameManager.platformIsAndroid then
            --    ModuleCache.ModuleManager.show_public_module_alertdialog():show_confirm_cancel("此玩法需要检测您的地理位置,而您设备GPS处于关闭状\n态(部分手机定位模式需要选择<color=red>高精确度模式</color>),\n是否前往打开？", function()
            --        ModuleCache.GameSDKInterface:StartActivity("android.settings.LOCATION_SOURCE_SETTINGS")
            --    end)
            --elseif ModuleCache.GameManager.platformIsIphone then
            --    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("实时语音开启麦克风失败，请检查权限")
            --end
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("实时语音开启麦克风失败，请检查是否开启语音权限")
        end
    end
    return result
end

function GVoiceManager.closeMic(reflect)
    if not GVoiceManager._initTeamSucess then
        return
    end

    local result
    if (GVoiceManager.gvoiceVersion()) then
        result = manager:CloseMic()
    else
        if not GVoiceManager._typeCloseMic then
            GVoiceManager._typeCloseMic = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'CloseMic')
        end

        result = GVoiceManager._typeCloseMic:Call(GVoiceManager._get_type_engine_instance())
    end
    if result ~= 0 then
        GVoiceManager.report_event("GVoice_CloseMic", result)
    end
    return result
end

function GVoiceManager.speaker_is_open(reflect)
    return ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_GVoiceTeamNameSpeakerOpenState, "1") == "1"
end


function GVoiceManager._open_speaker(reflect)
    if not GVoiceManager._initTeamSucess then
        return
    end

    local result
    if (GVoiceManager.gvoiceVersion()) then
        result = manager:OpenSpeaker()
    else
        if not GVoiceManager._typeOpenSpeaker then
            GVoiceManager._typeOpenSpeaker = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'OpenSpeaker')
        end
        result = GVoiceManager._typeOpenSpeaker:Call(GVoiceManager._get_type_engine_instance())
    end

    if result ~= 0 then
        if reflect then
            GVoiceManager.report_event("GVoice_OpenSpeaker_Reflect", result)
        else
            GVoiceManager.report_event("GVoice_OpenSpeaker", result)
        end
    end
    GVoiceManager._speaker_is_open = result == 0
    return result
end

function GVoiceManager.join_auto_open_speaker(reflect)
    if ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_GVoiceTeamNameSpeakerOpenState, "1") == "1" then
        GVoiceManager._open_speaker(reflect)
    end
end




function GVoiceManager.openSpeaker(reflect)
    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_GVoiceTeamNameSpeakerOpenState, "1")
    return GVoiceManager._open_speaker(reflect)
end

function GVoiceManager._close_speaker(reflect)
    if not GVoiceManager._initTeamSucess then
        return
    end

    local result
    if (GVoiceManager.gvoiceVersion()) then
        result = manager:CloseSpeaker()
    else
        if not GVoiceManager._typeCloseSpeaker then
            GVoiceManager._typeCloseSpeaker = tolua.getmethod(typeof('gcloud_voice.IGCloudVoice'), 'CloseSpeaker')
        end
        result = GVoiceManager._typeCloseSpeaker:Call(GVoiceManager._get_type_engine_instance())
    end
    if result ~= 0 then
        GVoiceManager.report_event("GVoice_CloseSpeaker", result)
    end

    if result == 0 then
        GVoiceManager._speaker_is_open = false
    end
    return result
end


function GVoiceManager.closeSpeaker(reflect)
    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_GVoiceTeamNameSpeakerOpenState, "0")
    return GVoiceManager._close_speaker(reflect)
end

function GVoiceManager.getAutoPause()
    return manager.PauseStatus
end

function GVoiceManager.setAutoPause(pause)
    manager.PauseStatus = pause
end

function GVoiceManager.pauseVoice()
    manager:PauseVoice()
end

function GVoiceManager.resumeVoice()
    manager:ResumeVoice()
end

function GVoiceManager.testMic()
    local t = manager:TestMic()
    return t
end

--micLevel
--isSpeaking
--speakerLevel
function GVoiceManager.getVoiceStatus()
    local status = manager:GetVoiceStatus()
    return status
end

--获取权限状态  "android.permission.RECORD_AUDIO"
function GVoiceManager.PermissionCheck(permission)
    return GameSDKInterface:PermissionCheck(permission)
end

--请求权限  "android.permission.RECORD_AUDIO"
function GVoiceManager.RequestPermission(permission, callback)
    GameSDKInterface:RequestPermission(permission)
    GVoiceManager._permissionCallback = callback
end

--权限请求回调
function GVoiceManager.OnRequestPermissionsCallback(data)
    local d = json.decode(data)
    print("================OnRequestPermissionsCallback===========", d.result, d.permission)
    if GVoiceManager._permissionCallback then
        GVoiceManager._permissionCallback(d)
        GVoiceManager._permissionCallback = nil
    end
end

-- 获取手机通话状态（包括电话微信qq语音等） -2设备不支持（ios） -1 没有权限 0 空闲  1 来电状态 2 通话状态 3 voip通话中(微信qq语音聊天)
function GVoiceManager.GetTalkingStatus()
    return GameSDKInterface:GetTalkingStatus()
end

function GVoiceManager.DestroyGVoice()
end

return GVoiceManager