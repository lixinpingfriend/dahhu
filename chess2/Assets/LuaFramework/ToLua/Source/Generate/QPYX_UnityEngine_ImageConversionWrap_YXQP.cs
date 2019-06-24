using System;
using LuaInterface;

public class QPYX_UnityEngine_ImageConversionWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("ImageConversion");
		L_YXQP.RegFunction("EncodeToPNG", QPYX_EncodeToPNG_YXQP);
		L_YXQP.RegFunction("EncodeToJPG", QPYX_EncodeToJPG_YXQP);
		L_YXQP.RegFunction("EncodeToEXR", QPYX_EncodeToEXR_YXQP);
		L_YXQP.RegFunction("LoadImage", QPYX_LoadImage_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EncodeToPNG_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			byte[] QPYX_o_YXQP = UnityEngine.ImageConversion.EncodeToPNG(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EncodeToJPG_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				byte[] QPYX_o_YXQP = UnityEngine.ImageConversion.EncodeToJPG(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				byte[] QPYX_o_YXQP = UnityEngine.ImageConversion.EncodeToJPG(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ImageConversion.EncodeToJPG");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EncodeToEXR_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				byte[] QPYX_o_YXQP = UnityEngine.ImageConversion.EncodeToEXR(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Texture2D.EXRFlags QPYX_arg1_YXQP = (UnityEngine.Texture2D.EXRFlags)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Texture2D.EXRFlags));
				byte[] QPYX_o_YXQP = UnityEngine.ImageConversion.EncodeToEXR(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ImageConversion.EncodeToEXR");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadImage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				bool QPYX_o_YXQP = UnityEngine.ImageConversion.LoadImage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.ImageConversion.LoadImage(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ImageConversion.LoadImage");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

