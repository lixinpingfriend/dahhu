using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_GraphicWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Graphic), typeof(UnityEngine.EventSystems.UIBehaviour));
		L_YXQP.RegFunction("SetAllDirty", QPYX_SetAllDirty_YXQP);
		L_YXQP.RegFunction("SetLayoutDirty", QPYX_SetLayoutDirty_YXQP);
		L_YXQP.RegFunction("SetVerticesDirty", QPYX_SetVerticesDirty_YXQP);
		L_YXQP.RegFunction("SetMaterialDirty", QPYX_SetMaterialDirty_YXQP);
		L_YXQP.RegFunction("OnCullingChanged", QPYX_OnCullingChanged_YXQP);
		L_YXQP.RegFunction("Rebuild", QPYX_Rebuild_YXQP);
		L_YXQP.RegFunction("LayoutComplete", QPYX_LayoutComplete_YXQP);
		L_YXQP.RegFunction("GraphicUpdateComplete", QPYX_GraphicUpdateComplete_YXQP);
		L_YXQP.RegFunction("SetNativeSize", QPYX_SetNativeSize_YXQP);
		L_YXQP.RegFunction("Raycast", QPYX_Raycast_YXQP);
		L_YXQP.RegFunction("PixelAdjustPoint", QPYX_PixelAdjustPoint_YXQP);
		L_YXQP.RegFunction("GetPixelAdjustedRect", QPYX_GetPixelAdjustedRect_YXQP);
		L_YXQP.RegFunction("CrossFadeColor", QPYX_CrossFadeColor_YXQP);
		L_YXQP.RegFunction("CrossFadeAlpha", QPYX_CrossFadeAlpha_YXQP);
		L_YXQP.RegFunction("RegisterDirtyLayoutCallback", QPYX_RegisterDirtyLayoutCallback_YXQP);
		L_YXQP.RegFunction("UnregisterDirtyLayoutCallback", QPYX_UnregisterDirtyLayoutCallback_YXQP);
		L_YXQP.RegFunction("RegisterDirtyVerticesCallback", QPYX_RegisterDirtyVerticesCallback_YXQP);
		L_YXQP.RegFunction("UnregisterDirtyVerticesCallback", QPYX_UnregisterDirtyVerticesCallback_YXQP);
		L_YXQP.RegFunction("RegisterDirtyMaterialCallback", QPYX_RegisterDirtyMaterialCallback_YXQP);
		L_YXQP.RegFunction("UnregisterDirtyMaterialCallback", QPYX_UnregisterDirtyMaterialCallback_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("defaultGraphicMaterial", QPYX_get_defaultGraphicMaterial_YXQP, null);
		L_YXQP.RegVar("color", QPYX_get_color_YXQP, QPYX_set_color_YXQP);
		L_YXQP.RegVar("raycastTarget", QPYX_get_raycastTarget_YXQP, QPYX_set_raycastTarget_YXQP);
		L_YXQP.RegVar("depth", QPYX_get_depth_YXQP, null);
		L_YXQP.RegVar("rectTransform", QPYX_get_rectTransform_YXQP, null);
		L_YXQP.RegVar("canvas", QPYX_get_canvas_YXQP, null);
		L_YXQP.RegVar("canvasRenderer", QPYX_get_canvasRenderer_YXQP, null);
		L_YXQP.RegVar("defaultMaterial", QPYX_get_defaultMaterial_YXQP, null);
		L_YXQP.RegVar("material", QPYX_get_material_YXQP, QPYX_set_material_YXQP);
		L_YXQP.RegVar("materialForRendering", QPYX_get_materialForRendering_YXQP, null);
		L_YXQP.RegVar("mainTexture", QPYX_get_mainTexture_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAllDirty_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			QPYX_obj_YXQP.SetAllDirty();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayoutDirty_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			QPYX_obj_YXQP.SetLayoutDirty();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetVerticesDirty_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			QPYX_obj_YXQP.SetVerticesDirty();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMaterialDirty_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			QPYX_obj_YXQP.SetMaterialDirty();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnCullingChanged_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
//			QPYX_obj_YXQP.OnCullingChanged();
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
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.UI.CanvasUpdate QPYX_arg0_YXQP = (UnityEngine.UI.CanvasUpdate)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.CanvasUpdate));
			QPYX_obj_YXQP.Rebuild(QPYX_arg0_YXQP);
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
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
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
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			QPYX_obj_YXQP.GraphicUpdateComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetNativeSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			QPYX_obj_YXQP.SetNativeSize();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Raycast_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			UnityEngine.Camera QPYX_arg1_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.Camera));
			bool QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PixelAdjustPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			UnityEngine.Vector2 QPYX_o_YXQP = QPYX_obj_YXQP.PixelAdjustPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPixelAdjustedRect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Rect QPYX_o_YXQP = QPYX_obj_YXQP.GetPixelAdjustedRect();
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CrossFadeColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 5)
			{
				UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
				UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				QPYX_obj_YXQP.CrossFadeColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
				UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 6);
				QPYX_obj_YXQP.CrossFadeColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.UI.Graphic.CrossFadeColor");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CrossFadeAlpha_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
			QPYX_obj_YXQP.CrossFadeAlpha(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RegisterDirtyLayoutCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Events.UnityAction QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction)ToLua.CheckDelegate<UnityEngine.Events.UnityAction>(L_YXQP, 2);
			QPYX_obj_YXQP.RegisterDirtyLayoutCallback(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnregisterDirtyLayoutCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Events.UnityAction QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction)ToLua.CheckDelegate<UnityEngine.Events.UnityAction>(L_YXQP, 2);
			QPYX_obj_YXQP.UnregisterDirtyLayoutCallback(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RegisterDirtyVerticesCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Events.UnityAction QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction)ToLua.CheckDelegate<UnityEngine.Events.UnityAction>(L_YXQP, 2);
			QPYX_obj_YXQP.RegisterDirtyVerticesCallback(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnregisterDirtyVerticesCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Events.UnityAction QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction)ToLua.CheckDelegate<UnityEngine.Events.UnityAction>(L_YXQP, 2);
			QPYX_obj_YXQP.UnregisterDirtyVerticesCallback(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RegisterDirtyMaterialCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Events.UnityAction QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction)ToLua.CheckDelegate<UnityEngine.Events.UnityAction>(L_YXQP, 2);
			QPYX_obj_YXQP.RegisterDirtyMaterialCallback(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnregisterDirtyMaterialCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Graphic  QPYX_obj_YXQP  = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 1);
			UnityEngine.Events.UnityAction QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction)ToLua.CheckDelegate<UnityEngine.Events.UnityAction>(L_YXQP, 2);
			QPYX_obj_YXQP.UnregisterDirtyMaterialCallback(QPYX_arg0_YXQP);
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
	static int QPYX_get_defaultGraphicMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.UI.Graphic.defaultGraphicMaterial);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_color_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.color;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index color on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_raycastTarget_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.raycastTarget;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index raycastTarget on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_depth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.depth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rectTransform_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_ret_YXQP = QPYX_obj_YXQP.rectTransform;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rectTransform on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_canvas_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Canvas QPYX_ret_YXQP = QPYX_obj_YXQP.canvas;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canvas on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_canvasRenderer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.CanvasRenderer QPYX_ret_YXQP = QPYX_obj_YXQP.canvasRenderer;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canvasRenderer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Material QPYX_ret_YXQP = QPYX_obj_YXQP.defaultMaterial;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index defaultMaterial on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Material QPYX_ret_YXQP = QPYX_obj_YXQP.material;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_materialForRendering_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Material QPYX_ret_YXQP = QPYX_obj_YXQP.materialForRendering;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index materialForRendering on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mainTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_ret_YXQP = QPYX_obj_YXQP.mainTexture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_color_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.color = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index color on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_raycastTarget_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.raycastTarget = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index raycastTarget on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Graphic QPYX_obj_YXQP = (UnityEngine.UI.Graphic)QPYX_o_YXQP;
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.material = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}
}

