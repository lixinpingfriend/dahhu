using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UGUIExtend;
using UnityEngine.UI;
namespace HenanmjToPublic
{

	public enum HeadState
    {
        Nomal, Edit,None,
    }
	public class HenanmjToPublicEditorWindow : EditorWindow {
		private static HenanmjToPublicEditorWindow _window = null;
        List<GameObject> objList = new List<GameObject>();
        private bool showLabel = false;
        Vector2 scrollPosition = new Vector2(0, 0);
        Dictionary<GameObject, string> pathsave = new Dictionary<GameObject, string>();
        public static HenanmjToPublicEditorWindow window
		{
			get{
				if(_window == null)
					Init();
				return _window;
			}
		}
		[MenuItem("Tools/修改henanmj为public ")]
		public static void Init()
		{
			if(_window == null){
				_window = GetWindow<HenanmjToPublicEditorWindow>("HenanmjToPublic");
				_window.minSize = _window.maxSize = new Vector2(800,800);
			}
			_window.Show();
			_window.Focus();
		}

	


		
		
		public void OnGUI()
		{
            GUILayout.Space(10);
            EditorGUILayout.BeginHorizontal();

            if (GUILayout.Button("找出所有henanmj预制件",  GUILayout.Width(150), GUILayout.Height(60)))
            {
                Debug.Log("找出所有预制件");
                FindPrefab();
                
            }
            GUILayout.Space(10);
            if (GUILayout.Button("清除所有预制件", GUILayout.Width(150), GUILayout.Height(60)))
            {
                for (int i = objList.Count - 1; i >= 0; i--)
                {
                    DestroyImmediate(objList[i]);
                }
                objList.Clear();
                pathsave.Clear();
            }
            GUILayout.Space(10);
            if (GUILayout.Button("修改所有预制件", GUILayout.Width(150), GUILayout.Height(60)))
            {
                for (int i = 0; i < objList.Count; i++)
                {
                    ModifyPrefab(objList[i]);
                    Object o = AssetDatabase.LoadAssetAtPath(pathsave[objList[i]], typeof(Object));
                    string nn = o.name.Replace("HeNanMJ", "Public");
                    AssetDatabase.RenameAsset(pathsave[objList[i]], nn);
                }
            }
            GUILayout.Space(10);
            if (GUILayout.Button("保存所有预制件", GUILayout.Width(150), GUILayout.Height(60)))
            {
                for (int i = 0; i < objList.Count; i++)
                {
                    GameObject obs = PrefabUtility.FindPrefabRoot(objList[i]);
                    Object prefab = PrefabUtility.CreateEmptyPrefab(pathsave[obs]);
                    PrefabUtility.ReplacePrefab(obs, prefab, ReplacePrefabOptions.ConnectToPrefab);                    
                    Debug.Log(objList[i].name);
                    EditorUtility.SetDirty(objList[i]);
                    AssetDatabase.SaveAssets();
                    AssetDatabase.Refresh();                  
                }
                Debug.Log("保存成功");
            }
            GUILayout.Space(10);
            EditorGUILayout.EndHorizontal();
            GUILayout.Space(30);
            scrollPosition = GUILayout.BeginScrollView(scrollPosition, true, true, GUILayout.ExpandWidth(true), GUILayout.ExpandHeight(true));
            showLabel = EditorGUILayout.Foldout(showLabel, "GameObject列表");
            if (showLabel)
            {
                for (int i = 0; i < objList.Count; i++)
                {
                    GUILayout.BeginHorizontal();
                    objList[i] = EditorGUILayout.ObjectField(objList[i].name, objList[i], typeof(GameObject), true, GUILayout.Width(450)) as GameObject;
                    
                    if (GUILayout.Button("修改", GUILayout.Width(80)))
                    {
                        

                        Object o  = AssetDatabase.LoadAssetAtPath(pathsave[objList[i]], typeof(Object));
                        string nn = o.name.Replace("HeNanMJ","Public");
                        AssetDatabase.RenameAsset(pathsave[objList[i]], nn);


                        ModifyPrefab(objList[i]);
                        GameObject obs = PrefabUtility.FindPrefabRoot(objList[i]);
                        Object prefab = PrefabUtility.CreateEmptyPrefab(pathsave[obs]);
                        PrefabUtility.ReplacePrefab(obs, prefab, ReplacePrefabOptions.ConnectToPrefab);
                        
                        EditorUtility.SetDirty(objList[i]);
                        AssetDatabase.SaveAssets();
                        AssetDatabase.Refresh();
                        Debug.Log("保存成功");
                    }
                    GUILayout.EndHorizontal();
                }
            }
            GUILayout.EndScrollView();
            

        }

        void ModifyPrefab(GameObject obj)
        {
            GameEventCollector c = obj.GetComponent<GameEventCollector>();
            c.packageName = "public";
            obj.name = obj.name.Replace("HeNanMJ", "Public");
        }
        void FindPrefab()
        {
            if (objList.Count > 0)
            {
                return;
            }
            string[] folders = new string[] { "Assets/Game/PackagingResources/Public/Module" };
            string[] strs = AssetDatabase.FindAssets("t:Prefab", folders);
            string[] paths = new string[strs.Length];
            for (int i = 0; i < strs.Length; i++)
            {
                paths[i] = AssetDatabase.GUIDToAssetPath(strs[i]);
            }
            for (int i = 0; i < paths.Length; i++)
            {
                GameObject obj = (GameObject)PrefabUtility.InstantiatePrefab(AssetDatabase.LoadAssetAtPath(paths[i], typeof(Object)));
                GameEventCollector c = obj.GetComponent<GameEventCollector>();
                if (c)
                {
                    objList.Add(obj);
                    pathsave.Add(obj, paths[i]);
                }
                else
                {
                    DestroyImmediate(obj);
                }                
            }
        }

	}
}

