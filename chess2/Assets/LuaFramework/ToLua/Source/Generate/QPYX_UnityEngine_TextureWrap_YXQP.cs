using System;
using LuaInterface;

public class QPYX_UnityEngine_TextureWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Texture), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("SetGlobalAnisotropicFilteringLimits", QPYX_SetGlobalAnisotropicFilteringLimits_YXQP);
		L_YXQP.RegFunction("GetNativeTexturePtr", QPYX_GetNativeTexturePtr_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Texture_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("masterTextureLimit", QPYX_get_masterTextureLimit_YXQP, QPYX_set_masterTextureLimit_YXQP);
		L_YXQP.RegVar("anisotropicFiltering", QPYX_get_anisotropicFiltering_YXQP, QPYX_set_anisotropicFiltering_YXQP);
		L_YXQP.RegVar("width", QPYX_get_width_YXQP, QPYX_set_width_YXQP);
		L_YXQP.RegVar("height", QPYX_get_height_YXQP, QPYX_set_height_YXQP);
		L_YXQP.RegVar("dimension", QPYX_get_dimension_YXQP, QPYX_set_dimension_YXQP);
		L_YXQP.RegVar("filterMode", QPYX_get_filterMode_YXQP, QPYX_set_filterMode_YXQP);
		L_YXQP.RegVar("anisoLevel", QPYX_get_anisoLevel_YXQP, QPYX_set_anisoLevel_YXQP);
		L_YXQP.RegVar("wrapMode", QPYX_get_wrapMode_YXQP, QPYX_set_wrapMode_YXQP);
		L_YXQP.RegVar("wrapModeU", QPYX_get_wrapModeU_YXQP, QPYX_set_wrapModeU_YXQP);
		L_YXQP.RegVar("wrapModeV", QPYX_get_wrapModeV_YXQP, QPYX_set_wrapModeV_YXQP);
		L_YXQP.RegVar("wrapModeW", QPYX_get_wrapModeW_YXQP, QPYX_set_wrapModeW_YXQP);
		L_YXQP.RegVar("mipMapBias", QPYX_get_mipMapBias_YXQP, QPYX_set_mipMapBias_YXQP);
		L_YXQP.RegVar("texelSize", QPYX_get_texelSize_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Texture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Texture QPYX_obj_YXQP = new UnityEngine.Texture();
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Texture.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetGlobalAnisotropicFilteringLimits_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Texture.SetGlobalAnisotropicFilteringLimits(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetNativeTexturePtr_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Texture  QPYX_obj_YXQP  = (UnityEngine.Texture)ToLua.CheckObject<UnityEngine.Texture>(L_YXQP, 1);
			System.IntPtr QPYX_o_YXQP = QPYX_obj_YXQP.GetNativeTexturePtr();
			LuaDLL.lua_pushlightuserdata(L_YXQP, QPYX_o_YXQP);
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
	static int QPYX_get_masterTextureLimit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Texture.masterTextureLimit);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anisotropicFiltering_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Texture.anisotropicFiltering);
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.height;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dimension_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.Rendering.TextureDimension QPYX_ret_YXQP = QPYX_obj_YXQP.dimension;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dimension on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_filterMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.FilterMode QPYX_ret_YXQP = QPYX_obj_YXQP.filterMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index filterMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anisoLevel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.anisoLevel;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anisoLevel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wrapMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_ret_YXQP = QPYX_obj_YXQP.wrapMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wrapModeU_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_ret_YXQP = QPYX_obj_YXQP.wrapModeU;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapModeU on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wrapModeV_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_ret_YXQP = QPYX_obj_YXQP.wrapModeV;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapModeV on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wrapModeW_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_ret_YXQP = QPYX_obj_YXQP.wrapModeW;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapModeW on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mipMapBias_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.mipMapBias;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mipMapBias on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_texelSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.texelSize;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index texelSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_masterTextureLimit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Texture.masterTextureLimit = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_anisotropicFiltering_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.AnisotropicFiltering QPYX_arg0_YXQP = (UnityEngine.AnisotropicFiltering)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnisotropicFiltering));
			UnityEngine.Texture.anisotropicFiltering = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_width_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.height = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index height on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_dimension_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.Rendering.TextureDimension QPYX_arg0_YXQP = (UnityEngine.Rendering.TextureDimension)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.TextureDimension));
			QPYX_obj_YXQP.dimension = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dimension on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_filterMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.FilterMode QPYX_arg0_YXQP = (UnityEngine.FilterMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.FilterMode));
			QPYX_obj_YXQP.filterMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index filterMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_anisoLevel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.anisoLevel = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index anisoLevel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wrapMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_arg0_YXQP = (UnityEngine.TextureWrapMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.TextureWrapMode));
			QPYX_obj_YXQP.wrapMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wrapModeU_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_arg0_YXQP = (UnityEngine.TextureWrapMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.TextureWrapMode));
			QPYX_obj_YXQP.wrapModeU = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapModeU on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wrapModeV_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_arg0_YXQP = (UnityEngine.TextureWrapMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.TextureWrapMode));
			QPYX_obj_YXQP.wrapModeV = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapModeV on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wrapModeW_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			UnityEngine.TextureWrapMode QPYX_arg0_YXQP = (UnityEngine.TextureWrapMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.TextureWrapMode));
			QPYX_obj_YXQP.wrapModeW = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapModeW on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mipMapBias_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Texture QPYX_obj_YXQP = (UnityEngine.Texture)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.mipMapBias = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mipMapBias on a nil value");
		}
	}
}

