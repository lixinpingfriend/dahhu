using System;
using LuaInterface;

public class QPYX_UnityEngine_WWWFormWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.WWWForm), typeof(System.Object));
		L_YXQP.RegFunction("AddField", QPYX_AddField_YXQP);
		L_YXQP.RegFunction("AddBinaryData", QPYX_AddBinaryData_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_WWWForm_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("headers", QPYX_get_headers_YXQP, null);
		L_YXQP.RegVar("data", QPYX_get_data_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_WWWForm_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.WWWForm QPYX_obj_YXQP = new UnityEngine.WWWForm();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.WWWForm.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddField_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int>(L_YXQP, 3))
			{
				UnityEngine.WWWForm  QPYX_obj_YXQP  = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.AddField(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string>(L_YXQP, 3))
			{
				UnityEngine.WWWForm  QPYX_obj_YXQP  = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 3);
				QPYX_obj_YXQP.AddField(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.WWWForm  QPYX_obj_YXQP  = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				System.Text.Encoding QPYX_arg2_YXQP = (System.Text.Encoding)ToLua.CheckObject<System.Text.Encoding>(L_YXQP, 4);
				QPYX_obj_YXQP.AddField(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.WWWForm.AddField");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddBinaryData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.WWWForm  QPYX_obj_YXQP  = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
				QPYX_obj_YXQP.AddBinaryData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.WWWForm  QPYX_obj_YXQP  = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				QPYX_obj_YXQP.AddBinaryData(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.WWWForm  QPYX_obj_YXQP  = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				string QPYX_arg3_YXQP = ToLua.CheckString(L_YXQP, 5);
				QPYX_obj_YXQP.AddBinaryData(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.WWWForm.AddBinaryData");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_headers_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWWForm QPYX_obj_YXQP = (UnityEngine.WWWForm)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,string> QPYX_ret_YXQP = QPYX_obj_YXQP.headers;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index headers on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_data_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.WWWForm QPYX_obj_YXQP = (UnityEngine.WWWForm)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.data;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index data on a nil value");
		}
	}
}

