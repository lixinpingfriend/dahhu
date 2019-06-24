using System;
using LuaInterface;

public class QPYX_DG_Tweening_Core_TweenerCore_UnityEngine_Quaternion_UnityEngine_Vector3_DG_Tweening_Plugins_Options_PathOptionsWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>), typeof(DG.Tweening.Tweener), "TweenerCore_UnityEngine_Quaternion_UnityEngine_Vector3_DG_Tweening_Plugins_Options_PathOptions");
		L_YXQP.RegFunction("ChangeStartValue", QPYX_ChangeStartValue_YXQP);
		L_YXQP.RegFunction("ChangeEndValue", QPYX_ChangeEndValue_YXQP);
		L_YXQP.RegFunction("ChangeValues", QPYX_ChangeValues_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("startValue", QPYX_get_startValue_YXQP, QPYX_set_startValue_YXQP);
		L_YXQP.RegVar("endValue", QPYX_get_endValue_YXQP, QPYX_set_endValue_YXQP);
		L_YXQP.RegVar("changeValue", QPYX_get_changeValue_YXQP, QPYX_set_changeValue_YXQP);
		L_YXQP.RegVar("plugOptions", QPYX_get_plugOptions_YXQP, QPYX_set_plugOptions_YXQP);
		L_YXQP.RegVar("getter", QPYX_get_getter_YXQP, QPYX_set_getter_YXQP);
		L_YXQP.RegVar("setter", QPYX_get_setter_YXQP, QPYX_set_setter_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ChangeStartValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeStartValue(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeStartValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>.ChangeStartValue");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ChangeEndValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<bool>(L_YXQP, 3))
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>.ChangeEndValue");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ChangeValues_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeValues(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>  QPYX_obj_YXQP  = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)ToLua.CheckObject<DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeValues(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>.ChangeValues");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_startValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.startValue;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index startValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.endValue;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_changeValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.changeValue;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index changeValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_plugOptions_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			DG.Tweening.Plugins.Options.PathOptions QPYX_ret_YXQP = QPYX_obj_YXQP.plugOptions;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index plugOptions on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_getter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> QPYX_ret_YXQP = QPYX_obj_YXQP.getter;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index getter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_setter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> QPYX_ret_YXQP = QPYX_obj_YXQP.setter;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index setter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_startValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.startValue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index startValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.endValue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_changeValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.changeValue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index changeValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_plugOptions_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			DG.Tweening.Plugins.Options.PathOptions QPYX_arg0_YXQP = StackTraits<DG.Tweening.Plugins.Options.PathOptions>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.plugOptions = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index plugOptions on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_getter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>>(L_YXQP, 2);
			QPYX_obj_YXQP.getter = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index getter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_setter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions> QPYX_obj_YXQP = (DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.PathOptions>)QPYX_o_YXQP;
			DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> QPYX_arg0_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>>(L_YXQP, 2);
			QPYX_obj_YXQP.setter = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index setter on a nil value");
		}
	}
}

