using System;
using LuaInterface;

public class QPYX_TransformUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("TransformUtil");
		L_YXQP.RegFunction("SetX", QPYX_SetX_YXQP);
		L_YXQP.RegFunction("SetY", QPYX_SetY_YXQP);
		L_YXQP.RegFunction("SetZ", QPYX_SetZ_YXQP);
		L_YXQP.RegFunction("AddX", QPYX_AddX_YXQP);
		L_YXQP.RegFunction("AddY", QPYX_AddY_YXQP);
		L_YXQP.RegFunction("AddZ", QPYX_AddZ_YXQP);
		L_YXQP.RegFunction("SetAnchoredPositionX", QPYX_SetAnchoredPositionX_YXQP);
		L_YXQP.RegFunction("SetAnchoredPositionY", QPYX_SetAnchoredPositionY_YXQP);
		L_YXQP.RegFunction("SetAnchoredPosition", QPYX_SetAnchoredPosition_YXQP);
		L_YXQP.RegFunction("SetSizeDeltaX", QPYX_SetSizeDeltaX_YXQP);
		L_YXQP.RegFunction("SetSizeDeltaY", QPYX_SetSizeDeltaY_YXQP);
		L_YXQP.RegFunction("SetSizeDelta", QPYX_SetSizeDelta_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetX_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				TransformUtil.SetX(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				TransformUtil.SetX(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: TransformUtil.SetX");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetY_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				TransformUtil.SetY(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				TransformUtil.SetY(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: TransformUtil.SetY");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetZ_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				TransformUtil.SetZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				TransformUtil.SetZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: TransformUtil.SetZ");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddX_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				TransformUtil.AddX(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				TransformUtil.AddX(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: TransformUtil.AddX");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddY_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				TransformUtil.AddY(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				TransformUtil.AddY(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: TransformUtil.AddY");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddZ_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				TransformUtil.AddZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				TransformUtil.AddZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: TransformUtil.AddZ");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAnchoredPositionX_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			TransformUtil.SetAnchoredPositionX(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAnchoredPositionY_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			TransformUtil.SetAnchoredPositionY(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAnchoredPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			TransformUtil.SetAnchoredPosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSizeDeltaX_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			TransformUtil.SetSizeDeltaX(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSizeDeltaY_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			TransformUtil.SetSizeDeltaY(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSizeDelta_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			TransformUtil.SetSizeDelta(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

