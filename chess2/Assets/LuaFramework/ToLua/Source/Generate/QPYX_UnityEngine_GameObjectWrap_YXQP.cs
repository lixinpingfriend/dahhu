using System;
using LuaInterface;

public class QPYX_UnityEngine_GameObjectWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.GameObject), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("CreatePrimitive", QPYX_CreatePrimitive_YXQP);
		L_YXQP.RegFunction("GetComponent", QPYX_GetComponent_YXQP);
		L_YXQP.RegFunction("GetComponentInChildren", QPYX_GetComponentInChildren_YXQP);
		L_YXQP.RegFunction("GetComponentInParent", QPYX_GetComponentInParent_YXQP);
		L_YXQP.RegFunction("GetComponents", QPYX_GetComponents_YXQP);
		L_YXQP.RegFunction("GetComponentsInChildren", QPYX_GetComponentsInChildren_YXQP);
		L_YXQP.RegFunction("GetComponentsInParent", QPYX_GetComponentsInParent_YXQP);
		L_YXQP.RegFunction("SetActive", QPYX_SetActive_YXQP);
		L_YXQP.RegFunction("CompareTag", QPYX_CompareTag_YXQP);
		L_YXQP.RegFunction("FindGameObjectWithTag", QPYX_FindGameObjectWithTag_YXQP);
		L_YXQP.RegFunction("FindWithTag", QPYX_FindWithTag_YXQP);
		L_YXQP.RegFunction("FindGameObjectsWithTag", QPYX_FindGameObjectsWithTag_YXQP);
		L_YXQP.RegFunction("Find", QPYX_Find_YXQP);
		L_YXQP.RegFunction("AddComponent", QPYX_AddComponent_YXQP);
		L_YXQP.RegFunction("BroadcastMessage", QPYX_BroadcastMessage_YXQP);
		L_YXQP.RegFunction("SendMessageUpwards", QPYX_SendMessageUpwards_YXQP);
		L_YXQP.RegFunction("SendMessage", QPYX_SendMessage_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_GameObject_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("transform", QPYX_get_transform_YXQP, null);
		L_YXQP.RegVar("layer", QPYX_get_layer_YXQP, QPYX_set_layer_YXQP);
		L_YXQP.RegVar("activeSelf", QPYX_get_activeSelf_YXQP, null);
		L_YXQP.RegVar("activeInHierarchy", QPYX_get_activeInHierarchy_YXQP, null);
		L_YXQP.RegVar("isStatic", QPYX_get_isStatic_YXQP, QPYX_set_isStatic_YXQP);
		L_YXQP.RegVar("tag", QPYX_get_tag_YXQP, QPYX_set_tag_YXQP);
		L_YXQP.RegVar("scene", QPYX_get_scene_YXQP, null);
		L_YXQP.RegVar("gameObject", QPYX_get_gameObject_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_GameObject_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.GameObject QPYX_obj_YXQP = new UnityEngine.GameObject();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				UnityEngine.GameObject QPYX_obj_YXQP = new UnityEngine.GameObject(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<System.Type>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				System.Type[] QPYX_arg1_YXQP = ToLua.ToParamsObject<System.Type>(L_YXQP, 2, QPYX_count_YXQP - 1);
				UnityEngine.GameObject QPYX_obj_YXQP = new UnityEngine.GameObject(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.GameObject.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CreatePrimitive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.PrimitiveType QPYX_arg0_YXQP = (UnityEngine.PrimitiveType)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.PrimitiveType));
			UnityEngine.GameObject QPYX_o_YXQP = UnityEngine.GameObject.CreatePrimitive(QPYX_arg0_YXQP);
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
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponent(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Type>(L_YXQP, 2))
			{
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = (System.Type)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponent(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.GetComponent");
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
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentInChildren(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.GetComponentInChildren");
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
			UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
			UnityEngine.Component QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentInParent(QPYX_arg0_YXQP);
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
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponents(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.Component> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Component>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.List<UnityEngine.Component>));
				QPYX_obj_YXQP.GetComponents(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.GetComponents");
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
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInChildren(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInChildren(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.GetComponentsInChildren");
			}
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
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInParent(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Component[] QPYX_o_YXQP = QPYX_obj_YXQP.GetComponentsInParent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.GetComponentsInParent");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetActive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.SetActive(QPYX_arg0_YXQP);
			return 0;
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
			UnityEngine.GameObject  QPYX_obj_YXQP  = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.CompareTag(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindGameObjectWithTag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.GameObject QPYX_o_YXQP = UnityEngine.GameObject.FindGameObjectWithTag(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindWithTag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.GameObject QPYX_o_YXQP = UnityEngine.GameObject.FindWithTag(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindGameObjectsWithTag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.GameObject[] QPYX_o_YXQP = UnityEngine.GameObject.FindGameObjectsWithTag(QPYX_arg0_YXQP);
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
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.GameObject QPYX_o_YXQP = UnityEngine.GameObject.Find(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddComponent_YXQP(IntPtr L_YXQP)
	{
		IntPtr L0_YXQP = LuaException.L;

        try
        {
            ++LuaException.InstantiateCount;
            LuaException.L = L_YXQP;
            ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
			UnityEngine.Component o = obj.AddComponent(QPYX_arg0_YXQP);

            if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
            {
                string error = LuaDLL.lua_tostring(L_YXQP, -1);
                LuaDLL.lua_pop(L_YXQP, 1);
                throw new LuaException(error, LuaException.GetLastError());
            }

            ToLua.Push(L_YXQP, o);
            LuaException.L = L0_YXQP;
            --LuaException.InstantiateCount;
            return 1;
		}
		catch (Exception e)
		{
            LuaException.L = L0_YXQP;
            --LuaException.InstantiateCount;
            return LuaDLL.toluaL_exception(L_YXQP, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BroadcastMessage_YXQP(IntPtr L_YXQP)
	{
		IntPtr L0_YXQP = LuaException.L;
    
		try
		{
            ++LuaException.SendMsgCount;
            LuaException.L = L_YXQP;
            int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);

			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				obj.BroadcastMessage(QPYX_arg0_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.SendMessageOptions>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.SendMessageOptions QPYX_arg1_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 3);
				obj.BroadcastMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, object>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				obj.BroadcastMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, object, UnityEngine.SendMessageOptions>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.SendMessageOptions QPYX_arg2_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 4);
				obj.BroadcastMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else
			{
                --LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.BroadcastMessage");
			}
		}
		catch (Exception e)
		{
			--LuaException.SendMsgCount;
			LuaException.L = L0_YXQP;
			return LuaDLL.toluaL_exception(L_YXQP, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendMessageUpwards_YXQP(IntPtr L_YXQP)
	{
		IntPtr L0_YXQP = LuaException.L;

		try
		{
            ++LuaException.SendMsgCount;
            LuaException.L = L_YXQP;
            int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);

			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				obj.SendMessageUpwards(QPYX_arg0_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.SendMessageOptions>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.SendMessageOptions QPYX_arg1_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 3);
				obj.SendMessageUpwards(QPYX_arg0_YXQP, QPYX_arg1_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, object>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				obj.SendMessageUpwards(QPYX_arg0_YXQP, QPYX_arg1_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, object, UnityEngine.SendMessageOptions>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.SendMessageOptions QPYX_arg2_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 4);
				obj.SendMessageUpwards(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
                return 0;
			}
			else
			{
				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;                
                return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.SendMessageUpwards");
			}
		}
		catch (Exception e)
		{
			--LuaException.SendMsgCount;
			LuaException.L = L0_YXQP;
			return LuaDLL.toluaL_exception(L_YXQP, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendMessage_YXQP(IntPtr L_YXQP)
	{
		IntPtr L0_YXQP = LuaException.L;

		try
		{
            ++LuaException.SendMsgCount;
            LuaException.L = L_YXQP;
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);

			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				obj.SendMessage(QPYX_arg0_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }
                
				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.SendMessageOptions>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.SendMessageOptions QPYX_arg1_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 3);
				obj.SendMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, object>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				obj.SendMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, object, UnityEngine.SendMessageOptions>(L_YXQP, 2))
			{
				UnityEngine.GameObject obj = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.SendMessageOptions QPYX_arg2_YXQP = (UnityEngine.SendMessageOptions)ToLua.ToObject(L_YXQP, 4);
				obj.SendMessage(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);                

                if (LuaDLL.lua_toboolean(L_YXQP, LuaDLL.lua_upvalueindex(1)))
                {
                    string error = LuaDLL.lua_tostring(L_YXQP, -1);
                    LuaDLL.lua_pop(L_YXQP, 1);
                    throw new LuaException(error, LuaException.GetLastError());
                }

				--LuaException.SendMsgCount;
                LuaException.L = L0_YXQP;
				return 0;
			}
			else
			{
                --LuaException.SendMsgCount;      
                LuaException.L = L0_YXQP;                          
                return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.GameObject.SendMessage");     
			}
		}
		catch(Exception e)
		{
			--LuaException.SendMsgCount;
			LuaException.L = L0_YXQP;
			return LuaDLL.toluaL_exception(L_YXQP, e);
		}
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.transform;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transform on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_layer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.layer;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_activeSelf_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.activeSelf;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index activeSelf on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_activeInHierarchy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.activeInHierarchy;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index activeInHierarchy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isStatic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isStatic;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isStatic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_tag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.tag;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tag on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scene_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			UnityEngine.SceneManagement.Scene QPYX_ret_YXQP = QPYX_obj_YXQP.scene;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scene on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gameObject_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_ret_YXQP = QPYX_obj_YXQP.gameObject;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameObject on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_layer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.layer = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isStatic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isStatic = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isStatic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_tag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.GameObject QPYX_obj_YXQP = (UnityEngine.GameObject)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.tag = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tag on a nil value");
		}
	}
}

