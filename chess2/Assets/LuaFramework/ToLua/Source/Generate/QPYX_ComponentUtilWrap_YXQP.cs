using System;
using LuaInterface;

public class QPYX_ComponentUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("ComponentUtil");
		L_YXQP.RegFunction("SetLayer", QPYX_SetLayer_YXQP);
		L_YXQP.RegFunction("InstantiateLocal", QPYX_InstantiateLocal_YXQP);
		L_YXQP.RegFunction("InstantiateGlobal", QPYX_InstantiateGlobal_YXQP);
		L_YXQP.RegFunction("SetParent", QPYX_SetParent_YXQP);
		L_YXQP.RegFunction("GetClassType", QPYX_GetClassType_YXQP);
		L_YXQP.RegFunction("Find", QPYX_Find_YXQP);
		L_YXQP.RegFunction("GetComponent", QPYX_GetComponent_YXQP);
		L_YXQP.RegFunction("AddComponent", QPYX_AddComponent_YXQP);
		L_YXQP.RegFunction("GetComponentWithPath", QPYX_GetComponentWithPath_YXQP);
		L_YXQP.RegFunction("GetComponentWithSimple", QPYX_GetComponentWithSimple_YXQP);
		L_YXQP.RegFunction("GetComponents", QPYX_GetComponents_YXQP);
		L_YXQP.RegFunction("GetComponentsInChildren", QPYX_GetComponentsInChildren_YXQP);
		L_YXQP.RegFunction("GetComponentInChildren", QPYX_GetComponentInChildren_YXQP);
		L_YXQP.RegFunction("GetAllChild", QPYX_GetAllChild_YXQP);
		L_YXQP.RegFunction("GetAllChildAndCallback", QPYX_GetAllChildAndCallback_YXQP);
		L_YXQP.RegFunction("SafeSetActive", QPYX_SafeSetActive_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			ComponentUtil.SetLayer(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InstantiateLocal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				UnityEngine.GameObject QPYX_o_YXQP = ComponentUtil.InstantiateLocal(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.GameObject QPYX_o_YXQP = ComponentUtil.InstantiateLocal(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.GameObject>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				UnityEngine.GameObject QPYX_arg1_YXQP = (UnityEngine.GameObject)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.GameObject QPYX_o_YXQP = ComponentUtil.InstantiateLocal(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				UnityEngine.GameObject QPYX_arg1_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.GameObject));
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.GameObject QPYX_o_YXQP = ComponentUtil.InstantiateLocal(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: ComponentUtil.InstantiateLocal");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InstantiateGlobal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				UnityEngine.GameObject QPYX_o_YXQP = ComponentUtil.InstantiateGlobal(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				UnityEngine.GameObject QPYX_arg1_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.GameObject));
				UnityEngine.GameObject QPYX_o_YXQP = ComponentUtil.InstantiateGlobal(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: ComponentUtil.InstantiateGlobal");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetParent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			UnityEngine.GameObject QPYX_arg1_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.GameObject));
			ComponentUtil.SetParent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetClassType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			System.Type QPYX_o_YXQP = ComponentUtil.GetClassType(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Find_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.GameObject QPYX_o_YXQP = ComponentUtil.Find(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
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
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Type>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg1_YXQP = (System.Type)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = ComponentUtil.GetComponent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = ComponentUtil.GetComponent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: ComponentUtil.GetComponent");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddComponent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Type>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg1_YXQP = (System.Type)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = ComponentUtil.AddComponent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = ComponentUtil.AddComponent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: ComponentUtil.AddComponent");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponentWithPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
			UnityEngine.Component QPYX_o_YXQP = ComponentUtil.GetComponentWithPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetComponentWithSimple_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
			UnityEngine.Component QPYX_o_YXQP = ComponentUtil.GetComponentWithSimple(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
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
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Type>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg1_YXQP = (System.Type)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = ComponentUtil.GetComponents(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = ComponentUtil.GetComponents(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: ComponentUtil.GetComponents");
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
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Type>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg1_YXQP = (System.Type)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = ComponentUtil.GetComponentsInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = ComponentUtil.GetComponentsInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: ComponentUtil.GetComponentsInChildren");
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
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Type>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg1_YXQP = (System.Type)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = ComponentUtil.GetComponentInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = ComponentUtil.GetComponentInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: ComponentUtil.GetComponentInChildren");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAllChild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			UnityEngine.Transform[] QPYX_o_YXQP = ComponentUtil.GetAllChild(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAllChildAndCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			LuaFunction QPYX_arg1_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			ComponentUtil.GetAllChildAndCallback(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SafeSetActive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			ComponentUtil.SafeSetActive(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

