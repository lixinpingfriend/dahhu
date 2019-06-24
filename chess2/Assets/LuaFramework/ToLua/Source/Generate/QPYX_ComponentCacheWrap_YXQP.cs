using System;
using LuaInterface;

public class QPYX_ComponentCacheWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(ComponentCache), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("SetCommonObject", QPYX_SetCommonObject_YXQP);
		L_YXQP.RegFunction("SetCommonObjectToLua", QPYX_SetCommonObjectToLua_YXQP);
		L_YXQP.RegFunction("SetCacheToLua", QPYX_SetCacheToLua_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("group", QPYX_get_group_YXQP, QPYX_set_group_YXQP);
		L_YXQP.RegVar("commonObjects", QPYX_get_commonObjects_YXQP, QPYX_set_commonObjects_YXQP);
		L_YXQP.RegVar("gameObjectList", QPYX_get_gameObjectList_YXQP, QPYX_set_gameObjectList_YXQP);
		L_YXQP.RegVar("transformList", QPYX_get_transformList_YXQP, QPYX_set_transformList_YXQP);
		L_YXQP.RegVar("rectTransformList", QPYX_get_rectTransformList_YXQP, QPYX_set_rectTransformList_YXQP);
		L_YXQP.RegVar("imageList", QPYX_get_imageList_YXQP, QPYX_set_imageList_YXQP);
		L_YXQP.RegVar("inputFieldList", QPYX_get_inputFieldList_YXQP, QPYX_set_inputFieldList_YXQP);
		L_YXQP.RegVar("textList", QPYX_get_textList_YXQP, QPYX_set_textList_YXQP);
		L_YXQP.RegVar("toggleList", QPYX_get_toggleList_YXQP, QPYX_set_toggleList_YXQP);
		L_YXQP.RegVar("toggleEventList", QPYX_get_toggleEventList_YXQP, QPYX_set_toggleEventList_YXQP);
		L_YXQP.RegVar("buttonList", QPYX_get_buttonList_YXQP, QPYX_set_buttonList_YXQP);
		L_YXQP.RegVar("sliderList", QPYX_get_sliderList_YXQP, QPYX_set_sliderList_YXQP);
		L_YXQP.RegVar("toggleGroupList", QPYX_get_toggleGroupList_YXQP, QPYX_set_toggleGroupList_YXQP);
		L_YXQP.RegVar("graphicList", QPYX_get_graphicList_YXQP, QPYX_set_graphicList_YXQP);
		L_YXQP.RegVar("scrollRectList", QPYX_get_scrollRectList_YXQP, QPYX_set_scrollRectList_YXQP);
		L_YXQP.RegVar("scrollbarList", QPYX_get_scrollbarList_YXQP, QPYX_set_scrollbarList_YXQP);
		L_YXQP.RegVar("dropdownList", QPYX_get_dropdownList_YXQP, QPYX_set_dropdownList_YXQP);
		L_YXQP.RegVar("gridLayoutGroupList", QPYX_get_gridLayoutGroupList_YXQP, QPYX_set_gridLayoutGroupList_YXQP);
		L_YXQP.RegVar("rawImageList", QPYX_get_rawImageList_YXQP, QPYX_set_rawImageList_YXQP);
		L_YXQP.RegVar("audioSourceList", QPYX_get_audioSourceList_YXQP, QPYX_set_audioSourceList_YXQP);
		L_YXQP.RegVar("tweenButtonScaleList", QPYX_get_tweenButtonScaleList_YXQP, QPYX_set_tweenButtonScaleList_YXQP);
		L_YXQP.RegVar("animationList", QPYX_get_animationList_YXQP, QPYX_set_animationList_YXQP);
		L_YXQP.RegVar("animatorList", QPYX_get_animatorList_YXQP, QPYX_set_animatorList_YXQP);
		L_YXQP.RegVar("spriteAtlasList", QPYX_get_spriteAtlasList_YXQP, QPYX_set_spriteAtlasList_YXQP);
		L_YXQP.RegVar("spriteHolderList", QPYX_get_spriteHolderList_YXQP, QPYX_set_spriteHolderList_YXQP);
		L_YXQP.RegVar("uiStateSwitcherList", QPYX_get_uiStateSwitcherList_YXQP, QPYX_set_uiStateSwitcherList_YXQP);
		L_YXQP.RegVar("textWrapList", QPYX_get_textWrapList_YXQP, QPYX_set_textWrapList_YXQP);
		L_YXQP.RegVar("uiImageAnimList", QPYX_get_uiImageAnimList_YXQP, QPYX_set_uiImageAnimList_YXQP);
		L_YXQP.RegVar("canvasList", QPYX_get_canvasList_YXQP, QPYX_set_canvasList_YXQP);
		L_YXQP.RegVar("particleSystemList", QPYX_get_particleSystemList_YXQP, QPYX_set_particleSystemList_YXQP);
		L_YXQP.RegVar("particleSystemRendererList", QPYX_get_particleSystemRendererList_YXQP, QPYX_set_particleSystemRendererList_YXQP);
		L_YXQP.RegVar("cacheList", QPYX_get_cacheList_YXQP, QPYX_set_cacheList_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCommonObject_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			ComponentCache  QPYX_obj_YXQP  = (ComponentCache)ToLua.CheckObject<ComponentCache>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 3);
			QPYX_obj_YXQP.SetCommonObject(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCommonObjectToLua_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			ComponentCache  QPYX_obj_YXQP  = (ComponentCache)ToLua.CheckObject<ComponentCache>(L_YXQP, 1);
			LuaTable QPYX_arg0_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);
			QPYX_obj_YXQP.SetCommonObjectToLua(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCacheToLua_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			ComponentCache  QPYX_obj_YXQP  = (ComponentCache)ToLua.CheckObject<ComponentCache>(L_YXQP, 1);
			LuaTable QPYX_arg0_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);
			QPYX_obj_YXQP.SetCacheToLua(QPYX_arg0_YXQP);
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
	static int QPYX_get_group_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.group;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index group on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_commonObjects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,UnityEngine.Object> QPYX_ret_YXQP = QPYX_obj_YXQP.commonObjects;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index commonObjects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gameObjectList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.GameObject_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.gameObjectList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameObjectList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_transformList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Transform_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.transformList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transformList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rectTransformList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.RectTransform_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.rectTransformList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rectTransformList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_imageList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Image_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.imageList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index imageList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_inputFieldList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.InputField_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.inputFieldList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inputFieldList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_textList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Text_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.textList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_toggleList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Toggle_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.toggleList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index toggleList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_toggleEventList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ToggleEvent_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.toggleEventList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index toggleEventList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_buttonList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Button_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.buttonList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index buttonList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sliderList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Slider_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.sliderList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sliderList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_toggleGroupList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ToggleGroup_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.toggleGroupList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index toggleGroupList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_graphicList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Graphic_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.graphicList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index graphicList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scrollRectList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ScrollRect_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.scrollRectList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scrollRectList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scrollbarList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Scrollbar_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.scrollbarList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scrollbarList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dropdownList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Dropdown_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.dropdownList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dropdownList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gridLayoutGroupList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.GridLayoutGroup_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.gridLayoutGroupList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gridLayoutGroupList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rawImageList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.RawImage_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.rawImageList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rawImageList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_audioSourceList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.AudioSource_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.audioSourceList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index audioSourceList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_tweenButtonScaleList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.TweenButton_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.tweenButtonScaleList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tweenButtonScaleList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_animationList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Animation_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.animationList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animationList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_animatorList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Animator_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.animatorList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animatorList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spriteAtlasList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.SpriteAtlas_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.spriteAtlasList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spriteAtlasList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spriteHolderList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.SpriteHolder_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.spriteHolderList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spriteHolderList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uiStateSwitcherList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.UIStateSwitcher_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.uiStateSwitcherList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uiStateSwitcherList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_textWrapList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.TextWrap_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.textWrapList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textWrapList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uiImageAnimList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.UIImageAnimation_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.uiImageAnimList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uiImageAnimList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_canvasList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Canvas_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.canvasList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canvasList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_particleSystemList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ParticleSystem_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.particleSystemList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index particleSystemList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_particleSystemRendererList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ParticleSystemRenderer_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.particleSystemRendererList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index particleSystemRendererList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cacheList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ComponentCache_Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.cacheList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cacheList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_group_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.group = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index group on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_commonObjects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,UnityEngine.Object> QPYX_arg0_YXQP = (System.Collections.Generic.Dictionary<string,UnityEngine.Object>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.Dictionary<string,UnityEngine.Object>));
			QPYX_obj_YXQP.commonObjects = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index commonObjects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_gameObjectList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.GameObject_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.GameObject_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.GameObject_Injection>));
			QPYX_obj_YXQP.gameObjectList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameObjectList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_transformList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Transform_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Transform_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Transform_Injection>));
			QPYX_obj_YXQP.transformList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transformList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rectTransformList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.RectTransform_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.RectTransform_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.RectTransform_Injection>));
			QPYX_obj_YXQP.rectTransformList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rectTransformList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_imageList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Image_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Image_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Image_Injection>));
			QPYX_obj_YXQP.imageList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index imageList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_inputFieldList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.InputField_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.InputField_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.InputField_Injection>));
			QPYX_obj_YXQP.inputFieldList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inputFieldList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_textList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Text_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Text_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Text_Injection>));
			QPYX_obj_YXQP.textList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_toggleList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Toggle_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Toggle_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Toggle_Injection>));
			QPYX_obj_YXQP.toggleList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index toggleList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_toggleEventList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ToggleEvent_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.ToggleEvent_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.ToggleEvent_Injection>));
			QPYX_obj_YXQP.toggleEventList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index toggleEventList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_buttonList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Button_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Button_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Button_Injection>));
			QPYX_obj_YXQP.buttonList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index buttonList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sliderList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Slider_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Slider_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Slider_Injection>));
			QPYX_obj_YXQP.sliderList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sliderList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_toggleGroupList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ToggleGroup_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.ToggleGroup_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.ToggleGroup_Injection>));
			QPYX_obj_YXQP.toggleGroupList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index toggleGroupList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_graphicList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Graphic_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Graphic_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Graphic_Injection>));
			QPYX_obj_YXQP.graphicList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index graphicList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_scrollRectList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ScrollRect_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.ScrollRect_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.ScrollRect_Injection>));
			QPYX_obj_YXQP.scrollRectList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scrollRectList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_scrollbarList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Scrollbar_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Scrollbar_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Scrollbar_Injection>));
			QPYX_obj_YXQP.scrollbarList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scrollbarList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_dropdownList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Dropdown_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Dropdown_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Dropdown_Injection>));
			QPYX_obj_YXQP.dropdownList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dropdownList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_gridLayoutGroupList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.GridLayoutGroup_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.GridLayoutGroup_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.GridLayoutGroup_Injection>));
			QPYX_obj_YXQP.gridLayoutGroupList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gridLayoutGroupList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rawImageList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.RawImage_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.RawImage_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.RawImage_Injection>));
			QPYX_obj_YXQP.rawImageList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rawImageList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_audioSourceList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.AudioSource_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.AudioSource_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.AudioSource_Injection>));
			QPYX_obj_YXQP.audioSourceList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index audioSourceList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_tweenButtonScaleList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.TweenButton_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.TweenButton_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.TweenButton_Injection>));
			QPYX_obj_YXQP.tweenButtonScaleList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tweenButtonScaleList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_animationList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Animation_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Animation_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Animation_Injection>));
			QPYX_obj_YXQP.animationList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animationList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_animatorList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Animator_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Animator_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Animator_Injection>));
			QPYX_obj_YXQP.animatorList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animatorList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spriteAtlasList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.SpriteAtlas_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.SpriteAtlas_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.SpriteAtlas_Injection>));
			QPYX_obj_YXQP.spriteAtlasList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spriteAtlasList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spriteHolderList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.SpriteHolder_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.SpriteHolder_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.SpriteHolder_Injection>));
			QPYX_obj_YXQP.spriteHolderList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spriteHolderList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_uiStateSwitcherList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.UIStateSwitcher_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.UIStateSwitcher_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.UIStateSwitcher_Injection>));
			QPYX_obj_YXQP.uiStateSwitcherList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uiStateSwitcherList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_textWrapList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.TextWrap_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.TextWrap_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.TextWrap_Injection>));
			QPYX_obj_YXQP.textWrapList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textWrapList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_uiImageAnimList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.UIImageAnimation_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.UIImageAnimation_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.UIImageAnimation_Injection>));
			QPYX_obj_YXQP.uiImageAnimList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uiImageAnimList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_canvasList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.Canvas_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.Canvas_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.Canvas_Injection>));
			QPYX_obj_YXQP.canvasList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canvasList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_particleSystemList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ParticleSystem_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.ParticleSystem_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.ParticleSystem_Injection>));
			QPYX_obj_YXQP.particleSystemList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index particleSystemList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_particleSystemRendererList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ParticleSystemRenderer_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.ParticleSystemRenderer_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.ParticleSystemRenderer_Injection>));
			QPYX_obj_YXQP.particleSystemRendererList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index particleSystemRendererList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cacheList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			ComponentCache QPYX_obj_YXQP = (ComponentCache)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache.ComponentCache_Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache.ComponentCache_Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache.ComponentCache_Injection>));
			QPYX_obj_YXQP.cacheList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cacheList on a nil value");
		}
	}
}

