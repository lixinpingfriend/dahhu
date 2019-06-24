using System;
using LuaInterface;

public class QPYX_UnityEngine_AudioClipWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.AudioClip), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("LoadAudioData", QPYX_LoadAudioData_YXQP);
		L_YXQP.RegFunction("UnloadAudioData", QPYX_UnloadAudioData_YXQP);
		L_YXQP.RegFunction("GetData", QPYX_GetData_YXQP);
		L_YXQP.RegFunction("SetData", QPYX_SetData_YXQP);
		L_YXQP.RegFunction("Create", QPYX_Create_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_AudioClip_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("length", QPYX_get_length_YXQP, null);
		L_YXQP.RegVar("samples", QPYX_get_samples_YXQP, null);
		L_YXQP.RegVar("channels", QPYX_get_channels_YXQP, null);
		L_YXQP.RegVar("frequency", QPYX_get_frequency_YXQP, null);
		L_YXQP.RegVar("loadType", QPYX_get_loadType_YXQP, null);
		L_YXQP.RegVar("preloadAudioData", QPYX_get_preloadAudioData_YXQP, null);
		L_YXQP.RegVar("ambisonic", QPYX_get_ambisonic_YXQP, null);
		L_YXQP.RegVar("loadState", QPYX_get_loadState_YXQP, null);
		L_YXQP.RegVar("loadInBackground", QPYX_get_loadInBackground_YXQP, null);
		L_YXQP.RegFunction("PCMReaderCallback", QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP);
		L_YXQP.RegFunction("PCMSetPositionCallback", QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_AudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.AudioClip QPYX_obj_YXQP = new UnityEngine.AudioClip();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.AudioClip.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAudioData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AudioClip  QPYX_obj_YXQP  = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
			bool QPYX_o_YXQP = QPYX_obj_YXQP.LoadAudioData();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnloadAudioData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AudioClip  QPYX_obj_YXQP  = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
			bool QPYX_o_YXQP = QPYX_obj_YXQP.UnloadAudioData();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioClip  QPYX_obj_YXQP  = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
			float[] QPYX_arg0_YXQP = ToLua.CheckNumberArray<float>(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.GetData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioClip  QPYX_obj_YXQP  = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
			float[] QPYX_arg0_YXQP = ToLua.CheckNumberArray<float>(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.SetData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Create_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 5)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				UnityEngine.AudioClip QPYX_o_YXQP = UnityEngine.AudioClip.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				UnityEngine.AudioClip.PCMReaderCallback QPYX_arg5_YXQP = (UnityEngine.AudioClip.PCMReaderCallback)ToLua.CheckDelegate<UnityEngine.AudioClip.PCMReaderCallback>(L_YXQP, 6);
				UnityEngine.AudioClip QPYX_o_YXQP = UnityEngine.AudioClip.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				UnityEngine.AudioClip.PCMReaderCallback QPYX_arg5_YXQP = (UnityEngine.AudioClip.PCMReaderCallback)ToLua.CheckDelegate<UnityEngine.AudioClip.PCMReaderCallback>(L_YXQP, 6);
				UnityEngine.AudioClip.PCMSetPositionCallback QPYX_arg6_YXQP = (UnityEngine.AudioClip.PCMSetPositionCallback)ToLua.CheckDelegate<UnityEngine.AudioClip.PCMSetPositionCallback>(L_YXQP, 7);
				UnityEngine.AudioClip QPYX_o_YXQP = UnityEngine.AudioClip.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioClip.Create");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_op_Equality_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
			UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_arg0_YXQP == QPYX_arg1_YXQP;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_length_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.length;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index length on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_samples_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.samples;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index samples on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_channels_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.channels;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index channels on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_frequency_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.frequency;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index frequency on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loadType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			UnityEngine.AudioClipLoadType QPYX_ret_YXQP = QPYX_obj_YXQP.loadType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loadType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_preloadAudioData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.preloadAudioData;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index preloadAudioData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ambisonic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.ambisonic;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ambisonic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loadState_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			UnityEngine.AudioDataLoadState QPYX_ret_YXQP = QPYX_obj_YXQP.loadState;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loadState on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loadInBackground_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioClip QPYX_obj_YXQP = (UnityEngine.AudioClip)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.loadInBackground;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loadInBackground on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMReaderCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMReaderCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMSetPositionCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMSetPositionCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

