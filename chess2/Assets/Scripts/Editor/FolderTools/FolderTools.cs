using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;
using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Reflection;

public class FolderTools : EditorWindow
{
    [MenuItem("Tools/Open FolderTools Window")]
    public static void CreateWindow()
    {
        Rect wr = new Rect(0, 0, 500, 500);
        FolderTools wnd = (FolderTools)EditorWindow.GetWindowWithRect(typeof(FolderTools), wr, true, "IOS审核工具集");
        wnd.Show();
    }

    public FolderTools()
    {
        InitSpecialClass();
        initBlackList();
    }

    private string folderPrefix = "Pre";
    private string folderSuffix = "Suf";

    private string selectMd5 = "";
    private string lastSelectMd5 = "";
    private void OnGUI()
    {
        GUILayout.Label("修改文件夹名字：");
        folderPrefix = EditorGUILayout.TextField("输入目标目录的额外前缀：", folderPrefix);
        folderSuffix = EditorGUILayout.TextField("输入目标目录的额外后缀：", folderSuffix);
        GUILayout.BeginHorizontal();
        if (GUILayout.Button("修改目录名(包含子目录)"))
        {
            AddFolderFix();
        }
        if (GUILayout.Button("移除目录名的前后缀"))
        {
            DelFolderFix();
        }
        GUILayout.EndHorizontal();
        GUILayout.Label("===============我是分割线===================");
        GUILayout.Label("往目录下添加文件：Assets/Game/Icons/2_2.png");

        GUILayout.BeginHorizontal();
        if (GUILayout.Button("往目录下添加指定文件"))
        {
            AddCopyImage();
        }
        if (GUILayout.Button("移除目录下指定文件"))
        {
            DelCopyImage();
        }
        GUILayout.EndHorizontal();

        GUILayout.Label("===============我是分割线===================");
        if (Selection.activeObject != null)
        {
            selectMd5 = EditorGUILayout.TextField("当前MD5:", selectMd5);
        }
        lastSelectMd5 = EditorGUILayout.TextField("上次MD5:", lastSelectMd5);
        GUILayout.BeginHorizontal();
        if (GUILayout.Button("显示MD5"))
        {
            if (string.IsNullOrEmpty(selectMd5))
            {
                lastSelectMd5 = PlayerPrefs.GetString("lastMD5", selectMd5);
            }
            else
            {
                lastSelectMd5 = selectMd5;
            }
            if (Selection.activeObject != null)
            {
                selectMd5 = GetMD5HashFromFile(AssetDatabase.GetAssetPath(Selection.activeObject));
            }
            PlayerPrefs.SetString("lastMD5", selectMd5);
        }
        GUILayout.EndHorizontal();
        GUILayout.Label("===============我是分割线===================");
        fieldPreFix = EditorGUILayout.TextField("输入变量前缀：", fieldPreFix);
        fieldSufFix = EditorGUILayout.TextField("输入变量后缀：", fieldSufFix);
        GUILayout.BeginHorizontal();
        if (GUILayout.Button("添加私有变量前后缀"))
        {
            if (!startRename) RenameNonPublicFieldFix(true);
        }
        if (GUILayout.Button("删除私有变量前后缀"))
        {
            if (!startRename) RenameNonPublicFieldFix(false);
        }
        GUILayout.EndHorizontal();
        if (startRename) GUILayout.Label("正在操作:" + renamePath);
        GUILayout.Label("===============我是分割线===================");
        GUILayout.Label("文件目录:"+DataPath + fileFolder);
        GUILayout.BeginHorizontal();
        if(GUILayout.Button("随机生成文件"))
        {
            CreateTextFile();
        }
        if (GUILayout.Button("删除随机文件"))
        {
            DeleteTextFile();
        }
        GUILayout.EndHorizontal();
        GUILayout.Label("===============我是分割线===================");
        if (GUILayout.Button("test"))
        {
            Type type = typeof(gcloud_voice.GCloudVoiceEngine);
            MethodInfo[] fields = type.GetMethods(BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Static);
            foreach (var item in fields)
            {
                //bool b = (item)
                bool b = Attribute.IsDefined(item, typeof(System.Runtime.InteropServices.DllImportAttribute));
                Debug.Log("item.Name:" + item.Name + "," + b);
            }
        }
    }

