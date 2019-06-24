using System;
using LuaInterface;

public class QPYX_UnityEngine_Texture2DWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Texture2D), typeof(UnityEngine.Texture));
		L_YXQP.RegFunction("CreateExternalTexture", QPYX_CreateExternalTexture_YXQP);
		L_YXQP.RegFunction("UpdateExternalTexture", QPYX_UpdateExternalTexture_YXQP);
		L_YXQP.RegFunction("SetPixel", QPYX_SetPixel_YXQP);
		L_YXQP.RegFunction("GetPixel", QPYX_GetPixel_YXQP);
		L_YXQP.RegFunction("GetPixelBilinear", QPYX_GetPixelBilinear_YXQP);
		L_YXQP.RegFunction("SetPixels", QPYX_SetPixels_YXQP);
		L_YXQP.RegFunction("SetPixels32", QPYX_SetPixels32_YXQP);
		L_YXQP.RegFunction("LoadRawTextureData", QPYX_LoadRawTextureData_YXQP);
		L_YXQP.RegFunction("GetRawTextureData", QPYX_GetRawTextureData_YXQP);
		L_YXQP.RegFunction("GetPixels", QPYX_GetPixels_YXQP);
		L_YXQP.RegFunction("GetPixels32", QPYX_GetPixels32_YXQP);
		L_YXQP.RegFunction("Apply", QPYX_Apply_YXQP);
		L_YXQP.RegFunction("Resize", QPYX_Resize_YXQP);
		L_YXQP.RegFunction("Compress", QPYX_Compress_YXQP);
		L_YXQP.RegFunction("PackTextures", QPYX_PackTextures_YXQP);
		L_YXQP.RegFunction("GenerateAtlas", QPYX_GenerateAtlas_YXQP);
		L_YXQP.RegFunction("ReadPixels", QPYX_ReadPixels_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Texture2D_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("mipmapCount", QPYX_get_mipmapCount_YXQP, null);
		L_YXQP.RegVar("format", QPYX_get_format_YXQP, null);
		L_YXQP.RegVar("whiteTexture", QPYX_get_whiteTexture_YXQP, null);
		L_YXQP.RegVar("blackTexture", QPYX_get_blackTexture_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Texture2D_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Texture2D QPYX_obj_YXQP = new UnityEngine.Texture2D(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.TextureFormat QPYX_arg2_YXQP = (UnityEngine.TextureFormat)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.TextureFormat));
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				UnityEngine.Texture2D QPYX_obj_YXQP = new UnityEngine.Texture2D(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.TextureFormat QPYX_arg2_YXQP = (UnityEngine.TextureFormat)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.TextureFormat));
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				UnityEngine.Texture2D QPYX_obj_YXQP = new UnityEngine.Texture2D(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Texture2D.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CreateExternalTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 6);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.TextureFormat QPYX_arg2_YXQP = (UnityEngine.TextureFormat)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.TextureFormat));
			bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
			bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
			System.IntPtr QPYX_arg5_YXQP = ToLua.CheckIntPtr(L_YXQP, 6);
			UnityEngine.Texture2D QPYX_o_YXQP = UnityEngine.Texture2D.CreateExternalTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UpdateExternalTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			System.IntPtr QPYX_arg0_YXQP = ToLua.CheckIntPtr(L_YXQP, 2);
			QPYX_obj_YXQP.UpdateExternalTexture(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPixel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 4);
			QPYX_obj_YXQP.SetPixel(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPixel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.Color QPYX_o_YXQP = QPYX_obj_YXQP.GetPixel(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPixelBilinear_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.Color QPYX_o_YXQP = QPYX_obj_YXQP.GetPixelBilinear(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPixels_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Color[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Color>(L_YXQP, 2);
				QPYX_obj_YXQP.SetPixels(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Color[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Color>(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetPixels(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.Color[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.Color>(L_YXQP, 6);
				QPYX_obj_YXQP.SetPixels(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.Color[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.Color>(L_YXQP, 6);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				QPYX_obj_YXQP.SetPixels(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.SetPixels");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPixels32_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Color32[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Color32>(L_YXQP, 2);
				QPYX_obj_YXQP.SetPixels32(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Color32[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Color32>(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetPixels32(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.Color32[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.Color32>(L_YXQP, 6);
				QPYX_obj_YXQP.SetPixels32(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.Color32[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.Color32>(L_YXQP, 6);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				QPYX_obj_YXQP.SetPixels32(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.SetPixels32");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadRawTextureData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				QPYX_obj_YXQP.LoadRawTextureData(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				System.IntPtr QPYX_arg0_YXQP = ToLua.CheckIntPtr(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.LoadRawTextureData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.LoadRawTextureData");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetRawTextureData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			byte[] QPYX_o_YXQP = QPYX_obj_YXQP.GetRawTextureData();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPixels_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Color[] QPYX_o_YXQP = QPYX_obj_YXQP.GetPixels();
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Color[] QPYX_o_YXQP = QPYX_obj_YXQP.GetPixels(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.Color[] QPYX_o_YXQP = QPYX_obj_YXQP.GetPixels(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.Color[] QPYX_o_YXQP = QPYX_obj_YXQP.GetPixels(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.GetPixels");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPixels32_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Color32[] QPYX_o_YXQP = QPYX_obj_YXQP.GetPixels32();
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Color32[] QPYX_o_YXQP = QPYX_obj_YXQP.GetPixels32(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.GetPixels32");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Apply_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				QPYX_obj_YXQP.Apply();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Apply(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.Apply(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.Apply");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Resize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Resize(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.TextureFormat QPYX_arg2_YXQP = (UnityEngine.TextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.TextureFormat));
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Resize(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.Resize");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Compress_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.Compress(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PackTextures_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Texture2D[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Texture2D>(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Rect[] QPYX_o_YXQP = QPYX_obj_YXQP.PackTextures(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Texture2D[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Texture2D>(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Rect[] QPYX_o_YXQP = QPYX_obj_YXQP.PackTextures(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Texture2D[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Texture2D>(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				UnityEngine.Rect[] QPYX_o_YXQP = QPYX_obj_YXQP.PackTextures(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.PackTextures");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GenerateAtlas_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.Vector2[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector2>(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			System.Collections.Generic.List<UnityEngine.Rect> QPYX_arg3_YXQP = (System.Collections.Generic.List<UnityEngine.Rect>)ToLua.CheckObject(L_YXQP, 4, typeof(System.Collections.Generic.List<UnityEngine.Rect>));
			bool QPYX_o_YXQP = UnityEngine.Texture2D.GenerateAtlas(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReadPixels_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				QPYX_obj_YXQP.ReadPixels(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Texture2D  QPYX_obj_YXQP  = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				QPYX_obj_YXQP.ReadPixels(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Texture2D.ReadPixels");
			}
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
	static int QPYX_get_mipmapCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture2D QPYX_obj_YXQP = (UnityEngine.Texture2D)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.mipmapCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mipmapCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_format_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture2D QPYX_obj_YXQP = (UnityEngine.Texture2D)QPYX_o_YXQP;
			UnityEngine.TextureFormat QPYX_ret_YXQP = QPYX_obj_YXQP.format;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index format on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_whiteTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.Texture2D.whiteTexture);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_blackTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.Texture2D.blackTexture);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

