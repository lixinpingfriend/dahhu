using System;
using LuaInterface;

public class QPYX_UnityEngine_ApplicationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("Application");
		L_YXQP.RegFunction("Quit", QPYX_Quit_YXQP);
		L_YXQP.RegFunction("CancelQuit", QPYX_CancelQuit_YXQP);
		L_YXQP.RegFunction("Unload", QPYX_Unload_YXQP);
		L_YXQP.RegFunction("GetStreamProgressForLevel", QPYX_GetStreamProgressForLevel_YXQP);
		L_YXQP.RegFunction("CanStreamedLevelBeLoaded", QPYX_CanStreamedLevelBeLoaded_YXQP);
		L_YXQP.RegFunction("GetBuildTags", QPYX_GetBuildTags_YXQP);
		L_YXQP.RegFunction("SetBuildTags", QPYX_SetBuildTags_YXQP);
		L_YXQP.RegFunction("HasProLicense", QPYX_HasProLicense_YXQP);
		L_YXQP.RegFunction("RequestAdvertisingIdentifierAsync", QPYX_RequestAdvertisingIdentifierAsync_YXQP);
		L_YXQP.RegFunction("OpenURL", QPYX_OpenURL_YXQP);
		L_YXQP.RegFunction("GetStackTraceLogType", QPYX_GetStackTraceLogType_YXQP);
		L_YXQP.RegFunction("SetStackTraceLogType", QPYX_SetStackTraceLogType_YXQP);
		L_YXQP.RegFunction("RequestUserAuthorization", QPYX_RequestUserAuthorization_YXQP);
		L_YXQP.RegFunction("HasUserAuthorization", QPYX_HasUserAuthorization_YXQP);
		L_YXQP.RegVar("streamedBytes", QPYX_get_streamedBytes_YXQP, null);
		L_YXQP.RegVar("isPlaying", QPYX_get_isPlaying_YXQP, null);
		L_YXQP.RegVar("isFocused", QPYX_get_isFocused_YXQP, null);
		L_YXQP.RegVar("isEditor", QPYX_get_isEditor_YXQP, null);
		L_YXQP.RegVar("platform", QPYX_get_platform_YXQP, null);
		L_YXQP.RegVar("buildGUID", QPYX_get_buildGUID_YXQP, null);
		L_YXQP.RegVar("isMobilePlatform", QPYX_get_isMobilePlatform_YXQP, null);
		L_YXQP.RegVar("isConsolePlatform", QPYX_get_isConsolePlatform_YXQP, null);
		L_YXQP.RegVar("runInBackground", QPYX_get_runInBackground_YXQP, QPYX_set_runInBackground_YXQP);
		L_YXQP.RegVar("dataPath", QPYX_get_dataPath_YXQP, null);
		L_YXQP.RegVar("streamingAssetsPath", QPYX_get_streamingAssetsPath_YXQP, null);
		L_YXQP.RegVar("persistentDataPath", QPYX_get_persistentDataPath_YXQP, null);
		L_YXQP.RegVar("temporaryCachePath", QPYX_get_temporaryCachePath_YXQP, null);
		L_YXQP.RegVar("absoluteURL", QPYX_get_absoluteURL_YXQP, null);
		L_YXQP.RegVar("unityVersion", QPYX_get_unityVersion_YXQP, null);
		L_YXQP.RegVar("version", QPYX_get_version_YXQP, null);
		L_YXQP.RegVar("installerName", QPYX_get_installerName_YXQP, null);
		L_YXQP.RegVar("identifier", QPYX_get_identifier_YXQP, null);
		L_YXQP.RegVar("installMode", QPYX_get_installMode_YXQP, null);
		L_YXQP.RegVar("sandboxType", QPYX_get_sandboxType_YXQP, null);
		L_YXQP.RegVar("productName", QPYX_get_productName_YXQP, null);
		L_YXQP.RegVar("companyName", QPYX_get_companyName_YXQP, null);
		L_YXQP.RegVar("cloudProjectId", QPYX_get_cloudProjectId_YXQP, null);
		L_YXQP.RegVar("targetFrameRate", QPYX_get_targetFrameRate_YXQP, QPYX_set_targetFrameRate_YXQP);
		L_YXQP.RegVar("systemLanguage", QPYX_get_systemLanguage_YXQP, null);
		L_YXQP.RegVar("backgroundLoadingPriority", QPYX_get_backgroundLoadingPriority_YXQP, QPYX_set_backgroundLoadingPriority_YXQP);
		L_YXQP.RegVar("internetReachability", QPYX_get_internetReachability_YXQP, null);
		L_YXQP.RegVar("genuine", QPYX_get_genuine_YXQP, null);
		L_YXQP.RegVar("genuineCheckAvailable", QPYX_get_genuineCheckAvailable_YXQP, null);
		L_YXQP.RegVar("lowMemory", QPYX_get_lowMemory_YXQP, QPYX_set_lowMemory_YXQP);
		L_YXQP.RegVar("logMessageReceived", QPYX_get_logMessageReceived_YXQP, QPYX_set_logMessageReceived_YXQP);
		L_YXQP.RegVar("logMessageReceivedThreaded", QPYX_get_logMessageReceivedThreaded_YXQP, QPYX_set_logMessageReceivedThreaded_YXQP);
		L_YXQP.RegVar("onBeforeRender", QPYX_get_onBeforeRender_YXQP, QPYX_set_onBeforeRender_YXQP);
		L_YXQP.RegFunction("AdvertisingIdentifierCallback", QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP);
		L_YXQP.RegFunction("LogCallback", QPYX_UnityEngine_Application_LogCallback_YXQP);
		L_YXQP.RegFunction("LowMemoryCallback", QPYX_UnityEngine_Application_LowMemoryCallback_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Quit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Application.Quit();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CancelQuit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Application.CancelQuit();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Unload_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Application.Unload();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetStreamProgressForLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				float QPYX_o_YXQP = UnityEngine.Application.GetStreamProgressForLevel(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<int>(L_YXQP, 1))
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);
				float QPYX_o_YXQP = UnityEngine.Application.GetStreamProgressForLevel(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Application.GetStreamProgressForLevel");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CanStreamedLevelBeLoaded_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Application.CanStreamedLevelBeLoaded(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<int>(L_YXQP, 1))
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Application.CanStreamedLevelBeLoaded(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Application.CanStreamedLevelBeLoaded");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBuildTags_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			string[] QPYX_o_YXQP = UnityEngine.Application.GetBuildTags();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBuildTags_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string[] QPYX_arg0_YXQP = ToLua.CheckStringArray(L_YXQP, 1);
			UnityEngine.Application.SetBuildTags(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HasProLicense_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			bool QPYX_o_YXQP = UnityEngine.Application.HasProLicense();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RequestAdvertisingIdentifierAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Application.AdvertisingIdentifierCallback QPYX_arg0_YXQP = (UnityEngine.Application.AdvertisingIdentifierCallback)ToLua.CheckDelegate<UnityEngine.Application.AdvertisingIdentifierCallback>(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Application.RequestAdvertisingIdentifierAsync(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OpenURL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.Application.OpenURL(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetStackTraceLogType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.LogType QPYX_arg0_YXQP = (UnityEngine.LogType)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.LogType));
			UnityEngine.StackTraceLogType QPYX_o_YXQP = UnityEngine.Application.GetStackTraceLogType(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetStackTraceLogType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.LogType QPYX_arg0_YXQP = (UnityEngine.LogType)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.LogType));
			UnityEngine.StackTraceLogType QPYX_arg1_YXQP = (UnityEngine.StackTraceLogType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.StackTraceLogType));
			UnityEngine.Application.SetStackTraceLogType(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RequestUserAuthorization_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UserAuthorization QPYX_arg0_YXQP = (UnityEngine.UserAuthorization)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.UserAuthorization));
			UnityEngine.AsyncOperation QPYX_o_YXQP = UnityEngine.Application.RequestUserAuthorization(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HasUserAuthorization_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UserAuthorization QPYX_arg0_YXQP = (UnityEngine.UserAuthorization)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.UserAuthorization));
			bool QPYX_o_YXQP = UnityEngine.Application.HasUserAuthorization(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_streamedBytes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Application.streamedBytes);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isPlaying_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.isPlaying);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isFocused_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.isFocused);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isEditor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.isEditor);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_platform_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Application.platform);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_buildGUID_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.buildGUID);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isMobilePlatform_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.isMobilePlatform);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isConsolePlatform_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.isConsolePlatform);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_runInBackground_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.runInBackground);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dataPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.dataPath);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_streamingAssetsPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.streamingAssetsPath);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_persistentDataPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.persistentDataPath);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_temporaryCachePath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.temporaryCachePath);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_absoluteURL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.absoluteURL);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_unityVersion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.unityVersion);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_version_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.version);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_installerName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.installerName);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_identifier_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.identifier);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_installMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Application.installMode);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sandboxType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Application.sandboxType);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_productName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.productName);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_companyName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.companyName);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cloudProjectId_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Application.cloudProjectId);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetFrameRate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Application.targetFrameRate);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_systemLanguage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Application.systemLanguage);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_backgroundLoadingPriority_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Application.backgroundLoadingPriority);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_internetReachability_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Application.internetReachability);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_genuine_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.genuine);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_genuineCheckAvailable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Application.genuineCheckAvailable);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lowMemory_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(UnityEngine.Application.LowMemoryCallback)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_logMessageReceived_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(UnityEngine.Application.LogCallback)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_logMessageReceivedThreaded_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(UnityEngine.Application.LogCallback)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onBeforeRender_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(UnityEngine.Events.UnityAction)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_runInBackground_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Application.runInBackground = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_targetFrameRate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Application.targetFrameRate = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_backgroundLoadingPriority_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.ThreadPriority QPYX_arg0_YXQP = (UnityEngine.ThreadPriority)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ThreadPriority));
			UnityEngine.Application.backgroundLoadingPriority = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lowMemory_YXQP(IntPtr L_YXQP)
	{
		try
		{
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'UnityEngine.Application.lowMemory' can only appear on the left hand side of += or -= when used outside of the type 'UnityEngine.Application'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				UnityEngine.Application.LowMemoryCallback QPYX_ev_YXQP = (UnityEngine.Application.LowMemoryCallback)QPYX_arg0_YXQP.func;
				UnityEngine.Application.lowMemory += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				UnityEngine.Application.LowMemoryCallback QPYX_ev_YXQP = (UnityEngine.Application.LowMemoryCallback)QPYX_arg0_YXQP.func;
				UnityEngine.Application.lowMemory -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_logMessageReceived_YXQP(IntPtr L_YXQP)
	{
		try
		{
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'UnityEngine.Application.logMessageReceived' can only appear on the left hand side of += or -= when used outside of the type 'UnityEngine.Application'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				UnityEngine.Application.LogCallback QPYX_ev_YXQP = (UnityEngine.Application.LogCallback)QPYX_arg0_YXQP.func;
				UnityEngine.Application.logMessageReceived += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				UnityEngine.Application.LogCallback QPYX_ev_YXQP = (UnityEngine.Application.LogCallback)QPYX_arg0_YXQP.func;
				UnityEngine.Application.logMessageReceived -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_logMessageReceivedThreaded_YXQP(IntPtr L_YXQP)
	{
		try
		{
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'UnityEngine.Application.logMessageReceivedThreaded' can only appear on the left hand side of += or -= when used outside of the type 'UnityEngine.Application'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				UnityEngine.Application.LogCallback QPYX_ev_YXQP = (UnityEngine.Application.LogCallback)QPYX_arg0_YXQP.func;
				UnityEngine.Application.logMessageReceivedThreaded += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				UnityEngine.Application.LogCallback QPYX_ev_YXQP = (UnityEngine.Application.LogCallback)QPYX_arg0_YXQP.func;
				UnityEngine.Application.logMessageReceivedThreaded -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onBeforeRender_YXQP(IntPtr L_YXQP)
	{
		try
		{
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'UnityEngine.Application.onBeforeRender' can only appear on the left hand side of += or -= when used outside of the type 'UnityEngine.Application'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				UnityEngine.Events.UnityAction QPYX_ev_YXQP = (UnityEngine.Events.UnityAction)QPYX_arg0_YXQP.func;
				UnityEngine.Application.onBeforeRender += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				UnityEngine.Events.UnityAction QPYX_ev_YXQP = (UnityEngine.Events.UnityAction)QPYX_arg0_YXQP.func;
				UnityEngine.Application.onBeforeRender -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.AdvertisingIdentifierCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.AdvertisingIdentifierCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Application_LogCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LogCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LogCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Application_LowMemoryCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LowMemoryCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LowMemoryCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

