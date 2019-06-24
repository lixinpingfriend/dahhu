using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_GridLayoutGroupWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.GridLayoutGroup), typeof(UnityEngine.UI.LayoutGroup));
		L_YXQP.RegFunction("CalculateLayoutInputHorizontal", QPYX_CalculateLayoutInputHorizontal_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputVertical", QPYX_CalculateLayoutInputVertical_YXQP);
		L_YXQP.RegFunction("SetLayoutHorizontal", QPYX_SetLayoutHorizontal_YXQP);
		L_YXQP.RegFunction("SetLayoutVertical", QPYX_SetLayoutVertical_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("startCorner", QPYX_get_startCorner_YXQP, QPYX_set_startCorner_YXQP);
		L_YXQP.RegVar("startAxis", QPYX_get_startAxis_YXQP, QPYX_set_startAxis_YXQP);
		L_YXQP.RegVar("cellSize", QPYX_get_cellSize_YXQP, QPYX_set_cellSize_YXQP);
		L_YXQP.RegVar("spacing", QPYX_get_spacing_YXQP, QPYX_set_spacing_YXQP);
		L_YXQP.RegVar("constraint", QPYX_get_constraint_YXQP, QPYX_set_constraint_YXQP);
		L_YXQP.RegVar("constraintCount", QPYX_get_constraintCount_YXQP, QPYX_set_constraintCount_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateLayoutInputHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.GridLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.GridLayoutGroup)ToLua.CheckObject<UnityEngine.UI.GridLayoutGroup>(L_YXQP, 1);
			QPYX_obj_YXQP.CalculateLayoutInputHorizontal();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateLayoutInputVertical_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.GridLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.GridLayoutGroup)ToLua.CheckObject<UnityEngine.UI.GridLayoutGroup>(L_YXQP, 1);
			QPYX_obj_YXQP.CalculateLayoutInputVertical();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayoutHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.GridLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.GridLayoutGroup)ToLua.CheckObject<UnityEngine.UI.GridLayoutGroup>(L_YXQP, 1);
			QPYX_obj_YXQP.SetLayoutHorizontal();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayoutVertical_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.GridLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.GridLayoutGroup)ToLua.CheckObject<UnityEngine.UI.GridLayoutGroup>(L_YXQP, 1);
			QPYX_obj_YXQP.SetLayoutVertical();
			return 0;
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
	static int QPYX_get_startCorner_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.UI.GridLayoutGroup.Corner QPYX_ret_YXQP = QPYX_obj_YXQP.startCorner;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index startCorner on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_startAxis_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.UI.GridLayoutGroup.Axis QPYX_ret_YXQP = QPYX_obj_YXQP.startAxis;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index startAxis on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cellSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.cellSize;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cellSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spacing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.spacing;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_constraint_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.UI.GridLayoutGroup.Constraint QPYX_ret_YXQP = QPYX_obj_YXQP.constraint;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index constraint on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_constraintCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.constraintCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index constraintCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_startCorner_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.UI.GridLayoutGroup.Corner QPYX_arg0_YXQP = (UnityEngine.UI.GridLayoutGroup.Corner)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.GridLayoutGroup.Corner));
			QPYX_obj_YXQP.startCorner = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index startCorner on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_startAxis_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.UI.GridLayoutGroup.Axis QPYX_arg0_YXQP = (UnityEngine.UI.GridLayoutGroup.Axis)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.GridLayoutGroup.Axis));
			QPYX_obj_YXQP.startAxis = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index startAxis on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cellSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.cellSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cellSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spacing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.spacing = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_constraint_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			UnityEngine.UI.GridLayoutGroup.Constraint QPYX_arg0_YXQP = (UnityEngine.UI.GridLayoutGroup.Constraint)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.GridLayoutGroup.Constraint));
			QPYX_obj_YXQP.constraint = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index constraint on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_constraintCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.GridLayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.GridLayoutGroup)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.constraintCount = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index constraintCount on a nil value");
		}
	}
}

