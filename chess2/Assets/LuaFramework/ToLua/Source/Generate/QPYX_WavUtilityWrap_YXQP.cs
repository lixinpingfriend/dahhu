using System;
using LuaInterface;

public class QPYX_WavUtilityWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(WavUtility), typeof(System.Object));
		L_YXQP.RegFunction("ToAudioClip", QPYX_ToAudioClip_YXQP);
		L_YXQP.RegFunction("FromAudioClip", QPYX_FromAudioClip_YXQP);
		L_YXQP.RegFunction("BitDepth", QPYX_BitDepth_YXQP);
		L_YXQP.RegFunction("CustomToAudioClip", QPYX_CustomToAudioClip_YXQP);
		L_YXQP.RegFunction("CustomFromAudioClip", QPYX_CustomFromAudioClip_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateWavUtility_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateWavUtility_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				WavUtility QPYX_obj_YXQP = new WavUtility();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: WavUtility.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToAudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<byte[]>(L_YXQP, 1))
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				UnityEngine.AudioClip QPYX_o_YXQP = WavUtility.ToAudioClip(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				UnityEngine.AudioClip QPYX_o_YXQP = WavUtility.ToAudioClip(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AudioClip QPYX_o_YXQP = WavUtility.ToAudioClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				UnityEngine.AudioClip QPYX_o_YXQP = WavUtility.ToAudioClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WavUtility.ToAudioClip");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FromAudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
				byte[] QPYX_o_YXQP = WavUtility.FromAudioClip(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
				string QPYX_arg1_YXQP = null;
				byte[] QPYX_o_YXQP = WavUtility.FromAudioClip(QPYX_arg0_YXQP, out QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_arg1_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
				string QPYX_arg1_YXQP = null;
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				byte[] QPYX_o_YXQP = WavUtility.FromAudioClip(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_arg1_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
				string QPYX_arg1_YXQP = null;
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg3_YXQP = ToLua.CheckString(L_YXQP, 4);
				byte[] QPYX_o_YXQP = WavUtility.FromAudioClip(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_arg1_YXQP);
				return 2;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WavUtility.FromAudioClip");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BitDepth_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
			ushort QPYX_o_YXQP = WavUtility.BitDepth(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CustomToAudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.AudioClip QPYX_o_YXQP = WavUtility.CustomToAudioClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CustomFromAudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			byte[] QPYX_o_YXQP = WavUtility.CustomFromAudioClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

