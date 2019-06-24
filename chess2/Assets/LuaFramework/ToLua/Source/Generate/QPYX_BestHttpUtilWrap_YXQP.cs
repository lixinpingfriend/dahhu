using System;
using LuaInterface;

public class QPYX_BestHttpUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("BestHttpUtil");
		L_YXQP.RegFunction("Create", QPYX_Create_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Create_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			System.Collections.Generic.Dictionary<string,string> QPYX_arg2_YXQP = (System.Collections.Generic.Dictionary<string,string>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.Dictionary<string,string>));
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			BestHttpOperation QPYX_o_YXQP = BestHttpUtil.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

