using System;
using LuaInterface;

public class QPYX_CustomerUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("CustomerUtil");
		L_YXQP.RegFunction("CustomEventCallback", QPYX_CustomEventCallback_YXQP);
		L_YXQP.RegFunction("EmojiEventInvoke", QPYX_EmojiEventInvoke_YXQP);
		L_YXQP.RegFunction("ReloadCurScene", QPYX_ReloadCurScene_YXQP);
		L_YXQP.RegFunction("UnloadUnusedAssets", QPYX_UnloadUnusedAssets_YXQP);
		L_YXQP.RegFunction("ScreenShot", QPYX_ScreenShot_YXQP);
		L_YXQP.RegFunction("GetTexture2dSize", QPYX_GetTexture2dSize_YXQP);
		L_YXQP.RegFunction("MirrorCamera", QPYX_MirrorCamera_YXQP);
		L_YXQP.RegFunction("CaptureCamera", QPYX_CaptureCamera_YXQP);
		L_YXQP.RegFunction("ScreenShotScale", QPYX_ScreenShotScale_YXQP);
		L_YXQP.RegFunction("ScaleTexture", QPYX_ScaleTexture_YXQP);
		L_YXQP.RegFunction("GetTextureFormat", QPYX_GetTextureFormat_YXQP);
		L_YXQP.RegFunction("GetRenderTextureFormat", QPYX_GetRenderTextureFormat_YXQP);
		L_YXQP.RegFunction("CreateSpriteFromTexture", QPYX_CreateSpriteFromTexture_YXQP);
		L_YXQP.RegFunction("AttachTexture2Image", QPYX_AttachTexture2Image_YXQP);
		L_YXQP.RegFunction("SetPos", QPYX_SetPos_YXQP);
		L_YXQP.RegFunction("SetLocalPos", QPYX_SetLocalPos_YXQP);
		L_YXQP.RegFunction("SetScale", QPYX_SetScale_YXQP);
		L_YXQP.RegFunction("SetAlpha", QPYX_SetAlpha_YXQP);
		L_YXQP.RegFunction("Instantiate", QPYX_Instantiate_YXQP);
		L_YXQP.RegFunction("StartCoroutineToWaitOneFrame", QPYX_StartCoroutineToWaitOneFrame_YXQP);
		L_YXQP.RegFunction("SetAlphaYoyo", QPYX_SetAlphaYoyo_YXQP);
		L_YXQP.RegFunction("FadeAlpha", QPYX_FadeAlpha_YXQP);
		L_YXQP.RegFunction("ToGeterSeterFloat", QPYX_ToGeterSeterFloat_YXQP);
		L_YXQP.RegFunction("ConvertVector2", QPYX_ConvertVector2_YXQP);
		L_YXQP.RegFunction("ConvertVector3", QPYX_ConvertVector3_YXQP);
		L_YXQP.RegFunction("ConvertRectOffset", QPYX_ConvertRectOffset_YXQP);
		L_YXQP.RegFunction("ConverToTargetRectTransformChildPos", QPYX_ConverToTargetRectTransformChildPos_YXQP);
		L_YXQP.RegFunction("VersionCompare", QPYX_VersionCompare_YXQP);
		L_YXQP.RegFunction("RegisterLogCallback", QPYX_RegisterLogCallback_YXQP);
		L_YXQP.RegFunction("UnRegisterLogCallback", QPYX_UnRegisterLogCallback_YXQP);
		L_YXQP.RegFunction("HandleLog", QPYX_HandleLog_YXQP);
		L_YXQP.RegFunction("FileLog", QPYX_FileLog_YXQP);
		L_YXQP.RegFunction("GenerateEmptyStringStringDic", QPYX_GenerateEmptyStringStringDic_YXQP);
		L_YXQP.RegFunction("GetAuthorization", QPYX_GetAuthorization_YXQP);
		L_YXQP.RegFunction("ToHMACSHA1_Base64", QPYX_ToHMACSHA1_Base64_YXQP);
		L_YXQP.RegFunction("GetFileMD5", QPYX_GetFileMD5_YXQP);
		L_YXQP.RegFunction("GetBytesMD5", QPYX_GetBytesMD5_YXQP);
		L_YXQP.RegFunction("GetUtcGMT", QPYX_GetUtcGMT_YXQP);
		L_YXQP.RegVar("customEventCallback", QPYX_get_customEventCallback_YXQP, QPYX_set_customEventCallback_YXQP);
		L_YXQP.RegVar("emojiEventCallback", QPYX_get_emojiEventCallback_YXQP, QPYX_set_emojiEventCallback_YXQP);
		L_YXQP.RegVar("logCallback", QPYX_get_logCallback_YXQP, QPYX_set_logCallback_YXQP);
		L_YXQP.RegVar("platform", QPYX_get_platform_YXQP, null);
		L_YXQP.RegVar("deviceModel", QPYX_get_deviceModel_YXQP, null);
		L_YXQP.RegVar("deviceName", QPYX_get_deviceName_YXQP, null);
		L_YXQP.RegVar("batteryLevel", QPYX_get_batteryLevel_YXQP, null);
		L_YXQP.RegVar("batteryStatus", QPYX_get_batteryStatus_YXQP, null);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CustomEventCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			CustomerUtil.CustomEventCallback(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EmojiEventInvoke_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			object QPYX_o_YXQP = CustomerUtil.EmojiEventInvoke(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReloadCurScene_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			CustomerUtil.ReloadCurScene();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnloadUnusedAssets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			CustomerUtil.UnloadUnusedAssets();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ScreenShot_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			CustomerUtil.ScreenShot(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTexture2dSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			UnityEngine.Vector2 QPYX_o_YXQP = CustomerUtil.GetTexture2dSize(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MirrorCamera_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera QPYX_arg0_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
			CustomerUtil.MirrorCamera(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CaptureCamera_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 6);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.Camera QPYX_arg1_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera));
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
			float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
			bool QPYX_o_YXQP = CustomerUtil.CaptureCamera(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ScreenShotScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			bool QPYX_o_YXQP = CustomerUtil.ScreenShotScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ScaleTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.Texture2D QPYX_o_YXQP = CustomerUtil.ScaleTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTextureFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			UnityEngine.TextureFormat QPYX_o_YXQP = CustomerUtil.GetTextureFormat(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetRenderTextureFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			UnityEngine.RenderTextureFormat QPYX_o_YXQP = CustomerUtil.GetRenderTextureFormat(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CreateSpriteFromTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Sprite QPYX_o_YXQP = CustomerUtil.CreateSpriteFromTexture(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Sprite QPYX_o_YXQP = CustomerUtil.CreateSpriteFromTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Sprite QPYX_o_YXQP = CustomerUtil.CreateSpriteFromTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: CustomerUtil.CreateSpriteFromTexture");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AttachTexture2Image_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Image QPYX_arg0_YXQP = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			UnityEngine.Texture2D QPYX_arg1_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Texture2D));
			CustomerUtil.AttachTexture2Image(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPos_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			CustomerUtil.SetPos(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLocalPos_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			CustomerUtil.SetLocalPos(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			CustomerUtil.SetScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAlpha_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Image QPYX_arg0_YXQP = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			CustomerUtil.SetAlpha(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Instantiate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			UnityEngine.Transform QPYX_arg1_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
			UnityEngine.GameObject QPYX_o_YXQP = CustomerUtil.Instantiate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartCoroutineToWaitOneFrame_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.MonoBehaviour QPYX_arg0_YXQP = (UnityEngine.MonoBehaviour)ToLua.CheckObject<UnityEngine.MonoBehaviour>(L_YXQP, 1);
			System.Action QPYX_arg1_YXQP = (System.Action)ToLua.CheckDelegate<System.Action>(L_YXQP, 2);
			CustomerUtil.StartCoroutineToWaitOneFrame(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAlphaYoyo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.Image QPYX_arg0_YXQP = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Sequence QPYX_o_YXQP = CustomerUtil.SetAlphaYoyo(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FadeAlpha_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.Image QPYX_arg0_YXQP = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tween QPYX_o_YXQP = CustomerUtil.FadeAlpha(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToGeterSeterFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			DG.Tweening.Core.DOGetter<float> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<float>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<float>>(L_YXQP, 1);
			DG.Tweening.Core.DOSetter<float> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<float>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<float>>(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			DG.Tweening.Tween QPYX_o_YXQP = CustomerUtil.ToGeterSeterFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ConvertVector2_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Vector2 QPYX_o_YXQP = CustomerUtil.ConvertVector2(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ConvertVector3_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.Vector3 QPYX_o_YXQP = CustomerUtil.ConvertVector3(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ConvertRectOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			UnityEngine.RectOffset QPYX_o_YXQP = CustomerUtil.ConvertRectOffset(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ConverToTargetRectTransformChildPos_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera QPYX_arg0_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.RectTransform QPYX_arg1_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform));
			UnityEngine.RectTransform QPYX_arg2_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.RectTransform));
			UnityEngine.Vector2 QPYX_o_YXQP = CustomerUtil.ConverToTargetRectTransformChildPos(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_VersionCompare_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = CustomerUtil.VersionCompare(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RegisterLogCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			CustomerUtil.RegisterLogCallback();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnRegisterLogCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			CustomerUtil.UnRegisterLogCallback();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HandleLog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.LogType QPYX_arg2_YXQP = (UnityEngine.LogType)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.LogType));
			CustomerUtil.HandleLog(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FileLog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			CustomerUtil.FileLog(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GenerateEmptyStringStringDic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			System.Collections.Generic.Dictionary<string,string> QPYX_o_YXQP = CustomerUtil.GenerateEmptyStringStringDic();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAuthorization_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 8);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
			string QPYX_arg3_YXQP = ToLua.CheckString(L_YXQP, 4);
			string QPYX_arg4_YXQP = ToLua.CheckString(L_YXQP, 5);
			string QPYX_arg5_YXQP = ToLua.CheckString(L_YXQP, 6);
			string QPYX_arg6_YXQP = ToLua.CheckString(L_YXQP, 7);
			string QPYX_arg7_YXQP = ToLua.CheckString(L_YXQP, 8);
			string QPYX_o_YXQP = CustomerUtil.GetAuthorization(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToHMACSHA1_Base64_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = CustomerUtil.ToHMACSHA1_Base64(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFileMD5_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_o_YXQP = CustomerUtil.GetFileMD5(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBytesMD5_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
			string QPYX_o_YXQP = CustomerUtil.GetBytesMD5(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetUtcGMT_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			string QPYX_o_YXQP = CustomerUtil.GetUtcGMT();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_customEventCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, CustomerUtil.customEventCallback);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_emojiEventCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, CustomerUtil.emojiEventCallback);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_logCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, CustomerUtil.logCallback);
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
			LuaDLL.lua_pushstring(L_YXQP, CustomerUtil.platform);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_deviceModel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, CustomerUtil.deviceModel);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_deviceName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, CustomerUtil.deviceName);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_batteryLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, CustomerUtil.batteryLevel);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_batteryStatus_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,CustomerUtil.batteryStatus);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_customEventCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			CustomerUtil.customEventCallback = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_emojiEventCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			CustomerUtil.emojiEventCallback = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_logCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			CustomerUtil.logCallback = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