    #region 修改目录名字
    /// <summary>
    /// 修改文件夹名字,添加前缀和后缀
    /// </summary>
    void AddFolderFix()
    {
        UnityEngine.Object selection = Selection.activeObject;
        if (selection != null)
        {
            string selectPath = AssetDatabase.GetAssetPath(selection);
            string[] subPaths = Directory.GetDirectories(selectPath, "*", SearchOption.AllDirectories);
            System.Array.Reverse(subPaths);//反序,从子目录开始修改
            string destFolderPath = string.Empty;
            foreach (var path in subPaths)
            {
                if (path.Contains("framework") || path.Contains("bundle"))
                    continue;//framework的目录不要修改,会打包报错。bundle也不需要修改
                Debug.Log("path:" + path);
                destFolderPath = path.Insert(path.LastIndexOf('/') + 1, folderPrefix) + folderSuffix;
                Debug.Log("destFolderPath:" + destFolderPath);
                Directory.Move(path, destFolderPath);
            }
        }
        AssetDatabase.Refresh();
    }
    /// <summary>
    /// 修改文件夹名字,删除指定的前缀和后缀
    /// </summary>
    void DelFolderFix()
    {
        UnityEngine.Object selection = Selection.activeObject;
        if (selection != null)
        {
            string selectPath = AssetDatabase.GetAssetPath(selection);
            string[] subPaths = Directory.GetDirectories(selectPath, "*", SearchOption.AllDirectories);
            System.Array.Reverse(subPaths);//反序,从子目录开始修改
            string folderName = string.Empty;
            string newFolderName = string.Empty;
            string destFolderPath = string.Empty;
            foreach (var path in subPaths)
            {
                if (path.Contains("framework") || path.Contains("bundle"))
                    continue;//framework的目录不要修改,会打包报错。bundle也不需要修改
                Debug.Log("path:" + path);
                folderName = path.Remove(0, path.LastIndexOf('/') + 1);
                //Debug.Log("folderName:" + folderName);
                if (folderName.StartsWith(folderPrefix, StringComparison.Ordinal) && path.EndsWith(folderSuffix, StringComparison.Ordinal))
                {
                    newFolderName = folderName.Remove(0, folderPrefix.Length);
                    //Debug.Log("newFolderName:"+newFolderName);
                    newFolderName = newFolderName.Remove(newFolderName.LastIndexOf(folderSuffix));
                    //Debug.Log("newFolderName:" + newFolderName);
                }
                destFolderPath = path.Remove(path.LastIndexOf('/') + 1) + newFolderName;
                Debug.Log("destFolderPath:" + destFolderPath);
                Directory.Move(path, destFolderPath);
            }
        }
        AssetDatabase.Refresh();
    }
    #endregion 修改目录名字

    #region 添加图片以修改部分整包assetbundle
    string targetImgName = "/2_2.png";
    void AddCopyImage()
    {
        string dataPath = Application.dataPath.Remove(Application.dataPath.LastIndexOf('/') + 1);
        string filePath = dataPath + "Assets/Game/Icons" + targetImgName;
        Debug.Log("filePath:" + filePath);
        List<string> imageFolders = GetAllImageFolders();
        string destFilePath = string.Empty;
        foreach (var imgFolder in imageFolders)
        {
            destFilePath = dataPath + imgFolder + targetImgName;
            Debug.Log("destFilePath:" + destFilePath);
            //AssetDatabase.CopyAsset(filePath, destFilePath);
            File.Copy(filePath, destFilePath, true);
        }
        AssetDatabase.Refresh();
    }

