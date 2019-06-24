using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_BaseMeshEffectWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.BaseMeshEffect), typeof(UnityEngine.EventSystems.UIBehaviour));
		L_YXQP.RegFunction("ModifyMesh", QPYX_ModifyMesh_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ModifyMesh_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.UI.VertexHelper>(L_YXQP, 2))
			{
				UnityEngine.UI.BaseMeshEffect  QPYX_obj_YXQP  = (UnityEngine.UI.BaseMeshEffect)ToLua.CheckObject<UnityEngine.UI.BaseMeshEffect>(L_YXQP, 1);
				UnityEngine.UI.VertexHelper QPYX_arg0_YXQP = (UnityEngine.UI.VertexHelper)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.ModifyMesh(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Mesh>(L_YXQP, 2))
			{
				UnityEngine.UI.BaseMeshEffect  QPYX_obj_YXQP  = (UnityEngine.UI.BaseMeshEffect)ToLua.CheckObject<UnityEngine.UI.BaseMeshEffect>(L_YXQP, 1);
				UnityEngine.Mesh QPYX_arg0_YXQP = (UnityEngine.Mesh)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.ModifyMesh(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.UI.BaseMeshEffect.ModifyMesh");
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
}

