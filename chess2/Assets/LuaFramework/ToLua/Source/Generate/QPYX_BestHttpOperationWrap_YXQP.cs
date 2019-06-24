using System;
using LuaInterface;

public class QPYX_BestHttpOperationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(BestHttpOperation), typeof(System.Object));
		L_YXQP.RegFunction("Subscribe", QPYX_Subscribe_YXQP);
		L_YXQP.RegFunction("AddBinaryData", QPYX_AddBinaryData_YXQP);
		L_YXQP.RegFunction("AddField", QPYX_AddField_YXQP);
		L_YXQP.RegFunction("SetUploadStream", QPYX_SetUploadStream_YXQP);
		L_YXQP.RegFunction("SetStreamData", QPYX_SetStreamData_YXQP);
		L_YXQP.RegFunction("Start", QPYX_Start_YXQP);
		L_YXQP.RegFunction("Abort", QPYX_Abort_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("httpReq", QPYX_get_httpReq_YXQP, null);
		L_YXQP.RegVar("httpRsp", QPYX_get_httpRsp_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Subscribe_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
				System.Action<BestHttpOperation> QPYX_arg0_YXQP = (System.Action<BestHttpOperation>)ToLua.CheckDelegate<System.Action<BestHttpOperation>>(L_YXQP, 2);
				BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.Subscribe(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
				System.Action<BestHttpOperation> QPYX_arg0_YXQP = (System.Action<BestHttpOperation>)ToLua.CheckDelegate<System.Action<BestHttpOperation>>(L_YXQP, 2);
				System.Action<BestHttpOperation> QPYX_arg1_YXQP = (System.Action<BestHttpOperation>)ToLua.CheckDelegate<System.Action<BestHttpOperation>>(L_YXQP, 3);
				BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.Subscribe(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
				System.Action<BestHttpOperation> QPYX_arg0_YXQP = (System.Action<BestHttpOperation>)ToLua.CheckDelegate<System.Action<BestHttpOperation>>(L_YXQP, 2);
				System.Action<BestHttpOperation> QPYX_arg1_YXQP = (System.Action<BestHttpOperation>)ToLua.CheckDelegate<System.Action<BestHttpOperation>>(L_YXQP, 3);
				System.Action<string> QPYX_arg2_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 4);
				BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.Subscribe(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: BestHttpOperation.Subscribe");
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
			ToLua.CheckArgsCount(L_YXQP, 4);
			BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
			BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.AddBinaryData(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddField_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.AddField(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetUploadStream_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.SetUploadStream(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetStreamData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.SetStreamData(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Start_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
			BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.Start();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Abort_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHttpOperation  QPYX_obj_YXQP  = (BestHttpOperation)ToLua.CheckObject<BestHttpOperation>(L_YXQP, 1);
			BestHttpOperation QPYX_o_YXQP = QPYX_obj_YXQP.Abort();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_httpReq_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHttpOperation QPYX_obj_YXQP = (BestHttpOperation)QPYX_o_YXQP;
			BestHTTP.HTTPRequest QPYX_ret_YXQP = QPYX_obj_YXQP.httpReq;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index httpReq on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_httpRsp_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHttpOperation QPYX_obj_YXQP = (BestHttpOperation)QPYX_o_YXQP;
			BestHTTP.HTTPResponse QPYX_ret_YXQP = QPYX_obj_YXQP.httpRsp;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index httpRsp on a nil value");
		}
	}
}

