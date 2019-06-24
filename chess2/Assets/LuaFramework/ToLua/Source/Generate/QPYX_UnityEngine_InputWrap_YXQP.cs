using System;
using LuaInterface;

public class QPYX_UnityEngine_InputWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("Input");
		L_YXQP.RegFunction("GetAxis", QPYX_GetAxis_YXQP);
		L_YXQP.RegFunction("GetAxisRaw", QPYX_GetAxisRaw_YXQP);
		L_YXQP.RegFunction("GetButton", QPYX_GetButton_YXQP);
		L_YXQP.RegFunction("GetButtonDown", QPYX_GetButtonDown_YXQP);
		L_YXQP.RegFunction("GetButtonUp", QPYX_GetButtonUp_YXQP);
		L_YXQP.RegFunction("GetKey", QPYX_GetKey_YXQP);
		L_YXQP.RegFunction("GetKeyDown", QPYX_GetKeyDown_YXQP);
		L_YXQP.RegFunction("GetKeyUp", QPYX_GetKeyUp_YXQP);
		L_YXQP.RegFunction("GetJoystickNames", QPYX_GetJoystickNames_YXQP);
		L_YXQP.RegFunction("GetMouseButton", QPYX_GetMouseButton_YXQP);
		L_YXQP.RegFunction("GetMouseButtonDown", QPYX_GetMouseButtonDown_YXQP);
		L_YXQP.RegFunction("GetMouseButtonUp", QPYX_GetMouseButtonUp_YXQP);
		L_YXQP.RegFunction("ResetInputAxes", QPYX_ResetInputAxes_YXQP);
		L_YXQP.RegFunction("GetAccelerationEvent", QPYX_GetAccelerationEvent_YXQP);
		L_YXQP.RegFunction("GetTouch", QPYX_GetTouch_YXQP);
		L_YXQP.RegVar("compensateSensors", QPYX_get_compensateSensors_YXQP, QPYX_set_compensateSensors_YXQP);
		L_YXQP.RegVar("gyro", QPYX_get_gyro_YXQP, null);
		L_YXQP.RegVar("mousePosition", QPYX_get_mousePosition_YXQP, null);
		L_YXQP.RegVar("mouseScrollDelta", QPYX_get_mouseScrollDelta_YXQP, null);
		L_YXQP.RegVar("mousePresent", QPYX_get_mousePresent_YXQP, null);
		L_YXQP.RegVar("simulateMouseWithTouches", QPYX_get_simulateMouseWithTouches_YXQP, QPYX_set_simulateMouseWithTouches_YXQP);
		L_YXQP.RegVar("anyKey", QPYX_get_anyKey_YXQP, null);
		L_YXQP.RegVar("anyKeyDown", QPYX_get_anyKeyDown_YXQP, null);
		L_YXQP.RegVar("inputString", QPYX_get_inputString_YXQP, null);
		L_YXQP.RegVar("acceleration", QPYX_get_acceleration_YXQP, null);
		L_YXQP.RegVar("accelerationEvents", QPYX_get_accelerationEvents_YXQP, null);
		L_YXQP.RegVar("accelerationEventCount", QPYX_get_accelerationEventCount_YXQP, null);
		L_YXQP.RegVar("touches", QPYX_get_touches_YXQP, null);
		L_YXQP.RegVar("touchCount", QPYX_get_touchCount_YXQP, null);
		L_YXQP.RegVar("touchPressureSupported", QPYX_get_touchPressureSupported_YXQP, null);
		L_YXQP.RegVar("stylusTouchSupported", QPYX_get_stylusTouchSupported_YXQP, null);
		L_YXQP.RegVar("touchSupported", QPYX_get_touchSupported_YXQP, null);
		L_YXQP.RegVar("multiTouchEnabled", QPYX_get_multiTouchEnabled_YXQP, QPYX_set_multiTouchEnabled_YXQP);
		L_YXQP.RegVar("location", QPYX_get_location_YXQP, null);
		L_YXQP.RegVar("compass", QPYX_get_compass_YXQP, null);
		L_YXQP.RegVar("deviceOrientation", QPYX_get_deviceOrientation_YXQP, null);
		L_YXQP.RegVar("imeCompositionMode", QPYX_get_imeCompositionMode_YXQP, QPYX_set_imeCompositionMode_YXQP);
		L_YXQP.RegVar("compositionString", QPYX_get_compositionString_YXQP, null);
		L_YXQP.RegVar("imeIsSelected", QPYX_get_imeIsSelected_YXQP, null);
		L_YXQP.RegVar("compositionCursorPos", QPYX_get_compositionCursorPos_YXQP, QPYX_set_compositionCursorPos_YXQP);
		L_YXQP.RegVar("backButtonLeavesApp", QPYX_get_backButtonLeavesApp_YXQP, QPYX_set_backButtonLeavesApp_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAxis_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			float QPYX_o_YXQP = UnityEngine.Input.GetAxis(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAxisRaw_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			float QPYX_o_YXQP = UnityEngine.Input.GetAxisRaw(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetButton_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Input.GetButton(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetButtonDown_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Input.GetButtonDown(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetButtonUp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Input.GetButtonUp(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetKey_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.KeyCode>(L_YXQP, 1))
			{
				UnityEngine.KeyCode QPYX_arg0_YXQP = (UnityEngine.KeyCode)ToLua.ToObject(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Input.GetKey(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Input.GetKey(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Input.GetKey");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetKeyDown_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.KeyCode>(L_YXQP, 1))
			{
				UnityEngine.KeyCode QPYX_arg0_YXQP = (UnityEngine.KeyCode)ToLua.ToObject(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Input.GetKeyDown(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Input.GetKeyDown(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Input.GetKeyDown");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetKeyUp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<UnityEngine.KeyCode>(L_YXQP, 1))
			{
				UnityEngine.KeyCode QPYX_arg0_YXQP = (UnityEngine.KeyCode)ToLua.ToObject(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Input.GetKeyUp(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Input.GetKeyUp(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Input.GetKeyUp");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetJoystickNames_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			string[] QPYX_o_YXQP = UnityEngine.Input.GetJoystickNames();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetMouseButton_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Input.GetMouseButton(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetMouseButtonDown_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Input.GetMouseButtonDown(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetMouseButtonUp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			bool QPYX_o_YXQP = UnityEngine.Input.GetMouseButtonUp(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetInputAxes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Input.ResetInputAxes();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAccelerationEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			UnityEngine.AccelerationEvent QPYX_o_YXQP = UnityEngine.Input.GetAccelerationEvent(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTouch_YXQP(IntPtr L_YXQP)
	{
        try
        {
		    int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
            int QPYX_arg1_YXQP = LuaDLL.luaL_optinteger(L_YXQP, 2, TouchBits.ALL);        
		    UnityEngine.Touch o = UnityEngine.Input.GetTouch(QPYX_arg0_YXQP);
            ToLua.Push(L_YXQP, o, QPYX_arg1_YXQP);
            return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L_YXQP, e);			
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_compensateSensors_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.compensateSensors);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gyro_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.Input.gyro);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mousePosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.mousePosition);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mouseScrollDelta_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.mouseScrollDelta);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mousePresent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.mousePresent);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_simulateMouseWithTouches_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.simulateMouseWithTouches);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anyKey_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.anyKey);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anyKeyDown_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.anyKeyDown);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_inputString_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Input.inputString);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_acceleration_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.acceleration);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_accelerationEvents_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.accelerationEvents);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_accelerationEventCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Input.accelerationEventCount);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_touches_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.touches);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_touchCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Input.touchCount);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_touchPressureSupported_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.touchPressureSupported);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_stylusTouchSupported_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.stylusTouchSupported);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_touchSupported_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.touchSupported);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_multiTouchEnabled_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.multiTouchEnabled);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_location_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.Input.location);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_compass_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.Input.compass);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_deviceOrientation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.deviceOrientation);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_imeCompositionMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.imeCompositionMode);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_compositionString_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Input.compositionString);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_imeIsSelected_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.imeIsSelected);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_compositionCursorPos_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Input.compositionCursorPos);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_backButtonLeavesApp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Input.backButtonLeavesApp);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_compensateSensors_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Input.compensateSensors = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_simulateMouseWithTouches_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Input.simulateMouseWithTouches = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_multiTouchEnabled_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Input.multiTouchEnabled = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_imeCompositionMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.IMECompositionMode QPYX_arg0_YXQP = (UnityEngine.IMECompositionMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.IMECompositionMode));
			UnityEngine.Input.imeCompositionMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_compositionCursorPos_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			UnityEngine.Input.compositionCursorPos = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_backButtonLeavesApp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Input.backButtonLeavesApp = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

