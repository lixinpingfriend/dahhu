using System;
using LuaInterface;

public class QPYX_BestHTTP_HTTPResponseWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(BestHTTP.HTTPResponse), typeof(System.Object));
		L_YXQP.RegFunction("GetHeaderValues", QPYX_GetHeaderValues_YXQP);
		L_YXQP.RegFunction("GetFirstHeaderValue", QPYX_GetFirstHeaderValue_YXQP);
		L_YXQP.RegFunction("HasHeaderWithValue", QPYX_HasHeaderWithValue_YXQP);
		L_YXQP.RegFunction("HasHeader", QPYX_HasHeader_YXQP);
		L_YXQP.RegFunction("GetRange", QPYX_GetRange_YXQP);
		L_YXQP.RegFunction("ReadTo", QPYX_ReadTo_YXQP);
		L_YXQP.RegFunction("NoTrimReadTo", QPYX_NoTrimReadTo_YXQP);
		L_YXQP.RegFunction("GetStreamedFragments", QPYX_GetStreamedFragments_YXQP);
		L_YXQP.RegFunction("Dispose", QPYX_Dispose_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegConstant("MinBufferSize", 4096);
		L_YXQP.RegVar("VersionMajor", QPYX_get_VersionMajor_YXQP, null);
		L_YXQP.RegVar("VersionMinor", QPYX_get_VersionMinor_YXQP, null);
		L_YXQP.RegVar("StatusCode", QPYX_get_StatusCode_YXQP, null);
		L_YXQP.RegVar("IsSuccess", QPYX_get_IsSuccess_YXQP, null);
		L_YXQP.RegVar("Message", QPYX_get_Message_YXQP, null);
		L_YXQP.RegVar("IsStreamed", QPYX_get_IsStreamed_YXQP, null);
		L_YXQP.RegVar("IsStreamingFinished", QPYX_get_IsStreamingFinished_YXQP, null);
		L_YXQP.RegVar("Headers", QPYX_get_Headers_YXQP, null);
		L_YXQP.RegVar("Data", QPYX_get_Data_YXQP, null);
		L_YXQP.RegVar("IsUpgraded", QPYX_get_IsUpgraded_YXQP, null);
		L_YXQP.RegVar("DataAsText", QPYX_get_DataAsText_YXQP, null);
		L_YXQP.RegVar("DataAsTexture2D", QPYX_get_DataAsTexture2D_YXQP, null);
		L_YXQP.RegVar("IsClosedManually", QPYX_get_IsClosedManually_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetHeaderValues_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPResponse  QPYX_obj_YXQP  = (BestHTTP.HTTPResponse)ToLua.CheckObject<BestHTTP.HTTPResponse>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			System.Collections.Generic.List<string> QPYX_o_YXQP = QPYX_obj_YXQP.GetHeaderValues(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFirstHeaderValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPResponse  QPYX_obj_YXQP  = (BestHTTP.HTTPResponse)ToLua.CheckObject<BestHTTP.HTTPResponse>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetFirstHeaderValue(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HasHeaderWithValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			BestHTTP.HTTPResponse  QPYX_obj_YXQP  = (BestHTTP.HTTPResponse)ToLua.CheckObject<BestHTTP.HTTPResponse>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.HasHeaderWithValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HasHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPResponse  QPYX_obj_YXQP  = (BestHTTP.HTTPResponse)ToLua.CheckObject<BestHTTP.HTTPResponse>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.HasHeader(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetRange_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPResponse  QPYX_obj_YXQP  = (BestHTTP.HTTPResponse)ToLua.CheckObject<BestHTTP.HTTPResponse>(L_YXQP, 1);
			BestHTTP.HTTPRange QPYX_o_YXQP = QPYX_obj_YXQP.GetRange();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReadTo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				byte QPYX_arg1_YXQP = (byte)LuaDLL.luaL_checknumber(L_YXQP, 2);
				string QPYX_o_YXQP = BestHTTP.HTTPResponse.ReadTo(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				byte QPYX_arg1_YXQP = (byte)LuaDLL.luaL_checknumber(L_YXQP, 2);
				byte QPYX_arg2_YXQP = (byte)LuaDLL.luaL_checknumber(L_YXQP, 3);
				string QPYX_o_YXQP = BestHTTP.HTTPResponse.ReadTo(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: BestHTTP.HTTPResponse.ReadTo");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_NoTrimReadTo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
			byte QPYX_arg1_YXQP = (byte)LuaDLL.luaL_checknumber(L_YXQP, 2);
			byte QPYX_arg2_YXQP = (byte)LuaDLL.luaL_checknumber(L_YXQP, 3);
			string QPYX_o_YXQP = BestHTTP.HTTPResponse.NoTrimReadTo(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetStreamedFragments_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPResponse  QPYX_obj_YXQP  = (BestHTTP.HTTPResponse)ToLua.CheckObject<BestHTTP.HTTPResponse>(L_YXQP, 1);
			System.Collections.Generic.List<byte[]> QPYX_o_YXQP = QPYX_obj_YXQP.GetStreamedFragments();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
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
			BestHTTP.HTTPResponse  QPYX_obj_YXQP  = (BestHTTP.HTTPResponse)ToLua.CheckObject<BestHTTP.HTTPResponse>(L_YXQP, 1);
			QPYX_obj_YXQP.Dispose();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_VersionMajor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.VersionMajor;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index VersionMajor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_VersionMinor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.VersionMinor;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index VersionMinor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_StatusCode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.StatusCode;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index StatusCode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_IsSuccess_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsSuccess;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsSuccess on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Message_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.Message;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Message on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_IsStreamed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsStreamed;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsStreamed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_IsStreamingFinished_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsStreamingFinished;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsStreamingFinished on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Headers_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,System.Collections.Generic.List<string>> QPYX_ret_YXQP = QPYX_obj_YXQP.Headers;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Headers on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Data_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.Data;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Data on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_IsUpgraded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsUpgraded;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsUpgraded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_DataAsText_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.DataAsText;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index DataAsText on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_DataAsTexture2D_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			UnityEngine.Texture2D QPYX_ret_YXQP = QPYX_obj_YXQP.DataAsTexture2D;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index DataAsTexture2D on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_IsClosedManually_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPResponse QPYX_obj_YXQP = (BestHTTP.HTTPResponse)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsClosedManually;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsClosedManually on a nil value");
		}
	}
}

