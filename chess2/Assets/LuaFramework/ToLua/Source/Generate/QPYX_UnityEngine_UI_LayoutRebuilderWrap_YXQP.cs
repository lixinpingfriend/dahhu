using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_LayoutRebuilderWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.LayoutRebuilder), typeof(System.Object));
		L_YXQP.RegFunction("IsDestroyed", QPYX_IsDestroyed_YXQP);
		L_YXQP.RegFunction("ForceRebuildLayoutImmediate", QPYX_ForceRebuildLayoutImmediate_YXQP);
		L_YXQP.RegFunction("Rebuild", QPYX_Rebuild_YXQP);
		L_YXQP.RegFunction("MarkLayoutForRebuild", QPYX_MarkLayoutForRebuild_YXQP);
		L_YXQP.RegFunction("LayoutComplete", QPYX_LayoutComplete_YXQP);
		L_YXQP.RegFunction("GraphicUpdateComplete", QPYX_GraphicUpdateComplete_YXQP);
		L_YXQP.RegFunction("GetHashCode", QPYX_GetHashCode_YXQP);
		L_YXQP.RegFunction("Equals", QPYX_Equals_YXQP);
		L_YXQP.RegFunction("ToString", QPYX_ToString_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_UI_LayoutRebuilder_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("transform", QPYX_get_transform_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_UI_LayoutRebuilder_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.UI.LayoutRebuilder QPYX_obj_YXQP = new UnityEngine.UI.LayoutRebuilder();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.UI.LayoutRebuilder.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsDestroyed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.LayoutRebuilder  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutRebuilder)ToLua.CheckObject<UnityEngine.UI.LayoutRebuilder>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsDestroyed();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ForceRebuildLayoutImmediate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RectTransform QPYX_arg0_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
			UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Rebuild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.LayoutRebuilder  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutRebuilder)ToLua.CheckObject<UnityEngine.UI.LayoutRebuilder>(L_YXQP, 1);
			UnityEngine.UI.CanvasUpdate QPYX_arg0_YXQP = (UnityEngine.UI.CanvasUpdate)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.CanvasUpdate));
			QPYX_obj_YXQP.Rebuild(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MarkLayoutForRebuild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RectTransform QPYX_arg0_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
			UnityEngine.UI.LayoutRebuilder.MarkLayoutForRebuild(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LayoutComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.LayoutRebuilder  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutRebuilder)ToLua.CheckObject<UnityEngine.UI.LayoutRebuilder>(L_YXQP, 1);
			QPYX_obj_YXQP.LayoutComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GraphicUpdateComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.LayoutRebuilder  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutRebuilder)ToLua.CheckObject<UnityEngine.UI.LayoutRebuilder>(L_YXQP, 1);
			QPYX_obj_YXQP.GraphicUpdateComplete();
			return 0;
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
			UnityEngine.UI.LayoutRebuilder  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutRebuilder)ToLua.CheckObject<UnityEngine.UI.LayoutRebuilder>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetHashCode();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
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
			UnityEngine.UI.LayoutRebuilder  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutRebuilder)ToLua.CheckObject<UnityEngine.UI.LayoutRebuilder>(L_YXQP, 1);
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP != null ? QPYX_obj_YXQP.Equals(QPYX_arg0_YXQP) : QPYX_arg0_YXQP == null;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
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
			UnityEngine.UI.LayoutRebuilder  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutRebuilder)ToLua.CheckObject<UnityEngine.UI.LayoutRebuilder>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.ToString();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_transform_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutRebuilder QPYX_obj_YXQP = (UnityEngine.UI.LayoutRebuilder)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.transform;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transform on a nil value");
		}
	}
}