    void DelCopyImage()
    {
        string dataPath = Application.dataPath.Remove(Application.dataPath.LastIndexOf('/') + 1);
        List<string> imageFolders = GetAllImageFolders();
        foreach (var imgFolder in imageFolders)
        {
            string deleteOnePath = dataPath + imgFolder + targetImgName;
            Debug.Log("deleteOnePath:" + deleteOnePath);
            //AssetDatabase.DeleteAsset(deleteOnePath);
            if (File.Exists(deleteOnePath))
                File.Delete(deleteOnePath);
        }
        AssetDatabase.Refresh();
    }

    List<string> GetAllImageFolders()
    {
        List<string> list = new List<string>();
        UnityEngine.Object[] selections = Selection.objects;
        if (selections != null)
        {
            foreach (var selection in selections)
            {
                string selectPath = AssetDatabase.GetAssetPath(selection);
                string[] subPaths = Directory.GetDirectories(selectPath, "*", SearchOption.AllDirectories);
                foreach (var path in subPaths)
                {
                    //Debug.Log("path 1:" + path);
                    if (CheckNeedAdd(path))
                    {
                        //Debug.Log("true path:" + path);
                        list.Add(path);//添加xxx/Image目录
                    }
                }
            }
        }
        else
        {
            Debug.LogError("请先选择目录！");
        }
        return list;
    }
    /// <summary>
    /// 是否只有文件夹
    /// </summary>
    bool IsOnlyFolder(string _folerPath)
    {
        string[] files = Directory.GetFiles(_folerPath);
        foreach (var item in files)
        {
            if (!item.EndsWith(".meta"))
                return false;
        }
        Debug.Log("该目录下只有文件夹：" + _folerPath);
        return true;
    }
    /// <summary>
    /// 检查是否需要往该目录下添加文件
    /// </summary>
    /// <returns><c>true</c>, if need add was checked, <c>false</c> otherwise.</returns>
    bool CheckNeedAdd(string _folerPath)
    {
        if (!IsOnlyFolder(_folerPath))
        {
            //AssetImporter importer = AssetImporter.GetAtPath(path);
            string[] files = Directory.GetFiles(_folerPath);
            string fileBundleName = string.Empty;
            bool hasDiffAssetBundleName = false;
            foreach (var item in files)
            {
                if (!item.EndsWith(".meta"))
                {
                    AssetImporter importer = AssetImporter.GetAtPath(item);
                    if (importer != null && !string.IsNullOrEmpty(importer.assetBundleName))
                    {
                        if (string.IsNullOrEmpty(fileBundleName))
                        {
                            fileBundleName = importer.assetBundleName;
                        }
                        else
                        {
                            if (!fileBundleName.Equals(importer.assetBundleName))
                            {
                                hasDiffAssetBundleName = true;
                                break;
                            }
                        }
                    }
                }
            }
            if (!string.IsNullOrEmpty(fileBundleName) && !hasDiffAssetBundleName)
            {
                Debug.Log("need add path:" + _folerPath);
                return true;
            }
        }
        return false;
    }
    #endregion 添加图片以修改部分整包assetbundle

