using System;
using LuaInterface;

public class QPYX_UnityEngine_MicrophoneWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Microphone), typeof(System.Object));
		L_YXQP.RegFunction("Start", QPYX_Start_YXQP);
		L_YXQP.RegFunction("End", QPYX_End_YXQP);
		L_YXQP.RegFunction("IsRecording", QPYX_IsRecording_YXQP);
		L_YXQP.RegFunction("GetPosition", QPYX_GetPosition_YXQP);
		L_YXQP.RegFunction("GetDeviceCaps", QPYX_GetDeviceCaps_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Microphone_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("devices", QPYX_get_devices_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Microphone_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Microphone QPYX_obj_YXQP = new UnityEngine.Microphone();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Microphone.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Start_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			UnityEngine.AudioClip QPYX_o_YXQP = UnityEngine.Microphone.Start(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_End_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.Microphone.End(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsRecording_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Microphone.IsRecording(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			int QPYX_o_YXQP = UnityEngine.Microphone.GetPosition(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDeviceCaps_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			int QPYX_arg1_YXQP;
			int QPYX_arg2_YXQP;
			UnityEngine.Microphone.GetDeviceCaps(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, out QPYX_arg2_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_arg2_YXQP);
			return 2;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_devices_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Microphone.devices);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

