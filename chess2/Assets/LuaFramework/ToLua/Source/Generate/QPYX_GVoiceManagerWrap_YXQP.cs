using System;
using LuaInterface;

public class QPYX_GVoiceManagerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GVoiceManager), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("Init", QPYX_Init_YXQP);
		L_YXQP.RegFunction("SetEventListener", QPYX_SetEventListener_YXQP);
		L_YXQP.RegFunction("ClearEventListener", QPYX_ClearEventListener_YXQP);
		L_YXQP.RegFunction("StartRecording", QPYX_StartRecording_YXQP);
		L_YXQP.RegFunction("StopRecording", QPYX_StopRecording_YXQP);
		L_YXQP.RegFunction("UploadRecordedFile", QPYX_UploadRecordedFile_YXQP);
		L_YXQP.RegFunction("DownloadRecordedFile", QPYX_DownloadRecordedFile_YXQP);
		L_YXQP.RegFunction("PlayRecordedFile", QPYX_PlayRecordedFile_YXQP);
		L_YXQP.RegFunction("StopPlayFile", QPYX_StopPlayFile_YXQP);
		L_YXQP.RegFunction("PauseVoice", QPYX_PauseVoice_YXQP);
		L_YXQP.RegFunction("ResumeVoice", QPYX_ResumeVoice_YXQP);
		L_YXQP.RegFunction("InitTeam", QPYX_InitTeam_YXQP);
		L_YXQP.RegFunction("JoinTeamRoom", QPYX_JoinTeamRoom_YXQP);
		L_YXQP.RegFunction("QuitTeamRoom", QPYX_QuitTeamRoom_YXQP);
		L_YXQP.RegFunction("OpenMic", QPYX_OpenMic_YXQP);
		L_YXQP.RegFunction("CloseMic", QPYX_CloseMic_YXQP);
		L_YXQP.RegFunction("OpenSpeaker", QPYX_OpenSpeaker_YXQP);
		L_YXQP.RegFunction("CloseSpeaker", QPYX_CloseSpeaker_YXQP);
		L_YXQP.RegFunction("SetTeamEventListener", QPYX_SetTeamEventListener_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("mVoiceengine", QPYX_get_mVoiceengine_YXQP, QPYX_set_mVoiceengine_YXQP);
		L_YXQP.RegVar("onAction", QPYX_get_onAction_YXQP, QPYX_set_onAction_YXQP);
		L_YXQP.RegVar("PauseStatus", QPYX_get_PauseStatus_YXQP, QPYX_set_PauseStatus_YXQP);
		L_YXQP.RegVar("instance", QPYX_get_instance_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Init_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
			int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
			QPYX_obj_YXQP.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetEventListener_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				System.Action<string,string> QPYX_arg1_YXQP = (System.Action<string,string>)ToLua.CheckDelegate<System.Action<string,string>>(L_YXQP, 3);
				System.Action<string> QPYX_arg2_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 4);
				QPYX_obj_YXQP.SetEventListener(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
				System.Action<string> QPYX_arg0_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 2);
				System.Action<string,string> QPYX_arg1_YXQP = (System.Action<string,string>)ToLua.CheckDelegate<System.Action<string,string>>(L_YXQP, 3);
				System.Action<string> QPYX_arg2_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 4);
				System.Action<string> QPYX_arg3_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 5);
				QPYX_obj_YXQP.SetEventListener(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GVoiceManager.SetEventListener");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearEventListener_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			QPYX_obj_YXQP.ClearEventListener();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartRecording_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.StartRecording(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopRecording_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			QPYX_obj_YXQP.StopRecording();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UploadRecordedFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.UploadRecordedFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DownloadRecordedFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			QPYX_obj_YXQP.DownloadRecordedFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayRecordedFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.PlayRecordedFile(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopPlayFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			QPYX_obj_YXQP.StopPlayFile();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PauseVoice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			QPYX_obj_YXQP.PauseVoice();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResumeVoice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			QPYX_obj_YXQP.ResumeVoice();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitTeam_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 5)
			{
				GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.InitTeam(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_o_YXQP = QPYX_obj_YXQP.InitTeam(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GVoiceManager.InitTeam");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_JoinTeamRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			System.Action<int,string,int> QPYX_arg2_YXQP = (System.Action<int,string,int>)ToLua.CheckDelegate<System.Action<int,string,int>>(L_YXQP, 4);
			int QPYX_o_YXQP = QPYX_obj_YXQP.JoinTeamRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_QuitTeamRoom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			System.Action<int,string,int> QPYX_arg2_YXQP = (System.Action<int,string,int>)ToLua.CheckDelegate<System.Action<int,string,int>>(L_YXQP, 4);
			int QPYX_o_YXQP = QPYX_obj_YXQP.QuitTeamRoom(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OpenMic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.OpenMic();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CloseMic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.CloseMic();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OpenSpeaker_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.OpenSpeaker();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CloseSpeaker_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.CloseSpeaker();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTeamEventListener_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GVoiceManager  QPYX_obj_YXQP  = (GVoiceManager)ToLua.CheckObject<GVoiceManager>(L_YXQP, 1);
			System.Action<int,string,int> QPYX_arg0_YXQP = (System.Action<int,string,int>)ToLua.CheckDelegate<System.Action<int,string,int>>(L_YXQP, 2);
			System.Action<int,string,int> QPYX_arg1_YXQP = (System.Action<int,string,int>)ToLua.CheckDelegate<System.Action<int,string,int>>(L_YXQP, 3);
			QPYX_obj_YXQP.SetTeamEventListener(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
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
	static int QPYX_get_mVoiceengine_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GVoiceManager QPYX_obj_YXQP = (GVoiceManager)QPYX_o_YXQP;
			gcloud_voice.IGCloudVoice QPYX_ret_YXQP = QPYX_obj_YXQP.mVoiceengine;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mVoiceengine on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onAction_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GVoiceManager QPYX_obj_YXQP = (GVoiceManager)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onAction;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onAction on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_PauseStatus_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GVoiceManager QPYX_obj_YXQP = (GVoiceManager)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.PauseStatus;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index PauseStatus on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_instance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, GVoiceManager.instance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mVoiceengine_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GVoiceManager QPYX_obj_YXQP = (GVoiceManager)QPYX_o_YXQP;
			gcloud_voice.IGCloudVoice QPYX_arg0_YXQP = (gcloud_voice.IGCloudVoice)ToLua.CheckObject<gcloud_voice.IGCloudVoice>(L_YXQP, 2);
			QPYX_obj_YXQP.mVoiceengine = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mVoiceengine on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onAction_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GVoiceManager QPYX_obj_YXQP = (GVoiceManager)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onAction = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onAction on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_PauseStatus_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GVoiceManager QPYX_obj_YXQP = (GVoiceManager)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.PauseStatus = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index PauseStatus on a nil value");
		}
	}
}

