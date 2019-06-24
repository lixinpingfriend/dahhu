using System;
using LuaInterface;

public class QPYX_UnityEngine_CanvasWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Canvas), typeof(UnityEngine.Behaviour));
		L_YXQP.RegFunction("GetDefaultCanvasMaterial", QPYX_GetDefaultCanvasMaterial_YXQP);
		L_YXQP.RegFunction("GetETC1SupportedCanvasMaterial", QPYX_GetETC1SupportedCanvasMaterial_YXQP);
		L_YXQP.RegFunction("ForceUpdateCanvases", QPYX_ForceUpdateCanvases_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Canvas_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("renderMode", QPYX_get_renderMode_YXQP, QPYX_set_renderMode_YXQP);
		L_YXQP.RegVar("isRootCanvas", QPYX_get_isRootCanvas_YXQP, null);
		L_YXQP.RegVar("worldCamera", QPYX_get_worldCamera_YXQP, QPYX_set_worldCamera_YXQP);
		L_YXQP.RegVar("pixelRect", QPYX_get_pixelRect_YXQP, null);
		L_YXQP.RegVar("scaleFactor", QPYX_get_scaleFactor_YXQP, QPYX_set_scaleFactor_YXQP);
		L_YXQP.RegVar("referencePixelsPerUnit", QPYX_get_referencePixelsPerUnit_YXQP, QPYX_set_referencePixelsPerUnit_YXQP);
		L_YXQP.RegVar("overridePixelPerfect", QPYX_get_overridePixelPerfect_YXQP, QPYX_set_overridePixelPerfect_YXQP);
		L_YXQP.RegVar("pixelPerfect", QPYX_get_pixelPerfect_YXQP, QPYX_set_pixelPerfect_YXQP);
		L_YXQP.RegVar("planeDistance", QPYX_get_planeDistance_YXQP, QPYX_set_planeDistance_YXQP);
		L_YXQP.RegVar("renderOrder", QPYX_get_renderOrder_YXQP, null);
		L_YXQP.RegVar("overrideSorting", QPYX_get_overrideSorting_YXQP, QPYX_set_overrideSorting_YXQP);
		L_YXQP.RegVar("sortingOrder", QPYX_get_sortingOrder_YXQP, QPYX_set_sortingOrder_YXQP);
		L_YXQP.RegVar("targetDisplay", QPYX_get_targetDisplay_YXQP, QPYX_set_targetDisplay_YXQP);
		L_YXQP.RegVar("normalizedSortingGridSize", QPYX_get_normalizedSortingGridSize_YXQP, QPYX_set_normalizedSortingGridSize_YXQP);
		L_YXQP.RegVar("sortingLayerID", QPYX_get_sortingLayerID_YXQP, QPYX_set_sortingLayerID_YXQP);
		L_YXQP.RegVar("cachedSortingLayerValue", QPYX_get_cachedSortingLayerValue_YXQP, null);
		L_YXQP.RegVar("additionalShaderChannels", QPYX_get_additionalShaderChannels_YXQP, QPYX_set_additionalShaderChannels_YXQP);
		L_YXQP.RegVar("sortingLayerName", QPYX_get_sortingLayerName_YXQP, QPYX_set_sortingLayerName_YXQP);
		L_YXQP.RegVar("rootCanvas", QPYX_get_rootCanvas_YXQP, null);
		L_YXQP.RegVar("willRenderCanvases", QPYX_get_willRenderCanvases_YXQP, QPYX_set_willRenderCanvases_YXQP);
		L_YXQP.RegFunction("WillRenderCanvases", QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Canvas_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Canvas QPYX_obj_YXQP = new UnityEngine.Canvas();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Canvas.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDefaultCanvasMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Material QPYX_o_YXQP = UnityEngine.Canvas.GetDefaultCanvasMaterial();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetETC1SupportedCanvasMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Material QPYX_o_YXQP = UnityEngine.Canvas.GetETC1SupportedCanvasMaterial();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ForceUpdateCanvases_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Canvas.ForceUpdateCanvases();
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
	static int QPYX_get_renderMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.RenderMode QPYX_ret_YXQP = QPYX_obj_YXQP.renderMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isRootCanvas_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isRootCanvas;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isRootCanvas on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_worldCamera_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.Camera QPYX_ret_YXQP = QPYX_obj_YXQP.worldCamera;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index worldCamera on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.pixelRect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scaleFactor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.scaleFactor;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scaleFactor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_referencePixelsPerUnit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.referencePixelsPerUnit;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index referencePixelsPerUnit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_overridePixelPerfect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.overridePixelPerfect;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index overridePixelPerfect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelPerfect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.pixelPerfect;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelPerfect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_planeDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.planeDistance;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index planeDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_renderOrder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.renderOrder;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderOrder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_overrideSorting_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.overrideSorting;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index overrideSorting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortingOrder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.sortingOrder;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingOrder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetDisplay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.targetDisplay;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetDisplay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_normalizedSortingGridSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.normalizedSortingGridSize;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalizedSortingGridSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortingLayerID_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.sortingLayerID;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cachedSortingLayerValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.cachedSortingLayerValue;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cachedSortingLayerValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_additionalShaderChannels_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.AdditionalCanvasShaderChannels QPYX_ret_YXQP = QPYX_obj_YXQP.additionalShaderChannels;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index additionalShaderChannels on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortingLayerName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.sortingLayerName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rootCanvas_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.Canvas QPYX_ret_YXQP = QPYX_obj_YXQP.rootCanvas;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rootCanvas on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_willRenderCanvases_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(UnityEngine.Canvas.WillRenderCanvases)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_renderMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.RenderMode QPYX_arg0_YXQP = (UnityEngine.RenderMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RenderMode));
			QPYX_obj_YXQP.renderMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_worldCamera_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.Camera QPYX_arg0_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.worldCamera = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index worldCamera on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_scaleFactor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.scaleFactor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scaleFactor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_referencePixelsPerUnit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.referencePixelsPerUnit = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index referencePixelsPerUnit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_overridePixelPerfect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.overridePixelPerfect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index overridePixelPerfect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pixelPerfect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.pixelPerfect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelPerfect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_planeDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.planeDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index planeDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_overrideSorting_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.overrideSorting = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index overrideSorting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortingOrder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.sortingOrder = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingOrder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_targetDisplay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.targetDisplay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetDisplay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_normalizedSortingGridSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.normalizedSortingGridSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalizedSortingGridSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortingLayerID_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.sortingLayerID = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_additionalShaderChannels_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			UnityEngine.AdditionalCanvasShaderChannels QPYX_arg0_YXQP = (UnityEngine.AdditionalCanvasShaderChannels)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AdditionalCanvasShaderChannels));
			QPYX_obj_YXQP.additionalShaderChannels = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index additionalShaderChannels on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortingLayerName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Canvas QPYX_obj_YXQP = (UnityEngine.Canvas)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.sortingLayerName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_willRenderCanvases_YXQP(IntPtr L_YXQP)
	{
		try
		{
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'UnityEngine.Canvas.willRenderCanvases' can only appear on the left hand side of += or -= when used outside of the type 'UnityEngine.Canvas'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				UnityEngine.Canvas.WillRenderCanvases QPYX_ev_YXQP = (UnityEngine.Canvas.WillRenderCanvases)QPYX_arg0_YXQP.func;
				UnityEngine.Canvas.willRenderCanvases += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				UnityEngine.Canvas.WillRenderCanvases QPYX_ev_YXQP = (UnityEngine.Canvas.WillRenderCanvases)QPYX_arg0_YXQP.func;
				UnityEngine.Canvas.willRenderCanvases -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Canvas.WillRenderCanvases>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Canvas.WillRenderCanvases>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

