using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_DownloadHandlerAudioClipWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Networking.DownloadHandlerAudioClip), typeof(UnityEngine.Networking.DownloadHandler));
		L_YXQP.RegFunction("GetContent", QPYX_GetContent_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Networking_DownloadHandlerAudioClip_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("audioClip", QPYX_get_audioClip_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Networking_DownloadHandlerAudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.AudioType QPYX_arg1_YXQP = (UnityEngine.AudioType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioType));
				UnityEngine.Networking.DownloadHandlerAudioClip QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerAudioClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Networking.DownloadHandlerAudioClip.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetContent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest QPYX_arg0_YXQP = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			UnityEngine.AudioClip QPYX_o_YXQP = UnityEngine.Networking.DownloadHandlerAudioClip.GetContent(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_audioClip_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.DownloadHandlerAudioClip QPYX_obj_YXQP = (UnityEngine.Networking.DownloadHandlerAudioClip)QPYX_o_YXQP;
			UnityEngine.AudioClip QPYX_ret_YXQP = QPYX_obj_YXQP.audioClip;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index audioClip on a nil value");
		}
	}
}

