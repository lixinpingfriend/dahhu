using System;
using LuaInterface;

public class QPYX_UnityEngine_SpriteWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Sprite), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("Create", QPYX_Create_YXQP);
		L_YXQP.RegFunction("OverrideGeometry", QPYX_OverrideGeometry_YXQP);
		L_YXQP.RegFunction("GetPhysicsShapeCount", QPYX_GetPhysicsShapeCount_YXQP);
		L_YXQP.RegFunction("GetPhysicsShapePointCount", QPYX_GetPhysicsShapePointCount_YXQP);
		L_YXQP.RegFunction("GetPhysicsShape", QPYX_GetPhysicsShape_YXQP);
		L_YXQP.RegFunction("OverridePhysicsShape", QPYX_OverridePhysicsShape_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Sprite_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("bounds", QPYX_get_bounds_YXQP, null);
		L_YXQP.RegVar("rect", QPYX_get_rect_YXQP, null);
		L_YXQP.RegVar("texture", QPYX_get_texture_YXQP, null);
		L_YXQP.RegVar("associatedAlphaSplitTexture", QPYX_get_associatedAlphaSplitTexture_YXQP, null);
		L_YXQP.RegVar("textureRect", QPYX_get_textureRect_YXQP, null);
		L_YXQP.RegVar("textureRectOffset", QPYX_get_textureRectOffset_YXQP, null);
		L_YXQP.RegVar("packed", QPYX_get_packed_YXQP, null);
		L_YXQP.RegVar("packingMode", QPYX_get_packingMode_YXQP, null);
		L_YXQP.RegVar("packingRotation", QPYX_get_packingRotation_YXQP, null);
		L_YXQP.RegVar("pivot", QPYX_get_pivot_YXQP, null);
		L_YXQP.RegVar("border", QPYX_get_border_YXQP, null);
		L_YXQP.RegVar("vertices", QPYX_get_vertices_YXQP, null);
		L_YXQP.RegVar("triangles", QPYX_get_triangles_YXQP, null);
		L_YXQP.RegVar("uv", QPYX_get_uv_YXQP, null);
		L_YXQP.RegVar("pixelsPerUnit", QPYX_get_pixelsPerUnit_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Sprite_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Sprite QPYX_obj_YXQP = new UnityEngine.Sprite();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Sprite.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Create_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg1_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 3);
				UnityEngine.Sprite QPYX_o_YXQP = UnityEngine.Sprite.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg1_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Sprite QPYX_o_YXQP = UnityEngine.Sprite.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg1_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				uint QPYX_arg4_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.Sprite QPYX_o_YXQP = UnityEngine.Sprite.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg1_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				uint QPYX_arg4_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.SpriteMeshType QPYX_arg5_YXQP = (UnityEngine.SpriteMeshType)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.SpriteMeshType));
				UnityEngine.Sprite QPYX_o_YXQP = UnityEngine.Sprite.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg1_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				uint QPYX_arg4_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.SpriteMeshType QPYX_arg5_YXQP = (UnityEngine.SpriteMeshType)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.SpriteMeshType));
				UnityEngine.Vector4 QPYX_arg6_YXQP = ToLua.ToVector4(L_YXQP, 7);
				UnityEngine.Sprite QPYX_o_YXQP = UnityEngine.Sprite.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 8)
			{
				UnityEngine.Texture2D QPYX_arg0_YXQP = (UnityEngine.Texture2D)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Texture2D));
				UnityEngine.Rect QPYX_arg1_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				uint QPYX_arg4_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.SpriteMeshType QPYX_arg5_YXQP = (UnityEngine.SpriteMeshType)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.SpriteMeshType));
				UnityEngine.Vector4 QPYX_arg6_YXQP = ToLua.ToVector4(L_YXQP, 7);
				bool QPYX_arg7_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 8);
				UnityEngine.Sprite QPYX_o_YXQP = UnityEngine.Sprite.Create(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Sprite.Create");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverrideGeometry_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Sprite  QPYX_obj_YXQP  = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Sprite));
			UnityEngine.Vector2[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector2>(L_YXQP, 2);
			ushort[] QPYX_arg1_YXQP = ToLua.CheckNumberArray<ushort>(L_YXQP, 3);
			QPYX_obj_YXQP.OverrideGeometry(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPhysicsShapeCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Sprite  QPYX_obj_YXQP  = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Sprite));
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetPhysicsShapeCount();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPhysicsShapePointCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Sprite  QPYX_obj_YXQP  = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Sprite));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetPhysicsShapePointCount(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPhysicsShape_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Sprite  QPYX_obj_YXQP  = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Sprite));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			System.Collections.Generic.List<UnityEngine.Vector2> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Vector2>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.List<UnityEngine.Vector2>));
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetPhysicsShape(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverridePhysicsShape_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Sprite  QPYX_obj_YXQP  = (UnityEngine.Sprite)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Sprite));
			System.Collections.Generic.IList<UnityEngine.Vector2[]> QPYX_arg0_YXQP = (System.Collections.Generic.IList<UnityEngine.Vector2[]>)ToLua.CheckObject<System.Collections.Generic.IList<UnityEngine.Vector2[]>>(L_YXQP, 2);
			QPYX_obj_YXQP.OverridePhysicsShape(QPYX_arg0_YXQP);
			return 0;
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
	static int QPYX_get_bounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_ret_YXQP = QPYX_obj_YXQP.bounds;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.rect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_texture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Texture2D QPYX_ret_YXQP = QPYX_obj_YXQP.texture;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index texture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_associatedAlphaSplitTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Texture2D QPYX_ret_YXQP = QPYX_obj_YXQP.associatedAlphaSplitTexture;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index associatedAlphaSplitTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_textureRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.textureRect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textureRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_textureRectOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.textureRectOffset;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textureRectOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_packed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.packed;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index packed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_packingMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.SpritePackingMode QPYX_ret_YXQP = QPYX_obj_YXQP.packingMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index packingMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_packingRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.SpritePackingRotation QPYX_ret_YXQP = QPYX_obj_YXQP.packingRotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index packingRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pivot_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.pivot;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pivot on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_border_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Vector4 QPYX_ret_YXQP = QPYX_obj_YXQP.border;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index border on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_vertices_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Vector2[] QPYX_ret_YXQP = QPYX_obj_YXQP.vertices;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index vertices on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_triangles_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			ushort[] QPYX_ret_YXQP = QPYX_obj_YXQP.triangles;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index triangles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uv_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			UnityEngine.Vector2[] QPYX_ret_YXQP = QPYX_obj_YXQP.uv;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uv on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelsPerUnit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Sprite QPYX_obj_YXQP = (UnityEngine.Sprite)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.pixelsPerUnit;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelsPerUnit on a nil value");
		}
	}
}