    #region MD5码显示工具
    /// <summary>
    /// 获取 MD5 值
    /// </summary>
    private string GetMD5HashFromFile(string fileName)
    {
        Debug.Log("GetMD5HashFromFile");
        try
        {
            FileStream file = new FileStream(fileName, FileMode.Open);
            System.Security.Cryptography.MD5 md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] retVal = md5.ComputeHash(file);
            file.Close();

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < retVal.Length; i++)
            {
                sb.Append(retVal[i].ToString("x2"));
            }
            return sb.ToString();
        }
        catch (Exception ex)
        {
            throw new Exception("GetMD5HashFromFile() fail,error:" + ex.Message);
        }
    }
    #endregion MD5码显示工具

    #region 修改C#中私有变量和私有函数名
    private string fieldSufFix = "_suf";
    private string fieldPreFix = "pre_";

    private void RenameNonPublicFieldFix(bool _add)
    {
        Assembly assembly = Assembly.Load("Assembly-CSharp");
        List<Type> types = new List<Type>(assembly.GetTypes());
        string dataPath = DataPath;
        string[] guids = null;
        string path = string.Empty;
        string[] root = new string[] { "Assets" };
        dataList.Clear();
        while (types.Count > 0)
        {
            Type item = types[0];
            types.RemoveAt(0);
            if (typeBlackList.Contains(item))
                continue;
            if (CheckType(item))
            {
                string typeName = item.ToString();
                string className = typeName;
                if (typeName.Contains("."))
                {
                    className = typeName.Substring(typeName.LastIndexOf('.') + 1);//去除命名空间
                }
                string scriptName = className;
                if (className.Contains("+"))
                {
                    scriptName = className.Remove(className.IndexOf('+'));//内部类
                }
                if (specialTypePairs.ContainsKey(item))
                {
                    if (!string.IsNullOrEmpty(specialTypePairs[item]))
                        scriptName = specialTypePairs[item];//有些类型需要走配置
                }
                guids = AssetDatabase.FindAssets("t:Script " + scriptName, root);
                if (guids != null && guids.Length > 0)
                {
                    bool state = false;
                    foreach (var guid in guids)
                    {
                        path = dataPath + AssetDatabase.GUIDToAssetPath(guid);
                        if (Path.GetFileNameWithoutExtension(path) == scriptName)
                        {
                            state = true;
                            break;
                        }
                    }
                    if (!state)
                    {
                        Debug.LogError("!!因找不到文件,未能修改:" + item.ToString() + ",scriptName:" + scriptName);
                        continue;
                    }
                    if (path.Contains("ToLua/Source/Generate") || path.Contains("/Editor/"))
                    {
                        //Debug.LogWarning("路劲特殊,无需修改:" + path+",type:"+typeName);
                        continue;//生成的脚本无需修改
                    }
                    //Debug.Log("能修改的脚本path:" + path);
                    //continue;
                    AddData(item, path, _add);
                }
                else
                {
                    Debug.LogError("因找不到文件,未能修改:" + item.ToString());
                }
            }
        }
        StartFieldRename();
        //AssetDatabase.Refresh();
    }

    void StartFieldRename()
    {
        startRename = true;
        currentTime = 0f;
        lastRenameTime = 0f;
    }

    protected string renamePath = string.Empty;
    void RenameForType(Type _classType, string _csPath, bool _add)
    {
        List<string> fields = GetNonPublicFieldName(_classType);
        if (fields.Count > 0)
        {
            Debug.Log("RenameForType:" + _classType + "path:" + _csPath);
            renamePath = _csPath;
        }
        else
        {
            return;
        }
        string fileText = File.ReadAllText(_csPath);
        string destField = string.Empty;

        //Debug.Log("fileText1:"+fileText);
        foreach (var field in fields)
        {
            if (fileText.Contains("." + field))
            {
                continue;
                //如果类中有个变量叫int fontSize;然后UnityEngine.UI.Text t;则t.fontSize也会改变
                //缺陷： private int aaa;如果用到了this.aaa，那么也不会改
            }
            if (_add)
            {
                string destStr = fieldPreFix + field + fieldSufFix;
                string regexStr = string.Format(@"\W{0}\W", field);
                string blackStr = "\"" + field + "\"";
                Regex regex = new Regex(regexStr);
                fileText = regex.Replace(fileText, new MatchEvaluator(mn => (mn.Value == blackStr) ? mn.Value : mn.Value.Replace(field, destStr)));
            }
            else
            {
                if (field.StartsWith(fieldPreFix, StringComparison.Ordinal) && field.EndsWith(fieldSufFix, StringComparison.Ordinal))
                {
                    destField = field.Remove(0, fieldPreFix.Length);
                    destField = destField.Remove(destField.Length - fieldSufFix.Length, fieldSufFix.Length);
                    //Debug.Log("destField:" + destField);
                    fileText = fileText.Replace(field, destField);
                }
            }
        }
        //Debug.Log("fileText2:" + fileText);
        File.WriteAllText(_csPath, fileText, Encoding.UTF8);
    }

    List<string> GetNonPublicFieldName(Type _type)
    {
        List<string> list = new List<string>();
        Type typeIns = _type;
        if (typeIns != null)
        {
            FieldInfo[] fields = typeIns.GetFields(BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Static);
            //Debug.Log("fields:" + fields.Length);
            foreach (var item in fields)
            {
                //Debug.Log(item.Name);
                if (item.IsPrivate && !IsDelegate(item.FieldType) && !Attribute.IsDefined(item, typeof(UnityEngine.SerializeField)))
                    list.Add(item.Name);
            }
            MethodInfo[] methods = typeIns.GetMethods(BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.Static);
            //Debug.Log("methods:" + methods.Length);
            foreach (var item in methods)
            {
                if (item.IsPrivate)
                {
                    if (item.Name.StartsWith("On", StringComparison.Ordinal))
                        continue;//排除On开头的回调方法
                    if (methodBlackList.Contains(item.Name))
                        continue;//排除黑名单方法
                    if (Attribute.IsDefined(item, typeof(System.Runtime.InteropServices.DllImportAttribute)))
                        continue;//排除[DllImport]
                    //排除方法重载了public的情况
                    if (typeIns.GetMethod(item.Name, BindingFlags.Public | BindingFlags.Instance | BindingFlags.Static) == null)
                        list.Add(item.Name);
                }
            }
        }
        return list;
    }

    protected string DataPath
    {
        get
        {
            return Application.dataPath.Remove(Application.dataPath.LastIndexOf('/') + 1);
        }
    }

    private bool CheckType(Type _type)
    {
        if (_type.IsClass)
        {
            if (!IsDelegate(_type))
            {
                return true;
            }
            else
            {
                Debug.LogWarning("delegate类型:" + _type);
            }
        }
        else
        {
            Debug.LogWarning("非Class类:" + _type);
        }
        return false;
    }
    private bool IsDelegate(Type _type)
    {
        if (_type.BaseType != null && _type.BaseType.ToString() == "System.MulticastDelegate")
        {
            return true;
        }
        return false;
    }

    protected Dictionary<Type, string> specialTypePairs = new Dictionary<Type, string>();
    private void InitSpecialClass()
    {
        Assembly assembly = Assembly.Load("Assembly-CSharp");
        Dictionary<Type, string> pairs = new Dictionary<Type, string>();
        pairs.Add(typeof(GameAsset.LoadedAssetBundleAsyncOperation), "AssetBundleLoadOperation");
        pairs.Add(typeof(CDecompress), "Compress");
        pairs.Add(typeof(DNet.Buffer), "DNBuffer");
        pairs.Add(typeof(DNet.VideoData), "DNBuffer");
        pairs.Add(typeof(DNet.VideoFrameData), "DNBuffer");
        pairs.Add(typeof(DNet.GameWebSocketClient), "GameWebSocketNetClient");
        pairs.Add(typeof(TimeEvent), "SmartTimer");
        pairs.Add(typeof(AudioPlayOperation), "AudioPlayUtil");
        pairs.Add(typeof(BestHttpOperation), "BestHttpUtil");
        pairs.Add(typeof(WWWOperation), "WWWUtil");
        pairs.Add(typeof(WWWConcurrence), "WWWUtil");
        pairs.Add(typeof(GameConfigNet), "GameConfigProject");//2
        //pairs.Add(Type.GetType("Serialization`1[T]"), "GenericitySerialization");
        //pairs.Add(Type.GetType("Serialization`2[TKey,TValue]"), "GenericitySerialization");
        //pairs.Add(Type.GetType("MonoSingletonProject`1[T]"), "MonoSingletonProject");
        //pairs.Add(Type.GetType("SingletonProject`1[T]"), "MonoSingletonProject");
        //pairs.Add(Type.GetType("Utility.ObjectPool`1[T]"), "ObjectPool");
        pairs.Add(assembly.GetType("BestHTTP.StreamList"), "FileConnection");
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.DeflateManager"), "Deflate");
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.InflateBlocks"), "Inflate");
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.InflateCodes"), "Inflate");
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.InflateManager"), "Inflate");
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.Adler"), "Zlib");
        //pairs.Add(assembly.GetType("PlatformSupport.Collections.ObjectModel.ObservableDictionary`2[TKey, TValue]"), "ObservableDictionary");
        pairs.Add(assembly.GetType("PlatformSupport.Collections.Specialized.ReadOnlyList"), "NotifyCollectionChangedEventArgs");
        pairs.Add(typeof(ExceptionShow), "LuaException");
        pairs.Add(typeof(LuaInterface.LuaArrayTable), "LuaTable");
        pairs.Add(assembly.GetType("LuaInterface.LuaArrayTable+Enumerator"), "LuaTable");
        pairs.Add(typeof(LuaInterface.LuaDictTable), "LuaTable");
        pairs.Add(assembly.GetType("LuaInterface.LuaDictTable+Enumerator"), "LuaTable");
        //pairs.Add(assembly.GetType("LuaInterface.LuaDictTable`2[K,V]"), "LuaTable");
        //pairs.Add(assembly.GetType("LuaInterface.LuaDictTable`2+Enumerator[K,V]"), "LuaTable");
        pairs.Add(typeof(LuaInterface.LuaObjectPool), "ObjectPool");


        //1.delegate 2.无私有 3.其他 4.特殊路劲
        //pairs.Add(Type.GetType("DNet.DNList`1[T]"), "");//3
        pairs.Add(typeof(CustomEventData), "");//2
        // pairs.Add(typeof(GVoiceStatus), "");//2
        pairs.Add(typeof(GVoiceManagerAction), "");//2
        pairs.Add(typeof(HttpData), "");//2
        pairs.Add(typeof(CanvasData), "");//2
        pairs.Add(typeof(AsyncFileOperationData), "");//2
        //pairs.Add(typeof(hejihejixjf_DG_Tweening_Core_TweenerCore_UnityEngine_Vector3_DG_Tweening_Plugins_Core_PathCore_Path_DG_Tweening_Plugins_Options_QuaternionOptionsWrap_hejihejixjf), "");//4
        pairs.Add(typeof(gcloud_voice.GCloudVoiceEngine.NoticeMessage), "");//2
        pairs.Add(typeof(PropertyLabel), "");//2
        //pairs.Add(assembly.GetType("UiEffect.UiEffectObjectPool`1[T]"), "");//2
        pairs.Add(typeof(UIPolygonInspector), "");//Editor
        pairs.Add(typeof(CustomAssetHolder.HolderData), "");//2
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.DeflateManager+Config"), "");//3
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.ZlibException"), "");//2
        pairs.Add(assembly.GetType("BestHTTP.Decompression.Zlib.SharedUtils"), "");//2
        pairs.Add(assembly.GetType("BestHTTP.KeepAliveHeader"), "");//2
        pairs.Add(typeof(LuaInterface.MonoPInvokeCallbackAttribute), "");//2
        pairs.Add(typeof(LuaInterface.NoToLuaAttribute), "");//2
        pairs.Add(typeof(LuaInterface.UseDefinedAttribute), "");//2
        pairs.Add(typeof(LuaInterface.OverrideDefinedAttribute), "");//2
        pairs.Add(typeof(LuaInterface.LuaByteBufferAttribute), "");//2
        pairs.Add(typeof(LuaInterface.LuaRenameAttribute), "");//2
        pairs.Add(typeof(LuaInterface.LuaIndexes), "");//2
        pairs.Add(typeof(LuaInterface.LuaRIDX), "");//2          
        pairs.Add(typeof(LuaInterface.GCRef), "");//2
        //pairs.Add(Type.GetType("LuaInterface.LuaOut`1[T]"), "");//2
        pairs.Add(typeof(LuaInterface.NullObject), "");//2
        pairs.Add(typeof(LuaInterface.LuaDelegate), "");//2
        pairs.Add(typeof(LuaInterface.TouchBits), "");//2
        pairs.Add(typeof(LuaInterface.RaycastBits), "");//2
        pairs.Add(typeof(LuaInterface.EventObject), "");//2
        pairs.Add(assembly.GetType("LuaInterface.LuaObjectPool+PoolNode"), "");//2   
        specialTypePairs = pairs;
    }
    protected List<Type> typeBlackList = new List<Type>();
    protected List<string> methodBlackList = new List<string>();
    private void initBlackList()
    {
        typeBlackList.Add(typeof(LuaCoroutine));//里面私有方法不好改
        methodBlackList.AddRange(new string[]
        {
            "Awake",
            "Start",
            "Update",
            "LateUpdate",
            "FixedUpdate",
            "Reset",
        });
    }

    List<fieldRenameData> dataList = new List<fieldRenameData>();
    private void AddData(Type _type, string _path, bool _add)
    {
        fieldRenameData data = new fieldRenameData();
        data.type = _type;
        data.path = _path;
        data.isAdd = _add;
        dataList.Add(data);
    }

    private struct fieldRenameData
    {
        public Type type;
        public string path;
        public bool isAdd;
    }

    private float lastRenameTime = 0f;
    private float currentTime = 0f;
    bool startRename = false;
    private void Update()
    {
        if (startRename)
        {
            currentTime += Time.deltaTime;
            if (currentTime - lastRenameTime > 1.0f)
            {
                if (dataList.Count > 0)
                {
                    fieldRenameData data = dataList[0];
                    RenameForType(data.type, data.path, data.isAdd);
                    dataList.RemoveAt(0);
                }
                else
                {
                    startRename = false;
                    AssetDatabase.Refresh();
                    Debug.Log("cost time " + currentTime);
                }
            }
        }
    }
    #endregion 修改C#中私有变量和私有函数名

    #region 随机生成文本文件
    protected string endWithText = "file is end";
    protected string fileFolder = "Assets/Plugins/iOS/";
    protected string folderName = string.Empty;
    private void CreateTextFile()
    {
        folderName = DataPath + fileFolder;
        int fileNumber = (int)(UnityEngine.Random.value * 100) + 100;//随机100~200个文件
        string fileText = string.Empty;
        string fileName = string.Empty;
        for (int i = 0; i < fileNumber; i++)
        {
            int textLen = (int)(UnityEngine.Random.value * 150) + 50;//随机长度50~200
            fileText = GetRandomString(textLen) + endWithText;
            fileName = GetRandomString((i+1)%10 + 1) + ".txt";
            File.WriteAllText(folderName + fileName, fileText, Encoding.UTF8);
        }
        AssetDatabase.Refresh();
    }

    private void DeleteTextFile()
    {
        DirectoryInfo directory = new DirectoryInfo(DataPath+fileFolder);
        FileInfo[] files = directory.GetFiles("*.txt",SearchOption.TopDirectoryOnly);
        foreach (var item in files)
        {
            item.Delete();
        }
        AssetDatabase.Refresh();
    }
    string custom = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_";
    private string GetRandomString(int length)
    {
        byte[] b = new byte[4];
        new System.Security.Cryptography.RNGCryptoServiceProvider().GetBytes(b);
        System.Random r = new System.Random(BitConverter.ToInt32(b, 0));
        StringBuilder builder = new StringBuilder();
        int len = custom.Length;
        for (int i = 0; i < length; i++)
        {
            builder.Append(custom[r.Next(0,len)]);
        }
        return builder.ToString();
    } 
    #endregion 随机生成文本文件
}


