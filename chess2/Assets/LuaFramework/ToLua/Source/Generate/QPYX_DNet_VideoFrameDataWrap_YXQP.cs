using System;
using LuaInterface;

public class QPYX_DNet_VideoFrameDataWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DNet.VideoFrameData), typeof(System.Object));
		L_YXQP.RegFunction("New", QPYX__CreateDNet_VideoFrameData_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("buffer", QPYX_get_buffer_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateDNet_VideoFrameData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				DNet.VideoFrameData QPYX_obj_YXQP = new DNet.VideoFrameData(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: DNet.VideoFrameData.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_buffer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.VideoFrameData QPYX_obj_YXQP = (DNet.VideoFrameData)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.buffer;
			LuaDLL.tolua_pushlstring(L_YXQP, QPYX_ret_YXQP, QPYX_ret_YXQP.Length);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index buffer on a nil value");
		}
	}
}

