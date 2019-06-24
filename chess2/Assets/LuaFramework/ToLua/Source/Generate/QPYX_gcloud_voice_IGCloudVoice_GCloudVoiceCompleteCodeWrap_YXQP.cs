using System;
using LuaInterface;

public class QPYX_gcloud_voice_IGCloudVoice_GCloudVoiceCompleteCodeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode));
		L_YXQP.RegVar("GV_ON_JOINROOM_SUCC", QPYX_get_GV_ON_JOINROOM_SUCC_YXQP, null);
		L_YXQP.RegVar("GV_ON_JOINROOM_TIMEOUT", QPYX_get_GV_ON_JOINROOM_TIMEOUT_YXQP, null);
		L_YXQP.RegVar("GV_ON_JOINROOM_SVR_ERR", QPYX_get_GV_ON_JOINROOM_SVR_ERR_YXQP, null);
		L_YXQP.RegVar("GV_ON_JOINROOM_UNKNOWN", QPYX_get_GV_ON_JOINROOM_UNKNOWN_YXQP, null);
		L_YXQP.RegVar("GV_ON_NET_ERR", QPYX_get_GV_ON_NET_ERR_YXQP, null);
		L_YXQP.RegVar("GV_ON_QUITROOM_SUCC", QPYX_get_GV_ON_QUITROOM_SUCC_YXQP, null);
		L_YXQP.RegVar("GV_ON_MESSAGE_KEY_APPLIED_SUCC", QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_SUCC_YXQP, null);
		L_YXQP.RegVar("GV_ON_MESSAGE_KEY_APPLIED_TIMEOUT", QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_TIMEOUT_YXQP, null);
		L_YXQP.RegVar("GV_ON_MESSAGE_KEY_APPLIED_SVR_ERR", QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_SVR_ERR_YXQP, null);
		L_YXQP.RegVar("GV_ON_MESSAGE_KEY_APPLIED_UNKNOWN", QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_UNKNOWN_YXQP, null);
		L_YXQP.RegVar("GV_ON_UPLOAD_RECORD_DONE", QPYX_get_GV_ON_UPLOAD_RECORD_DONE_YXQP, null);
		L_YXQP.RegVar("GV_ON_UPLOAD_RECORD_ERROR", QPYX_get_GV_ON_UPLOAD_RECORD_ERROR_YXQP, null);
		L_YXQP.RegVar("GV_ON_DOWNLOAD_RECORD_DONE", QPYX_get_GV_ON_DOWNLOAD_RECORD_DONE_YXQP, null);
		L_YXQP.RegVar("GV_ON_DOWNLOAD_RECORD_ERROR", QPYX_get_GV_ON_DOWNLOAD_RECORD_ERROR_YXQP, null);
		L_YXQP.RegVar("GV_ON_STT_SUCC", QPYX_get_GV_ON_STT_SUCC_YXQP, null);
		L_YXQP.RegVar("GV_ON_STT_TIMEOUT", QPYX_get_GV_ON_STT_TIMEOUT_YXQP, null);
		L_YXQP.RegVar("GV_ON_STT_APIERR", QPYX_get_GV_ON_STT_APIERR_YXQP, null);
		L_YXQP.RegVar("GV_ON_RSTT_SUCC", QPYX_get_GV_ON_RSTT_SUCC_YXQP, null);
		L_YXQP.RegVar("GV_ON_RSTT_TIMEOUT", QPYX_get_GV_ON_RSTT_TIMEOUT_YXQP, null);
		L_YXQP.RegVar("GV_ON_RSTT_APIERR", QPYX_get_GV_ON_RSTT_APIERR_YXQP, null);
		L_YXQP.RegVar("GV_ON_PLAYFILE_DONE", QPYX_get_GV_ON_PLAYFILE_DONE_YXQP, null);
		L_YXQP.RegVar("GV_ON_ROOM_OFFLINE", QPYX_get_GV_ON_ROOM_OFFLINE_YXQP, null);
		L_YXQP.RegVar("GV_ON_UNKNOWN", QPYX_get_GV_ON_UNKNOWN_YXQP, null);
		L_YXQP.RegVar("GV_ON_ROLE_SUCC", QPYX_get_GV_ON_ROLE_SUCC_YXQP, null);
		L_YXQP.RegVar("GV_ON_ROLE_TIMEOUT", QPYX_get_GV_ON_ROLE_TIMEOUT_YXQP, null);
		L_YXQP.RegVar("GV_ON_ROLE_MAX_AHCHOR", QPYX_get_GV_ON_ROLE_MAX_AHCHOR_YXQP, null);
		L_YXQP.RegVar("GV_ON_ROLE_NO_CHANGE", QPYX_get_GV_ON_ROLE_NO_CHANGE_YXQP, null);
		L_YXQP.RegVar("GV_ON_ROLE_SVR_ERROR", QPYX_get_GV_ON_ROLE_SVR_ERROR_YXQP, null);
		L_YXQP.RegVar("GV_ON_RSTT_RETRY", QPYX_get_GV_ON_RSTT_RETRY_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode>.Check = QPYX_CheckType_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_JOINROOM_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_JOINROOM_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_JOINROOM_TIMEOUT_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_JOINROOM_TIMEOUT);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_JOINROOM_SVR_ERR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_JOINROOM_SVR_ERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_JOINROOM_UNKNOWN_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_JOINROOM_UNKNOWN);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_NET_ERR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_NET_ERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_QUITROOM_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_QUITROOM_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_MESSAGE_KEY_APPLIED_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_TIMEOUT_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_MESSAGE_KEY_APPLIED_TIMEOUT);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_SVR_ERR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_MESSAGE_KEY_APPLIED_SVR_ERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_MESSAGE_KEY_APPLIED_UNKNOWN_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_MESSAGE_KEY_APPLIED_UNKNOWN);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_UPLOAD_RECORD_DONE_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_UPLOAD_RECORD_DONE);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_UPLOAD_RECORD_ERROR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_UPLOAD_RECORD_ERROR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_DOWNLOAD_RECORD_DONE_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_DOWNLOAD_RECORD_DONE);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_DOWNLOAD_RECORD_ERROR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_DOWNLOAD_RECORD_ERROR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_STT_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_STT_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_STT_TIMEOUT_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_STT_TIMEOUT);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_STT_APIERR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_STT_APIERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_RSTT_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_RSTT_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_RSTT_TIMEOUT_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_RSTT_TIMEOUT);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_RSTT_APIERR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_RSTT_APIERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_PLAYFILE_DONE_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_PLAYFILE_DONE);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_ROOM_OFFLINE_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_ROOM_OFFLINE);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_UNKNOWN_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_UNKNOWN);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_ROLE_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_ROLE_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_ROLE_TIMEOUT_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_ROLE_TIMEOUT);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_ROLE_MAX_AHCHOR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_ROLE_MAX_AHCHOR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_ROLE_NO_CHANGE_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_ROLE_NO_CHANGE);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_ROLE_SVR_ERROR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_ROLE_SVR_ERROR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_GV_ON_RSTT_RETRY_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode.GV_ON_RSTT_RETRY);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_o_YXQP = (gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

