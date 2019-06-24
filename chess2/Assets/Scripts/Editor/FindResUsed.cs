
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using UnityEditor;
using UnityEngine.UI;

public class PrefabDependencies{
    public PrefabDependencies(string path){
        _prefabPath = "Assets"+path.Replace(Application.dataPath,"");
        _prefabPath = _prefabPath.Replace ("\\", "/");
    }
    //.prefab or unity
    public string _prefabPath;
    public List<string> _dependencies;
    public bool _showDependencies;
    public void GetDependencies(){
        string[] path = new string[1];
        path [0] = _prefabPath;
        string[] paths =AssetDatabase.GetDependencies (path); 
        _dependencies = new List<string> ();
        for(int i = 0;i < paths.Length;i++){
            _dependencies.Add(paths[i]);
        }
    }
}


/// <summary>
/// 查找资源引用插件
/// @author Jyz

/// </summary>
public class FindResUsed : EditorWindow {
	static FindResUsed window;
	static string  mAssetPath = "";
	static string mPath = "";
	static List<string> mFindPath;
	static List<PrefabDependencies> mPrefabs;
	static List<Object> mUsed;
	static Dictionary<Object,List<string>> mProDic; //project 视图
	static Dictionary<Object,List<string>> mHierDic; //Hierarchy视图
	static Dictionary<GameObject,List<GameObject>> mGo;
	static Vector2 mScroll = Vector2.zero;

    [MenuItem("Assets/GetDependes")]
	public static void GetDependes()
	{
		var mPath = AssetDatabase.GetAssetPath(Selection.activeObject);
        foreach(var file in AssetDatabase.GetDependencies(mPath)){
			Debug.Log(file, AssetDatabase.LoadMainAssetAtPath(file));
		}
	}

	[MenuItem("Tools/资源引用窗口")]
	public static void Init()
	{
		window = EditorWindow.GetWindow<FindResUsed>();
		mAssetPath = Application.dataPath;

		FindAssets();
	}

	[MenuItem("Assets/查找资源使用的情况 %&f")]
	public static void FindUsePrefab(){
		mPath = AssetDatabase.GetAssetPath(Selection.activeObject);
		if (window == null) {
			Init();
		}else
		{
			window = EditorWindow.GetWindow<FindResUsed>();
			window.Show();
		}
		Find();
	}

	private static void FindAssets()
    {
        mFindPath = new List<string>();
        FindAssetPath(mAssetPath);
        GetPrefabs();
        GetPrefabDependencie();
    }

	/// <summary>
    /// 查找资源路径 => 查找出所有的资源
    /// </summary>
    /// <param name="path"></param>
    static void FindAssetPath(string path)
    {
        string[] Directorys = new string[0];
        try
        {
            Directorys = Directory.GetFiles(path);
        }
        catch { }
        if (Directorys != null)
        {
            for (var i = 0; i < Directorys.Length; i++)
            {
                if (!mFindPath.Contains(Directorys[i]))
                    mFindPath.Add(Directorys[i]);
            }
        }
        Directorys = Directory.GetDirectories(path);
        for (int i = 0; i < Directorys.Length; i++)
        {
            string newpath;
            newpath = Path.GetDirectoryName(Directorys[i]) + "/" + Path.GetFileName(Directorys[i]);
            FindAssetPath(newpath);
        }
    }

	/// <summary>
    /// 获取所有的prefab
    /// </summary>
    static void GetPrefabs()
    {
        mPrefabs = new List<PrefabDependencies>();
        for (int i = 0; i < mFindPath.Count; i++)
        {
            string expandname = Path.GetExtension(mFindPath[i]);
            if (expandname == ".prefab" || expandname == ".unity")
            {
                PrefabDependencies pd = new PrefabDependencies(mFindPath[i]);
                mPrefabs.Add(pd);
            }
        }
    }

