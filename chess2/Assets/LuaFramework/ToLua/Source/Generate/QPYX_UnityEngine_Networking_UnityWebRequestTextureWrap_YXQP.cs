using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_UnityWebRequestTextureWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("UnityWebRequestTexture");
		L_YXQP.RegFunction("GetTexture", QPYX_GetTexture_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequestTexture.GetTexture(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequestTexture.GetTexture(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Networking.UnityWebRequestTexture.GetTexture");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

