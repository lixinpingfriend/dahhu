using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

// create by jyz 2017/8/15
namespace PlayModeEditor{

	public enum HeadState
    {
        Nomal, Edit,None,
    }
	public class PlayModeEditorWindow : EditorWindow {
		private static PlayModeEditorWindow _window = null;
		public static PlayModeEditorWindow window
		{
			get{
				if(_window == null)
					Init();
				return _window;
			}
		}
		[MenuItem("Tools/玩法配置/配置窗口 %&p")]
		public static void Init()
		{
			if(_window == null){
				_window = GetWindow<PlayModeEditorWindow>("PlayModeEditor");
				_window.minSize = _window.maxSize = new Vector2(525,800);
			}
			_window.Show();
			_window.Focus();
		}

		[MenuItem("Tools/玩法配置/测试专用")]
		public static void Test()
		{
			// string tempDir = Application.dataPath + "/Temp/Lua";
			// AssetBundleBuildScript.DelTempLuaScripts(LuaConst.luaDir, LuaConst.toluaDir ,tempDir);
			// AssetBundleBuildScript.CopyLuaBytesFiles(LuaConst.luaDir, tempDir);
        	// AssetBundleBuildScript.CopyLuaBytesFiles(LuaConst.toluaDir, tempDir);
        	// AssetDatabase.SaveAssets();
        	// AssetDatabase.Refresh();
		}


		
		
		public void OnGUI()
		{
			if(PlayModeTools.curProvince < 0)
				DrawProvince.Draw();  //绘制省份编辑
			else
				DrawPlayMode.Draw();  //绘制玩法编辑
		}

	}
}

