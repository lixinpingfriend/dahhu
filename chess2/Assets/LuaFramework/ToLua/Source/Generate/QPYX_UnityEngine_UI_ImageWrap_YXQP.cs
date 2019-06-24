using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_UnityEngine_UI_ImageWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Image), typeof(UnityEngine.UI.MaskableGraphic));
		L_YXQP.RegFunction("OnBeforeSerialize", QPYX_OnBeforeSerialize_YXQP);
		L_YXQP.RegFunction("OnAfterDeserialize", QPYX_OnAfterDeserialize_YXQP);
		L_YXQP.RegFunction("SetNativeSize", QPYX_SetNativeSize_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputHorizontal", QPYX_CalculateLayoutInputHorizontal_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputVertical", QPYX_CalculateLayoutInputVertical_YXQP);
		L_YXQP.RegFunction("IsRaycastLocationValid", QPYX_IsRaycastLocationValid_YXQP);
		L_YXQP.RegFunction("DOBlendableColor", QPYX_DOBlendableColor_YXQP);
		L_YXQP.RegFunction("DOGradientColor", QPYX_DOGradientColor_YXQP);
		L_YXQP.RegFunction("DOFillAmount", QPYX_DOFillAmount_YXQP);
		L_YXQP.RegFunction("DOFade", QPYX_DOFade_YXQP);
		L_YXQP.RegFunction("DOColor", QPYX_DOColor_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("sprite", QPYX_get_sprite_YXQP, QPYX_set_sprite_YXQP);
		L_YXQP.RegVar("overrideSprite", QPYX_get_overrideSprite_YXQP, QPYX_set_overrideSprite_YXQP);
		L_YXQP.RegVar("type", QPYX_get_type_YXQP, QPYX_set_type_YXQP);
		L_YXQP.RegVar("preserveAspect", QPYX_get_preserveAspect_YXQP, QPYX_set_preserveAspect_YXQP);
		L_YXQP.RegVar("fillCenter", QPYX_get_fillCenter_YXQP, QPYX_set_fillCenter_YXQP);
		L_YXQP.RegVar("fillMethod", QPYX_get_fillMethod_YXQP, QPYX_set_fillMethod_YXQP);
		L_YXQP.RegVar("fillAmount", QPYX_get_fillAmount_YXQP, QPYX_set_fillAmount_YXQP);
		L_YXQP.RegVar("fillClockwise", QPYX_get_fillClockwise_YXQP, QPYX_set_fillClockwise_YXQP);
		L_YXQP.RegVar("fillOrigin", QPYX_get_fillOrigin_YXQP, QPYX_set_fillOrigin_YXQP);
		L_YXQP.RegVar("alphaHitTestMinimumThreshold", QPYX_get_alphaHitTestMinimumThreshold_YXQP, QPYX_set_alphaHitTestMinimumThreshold_YXQP);
		L_YXQP.RegVar("defaultETC1GraphicMaterial", QPYX_get_defaultETC1GraphicMaterial_YXQP, null);
		L_YXQP.RegVar("mainTexture", QPYX_get_mainTexture_YXQP, null);
		L_YXQP.RegVar("hasBorder", QPYX_get_hasBorder_YXQP, null);
		L_YXQP.RegVar("pixelsPerUnit", QPYX_get_pixelsPerUnit_YXQP, null);
		L_YXQP.RegVar("material", QPYX_get_material_YXQP, QPYX_set_material_YXQP);
		L_YXQP.RegVar("minWidth", QPYX_get_minWidth_YXQP, null);
		L_YXQP.RegVar("preferredWidth", QPYX_get_preferredWidth_YXQP, null);
		L_YXQP.RegVar("flexibleWidth", QPYX_get_flexibleWidth_YXQP, null);
		L_YXQP.RegVar("minHeight", QPYX_get_minHeight_YXQP, null);
		L_YXQP.RegVar("preferredHeight", QPYX_get_preferredHeight_YXQP, null);
		L_YXQP.RegVar("flexibleHeight", QPYX_get_flexibleHeight_YXQP, null);
		L_YXQP.RegVar("layoutPriority", QPYX_get_layoutPriority_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnBeforeSerialize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			QPYX_obj_YXQP.OnBeforeSerialize();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnAfterDeserialize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			QPYX_obj_YXQP.OnAfterDeserialize();
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
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			QPYX_obj_YXQP.SetNativeSize();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateLayoutInputHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
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
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			QPYX_obj_YXQP.CalculateLayoutInputVertical();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsRaycastLocationValid_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			UnityEngine.Camera QPYX_arg1_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.Camera));
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsRaycastLocationValid(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOBlendableColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.UI.Graphic, UnityEngine.Color, float>(L_YXQP, 1))
			{
				UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.UI.Image, UnityEngine.Color, float>(L_YXQP, 1))
			{
				UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.UI.Image.DOBlendableColor");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOGradientColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			UnityEngine.Gradient QPYX_arg0_YXQP = (UnityEngine.Gradient)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Gradient));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.DOGradientColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFillAmount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.Image  QPYX_obj_YXQP  = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOFillAmount(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFade_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.UI.Graphic, float, float>(L_YXQP, 1))
			{
				UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)ToLua.ToObject(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.UI.Image, float, float>(L_YXQP, 1))
			{
				UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)ToLua.ToObject(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.UI.Image.DOFade");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.UI.Graphic, UnityEngine.Color, float>(L_YXQP, 1))
			{
				UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.UI.Image, UnityEngine.Color, float>(L_YXQP, 1))
			{
				UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.UI.Image.DOColor");
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
	static int QPYX_get_sprite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.Sprite QPYX_ret_YXQP = QPYX_obj_YXQP.sprite;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sprite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_overrideSprite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.Sprite QPYX_ret_YXQP = QPYX_obj_YXQP.overrideSprite;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index overrideSprite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_type_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.UI.Image.Type QPYX_ret_YXQP = QPYX_obj_YXQP.type;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index type on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_preserveAspect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.preserveAspect;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index preserveAspect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fillCenter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.fillCenter;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillCenter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fillMethod_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.UI.Image.FillMethod QPYX_ret_YXQP = QPYX_obj_YXQP.fillMethod;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillMethod on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fillAmount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.fillAmount;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillAmount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fillClockwise_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.fillClockwise;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillClockwise on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fillOrigin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.fillOrigin;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillOrigin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_alphaHitTestMinimumThreshold_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.alphaHitTestMinimumThreshold;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index alphaHitTestMinimumThreshold on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultETC1GraphicMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.UI.Image.defaultETC1GraphicMaterial);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mainTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_ret_YXQP = QPYX_obj_YXQP.mainTexture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasBorder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasBorder;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasBorder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelsPerUnit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.pixelsPerUnit;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelsPerUnit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.Material QPYX_ret_YXQP = QPYX_obj_YXQP.material;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.minWidth;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_preferredWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.preferredWidth;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index preferredWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_flexibleWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.flexibleWidth;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index flexibleWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.minHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_preferredHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.preferredHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index preferredHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_flexibleHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.flexibleHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index flexibleHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_layoutPriority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.layoutPriority;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layoutPriority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sprite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.Sprite QPYX_arg0_YXQP = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Sprite));
			QPYX_obj_YXQP.sprite = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sprite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_overrideSprite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.Sprite QPYX_arg0_YXQP = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Sprite));
			QPYX_obj_YXQP.overrideSprite = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index overrideSprite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_type_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.UI.Image.Type QPYX_arg0_YXQP = (UnityEngine.UI.Image.Type)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.Image.Type));
			QPYX_obj_YXQP.type = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index type on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_preserveAspect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.preserveAspect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index preserveAspect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fillCenter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.fillCenter = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillCenter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fillMethod_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.UI.Image.FillMethod QPYX_arg0_YXQP = (UnityEngine.UI.Image.FillMethod)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.Image.FillMethod));
			QPYX_obj_YXQP.fillMethod = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillMethod on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fillAmount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.fillAmount = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillAmount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fillClockwise_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.fillClockwise = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillClockwise on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fillOrigin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.fillOrigin = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillOrigin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_alphaHitTestMinimumThreshold_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.alphaHitTestMinimumThreshold = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index alphaHitTestMinimumThreshold on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Image QPYX_obj_YXQP = (UnityEngine.UI.Image)QPYX_o_YXQP;
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.material = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}
}

