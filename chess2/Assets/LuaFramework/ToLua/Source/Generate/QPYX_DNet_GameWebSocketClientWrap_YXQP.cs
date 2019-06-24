using System;
using LuaInterface;

public class QPYX_DNet_GameWebSocketClientWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DNet.GameWebSocketClient), typeof(System.Object));
		L_YXQP.RegFunction("Connect", QPYX_Connect_YXQP);
		L_YXQP.RegFunction("ResetMsgDataDecompresser", QPYX_ResetMsgDataDecompresser_YXQP);
		L_YXQP.RegFunction("SendBuffer", QPYX_SendBuffer_YXQP);
		L_YXQP.RegFunction("SendMessage", QPYX_SendMessage_YXQP);
		L_YXQP.RegFunction("SendBinary", QPYX_SendBinary_YXQP);
		L_YXQP.RegFunction("Dispose", QPYX_Dispose_YXQP);
		L_YXQP.RegFunction("Disconnect", QPYX_Disconnect_YXQP);
		L_YXQP.RegFunction("ForceDisconnect", QPYX_ForceDisconnect_YXQP);
		L_YXQP.RegFunction("CloseWebSocket", QPYX_CloseWebSocket_YXQP);
		L_YXQP.RegFunction("CloseWebSocketWithMsg", QPYX_CloseWebSocketWithMsg_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateDNet_GameWebSocketClient_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("onEventChangeFn", QPYX_get_onEventChangeFn_YXQP, QPYX_set_onEventChangeFn_YXQP);
		L_YXQP.RegVar("onReceiveMessageFn", QPYX_get_onReceiveMessageFn_YXQP, QPYX_set_onReceiveMessageFn_YXQP);
		L_YXQP.RegVar("onReceiveTextMessageFn", QPYX_get_onReceiveTextMessageFn_YXQP, QPYX_set_onReceiveTextMessageFn_YXQP);
		L_YXQP.RegVar("clientName", QPYX_get_clientName_YXQP, QPYX_set_clientName_YXQP);
		L_YXQP.RegVar("msgProtocolType", QPYX_get_msgProtocolType_YXQP, QPYX_set_msgProtocolType_YXQP);
		L_YXQP.RegVar("needDecompressMsgName", QPYX_get_needDecompressMsgName_YXQP, QPYX_set_needDecompressMsgName_YXQP);
		L_YXQP.RegVar("heartMsgId", QPYX_get_heartMsgId_YXQP, QPYX_set_heartMsgId_YXQP);
		L_YXQP.RegVar("packetLenMin", QPYX_get_packetLenMin_YXQP, null);
		L_YXQP.RegVar("packetHeadLenOffest", QPYX_get_packetHeadLenOffest_YXQP, null);
		L_YXQP.RegVar("heartSendInIntervalTime", QPYX_get_heartSendInIntervalTime_YXQP, QPYX_set_heartSendInIntervalTime_YXQP);
		L_YXQP.RegVar("canSendHeartPack", QPYX_get_canSendHeartPack_YXQP, QPYX_set_canSendHeartPack_YXQP);
		L_YXQP.RegVar("webSocketOpen", QPYX_get_webSocketOpen_YXQP, null);
		L_YXQP.RegVar("PingFrequnecy", QPYX_get_PingFrequnecy_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateDNet_GameWebSocketClient_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DNet.GameWebSocketClient QPYX_obj_YXQP = new DNet.GameWebSocketClient(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: DNet.GameWebSocketClient.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Connect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.Connect(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetMsgDataDecompresser_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			QPYX_obj_YXQP.ResetMsgDataDecompresser();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendBuffer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			DNet.Buffer QPYX_arg0_YXQP = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			QPYX_obj_YXQP.SendBuffer(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendMessage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.SendMessage(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendBinary_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			QPYX_obj_YXQP.SendBinary(QPYX_arg0_YXQP);
			return 0;
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
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			QPYX_obj_YXQP.Dispose();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Disconnect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			QPYX_obj_YXQP.Disconnect();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ForceDisconnect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.ForceDisconnect(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CloseWebSocket_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			QPYX_obj_YXQP.CloseWebSocket();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CloseWebSocketWithMsg_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			DNet.GameWebSocketClient  QPYX_obj_YXQP  = (DNet.GameWebSocketClient)ToLua.CheckObject<DNet.GameWebSocketClient>(L_YXQP, 1);
			ushort QPYX_arg0_YXQP = (ushort)LuaDLL.luaL_checknumber(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.CloseWebSocketWithMsg(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onEventChangeFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onEventChangeFn;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEventChangeFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onReceiveMessageFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onReceiveMessageFn;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceiveMessageFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onReceiveTextMessageFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onReceiveTextMessageFn;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceiveTextMessageFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_clientName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.clientName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clientName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_msgProtocolType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.msgProtocolType;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgProtocolType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_needDecompressMsgName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.needDecompressMsgName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needDecompressMsgName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_heartMsgId_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.heartMsgId;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index heartMsgId on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_packetLenMin_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.packetLenMin;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index packetLenMin on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_packetHeadLenOffest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.packetHeadLenOffest;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index packetHeadLenOffest on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_heartSendInIntervalTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.heartSendInIntervalTime;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index heartSendInIntervalTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_canSendHeartPack_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.canSendHeartPack;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canSendHeartPack on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_webSocketOpen_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.webSocketOpen;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index webSocketOpen on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_PingFrequnecy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			System.TimeSpan QPYX_ret_YXQP = QPYX_obj_YXQP.PingFrequnecy;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index PingFrequnecy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onEventChangeFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onEventChangeFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEventChangeFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onReceiveMessageFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onReceiveMessageFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceiveMessageFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onReceiveTextMessageFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onReceiveTextMessageFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onReceiveTextMessageFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_clientName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.clientName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clientName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_msgProtocolType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.msgProtocolType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgProtocolType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_needDecompressMsgName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.needDecompressMsgName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needDecompressMsgName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_heartMsgId_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.heartMsgId = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index heartMsgId on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_heartSendInIntervalTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.heartSendInIntervalTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index heartSendInIntervalTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_canSendHeartPack_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.GameWebSocketClient QPYX_obj_YXQP = (DNet.GameWebSocketClient)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.canSendHeartPack = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canSendHeartPack on a nil value");
		}
	}
}