	/// <summary>
    /// 获取预制件的索引
    /// </summary>
    static void GetPrefabDependencie()
    {
        for (int i = 0; i < mPrefabs.Count; i++)
        {
            mPrefabs[i].GetDependencies();
            if (EditorUtility.DisplayCancelableProgressBar("获取索引", "GetDependencie:" + i, (float)i / mPrefabs.Count))
            {
                EditorUtility.ClearProgressBar();
                return;
            }
        }
        EditorUtility.ClearProgressBar();
    }

	static void Find()
    {
        mUsed = new List<Object>();
        mProDic = new Dictionary<Object, List<string>>();
        mHierDic = new Dictionary<Object, List<string>>();
        mGo = new Dictionary<GameObject, List<GameObject>>();
		Object loadRes = AssetDatabase.LoadAssetAtPath<Object>(mPath);
        System.Type T = loadRes.GetType();
		Debug.Log(T.Name);
        for (int i = 0; i < mPrefabs.Count; i++)
        {
            if (mPrefabs[i]._dependencies.Contains(mPath))
            {
                GameObject go;
                try
                {
                    go = (GameObject)AssetDatabase.LoadAssetAtPath<Object>(mPrefabs[i]._prefabPath);
                }
                catch (System.Exception e)
                {
                    continue;
                }
				mUsed.Add(go);
				Debug.Log(mPrefabs[i]._prefabPath);
				Debug.Log(T.Name.Equals("Texture2D"));
				if(T.Name.Equals("Texture2D")) 
                	FindSpriteUsed(go,loadRes);
            }
        }
    }

	static void FindSpriteUsed(GameObject go,Object loadRes)
	{
		mProDic[go] = new List<string>();
		mHierDic[go] = new List<string>();
		Image[] imgs = FindAllComponents<Image>(go.transform);
		Debug.Log(imgs.Length);
		for(int i = 0; i < imgs.Length;i++)
		{
			if(imgs[i].sprite != null && imgs[i].sprite.texture == loadRes)
			{
				Debug.Log(imgs[i].gameObject.name);
				Debug.Log(imgs[i].sprite.texture.name);
				mProDic[go].Add(imgs[i].gameObject.name);
				mHierDic[go].Add(GetTransPath(imgs[i].transform));
			}
		}

		SpriteHolder[] spHolder = FindAllComponents<SpriteHolder>(go.transform);
		for(int i = 0; i < spHolder.Length;i++)
		{
			for(int j =0; j < spHolder[i].injections.Count; j++)
			{
				if(spHolder[i].injections[j].value != null && spHolder[i].injections[j].value.texture == loadRes)
				{
					mProDic[go].Add(spHolder[i].gameObject.name);
					mHierDic[go].Add(GetTransPath(spHolder[i].transform));
				}
			}
		}

        SpriteAtlas[] spAtlas = FindAllComponents<SpriteAtlas>(go.transform);
        for(int i = 0; i < spAtlas.Length;i++)
		{
			for(int j =0; j < spAtlas[i].values.Count; j++)
			{
				if(spAtlas[i].values[j] != null && spAtlas[i].values[j].texture == loadRes)
				{
					mProDic[go].Add(spAtlas[i].gameObject.name);
					mHierDic[go].Add(GetTransPath(spAtlas[i].transform));
				}
			}
		}

	}

	/// <summary>
    /// 获取预制件视图路径 如:Areane/background/bg
    /// </summary>
    /// <param name="trans"></param>
    /// <returns></returns>
    private static string GetTransPath(Transform trans)
    {
        if (trans == null)
            return "";
        System.Text.StringBuilder sb = new System.Text.StringBuilder();

        if (trans.parent != null)
        {
            sb.Append(GetTransPath(trans.parent));
            sb.Append("/");
        }

        sb.Append(trans.name);
        return sb.ToString();
    }


