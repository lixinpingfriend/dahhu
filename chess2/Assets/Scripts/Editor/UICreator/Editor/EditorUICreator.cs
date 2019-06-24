using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;

//Create by Jyz 2017/08/23
namespace UICreator{
	public class EditorUICreator : EditorWindow {

		[MenuItem("GameObject/Create Other/UI %&c")]
		public static void InitWindow()
		{
			EditorUICreator myWindow = GetWindow<EditorUICreator>("UIcreator");
			myWindow.minSize = myWindow.maxSize =new Vector2(450,300);
			myWindow.Init();
			myWindow.Show();
			myWindow.Focus();
		}

		///<summary>
		/// 当前选择的package
		///</summary>
		private int packageIndex = -1;
		///<summary>
		/// 当前选择的UIType
		///</summary>
		private int uiTypeIndex = -1;
		///<summary>
		/// package选择
		///</summary>
		private List<bool> packageSelectors = new List<bool>();
		
		///<summary>
		/// package
		///</summary>
		private List<string> packageNames = new List<string>();

		///<summary>
		/// 将创建的UI模式
		///</summary>
		private List<string> mUITypes = new List<string>();
		private List<bool> mUITypesSelector = new List<bool>();


		// scrolls

		private Vector2 packageScroll = Vector2.zero;

		private Vector2 mainScrooll = Vector2.zero;

		// scrolls end

		private string mUIName = "";

		private string mHeadImgUrl = "";

		private bool isNeedModel = false;

		// private bool isNeedCloseBtn = false;

		public void Init()
		{
			Reset();
		}

		public void Reset()
		{
			packageIndex = -1;
			uiTypeIndex = -1;
			packageSelectors = new List<bool>();
			packageNames = UICreatorPathTools.packageNames;
			mUITypes = new List<string>(){
				"空",
				"窗口",
				"对话框",
				"全屏界面",
			};
			mUITypesSelector = new List<bool>(){
				false,
				false,
				false,
				false,
			};
			for(int i = 0; i < packageNames.Count; i++)
			{
				packageSelectors.Add(false);
			}
			mUIName = "";
		}

		void OnGUI()
		{
			EditorGUILayout.BeginHorizontal(GUILayout.MaxHeight(2048));
			{
				DrawPackage(); 
				DrawUIType();
				DrawMian();
			}
			EditorGUILayout.EndHorizontal();

			EditorGUILayout.BeginHorizontal("TextArea",GUILayout.Height(80));
			{
				EditorGUILayout.BeginVertical(GUILayout.Width(125));
				EditorGUILayout.LabelField("",GUILayout.Width(125));
				EditorGUILayout.EndVertical();

				EditorGUILayout.BeginVertical(GUILayout.Width(100));
				GUILayout.Space(25);
				if(GUILayout.Button("确定",GUILayout.Width(75),GUILayout.Height(30)))
				{
					if(packageIndex < 0 || uiTypeIndex < 0 || mUIName.Trim() == "")
					{
						EditorUtility.DisplayDialog("提示","请先选择界面配置！","确定");
					}
					
					CreateUI();

				}
				EditorGUILayout.EndVertical();
				GUILayout.Space(25);
				EditorGUILayout.BeginVertical(GUILayout.Width(75));
				GUILayout.Space(25);
				if(GUILayout.Button("取消",GUILayout.Width(75),GUILayout.Height(30)))
				{
					this.Close();
				}
				EditorGUILayout.EndVertical();

				EditorGUILayout.BeginVertical(GUILayout.Width(125));
				EditorGUILayout.LabelField("",GUILayout.Width(125));
				EditorGUILayout.EndVertical();

			}
			EditorGUILayout.EndHorizontal();
		}
		
		void CreateUI()
		{
			EditorUtility.DisplayProgressBar("请稍候","正在处理数据...",0.1f);
			mUIName = mUIName.Trim();

			string prefabName = ""; //预制件名
			if(uiTypeIndex == 0) 
				prefabName = packageNames[packageIndex] + "_" + mUIName;
			else
				prefabName = packageNames[packageIndex] + "_Window" + mUIName;

			//小写开头 如:CreateRoomView -> createRoomView
			string mUINameLow = mUIName.Substring(0,1).ToLower() + mUIName.Substring(1,mUIName.Length-1); 

			//预制件的Ab包路径
			string assetPath = packageNames[packageIndex] + "/module/" + mUIName + "/" + prefabName + ".prefab";
			assetPath = assetPath.ToLower();
			EditorUtility.DisplayProgressBar("请稍候","正在生成LuaScript",0.3f);

			DealLuaScripts(mUINameLow,assetPath,prefabName);

			EditorUtility.DisplayProgressBar("请稍候","正在生成预制件",0.6f);
			DealPrefab(prefabName);
			
			EditorUtility.DisplayProgressBar("请稍候","正在生成预制件",1f);
			AssetDatabase.Refresh();
			this.Close();
			EditorUtility.ClearProgressBar();
			
		}
		
