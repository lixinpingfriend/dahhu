using System;
using LuaInterface;

public class QPYX_ViewUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("ViewUtil");
		L_YXQP.RegFunction("GetSpriteFromeAssetBundle", QPYX_GetSpriteFromeAssetBundle_YXQP);
		L_YXQP.RegFunction("InitViewGameObject", QPYX_InitViewGameObject_YXQP);
		L_YXQP.RegFunction("InitViewGameObjectAsync", QPYX_InitViewGameObjectAsync_YXQP);
		L_YXQP.RegFunction("InitGameObject", QPYX_InitGameObject_YXQP);
		L_YXQP.RegFunction("InitTable", QPYX_InitTable_YXQP);
		L_YXQP.RegFunction("InitCanvas", QPYX_InitCanvas_YXQP);
		L_YXQP.RegFunction("SetCanvasData", QPYX_SetCanvasData_YXQP);
		L_YXQP.RegFunction("ShowTop", QPYX_ShowTop_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetSpriteFromeAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.Sprite QPYX_o_YXQP = ViewUtil.GetSpriteFromeAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitViewGameObject_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.GameObject QPYX_o_YXQP = ViewUtil.InitViewGameObject(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitViewGameObjectAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			System.Action<UnityEngine.GameObject> QPYX_arg3_YXQP = (System.Action<UnityEngine.GameObject>)ToLua.CheckDelegate<System.Action<UnityEngine.GameObject>>(L_YXQP, 4);
			ViewUtil.InitViewGameObjectAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitGameObject_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.GameObject QPYX_arg2_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.GameObject));
			UnityEngine.GameObject QPYX_o_YXQP = ViewUtil.InitGameObject(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitTable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.GameObject QPYX_o_YXQP = ViewUtil.InitTable(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitCanvas_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			ViewUtil.InitCanvas(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCanvasData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			UnityEngine.Canvas QPYX_arg1_YXQP = (UnityEngine.Canvas)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Canvas));
			ViewUtil.SetCanvasData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShowTop_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.GameObject));
			ViewUtil.ShowTop(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

