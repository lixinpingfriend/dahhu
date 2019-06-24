using System;
using LuaInterface;

public class QPYX_UnityEngine_PolygonCollider2DWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.PolygonCollider2D), typeof(UnityEngine.Collider2D));
		L_YXQP.RegFunction("GetPath", QPYX_GetPath_YXQP);
		L_YXQP.RegFunction("SetPath", QPYX_SetPath_YXQP);
		L_YXQP.RegFunction("CreatePrimitive", QPYX_CreatePrimitive_YXQP);
		L_YXQP.RegFunction("GetTotalPointCount", QPYX_GetTotalPointCount_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_PolygonCollider2D_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("points", QPYX_get_points_YXQP, QPYX_set_points_YXQP);
		L_YXQP.RegVar("pathCount", QPYX_get_pathCount_YXQP, QPYX_set_pathCount_YXQP);
		L_YXQP.RegVar("autoTiling", QPYX_get_autoTiling_YXQP, QPYX_set_autoTiling_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_PolygonCollider2D_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.PolygonCollider2D QPYX_obj_YXQP = new UnityEngine.PolygonCollider2D();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.PolygonCollider2D.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.PolygonCollider2D  QPYX_obj_YXQP  = (UnityEngine.PolygonCollider2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.PolygonCollider2D));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Vector2[] QPYX_o_YXQP = QPYX_obj_YXQP.GetPath(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.PolygonCollider2D  QPYX_obj_YXQP  = (UnityEngine.PolygonCollider2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.PolygonCollider2D));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Vector2[] QPYX_arg1_YXQP = ToLua.CheckStructArray<UnityEngine.Vector2>(L_YXQP, 3);
			QPYX_obj_YXQP.SetPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CreatePrimitive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.PolygonCollider2D  QPYX_obj_YXQP  = (UnityEngine.PolygonCollider2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.PolygonCollider2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				QPYX_obj_YXQP.CreatePrimitive(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.PolygonCollider2D  QPYX_obj_YXQP  = (UnityEngine.PolygonCollider2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.PolygonCollider2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 3);
				QPYX_obj_YXQP.CreatePrimitive(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.PolygonCollider2D  QPYX_obj_YXQP  = (UnityEngine.PolygonCollider2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.PolygonCollider2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 3);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 4);
				QPYX_obj_YXQP.CreatePrimitive(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.PolygonCollider2D.CreatePrimitive");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTotalPointCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.PolygonCollider2D  QPYX_obj_YXQP  = (UnityEngine.PolygonCollider2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.PolygonCollider2D));
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetTotalPointCount();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
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
	static int QPYX_get_points_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.PolygonCollider2D QPYX_obj_YXQP = (UnityEngine.PolygonCollider2D)QPYX_o_YXQP;
			UnityEngine.Vector2[] QPYX_ret_YXQP = QPYX_obj_YXQP.points;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index points on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pathCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.PolygonCollider2D QPYX_obj_YXQP = (UnityEngine.PolygonCollider2D)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pathCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoTiling_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.PolygonCollider2D QPYX_obj_YXQP = (UnityEngine.PolygonCollider2D)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.autoTiling;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoTiling on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_points_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.PolygonCollider2D QPYX_obj_YXQP = (UnityEngine.PolygonCollider2D)QPYX_o_YXQP;
			UnityEngine.Vector2[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector2>(L_YXQP, 2);
			QPYX_obj_YXQP.points = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index points on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pathCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.PolygonCollider2D QPYX_obj_YXQP = (UnityEngine.PolygonCollider2D)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.pathCount = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoTiling_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.PolygonCollider2D QPYX_obj_YXQP = (UnityEngine.PolygonCollider2D)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.autoTiling = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoTiling on a nil value");
		}
	}
}

