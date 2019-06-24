using System;
using LuaInterface;

public class QPYX_BestHTTP_HTTPRequestWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(BestHTTP.HTTPRequest), typeof(System.Object));
		L_YXQP.RegFunction("AddField", QPYX_AddField_YXQP);
		L_YXQP.RegFunction("AddBinaryData", QPYX_AddBinaryData_YXQP);
		L_YXQP.RegFunction("SetFields", QPYX_SetFields_YXQP);
		L_YXQP.RegFunction("SetForm", QPYX_SetForm_YXQP);
		L_YXQP.RegFunction("ClearForm", QPYX_ClearForm_YXQP);
		L_YXQP.RegFunction("AddHeader", QPYX_AddHeader_YXQP);
		L_YXQP.RegFunction("SetHeader", QPYX_SetHeader_YXQP);
		L_YXQP.RegFunction("RemoveHeader", QPYX_RemoveHeader_YXQP);
		L_YXQP.RegFunction("HasHeader", QPYX_HasHeader_YXQP);
		L_YXQP.RegFunction("GetFirstHeaderValue", QPYX_GetFirstHeaderValue_YXQP);
		L_YXQP.RegFunction("GetHeaderValues", QPYX_GetHeaderValues_YXQP);
		L_YXQP.RegFunction("RemoveHeaders", QPYX_RemoveHeaders_YXQP);
		L_YXQP.RegFunction("SetRangeHeader", QPYX_SetRangeHeader_YXQP);
		L_YXQP.RegFunction("EnumerateHeaders", QPYX_EnumerateHeaders_YXQP);
		L_YXQP.RegFunction("DumpHeaders", QPYX_DumpHeaders_YXQP);
		L_YXQP.RegFunction("Send", QPYX_Send_YXQP);
		L_YXQP.RegFunction("Abort", QPYX_Abort_YXQP);
		L_YXQP.RegFunction("Clear", QPYX_Clear_YXQP);
		L_YXQP.RegFunction("MoveNext", QPYX_MoveNext_YXQP);
		L_YXQP.RegFunction("Reset", QPYX_Reset_YXQP);
		L_YXQP.RegFunction("Dispose", QPYX_Dispose_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateBestHTTP_HTTPRequest_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("EOL", QPYX_get_EOL_YXQP, null);
		L_YXQP.RegVar("MethodNames", QPYX_get_MethodNames_YXQP, null);
		L_YXQP.RegVar("UploadChunkSize", QPYX_get_UploadChunkSize_YXQP, QPYX_set_UploadChunkSize_YXQP);
		L_YXQP.RegVar("OnUploadProgress", QPYX_get_OnUploadProgress_YXQP, QPYX_set_OnUploadProgress_YXQP);
		L_YXQP.RegVar("OnProgress", QPYX_get_OnProgress_YXQP, QPYX_set_OnProgress_YXQP);
		L_YXQP.RegVar("OnUpgraded", QPYX_get_OnUpgraded_YXQP, QPYX_set_OnUpgraded_YXQP);
		L_YXQP.RegVar("Uri", QPYX_get_Uri_YXQP, null);
		L_YXQP.RegVar("MethodType", QPYX_get_MethodType_YXQP, QPYX_set_MethodType_YXQP);
		L_YXQP.RegVar("RawData", QPYX_get_RawData_YXQP, QPYX_set_RawData_YXQP);
		L_YXQP.RegVar("UploadStream", QPYX_get_UploadStream_YXQP, QPYX_set_UploadStream_YXQP);
		L_YXQP.RegVar("DisposeUploadStream", QPYX_get_DisposeUploadStream_YXQP, QPYX_set_DisposeUploadStream_YXQP);
		L_YXQP.RegVar("UseUploadStreamLength", QPYX_get_UseUploadStreamLength_YXQP, QPYX_set_UseUploadStreamLength_YXQP);
		L_YXQP.RegVar("IsKeepAlive", QPYX_get_IsKeepAlive_YXQP, QPYX_set_IsKeepAlive_YXQP);
		L_YXQP.RegVar("UseStreaming", QPYX_get_UseStreaming_YXQP, QPYX_set_UseStreaming_YXQP);
		L_YXQP.RegVar("StreamFragmentSize", QPYX_get_StreamFragmentSize_YXQP, QPYX_set_StreamFragmentSize_YXQP);
		L_YXQP.RegVar("Callback", QPYX_get_Callback_YXQP, QPYX_set_Callback_YXQP);
		L_YXQP.RegVar("DisableRetry", QPYX_get_DisableRetry_YXQP, QPYX_set_DisableRetry_YXQP);
		L_YXQP.RegVar("IsRedirected", QPYX_get_IsRedirected_YXQP, null);
		L_YXQP.RegVar("RedirectUri", QPYX_get_RedirectUri_YXQP, null);
		L_YXQP.RegVar("CurrentUri", QPYX_get_CurrentUri_YXQP, null);
		L_YXQP.RegVar("Response", QPYX_get_Response_YXQP, null);
		L_YXQP.RegVar("ProxyResponse", QPYX_get_ProxyResponse_YXQP, null);
		L_YXQP.RegVar("Exception", QPYX_get_Exception_YXQP, null);
		L_YXQP.RegVar("Tag", QPYX_get_Tag_YXQP, QPYX_set_Tag_YXQP);
		L_YXQP.RegVar("Credentials", QPYX_get_Credentials_YXQP, QPYX_set_Credentials_YXQP);
		L_YXQP.RegVar("HasProxy", QPYX_get_HasProxy_YXQP, null);
		L_YXQP.RegVar("Proxy", QPYX_get_Proxy_YXQP, QPYX_set_Proxy_YXQP);
		L_YXQP.RegVar("MaxRedirects", QPYX_get_MaxRedirects_YXQP, QPYX_set_MaxRedirects_YXQP);
		L_YXQP.RegVar("FormUsage", QPYX_get_FormUsage_YXQP, QPYX_set_FormUsage_YXQP);
		L_YXQP.RegVar("State", QPYX_get_State_YXQP, null);
		L_YXQP.RegVar("RedirectCount", QPYX_get_RedirectCount_YXQP, null);
		L_YXQP.RegVar("ConnectTimeout", QPYX_get_ConnectTimeout_YXQP, QPYX_set_ConnectTimeout_YXQP);
		L_YXQP.RegVar("Timeout", QPYX_get_Timeout_YXQP, QPYX_set_Timeout_YXQP);
		L_YXQP.RegVar("EnableTimoutForStreaming", QPYX_get_EnableTimoutForStreaming_YXQP, QPYX_set_EnableTimoutForStreaming_YXQP);
		L_YXQP.RegVar("EnableSafeReadOnUnknownContentLength", QPYX_get_EnableSafeReadOnUnknownContentLength_YXQP, QPYX_set_EnableSafeReadOnUnknownContentLength_YXQP);
		L_YXQP.RegVar("Priority", QPYX_get_Priority_YXQP, QPYX_set_Priority_YXQP);
		L_YXQP.RegVar("ProtocolHandler", QPYX_get_ProtocolHandler_YXQP, QPYX_set_ProtocolHandler_YXQP);
		L_YXQP.RegVar("Current", QPYX_get_Current_YXQP, null);
		L_YXQP.RegVar("CustomCertificationValidator", QPYX_get_CustomCertificationValidator_YXQP, QPYX_set_CustomCertificationValidator_YXQP);
		L_YXQP.RegVar("OnBeforeRedirection", QPYX_get_OnBeforeRedirection_YXQP, QPYX_set_OnBeforeRedirection_YXQP);
		L_YXQP.RegVar("OnBeforeHeaderSend", QPYX_get_OnBeforeHeaderSend_YXQP, QPYX_set_OnBeforeHeaderSend_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateBestHTTP_HTTPRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<BestHTTP.HTTPMethods>(L_YXQP, 2))
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				BestHTTP.HTTPMethods QPYX_arg1_YXQP = (BestHTTP.HTTPMethods)ToLua.ToObject(L_YXQP, 2);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 2))
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				BestHTTP.OnRequestFinishedDelegate QPYX_arg1_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.ToObject(L_YXQP, 2);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<BestHTTP.HTTPMethods, BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 2))
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				BestHTTP.HTTPMethods QPYX_arg1_YXQP = (BestHTTP.HTTPMethods)ToLua.ToObject(L_YXQP, 2);
				BestHTTP.OnRequestFinishedDelegate QPYX_arg2_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.ToObject(L_YXQP, 3);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<bool, BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 2))
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 2);
				BestHTTP.OnRequestFinishedDelegate QPYX_arg2_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.ToObject(L_YXQP, 3);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<BestHTTP.HTTPMethods, bool, BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 2))
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				BestHTTP.HTTPMethods QPYX_arg1_YXQP = (BestHTTP.HTTPMethods)ToLua.ToObject(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.lua_toboolean(L_YXQP, 3);
				BestHTTP.OnRequestFinishedDelegate QPYX_arg3_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.ToObject(L_YXQP, 4);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<bool, bool, BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 2))
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.lua_toboolean(L_YXQP, 3);
				BestHTTP.OnRequestFinishedDelegate QPYX_arg3_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.ToObject(L_YXQP, 4);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				System.Uri QPYX_arg0_YXQP = (System.Uri)ToLua.CheckObject<System.Uri>(L_YXQP, 1);
				BestHTTP.HTTPMethods QPYX_arg1_YXQP = (BestHTTP.HTTPMethods)ToLua.CheckObject(L_YXQP, 2, typeof(BestHTTP.HTTPMethods));
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				BestHTTP.OnRequestFinishedDelegate QPYX_arg4_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.CheckDelegate<BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 5);
				BestHTTP.HTTPRequest QPYX_obj_YXQP = new BestHTTP.HTTPRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: BestHTTP.HTTPRequest.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddField_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				QPYX_obj_YXQP.AddField(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				System.Text.Encoding QPYX_arg2_YXQP = (System.Text.Encoding)ToLua.CheckObject<System.Text.Encoding>(L_YXQP, 4);
				QPYX_obj_YXQP.AddField(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: BestHTTP.HTTPRequest.AddField");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddBinaryData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
				QPYX_obj_YXQP.AddBinaryData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				QPYX_obj_YXQP.AddBinaryData(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
				string QPYX_arg3_YXQP = ToLua.CheckString(L_YXQP, 5);
				QPYX_obj_YXQP.AddBinaryData(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: BestHTTP.HTTPRequest.AddBinaryData");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetFields_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			UnityEngine.WWWForm QPYX_arg0_YXQP = (UnityEngine.WWWForm)ToLua.CheckObject<UnityEngine.WWWForm>(L_YXQP, 2);
			QPYX_obj_YXQP.SetFields(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetForm_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			BestHTTP.Forms.HTTPFormBase QPYX_arg0_YXQP = (BestHTTP.Forms.HTTPFormBase)ToLua.CheckObject<BestHTTP.Forms.HTTPFormBase>(L_YXQP, 2);
			QPYX_obj_YXQP.SetForm(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearForm_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			QPYX_obj_YXQP.ClearForm();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.AddHeader(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.SetHeader(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.RemoveHeader(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HasHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.HasHeader(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFirstHeaderValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetFirstHeaderValue(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetHeaderValues_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			System.Collections.Generic.List<string> QPYX_o_YXQP = QPYX_obj_YXQP.GetHeaderValues(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveHeaders_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			QPYX_obj_YXQP.RemoveHeaders();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetRangeHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				QPYX_obj_YXQP.SetRangeHeader(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetRangeHeader(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: BestHTTP.HTTPRequest.SetRangeHeader");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnumerateHeaders_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				BestHTTP.OnHeaderEnumerationDelegate QPYX_arg0_YXQP = (BestHTTP.OnHeaderEnumerationDelegate)ToLua.CheckDelegate<BestHTTP.OnHeaderEnumerationDelegate>(L_YXQP, 2);
				QPYX_obj_YXQP.EnumerateHeaders(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
				BestHTTP.OnHeaderEnumerationDelegate QPYX_arg0_YXQP = (BestHTTP.OnHeaderEnumerationDelegate)ToLua.CheckDelegate<BestHTTP.OnHeaderEnumerationDelegate>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.EnumerateHeaders(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: BestHTTP.HTTPRequest.EnumerateHeaders");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DumpHeaders_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			string QPYX_o_YXQP = QPYX_obj_YXQP.DumpHeaders();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Send_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			BestHTTP.HTTPRequest QPYX_o_YXQP = QPYX_obj_YXQP.Send();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Abort_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			QPYX_obj_YXQP.Abort();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Clear_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			QPYX_obj_YXQP.Clear();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MoveNext_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			bool QPYX_o_YXQP = QPYX_obj_YXQP.MoveNext();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Reset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			QPYX_obj_YXQP.Reset();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Dispose_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			BestHTTP.HTTPRequest  QPYX_obj_YXQP  = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			QPYX_obj_YXQP.Dispose();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EOL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, BestHTTP.HTTPRequest.EOL);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_MethodNames_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, BestHTTP.HTTPRequest.MethodNames);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_UploadChunkSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,BestHTTP.HTTPRequest.UploadChunkSize);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnUploadProgress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnUploadProgressDelegate QPYX_ret_YXQP = QPYX_obj_YXQP.OnUploadProgress;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnUploadProgress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnProgress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnDownloadProgressDelegate QPYX_ret_YXQP = QPYX_obj_YXQP.OnProgress;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnProgress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnUpgraded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnRequestFinishedDelegate QPYX_ret_YXQP = QPYX_obj_YXQP.OnUpgraded;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnUpgraded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Uri_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.Uri QPYX_ret_YXQP = QPYX_obj_YXQP.Uri;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Uri on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_MethodType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.HTTPMethods QPYX_ret_YXQP = QPYX_obj_YXQP.MethodType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index MethodType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RawData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.RawData;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index RawData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_UploadStream_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.IO.Stream QPYX_ret_YXQP = QPYX_obj_YXQP.UploadStream;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index UploadStream on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_DisposeUploadStream_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.DisposeUploadStream;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index DisposeUploadStream on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_UseUploadStreamLength_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.UseUploadStreamLength;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index UseUploadStreamLength on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_IsKeepAlive_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsKeepAlive;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsKeepAlive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_UseStreaming_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.UseStreaming;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index UseStreaming on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_StreamFragmentSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.StreamFragmentSize;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index StreamFragmentSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Callback_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnRequestFinishedDelegate QPYX_ret_YXQP = QPYX_obj_YXQP.Callback;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Callback on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_DisableRetry_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.DisableRetry;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index DisableRetry on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_IsRedirected_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.IsRedirected;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsRedirected on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RedirectUri_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.Uri QPYX_ret_YXQP = QPYX_obj_YXQP.RedirectUri;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index RedirectUri on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_CurrentUri_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.Uri QPYX_ret_YXQP = QPYX_obj_YXQP.CurrentUri;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index CurrentUri on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Response_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.HTTPResponse QPYX_ret_YXQP = QPYX_obj_YXQP.Response;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Response on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ProxyResponse_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.HTTPResponse QPYX_ret_YXQP = QPYX_obj_YXQP.ProxyResponse;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ProxyResponse on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Exception_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.Exception QPYX_ret_YXQP = QPYX_obj_YXQP.Exception;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Exception on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Tag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			object QPYX_ret_YXQP = QPYX_obj_YXQP.Tag;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Tag on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Credentials_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.Authentication.Credentials QPYX_ret_YXQP = QPYX_obj_YXQP.Credentials;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Credentials on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_HasProxy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.HasProxy;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index HasProxy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Proxy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.HTTPProxy QPYX_ret_YXQP = QPYX_obj_YXQP.Proxy;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Proxy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_MaxRedirects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.MaxRedirects;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index MaxRedirects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_FormUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.Forms.HTTPFormUsage QPYX_ret_YXQP = QPYX_obj_YXQP.FormUsage;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index FormUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_State_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.HTTPRequestStates QPYX_ret_YXQP = QPYX_obj_YXQP.State;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index State on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RedirectCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.RedirectCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index RedirectCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ConnectTimeout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.TimeSpan QPYX_ret_YXQP = QPYX_obj_YXQP.ConnectTimeout;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ConnectTimeout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Timeout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.TimeSpan QPYX_ret_YXQP = QPYX_obj_YXQP.Timeout;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Timeout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EnableTimoutForStreaming_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.EnableTimoutForStreaming;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index EnableTimoutForStreaming on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_EnableSafeReadOnUnknownContentLength_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.EnableSafeReadOnUnknownContentLength;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index EnableSafeReadOnUnknownContentLength on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Priority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.Priority;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Priority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ProtocolHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.SupportedProtocols QPYX_ret_YXQP = QPYX_obj_YXQP.ProtocolHandler;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ProtocolHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Current_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			object QPYX_ret_YXQP = QPYX_obj_YXQP.Current;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Current on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_CustomCertificationValidator_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnBeforeRedirection_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(BestHTTP.OnBeforeRedirectionDelegate)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnBeforeHeaderSend_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(BestHTTP.OnBeforeHeaderSendDelegate)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_UploadChunkSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			BestHTTP.HTTPRequest.UploadChunkSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnUploadProgress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnUploadProgressDelegate QPYX_arg0_YXQP = (BestHTTP.OnUploadProgressDelegate)ToLua.CheckDelegate<BestHTTP.OnUploadProgressDelegate>(L_YXQP, 2);
			QPYX_obj_YXQP.OnUploadProgress = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnUploadProgress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnProgress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnDownloadProgressDelegate QPYX_arg0_YXQP = (BestHTTP.OnDownloadProgressDelegate)ToLua.CheckDelegate<BestHTTP.OnDownloadProgressDelegate>(L_YXQP, 2);
			QPYX_obj_YXQP.OnProgress = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnProgress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnUpgraded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnRequestFinishedDelegate QPYX_arg0_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.CheckDelegate<BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 2);
			QPYX_obj_YXQP.OnUpgraded = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnUpgraded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_MethodType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.HTTPMethods QPYX_arg0_YXQP = (BestHTTP.HTTPMethods)ToLua.CheckObject(L_YXQP, 2, typeof(BestHTTP.HTTPMethods));
			QPYX_obj_YXQP.MethodType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index MethodType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_RawData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			QPYX_obj_YXQP.RawData = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index RawData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_UploadStream_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 2);
			QPYX_obj_YXQP.UploadStream = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index UploadStream on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_DisposeUploadStream_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.DisposeUploadStream = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index DisposeUploadStream on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_UseUploadStreamLength_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.UseUploadStreamLength = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index UseUploadStreamLength on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_IsKeepAlive_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.IsKeepAlive = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index IsKeepAlive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_UseStreaming_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.UseStreaming = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index UseStreaming on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_StreamFragmentSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.StreamFragmentSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index StreamFragmentSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Callback_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.OnRequestFinishedDelegate QPYX_arg0_YXQP = (BestHTTP.OnRequestFinishedDelegate)ToLua.CheckDelegate<BestHTTP.OnRequestFinishedDelegate>(L_YXQP, 2);
			QPYX_obj_YXQP.Callback = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Callback on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_DisableRetry_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.DisableRetry = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index DisableRetry on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Tag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			QPYX_obj_YXQP.Tag = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Tag on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Credentials_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.Authentication.Credentials QPYX_arg0_YXQP = (BestHTTP.Authentication.Credentials)ToLua.CheckObject(L_YXQP, 2, typeof(BestHTTP.Authentication.Credentials));
			QPYX_obj_YXQP.Credentials = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Credentials on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Proxy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.HTTPProxy QPYX_arg0_YXQP = (BestHTTP.HTTPProxy)ToLua.CheckObject(L_YXQP, 2, typeof(BestHTTP.HTTPProxy));
			QPYX_obj_YXQP.Proxy = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Proxy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_MaxRedirects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.MaxRedirects = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index MaxRedirects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_FormUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.Forms.HTTPFormUsage QPYX_arg0_YXQP = (BestHTTP.Forms.HTTPFormUsage)ToLua.CheckObject(L_YXQP, 2, typeof(BestHTTP.Forms.HTTPFormUsage));
			QPYX_obj_YXQP.FormUsage = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index FormUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ConnectTimeout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.TimeSpan QPYX_arg0_YXQP = StackTraits<System.TimeSpan>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.ConnectTimeout = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ConnectTimeout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Timeout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			System.TimeSpan QPYX_arg0_YXQP = StackTraits<System.TimeSpan>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.Timeout = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Timeout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_EnableTimoutForStreaming_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.EnableTimoutForStreaming = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index EnableTimoutForStreaming on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_EnableSafeReadOnUnknownContentLength_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.EnableSafeReadOnUnknownContentLength = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index EnableSafeReadOnUnknownContentLength on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Priority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.Priority = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Priority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ProtocolHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)QPYX_o_YXQP;
			BestHTTP.SupportedProtocols QPYX_arg0_YXQP = (BestHTTP.SupportedProtocols)ToLua.CheckObject(L_YXQP, 2, typeof(BestHTTP.SupportedProtocols));
			QPYX_obj_YXQP.ProtocolHandler = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ProtocolHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_CustomCertificationValidator_YXQP(IntPtr L_YXQP)
	{
		try
		{
			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'BestHTTP.HTTPRequest.CustomCertificationValidator' can only appear on the left hand side of += or -= when used outside of the type 'BestHTTP.HTTPRequest'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool> QPYX_ev_YXQP = (System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.CustomCertificationValidator += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool> QPYX_ev_YXQP = (System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.CustomCertificationValidator -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnBeforeRedirection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'BestHTTP.HTTPRequest.OnBeforeRedirection' can only appear on the left hand side of += or -= when used outside of the type 'BestHTTP.HTTPRequest'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				BestHTTP.OnBeforeRedirectionDelegate QPYX_ev_YXQP = (BestHTTP.OnBeforeRedirectionDelegate)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnBeforeRedirection += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				BestHTTP.OnBeforeRedirectionDelegate QPYX_ev_YXQP = (BestHTTP.OnBeforeRedirectionDelegate)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnBeforeRedirection -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnBeforeHeaderSend_YXQP(IntPtr L_YXQP)
	{
		try
		{
			BestHTTP.HTTPRequest QPYX_obj_YXQP = (BestHTTP.HTTPRequest)ToLua.CheckObject(L_YXQP, 1, typeof(BestHTTP.HTTPRequest));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'BestHTTP.HTTPRequest.OnBeforeHeaderSend' can only appear on the left hand side of += or -= when used outside of the type 'BestHTTP.HTTPRequest'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				BestHTTP.OnBeforeHeaderSendDelegate QPYX_ev_YXQP = (BestHTTP.OnBeforeHeaderSendDelegate)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnBeforeHeaderSend += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				BestHTTP.OnBeforeHeaderSendDelegate QPYX_ev_YXQP = (BestHTTP.OnBeforeHeaderSendDelegate)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.OnBeforeHeaderSend -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

