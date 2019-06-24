using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEditor;

namespace PlayModeEditor{
	public class DrawProvince {
		private static Vector2 scroll = Vector2.zero;
		private static int editIndex = -1;
		private static string[] tagName = System.Enum.GetNames(typeof(PopTagEnum));
		private static Color[] outLineColors = new Color[]{
			new Color(6f/255f, 73f/255f, 107f/255f, 1),
			new Color(134f/255f, 55f/255f, 8f/255f, 1),
			new Color(50f/255f, 108f/255f, 6f/255f, 1),
			new Color(17f/255f, 90f/255f, 30f/255f, 1)
		};
		public static void Draw() //Dictionary<,string,ProvinceData> Draw()
		{
			GUILayout.Space(10);
			EditorGUILayout.BeginVertical();

			EditorGUILayout.BeginHorizontal();
			PlayModeTools.data.isLocal = EditorGUILayout.ToggleLeft("单省包",PlayModeTools.data.isLocal,GUILayout.Width(100));
			int lableWidth = 300;
			if(PlayModeTools.data.isLocal && PlayModeTools.provinceNames.Count > 0)
			{
				lableWidth = 200;
				int selectIndex = PlayModeTools.provinceNames.IndexOf(PlayModeTools.data.configs.Find(a => a.key == PlayModeTools.data.localId).name);
				int index = selectIndex;
				selectIndex = EditorGUILayout.Popup(selectIndex,PlayModeTools.provinceNames.ToArray(),GUILayout.Width(100));
				if(index != selectIndex)
					PlayModeTools.data.localId = PlayModeTools.data.configs.Find(a => a.name == PlayModeTools.provinceNames[selectIndex]).key;
			}

			EditorGUILayout.LabelField("", GUILayout.Width(lableWidth));

			EditorGUILayout.LabelField("省份编辑", GUILayout.Width(60));

			EditorGUILayout.EndHorizontal();

			scroll = GUILayout.BeginScrollView(scroll);
			{
				HeadState state = HeadState.Nomal;
				for(int i = 0; i < PlayModeTools.data.configs.Count; i++)
				{
					EditorGUILayout.BeginHorizontal();
					EditorGUILayout.BeginVertical(GUILayout.Width(490));
					if (editIndex == i)
					state = HeadState.Edit;
					else
						state = HeadState.Nomal;
					if(DrawItemHeader(PlayModeTools.data.configs[i],ref state, i))
					{
						// if(i == 0)
						// 	Debug.Log(state);
						switch(state)
						{
							case HeadState.Nomal:
								editIndex = i;
								break;
							default:
								editIndex = i;
								if(i < PlayModeTools.data.configs.Count)
									DrawItem(PlayModeTools.data.configs[i],i);
								break;
						}
					}
					EditorGUILayout.EndVertical();
					EditorGUILayout.EndHorizontal();
				}
				GUILayout.EndScrollView();
				GUILayout.Space(5);
				EditorGUILayout.BeginHorizontal();

				if (GUILayout.Button("+","OL Titlemid", GUILayout.Width(PlayModeEditorWindow.window.maxSize.x)))
				{
					ProvinceData config = new ProvinceData();
					config.key = PlayModeTools.data.GetConfigNextId();
					config.name = "新增的省份";
					config.shortName = "新省";
					config.gameName = "NewProvince";
					
					config.configs.Add(PublicConfig.instance.GetClone());
					PlayModeTools.data.configs.Add(config);
					
				}
				
				EditorGUILayout.EndHorizontal();
				EditorGUILayout.BeginHorizontal("TextArea",GUILayout.MinHeight(100));
				EditorGUILayout.BeginVertical(GUILayout.Width(85));
					EditorGUILayout.LabelField(" ",GUILayout.Width(85));
				EditorGUILayout.EndVertical();
				EditorGUILayout.BeginVertical(GUILayout.Width(100));
					EditorGUILayout.LabelField(" ",GUILayout.Width(5),GUILayout.Height(25));
						if (GUILayout.Button("手动保存", GUILayout.Width(100),GUILayout.Height(50)))
						{
							PlayModeTools.SaveData();
							if (EditorUtility.DisplayDialog("提示", "已手动保存！", "知道了")) //显示对话框  
							{  

							}  
						}
					EditorGUILayout.EndVertical();
					EditorGUILayout.BeginVertical(GUILayout.Width(100));
						EditorGUILayout.LabelField(" ",GUILayout.Width(5),GUILayout.Height(25));
						if (GUILayout.Button("生成Lua配置", GUILayout.Width(100),GUILayout.Height(50)))
						{
							PlayModeTools.ExportLuaScript();
							if (EditorUtility.DisplayDialog("提示", "已生成全国与省份配置！", "确定")) //显示对话框  
							{  

							}  

						}
					EditorGUILayout.EndVertical();

					EditorGUILayout.BeginVertical(GUILayout.Width(100));
						EditorGUILayout.LabelField(" ",GUILayout.Width(5),GUILayout.Height(25));
						if (GUILayout.Button("生成全国Lua配置", GUILayout.Width(100),GUILayout.Height(50)))
						{
							PlayModeTools.ExportProvinceLuaScript();
							if (EditorUtility.DisplayDialog("提示", "已导出全国Lua文件至"+PlayModeTools.provinceLuaPath, "确定")) //显示对话框  
							{  

							}  

						}
					EditorGUILayout.EndVertical();

					EditorGUILayout.BeginVertical(GUILayout.Width(75));
						EditorGUILayout.LabelField(" ",GUILayout.Width(75));
					EditorGUILayout.EndVertical();
				EditorGUILayout.EndHorizontal();
			}
			EditorGUILayout.EndVertical();
		}

