using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_Dropdown_OptionDataWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Dropdown.OptionData), typeof(System.Object));
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_UI_Dropdown_OptionData_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("text", QPYX_get_text_YXQP, QPYX_set_text_YXQP);
		L_YXQP.RegVar("image", QPYX_get_image_YXQP, QPYX_set_image_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_UI_Dropdown_OptionData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = new UnityEngine.UI.Dropdown.OptionData();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.Sprite>(L_YXQP, 1))
			{
				UnityEngine.Sprite QPYX_arg0_YXQP = (UnityEngine.Sprite)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = new UnityEngine.UI.Dropdown.OptionData(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = new UnityEngine.UI.Dropdown.OptionData(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Sprite QPYX_arg1_YXQP = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Sprite));
				UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = new UnityEngine.UI.Dropdown.OptionData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.UI.Dropdown.OptionData.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_text_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = (UnityEngine.UI.Dropdown.OptionData)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.text;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index text on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_image_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = (UnityEngine.UI.Dropdown.OptionData)QPYX_o_YXQP;
			UnityEngine.Sprite QPYX_ret_YXQP = QPYX_obj_YXQP.image;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index image on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_text_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = (UnityEngine.UI.Dropdown.OptionData)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.text = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index text on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_image_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown.OptionData QPYX_obj_YXQP = (UnityEngine.UI.Dropdown.OptionData)QPYX_o_YXQP;
			UnityEngine.Sprite QPYX_arg0_YXQP = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Sprite));
			QPYX_obj_YXQP.image = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index image on a nil value");
		}
	}
}

