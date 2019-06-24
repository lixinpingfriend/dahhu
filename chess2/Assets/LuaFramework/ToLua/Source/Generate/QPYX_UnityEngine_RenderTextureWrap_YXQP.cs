using System;
using LuaInterface;

public class QPYX_UnityEngine_RenderTextureWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.RenderTexture), typeof(UnityEngine.Texture));
		L_YXQP.RegFunction("GetTemporary", QPYX_GetTemporary_YXQP);
		L_YXQP.RegFunction("ReleaseTemporary", QPYX_ReleaseTemporary_YXQP);
		L_YXQP.RegFunction("ResolveAntiAliasedSurface", QPYX_ResolveAntiAliasedSurface_YXQP);
		L_YXQP.RegFunction("Create", QPYX_Create_YXQP);
		L_YXQP.RegFunction("Release", QPYX_Release_YXQP);
		L_YXQP.RegFunction("IsCreated", QPYX_IsCreated_YXQP);
		L_YXQP.RegFunction("DiscardContents", QPYX_DiscardContents_YXQP);
		L_YXQP.RegFunction("MarkRestoreExpected", QPYX_MarkRestoreExpected_YXQP);
		L_YXQP.RegFunction("GenerateMips", QPYX_GenerateMips_YXQP);
		L_YXQP.RegFunction("GetNativeDepthBufferPtr", QPYX_GetNativeDepthBufferPtr_YXQP);
		L_YXQP.RegFunction("SetGlobalShaderProperty", QPYX_SetGlobalShaderProperty_YXQP);
		L_YXQP.RegFunction("SupportsStencil", QPYX_SupportsStencil_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_RenderTexture_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("width", QPYX_get_width_YXQP, QPYX_set_width_YXQP);
		L_YXQP.RegVar("height", QPYX_get_height_YXQP, QPYX_set_height_YXQP);
		L_YXQP.RegVar("vrUsage", QPYX_get_vrUsage_YXQP, QPYX_set_vrUsage_YXQP);
		L_YXQP.RegVar("depth", QPYX_get_depth_YXQP, QPYX_set_depth_YXQP);
		L_YXQP.RegVar("isPowerOfTwo", QPYX_get_isPowerOfTwo_YXQP, QPYX_set_isPowerOfTwo_YXQP);
		L_YXQP.RegVar("sRGB", QPYX_get_sRGB_YXQP, null);
		L_YXQP.RegVar("format", QPYX_get_format_YXQP, QPYX_set_format_YXQP);
		L_YXQP.RegVar("useMipMap", QPYX_get_useMipMap_YXQP, QPYX_set_useMipMap_YXQP);
		L_YXQP.RegVar("autoGenerateMips", QPYX_get_autoGenerateMips_YXQP, QPYX_set_autoGenerateMips_YXQP);
		L_YXQP.RegVar("dimension", QPYX_get_dimension_YXQP, QPYX_set_dimension_YXQP);
		L_YXQP.RegVar("volumeDepth", QPYX_get_volumeDepth_YXQP, QPYX_set_volumeDepth_YXQP);
		L_YXQP.RegVar("memorylessMode", QPYX_get_memorylessMode_YXQP, QPYX_set_memorylessMode_YXQP);
		L_YXQP.RegVar("antiAliasing", QPYX_get_antiAliasing_YXQP, QPYX_set_antiAliasing_YXQP);
		L_YXQP.RegVar("bindTextureMS", QPYX_get_bindTextureMS_YXQP, QPYX_set_bindTextureMS_YXQP);
		L_YXQP.RegVar("enableRandomWrite", QPYX_get_enableRandomWrite_YXQP, QPYX_set_enableRandomWrite_YXQP);
		L_YXQP.RegVar("useDynamicScale", QPYX_get_useDynamicScale_YXQP, QPYX_set_useDynamicScale_YXQP);
		L_YXQP.RegVar("colorBuffer", QPYX_get_colorBuffer_YXQP, null);
		L_YXQP.RegVar("depthBuffer", QPYX_get_depthBuffer_YXQP, null);
		L_YXQP.RegVar("active", QPYX_get_active_YXQP, QPYX_set_active_YXQP);
		L_YXQP.RegVar("descriptor", QPYX_get_descriptor_YXQP, QPYX_set_descriptor_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_RenderTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.RenderTextureDescriptor>(L_YXQP, 1))
			{
				UnityEngine.RenderTextureDescriptor QPYX_arg0_YXQP = StackTraits<UnityEngine.RenderTextureDescriptor>.To(L_YXQP, 1);
				UnityEngine.RenderTexture QPYX_obj_YXQP = new UnityEngine.RenderTexture(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.RenderTexture>(L_YXQP, 1))
			{
				UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.RenderTexture QPYX_obj_YXQP = new UnityEngine.RenderTexture(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTexture QPYX_obj_YXQP = new UnityEngine.RenderTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTexture QPYX_obj_YXQP = new UnityEngine.RenderTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTextureReadWrite QPYX_arg4_YXQP = (UnityEngine.RenderTextureReadWrite)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.RenderTextureReadWrite));
				UnityEngine.RenderTexture QPYX_obj_YXQP = new UnityEngine.RenderTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.RenderTexture.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTemporary_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.RenderTextureDescriptor QPYX_arg0_YXQP = StackTraits<UnityEngine.RenderTextureDescriptor>.Check(L_YXQP, 1);
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTextureReadWrite QPYX_arg4_YXQP = (UnityEngine.RenderTextureReadWrite)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.RenderTextureReadWrite));
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTextureReadWrite QPYX_arg4_YXQP = (UnityEngine.RenderTextureReadWrite)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.RenderTextureReadWrite));
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTextureReadWrite QPYX_arg4_YXQP = (UnityEngine.RenderTextureReadWrite)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.RenderTextureReadWrite));
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.RenderTextureMemoryless QPYX_arg6_YXQP = (UnityEngine.RenderTextureMemoryless)ToLua.CheckObject(L_YXQP, 7, typeof(UnityEngine.RenderTextureMemoryless));
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 8)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTextureReadWrite QPYX_arg4_YXQP = (UnityEngine.RenderTextureReadWrite)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.RenderTextureReadWrite));
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.RenderTextureMemoryless QPYX_arg6_YXQP = (UnityEngine.RenderTextureMemoryless)ToLua.CheckObject(L_YXQP, 7, typeof(UnityEngine.RenderTextureMemoryless));
				UnityEngine.VRTextureUsage QPYX_arg7_YXQP = (UnityEngine.VRTextureUsage)ToLua.CheckObject(L_YXQP, 8, typeof(UnityEngine.VRTextureUsage));
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 9)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.RenderTextureFormat QPYX_arg3_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.RenderTextureFormat));
				UnityEngine.RenderTextureReadWrite QPYX_arg4_YXQP = (UnityEngine.RenderTextureReadWrite)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.RenderTextureReadWrite));
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.RenderTextureMemoryless QPYX_arg6_YXQP = (UnityEngine.RenderTextureMemoryless)ToLua.CheckObject(L_YXQP, 7, typeof(UnityEngine.RenderTextureMemoryless));
				UnityEngine.VRTextureUsage QPYX_arg7_YXQP = (UnityEngine.VRTextureUsage)ToLua.CheckObject(L_YXQP, 8, typeof(UnityEngine.VRTextureUsage));
				bool QPYX_arg8_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 9);
				UnityEngine.RenderTexture QPYX_o_YXQP = UnityEngine.RenderTexture.GetTemporary(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP, QPYX_arg8_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.RenderTexture.GetTemporary");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReleaseTemporary_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			UnityEngine.RenderTexture.ReleaseTemporary(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResolveAntiAliasedSurface_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
				QPYX_obj_YXQP.ResolveAntiAliasedSurface();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
				UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 2);
				QPYX_obj_YXQP.ResolveAntiAliasedSurface(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.RenderTexture.ResolveAntiAliasedSurface");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Create_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.Create();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Release_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			QPYX_obj_YXQP.Release();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsCreated_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsCreated();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DiscardContents_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
				QPYX_obj_YXQP.DiscardContents();
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.DiscardContents(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.RenderTexture.DiscardContents");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MarkRestoreExpected_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			QPYX_obj_YXQP.MarkRestoreExpected();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GenerateMips_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			QPYX_obj_YXQP.GenerateMips();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetNativeDepthBufferPtr_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			System.IntPtr QPYX_o_YXQP = QPYX_obj_YXQP.GetNativeDepthBufferPtr();
			LuaDLL.lua_pushlightuserdata(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetGlobalShaderProperty_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.RenderTexture  QPYX_obj_YXQP  = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.SetGlobalShaderProperty(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SupportsStencil_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.RenderTexture.SupportsStencil(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
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
	static int QPYX_get_width_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.width;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index width on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_height_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.height;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_vrUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.VRTextureUsage QPYX_ret_YXQP = QPYX_obj_YXQP.vrUsage;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index vrUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_depth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.depth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isPowerOfTwo_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isPowerOfTwo;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isPowerOfTwo on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sRGB_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.sRGB;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sRGB on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_format_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderTextureFormat QPYX_ret_YXQP = QPYX_obj_YXQP.format;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index format on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useMipMap_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useMipMap;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useMipMap on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoGenerateMips_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.autoGenerateMips;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoGenerateMips on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dimension_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.Rendering.TextureDimension QPYX_ret_YXQP = QPYX_obj_YXQP.dimension;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dimension on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_volumeDepth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.volumeDepth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index volumeDepth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_memorylessMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderTextureMemoryless QPYX_ret_YXQP = QPYX_obj_YXQP.memorylessMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index memorylessMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_antiAliasing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.antiAliasing;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index antiAliasing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bindTextureMS_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.bindTextureMS;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bindTextureMS on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_enableRandomWrite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.enableRandomWrite;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enableRandomWrite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useDynamicScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useDynamicScale;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useDynamicScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_colorBuffer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderBuffer QPYX_ret_YXQP = QPYX_obj_YXQP.colorBuffer;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index colorBuffer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_depthBuffer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderBuffer QPYX_ret_YXQP = QPYX_obj_YXQP.depthBuffer;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depthBuffer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_active_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderTexture.active);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_descriptor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderTextureDescriptor QPYX_ret_YXQP = QPYX_obj_YXQP.descriptor;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index descriptor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_width_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.width = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index width on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_height_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.height = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_vrUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.VRTextureUsage QPYX_arg0_YXQP = (UnityEngine.VRTextureUsage)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.VRTextureUsage));
			QPYX_obj_YXQP.vrUsage = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index vrUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_depth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.depth = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isPowerOfTwo_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isPowerOfTwo = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isPowerOfTwo on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_format_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderTextureFormat QPYX_arg0_YXQP = (UnityEngine.RenderTextureFormat)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RenderTextureFormat));
			QPYX_obj_YXQP.format = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index format on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useMipMap_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useMipMap = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useMipMap on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoGenerateMips_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.autoGenerateMips = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoGenerateMips on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_dimension_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.Rendering.TextureDimension QPYX_arg0_YXQP = (UnityEngine.Rendering.TextureDimension)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.TextureDimension));
			QPYX_obj_YXQP.dimension = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dimension on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_volumeDepth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.volumeDepth = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index volumeDepth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_memorylessMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderTextureMemoryless QPYX_arg0_YXQP = (UnityEngine.RenderTextureMemoryless)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RenderTextureMemoryless));
			QPYX_obj_YXQP.memorylessMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index memorylessMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_antiAliasing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.antiAliasing = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index antiAliasing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bindTextureMS_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.bindTextureMS = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bindTextureMS on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_enableRandomWrite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.enableRandomWrite = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enableRandomWrite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useDynamicScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useDynamicScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useDynamicScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_active_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 2);
			UnityEngine.RenderTexture.active = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_descriptor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.RenderTexture QPYX_obj_YXQP = (UnityEngine.RenderTexture)QPYX_o_YXQP;
			UnityEngine.RenderTextureDescriptor QPYX_arg0_YXQP = StackTraits<UnityEngine.RenderTextureDescriptor>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.descriptor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index descriptor on a nil value");
		}
	}
}

