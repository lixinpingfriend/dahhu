using System;
using LuaInterface;

public class QPYX_DNet_VideoDataWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DNet.VideoData), typeof(System.Object));
		L_YXQP.RegFunction("New", QPYX__CreateDNet_VideoData_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("frames", QPYX_get_frames_YXQP, QPYX_set_frames_YXQP);
		L_YXQP.RegVar("rule", QPYX_get_rule_YXQP, QPYX_set_rule_YXQP);
		L_YXQP.RegVar("headData", QPYX_get_headData_YXQP, QPYX_set_headData_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateDNet_VideoData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				DNet.VideoData QPYX_obj_YXQP = new DNet.VideoData();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: DNet.VideoData.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_frames_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.VideoData QPYX_obj_YXQP = (DNet.VideoData)QPYX_o_YXQP;
			System.Collections.Generic.List<DNet.VideoFrameData> QPYX_ret_YXQP = QPYX_obj_YXQP.frames;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index frames on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rule_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.VideoData QPYX_obj_YXQP = (DNet.VideoData)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.rule;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rule on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_headData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.VideoData QPYX_obj_YXQP = (DNet.VideoData)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.headData;
			LuaDLL.tolua_pushlstring(L_YXQP, QPYX_ret_YXQP, QPYX_ret_YXQP.Length);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index headData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_frames_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.VideoData QPYX_obj_YXQP = (DNet.VideoData)QPYX_o_YXQP;
			System.Collections.Generic.List<DNet.VideoFrameData> QPYX_arg0_YXQP = (System.Collections.Generic.List<DNet.VideoFrameData>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<DNet.VideoFrameData>));
			QPYX_obj_YXQP.frames = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index frames on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rule_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.VideoData QPYX_obj_YXQP = (DNet.VideoData)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.rule = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rule on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_headData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DNet.VideoData QPYX_obj_YXQP = (DNet.VideoData)QPYX_o_YXQP;
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			QPYX_obj_YXQP.headData = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index headData on a nil value");
		}
	}
}

