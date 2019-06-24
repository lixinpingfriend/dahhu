using System;
using LuaInterface;

public class QPYX_DNet_BufferWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DNet.Buffer), typeof(System.Object));
		L_YXQP.RegFunction("SetMessageName", QPYX_SetMessageName_YXQP);
		L_YXQP.RegFunction("Create", QPYX_Create_YXQP);
		L_YXQP.RegFunction("Recycle", QPYX_Recycle_YXQP);
		L_YXQP.RegFunction("Clear", QPYX_Clear_YXQP);
		L_YXQP.RegFunction("WriteUShort", QPYX_WriteUShort_YXQP);
		L_YXQP.RegFunction("WriteUInt", QPYX_WriteUInt_YXQP);
		L_YXQP.RegFunction("WriteInt", QPYX_WriteInt_YXQP);
		L_YXQP.RegFunction("WriteLong", QPYX_WriteLong_YXQP);
		L_YXQP.RegFunction("WriteString", QPYX_WriteString_YXQP);
		L_YXQP.RegFunction("WriteByte", QPYX_WriteByte_YXQP);
		L_YXQP.RegFunction("WriteBytes", QPYX_WriteBytes_YXQP);
		L_YXQP.RegFunction("EndWrite", QPYX_EndWrite_YXQP);
		L_YXQP.RegFunction("WriteBufferMsgProtolType1", QPYX_WriteBufferMsgProtolType1_YXQP);
		L_YXQP.RegFunction("WriteBufferMsgProtolType2", QPYX_WriteBufferMsgProtolType2_YXQP);
		L_YXQP.RegFunction("WriteBufferMsgProtolType3", QPYX_WriteBufferMsgProtolType3_YXQP);
		L_YXQP.RegFunction("BeginWriting", QPYX_BeginWriting_YXQP);
		L_YXQP.RegFunction("BeginReading", QPYX_BeginReading_YXQP);
		L_YXQP.RegFunction("PeekByte", QPYX_PeekByte_YXQP);
		L_YXQP.RegFunction("PeekInt16", QPYX_PeekInt16_YXQP);
		L_YXQP.RegFunction("PeekUInt16", QPYX_PeekUInt16_YXQP);
		L_YXQP.RegFunction("PeekUInt32", QPYX_PeekUInt32_YXQP);
		L_YXQP.RegFunction("PeekInt", QPYX_PeekInt_YXQP);
		L_YXQP.RegFunction("GetPlayBackInfo", QPYX_GetPlayBackInfo_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("messageName", QPYX_get_messageName_YXQP, QPYX_set_messageName_YXQP);
		L_YXQP.RegVar("msgProtolType", QPYX_get_msgProtolType_YXQP, QPYX_set_msgProtolType_YXQP);
		L_YXQP.RegVar("msgRetCode", QPYX_get_msgRetCode_YXQP, QPYX_set_msgRetCode_YXQP);
		L_YXQP.RegVar("size", QPYX_get_size_YXQP, null);
		L_YXQP.RegVar("position", QPYX_get_position_YXQP, QPYX_set_position_YXQP);
		L_YXQP.RegVar("buffer", QPYX_get_buffer_YXQP, null);
		L_YXQP.RegVar("dataBuffer", QPYX_get_dataBuffer_YXQP, null);
		L_YXQP.RegVar("recycleQueue", QPYX_get_recycleQueue_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMessageName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			CDecompress QPYX_arg0_YXQP = (CDecompress)ToLua.CheckObject<CDecompress>(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.SetMessageName(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
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
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			DNet.Buffer QPYX_o_YXQP = DNet.Buffer.Create(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Recycle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.Recycle();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Clear_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			QPYX_obj_YXQP.Clear();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteUShort_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			ushort QPYX_arg0_YXQP = (ushort)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.WriteUShort(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteUInt_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			uint QPYX_arg0_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.WriteUInt(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteInt_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.WriteInt(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteLong_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			long QPYX_arg0_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 2);
			QPYX_obj_YXQP.WriteLong(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteString_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.WriteString(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteByte_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			byte QPYX_arg0_YXQP = (byte)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.WriteByte(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteBytes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			QPYX_obj_YXQP.WriteBytes(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EndWrite_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			QPYX_obj_YXQP.EndWrite();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteBufferMsgProtolType1_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			QPYX_obj_YXQP.WriteBufferMsgProtolType1(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteBufferMsgProtolType2_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			QPYX_obj_YXQP.WriteBufferMsgProtolType2(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteBufferMsgProtolType3_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.WriteBufferMsgProtolType3(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BeginWriting_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			System.IO.BinaryWriter QPYX_o_YXQP = QPYX_obj_YXQP.BeginWriting(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BeginReading_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			System.IO.BinaryReader QPYX_o_YXQP = QPYX_obj_YXQP.BeginReading();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PeekByte_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.PeekByte(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PeekInt16_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.PeekInt16(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.PeekInt16(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DNet.Buffer.PeekInt16");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PeekUInt16_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				ushort QPYX_o_YXQP = QPYX_obj_YXQP.PeekUInt16(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				ushort QPYX_o_YXQP = QPYX_obj_YXQP.PeekUInt16(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DNet.Buffer.PeekUInt16");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PeekUInt32_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				uint QPYX_o_YXQP = QPYX_obj_YXQP.PeekUInt32(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				uint QPYX_o_YXQP = QPYX_obj_YXQP.PeekUInt32(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DNet.Buffer.PeekUInt32");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PeekInt_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.PeekInt(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.PeekInt(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DNet.Buffer.PeekInt");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPlayBackInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DNet.Buffer  QPYX_obj_YXQP  = (DNet.Buffer)ToLua.CheckObject<DNet.Buffer>(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			DNet.VideoData QPYX_o_YXQP = QPYX_obj_YXQP.GetPlayBackInfo(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_messageName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.messageName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index messageName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_msgProtolType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.msgProtolType;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgProtolType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_msgRetCode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.msgRetCode;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgRetCode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_size_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.size;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index size on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_position_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.position;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index position on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_buffer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.buffer;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index buffer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dataBuffer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.dataBuffer;
			LuaDLL.tolua_pushlstring(L_YXQP, QPYX_ret_YXQP, QPYX_ret_YXQP.Length);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dataBuffer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_recycleQueue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,DNet.Buffer.recycleQueue);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_messageName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.messageName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index messageName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_msgProtolType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.msgProtolType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgProtolType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_msgRetCode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.msgRetCode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgRetCode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_position_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.Buffer QPYX_obj_YXQP = (DNet.Buffer)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.position = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index position on a nil value");
		}
	}
}

