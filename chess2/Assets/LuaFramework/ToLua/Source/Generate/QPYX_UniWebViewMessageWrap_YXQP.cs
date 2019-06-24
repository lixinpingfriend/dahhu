using System;
using LuaInterface;

public class QPYX_UniWebViewMessageWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UniWebViewMessage), null);
		L_YXQP.RegFunction("New", QPYX__CreateUniWebViewMessage_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("rawMessage", QPYX_get_rawMessage_YXQP, null);
		L_YXQP.RegVar("scheme", QPYX_get_scheme_YXQP, null);
		L_YXQP.RegVar("path", QPYX_get_path_YXQP, null);
		L_YXQP.RegVar("args", QPYX_get_args_YXQP, null);
		L_YXQP.RegVar("table", QPYX_get_table_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUniWebViewMessage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UniWebViewMessage QPYX_obj_YXQP = new UniWebViewMessage(QPYX_arg0_YXQP);
				ToLua.PushValue(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 0)			{
				UniWebViewMessage QPYX_obj_YXQP = new UniWebViewMessage();
				ToLua.PushValue(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UniWebViewMessage.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rawMessage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewMessage QPYX_obj_YXQP = (UniWebViewMessage)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.rawMessage;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rawMessage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scheme_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewMessage QPYX_obj_YXQP = (UniWebViewMessage)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.scheme;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scheme on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_path_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewMessage QPYX_obj_YXQP = (UniWebViewMessage)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.path;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index path on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_args_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewMessage QPYX_obj_YXQP = (UniWebViewMessage)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,string> QPYX_ret_YXQP = QPYX_obj_YXQP.args;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index args on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_table_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UniWebViewMessage QPYX_obj_YXQP = (UniWebViewMessage)QPYX_o_YXQP;
			LuaInterface.LuaTable QPYX_ret_YXQP = QPYX_obj_YXQP.table;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index table on a nil value");
		}
	}
}

