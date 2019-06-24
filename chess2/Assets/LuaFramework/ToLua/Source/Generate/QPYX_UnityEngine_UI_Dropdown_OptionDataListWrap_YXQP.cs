using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_Dropdown_OptionDataListWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Dropdown.OptionDataList), typeof(System.Object));
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_UI_Dropdown_OptionDataList_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("options", QPYX_get_options_YXQP, QPYX_set_options_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_UI_Dropdown_OptionDataList_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.UI.Dropdown.OptionDataList QPYX_obj_YXQP = new UnityEngine.UI.Dropdown.OptionDataList();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.UI.Dropdown.OptionDataList.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_options_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown.OptionDataList QPYX_obj_YXQP = (UnityEngine.UI.Dropdown.OptionDataList)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData> QPYX_ret_YXQP = QPYX_obj_YXQP.options;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index options on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_options_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown.OptionDataList QPYX_obj_YXQP = (UnityEngine.UI.Dropdown.OptionDataList)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData>));
			QPYX_obj_YXQP.options = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index options on a nil value");
		}
	}
}

