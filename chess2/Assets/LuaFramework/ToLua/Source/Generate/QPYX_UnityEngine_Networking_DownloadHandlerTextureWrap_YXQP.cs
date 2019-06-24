using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_DownloadHandlerTextureWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Networking.DownloadHandlerTexture), typeof(UnityEngine.Networking.DownloadHandler));
		L_YXQP.RegFunction("GetContent", QPYX_GetContent_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Networking_DownloadHandlerTexture_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("texture", QPYX_get_texture_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Networking_DownloadHandlerTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Networking.DownloadHandlerTexture QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerTexture();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				UnityEngine.Networking.DownloadHandlerTexture QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerTexture(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Networking.DownloadHandlerTexture.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetContent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest QPYX_arg0_YXQP = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			UnityEngine.Texture2D QPYX_o_YXQP = UnityEngine.Networking.DownloadHandlerTexture.GetContent(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_texture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.DownloadHandlerTexture QPYX_obj_YXQP = (UnityEngine.Networking.DownloadHandlerTexture)QPYX_o_YXQP;
			UnityEngine.Texture2D QPYX_ret_YXQP = QPYX_obj_YXQP.texture;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index texture on a nil value");
		}
	}
}

