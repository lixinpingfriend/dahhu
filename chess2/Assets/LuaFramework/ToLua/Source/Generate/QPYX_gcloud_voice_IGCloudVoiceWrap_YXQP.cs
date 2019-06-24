using System;
using LuaInterface;

public class QPYX_gcloud_voice_IGCloudVoiceWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(gcloud_voice.IGCloudVoice), typeof(System.Object));
		L_YXQP.RegFunction("SetAppInfo", QPYX_SetAppInfo_YXQP);
		L_YXQP.RegFunction("SetServerInfo", QPYX_SetServerInfo_YXQP);
		L_YXQP.RegFunction("Init", QPYX_Init_YXQP);
		L_YXQP.RegFunction("SetMode", QPYX_SetMode_YXQP);
		L_YXQP.RegFunction("Poll", QPYX_Poll_YXQP);
		L_YXQP.RegFunction("Pause", QPYX_Pause_YXQP);
		L_YXQP.RegFunction("Resume", QPYX_Resume_YXQP);
		L_YXQP.RegFunction("JoinTeamRoom", QPYX_JoinTeamRoom_YXQP);
		L_YXQP.RegFunction("JoinRangeRoom", QPYX_JoinRangeRoom_YXQP);
		L_YXQP.RegFunction("JoinNationalRoom", QPYX_JoinNationalRoom_YXQP);
		L_YXQP.RegFunction("ChangeRole", QPYX_ChangeRole_YXQP);
		L_YXQP.RegFunction("JoinFMRoom", QPYX_JoinFMRoom_YXQP);
		L_YXQP.RegFunction("QuitRoom", QPYX_QuitRoom_YXQP);
		L_YXQP.RegFunction("OpenMic", QPYX_OpenMic_YXQP);
		L_YXQP.RegFunction("CloseMic", QPYX_CloseMic_YXQP);
		L_YXQP.RegFunction("OpenSpeaker", QPYX_OpenSpeaker_YXQP);
		L_YXQP.RegFunction("CloseSpeaker", QPYX_CloseSpeaker_YXQP);
		L_YXQP.RegFunction("EnableRoomMicrophone", QPYX_EnableRoomMicrophone_YXQP);
		L_YXQP.RegFunction("EnableRoomSpeaker", QPYX_EnableRoomSpeaker_YXQP);
		L_YXQP.RegFunction("EnableMultiRoom", QPYX_EnableMultiRoom_YXQP);
		L_YXQP.RegFunction("UpdateCoordinate", QPYX_UpdateCoordinate_YXQP);
		L_YXQP.RegFunction("ApplyMessageKey", QPYX_ApplyMessageKey_YXQP);
		L_YXQP.RegFunction("SetMaxMessageLength", QPYX_SetMaxMessageLength_YXQP);
		L_YXQP.RegFunction("StartRecording", QPYX_StartRecording_YXQP);
		L_YXQP.RegFunction("StopRecording", QPYX_StopRecording_YXQP);
		L_YXQP.RegFunction("UploadRecordedFile", QPYX_UploadRecordedFile_YXQP);
		L_YXQP.RegFunction("DownloadRecordedFile", QPYX_DownloadRecordedFile_YXQP);
		L_YXQP.RegFunction("PlayRecordedFile", QPYX_PlayRecordedFile_YXQP);
		L_YXQP.RegFunction("StopPlayFile", QPYX_StopPlayFile_YXQP);
		L_YXQP.RegFunction("SpeechToText", QPYX_SpeechToText_YXQP);
		L_YXQP.RegFunction("ForbidMemberVoice", QPYX_ForbidMemberVoice_YXQP);
		L_YXQP.RegFunction("EnableLog", QPYX_EnableLog_YXQP);
		L_YXQP.RegFunction("GetMicLevel", QPYX_GetMicLevel_YXQP);
		L_YXQP.RegFunction("IsSpeaking", QPYX_IsSpeaking_YXQP);
		L_YXQP.RegFunction("GetSpeakerLevel", QPYX_GetSpeakerLevel_YXQP);
		L_YXQP.RegFunction("SetSpeakerVolume", QPYX_SetSpeakerVolume_YXQP);
		L_YXQP.RegFunction("TestMic", QPYX_TestMic_YXQP);
		L_YXQP.RegFunction("GetFileParam", QPYX_GetFileParam_YXQP);
		L_YXQP.RegFunction("invoke", QPYX_invoke_YXQP);
		L_YXQP.RegFunction("GetExtensionPluginContext", QPYX_GetExtensionPluginContext_YXQP);
		L_YXQP.RegFunction("EnableSpeakerOn", QPYX_EnableSpeakerOn_YXQP);
		L_YXQP.RegFunction("SetMicVolume", QPYX_SetMicVolume_YXQP);
		L_YXQP.RegFunction("SetVoiceEffects", QPYX_SetVoiceEffects_YXQP);
		L_YXQP.RegFunction("EnableReverb", QPYX_EnableReverb_YXQP);
		L_YXQP.RegFunction("SetReverbMode", QPYX_SetReverbMode_YXQP);
		L_YXQP.RegFunction("GetVoiceIdentify", QPYX_GetVoiceIdentify_YXQP);
		L_YXQP.RegFunction("SetBGMPath", QPYX_SetBGMPath_YXQP);
		L_YXQP.RegFunction("StartBGMPlay", QPYX_StartBGMPlay_YXQP);
		L_YXQP.RegFunction("StopBGMPlay", QPYX_StopBGMPlay_YXQP);
		L_YXQP.RegFunction("PauseBGMPlay", QPYX_PauseBGMPlay_YXQP);
		L_YXQP.RegFunction("ResumeBGMPlay", QPYX_ResumeBGMPlay_YXQP);
		L_YXQP.RegFunction("SetBGMVol", QPYX_SetBGMVol_YXQP);
		L_YXQP.RegFunction("GetBGMPlayState", QPYX_GetBGMPlayState_YXQP);
		L_YXQP.RegFunction("EnableNativeBGMPlay", QPYX_EnableNativeBGMPlay_YXQP);
		L_YXQP.RegFunction("SetBitRate", QPYX_SetBitRate_YXQP);
		L_YXQP.RegFunction("GetHwState", QPYX_GetHwState_YXQP);
		L_YXQP.RegFunction("SetDataFree", QPYX_SetDataFree_YXQP);
		L_YXQP.RegFunction("getAudioDeviceConnectionState", QPYX_getAudioDeviceConnectionState_YXQP);
		L_YXQP.RegFunction("EnableBluetoothSCO", QPYX_EnableBluetoothSCO_YXQP);
		L_YXQP.RegFunction("CheckDeviceMuteState", QPYX_CheckDeviceMuteState_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("OnJoinRoomComplete", QPYX_get_OnJoinRoomComplete_YXQP, QPYX_set_OnJoinRoomComplete_YXQP);
		L_YXQP.RegVar("OnQuitRoomComplete", QPYX_get_OnQuitRoomComplete_YXQP, QPYX_set_OnQuitRoomComplete_YXQP);
		L_YXQP.RegVar("OnMemberVoice", QPYX_get_OnMemberVoice_YXQP, QPYX_set_OnMemberVoice_YXQP);
		L_YXQP.RegVar("OnApplyMessageKeyComplete", QPYX_get_OnApplyMessageKeyComplete_YXQP, QPYX_set_OnApplyMessageKeyComplete_YXQP);
		L_YXQP.RegVar("OnUploadReccordFileComplete", QPYX_get_OnUploadReccordFileComplete_YXQP, QPYX_set_OnUploadReccordFileComplete_YXQP);
		L_YXQP.RegVar("OnDownloadRecordFileComplete", QPYX_get_OnDownloadRecordFileComplete_YXQP, QPYX_set_OnDownloadRecordFileComplete_YXQP);
		L_YXQP.RegVar("OnPlayRecordFilComplete", QPYX_get_OnPlayRecordFilComplete_YXQP, QPYX_set_OnPlayRecordFilComplete_YXQP);
		L_YXQP.RegVar("OnSpeechToText", QPYX_get_OnSpeechToText_YXQP, QPYX_set_OnSpeechToText_YXQP);
		L_YXQP.RegVar("OnStreamSpeechToText", QPYX_get_OnStreamSpeechToText_YXQP, QPYX_set_OnStreamSpeechToText_YXQP);
		L_YXQP.RegVar("OnStatusUpdate", QPYX_get_OnStatusUpdate_YXQP, QPYX_set_OnStatusUpdate_YXQP);
		L_YXQP.RegVar("OnRoleChangeComplete", QPYX_get_OnRoleChangeComplete_YXQP, QPYX_set_OnRoleChangeComplete_YXQP);
		L_YXQP.RegVar("OnRoomMemberVoice", QPYX_get_OnRoomMemberVoice_YXQP, QPYX_set_OnRoomMemberVoice_YXQP);
		L_YXQP.RegVar("OnEvent", QPYX_get_OnEvent_YXQP, QPYX_set_OnEvent_YXQP);
		L_YXQP.RegVar("OnMuteSwitchState", QPYX_get_OnMuteSwitchState_YXQP, QPYX_set_OnMuteSwitchState_YXQP);
		L_YXQP.RegFunction("MuteSwitchResultHandler", QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP);
		L_YXQP.RegFunction("EventUpdateHandler", QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP);
		L_YXQP.RegFunction("RoomMemberVoiceHandler", QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP);
		L_YXQP.RegFunction("ChangeRoleCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP);
		L_YXQP.RegFunction("StatusUpdateHandler", QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP);
		L_YXQP.RegFunction("StreamSpeechToTextHandler", QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP);
		L_YXQP.RegFunction("SpeechToTextHandler", QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP);
		L_YXQP.RegFunction("PlayRecordFilCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP);
		L_YXQP.RegFunction("DownloadRecordFileCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP);
		L_YXQP.RegFunction("UploadReccordFileCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP);
		L_YXQP.RegFunction("ApplyMessageKeyCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP);
		L_YXQP.RegFunction("MemberVoiceHandler", QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP);
		L_YXQP.RegFunction("QuitRoomCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP);
		L_YXQP.RegFunction("JoinRoomCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAppInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetAppInfo(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetServerInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetServerInfo(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Init_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.Init();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			gcloud_voice.GCloudVoiceMode QPYX_arg0_YXQP = (gcloud_voice.GCloudVoiceMode)ToLua.CheckObject(L_YXQP, 2, typeof(gcloud_voice.GCloudVoiceMode));
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetMode(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Poll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.Poll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Pause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.Pause();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Resume_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.Resume();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JoinTeamRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.JoinTeamRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.JoinTeamRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.JoinTeamRoom");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JoinRangeRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_o_YXQP = QPYX_obj_YXQP.JoinRangeRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JoinNationalRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				gcloud_voice.GCloudVoiceRole QPYX_arg1_YXQP = (gcloud_voice.GCloudVoiceRole)ToLua.CheckObject(L_YXQP, 3, typeof(gcloud_voice.GCloudVoiceRole));
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.JoinNationalRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				gcloud_voice.GCloudVoiceRole QPYX_arg3_YXQP = (gcloud_voice.GCloudVoiceRole)ToLua.CheckObject(L_YXQP, 5, typeof(gcloud_voice.GCloudVoiceRole));
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_o_YXQP = QPYX_obj_YXQP.JoinNationalRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.JoinNationalRoom");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ChangeRole_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				gcloud_voice.GCloudVoiceRole QPYX_arg0_YXQP = (gcloud_voice.GCloudVoiceRole)ToLua.CheckObject(L_YXQP, 2, typeof(gcloud_voice.GCloudVoiceRole));
				int QPYX_o_YXQP = QPYX_obj_YXQP.ChangeRole(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				gcloud_voice.GCloudVoiceRole QPYX_arg0_YXQP = (gcloud_voice.GCloudVoiceRole)ToLua.CheckObject(L_YXQP, 2, typeof(gcloud_voice.GCloudVoiceRole));
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.ChangeRole(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.ChangeRole");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JoinFMRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_o_YXQP = QPYX_obj_YXQP.JoinFMRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_QuitRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_o_YXQP = QPYX_obj_YXQP.QuitRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OpenMic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.OpenMic();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CloseMic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.CloseMic();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OpenSpeaker_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.OpenSpeaker();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CloseSpeaker_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.CloseSpeaker();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableRoomMicrophone_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			int QPYX_o_YXQP = QPYX_obj_YXQP.EnableRoomMicrophone(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableRoomSpeaker_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			int QPYX_o_YXQP = QPYX_obj_YXQP.EnableRoomSpeaker(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableMultiRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.EnableMultiRoom(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UpdateCoordinate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 6);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			long QPYX_arg1_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 3);
			long QPYX_arg2_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 4);
			long QPYX_arg3_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 5);
			long QPYX_arg4_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 6);
			int QPYX_o_YXQP = QPYX_obj_YXQP.UpdateCoordinate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ApplyMessageKey_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.ApplyMessageKey(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.ApplyMessageKey(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.ApplyMessageKey");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMaxMessageLength_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetMaxMessageLength(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartRecording_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.StartRecording(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.StartRecording(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.StartRecording");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopRecording_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.StopRecording();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UploadRecordedFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.UploadRecordedFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.UploadRecordedFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.UploadRecordedFile");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DownloadRecordedFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DownloadRecordedFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DownloadRecordedFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.DownloadRecordedFile");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayRecordedFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.PlayRecordedFile(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopPlayFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.StopPlayFile();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SpeechToText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.SpeechToText(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.SpeechToText(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, int>(L_YXQP, 3))
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.SpeechToText(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<int, int>(L_YXQP, 3))
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.SpeechToText(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.SpeechToText(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_o_YXQP = QPYX_obj_YXQP.SpeechToText(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.SpeechToText");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ForbidMemberVoice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.ForbidMemberVoice(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.ForbidMemberVoice(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.ForbidMemberVoice");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableLog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.EnableLog(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetMicLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetMicLevel();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetMicLevel(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: gcloud_voice.IGCloudVoice.GetMicLevel");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsSpeaking_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.IsSpeaking();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetSpeakerLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetSpeakerLevel();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSpeakerVolume_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetSpeakerVolume(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TestMic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.TestMic();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFileParam_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int[] QPYX_arg1_YXQP = ToLua.CheckNumberArray<int>(L_YXQP, 3);
			float[] QPYX_arg2_YXQP = ToLua.CheckNumberArray<float>(L_YXQP, 4);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetFileParam(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_invoke_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			uint QPYX_arg0_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
			uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 3);
			uint QPYX_arg2_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 4);
			uint[] QPYX_arg3_YXQP = ToLua.CheckNumberArray<uint>(L_YXQP, 5);
			int QPYX_o_YXQP = QPYX_obj_YXQP.invoke(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetExtensionPluginContext_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			System.IntPtr QPYX_o_YXQP = QPYX_obj_YXQP.GetExtensionPluginContext();
			LuaDLL.lua_pushlightuserdata(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableSpeakerOn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.EnableSpeakerOn(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMicVolume_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetMicVolume(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetVoiceEffects_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			gcloud_voice.SoundEffects QPYX_arg0_YXQP = (gcloud_voice.SoundEffects)ToLua.CheckObject(L_YXQP, 2, typeof(gcloud_voice.SoundEffects));
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetVoiceEffects(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableReverb_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.EnableReverb(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetReverbMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetReverbMode(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetVoiceIdentify_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetVoiceIdentify();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBGMPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetBGMPath(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartBGMPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.StartBGMPlay();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopBGMPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.StopBGMPlay();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PauseBGMPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.PauseBGMPlay();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResumeBGMPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.ResumeBGMPlay();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBGMVol_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetBGMVol(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBGMPlayState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetBGMPlayState();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableNativeBGMPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.EnableNativeBGMPlay(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBitRate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetBitRate(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetHwState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetHwState();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetDataFree_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.SetDataFree(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_getAudioDeviceConnectionState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.getAudioDeviceConnectionState();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableBluetoothSCO_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.EnableBluetoothSCO(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CheckDeviceMuteState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			gcloud_voice.IGCloudVoice  QPYX_obj_YXQP  = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.CheckDeviceMuteState();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnJoinRoomComplete_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnQuitRoomComplete_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnMemberVoice_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.MemberVoiceHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnApplyMessageKeyComplete_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnUploadReccordFileComplete_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnDownloadRecordFileComplete_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnPlayRecordFilComplete_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnSpeechToText_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.SpeechToTextHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnStreamSpeechToText_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnStatusUpdate_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.StatusUpdateHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnRoleChangeComplete_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnRoomMemberVoice_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnEvent_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.EventUpdateHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnMuteSwitchState_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(gcloud_voice.IGCloudVoice.MuteSwitchResultHandler)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnJoinRoomComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnJoinRoomComplete' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnJoinRoomComplete += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnJoinRoomComplete -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnQuitRoomComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnQuitRoomComplete' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnQuitRoomComplete += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnQuitRoomComplete -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnMemberVoice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnMemberVoice' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.MemberVoiceHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.MemberVoiceHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnMemberVoice += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.MemberVoiceHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.MemberVoiceHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnMemberVoice -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnApplyMessageKeyComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnApplyMessageKeyComplete' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnApplyMessageKeyComplete += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnApplyMessageKeyComplete -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnUploadReccordFileComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnUploadReccordFileComplete' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnUploadReccordFileComplete += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnUploadReccordFileComplete -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnDownloadRecordFileComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnDownloadRecordFileComplete' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnDownloadRecordFileComplete += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnDownloadRecordFileComplete -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnPlayRecordFilComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnPlayRecordFilComplete' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnPlayRecordFilComplete += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnPlayRecordFilComplete -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnSpeechToText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnSpeechToText' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.SpeechToTextHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.SpeechToTextHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnSpeechToText += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.SpeechToTextHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.SpeechToTextHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnSpeechToText -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnStreamSpeechToText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnStreamSpeechToText' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnStreamSpeechToText += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnStreamSpeechToText -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnStatusUpdate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnStatusUpdate' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.StatusUpdateHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.StatusUpdateHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnStatusUpdate += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.StatusUpdateHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.StatusUpdateHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnStatusUpdate -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnRoleChangeComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnRoleChangeComplete' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnRoleChangeComplete += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnRoleChangeComplete -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnRoomMemberVoice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnRoomMemberVoice' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnRoomMemberVoice += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnRoomMemberVoice -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnEvent' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.EventUpdateHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.EventUpdateHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnEvent += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.EventUpdateHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.EventUpdateHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnEvent -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnMuteSwitchState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			gcloud_voice.IGCloudVoice QPYX_obj_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject(L_YXQP, 1, typeof(gcloud_voice.IGCloudVoice));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'gcloud_voice.IGCloudVoice.OnMuteSwitchState' can only appear on the left hand side of += or -= when used outside of the type 'gcloud_voice.IGCloudVoice'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				gcloud_voice.IGCloudVoice.MuteSwitchResultHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.MuteSwitchResultHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnMuteSwitchState += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				gcloud_voice.IGCloudVoice.MuteSwitchResultHandler QPYX_ev_YXQP = (gcloud_voice.IGCloudVoice.MuteSwitchResultHandler)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnMuteSwitchState -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MuteSwitchResultHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MuteSwitchResultHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.EventUpdateHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.EventUpdateHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StatusUpdateHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StatusUpdateHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.SpeechToTextHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.SpeechToTextHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MemberVoiceHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MemberVoiceHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

