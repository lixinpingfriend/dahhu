using System;
using LuaInterface;

public class QPYX_EmojiUtilWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(EmojiUtil), typeof(System.Object));
		L_YXQP.RegFunction("isEmojiCharacter", QPYX_isEmojiCharacter_YXQP);
		L_YXQP.RegFunction("getEmojiList", QPYX_getEmojiList_YXQP);
		L_YXQP.RegFunction("toUnicode", QPYX_toUnicode_YXQP);
		L_YXQP.RegFunction("CopyTextValueToEmojiText", QPYX_CopyTextValueToEmojiText_YXQP);
		L_YXQP.RegFunction("ReplaceComponentText", QPYX_ReplaceComponentText_YXQP);
		L_YXQP.RegFunction("containsEmoji", QPYX_containsEmoji_YXQP);
		L_YXQP.RegFunction("getLength", QPYX_getLength_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateEmojiUtil_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("emojiTextConfigPath", QPYX_get_emojiTextConfigPath_YXQP, QPYX_set_emojiTextConfigPath_YXQP);
		L_YXQP.RegVar("emojiMaterialPath", QPYX_get_emojiMaterialPath_YXQP, QPYX_set_emojiMaterialPath_YXQP);
		L_YXQP.RegVar("replaceStr", QPYX_get_replaceStr_YXQP, QPYX_set_replaceStr_YXQP);
		L_YXQP.RegVar("emojiMaterial", QPYX_get_emojiMaterial_YXQP, QPYX_set_emojiMaterial_YXQP);
		L_YXQP.RegVar("EmojiIndex", QPYX_get_EmojiIndex_YXQP, null);
		L_YXQP.RegVar("EmojiMaterial", QPYX_get_EmojiMaterial_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateEmojiUtil_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				EmojiUtil QPYX_obj_YXQP = new EmojiUtil();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: EmojiUtil.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_isEmojiCharacter_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			bool QPYX_o_YXQP = EmojiUtil.isEmojiCharacter(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_getEmojiList_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = null;
			System.Collections.Generic.List<EmojiElement> QPYX_o_YXQP = EmojiUtil.getEmojiList(QPYX_arg0_YXQP, out QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_arg1_YXQP);
			return 2;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_toUnicode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_o_YXQP = EmojiUtil.toUnicode(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CopyTextValueToEmojiText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Text QPYX_arg0_YXQP = (UnityEngine.UI.Text)ToLua.CheckObject<UnityEngine.UI.Text>(L_YXQP, 1);
			EmojiText QPYX_arg1_YXQP = (EmojiText)ToLua.CheckObject<EmojiText>(L_YXQP, 2);
			EmojiUtil.CopyTextValueToEmojiText(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReplaceComponentText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Text QPYX_arg0_YXQP = (UnityEngine.UI.Text)ToLua.CheckObject<UnityEngine.UI.Text>(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			EmojiText QPYX_o_YXQP = EmojiUtil.ReplaceComponentText(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_containsEmoji_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_o_YXQP = EmojiUtil.containsEmoji(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_getLength_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			int QPYX_o_YXQP = EmojiUtil.getLength(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_emojiTextConfigPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, EmojiUtil.emojiTextConfigPath);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_emojiMaterialPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, EmojiUtil.emojiMaterialPath);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_replaceStr_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, EmojiUtil.replaceStr);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_emojiMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, EmojiUtil.emojiMaterial);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EmojiIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, EmojiUtil.EmojiIndex);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EmojiMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, EmojiUtil.EmojiMaterial);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_emojiTextConfigPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			EmojiUtil.emojiTextConfigPath = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_emojiMaterialPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			EmojiUtil.emojiMaterialPath = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_replaceStr_YXQP(IntPtr L_YXQP)
	{
		try
		{
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			EmojiUtil.replaceStr = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_emojiMaterial_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			EmojiUtil.emojiMaterial = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

