using System;
using LuaInterface;

public class QPYX_UnityEngine_WWWWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.WWW), typeof(System.Object));
		L_YXQP.RegFunction("EscapeURL", QPYX_EscapeURL_YXQP);
		L_YXQP.RegFunction("UnEscapeURL", QPYX_UnEscapeURL_YXQP);
		L_YXQP.RegFunction("LoadFromCacheOrDownload", QPYX_LoadFromCacheOrDownload_YXQP);
		L_YXQP.RegFunction("LoadImageIntoTexture", QPYX_LoadImageIntoTexture_YXQP);
		L_YXQP.RegFunction("Dispose", QPYX_Dispose_YXQP);
		L_YXQP.RegFunction("GetAudioClip", QPYX_GetAudioClip_YXQP);
		L_YXQP.RegFunction("GetAudioClipCompressed", QPYX_GetAudioClipCompressed_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_WWW_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("assetBundle", QPYX_get_assetBundle_YXQP, null);
		L_YXQP.RegVar("bytes", QPYX_get_bytes_YXQP, null);
		L_YXQP.RegVar("bytesDownloaded", QPYX_get_bytesDownloaded_YXQP, null);
		L_YXQP.RegVar("error", QPYX_get_error_YXQP, null);
		L_YXQP.RegVar("isDone", QPYX_get_isDone_YXQP, null);
		L_YXQP.RegVar("progress", QPYX_get_progress_YXQP, null);
		L_YXQP.RegVar("responseHeaders", QPYX_get_responseHeaders_YXQP, null);
		L_YXQP.RegVar("text", QPYX_get_text_YXQP, null);
		L_YXQP.RegVar("texture", QPYX_get_texture_YXQP, null);
		L_YXQP.RegVar("textureNonReadable", QPYX_get_textureNonReadable_YXQP, null);
		L_YXQP.RegVar("threadPriority", QPYX_get_threadPriority_YXQP, QPYX_set_threadPriority_YXQP);
		L_YXQP.RegVar("uploadProgress", QPYX_get_uploadProgress_YXQP, null);
		L_YXQP.RegVar("url", QPYX_get_url_YXQP, null);
		L_YXQP.RegVar("keepWaiting", QPYX_get_keepWaiting_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_WWW_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.WWW QPYX_obj_YXQP = new UnityEngine.WWW(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<byte[]>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				UnityEngine.WWW QPYX_obj_YXQP = new UnityEngine.WWW(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.WWWForm>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.WWWForm QPYX_arg1_YXQP = (UnityEngine.WWWForm)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.WWW QPYX_obj_YXQP = new UnityEngine.WWW(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				System.Collections.Generic.Dictionary<string,string> QPYX_arg2_YXQP = (System.Collections.Generic.Dictionary<string,string>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.Dictionary<string,string>));
				UnityEngine.WWW QPYX_obj_YXQP = new UnityEngine.WWW(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.WWW.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EscapeURL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_o_YXQP = UnityEngine.WWW.EscapeURL(QPYX_arg0_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Text.Encoding QPYX_arg1_YXQP = (System.Text.Encoding)ToLua.CheckObject<System.Text.Encoding>(L_YXQP, 2);
				string QPYX_o_YXQP = UnityEngine.WWW.EscapeURL(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.WWW.EscapeURL");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnEscapeURL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_o_YXQP = UnityEngine.WWW.UnEscapeURL(QPYX_arg0_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Text.Encoding QPYX_arg1_YXQP = (System.Text.Encoding)ToLua.CheckObject<System.Text.Encoding>(L_YXQP, 2);
				string QPYX_o_YXQP = UnityEngine.WWW.UnEscapeURL(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.WWW.UnEscapeURL");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadFromCacheOrDownload_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Hash128>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Hash128 QPYX_arg1_YXQP = StackTraits<UnityEngine.Hash128>.To(L_YXQP, 2);
				UnityEngine.WWW QPYX_o_YXQP = UnityEngine.WWW.LoadFromCacheOrDownload(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.CachedAssetBundle>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.CachedAssetBundle QPYX_arg1_YXQP = StackTraits<UnityEngine.CachedAssetBundle>.To(L_YXQP, 2);
				UnityEngine.WWW QPYX_o_YXQP = UnityEngine.WWW.LoadFromCacheOrDownload(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.WWW QPYX_o_YXQP = UnityEngine.WWW.LoadFromCacheOrDownload(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.CachedAssetBundle, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.CachedAssetBundle QPYX_arg1_YXQP = StackTraits<UnityEngine.CachedAssetBundle>.To(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.WWW QPYX_o_YXQP = UnityEngine.WWW.LoadFromCacheOrDownload(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.WWW QPYX_o_YXQP = UnityEngine.WWW.LoadFromCacheOrDownload(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Hash128, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Hash128 QPYX_arg1_YXQP = StackTraits<UnityEngine.Hash128>.To(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.WWW QPYX_o_YXQP = UnityEngine.WWW.LoadFromCacheOrDownload(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.WWW.LoadFromCacheOrDownload");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadImageIntoTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
			UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Texture2D));
			QPYX_obj_YXQP.LoadImageIntoTexture(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Dispose_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
			QPYX_obj_YXQP.Dispose();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
				UnityEngine.AudioClip QPYX_o_YXQP = QPYX_obj_YXQP.GetAudioClip();
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				UnityEngine.AudioClip QPYX_o_YXQP = QPYX_obj_YXQP.GetAudioClip(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.AudioClip QPYX_o_YXQP = QPYX_obj_YXQP.GetAudioClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.AudioType QPYX_arg2_YXQP = (UnityEngine.AudioType)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.AudioType));
				UnityEngine.AudioClip QPYX_o_YXQP = QPYX_obj_YXQP.GetAudioClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.WWW.GetAudioClip");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAudioClipCompressed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
				UnityEngine.AudioClip QPYX_o_YXQP = QPYX_obj_YXQP.GetAudioClipCompressed();
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				UnityEngine.AudioClip QPYX_o_YXQP = QPYX_obj_YXQP.GetAudioClipCompressed(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.WWW  QPYX_obj_YXQP  = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				UnityEngine.AudioType QPYX_arg1_YXQP = (UnityEngine.AudioType)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.AudioType));
				UnityEngine.AudioClip QPYX_o_YXQP = QPYX_obj_YXQP.GetAudioClipCompressed(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.WWW.GetAudioClipCompressed");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assetBundle_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			UnityEngine.AssetBundle QPYX_ret_YXQP = QPYX_obj_YXQP.assetBundle;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundle on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bytes_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.bytes;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bytes on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bytesDownloaded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.bytesDownloaded;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bytesDownloaded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_error_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.error;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index error on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isDone_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isDone;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isDone on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_progress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.progress;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index progress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_responseHeaders_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,string> QPYX_ret_YXQP = QPYX_obj_YXQP.responseHeaders;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index responseHeaders on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_text_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.text;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index text on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_texture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			UnityEngine.Texture2D QPYX_ret_YXQP = QPYX_obj_YXQP.texture;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index texture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_textureNonReadable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			UnityEngine.Texture2D QPYX_ret_YXQP = QPYX_obj_YXQP.textureNonReadable;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textureNonReadable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_threadPriority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			UnityEngine.ThreadPriority QPYX_ret_YXQP = QPYX_obj_YXQP.threadPriority;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index threadPriority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uploadProgress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.uploadProgress;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uploadProgress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_url_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.url;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index url on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_keepWaiting_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.keepWaiting;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index keepWaiting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_threadPriority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWW QPYX_obj_YXQP = (UnityEngine.WWW)QPYX_o_YXQP;
			UnityEngine.ThreadPriority QPYX_arg0_YXQP = (UnityEngine.ThreadPriority)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ThreadPriority));
			QPYX_obj_YXQP.threadPriority = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index threadPriority on a nil value");
		}
	}
}