		///<summary>
		/// 处理要生成的LuaScripts
		/// mUINameLow：开头小写的UIName
		/// assetPath：prefab的AB包名
		/// prefabName：prefab的资源名
		///</summary>
		void DealLuaScripts(string mUINameLow, string assetPath, string prefabName)
		{
			//处理View.lua
			string viewLua = UICreatorPathTools.ReadLuaText(ScriptName.View).Replace("ClassName",(mUIName+"View"));
			viewLua = viewLua.Replace("ViewName",(mUINameLow + "View"));
			viewLua = viewLua.Replace("AssetPath",assetPath);
			viewLua = viewLua.Replace("AssetName",prefabName);

			//处理model.lua
			string modelLua = string.Empty;
			string modelName = "nil";
			if(isNeedModel)
			{
				modelName = "\"" + mUIName.ToLower() + "_model\"";
				modelLua = UICreatorPathTools.ReadLuaText(ScriptName.Model).Replace("ClassName",(mUIName+"Model"));
				modelLua = modelLua.Replace("ModelName",(mUINameLow + "Model"));
			}

			//处理module.lua
			string moduleLua = UICreatorPathTools.ReadLuaText(ScriptName.Module).Replace("ClassName",(mUIName+"Module"));
			moduleLua = moduleLua.Replace("PackageName",packageNames[packageIndex]);
			moduleLua = moduleLua.Replace("UIName",mUIName.ToLower());
			moduleLua = moduleLua.Replace("ModelName",modelName);

			string outLuaDir = UICreatorPathTools.GetLuaDir(packageNames[packageIndex], mUIName);

			if(!Directory.Exists(outLuaDir))
				Directory.CreateDirectory(outLuaDir);

			string viewLuaPath = outLuaDir + mUIName.ToLower() + "_view.lua";
			if(File.Exists(viewLuaPath))
				FileUtil.DeleteFileOrDirectory(viewLuaPath);
			FileUtility.SaveFile(viewLuaPath,viewLua);

			string moduleLuaPath = outLuaDir + mUIName.ToLower() + "_module.lua";
			if(File.Exists(moduleLuaPath))
				FileUtil.DeleteFileOrDirectory(moduleLuaPath);
			FileUtility.SaveFile(moduleLuaPath,moduleLua);

			if(isNeedModel)
			{
				string modelLuaPath =  outLuaDir + mUIName.ToLower() + "_model.lua";
				if(File.Exists(modelLuaPath))
					FileUtil.DeleteFileOrDirectory(modelLuaPath);
				FileUtility.SaveFile(modelLuaPath,modelLua);
			}
		}

		void DealPrefab(string prefabName)
		{
			string prefabPath = UICreatorPathTools.mCreatorResPath + "PackageName_Null.prefab";

			switch(uiTypeIndex)
			{
				case 1:
					prefabPath = UICreatorPathTools.mCreatorResPath + "PackageName_WindowBase.prefab";
					break;
				case 2:
					prefabPath = UICreatorPathTools.mCreatorResPath + "PackageName_WindowDialog.prefab";
					break;
				case 3:
					prefabPath = UICreatorPathTools.mCreatorResPath + "PackageName_WindowFullScreen.prefab";
					break;
			}

			Debug.Log(prefabPath);

			GameObject go = HelpFunEditor.InstantiateGameObject(GameObject.Find(UICreatorPathTools.mTestViewPath).gameObject, 
				AssetDatabase.LoadAssetAtPath<GameObject>(prefabPath)
			);

			var eventCollector = go.GetComponent<UGUIExtend.GameEventCollector>();
			eventCollector.packageName = packageNames[packageIndex].ToLower();
			eventCollector.moduleName  = mUIName.ToLower();
			
			SetGameObject(go);

			EditorUtility.DisplayProgressBar("请稍候","正在生成预制件",0.7f);
			
			string outResDir = UICreatorPathTools.GetResDir(packageNames[packageIndex], mUIName);
			if(!Directory.Exists(outResDir))
				Directory.CreateDirectory(outResDir);
			string createPrefab = string.Format("{0}" + outResDir.Replace(Application.dataPath,"") + prefabName + ".prefab","Assets"); //(outResDir+ prefabName + ".prefab").Replace(Application.dataPath.Replace("Assets/",""),"");
			Debug.Log("createPrefab = " + createPrefab);
			Object tempPrefab = PrefabUtility.CreateEmptyPrefab(createPrefab);

			PrefabUtility.ReplacePrefab(go,tempPrefab);

			GameObject.DestroyImmediate(go);

			EditorUtility.DisplayProgressBar("请稍候","正在生成预制件",0.8f);

			go = HelpFunEditor.InstantiatePrefab(GameObject.Find(UICreatorPathTools.mTestViewPath).gameObject, 
				AssetDatabase.LoadAssetAtPath<GameObject>(createPrefab)
			);

			SetGameObject(go);
			EditorUtility.DisplayProgressBar("请稍候","正在生成预制件",0.9f);
		}

