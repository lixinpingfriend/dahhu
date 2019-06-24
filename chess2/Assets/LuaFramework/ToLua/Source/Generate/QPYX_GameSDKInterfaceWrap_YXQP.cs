using System;
using LuaInterface;

public class QPYX_GameSDKInterfaceWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GameSDKInterface), typeof(System.Object));
		L_YXQP.RegFunction("PauseEditorApplication", QPYX_PauseEditorApplication_YXQP);
		L_YXQP.RegFunction("BuglySetUserId", QPYX_BuglySetUserId_YXQP);
		L_YXQP.RegFunction("BuglyPrintLog", QPYX_BuglyPrintLog_YXQP);
		L_YXQP.RegFunction("ReportException", QPYX_ReportException_YXQP);
		L_YXQP.RegFunction("DebugLogError", QPYX_DebugLogError_YXQP);
		L_YXQP.RegFunction("GetChannelName", QPYX_GetChannelName_YXQP);
		L_YXQP.RegFunction("GetPlatformName", QPYX_GetPlatformName_YXQP);
		L_YXQP.RegFunction("ReadFileFromeAssets", QPYX_ReadFileFromeAssets_YXQP);
		L_YXQP.RegFunction("AssetsFileExistInInternalAssets", QPYX_AssetsFileExistInInternalAssets_YXQP);
		L_YXQP.RegFunction("Init", QPYX_Init_YXQP);
		L_YXQP.RegFunction("Login", QPYX_Login_YXQP);
		L_YXQP.RegFunction("Logout", QPYX_Logout_YXQP);
		L_YXQP.RegFunction("RestartApplication", QPYX_RestartApplication_YXQP);
		L_YXQP.RegFunction("GetIDFA", QPYX_GetIDFA_YXQP);
		L_YXQP.RegFunction("GetNativeAvatar", QPYX_GetNativeAvatar_YXQP);
		L_YXQP.RegFunction("GetDataFromIosKeychain", QPYX_GetDataFromIosKeychain_YXQP);
		L_YXQP.RegFunction("SaveDataToIosKeychain", QPYX_SaveDataToIosKeychain_YXQP);
		L_YXQP.RegFunction("ProcessIpAndAddressFamily", QPYX_ProcessIpAndAddressFamily_YXQP);
		L_YXQP.RegFunction("GetCurSignalStrenth", QPYX_GetCurSignalStrenth_YXQP);
		L_YXQP.RegFunction("GetCurSignalType", QPYX_GetCurSignalType_YXQP);
		L_YXQP.RegFunction("GetCurBatteryLevel", QPYX_GetCurBatteryLevel_YXQP);
		L_YXQP.RegFunction("ShakePhone", QPYX_ShakePhone_YXQP);
		L_YXQP.RegFunction("GetCurChargeState", QPYX_GetCurChargeState_YXQP);
		L_YXQP.RegFunction("InitWechat", QPYX_InitWechat_YXQP);
		L_YXQP.RegFunction("InitApp", QPYX_InitApp_YXQP);
		L_YXQP.RegFunction("LoginApp", QPYX_LoginApp_YXQP);
		L_YXQP.RegFunction("InstallApk", QPYX_InstallApk_YXQP);
		L_YXQP.RegFunction("SetAlarm", QPYX_SetAlarm_YXQP);
		L_YXQP.RegFunction("LoginWechat", QPYX_LoginWechat_YXQP);
		L_YXQP.RegFunction("ShareUrlToWechat", QPYX_ShareUrlToWechat_YXQP);
		L_YXQP.RegFunction("ShareImageToWechat", QPYX_ShareImageToWechat_YXQP);
		L_YXQP.RegFunction("ShareUrl", QPYX_ShareUrl_YXQP);
		L_YXQP.RegFunction("ShareText", QPYX_ShareText_YXQP);
		L_YXQP.RegFunction("ShareImage", QPYX_ShareImage_YXQP);
		L_YXQP.RegFunction("ShareMiniProgramToWechat", QPYX_ShareMiniProgramToWechat_YXQP);
		L_YXQP.RegFunction("WeRech", QPYX_WeRech_YXQP);
		L_YXQP.RegFunction("CommonRecharge", QPYX_CommonRecharge_YXQP);
		L_YXQP.RegFunction("GetIpsByHttpDNS", QPYX_GetIpsByHttpDNS_YXQP);
		L_YXQP.RegFunction("BeginLocation", QPYX_BeginLocation_YXQP);
		L_YXQP.RegFunction("StopLocation", QPYX_StopLocation_YXQP);
		L_YXQP.RegFunction("IsGpsOpen", QPYX_IsGpsOpen_YXQP);
		L_YXQP.RegFunction("AndroidIsRoot", QPYX_AndroidIsRoot_YXQP);
		L_YXQP.RegFunction("AndroidIsSimulator", QPYX_AndroidIsSimulator_YXQP);
		L_YXQP.RegFunction("StartActivity", QPYX_StartActivity_YXQP);
		L_YXQP.RegFunction("CaculateDistance", QPYX_CaculateDistance_YXQP);
		L_YXQP.RegFunction("BuyAppStoreProduct", QPYX_BuyAppStoreProduct_YXQP);
		L_YXQP.RegFunction("IsUserCloseNetWork", QPYX_IsUserCloseNetWork_YXQP);
		L_YXQP.RegFunction("GetCurSdCardSize", QPYX_GetCurSdCardSize_YXQP);
		L_YXQP.RegFunction("CopyToClipboard", QPYX_CopyToClipboard_YXQP);
		L_YXQP.RegFunction("GetTextFromClipboard", QPYX_GetTextFromClipboard_YXQP);
		L_YXQP.RegFunction("CopyTextToClipboard", QPYX_CopyTextToClipboard_YXQP);
		L_YXQP.RegFunction("StartApp", QPYX_StartApp_YXQP);
		L_YXQP.RegFunction("IsAppExist", QPYX_IsAppExist_YXQP);
		L_YXQP.RegFunction("JPushInit", QPYX_JPushInit_YXQP);
		L_YXQP.RegFunction("JPushStopPush", QPYX_JPushStopPush_YXQP);
		L_YXQP.RegFunction("JPushResumePush", QPYX_JPushResumePush_YXQP);
		L_YXQP.RegFunction("JPushIsPushStopped", QPYX_JPushIsPushStopped_YXQP);
		L_YXQP.RegFunction("JPushQuit", QPYX_JPushQuit_YXQP);
		L_YXQP.RegFunction("JPushSetDebug", QPYX_JPushSetDebug_YXQP);
		L_YXQP.RegFunction("JPushGetRegistrationId", QPYX_JPushGetRegistrationId_YXQP);
		L_YXQP.RegFunction("JPushSetTags", QPYX_JPushSetTags_YXQP);
		L_YXQP.RegFunction("JPushSetAlias", QPYX_JPushSetAlias_YXQP);
		L_YXQP.RegFunction("JPushSetPushTime", QPYX_JPushSetPushTime_YXQP);
		L_YXQP.RegFunction("JPushSetSilenceTime", QPYX_JPushSetSilenceTime_YXQP);
		L_YXQP.RegFunction("JPushSetLatestNotificationNumber", QPYX_JPushSetLatestNotificationNumber_YXQP);
		L_YXQP.RegFunction("JPushInitCrashHandler", QPYX_JPushInitCrashHandler_YXQP);
		L_YXQP.RegFunction("JPushStopCrashHandler", QPYX_JPushStopCrashHandler_YXQP);
		L_YXQP.RegFunction("SetImageSize", QPYX_SetImageSize_YXQP);
		L_YXQP.RegFunction("OpenPick", QPYX_OpenPick_YXQP);
		L_YXQP.RegFunction("OpenCamera", QPYX_OpenCamera_YXQP);
		L_YXQP.RegFunction("SaveImageToGallery", QPYX_SaveImageToGallery_YXQP);
		L_YXQP.RegFunction("PermissionCheck", QPYX_PermissionCheck_YXQP);
		L_YXQP.RegFunction("RequestPermission", QPYX_RequestPermission_YXQP);
		L_YXQP.RegFunction("GetTalkingStatus", QPYX_GetTalkingStatus_YXQP);
		L_YXQP.RegFunction("SendRequestToPhone", QPYX_SendRequestToPhone_YXQP);
		L_YXQP.RegFunction("CommonRequest", QPYX_CommonRequest_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("onLoginSuc", QPYX_get_onLoginSuc_YXQP, QPYX_set_onLoginSuc_YXQP);
		L_YXQP.RegVar("onLogout", QPYX_get_onLogout_YXQP, QPYX_set_onLogout_YXQP);
		L_YXQP.RegVar("instance", QPYX_get_instance_YXQP, null);
		L_YXQP.RegFunction("LogoutHandler", QPYX_GameSDKInterface_LogoutHandler_YXQP);
		L_YXQP.RegFunction("LoginSucHandler", QPYX_GameSDKInterface_LoginSucHandler_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PauseEditorApplication_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.PauseEditorApplication(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BuglySetUserId_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.BuglySetUserId(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BuglyPrintLog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.BuglyPrintLog(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReportException_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
			QPYX_obj_YXQP.ReportException(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DebugLogError_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DebugLogError(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetChannelName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetChannelName();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPlatformName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetPlatformName();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReadFileFromeAssets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.ReadFileFromeAssets(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AssetsFileExistInInternalAssets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AssetsFileExistInInternalAssets(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Init_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.Init();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Login_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.Login();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Logout_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.Logout();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RestartApplication_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.RestartApplication();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIDFA_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetIDFA();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetNativeAvatar_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.GetNativeAvatar(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDataFromIosKeychain_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetDataFromIosKeychain(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SaveDataToIosKeychain_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.SaveDataToIosKeychain(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ProcessIpAndAddressFamily_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = null;
			System.Net.Sockets.AddressFamily QPYX_arg2_YXQP;
			bool QPYX_o_YXQP = QPYX_obj_YXQP.ProcessIpAndAddressFamily(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, out QPYX_arg2_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
			return 3;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurSignalStrenth_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetCurSignalStrenth();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetCurSignalStrenth(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GameSDKInterface.GetCurSignalStrenth");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurSignalType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
				string QPYX_o_YXQP = QPYX_obj_YXQP.GetCurSignalType();
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				string QPYX_o_YXQP = QPYX_obj_YXQP.GetCurSignalType(QPYX_arg0_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GameSDKInterface.GetCurSignalType");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurBatteryLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetCurBatteryLevel();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShakePhone_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			long QPYX_arg0_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 2);
			QPYX_obj_YXQP.ShakePhone(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurChargeState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.GetCurChargeState();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitWechat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.InitWechat(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitApp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.InitApp(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoginApp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.LoginApp(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InstallApk_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.InstallApk(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAlarm_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			long QPYX_arg0_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.SetAlarm(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoginWechat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.LoginWechat();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShareUrlToWechat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.ShareUrlToWechat(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShareImageToWechat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.ShareImageToWechat(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShareUrl_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.ShareUrl(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShareText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.ShareText(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShareImage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.ShareImage(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShareMiniProgramToWechat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.ShareMiniProgramToWechat(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WeRech_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.WeRech(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CommonRecharge_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.CommonRecharge(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIpsByHttpDNS_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetIpsByHttpDNS(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BeginLocation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.BeginLocation(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				QPYX_obj_YXQP.BeginLocation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GameSDKInterface.BeginLocation");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopLocation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.StopLocation();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsGpsOpen_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsGpsOpen(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AndroidIsRoot_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AndroidIsRoot();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AndroidIsSimulator_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AndroidIsSimulator();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartActivity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.StartActivity(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CaculateDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			double QPYX_arg0_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 2);
			double QPYX_arg1_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 3);
			double QPYX_arg2_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 4);
			double QPYX_arg3_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 5);
			double QPYX_o_YXQP = QPYX_obj_YXQP.CaculateDistance(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BuyAppStoreProduct_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.BuyAppStoreProduct(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsUserCloseNetWork_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.IsUserCloseNetWork();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurSdCardSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			float QPYX_o_YXQP = QPYX_obj_YXQP.GetCurSdCardSize();
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CopyToClipboard_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.CopyToClipboard(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTextFromClipboard_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetTextFromClipboard();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CopyTextToClipboard_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.CopyTextToClipboard();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartApp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.StartApp(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsAppExist_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsAppExist(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushInit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.JPushInit();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushStopPush_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.JPushStopPush();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushResumePush_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.JPushResumePush();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushIsPushStopped_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.JPushIsPushStopped();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushQuit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.JPushQuit();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushSetDebug_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.JPushSetDebug(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushGetRegistrationId_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.JPushGetRegistrationId();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushSetTags_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.JPushSetTags(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushSetAlias_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.JPushSetAlias(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushSetPushTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.JPushSetPushTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushSetSilenceTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.JPushSetSilenceTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushSetLatestNotificationNumber_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.JPushSetLatestNotificationNumber(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushInitCrashHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.JPushInitCrashHandler();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JPushStopCrashHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			QPYX_obj_YXQP.JPushStopCrashHandler();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetImageSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetImageSize(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OpenPick_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.OpenPick(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OpenCamera_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.OpenCamera(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SaveImageToGallery_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.SaveImageToGallery(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PermissionCheck_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.PermissionCheck(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RequestPermission_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.RequestPermission(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTalkingStatus_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetTalkingStatus();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendRequestToPhone_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.SendRequestToPhone(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CommonRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameSDKInterface  QPYX_obj_YXQP  = (GameSDKInterface)ToLua.CheckObject<GameSDKInterface>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.CommonRequest(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onLoginSuc_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKInterface QPYX_obj_YXQP = (GameSDKInterface)QPYX_o_YXQP;
			GameSDKInterface.LoginSucHandler QPYX_ret_YXQP = QPYX_obj_YXQP.onLoginSuc;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLoginSuc on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onLogout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKInterface QPYX_obj_YXQP = (GameSDKInterface)QPYX_o_YXQP;
			GameSDKInterface.LogoutHandler QPYX_ret_YXQP = QPYX_obj_YXQP.onLogout;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLogout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_instance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushObject(L_YXQP, GameSDKInterface.instance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onLoginSuc_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKInterface QPYX_obj_YXQP = (GameSDKInterface)QPYX_o_YXQP;
			GameSDKInterface.LoginSucHandler QPYX_arg0_YXQP = (GameSDKInterface.LoginSucHandler)ToLua.CheckDelegate<GameSDKInterface.LoginSucHandler>(L_YXQP, 2);
			QPYX_obj_YXQP.onLoginSuc = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLoginSuc on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onLogout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKInterface QPYX_obj_YXQP = (GameSDKInterface)QPYX_o_YXQP;
			GameSDKInterface.LogoutHandler QPYX_arg0_YXQP = (GameSDKInterface.LogoutHandler)ToLua.CheckDelegate<GameSDKInterface.LogoutHandler>(L_YXQP, 2);
			QPYX_obj_YXQP.onLogout = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLogout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GameSDKInterface_LogoutHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LogoutHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LogoutHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GameSDKInterface_LoginSucHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LoginSucHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LoginSucHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

