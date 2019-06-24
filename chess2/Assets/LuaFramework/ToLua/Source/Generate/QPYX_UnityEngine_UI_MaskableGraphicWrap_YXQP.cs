using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_MaskableGraphicWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.MaskableGraphic), typeof(UnityEngine.UI.Graphic));
		L_YXQP.RegFunction("GetModifiedMaterial", QPYX_GetModifiedMaterial_YXQP);
		L_YXQP.RegFunction("Cull", QPYX_Cull_YXQP);
		L_YXQP.RegFunction("SetClipRect", QPYX_SetClipRect_YXQP);
		L_YXQP.RegFunction("RecalculateClipping", QPYX_RecalculateClipping_YXQP);
		L_YXQP.RegFunction("RecalculateMasking", QPYX_RecalculateMasking_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("onCullStateChanged", QPYX_get_onCullStateChanged_YXQP, QPYX_set_onCullStateChanged_YXQP);
		L_YXQP.RegVar("maskable", QPYX_get_maskable_YXQP, QPYX_set_maskable_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetModifiedMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.MaskableGraphic  QPYX_obj_YXQP  = (UnityEngine.UI.MaskableGraphic)ToLua.CheckObject<UnityEngine.UI.MaskableGraphic>(L_YXQP, 1);
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			UnityEngine.Material QPYX_o_YXQP = QPYX_obj_YXQP.GetModifiedMaterial(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Cull_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.MaskableGraphic  QPYX_obj_YXQP  = (UnityEngine.UI.MaskableGraphic)ToLua.CheckObject<UnityEngine.UI.MaskableGraphic>(L_YXQP, 1);
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			QPYX_obj_YXQP.Cull(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetClipRect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.MaskableGraphic  QPYX_obj_YXQP  = (UnityEngine.UI.MaskableGraphic)ToLua.CheckObject<UnityEngine.UI.MaskableGraphic>(L_YXQP, 1);
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			QPYX_obj_YXQP.SetClipRect(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RecalculateClipping_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.MaskableGraphic  QPYX_obj_YXQP  = (UnityEngine.UI.MaskableGraphic)ToLua.CheckObject<UnityEngine.UI.MaskableGraphic>(L_YXQP, 1);
			QPYX_obj_YXQP.RecalculateClipping();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RecalculateMasking_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.MaskableGraphic  QPYX_obj_YXQP  = (UnityEngine.UI.MaskableGraphic)ToLua.CheckObject<UnityEngine.UI.MaskableGraphic>(L_YXQP, 1);
			QPYX_obj_YXQP.RecalculateMasking();
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
	static int QPYX_get_onCullStateChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.MaskableGraphic QPYX_obj_YXQP = (UnityEngine.UI.MaskableGraphic)QPYX_o_YXQP;
			UnityEngine.UI.MaskableGraphic.CullStateChangedEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onCullStateChanged;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onCullStateChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maskable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.MaskableGraphic QPYX_obj_YXQP = (UnityEngine.UI.MaskableGraphic)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.maskable;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maskable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onCullStateChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.MaskableGraphic QPYX_obj_YXQP = (UnityEngine.UI.MaskableGraphic)QPYX_o_YXQP;
			UnityEngine.UI.MaskableGraphic.CullStateChangedEvent QPYX_arg0_YXQP = (UnityEngine.UI.MaskableGraphic.CullStateChangedEvent)ToLua.CheckObject<UnityEngine.UI.MaskableGraphic.CullStateChangedEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onCullStateChanged = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onCullStateChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maskable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.MaskableGraphic QPYX_obj_YXQP = (UnityEngine.UI.MaskableGraphic)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.maskable = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maskable on a nil value");
		}
	}
}