		///<summary>
		/// 设置GameObject在Hierarchy视图中的属性，使其在TestView下正常
		///</summary>
		void SetGameObject(GameObject go)
		{
			go.transform.localScale = Vector3.one;
			go.transform.localPosition = Vector3.zero;
			RectTransform rect = go.transform.GetComponent<RectTransform>();
			rect.anchorMin = Vector2.zero;
			rect.anchorMax = Vector2.one;
			rect.pivot = new Vector2(0.5f, 0.5f);
			rect.offsetMax = Vector2.zero;
			rect.offsetMin = Vector2.zero;
		}

		void DrawPackage()
		{
			EditorGUILayout.BeginVertical("TextArea",GUILayout.Width(150));
			packageScroll = GUILayout.BeginScrollView(packageScroll);
				GUILayout.Space(5);
				GUI.backgroundColor = Color.cyan;
				EditorGUILayout.LabelField("位于包:",GUILayout.Width(100));
				GUI.backgroundColor = Color.white;
				GUILayout.Space(10);
				for(int i = 0; i < packageNames.Count; i++)
				{
					if(EditorGUILayout.ToggleLeft(packageNames[i],packageSelectors[i],GUILayout.Width(100)))
					{
						packageSelectors[i] = !packageSelectors[i];
						if(packageIndex >= 0)
							packageSelectors[packageIndex] = !packageSelectors[packageIndex];
						packageIndex = i;
					}
				}
			GUILayout.EndScrollView();
			EditorGUILayout.EndVertical();
		}

		void DrawUIType()
		{
			EditorGUILayout.BeginVertical("TextArea",GUILayout.Width(150));
				GUILayout.Space(5);
				GUI.backgroundColor = Color.cyan;
				EditorGUILayout.LabelField("样式:",GUILayout.Width(100));
				GUI.backgroundColor = Color.white;
				GUILayout.Space(10);
				for(int i = 0; i < mUITypes.Count; i++)
				{
					if(EditorGUILayout.ToggleLeft(mUITypes[i],mUITypesSelector[i],GUILayout.Width(100)))
					{
						mUITypesSelector[i] = !mUITypesSelector[i];
						if(uiTypeIndex >= 0)
							mUITypesSelector[uiTypeIndex] = !mUITypesSelector[uiTypeIndex];
						uiTypeIndex = i;
					}
				}
			EditorGUILayout.EndVertical();
		}

		

		void DrawMian()
		{
			EditorGUILayout.BeginVertical("TextArea");
			{	
				GUILayout.Space(5);
				EditorGUILayout.BeginHorizontal();
				EditorGUILayout.BeginScrollView(mainScrooll);
				{
					EditorGUILayout.BeginHorizontal();
					EditorGUILayout.LabelField("界面名:",GUILayout.Width(50));
					mUIName = EditorGUILayout.TextField(mUIName);
					EditorGUILayout.EndHorizontal();
					GUILayout.Space(10);
					EditorGUILayout.BeginHorizontal();
					EditorGUILayout.LabelField("需要model.lua:",GUILayout.Width(120));
					isNeedModel = EditorGUILayout.Toggle(isNeedModel);
					EditorGUILayout.EndHorizontal();
				}
				EditorGUILayout.EndScrollView();
				EditorGUILayout.EndHorizontal();
			}	
			EditorGUILayout.EndVertical();
		}
	}
}