	void OnGUI()
    {
        if (mUsed != null)
        {
            EditorGUILayout.BeginVertical();
            DrawHeader("引用的预制件");
            mScroll = GUILayout.BeginScrollView(mScroll);
            List<GameObject> ls = null;
            if (mGo.Count > 0)
                ls = new List<GameObject>(mGo.Keys);
            for (int i = 0; i < mUsed.Count; i++)
            {
                if (ls == null)
                    DrawProject(i);
                else
                {
                    for (int j = 0; j < ls.Count; j++)
                    {
                        if (ls[j] == null)
                        {
                            mGo.Remove(ls[j]);
                            ls.Remove(ls[j]);
                        }
                    }
                    GameObject go = ls.Find((a) => a.name == mUsed[i].name);
                    if (go == null)
                        DrawProject(i);
                    else
                        DrawHierarchy(i, go);
                }
            }
            GUILayout.EndScrollView();
            EditorGUILayout.EndVertical();
        }
    }

	/// <summary>
    /// Hierarchy视图引用
    /// </summary>
    static void DrawHierarchy(int index,GameObject mPrefab)
    {
        EditorGUILayout.BeginVertical("TextArea");
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.ObjectField("预制件:", mPrefab, typeof(GameObject), false);
        EditorGUILayout.EndHorizontal();

        if (mHierDic.ContainsKey(mUsed[index]))
        {
            for (int j = 0; j < mHierDic[mUsed[index]].Count; j++)
            {
                if(mGo[mPrefab].Count < j+1)
                    mGo[mPrefab].Add(FindByName(mHierDic[mUsed[index]][j]));
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.ObjectField("物体" + (j + 1).ToString() + ":", mGo[mPrefab][j], typeof(GameObject), false);
                EditorGUILayout.EndHorizontal();
            }
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space();
    }

    /// <summary>
    /// project视图引用
    /// </summary>
    static void DrawProject(int index)
    {
        EditorGUILayout.BeginVertical("TextArea");
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.ObjectField("预制件:", mUsed[index], typeof(GameObject), false);
        EditorGUILayout.EndHorizontal();

        if (mProDic.ContainsKey(mUsed[index]))
        {
            for (int j = 0; j < mProDic[mUsed[index]].Count; j++)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("物体" + (j + 1).ToString() + ":", GUILayout.Width(145));
                if (GUILayout.Button(mProDic[mUsed[index]][j], GUILayout.Width(250)))
                {
                    GameObject go = FindByName(mUsed[index].name);
                    if (go == null)
                    {
						go = HelpFunEditor.InstantiatePrefab(GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/Canvas/TestWindow").gameObject, mUsed[index] as GameObject);
                        go.transform.localScale = Vector3.one;
                        go.transform.localPosition = Vector3.zero;
                        RectTransform rect = go.transform.GetComponent<RectTransform>();
                        //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Left,0f,0f );
                        //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Right, 0f, 0f);
                        //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Bottom, 0f, 0f);
                        //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Top, 0f, 0f);
                        rect.anchorMin = Vector2.zero;
                        rect.anchorMax = Vector2.one;
                        rect.pivot = new Vector2(0.5f, 0.5f);
                        rect.offsetMax = Vector2.zero;
                        rect.offsetMin = Vector2.zero;
                    }
                    if (go == null)
                    {
                        Debug.LogError("无法定位该预制件！无法加载到Hierarchy!");
                        continue;
                    }
                    if(!mGo.ContainsKey(go))
                        mGo[go] = new List<GameObject>();
                }
                EditorGUILayout.EndHorizontal();
            }
        }
        EditorGUILayout.EndVertical();
        EditorGUILayout.Space();
    }

	private static void DrawHeader(string name)
    {
        GUILayout.BeginHorizontal();
        GUILayout.Space(3f);
        GUI.changed = false;
        name = "<b><size=11>" + name + "</size></b>";
        name = "\u25BC " + name;
        GUILayout.Toggle(true, name, "dragtab", GUILayout.MinWidth(20f));
        GUILayout.Space(2f);
        GUILayout.EndHorizontal();
        GUI.backgroundColor = Color.white;
    }

		/// <summary>
        /// 查询指定类型的所有组件,包括子对象和未激活(active=false)的对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="tsf"></param>
        /// <returns></returns>
        public static T[] FindAllComponents<T>(Transform tsf) where T : MonoBehaviour
        {
            List<T> list = new List<T>();
            FindAllComponents<T>(tsf, list);
            return list.ToArray();
        }

		public static void FindAllComponents<T>(Transform tsf, List<T> list) where T : MonoBehaviour
        {
            for (int i = 0; i < tsf.childCount; i++)
            {
                FindAllComponents<T>(tsf.GetChild(i), list);
            }
            T t = tsf.GetComponent<T>();
            if (t)
                list.Add(t);
        }

		 /// <summary>
        /// 查找游戏对象,包括active为false的对象
        /// </summary>
        /// <param name="name">可以是完整路径或部分路径</param>
        /// <returns></returns>
        public static GameObject FindByName(string name)
        {
            if (string.IsNullOrEmpty(name))
                return null;

            GameObject go = GameObject.Find(name);
            if (!go)
            {
                string[] names = name.Split('/');
                string lastName = names[names.Length - 1];
                GameObject[] list = Resources.FindObjectsOfTypeAll<GameObject>();
                Transform parent;
                bool find;
                
                for (int i = 0; i < list.Length; i++)
                {

                    if (list[i].hideFlags != HideFlags.None)
                        continue;
                    //参考 http://answers.unity3d.com/questions/52560/gameobjectfind-work-on-inactive-objects.html
#if UNITY_EDITOR
                    if (Application.isEditor)
                    {
                        string sAssetPath = UnityEditor.AssetDatabase.GetAssetPath(list[i].transform.root.gameObject);
                        if (!string.IsNullOrEmpty(sAssetPath))
                        {
                            continue;
                        }
                    }
#endif
                    if (list[i].name == lastName)
                    {
                        parent = list[i].transform.parent;
                        find = true;
                        for (int j = names.Length - 2; j >= 0; j--)
                        {
                            if (parent && names[j] == parent.name)
                            {
                                parent = parent.parent;
                            }
                            else
                            {
                                find = false;
                                break;
                            }
                        }
                        if (find)
                            return list[i];
                    }
                }
            }
            return go;
        }

        public static T FindByName<T>(string name) where T : Component
        {
            if (string.IsNullOrEmpty(name))
                return FindByType<T>();

            GameObject go = GameObject.Find(name);
            if (!go)
            {
                string[] names = name.Split('/');
                string lastName = names[names.Length - 1];
                T[] list = Resources.FindObjectsOfTypeAll<T>();
                Transform parent;
                bool find;

                for (int i = 0; i < list.Length; i++)
                {

                    if (list[i].hideFlags != HideFlags.None)
                        continue;
                    //参考 http://answers.unity3d.com/questions/52560/gameobjectfind-work-on-inactive-objects.html
#if UNITY_EDITOR
                    if (Application.isEditor)
                    {
                        string sAssetPath = UnityEditor.AssetDatabase.GetAssetPath(list[i].transform.root.gameObject);
                        if (!string.IsNullOrEmpty(sAssetPath))
                        {
                            continue;
                        }
                    }
#endif
                    if (list[i].name == lastName)
                    {
                        parent = list[i].transform.parent;
                        find = true;
                        for (int j = names.Length - 2; j >= 0; j--)
                        {
                            if (parent && names[j] == parent.name)
                            {
                                parent = parent.parent;
                            }
                            else
                            {
                                find = false;
                                break;
                            }
                        }
                        if (find)
                            return list[i];
                    }
                }
            }
            else
                return go.GetComponent<T>();
            return null;
        }

		/// <summary>
        /// 查找指定类型的游戏对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static T FindByType<T>() where T : Object
        {
            T t = GameObject.FindObjectOfType<T>();
            if (!t)
            {
                T[] ts = Resources.FindObjectsOfTypeAll<T>();
                if (ts != null && ts.Length > 0)
                    t = ts[0];
            }
            return t;
        }
	
}
