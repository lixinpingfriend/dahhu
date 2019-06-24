using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_DownloadHandlerBufferWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Networking.DownloadHandlerBuffer), typeof(UnityEngine.Networking.DownloadHandler));
		L_YXQP.RegFunction("GetContent", QPYX_GetContent_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Networking_DownloadHandlerBuffer_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Networking_DownloadHandlerBuffer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Networking.DownloadHandlerBuffer QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerBuffer();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Networking.DownloadHandlerBuffer.New");
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
			string QPYX_o_YXQP = UnityEngine.Networking.DownloadHandlerBuffer.GetContent(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

