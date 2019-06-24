using System;
using LuaInterface;

public class QPYX_UnityEngine_SleepTimeoutWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("SleepTimeout");
		L_YXQP.RegConstant("NeverSleep", -1);
		L_YXQP.RegConstant("SystemSetting", -2);
		L_YXQP.EndStaticLibs();
	}
}

