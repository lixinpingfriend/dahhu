using System;
using LuaInterface;

public class QPYX_SpriteHolderWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(SpriteHolder), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("FindSpriteByName", QPYX_FindSpriteByName_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("assetData", QPYX_get_assetData_YXQP, QPYX_set_assetData_YXQP);
		L_YXQP.RegVar("useAssetName", QPYX_get_useAssetName_YXQP, QPYX_set_useAssetName_YXQP);
		L_YXQP.RegVar("injections", QPYX_get_injections_YXQP, QPYX_set_injections_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindSpriteByName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			SpriteHolder  QPYX_obj_YXQP  = (SpriteHolder)ToLua.CheckObject<SpriteHolder>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.Sprite QPYX_o_YXQP = QPYX_obj_YXQP.FindSpriteByName(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
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
	static int QPYX_get_assetData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SpriteHolder QPYX_obj_YXQP = (SpriteHolder)QPYX_o_YXQP;
			CustomAssetHolder.AssetData QPYX_ret_YXQP = QPYX_obj_YXQP.assetData;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useAssetName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SpriteHolder QPYX_obj_YXQP = (SpriteHolder)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useAssetName;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useAssetName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_injections_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SpriteHolder QPYX_obj_YXQP = (SpriteHolder)QPYX_o_YXQP;
			System.Collections.Generic.List<SpriteHolder.Injection> QPYX_ret_YXQP = QPYX_obj_YXQP.injections;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index injections on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_assetData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SpriteHolder QPYX_obj_YXQP = (SpriteHolder)QPYX_o_YXQP;
			CustomAssetHolder.AssetData QPYX_arg0_YXQP = (CustomAssetHolder.AssetData)ToLua.CheckObject<CustomAssetHolder.AssetData>(L_YXQP, 2);
			QPYX_obj_YXQP.assetData = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useAssetName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SpriteHolder QPYX_obj_YXQP = (SpriteHolder)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useAssetName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useAssetName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_injections_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SpriteHolder QPYX_obj_YXQP = (SpriteHolder)QPYX_o_YXQP;
			System.Collections.Generic.List<SpriteHolder.Injection> QPYX_arg0_YXQP = (System.Collections.Generic.List<SpriteHolder.Injection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<SpriteHolder.Injection>));
			QPYX_obj_YXQP.injections = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index injections on a nil value");
		}
	}
}

