using System;
using LuaInterface;

public class QPYX_FileUtilityWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("FileUtility");
		L_YXQP.RegFunction("SaveFile", QPYX_SaveFile_YXQP);
		L_YXQP.RegFunction("SaveToPersistenDataPath", QPYX_SaveToPersistenDataPath_YXQP);
		L_YXQP.RegFunction("GetFileName", QPYX_GetFileName_YXQP);
		L_YXQP.RegFunction("GetDirectoryFiles", QPYX_GetDirectoryFiles_YXQP);
		L_YXQP.RegFunction("GetDirectorFilesSize", QPYX_GetDirectorFilesSize_YXQP);
		L_YXQP.RegFunction("GetFilesSize", QPYX_GetFilesSize_YXQP);
		L_YXQP.RegFunction("GetDirectories", QPYX_GetDirectories_YXQP);
		L_YXQP.RegFunction("DeleteDirectory", QPYX_DeleteDirectory_YXQP);
		L_YXQP.RegFunction("DownloadFile", QPYX_DownloadFile_YXQP);
		L_YXQP.RegFunction("DownloadFileWithWebRequest", QPYX_DownloadFileWithWebRequest_YXQP);
		L_YXQP.RegFunction("DirectoryMove", QPYX_DirectoryMove_YXQP);
		L_YXQP.RegFunction("DirectoryExists", QPYX_DirectoryExists_YXQP);
		L_YXQP.RegFunction("DirectoryDelete", QPYX_DirectoryDelete_YXQP);
		L_YXQP.RegFunction("DirectoryCreate", QPYX_DirectoryCreate_YXQP);
		L_YXQP.RegFunction("Exists", QPYX_Exists_YXQP);
		L_YXQP.RegFunction("Delete", QPYX_Delete_YXQP);
		L_YXQP.RegFunction("WriteAllText", QPYX_WriteAllText_YXQP);
		L_YXQP.RegFunction("ReadAllText", QPYX_ReadAllText_YXQP);
		L_YXQP.RegFunction("ReadAllBytes", QPYX_ReadAllBytes_YXQP);
		L_YXQP.RegFunction("Copy", QPYX_Copy_YXQP);
		L_YXQP.RegFunction("Decompress7Zip", QPYX_Decompress7Zip_YXQP);
		L_YXQP.RegFunction("CompressFir", QPYX_CompressFir_YXQP);
		L_YXQP.RegFunction("CompressFirAsync", QPYX_CompressFirAsync_YXQP);
		L_YXQP.RegFunction("CompressDir", QPYX_CompressDir_YXQP);
		L_YXQP.RegFunction("CompressDirAsync", QPYX_CompressDirAsync_YXQP);
		L_YXQP.RegFunction("DecompressZip", QPYX_DecompressZip_YXQP);
		L_YXQP.RegFunction("Decompress7ZipAsync", QPYX_Decompress7ZipAsync_YXQP);
		L_YXQP.RegFunction("EncryptFilePath", QPYX_EncryptFilePath_YXQP);
		L_YXQP.RegFunction("DecryptFilePath", QPYX_DecryptFilePath_YXQP);
		L_YXQP.RegVar("streamingAssetsPathInWWW", QPYX_get_streamingAssetsPathInWWW_YXQP, null);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SaveFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				bool QPYX_o_YXQP = FileUtility.SaveFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<byte[]>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				bool QPYX_o_YXQP = FileUtility.SaveFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_o_YXQP = FileUtility.SaveFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.SaveFile");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SaveToPersistenDataPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			byte[] QPYX_arg1_YXQP = ToLua.CheckByteBuffer(L_YXQP, 2);
			FileUtility.SaveToPersistenDataPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFileName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			System.Collections.Generic.List<string> QPYX_arg1_YXQP = (System.Collections.Generic.List<string>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<string>));
			bool QPYX_o_YXQP = FileUtility.GetFileName(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDirectoryFiles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			System.Collections.Generic.List<string> QPYX_arg1_YXQP = (System.Collections.Generic.List<string>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<string>));
			System.Collections.Generic.List<string> QPYX_o_YXQP = FileUtility.GetDirectoryFiles(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDirectorFilesSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			long QPYX_o_YXQP = FileUtility.GetDirectorFilesSize(QPYX_arg0_YXQP);
			LuaDLL.tolua_pushint64(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFilesSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			long QPYX_o_YXQP = FileUtility.GetFilesSize(QPYX_arg0_YXQP);
			LuaDLL.tolua_pushint64(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDirectories_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string[] QPYX_o_YXQP = FileUtility.GetDirectories(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DeleteDirectory_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				bool QPYX_o_YXQP = FileUtility.DeleteDirectory(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_o_YXQP = FileUtility.DeleteDirectory(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.DeleteDirectory");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DownloadFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Action<string> QPYX_arg2_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 3);
				FileUtility.DownloadFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Action<string> QPYX_arg2_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 3);
				System.Action<float> QPYX_arg3_YXQP = (System.Action<float>)ToLua.CheckDelegate<System.Action<float>>(L_YXQP, 4);
				FileUtility.DownloadFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.DownloadFile");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DownloadFileWithWebRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Action<string> QPYX_arg2_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 3);
				FileUtility.DownloadFileWithWebRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Action<string> QPYX_arg2_YXQP = (System.Action<string>)ToLua.CheckDelegate<System.Action<string>>(L_YXQP, 3);
				System.Action<float> QPYX_arg3_YXQP = (System.Action<float>)ToLua.CheckDelegate<System.Action<float>>(L_YXQP, 4);
				FileUtility.DownloadFileWithWebRequest(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.DownloadFileWithWebRequest");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DirectoryMove_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = FileUtility.DirectoryMove(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DirectoryExists_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_o_YXQP = FileUtility.DirectoryExists(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DirectoryDelete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			bool QPYX_o_YXQP = FileUtility.DirectoryDelete(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DirectoryCreate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			FileUtility.DirectoryCreate(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Exists_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			bool QPYX_o_YXQP = FileUtility.Exists(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
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
			bool QPYX_o_YXQP = FileUtility.Delete(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WriteAllText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			FileUtility.WriteAllText(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReadAllText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_o_YXQP = FileUtility.ReadAllText(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ReadAllBytes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			byte[] QPYX_o_YXQP = FileUtility.ReadAllBytes(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Copy_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = FileUtility.Copy(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Decompress7Zip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
			int QPYX_o_YXQP = FileUtility.Decompress7Zip(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CompressFir_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				FileUtility.CompressFir(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				FileUtility.CompressFir(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				string QPYX_arg4_YXQP = ToLua.CheckString(L_YXQP, 5);
				FileUtility.CompressFir(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				string QPYX_arg4_YXQP = ToLua.CheckString(L_YXQP, 5);
				string QPYX_arg5_YXQP = ToLua.CheckString(L_YXQP, 6);
				FileUtility.CompressFir(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.CompressFir");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CompressFirAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				FileUtility.CompressFirAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				FileUtility.CompressFirAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				string QPYX_arg4_YXQP = ToLua.CheckString(L_YXQP, 5);
				FileUtility.CompressFirAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				string QPYX_arg4_YXQP = ToLua.CheckString(L_YXQP, 5);
				string QPYX_arg5_YXQP = ToLua.CheckString(L_YXQP, 6);
				FileUtility.CompressFirAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.CompressFirAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CompressDir_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				FileUtility.CompressDir(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				FileUtility.CompressDir(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.CompressDir");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CompressDirAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				FileUtility.CompressDirAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				FileUtility.CompressDirAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				System.Action<int> QPYX_arg4_YXQP = (System.Action<int>)ToLua.CheckDelegate<System.Action<int>>(L_YXQP, 5);
				FileUtility.CompressDirAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.CompressDirAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DecompressZip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
			int QPYX_o_YXQP = FileUtility.DecompressZip(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Decompress7ZipAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				FileUtility.Decompress7ZipAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				System.Action<int> QPYX_arg4_YXQP = (System.Action<int>)ToLua.CheckDelegate<System.Action<int>>(L_YXQP, 5);
				FileUtility.Decompress7ZipAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				System.Action<int> QPYX_arg4_YXQP = (System.Action<int>)ToLua.CheckDelegate<System.Action<int>>(L_YXQP, 5);
				System.Action<int> QPYX_arg5_YXQP = (System.Action<int>)ToLua.CheckDelegate<System.Action<int>>(L_YXQP, 6);
				FileUtility.Decompress7ZipAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: FileUtility.Decompress7ZipAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EncryptFilePath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_o_YXQP = FileUtility.EncryptFilePath(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DecryptFilePath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_o_YXQP = FileUtility.DecryptFilePath(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_streamingAssetsPathInWWW_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, FileUtility.streamingAssetsPathInWWW);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