		private static void DrawItem(ProvinceData config, int index)
        {
			EditorGUILayout.BeginVertical("TextArea",GUILayout.Width(500),GUILayout.Height(25));
				GUILayout.Space(10);
				EditorGUILayout.BeginHorizontal();
					EditorGUILayout.LabelField("省份名:", GUILayout.Width(60));
					config.name = EditorGUILayout.TextField(config.name,GUILayout.Width(100));
					EditorGUILayout.LabelField("缩写名:", GUILayout.Width(50));
					config.shortName = EditorGUILayout.TextField(config.shortName,GUILayout.Width(100));
					EditorGUILayout.LabelField("游戏内名:", GUILayout.Width(50));
					config.gameName = EditorGUILayout.TextField(config.gameName,GUILayout.Width(100));
				EditorGUILayout.EndHorizontal();

				GUILayout.Space(10);
				EditorGUILayout.BeginHorizontal();
					EditorGUILayout.LabelField("标签:", GUILayout.Width(60));
					config.popTag = (PopTagEnum)EditorGUILayout.EnumPopup(config.popTag,GUILayout.Width(100));
					EditorGUILayout.LabelField("是否开启:", GUILayout.Width(60));
					config.isOpen = EditorGUILayout.Toggle(config.isOpen);
					EditorGUILayout.LabelField("是否上线:", GUILayout.Width(50));
					config.isOnline = EditorGUILayout.Toggle(config.isOnline,GUILayout.Width(50));
				EditorGUILayout.EndHorizontal();

				GUILayout.Space(10);
				EditorGUILayout.BeginHorizontal();
					EditorGUILayout.LabelField("AppName:", GUILayout.Width(60));
					config.appName = EditorGUILayout.TextField(config.appName,GUILayout.Width(100));
					
				EditorGUILayout.EndHorizontal();

				GUILayout.Space(10);
//				EditorGUILayout.BeginHorizontal();
//					EditorGUILayout.LabelField("附加字段:", GUILayout.Width(60));
//					config.tips = EditorGUILayout.TextField(config.tips,GUILayout.Width(100));
//					config.isOpenUrl = EditorGUILayout.Toggle(config.isOpenUrl,GUILayout.Width(20));
//					if(config.isOpenUrl)
//					{
//						config.openUrl = EditorGUILayout.TextField(config.openUrl,GUILayout.Width(234));
//					}
//				EditorGUILayout.EndHorizontal();

				Texture popObj = null;
				Texture iconObj = null;
				GUILayout.Space(10);
				EditorGUILayout.BeginHorizontal();
					EditorGUILayout.LabelField("按钮icon:", GUILayout.Width(60));
					EditorGUI.BeginDisabledGroup(true);
					config.btnIcon = EditorGUILayout.TextField(config.btnIcon,GUILayout.Width(300));
					EditorGUI.EndDisabledGroup();
					iconObj = AssetDatabase.LoadAssetAtPath<Texture>(config.btnIcon);
					iconObj = (Texture)EditorGUILayout.ObjectField(iconObj, typeof(Texture), true, GUILayout.Width(120));
					if (iconObj != null)
					{
						config.btnIcon = AssetDatabase.GetAssetPath(iconObj);
					}
				EditorGUILayout.EndHorizontal();

				GUILayout.Space(10);
				EditorGUILayout.BeginHorizontal();
					EditorGUILayout.LabelField("气泡Icon:", GUILayout.Width(60));
					EditorGUI.BeginDisabledGroup(true);
					config.popIcon = EditorGUILayout.TextField(config.popIcon,GUILayout.Width(300));
					EditorGUI.EndDisabledGroup();
					popObj = AssetDatabase.LoadAssetAtPath<Texture>(config.popIcon);
					popObj = (Texture)EditorGUILayout.ObjectField(popObj, typeof(Texture), true, GUILayout.Width(120));
					if (popObj != null)
					{
						config.popIcon = AssetDatabase.GetAssetPath(popObj);
					}
				EditorGUILayout.EndHorizontal();

				GUILayout.Space(10);
				EditorGUILayout.BeginHorizontal();
					if(GUILayout.Button("编辑省内玩法"))
					{
						//popObj == null || iconObj == null || 
						if(config.name == "新增的省份" || config.shortName == "新省" || config.gameName == "NewProvince")
						{
							EditorUtility.DisplayDialog("错误","需要完成按钮图片、省份名、缩略名，游戏名设置！", "确定");
						}
						else
							PlayModeTools.curProvince = index;
					}

					if(popObj != null && iconObj != null)
					{
						if(GUILayout.Button("编辑省份按钮"))
						{
							GameObject go = GameObject.Find("Public_WindowSetProvince");
							if(go == null)
							{
								go = HelpFunEditor.InstantiatePrefab(GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/Canvas/TestWindow").gameObject, 
									AssetDatabase.LoadAssetAtPath<GameObject>("Assets/Game/PackagingResources/Public/Module/SetProvincePublic_WindowSetProvince.prefab")
								);

								go.transform.localScale = Vector3.one;
								go.transform.localPosition = Vector3.zero;
								RectTransform rect = go.transform.GetComponent<RectTransform>();
								rect.anchorMin = Vector2.zero;
								rect.anchorMax = Vector2.one;
								rect.pivot = new Vector2(0.5f, 0.5f);
								rect.offsetMax = Vector2.zero;
								rect.offsetMin = Vector2.zero;
							}

							GameObject btnPrefab = go.transform.Find("Center/Scroll View/Viewport/Content/Item/btnPrefab").gameObject;
							string editorBtnName = "btn" + config.gameName;
							Transform clone = btnPrefab.transform.parent.Find(editorBtnName);
							Transform createBtn = null;
							if(clone == null)
							{
								clone = GameObject.Instantiate(btnPrefab).transform;
								clone.parent = btnPrefab.transform.parent;
								clone.localScale = btnPrefab.transform.localScale;
								clone.localPosition =  btnPrefab.transform.localPosition;
								clone.SetSiblingIndex(config.key);
								clone.name = editorBtnName;
								createBtn = clone.Find("btnPrefab").transform;
								createBtn.name = clone.name;
							}
							createBtn =  clone.Find(clone.name);

							
							Image btnImg = createBtn.GetComponent<Image>();
							btnImg.sprite = AssetDatabase.LoadAssetAtPath<Sprite>(config.btnIcon);
							btnImg.SetNativeSize();

							Image popImg = clone.Find("Pop").GetComponent<Image>();
							popImg.sprite = AssetDatabase.LoadAssetAtPath<Sprite>(config.popIcon);
							popImg.SetNativeSize();

							Text nameTxt = clone.Find("Pop/Text").GetComponent<Text>();
							Outline outLine = nameTxt.transform.GetComponent<Outline>();
							nameTxt.text = config.shortName;
							outLine.effectColor = popObj.name.Contains("蓝") ? outLineColors[0]: popObj.name.Contains("橘") ? outLineColors[1] :popObj.name.Contains("兰") ? outLineColors[3]:outLineColors[2];
							
							clone.gameObject.SetActive(true);

							Selection.activeGameObject = clone.gameObject;
						}
					}
				EditorGUILayout.EndHorizontal();

				

			EditorGUILayout.EndVertical();
        }




