using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_ShadowWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Shadow), typeof(UnityEngine.UI.BaseMeshEffect));
		L_YXQP.RegFunction("ModifyMesh", QPYX_ModifyMesh_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("effectColor", QPYX_get_effectColor_YXQP, QPYX_set_effectColor_YXQP);
		L_YXQP.RegVar("effectDistance", QPYX_get_effectDistance_YXQP, QPYX_set_effectDistance_YXQP);
		L_YXQP.RegVar("useGraphicAlpha", QPYX_get_useGraphicAlpha_YXQP, QPYX_set_useGraphicAlpha_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ModifyMesh_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Mesh>(L_YXQP, 2))
			{
				UnityEngine.UI.Shadow  QPYX_obj_YXQP  = (UnityEngine.UI.Shadow)ToLua.CheckObject<UnityEngine.UI.Shadow>(L_YXQP, 1);
				UnityEngine.Mesh QPYX_arg0_YXQP = (UnityEngine.Mesh)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.ModifyMesh(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.UI.VertexHelper>(L_YXQP, 2))
			{
				UnityEngine.UI.Shadow  QPYX_obj_YXQP  = (UnityEngine.UI.Shadow)ToLua.CheckObject<UnityEngine.UI.Shadow>(L_YXQP, 1);
				UnityEngine.UI.VertexHelper QPYX_arg0_YXQP = (UnityEngine.UI.VertexHelper)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.ModifyMesh(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.UI.Shadow.ModifyMesh");
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
	static int QPYX_get_effectColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Shadow QPYX_obj_YXQP = (UnityEngine.UI.Shadow)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.effectColor;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index effectColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_effectDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Shadow QPYX_obj_YXQP = (UnityEngine.UI.Shadow)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.effectDistance;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index effectDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useGraphicAlpha_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Shadow QPYX_obj_YXQP = (UnityEngine.UI.Shadow)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useGraphicAlpha;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useGraphicAlpha on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_effectColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Shadow QPYX_obj_YXQP = (UnityEngine.UI.Shadow)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.effectColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index effectColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_effectDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Shadow QPYX_obj_YXQP = (UnityEngine.UI.Shadow)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.effectDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index effectDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useGraphicAlpha_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Shadow QPYX_obj_YXQP = (UnityEngine.UI.Shadow)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useGraphicAlpha = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useGraphicAlpha on a nil value");
		}
	}
}

