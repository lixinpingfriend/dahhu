using System;
using LuaInterface;

public class QPYX_AsyncFileUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("AsyncFileUtil");
		L_YXQP.RegFunction("StartFileOperationThread", QPYX_StartFileOperationThread_YXQP);
		L_YXQP.RegFunction("EndFileOperationTread", QPYX_EndFileOperationTread_YXQP);
		L_YXQP.RegFunction("GetFileOperationCount", QPYX_GetFileOperationCount_YXQP);
		L_YXQP.RegFunction("AddFileOperationToQueue", QPYX_AddFileOperationToQueue_YXQP);
		L_YXQP.RegFunction("GetFinishedAsyncFileOperationData", QPYX_GetFinishedAsyncFileOperationData_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartFileOperationThread_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			AsyncFileUtil.StartFileOperationThread();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EndFileOperationTread_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			AsyncFileUtil.EndFileOperationTread();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFileOperationCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = AsyncFileUtil.GetFileOperationCount();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddFileOperationToQueue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				AsyncFileUtil.AddFileOperationToQueue(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				AsyncFileUtil.AddFileOperationToQueue(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				string QPYX_arg4_YXQP = ToLua.CheckString(L_YXQP, 5);
				AsyncFileUtil.AddFileOperationToQueue(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: AsyncFileUtil.AddFileOperationToQueue");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFinishedAsyncFileOperationData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			AsyncFileOperationData QPYX_o_YXQP = AsyncFileUtil.GetFinishedAsyncFileOperationData();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