		private static bool isHideHead = true;
		// NGUI 的标签头
		static public bool DrawItemHeader(ProvinceData config ,ref HeadState state, int index)
        {
            string text = config.name + "        id = " + config.key;
            GUILayout.Space(3f);
			switch (state)
            {
                case HeadState.Edit:
                    GUI.backgroundColor = new Color(1f, 1f, 1f);
                    text = "\u25BC " + text;
                    break;
                default:
                    GUI.backgroundColor = (index % 2 == 0 ? new Color(0.7f, 0.8f, 0.8f) : new Color(0.8f, 0.8f, 0.8f));
                    text = "\u25BA " + text;
                    break;
            }
            GUILayout.BeginHorizontal();
            GUI.changed = false;

            bool result;
			EditorGUILayout.BeginVertical(GUILayout.Width(415));
            if (state == HeadState.Edit)
			{
				result = true;
                isHideHead = GUILayout.Toggle(isHideHead, text, "dragtab", GUILayout.Width(415));
				if(!isHideHead)
				{
					state = HeadState.Nomal;
					editIndex = -1;
					isHideHead = true;
					result = false;
				}
			}
            else
                result = !GUILayout.Toggle(true, text, "dragtab", GUILayout.Width(415));
			EditorGUILayout.EndVertical();
			GUI.backgroundColor = Color.white;
			EditorGUILayout.BeginVertical(GUILayout.Width(20));
				if(GUILayout.Button("↑", GUILayout.Width(20)))
				{
					int configIndex = PlayModeTools.data.configs.IndexOf(config);
					if(configIndex != 0)
					{
						var temp = PlayModeTools.data.configs[configIndex];
						PlayModeTools.data.configs[configIndex] = PlayModeTools.data.configs[configIndex - 1];
						PlayModeTools.data.configs[configIndex - 1] = temp;
					}
				}
			EditorGUILayout.EndVertical();
			EditorGUILayout.BeginVertical(GUILayout.Width(20));
				if(GUILayout.Button("↓", GUILayout.Width(20)))
				{
					int configIndex = PlayModeTools.data.configs.IndexOf(config);
					if(configIndex != PlayModeTools.data.configs.Count - 1)
					{
						var temp = PlayModeTools.data.configs[configIndex];
						PlayModeTools.data.configs[configIndex] = PlayModeTools.data.configs[configIndex + 1];
						PlayModeTools.data.configs[configIndex + 1] = temp;
					}
				}
			EditorGUILayout.EndVertical();
			GUI.backgroundColor = Color.red;
			EditorGUILayout.BeginVertical(GUILayout.Width(20));
				if(GUILayout.Button("x", GUILayout.Width(20)))
				{
					int configIndex = PlayModeTools.data.configs.IndexOf(config);
					PlayModeTools.data.configs.RemoveAt(configIndex);
				}
			EditorGUILayout.EndVertical();
			
            GUILayout.EndHorizontal();
            GUI.backgroundColor = Color.white;
            //if (!state) GUILayout.Space(3f);
            return result;
        }
	}
}
