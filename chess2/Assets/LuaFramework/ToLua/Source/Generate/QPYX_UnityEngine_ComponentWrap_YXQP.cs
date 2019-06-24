using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_UnityEngine_ComponentWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Component), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("GetComponent", QPYX_GetComponent_YXQP);
		L_YXQP.RegFunction("GetComponentInChildren", QPYX_GetComponentInChildren_YXQP);
		L_YXQP.RegFunction("GetComponentsInChildren", QPYX_GetComponentsInChildren_YXQP);
		L_YXQP.RegFunction("GetComponentInParent", QPYX_GetComponentInParent_YXQP);
		L_YXQP.RegFunction("GetComponentsInParent", QPYX_GetComponentsInParent_YXQP);
		L_YXQP.RegFunction("GetComponents", QPYX_GetComponents_YXQP);
		L_YXQP.RegFunction("CompareTag", QPYX_CompareTag_YXQP);
		L_YXQP.RegFunction("SendMessageUpwards", QPYX_SendMessageUpwards_YXQP);
		L_YXQP.RegFunction("SendMessage", QPYX_SendMessage_YXQP);
		L_YXQP.RegFunction("BroadcastMessage", QPYX_BroadcastMessage_YXQP);
		L_YXQP.RegFunction("DOTogglePause", QPYX_DOTogglePause_YXQP);
		L_YXQP.RegFunction("DOSmoothRewind", QPYX_DOSmoothRewind_YXQP);
		L_YXQP.RegFunction("DORewind", QPYX_DORewind_YXQP);
		L_YXQP.RegFunction("DORestart", QPYX_DORestart_YXQP);
		L_YXQP.RegFunction("DOPlayForward", QPYX_DOPlayForward_YXQP);
		L_YXQP.RegFunction("DOPlayBackwards", QPYX_DOPlayBackwards_YXQP);
		L_YXQP.RegFunction("DOPlay", QPYX_DOPlay_YXQP);
		L_YXQP.RegFunction("DOPause", QPYX_DOPause_YXQP);
		L_YXQP.RegFunction("DOGoto", QPYX_DOGoto_YXQP);
		L_YXQP.RegFunction("DOFlip", QPYX_DOFlip_YXQP);
		L_YXQP.RegFunction("DOKill", QPYX_DOKill_YXQP);
		L_YXQP.RegFunction("DOComplete", QPYX_DOComplete_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Component_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("transform", QPYX_get_transform_YXQP, null);
		L_YXQP.RegVar("gameObject", QPYX_get_gameObject_YXQP, null);
		L_YXQP.RegVar("tag", QPYX_get_tag_YXQP, QPYX_set_tag_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Component_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Component QPYX_obj_YXQP = new UnityEngine.Component();
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Component.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponent(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Type>(L_YXQP, 2))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = (System.Type)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponent(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.GetComponent");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponentInChildren_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentInChildren(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.GetComponentInChildren");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponentsInChildren_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInChildren(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.GetComponentsInChildren");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponentInParent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
			UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentInParent(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponentsInParent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInParent(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInParent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.GetComponentsInParent");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponents_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponents(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Component> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Component>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.List<UnityEngine.Component>));
				QPYX_obj_YXQP.GetComponents(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.GetComponents");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CompareTag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.CompareTag(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendMessageUpwards_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.SendMessageUpwards(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.SendMessageOptions>(L_YXQP, 3))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.SendMessageOptions QPYX_arg1_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SendMessageUpwards(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<object>(L_YXQP, 3))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				QPYX_obj_YXQP.SendMessageUpwards(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.SendMessageOptions QPYX_arg2_YXQP = (UnityEngine.SendMessageOptions)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.SendMessageOptions));
				QPYX_obj_YXQP.SendMessageUpwards(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.SendMessageUpwards");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendMessage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.SendMessage(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.SendMessageOptions>(L_YXQP, 3))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.SendMessageOptions QPYX_arg1_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.SendMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<object>(L_YXQP, 3))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				QPYX_obj_YXQP.SendMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.SendMessageOptions QPYX_arg2_YXQP = (UnityEngine.SendMessageOptions)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.SendMessageOptions));
				QPYX_obj_YXQP.SendMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.SendMessage");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BroadcastMessage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.BroadcastMessage(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.SendMessageOptions>(L_YXQP, 3))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.SendMessageOptions QPYX_arg1_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.BroadcastMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<object>(L_YXQP, 3))
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				QPYX_obj_YXQP.BroadcastMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.SendMessageOptions QPYX_arg2_YXQP = (UnityEngine.SendMessageOptions)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.SendMessageOptions));
				QPYX_obj_YXQP.BroadcastMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.BroadcastMessage");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOTogglePause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOTogglePause();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOSmoothRewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOSmoothRewind();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.DORewind");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORestart_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.DORestart");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayForward_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlayForward();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayBackwards_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlayBackwards();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlay();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPause();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOGoto_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.DOGoto");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFlip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOFlip();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.DOKill");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Component  QPYX_obj_YXQP  = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Component.DOComplete");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_op_Equality_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
			UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_arg0_YXQP == QPYX_arg1_YXQP;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_transform_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Component QPYX_obj_YXQP = (UnityEngine.Component)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.transform;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transform on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gameObject_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Component QPYX_obj_YXQP = (UnityEngine.Component)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_ret_YXQP = QPYX_obj_YXQP.gameObject;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameObject on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_tag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Component QPYX_obj_YXQP = (UnityEngine.Component)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.tag;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tag on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_tag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Component QPYX_obj_YXQP = (UnityEngine.Component)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.tag = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tag on a nil value");
		}
	}
}

