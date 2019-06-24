using System;
using LuaInterface;

public class QPYX_UnityEngine_RectWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Rect), null);
		L_YXQP.RegFunction("MinMaxRect", QPYX_MinMaxRect_YXQP);
		L_YXQP.RegFunction("Set", QPYX_Set_YXQP);
		L_YXQP.RegFunction("Contains", QPYX_Contains_YXQP);
		L_YXQP.RegFunction("Overlaps", QPYX_Overlaps_YXQP);
		L_YXQP.RegFunction("NormalizedToPoint", QPYX_NormalizedToPoint_YXQP);
		L_YXQP.RegFunction("PointToNormalized", QPYX_PointToNormalized_YXQP);
		L_YXQP.RegFunction("GetHashCode", QPYX_GetHashCode_YXQP);
		L_YXQP.RegFunction("Equals", QPYX_Equals_YXQP);
		L_YXQP.RegFunction("ToString", QPYX_ToString_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Rect_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("zero", QPYX_get_zero_YXQP, null);
		L_YXQP.RegVar("x", QPYX_get_x_YXQP, QPYX_set_x_YXQP);
		L_YXQP.RegVar("y", QPYX_get_y_YXQP, QPYX_set_y_YXQP);
		L_YXQP.RegVar("position", QPYX_get_position_YXQP, QPYX_set_position_YXQP);
		L_YXQP.RegVar("center", QPYX_get_center_YXQP, QPYX_set_center_YXQP);
		L_YXQP.RegVar("min", QPYX_get_min_YXQP, QPYX_set_min_YXQP);
		L_YXQP.RegVar("max", QPYX_get_max_YXQP, QPYX_set_max_YXQP);
		L_YXQP.RegVar("width", QPYX_get_width_YXQP, QPYX_set_width_YXQP);
		L_YXQP.RegVar("height", QPYX_get_height_YXQP, QPYX_set_height_YXQP);
		L_YXQP.RegVar("size", QPYX_get_size_YXQP, QPYX_set_size_YXQP);
		L_YXQP.RegVar("xMin", QPYX_get_xMin_YXQP, QPYX_set_xMin_YXQP);
		L_YXQP.RegVar("yMin", QPYX_get_yMin_YXQP, QPYX_set_yMin_YXQP);
		L_YXQP.RegVar("xMax", QPYX_get_xMax_YXQP, QPYX_set_xMax_YXQP);
		L_YXQP.RegVar("yMax", QPYX_get_yMax_YXQP, QPYX_set_yMax_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Rect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 1);
				UnityEngine.Rect QPYX_obj_YXQP = new UnityEngine.Rect(QPYX_arg0_YXQP);
				ToLua.PushValue(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.Rect QPYX_obj_YXQP = new UnityEngine.Rect(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushValue(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Rect QPYX_obj_YXQP = new UnityEngine.Rect(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushValue(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 0)			{
				UnityEngine.Rect QPYX_obj_YXQP = new UnityEngine.Rect();
				ToLua.PushValue(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Rect.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MinMaxRect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			UnityEngine.Rect QPYX_o_YXQP = UnityEngine.Rect.MinMaxRect(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Set_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
			QPYX_obj_YXQP.Set(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Contains_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 2))
			{
				UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Contains(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Vector2>(L_YXQP, 2))
			{
				UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Contains(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Contains(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Rect.Contains");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Overlaps_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
				UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Overlaps(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
				UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Overlaps(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Rect.Overlaps");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_NormalizedToPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 1);
			UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 2);
			UnityEngine.Vector2 QPYX_o_YXQP = UnityEngine.Rect.NormalizedToPoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PointToNormalized_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 1);
			UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 2);
			UnityEngine.Vector2 QPYX_o_YXQP = UnityEngine.Rect.PointToNormalized(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
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
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.To(L_YXQP, 1);
			UnityEngine.Rect QPYX_arg1_YXQP = StackTraits<UnityEngine.Rect>.To(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_arg0_YXQP == QPYX_arg1_YXQP;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetHashCode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetHashCode();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Equals_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.Equals(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);
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
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
				string QPYX_o_YXQP = QPYX_obj_YXQP.ToString();
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Rect  QPYX_obj_YXQP  = (UnityEngine.Rect)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Rect));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_o_YXQP = QPYX_obj_YXQP.ToString(QPYX_arg0_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Rect.ToString");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_zero_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushValue(L_YXQP, UnityEngine.Rect.zero);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_x_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.x;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index x on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_y_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.y;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index y on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_position_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.position;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index position on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_center_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.center;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index center on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_min_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.min;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index min on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_max_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.max;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index max on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_width_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.width;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index width on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_height_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.height;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_size_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.size;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index size on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_xMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.xMin;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index xMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_yMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.yMin;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index yMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_xMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.xMax;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index xMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_yMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.yMax;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index yMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_x_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.x = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index x on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_y_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.y = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index y on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_position_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.position = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index position on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_center_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.center = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index center on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_min_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.min = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index min on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_max_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.max = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index max on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_width_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.width = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index width on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_height_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.height = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_size_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.size = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index size on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_xMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.xMin = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index xMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_yMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.yMin = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index yMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_xMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.xMax = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index xMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_yMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Rect QPYX_obj_YXQP = (UnityEngine.Rect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.yMax = QPYX_arg0_YXQP;
			ToLua.SetBack(L_YXQP, 1, QPYX_obj_YXQP);			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index yMax on a nil value");
		}
	}
}

