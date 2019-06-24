using System;
using LuaInterface;

public class QPYX_LoopScrollView_OnContentPosChangeEventWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(LoopScrollView.OnContentPosChangeEvent), typeof(UnityEngine.Events.UnityEvent<UnityEngine.Vector3>));
		L_YXQP.RegFunction("New", QPYX__CreateLoopScrollView_OnContentPosChangeEvent_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateLoopScrollView_OnContentPosChangeEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				LoopScrollView.OnContentPosChangeEvent QPYX_obj_YXQP = new LoopScrollView.OnContentPosChangeEvent();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: LoopScrollView.OnContentPosChangeEvent.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

