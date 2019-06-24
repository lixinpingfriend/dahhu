using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_UnityWebRequestWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Networking.UnityWebRequest), typeof(System.Object));
		L_YXQP.RegFunction("Dispose", QPYX_Dispose_YXQP);
		L_YXQP.RegFunction("SendWebRequest", QPYX_SendWebRequest_YXQP);
		L_YXQP.RegFunction("Abort", QPYX_Abort_YXQP);
		L_YXQP.RegFunction("GetRequestHeader", QPYX_GetRequestHeader_YXQP);
		L_YXQP.RegFunction("SetRequestHeader", QPYX_SetRequestHeader_YXQP);
		L_YXQP.RegFunction("GetResponseHeader", QPYX_GetResponseHeader_YXQP);
		L_YXQP.RegFunction("GetResponseHeaders", QPYX_GetResponseHeaders_YXQP);
		L_YXQP.RegFunction("Get", QPYX_Get_YXQP);
		L_YXQP.RegFunction("Delete", QPYX_Delete_YXQP);
		L_YXQP.RegFunction("Head", QPYX_Head_YXQP);
		L_YXQP.RegFunction("GetAssetBundle", QPYX_GetAssetBundle_YXQP);
		L_YXQP.RegFunction("Put", QPYX_Put_YXQP);
		L_YXQP.RegFunction("Post", QPYX_Post_YXQP);
		L_YXQP.RegFunction("EscapeURL", QPYX_EscapeURL_YXQP);
		L_YXQP.RegFunction("UnEscapeURL", QPYX_UnEscapeURL_YXQP);
		L_YXQP.RegFunction("SerializeFormSections", QPYX_SerializeFormSections_YXQP);
		L_YXQP.RegFunction("GenerateBoundary", QPYX_GenerateBoundary_YXQP);
		L_YXQP.RegFunction("SerializeSimpleForm", QPYX_SerializeSimpleForm_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Networking_UnityWebRequest_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("kHttpVerbGET", QPYX_get_kHttpVerbGET_YXQP, null);
		L_YXQP.RegVar("kHttpVerbHEAD", QPYX_get_kHttpVerbHEAD_YXQP, null);
		L_YXQP.RegVar("kHttpVerbPOST", QPYX_get_kHttpVerbPOST_YXQP, null);
		L_YXQP.RegVar("kHttpVerbPUT", QPYX_get_kHttpVerbPUT_YXQP, null);
		L_YXQP.RegVar("kHttpVerbCREATE", QPYX_get_kHttpVerbCREATE_YXQP, null);
		L_YXQP.RegVar("kHttpVerbDELETE", QPYX_get_kHttpVerbDELETE_YXQP, null);
		L_YXQP.RegVar("disposeDownloadHandlerOnDispose", QPYX_get_disposeDownloadHandlerOnDispose_YXQP, QPYX_set_disposeDownloadHandlerOnDispose_YXQP);
		L_YXQP.RegVar("disposeUploadHandlerOnDispose", QPYX_get_disposeUploadHandlerOnDispose_YXQP, QPYX_set_disposeUploadHandlerOnDispose_YXQP);
		L_YXQP.RegVar("method", QPYX_get_method_YXQP, QPYX_set_method_YXQP);
		L_YXQP.RegVar("error", QPYX_get_error_YXQP, null);
		L_YXQP.RegVar("useHttpContinue", QPYX_get_useHttpContinue_YXQP, QPYX_set_useHttpContinue_YXQP);
		L_YXQP.RegVar("url", QPYX_get_url_YXQP, QPYX_set_url_YXQP);
		L_YXQP.RegVar("responseCode", QPYX_get_responseCode_YXQP, null);
		L_YXQP.RegVar("uploadProgress", QPYX_get_uploadProgress_YXQP, null);
		L_YXQP.RegVar("isModifiable", QPYX_get_isModifiable_YXQP, null);
		L_YXQP.RegVar("isDone", QPYX_get_isDone_YXQP, null);
		L_YXQP.RegVar("isNetworkError", QPYX_get_isNetworkError_YXQP, null);
		L_YXQP.RegVar("isHttpError", QPYX_get_isHttpError_YXQP, null);
		L_YXQP.RegVar("downloadProgress", QPYX_get_downloadProgress_YXQP, null);
		L_YXQP.RegVar("uploadedBytes", QPYX_get_uploadedBytes_YXQP, null);
		L_YXQP.RegVar("downloadedBytes", QPYX_get_downloadedBytes_YXQP, null);
		L_YXQP.RegVar("redirectLimit", QPYX_get_redirectLimit_YXQP, QPYX_set_redirectLimit_YXQP);
		L_YXQP.RegVar("chunkedTransfer", QPYX_get_chunkedTransfer_YXQP, QPYX_set_chunkedTransfer_YXQP);
		L_YXQP.RegVar("uploadHandler", QPYX_get_uploadHandler_YXQP, QPYX_set_uploadHandler_YXQP);
		L_YXQP.RegVar("downloadHandler", QPYX_get_downloadHandler_YXQP, QPYX_set_downloadHandler_YXQP);
		L_YXQP.RegVar("timeout", QPYX_get_timeout_YXQP, QPYX_set_timeout_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Networking_UnityWebRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = new UnityEngine.Networking.UnityWebRequest();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = new UnityEngine.Networking.UnityWebRequest(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = new UnityEngine.Networking.UnityWebRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.Networking.DownloadHandler QPYX_arg2_YXQP = (UnityEngine.Networking.DownloadHandler)ToLua.CheckObject<UnityEngine.Networking.DownloadHandler>(L_YXQP, 3);
				UnityEngine.Networking.UploadHandler QPYX_arg3_YXQP = (UnityEngine.Networking.UploadHandler)ToLua.CheckObject<UnityEngine.Networking.UploadHandler>(L_YXQP, 4);
				UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = new UnityEngine.Networking.UnityWebRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Networking.UnityWebRequest.New");
			}
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
			UnityEngine.Networking.UnityWebRequest  QPYX_obj_YXQP  = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			QPYX_obj_YXQP.Dispose();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SendWebRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest  QPYX_obj_YXQP  = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequestAsyncOperation QPYX_o_YXQP = QPYX_obj_YXQP.SendWebRequest();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
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
			UnityEngine.Networking.UnityWebRequest  QPYX_obj_YXQP  = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			QPYX_obj_YXQP.Abort();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetRequestHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Networking.UnityWebRequest  QPYX_obj_YXQP  = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetRequestHeader(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetRequestHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Networking.UnityWebRequest  QPYX_obj_YXQP  = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.SetRequestHeader(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetResponseHeader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Networking.UnityWebRequest  QPYX_obj_YXQP  = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetResponseHeader(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetResponseHeaders_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest  QPYX_obj_YXQP  = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			System.Collections.Generic.Dictionary<string,string> QPYX_o_YXQP = QPYX_obj_YXQP.GetResponseHeaders();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Get_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Get(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Delete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Delete(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Head_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Head(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.GetAssetBundle(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.GetAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.CachedAssetBundle, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.CachedAssetBundle QPYX_arg1_YXQP = StackTraits<UnityEngine.CachedAssetBundle>.To(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.GetAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Hash128, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Hash128 QPYX_arg1_YXQP = StackTraits<UnityEngine.Hash128>.To(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.GetAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<uint, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.GetAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Networking.UnityWebRequest.GetAssetBundle");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Put_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Put(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<byte[]>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Put(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Networking.UnityWebRequest.Put");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Post_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection>>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Post(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Collections.Generic.Dictionary<string,string>>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Collections.Generic.Dictionary<string,string> QPYX_arg1_YXQP = (System.Collections.Generic.Dictionary<string,string>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Post(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Post(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.WWWForm>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.WWWForm QPYX_arg1_YXQP = (UnityEngine.WWWForm)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Post(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection>));
				byte[] QPYX_arg2_YXQP = ToLua.CheckByteBuffer(L_YXQP, 3);
				UnityEngine.Networking.UnityWebRequest QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.Post(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Networking.UnityWebRequest.Post");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EscapeURL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.EscapeURL(QPYX_arg0_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Text.Encoding QPYX_arg1_YXQP = (System.Text.Encoding)ToLua.CheckObject<System.Text.Encoding>(L_YXQP, 2);
				string QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.EscapeURL(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Networking.UnityWebRequest.EscapeURL");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnEscapeURL_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.UnEscapeURL(QPYX_arg0_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Text.Encoding QPYX_arg1_YXQP = (System.Text.Encoding)ToLua.CheckObject<System.Text.Encoding>(L_YXQP, 2);
				string QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.UnEscapeURL(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Networking.UnityWebRequest.UnEscapeURL");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SerializeFormSections_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection>)ToLua.CheckObject(L_YXQP, 1, typeof(System.Collections.Generic.List<UnityEngine.Networking.IMultipartFormSection>));
			byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			byte[] QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.SerializeFormSections(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GenerateBoundary_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			byte[] QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.GenerateBoundary();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SerializeSimpleForm_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			System.Collections.Generic.Dictionary<string,string> QPYX_arg0_YXQP = (System.Collections.Generic.Dictionary<string,string>)ToLua.CheckObject(L_YXQP, 1, typeof(System.Collections.Generic.Dictionary<string,string>));
			byte[] QPYX_o_YXQP = UnityEngine.Networking.UnityWebRequest.SerializeSimpleForm(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_kHttpVerbGET_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Networking.UnityWebRequest.kHttpVerbGET);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_kHttpVerbHEAD_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Networking.UnityWebRequest.kHttpVerbHEAD);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_kHttpVerbPOST_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Networking.UnityWebRequest.kHttpVerbPOST);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_kHttpVerbPUT_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Networking.UnityWebRequest.kHttpVerbPUT);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_kHttpVerbCREATE_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Networking.UnityWebRequest.kHttpVerbCREATE);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_kHttpVerbDELETE_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, UnityEngine.Networking.UnityWebRequest.kHttpVerbDELETE);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_disposeDownloadHandlerOnDispose_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.disposeDownloadHandlerOnDispose;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index disposeDownloadHandlerOnDispose on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_disposeUploadHandlerOnDispose_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.disposeUploadHandlerOnDispose;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index disposeUploadHandlerOnDispose on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_method_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.method;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index method on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_error_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.error;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index error on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useHttpContinue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useHttpContinue;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useHttpContinue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_url_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.url;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index url on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_responseCode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			long QPYX_ret_YXQP = QPYX_obj_YXQP.responseCode;
			LuaDLL.tolua_pushint64(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index responseCode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uploadProgress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.uploadProgress;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uploadProgress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isModifiable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isModifiable;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isModifiable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isDone_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isDone;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isDone on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isNetworkError_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isNetworkError;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isNetworkError on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isHttpError_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isHttpError;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isHttpError on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_downloadProgress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.downloadProgress;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index downloadProgress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uploadedBytes_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			ulong QPYX_ret_YXQP = QPYX_obj_YXQP.uploadedBytes;
			LuaDLL.tolua_pushuint64(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uploadedBytes on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_downloadedBytes_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			ulong QPYX_ret_YXQP = QPYX_obj_YXQP.downloadedBytes;
			LuaDLL.tolua_pushuint64(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index downloadedBytes on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_redirectLimit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.redirectLimit;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index redirectLimit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_chunkedTransfer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.chunkedTransfer;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index chunkedTransfer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_uploadHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			UnityEngine.Networking.UploadHandler QPYX_ret_YXQP = QPYX_obj_YXQP.uploadHandler;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uploadHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_downloadHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			UnityEngine.Networking.DownloadHandler QPYX_ret_YXQP = QPYX_obj_YXQP.downloadHandler;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index downloadHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_timeout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.timeout;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index timeout on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_disposeDownloadHandlerOnDispose_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.disposeDownloadHandlerOnDispose = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index disposeDownloadHandlerOnDispose on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_disposeUploadHandlerOnDispose_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.disposeUploadHandlerOnDispose = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index disposeUploadHandlerOnDispose on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_method_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.method = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index method on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useHttpContinue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useHttpContinue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useHttpContinue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_url_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.url = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index url on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_redirectLimit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.redirectLimit = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index redirectLimit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_chunkedTransfer_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.chunkedTransfer = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index chunkedTransfer on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_uploadHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			UnityEngine.Networking.UploadHandler QPYX_arg0_YXQP = (UnityEngine.Networking.UploadHandler)ToLua.CheckObject<UnityEngine.Networking.UploadHandler>(L_YXQP, 2);
			QPYX_obj_YXQP.uploadHandler = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index uploadHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_downloadHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			UnityEngine.Networking.DownloadHandler QPYX_arg0_YXQP = (UnityEngine.Networking.DownloadHandler)ToLua.CheckObject<UnityEngine.Networking.DownloadHandler>(L_YXQP, 2);
			QPYX_obj_YXQP.downloadHandler = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index downloadHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_timeout_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequest QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequest)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.timeout = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index timeout on a nil value");
		}
	}
}

