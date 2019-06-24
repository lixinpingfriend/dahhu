using System;
using LuaInterface;

public class QPYX_WWWOperationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(WWWOperation), typeof(System.Object));
		L_YXQP.RegFunction("Subscribe", QPYX_Subscribe_YXQP);
		L_YXQP.RegFunction("SubscribeWithProgress", QPYX_SubscribeWithProgress_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateWWWOperation_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("www", QPYX_get_www_YXQP, QPYX_set_www_YXQP);
		L_YXQP.RegVar("webRequest", QPYX_get_webRequest_YXQP, QPYX_set_webRequest_YXQP);
		L_YXQP.RegVar("error", QPYX_get_error_YXQP, null);
		L_YXQP.RegVar("text", QPYX_get_text_YXQP, null);
		L_YXQP.RegVar("texture", QPYX_get_texture_YXQP, null);
		L_YXQP.RegVar("isBreak", QPYX_get_isBreak_YXQP, QPYX_set_isBreak_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateWWWOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				WWWOperation QPYX_obj_YXQP = new WWWOperation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: WWWOperation.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Subscribe_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				WWWOperation  QPYX_obj_YXQP  = (WWWOperation)ToLua.CheckObject<WWWOperation>(L_YXQP, 1);
				System.Action<WWWOperation> QPYX_arg0_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 2);
				WWWOperation QPYX_o_YXQP = QPYX_obj_YXQP.Subscribe(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				WWWOperation  QPYX_obj_YXQP  = (WWWOperation)ToLua.CheckObject<WWWOperation>(L_YXQP, 1);
				System.Action<WWWOperation> QPYX_arg0_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 2);
				System.Action<WWWOperation> QPYX_arg1_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 3);
				WWWOperation QPYX_o_YXQP = QPYX_obj_YXQP.Subscribe(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WWWOperation.Subscribe");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SubscribeWithProgress_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				WWWOperation  QPYX_obj_YXQP  = (WWWOperation)ToLua.CheckObject<WWWOperation>(L_YXQP, 1);
				System.Action<WWWOperation> QPYX_arg0_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 2);
				WWWOperation QPYX_o_YXQP = QPYX_obj_YXQP.SubscribeWithProgress(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				WWWOperation  QPYX_obj_YXQP  = (WWWOperation)ToLua.CheckObject<WWWOperation>(L_YXQP, 1);
				System.Action<WWWOperation> QPYX_arg0_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 2);
				System.Action<WWWOperation> QPYX_arg1_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 3);
				WWWOperation QPYX_o_YXQP = QPYX_obj_YXQP.SubscribeWithProgress(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				WWWOperation  QPYX_obj_YXQP  = (WWWOperation)ToLua.CheckObject<WWWOperation>(L_YXQP, 1);
				System.Action<WWWOperation> QPYX_arg0_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 2);
				System.Action<WWWOperation> QPYX_arg1_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 3);
				System.Action<WWWOperation> QPYX_arg2_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 4);
				WWWOperation QPYX_o_YXQP = QPYX_obj_YXQP.SubscribeWithProgress(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WWWOperation.SubscribeWithProgress");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_www_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			UnityEngine.WWW QPYX_ret_YXQP = QPYX_obj_YXQP.www;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index www on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_webRequest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			UnityEngine.Networking.UnityWebRequest QPYX_ret_YXQP = QPYX_obj_YXQP.webRequest;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index webRequest on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_error_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.error;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index error on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_text_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			UnityEngine.Texture QPYX_ret_YXQP = QPYX_obj_YXQP.texture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index texture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isBreak_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isBreak;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isBreak on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_www_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			UnityEngine.WWW QPYX_arg0_YXQP = (UnityEngine.WWW)ToLua.CheckObject<UnityEngine.WWW>(L_YXQP, 2);
			QPYX_obj_YXQP.www = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index www on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_webRequest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			UnityEngine.Networking.UnityWebRequest QPYX_arg0_YXQP = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 2);
			QPYX_obj_YXQP.webRequest = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index webRequest on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isBreak_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			WWWOperation QPYX_obj_YXQP = (WWWOperation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isBreak = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isBreak on a nil value");
		}
	}
}

