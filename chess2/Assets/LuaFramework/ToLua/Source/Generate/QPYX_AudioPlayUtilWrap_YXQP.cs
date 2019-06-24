using System;
using LuaInterface;

public class QPYX_AudioPlayUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("AudioPlayUtil");
		L_YXQP.RegFunction("Create", QPYX_Create_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Create_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource QPYX_arg0_YXQP = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			UnityEngine.AudioClip QPYX_arg1_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioClip));
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			AudioPlayOperation QPYX_o_YXQP = AudioPlayUtil.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

