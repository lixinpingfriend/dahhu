using System;
using LuaInterface;

public class QPYX_UniWebViewExWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UniWebViewEx), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("Init", QPYX_Init_YXQP);
		L_YXQP.RegFunction("SetBackgroundColor", QPYX_SetBackgroundColor_YXQP);
		L_YXQP.RegFunction("SetUserAgent", QPYX_SetUserAgent_YXQP);
		L_YXQP.RegFunction("LoadHTMLString", QPYX_LoadHTMLString_YXQP);
		L_YXQP.RegFunction("EvaluatingJavaScript", QPYX_EvaluatingJavaScript_YXQP);
		L_YXQP.RegFunction("AddJavaScript", QPYX_AddJavaScript_YXQP);
		L_YXQP.RegFunction("CleanCache", QPYX_CleanCache_YXQP);
		L_YXQP.RegFunction("SetCookie", QPYX_SetCookie_YXQP);
		L_YXQP.RegFunction("GetCookie", QPYX_GetCookie_YXQP);
		L_YXQP.RegFunction("AddPermissionRequestTrustSite", QPYX_AddPermissionRequestTrustSite_YXQP);
		L_YXQP.RegFunction("AddUrlScheme", QPYX_AddUrlScheme_YXQP);
		L_YXQP.RegFunction("RemoveUrlScheme", QPYX_RemoveUrlScheme_YXQP);
		L_YXQP.RegFunction("SetHeaderField", QPYX_SetHeaderField_YXQP);
		L_YXQP.RegFunction("SetVerticalScrollBarShow", QPYX_SetVerticalScrollBarShow_YXQP);
		L_YXQP.RegFunction("SetHorizontalScrollBarShow", QPYX_SetHorizontalScrollBarShow_YXQP);
		L_YXQP.RegFunction("SetAllowInlinePlay", QPYX_SetAllowInlinePlay_YXQP);
		L_YXQP.RegFunction("SetAllowAutoPlay", QPYX_SetAllowAutoPlay_YXQP);
		L_YXQP.RegFunction("Stop", QPYX_Stop_YXQP);
		L_YXQP.RegFunction("Reload", QPYX_Reload_YXQP);
		L_YXQP.RegFunction("CanGoBack", QPYX_CanGoBack_YXQP);
		L_YXQP.RegFunction("CanGoForward", QPYX_CanGoForward_YXQP);
		L_YXQP.RegFunction("GoBack", QPYX_GoBack_YXQP);
		L_YXQP.RegFunction("GoForward", QPYX_GoForward_YXQP);
		L_YXQP.RegFunction("Load", QPYX_Load_YXQP);
		L_YXQP.RegFunction("Show", QPYX_Show_YXQP);
		L_YXQP.RegFunction("Hide", QPYX_Hide_YXQP);
		L_YXQP.RegFunction("SetEdgeInsets", QPYX_SetEdgeInsets_YXQP);
		L_YXQP.RegFunction("SetMargins", QPYX_SetMargins_YXQP);
		L_YXQP.RegFunction("ConvertPixelToPoint", QPYX_ConvertPixelToPoint_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("uniWebView", QPYX_get_uniWebView_YXQP, QPYX_set_uniWebView_YXQP);
		L_YXQP.RegVar("onLoadComplete", QPYX_get_onLoadComplete_YXQP, QPYX_set_onLoadComplete_YXQP);
		L_YXQP.RegVar("onReceivedMessage", QPYX_get_onReceivedMessage_YXQP, QPYX_set_onReceivedMessage_YXQP);
		L_YXQP.RegVar("onEvalJavaScriptFinished", QPYX_get_onEvalJavaScriptFinished_YXQP, QPYX_set_onEvalJavaScriptFinished_YXQP);
		L_YXQP.RegVar("onReceivedKeyCode", QPYX_get_onReceivedKeyCode_YXQP, QPYX_set_onReceivedKeyCode_YXQP);
		L_YXQP.RegVar("zoomEnable", QPYX_get_zoomEnable_YXQP, QPYX_set_zoomEnable_YXQP);
		L_YXQP.RegVar("userAgent", QPYX_get_userAgent_YXQP, null);
		L_YXQP.RegVar("screenWidth", QPYX_get_screenWidth_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Init_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			QPYX_obj_YXQP.Init();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBackgroundColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
			QPYX_obj_YXQP.SetBackgroundColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetUserAgent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UniWebViewEx.SetUserAgent(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadHTMLString_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.LoadHTMLString(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EvaluatingJavaScript_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.EvaluatingJavaScript(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddJavaScript_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.AddJavaScript(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CleanCache_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			QPYX_obj_YXQP.CleanCache();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCookie_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			UniWebViewEx.SetCookie(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCookie_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = UniWebViewEx.GetCookie(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddPermissionRequestTrustSite_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.AddPermissionRequestTrustSite(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddUrlScheme_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.AddUrlScheme(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveUrlScheme_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.RemoveUrlScheme(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetHeaderField_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.SetHeaderField(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetVerticalScrollBarShow_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.SetVerticalScrollBarShow(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetHorizontalScrollBarShow_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.SetHorizontalScrollBarShow(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAllowInlinePlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.SetAllowInlinePlay(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAllowAutoPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.SetAllowAutoPlay(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Stop_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			QPYX_obj_YXQP.Stop();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Reload_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			QPYX_obj_YXQP.Reload();
			return 0;
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
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
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
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
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
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
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
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			QPYX_obj_YXQP.GoForward();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Load_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.Load(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Show_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
				QPYX_obj_YXQP.Show();
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				System.Action QPYX_arg3_YXQP = (System.Action)ToLua.CheckDelegate<System.Action>(L_YXQP, 5);
				QPYX_obj_YXQP.Show(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UniWebViewEx.Show");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Hide_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
				QPYX_obj_YXQP.Hide();
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				System.Action QPYX_arg3_YXQP = (System.Action)ToLua.CheckDelegate<System.Action>(L_YXQP, 5);
				QPYX_obj_YXQP.Hide(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UniWebViewEx.Hide");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetEdgeInsets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			UnityEngine.Camera QPYX_arg0_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera));
			UnityEngine.GameObject QPYX_arg1_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.GameObject));
			UnityEngine.GameObject QPYX_arg2_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.GameObject));
			QPYX_obj_YXQP.SetEdgeInsets(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
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
			ToLua.CheckArgsCount(L_YXQP, 5);
			UniWebViewEx  QPYX_obj_YXQP  = (UniWebViewEx)ToLua.CheckObject<UniWebViewEx>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
			QPYX_obj_YXQP.SetMargins(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ConvertPixelToPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_o_YXQP = UniWebViewEx.ConvertPixelToPoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
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
	static int QPYX_get_uniWebView_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			UniWebView QPYX_ret_YXQP = QPYX_obj_YXQP.uniWebView;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uniWebView on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onLoadComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onLoadComplete;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLoadComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onReceivedMessage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onReceivedMessage;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceivedMessage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onEvalJavaScriptFinished_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onEvalJavaScriptFinished;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEvalJavaScriptFinished on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onReceivedKeyCode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onReceivedKeyCode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceivedKeyCode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_zoomEnable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.zoomEnable;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index zoomEnable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_userAgent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.userAgent;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index userAgent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_screenWidth_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UniWebViewEx.screenWidth);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_uniWebView_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			UniWebView QPYX_arg0_YXQP = (UniWebView)ToLua.CheckObject<UniWebView>(L_YXQP, 2);
			QPYX_obj_YXQP.uniWebView = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uniWebView on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onLoadComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onLoadComplete = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLoadComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onReceivedMessage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onReceivedMessage = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceivedMessage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onEvalJavaScriptFinished_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onEvalJavaScriptFinished = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEvalJavaScriptFinished on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onReceivedKeyCode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onReceivedKeyCode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceivedKeyCode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_zoomEnable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewEx QPYX_obj_YXQP = (UniWebViewEx)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.zoomEnable = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index zoomEnable on a nil value");
		}
	}
}

