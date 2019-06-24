using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;
using System.Reflection;
using UnityEditor.Callbacks;
using System;
using System.Text.RegularExpressions;

public class LocalToLuaIDE : Editor {
	private const string EXTERNAL_EDITOR_PATH_KEY = "mTv8";
	private const string LUA_PROJECT_ROOT_FOLDER_PATH_KEY = "obUd";

	/// <summary>
	/// 双击console的回调
	/// </summary>
	/// <param name="instanceID"></param>
	/// <param name="line"></param>
	/// <returns></returns>
	[OnOpenAssetAttribute(2)]
	public static bool OnOpen(int instanceID, int line) {
		if (!GetConsoleWindowListView() || (object)EditorWindow.focusedWindow != consoleWindow) {
			return false;
		}
		string fileName = GetListViewRowCount(ref line);

		if (fileName == null) {
			return false;
		}
		OnOpenAsset(fileName, line);

		return true;
	}

	public static bool OnOpenAsset(string file, int line) {
		string filePath = file;

		string luaFolderRoot = EditorUserSettings.GetConfigValue(LUA_PROJECT_ROOT_FOLDER_PATH_KEY);
		if (string.IsNullOrEmpty(luaFolderRoot)) {
			SetLuaProjectRoot();
			luaFolderRoot = EditorUserSettings.GetConfigValue(LUA_PROJECT_ROOT_FOLDER_PATH_KEY);
		}
		filePath = luaFolderRoot.Trim() + "/" + filePath.Trim();//+ ".lua";

		return OpenFileAtLineExternal(filePath, line);
	}

	static bool OpenFileAtLineExternal(string fileName, int line) {
		string editorPath = EditorUserSettings.GetConfigValue(EXTERNAL_EDITOR_PATH_KEY);
		if (string.IsNullOrEmpty(editorPath) || !File.Exists(editorPath)) {   // 没有path就弹出面板设置
			SetExternalEditorPath();
		}
		OpenFileWith(fileName, line);
		return true;
	}

	[System.Runtime.InteropServices.DllImport("USER32.DLL")]
	public static extern bool SetForegroundWindow(IntPtr hWnd);
	static void OpenFileWith(string fileName, int line) {
		string editorPath = EditorUserSettings.GetConfigValue(EXTERNAL_EDITOR_PATH_KEY);
		string projectRootPath = EditorUserSettings.GetConfigValue(LUA_PROJECT_ROOT_FOLDER_PATH_KEY);
		System.Diagnostics.Process proc = new System.Diagnostics.Process();
		proc.StartInfo.FileName = editorPath;
		string procArgument = "";
		if (editorPath.IndexOf("idea") != -1) {
			procArgument = string.Format("{0} --line {1} {2}", projectRootPath, line, fileName);
		}
		else {
			procArgument = string.Format("{0}:{1}:0", fileName, line);
		}

		proc.StartInfo.Arguments = procArgument;
		if(proc.Start()) 
			SetForegroundWindow(proc.Handle); 
	}

	[MenuItem("Tools/Set Your IDE Path")]
	static void SetExternalEditorPath() {
		string path = EditorUserSettings.GetConfigValue(EXTERNAL_EDITOR_PATH_KEY);
		path = EditorUtility.OpenFilePanel("Select Your IDE", path, "exe");

		if (path != "") {
			EditorUserSettings.SetConfigValue(EXTERNAL_EDITOR_PATH_KEY, path);
			Debug.Log("Set Your IDE Path: " + path);
		}
	}

	[MenuItem("Tools/Set Your Luaproject Root")]
	static void SetLuaProjectRoot() {
		string path = EditorUserSettings.GetConfigValue(LUA_PROJECT_ROOT_FOLDER_PATH_KEY);
		path = EditorUtility.OpenFolderPanel("Select Your Luaproject Root", path, "");

		if (path != "") {
			EditorUserSettings.SetConfigValue(LUA_PROJECT_ROOT_FOLDER_PATH_KEY, path);
			Debug.Log("Set Luaproject Root Path: " + path);
		}
	}

	private static object consoleWindow;
	private static object logListView;
	private static FieldInfo logListViewCurrentRow;
	private static MethodInfo LogEntriesGetEntry;
	private static object logEntry;
	private static FieldInfo logEntryCondition;
	private static bool GetConsoleWindowListView() {
		if (logListView == null) {
			Assembly unityEditorAssembly = Assembly.GetAssembly(typeof(EditorWindow));
			Type consoleWindowType = unityEditorAssembly.GetType("UnityEditor.ConsoleWindow");
			FieldInfo fieldInfo = consoleWindowType.GetField("ms_ConsoleWindow", BindingFlags.Static | BindingFlags.NonPublic);
			consoleWindow = fieldInfo.GetValue(null);

			if (consoleWindow == null) {
				logListView = null;
				return false;
			}

			FieldInfo listViewFieldInfo = consoleWindowType.GetField("m_ListView", BindingFlags.Instance | BindingFlags.NonPublic);
			logListView = listViewFieldInfo.GetValue(consoleWindow);
			logListViewCurrentRow = listViewFieldInfo.FieldType.GetField("row", BindingFlags.Instance | BindingFlags.Public);

			Type logEntriesType = unityEditorAssembly.GetType("UnityEditorInternal.LogEntries");
			LogEntriesGetEntry = logEntriesType.GetMethod("GetEntryInternal", BindingFlags.Static | BindingFlags.Public);
			Type logEntryType = unityEditorAssembly.GetType("UnityEditorInternal.LogEntry");
			logEntry = Activator.CreateInstance(logEntryType);
			logEntryCondition = logEntryType.GetField("condition", BindingFlags.Instance | BindingFlags.Public);
		}

		return true;
	}
	private static string GetListViewRowCount(ref int line) {
		int row = (int)logListViewCurrentRow.GetValue(logListView);
		LogEntriesGetEntry.Invoke(null, new object[] { row, logEntry });
		string condition = logEntryCondition.GetValue(logEntry) as string;
		condition = condition.Substring(0, condition.IndexOf('\n'));

		int start = condition.IndexOf("[string");
		int end = condition.IndexOf("]:");
		string file = condition.Substring(start +9, end -start - 9 - 1  ); ///这里取的行数只适配tolua
		string result=Regex.Match(condition,"(?<=]:).*?(?=: )").Value;

		Int32.TryParse(result, out line);
		if (!file.EndsWith(".lua")) {
			file = file+".lua";
		}
		return file;
	}
//		int index = condition.IndexOf(".lua");
//
//
//		index = condition.IndexOf("LuaException: [");
//		if (index >= 0) {
//			int startIndex = condition.IndexOf("[");
//			int endIndex = condition.IndexOf("]:");
//			string fileNameStr = condition.Substring(startIndex + 9, endIndex - (startIndex + 9 )) + ".lua";
//			int lineTxtStartIndex = endIndex;
//			int lineTxtEndIndex = condition.IndexOf(":", lineTxtStartIndex + 2);
//			string _line = condition.Substring(lineTxtStartIndex + 2, lineTxtEndIndex - (lineTxtStartIndex + 2)); ///这里取的行数只适配tolua
//			Int32.TryParse(_line, out line);
//			return fileNameStr;
//		}
//
//		index = condition.IndexOf(".cs:");
//		if (index >= 0) {
//			int start = condition.IndexOf("[");
//			int end = condition.IndexOf("]:");
//			string _line = condition.Substring(index + 5, end - index - 5);///这里取的行数只适配tolua
//			Int32.TryParse(_line, out line);
//			return condition.Substring(start + 1, index + 2 - start);
//		}

	
}