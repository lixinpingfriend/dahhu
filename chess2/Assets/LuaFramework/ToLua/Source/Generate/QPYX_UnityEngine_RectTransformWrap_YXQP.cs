using System;
using LuaInterface;

public class QPYX_UnityEngine_RectTransformWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.RectTransform), typeof(UnityEngine.Transform));
		L_YXQP.RegFunction("GetLocalCorners", QPYX_GetLocalCorners_YXQP);
		L_YXQP.RegFunction("GetWorldCorners", QPYX_GetWorldCorners_YXQP);
		L_YXQP.RegFunction("SetInsetAndSizeFromParentEdge", QPYX_SetInsetAndSizeFromParentEdge_YXQP);
		L_YXQP.RegFunction("SetSizeWithCurrentAnchors", QPYX_SetSizeWithCurrentAnchors_YXQP);
		L_YXQP.RegFunction("ForceUpdateRectTransforms", QPYX_ForceUpdateRectTransforms_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_RectTransform_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("rect", QPYX_get_rect_YXQP, null);
		L_YXQP.RegVar("anchorMin", QPYX_get_anchorMin_YXQP, QPYX_set_anchorMin_YXQP);
		L_YXQP.RegVar("anchorMax", QPYX_get_anchorMax_YXQP, QPYX_set_anchorMax_YXQP);
		L_YXQP.RegVar("anchoredPosition3D", QPYX_get_anchoredPosition3D_YXQP, QPYX_set_anchoredPosition3D_YXQP);
		L_YXQP.RegVar("anchoredPosition", QPYX_get_anchoredPosition_YXQP, QPYX_set_anchoredPosition_YXQP);
		L_YXQP.RegVar("sizeDelta", QPYX_get_sizeDelta_YXQP, QPYX_set_sizeDelta_YXQP);
		L_YXQP.RegVar("pivot", QPYX_get_pivot_YXQP, QPYX_set_pivot_YXQP);
		L_YXQP.RegVar("offsetMin", QPYX_get_offsetMin_YXQP, QPYX_set_offsetMin_YXQP);
		L_YXQP.RegVar("offsetMax", QPYX_get_offsetMax_YXQP, QPYX_set_offsetMax_YXQP);
		L_YXQP.RegVar("reapplyDrivenProperties", QPYX_get_reapplyDrivenProperties_YXQP, QPYX_set_reapplyDrivenProperties_YXQP);
		L_YXQP.RegFunction("ReapplyDrivenProperties", QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_RectTransform_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.RectTransform QPYX_obj_YXQP = new UnityEngine.RectTransform();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.RectTransform.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetLocalCorners_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
            if (QPYX_count_YXQP == 1)
            {
                UnityEngine.RectTransform obj = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
                UnityEngine.Vector3[] QPYX_arg0_YXQP = new UnityEngine.Vector3[4];
                obj.GetLocalCorners(QPYX_arg0_YXQP);
                ToLua.Push(L_YXQP, QPYX_arg0_YXQP);
                return 1;
            }
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.RectTransform  QPYX_obj_YXQP  = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				QPYX_obj_YXQP.GetLocalCorners(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.RectTransform.GetLocalCorners");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetWorldCorners_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
            if (QPYX_count_YXQP == 1)
            {
                UnityEngine.RectTransform obj = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
                UnityEngine.Vector3[] QPYX_arg0_YXQP = new UnityEngine.Vector3[4];
                obj.GetWorldCorners(QPYX_arg0_YXQP);
                ToLua.Push(L_YXQP, QPYX_arg0_YXQP);
                return 1;
            }
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.RectTransform  QPYX_obj_YXQP  = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				QPYX_obj_YXQP.GetWorldCorners(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.RectTransform.GetWorldCorners");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetInsetAndSizeFromParentEdge_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.RectTransform  QPYX_obj_YXQP  = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
			UnityEngine.RectTransform.Edge QPYX_arg0_YXQP = (UnityEngine.RectTransform.Edge)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform.Edge));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			QPYX_obj_YXQP.SetInsetAndSizeFromParentEdge(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSizeWithCurrentAnchors_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.RectTransform  QPYX_obj_YXQP  = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
			UnityEngine.RectTransform.Axis QPYX_arg0_YXQP = (UnityEngine.RectTransform.Axis)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform.Axis));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetSizeWithCurrentAnchors(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ForceUpdateRectTransforms_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RectTransform  QPYX_obj_YXQP  = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.RectTransform));
			QPYX_obj_YXQP.ForceUpdateRectTransforms();
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
	static int QPYX_get_rect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.rect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anchorMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.anchorMin;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchorMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anchorMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.anchorMax;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchorMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anchoredPosition3D_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.anchoredPosition3D;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchoredPosition3D on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anchoredPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.anchoredPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchoredPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sizeDelta_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.sizeDelta;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sizeDelta on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pivot_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.pivot;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pivot on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_offsetMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.offsetMin;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index offsetMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_offsetMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.offsetMax;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index offsetMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_reapplyDrivenProperties_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(UnityEngine.RectTransform.ReapplyDrivenProperties)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_anchorMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.anchorMin = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchorMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_anchorMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.anchorMax = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchorMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_anchoredPosition3D_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.anchoredPosition3D = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchoredPosition3D on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_anchoredPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.anchoredPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anchoredPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sizeDelta_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.sizeDelta = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sizeDelta on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pivot_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.pivot = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pivot on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_offsetMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.offsetMin = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index offsetMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_offsetMax_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RectTransform QPYX_obj_YXQP = (UnityEngine.RectTransform)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.offsetMax = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index offsetMax on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_reapplyDrivenProperties_YXQP(IntPtr L_YXQP)
	{
		try
		{
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'UnityEngine.RectTransform.reapplyDrivenProperties' can only appear on the left hand side of += or -= when used outside of the type 'UnityEngine.RectTransform'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				UnityEngine.RectTransform.ReapplyDrivenProperties QPYX_ev_YXQP = (UnityEngine.RectTransform.ReapplyDrivenProperties)QPYX_arg0_YXQP.func;
				UnityEngine.RectTransform.reapplyDrivenProperties += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				UnityEngine.RectTransform.ReapplyDrivenProperties QPYX_ev_YXQP = (UnityEngine.RectTransform.ReapplyDrivenProperties)QPYX_arg0_YXQP.func;
				UnityEngine.RectTransform.reapplyDrivenProperties -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.RectTransform.ReapplyDrivenProperties>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.RectTransform.ReapplyDrivenProperties>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

