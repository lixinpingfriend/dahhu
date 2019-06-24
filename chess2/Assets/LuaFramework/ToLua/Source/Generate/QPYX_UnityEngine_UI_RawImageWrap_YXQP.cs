using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_RawImageWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.RawImage), typeof(UnityEngine.UI.MaskableGraphic));
		L_YXQP.RegFunction("SetNativeSize", QPYX_SetNativeSize_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("mainTexture", QPYX_get_mainTexture_YXQP, null);
		L_YXQP.RegVar("texture", QPYX_get_texture_YXQP, QPYX_set_texture_YXQP);
		L_YXQP.RegVar("uvRect", QPYX_get_uvRect_YXQP, QPYX_set_uvRect_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetNativeSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.RawImage  QPYX_obj_YXQP  = (UnityEngine.UI.RawImage)ToLua.CheckObject<UnityEngine.UI.RawImage>(L_YXQP, 1);
			QPYX_obj_YXQP.SetNativeSize();
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
	static int QPYX_get_mainTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.RawImage QPYX_obj_YXQP = (UnityEngine.UI.RawImage)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_ret_YXQP = QPYX_obj_YXQP.mainTexture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_texture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.RawImage QPYX_obj_YXQP = (UnityEngine.UI.RawImage)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_ret_YXQP = QPYX_obj_YXQP.texture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index texture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uvRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.RawImage QPYX_obj_YXQP = (UnityEngine.UI.RawImage)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.uvRect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uvRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_texture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.RawImage QPYX_obj_YXQP = (UnityEngine.UI.RawImage)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_arg0_YXQP = (UnityEngine.Texture)ToLua.CheckObject<UnityEngine.Texture>(L_YXQP, 2);
			QPYX_obj_YXQP.texture = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index texture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_uvRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.RawImage QPYX_obj_YXQP = (UnityEngine.UI.RawImage)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.uvRect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uvRect on a nil value");
		}
	}
}

