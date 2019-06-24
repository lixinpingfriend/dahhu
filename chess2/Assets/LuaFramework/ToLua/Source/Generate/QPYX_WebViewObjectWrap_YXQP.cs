using System;
using LuaInterface;

public class QPYX_WebViewObjectWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(WebViewObject), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("Init", QPYX_Init_YXQP);
		L_YXQP.RegFunction("SetCenterPositionWithScale", QPYX_SetCenterPositionWithScale_YXQP);
		L_YXQP.RegFunction("SetMargins", QPYX_SetMargins_YXQP);
		L_YXQP.RegFunction("SetVisibility", QPYX_SetVisibility_YXQP);
		L_YXQP.RegFunction("GetVisibility", QPYX_GetVisibility_YXQP);
		L_YXQP.RegFunction("LoadURL", QPYX_LoadURL_YXQP);
		L_YXQP.RegFunction("LoadHTML", QPYX_LoadHTML_YXQP);
		L_YXQP.RegFunction("EvaluateJS", QPYX_EvaluateJS_YXQP);
		L_YXQP.RegFunction("Progress", QPYX_Progress_YXQP);
		L_YXQP.RegFunction("CanGoBack", QPYX_CanGoBack_YXQP);
		L_YXQP.RegFunction("CanGoForward", QPYX_CanGoForward_YXQP);
		L_YXQP.RegFunction("GoBack", QPYX_GoBack_YXQP);
		L_YXQP.RegFunction("GoForward", QPYX_GoForward_YXQP);
		L_YXQP.RegFunction("CallOnError", QPYX_CallOnError_YXQP);
		L_YXQP.RegFunction("CallOnHttpError", QPYX_CallOnHttpError_YXQP);
		L_YXQP.RegFunction("CallOnStarted", QPYX_CallOnStarted_YXQP);
		L_YXQP.RegFunction("CallOnLoaded", QPYX_CallOnLoaded_YXQP);
		L_YXQP.RegFunction("CallFromJS", QPYX_CallFromJS_YXQP);
		L_YXQP.RegFunction("AddCustomHeader", QPYX_AddCustomHeader_YXQP);
		L_YXQP.RegFunction("GetCustomHeaderValue", QPYX_GetCustomHeaderValue_YXQP);
		L_YXQP.RegFunction("RemoveCustomHeader", QPYX_RemoveCustomHeader_YXQP);
		L_YXQP.RegFunction("ClearCustomHeader", QPYX_ClearCustomHeader_YXQP);
		L_YXQP.RegFunction("ClearCookies", QPYX_ClearCookies_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("IsKeyboardVisible", QPYX_get_IsKeyboardVisible_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Init_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				QPYX_obj_YXQP.Init();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				System.Action<string> QPYX_arg3_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 5);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				System.Action<string> QPYX_arg3_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 5);
				System.Action<string> QPYX_arg4_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 6);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 7)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				System.Action<string> QPYX_arg3_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 5);
				System.Action<string> QPYX_arg4_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 6);
				System.Action<string> QPYX_arg5_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 7);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 8)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				System.Action<string> QPYX_arg3_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 5);
				System.Action<string> QPYX_arg4_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 6);
				System.Action<string> QPYX_arg5_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 7);
				bool QPYX_arg6_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 8);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 9)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				System.Action<string> QPYX_arg3_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 5);
				System.Action<string> QPYX_arg4_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 6);
				System.Action<string> QPYX_arg5_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 7);
				bool QPYX_arg6_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 8);
				System.Action<string> QPYX_arg7_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 9);
				QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WebViewObject.Init");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCenterPositionWithScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 3);
			QPYX_obj_YXQP.SetCenterPositionWithScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMargins_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				UnityEngine.Camera QPYX_arg0_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera));
				UnityEngine.GameObject QPYX_arg1_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.GameObject));
				UnityEngine.GameObject QPYX_arg2_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.GameObject));
				QPYX_obj_YXQP.SetMargins(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				QPYX_obj_YXQP.SetMargins(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WebViewObject.SetMargins");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetVisibility_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.SetVisibility(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetVisibility_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.GetVisibility();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadURL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.LoadURL(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadHTML_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.LoadHTML(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EvaluateJS_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.EvaluateJS(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Progress_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.Progress();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CanGoBack_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.CanGoBack();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CanGoForward_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.CanGoForward();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GoBack_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			QPYX_obj_YXQP.GoBack();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GoForward_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			QPYX_obj_YXQP.GoForward();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CallOnError_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.CallOnError(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CallOnHttpError_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.CallOnHttpError(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CallOnStarted_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.CallOnStarted(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CallOnLoaded_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.CallOnLoaded(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CallFromJS_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.CallFromJS(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddCustomHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.AddCustomHeader(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCustomHeaderValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetCustomHeaderValue(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveCustomHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.RemoveCustomHeader(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearCustomHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			QPYX_obj_YXQP.ClearCustomHeader();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearCookies_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			WebViewObject  QPYX_obj_YXQP  = (WebViewObject)ToLua.CheckObject<WebViewObject>(L_YXQP, 1);
			QPYX_obj_YXQP.ClearCookies();
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
	static int QPYX_get_IsKeyboardVisible_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WebViewObject QPYX_obj_YXQP = (WebViewObject)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsKeyboardVisible;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsKeyboardVisible on a nil value");
		}
	}
}

