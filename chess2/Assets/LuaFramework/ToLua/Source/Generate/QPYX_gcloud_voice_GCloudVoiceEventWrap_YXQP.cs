using System;
using LuaInterface;

public class QPYX_gcloud_voice_GCloudVoiceEventWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(gcloud_voice.GCloudVoiceEvent));
		L_YXQP.RegVar("EVENT_NO_DEVICE_CONNECTED", QPYX_get_EVENT_NO_DEVICE_CONNECTED_YXQP, null);
		L_YXQP.RegVar("EVENT_HEADSET_DISCONNECTED", QPYX_get_EVENT_HEADSET_DISCONNECTED_YXQP, null);
		L_YXQP.RegVar("EVENT_HEADSET_CONNECTED", QPYX_get_EVENT_HEADSET_CONNECTED_YXQP, null);
		L_YXQP.RegVar("EVENT_BLUETOOTH_HEADSET_DISCONNECTED", QPYX_get_EVENT_BLUETOOTH_HEADSET_DISCONNECTED_YXQP, null);
		L_YXQP.RegVar("EVENT_BLUETOOTH_HEADSET_CONNECTED", QPYX_get_EVENT_BLUETOOTH_HEADSET_CONNECTED_YXQP, null);
		L_YXQP.RegVar("EVENT_MIC_STATE_OPEN_SUCC", QPYX_get_EVENT_MIC_STATE_OPEN_SUCC_YXQP, null);
		L_YXQP.RegVar("EVENT_MIC_STATE_OPEN_ERR", QPYX_get_EVENT_MIC_STATE_OPEN_ERR_YXQP, null);
		L_YXQP.RegVar("EVENT_MIC_STATE_NO_OPEN", QPYX_get_EVENT_MIC_STATE_NO_OPEN_YXQP, null);
		L_YXQP.RegVar("EVENT_MIC_STATE_OCCUPANCY", QPYX_get_EVENT_MIC_STATE_OCCUPANCY_YXQP, null);
		L_YXQP.RegVar("EVENT_SPEAKER_STATE_OPEN_SUCC", QPYX_get_EVENT_SPEAKER_STATE_OPEN_SUCC_YXQP, null);
		L_YXQP.RegVar("EVENT_SPEAKER_STATE_OPEN_ERR", QPYX_get_EVENT_SPEAKER_STATE_OPEN_ERR_YXQP, null);
		L_YXQP.RegVar("EVENT_SPEAKER_STATE_NO_OPEN", QPYX_get_EVENT_SPEAKER_STATE_NO_OPEN_YXQP, null);
		L_YXQP.RegVar("EVENT_AUDIO_INTERRUPT_BEGIN", QPYX_get_EVENT_AUDIO_INTERRUPT_BEGIN_YXQP, null);
		L_YXQP.RegVar("EVENT_AUDIO_INTERRUPT_END", QPYX_get_EVENT_AUDIO_INTERRUPT_END_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<gcloud_voice.GCloudVoiceEvent>.Check = QPYX_CheckType_YXQP;
		StackTraits<gcloud_voice.GCloudVoiceEvent>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, gcloud_voice.GCloudVoiceEvent arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(gcloud_voice.GCloudVoiceEvent), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_NO_DEVICE_CONNECTED_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_NO_DEVICE_CONNECTED);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_HEADSET_DISCONNECTED_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_HEADSET_DISCONNECTED);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_HEADSET_CONNECTED_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_HEADSET_CONNECTED);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_BLUETOOTH_HEADSET_DISCONNECTED_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_BLUETOOTH_HEADSET_DISCONNECTED);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_BLUETOOTH_HEADSET_CONNECTED_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_BLUETOOTH_HEADSET_CONNECTED);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_MIC_STATE_OPEN_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_MIC_STATE_OPEN_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_MIC_STATE_OPEN_ERR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_MIC_STATE_OPEN_ERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_MIC_STATE_NO_OPEN_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_MIC_STATE_NO_OPEN);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_MIC_STATE_OCCUPANCY_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_MIC_STATE_OCCUPANCY);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_SPEAKER_STATE_OPEN_SUCC_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_SPEAKER_STATE_OPEN_SUCC);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_SPEAKER_STATE_OPEN_ERR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_SPEAKER_STATE_OPEN_ERR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_SPEAKER_STATE_NO_OPEN_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_SPEAKER_STATE_NO_OPEN);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_AUDIO_INTERRUPT_BEGIN_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_AUDIO_INTERRUPT_BEGIN);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EVENT_AUDIO_INTERRUPT_END_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, gcloud_voice.GCloudVoiceEvent.EVENT_AUDIO_INTERRUPT_END);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		gcloud_voice.GCloudVoiceEvent QPYX_o_YXQP = (gcloud_voice.GCloudVoiceEvent)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

