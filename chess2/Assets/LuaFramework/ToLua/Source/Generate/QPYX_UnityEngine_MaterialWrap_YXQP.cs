using System;
using LuaInterface;

public class QPYX_UnityEngine_MaterialWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Material), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("HasProperty", QPYX_HasProperty_YXQP);
		L_YXQP.RegFunction("GetTag", QPYX_GetTag_YXQP);
		L_YXQP.RegFunction("SetOverrideTag", QPYX_SetOverrideTag_YXQP);
		L_YXQP.RegFunction("SetShaderPassEnabled", QPYX_SetShaderPassEnabled_YXQP);
		L_YXQP.RegFunction("GetShaderPassEnabled", QPYX_GetShaderPassEnabled_YXQP);
		L_YXQP.RegFunction("Lerp", QPYX_Lerp_YXQP);
		L_YXQP.RegFunction("SetPass", QPYX_SetPass_YXQP);
		L_YXQP.RegFunction("GetPassName", QPYX_GetPassName_YXQP);
		L_YXQP.RegFunction("FindPass", QPYX_FindPass_YXQP);
		L_YXQP.RegFunction("CopyPropertiesFromMaterial", QPYX_CopyPropertiesFromMaterial_YXQP);
		L_YXQP.RegFunction("EnableKeyword", QPYX_EnableKeyword_YXQP);
		L_YXQP.RegFunction("DisableKeyword", QPYX_DisableKeyword_YXQP);
		L_YXQP.RegFunction("IsKeywordEnabled", QPYX_IsKeywordEnabled_YXQP);
		L_YXQP.RegFunction("SetFloat", QPYX_SetFloat_YXQP);
		L_YXQP.RegFunction("SetInt", QPYX_SetInt_YXQP);
		L_YXQP.RegFunction("SetColor", QPYX_SetColor_YXQP);
		L_YXQP.RegFunction("SetVector", QPYX_SetVector_YXQP);
		L_YXQP.RegFunction("SetMatrix", QPYX_SetMatrix_YXQP);
		L_YXQP.RegFunction("SetTexture", QPYX_SetTexture_YXQP);
		L_YXQP.RegFunction("SetBuffer", QPYX_SetBuffer_YXQP);
		L_YXQP.RegFunction("SetTextureOffset", QPYX_SetTextureOffset_YXQP);
		L_YXQP.RegFunction("SetTextureScale", QPYX_SetTextureScale_YXQP);
		L_YXQP.RegFunction("SetFloatArray", QPYX_SetFloatArray_YXQP);
		L_YXQP.RegFunction("SetColorArray", QPYX_SetColorArray_YXQP);
		L_YXQP.RegFunction("SetVectorArray", QPYX_SetVectorArray_YXQP);
		L_YXQP.RegFunction("SetMatrixArray", QPYX_SetMatrixArray_YXQP);
		L_YXQP.RegFunction("GetFloat", QPYX_GetFloat_YXQP);
		L_YXQP.RegFunction("GetInt", QPYX_GetInt_YXQP);
		L_YXQP.RegFunction("GetColor", QPYX_GetColor_YXQP);
		L_YXQP.RegFunction("GetVector", QPYX_GetVector_YXQP);
		L_YXQP.RegFunction("GetMatrix", QPYX_GetMatrix_YXQP);
		L_YXQP.RegFunction("GetFloatArray", QPYX_GetFloatArray_YXQP);
		L_YXQP.RegFunction("GetVectorArray", QPYX_GetVectorArray_YXQP);
		L_YXQP.RegFunction("GetColorArray", QPYX_GetColorArray_YXQP);
		L_YXQP.RegFunction("GetMatrixArray", QPYX_GetMatrixArray_YXQP);
		L_YXQP.RegFunction("GetTexture", QPYX_GetTexture_YXQP);
		L_YXQP.RegFunction("GetTextureOffset", QPYX_GetTextureOffset_YXQP);
		L_YXQP.RegFunction("GetTextureScale", QPYX_GetTextureScale_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Material_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("shader", QPYX_get_shader_YXQP, QPYX_set_shader_YXQP);
		L_YXQP.RegVar("color", QPYX_get_color_YXQP, QPYX_set_color_YXQP);
		L_YXQP.RegVar("mainTexture", QPYX_get_mainTexture_YXQP, QPYX_set_mainTexture_YXQP);
		L_YXQP.RegVar("mainTextureOffset", QPYX_get_mainTextureOffset_YXQP, QPYX_set_mainTextureOffset_YXQP);
		L_YXQP.RegVar("mainTextureScale", QPYX_get_mainTextureScale_YXQP, QPYX_set_mainTextureScale_YXQP);
		L_YXQP.RegVar("passCount", QPYX_get_passCount_YXQP, null);
		L_YXQP.RegVar("renderQueue", QPYX_get_renderQueue_YXQP, QPYX_set_renderQueue_YXQP);
		L_YXQP.RegVar("shaderKeywords", QPYX_get_shaderKeywords_YXQP, QPYX_set_shaderKeywords_YXQP);
		L_YXQP.RegVar("globalIlluminationFlags", QPYX_get_globalIlluminationFlags_YXQP, QPYX_set_globalIlluminationFlags_YXQP);
		L_YXQP.RegVar("enableInstancing", QPYX_get_enableInstancing_YXQP, QPYX_set_enableInstancing_YXQP);
		L_YXQP.RegVar("doubleSidedGI", QPYX_get_doubleSidedGI_YXQP, QPYX_set_doubleSidedGI_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Material_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.Material>(L_YXQP, 1))
			{
				UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.Material QPYX_obj_YXQP = new UnityEngine.Material(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.Shader>(L_YXQP, 1))
			{
				UnityEngine.Shader QPYX_arg0_YXQP = (UnityEngine.Shader)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.Material QPYX_obj_YXQP = new UnityEngine.Material(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Material.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HasProperty_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.HasProperty(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.HasProperty(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.HasProperty");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_o_YXQP = QPYX_obj_YXQP.GetTag(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				string QPYX_o_YXQP = QPYX_obj_YXQP.GetTag(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetTag");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetOverrideTag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.SetOverrideTag(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetShaderPassEnabled_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			QPYX_obj_YXQP.SetShaderPassEnabled(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetShaderPassEnabled_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.GetShaderPassEnabled(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Lerp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			UnityEngine.Material QPYX_arg1_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 3);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			QPYX_obj_YXQP.Lerp(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPass_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.SetPass(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPassName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetPassName(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindPass_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.FindPass(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CopyPropertiesFromMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.CopyPropertiesFromMaterial(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableKeyword_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.EnableKeyword(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DisableKeyword_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DisableKeyword(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsKeywordEnabled_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsKeywordEnabled(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, float>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, float>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetFloat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetInt_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetInt(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetInt(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetInt");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Color>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Color QPYX_arg1_YXQP = ToLua.ToColor(L_YXQP, 3);
				QPYX_obj_YXQP.SetColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Color>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Color QPYX_arg1_YXQP = ToLua.ToColor(L_YXQP, 3);
				QPYX_obj_YXQP.SetColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetColor");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetVector_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Vector4>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector4 QPYX_arg1_YXQP = ToLua.ToVector4(L_YXQP, 3);
				QPYX_obj_YXQP.SetVector(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Vector4>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector4 QPYX_arg1_YXQP = ToLua.ToVector4(L_YXQP, 3);
				QPYX_obj_YXQP.SetVector(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetVector");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Matrix4x4>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Matrix4x4 QPYX_arg1_YXQP = StackTraits<UnityEngine.Matrix4x4>.To(L_YXQP, 3);
				QPYX_obj_YXQP.SetMatrix(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Matrix4x4>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Matrix4x4 QPYX_arg1_YXQP = StackTraits<UnityEngine.Matrix4x4>.To(L_YXQP, 3);
				QPYX_obj_YXQP.SetMatrix(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetMatrix");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Texture>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Texture QPYX_arg1_YXQP = (UnityEngine.Texture)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Texture>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Texture QPYX_arg1_YXQP = (UnityEngine.Texture)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetTexture");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBuffer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.ComputeBuffer>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.ComputeBuffer QPYX_arg1_YXQP = (UnityEngine.ComputeBuffer)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetBuffer(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.ComputeBuffer>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.ComputeBuffer QPYX_arg1_YXQP = (UnityEngine.ComputeBuffer)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetBuffer(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetBuffer");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTextureOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Vector2>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 3);
				QPYX_obj_YXQP.SetTextureOffset(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Vector2>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 3);
				QPYX_obj_YXQP.SetTextureOffset(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetTextureOffset");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTextureScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Vector2>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 3);
				QPYX_obj_YXQP.SetTextureScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Vector2>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg1_YXQP = ToLua.ToVector2(L_YXQP, 3);
				QPYX_obj_YXQP.SetTextureScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetTextureScale");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetFloatArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, float[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float[] QPYX_arg1_YXQP = ToLua.ToNumberArray<float>(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloatArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, float[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float[] QPYX_arg1_YXQP = ToLua.ToNumberArray<float>(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloatArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<float>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<float> QPYX_arg1_YXQP = (System.Collections.Generic.List<float>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloatArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<float>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<float> QPYX_arg1_YXQP = (System.Collections.Generic.List<float>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloatArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetFloatArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetColorArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Color[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Color[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.Color>(L_YXQP, 3);
				QPYX_obj_YXQP.SetColorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Color[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Color[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.Color>(L_YXQP, 3);
				QPYX_obj_YXQP.SetColorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<UnityEngine.Color>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Color> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Color>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetColorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<UnityEngine.Color>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Color> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Color>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetColorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetColorArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetVectorArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Vector4[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector4[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.Vector4>(L_YXQP, 3);
				QPYX_obj_YXQP.SetVectorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Vector4[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector4[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.Vector4>(L_YXQP, 3);
				QPYX_obj_YXQP.SetVectorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<UnityEngine.Vector4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Vector4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Vector4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetVectorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<UnityEngine.Vector4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Vector4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Vector4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetVectorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetVectorArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMatrixArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Matrix4x4[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Matrix4x4[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.Matrix4x4>(L_YXQP, 3);
				QPYX_obj_YXQP.SetMatrixArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, UnityEngine.Matrix4x4[]>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Matrix4x4[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.Matrix4x4>(L_YXQP, 3);
				QPYX_obj_YXQP.SetMatrixArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<UnityEngine.Matrix4x4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Matrix4x4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Matrix4x4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetMatrixArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<UnityEngine.Matrix4x4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Matrix4x4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Matrix4x4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SetMatrixArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.SetMatrixArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_o_YXQP = QPYX_obj_YXQP.GetFloat(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_o_YXQP = QPYX_obj_YXQP.GetFloat(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetFloat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetInt_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetInt(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetInt(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetInt");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Color QPYX_o_YXQP = QPYX_obj_YXQP.GetColor(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Color QPYX_o_YXQP = QPYX_obj_YXQP.GetColor(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetColor");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetVector_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector4 QPYX_o_YXQP = QPYX_obj_YXQP.GetVector(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector4 QPYX_o_YXQP = QPYX_obj_YXQP.GetVector(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetVector");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Matrix4x4 QPYX_o_YXQP = QPYX_obj_YXQP.GetMatrix(QPYX_arg0_YXQP);
				ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Matrix4x4 QPYX_o_YXQP = QPYX_obj_YXQP.GetMatrix(QPYX_arg0_YXQP);
				ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetMatrix");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFloatArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float[] QPYX_o_YXQP = QPYX_obj_YXQP.GetFloatArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float[] QPYX_o_YXQP = QPYX_obj_YXQP.GetFloatArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<float>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<float> QPYX_arg1_YXQP = (System.Collections.Generic.List<float>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetFloatArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<float>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<float> QPYX_arg1_YXQP = (System.Collections.Generic.List<float>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetFloatArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetFloatArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetVectorArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector4[] QPYX_o_YXQP = QPYX_obj_YXQP.GetVectorArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector4[] QPYX_o_YXQP = QPYX_obj_YXQP.GetVectorArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<UnityEngine.Vector4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Vector4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Vector4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetVectorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<UnityEngine.Vector4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Vector4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Vector4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetVectorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetVectorArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetColorArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Color[] QPYX_o_YXQP = QPYX_obj_YXQP.GetColorArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Color[] QPYX_o_YXQP = QPYX_obj_YXQP.GetColorArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<UnityEngine.Color>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Color> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Color>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetColorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<UnityEngine.Color>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Color> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Color>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetColorArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetColorArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetMatrixArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Matrix4x4[] QPYX_o_YXQP = QPYX_obj_YXQP.GetMatrixArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Matrix4x4[] QPYX_o_YXQP = QPYX_obj_YXQP.GetMatrixArray(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, System.Collections.Generic.List<UnityEngine.Matrix4x4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Matrix4x4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Matrix4x4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetMatrixArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, System.Collections.Generic.List<UnityEngine.Matrix4x4>>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Matrix4x4> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Matrix4x4>)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.GetMatrixArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetMatrixArray");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Texture QPYX_o_YXQP = QPYX_obj_YXQP.GetTexture(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Texture QPYX_o_YXQP = QPYX_obj_YXQP.GetTexture(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetTexture");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTextureOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_o_YXQP = QPYX_obj_YXQP.GetTextureOffset(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_o_YXQP = QPYX_obj_YXQP.GetTextureOffset(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetTextureOffset");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTextureScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_o_YXQP = QPYX_obj_YXQP.GetTextureScale(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Material  QPYX_obj_YXQP  = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_o_YXQP = QPYX_obj_YXQP.GetTextureScale(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Material.GetTextureScale");
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
	static int QPYX_get_shader_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Shader QPYX_ret_YXQP = QPYX_obj_YXQP.shader;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shader on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_color_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.color;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index color on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mainTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_ret_YXQP = QPYX_obj_YXQP.mainTexture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mainTextureOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.mainTextureOffset;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTextureOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mainTextureScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.mainTextureScale;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTextureScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_passCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.passCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index passCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_renderQueue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.renderQueue;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderQueue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shaderKeywords_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			string[] QPYX_ret_YXQP = QPYX_obj_YXQP.shaderKeywords;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shaderKeywords on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_globalIlluminationFlags_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.MaterialGlobalIlluminationFlags QPYX_ret_YXQP = QPYX_obj_YXQP.globalIlluminationFlags;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index globalIlluminationFlags on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_enableInstancing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.enableInstancing;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enableInstancing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_doubleSidedGI_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.doubleSidedGI;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index doubleSidedGI on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shader_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Shader QPYX_arg0_YXQP = (UnityEngine.Shader)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Shader));
			QPYX_obj_YXQP.shader = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shader on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_color_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.color = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index color on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mainTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_arg0_YXQP = (UnityEngine.Texture)ToLua.CheckObject<UnityEngine.Texture>(L_YXQP, 2);
			QPYX_obj_YXQP.mainTexture = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mainTextureOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.mainTextureOffset = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTextureOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mainTextureScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.mainTextureScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainTextureScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_renderQueue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.renderQueue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderQueue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shaderKeywords_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			string[] QPYX_arg0_YXQP = ToLua.CheckStringArray(L_YXQP, 2);
			QPYX_obj_YXQP.shaderKeywords = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shaderKeywords on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_globalIlluminationFlags_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			UnityEngine.MaterialGlobalIlluminationFlags QPYX_arg0_YXQP = (UnityEngine.MaterialGlobalIlluminationFlags)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.MaterialGlobalIlluminationFlags));
			QPYX_obj_YXQP.globalIlluminationFlags = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index globalIlluminationFlags on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_enableInstancing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.enableInstancing = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enableInstancing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_doubleSidedGI_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Material QPYX_obj_YXQP = (UnityEngine.Material)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.doubleSidedGI = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index doubleSidedGI on a nil value");
		}
	}
}

