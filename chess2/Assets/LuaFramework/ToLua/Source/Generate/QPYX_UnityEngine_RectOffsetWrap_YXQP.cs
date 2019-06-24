using System;
using LuaInterface;

public class QPYX_UnityEngine_RectOffsetWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.RectOffset), typeof(System.Object));
		L_YXQP.RegFunction("Add", QPYX_Add_YXQP);
		L_YXQP.RegFunction("Remove", QPYX_Remove_YXQP);
		L_YXQP.RegFunction("ToString", QPYX_ToString_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_RectOffset_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("left", QPYX_get_left_YXQP, QPYX_set_left_YXQP);
		L_YXQP.RegVar("right", QPYX_get_right_YXQP, QPYX_set_right_YXQP);
		L_YXQP.RegVar("top", QPYX_get_top_YXQP, QPYX_set_top_YXQP);
		L_YXQP.RegVar("bottom", QPYX_get_bottom_YXQP, QPYX_set_bottom_YXQP);
		L_YXQP.RegVar("horizontal", QPYX_get_horizontal_YXQP, null);
		L_YXQP.RegVar("vertical", QPYX_get_vertical_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_RectOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.RectOffset QPYX_obj_YXQP = new UnityEngine.RectOffset();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.RectOffset QPYX_obj_YXQP = new UnityEngine.RectOffset(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.RectOffset.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Add_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.RectOffset  QPYX_obj_YXQP  = (UnityEngine.RectOffset)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectOffset));
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			UnityEngine.Rect QPYX_o_YXQP = QPYX_obj_YXQP.Add(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Remove_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.RectOffset  QPYX_obj_YXQP  = (UnityEngine.RectOffset)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectOffset));
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			UnityEngine.Rect QPYX_o_YXQP = QPYX_obj_YXQP.Remove(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToString_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RectOffset  QPYX_obj_YXQP  = (UnityEngine.RectOffset)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectOffset));
			string QPYX_o_YXQP = QPYX_obj_YXQP.ToString();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_left_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.left;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index left on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_right_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.right;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index right on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_top_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.top;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index top on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bottom_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.bottom;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bottom on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_horizontal_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.horizontal;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontal on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_vertical_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.vertical;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index vertical on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_left_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.left = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index left on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_right_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.right = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index right on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_top_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.top = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index top on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bottom_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectOffset QPYX_obj_YXQP = (UnityEngine.RectOffset)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.bottom = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bottom on a nil value");
		}
	}
}

