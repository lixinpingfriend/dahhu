using System;
using LuaInterface;

public class QPYX_WWWUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("WWWUtil");
		L_YXQP.RegFunction("Get", QPYX_Get_YXQP);
		L_YXQP.RegFunction("GetSafe", QPYX_GetSafe_YXQP);
		L_YXQP.RegFunction("Post", QPYX_Post_YXQP);
		L_YXQP.RegFunction("Post_Data", QPYX_Post_Data_YXQP);
		L_YXQP.RegFunction("GetFromWebRequest", QPYX_GetFromWebRequest_YXQP);
		L_YXQP.RegFunction("GetConcurrence", QPYX_GetConcurrence_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Get_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			WWWOperation QPYX_o_YXQP = WWWUtil.Get(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetSafe_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			WWWOperation QPYX_o_YXQP = WWWUtil.GetSafe(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Post_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.WWWForm QPYX_arg1_YXQP = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 2);
				WWWOperation QPYX_o_YXQP = WWWUtil.Post(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.WWWForm QPYX_arg1_YXQP = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 2);
				UnityEngine.Events.UnityAction<float> QPYX_arg2_YXQP = (UnityEngine.Events.UnityAction<float>)ToLua.CheckDelegate<UnityEngine.Events.UnityAction<float>>(L_YXQP, 3);
				WWWOperation QPYX_o_YXQP = WWWUtil.Post(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WWWUtil.Post");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Post_Data_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			System.Collections.Generic.Dictionary<string,string> QPYX_arg2_YXQP = (System.Collections.Generic.Dictionary<string,string>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.Dictionary<string,string>));
			WWWOperation QPYX_o_YXQP = WWWUtil.Post_Data(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFromWebRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				WWWOperation QPYX_o_YXQP = WWWUtil.GetFromWebRequest(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				WWWOperation QPYX_o_YXQP = WWWUtil.GetFromWebRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: WWWUtil.GetFromWebRequest");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetConcurrence_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string[] QPYX_arg0_YXQP = ToLua.CheckStringArray(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			System.Action<WWWOperation> QPYX_arg2_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 3);
			System.Action<WWWOperation> QPYX_arg3_YXQP = (System.Action<WWWOperation>)ToLua.CheckDelegate<System.Action<WWWOperation>>(L_YXQP, 4);
			WWWUtil.GetConcurrence(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

