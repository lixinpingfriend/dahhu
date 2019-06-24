using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using UnityEngine;
using MyLitJson;
using ABEditor;


#if UNITY_EDITOR
using UnityEditor;
#endif
using XmlEditor;
using Debug = UnityEngine.Debug;
using Object = UnityEngine.Object;


/// <summary> 资源版本号基类 </summary>
public class AssetDataInfo {

    public enum PathType {
        /// <summary> 应用工程目录 </summary>
        AppResources = 1,
        /// <summary> 持久化目录 </summary>
        PersistentData = 2,
        /// <summary> 只读目录 </summary>
        StreamingAssets = 3,
        /// <summary> 远程 </summary>
        Remote = 4,
    }

    /// <summary> 版本号 </summary>
    public int version;
    /// <summary> MD5码 </summary>
    public string recordMd5;
    /// <summary> 资源相对路径 </summary>
    public string relativePath;
    /// <summary> 资源所在包 </summary>
    public string package;
    public int size;                //资源大小(字节数)
    /// <summary> 资源唯一hashCode（由Unity生成） </summary>
    public string hashCode = string.Empty;

    public int pathType;

    public AssetDataInfo() { }
    public AssetDataInfo(string relativePath, int ver, string recordMd5, int size) {
        Init(relativePath, ver, recordMd5, size);
    }

    protected void Init(string relativePath, int ver, string md5, int size) {
        this.relativePath = relativePath;
        this.version = ver;
        this.size = size;
    }
}

//上传
[Serializable]
public class single_package_update_data
{
    public string packageName;
	public int version;
    public bool isIncrementalUpdate;
    public string[] incrementalFiles;
	public 	string[] wholeFiles;
 }


//上传
[Serializable]
public class FileUpdateRet
{
	public bool success;
    public string resultCode;
	public 	FileUpdateMap map;
 }
[Serializable]
public class FileUpdateMap
{
	public FileUpdateInfo[] files;
}

[Serializable]
public class GetIpRetData
{
	public string ret;
	public string success;
	public string data;
}

[Serializable]
public class FileUpdateInfo
{
	public string fileName;
	public string filePath;
	public bool isUpload;
	public int size;
}

public class EditorAssetBundleVersion
{
    public enum HeadState
    {
        Nomal, Edit,None,
    }
    private string mNowTime;

    public Vector2 scrollPosition;

    //主版本
    private string[] mOriginalVersions;
	public string[] OriginalVersions { get { return mOriginalVersions;} }

	//独立版本下的迭代版本
	private string[] mIterativeVersions;

    public static int mSelectIndexOriginalVersion = 0;


    private int mSelectIndexIterativeVersion = 0;

    private List<bool> selectList = new List<bool>();

    private EditorGameBuildConfigurations mEditorGameBuildConfigurations;


    public bool assetVersionUploadServerPushMsgToDingDingRobot;
    

    private string lastPackageName = "0";

    private bool isInitFinish = false;

    public Action<string, string> versionUploadFileToServerSuccessCallback;

    public EditorAssetBundleVersion(EditorGameBuildConfigurations editorGameBuildConfigurations) {
        GetOriginalVersion();       //获取独立版本
        if (mSelectIndexOriginalVersion < mOriginalVersions.Length) {
            GetIterativeVersion(mOriginalVersions[mSelectIndexOriginalVersion]);    //获取子版本
        }

        mEditorGameBuildConfigurations = editorGameBuildConfigurations;
        editIndex = mSelectIndexOriginalVersion;
    }

    public void OnGUI() {
        EditorGUILayout.BeginVertical();
        if (mOriginalVersions == null) {
            return;
        }
 

        GUILayout.BeginArea(new Rect(10, 10, 800, 1500));
        GUILayout.Label("主版本");
        scrollPosition = GUILayout.BeginScrollView(scrollPosition, GUILayout.Width(480), GUILayout.Height(780));
        EditorGUILayout.BeginHorizontal();
        GUI.color = Color.cyan;
        EditorGUILayout.BeginVertical(GUILayout.Width(140));

        // 编辑器修改 原编辑器代码 start
        // mSelectIndexOriginalVersion = GUILayout.SelectionGrid(mSelectIndexOriginalVersion, mOriginalVersions, 1, GUILayout.Width(120));
        // if (GUI.changed) {
        //     mSelectIndexIterativeVersion = 0;
        //     GetIterativeVersion(mOriginalVersions[mSelectIndexOriginalVersion]);
        // }
        // 原编辑器代码 end
        HeadState state = HeadState.Nomal;
        for(int i = 0; i < mOriginalVersions.Length; i++)
        {
            if(editIndex == i)
                state = HeadState.Edit;
            else
                state = HeadState.Nomal;
            if(DrawItemHeader(mOriginalVersions[i],ref state,i))
            {
                mSelectIndexOriginalVersion = i;
                ABVersionTools.originalVersion = mOriginalVersions[mSelectIndexOriginalVersion];
                if(editIndex != i)
                {
                    mSelectIndexIterativeVersion = 0;
                    GetIterativeVersion(mOriginalVersions[mSelectIndexOriginalVersion]);
                }
                switch(state)
                {
                    case HeadState.Nomal:
                        editIndex = i;
                        break;
                    default:
                        editIndex = i;
                        if(i < mOriginalVersions.Length)
                            DrawVersionItem();
                        break;

                }
            }
        }
        EditorGUILayout.EndVertical();

        EditorGUILayout.BeginVertical();

        if(mIterativeVersions != null && mSelectIndexIterativeVersion < mIterativeVersions.Length && mSelectIndexOriginalVersion < mOriginalVersions.Length)
        {
            GUI.color = Color.white;
            ABVersionData data = ABVersionTools.GetVersionData(mIterativeVersions[mSelectIndexIterativeVersion]);
            if(data != null)
            {
                EditorGUILayout.BeginHorizontal("TextArea",GUILayout.MinHeight(50),GUILayout.Width(330));
                EditorGUILayout.BeginVertical();

                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("迭代包版本:",GUILayout.Width(100));
                GUI.color = Color.cyan;
                EditorGUILayout.LabelField(data.name,GUILayout.Width(100));
                GUI.color = Color.white;
                EditorGUILayout.EndHorizontal();



                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("打包标记:",GUILayout.Width(100));
                GUI.color = Color.yellow;
                EditorGUILayout.LabelField(data.flagMode,GUILayout.Width(100));
                GUI.color = Color.white;
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.LabelField("上个版本:",GUILayout.Width(100));
                GUI.color = Color.cyan;
                EditorGUILayout.LabelField(data.lastVersion,GUILayout.Width(100));
                GUI.color = Color.white;

                if(data.name != "Original")
                if(GUILayout.Button("转到", GUILayout.Width(100)))
                {
                    int newIndex = Array.IndexOf(mIterativeVersions,data.lastVersion);
                    Debug.Log("转到index = " + newIndex);
                    if(newIndex == -1)
                        EditorUtility.DisplayDialog("警告", "该版本或已删除", "确定");
                    else
                    {
                        if(newIndex != mSelectIndexIterativeVersion)
                        {
                            selectList[mSelectIndexIterativeVersion] = false;
                            selectList[newIndex] = true;
                        }
                        mSelectIndexIterativeVersion = newIndex;
                        ABVersionTools.Refresh();
                    }
                }
                EditorGUILayout.EndHorizontal();

                EditorGUILayout.EndVertical();
                EditorGUILayout.EndHorizontal();

                for(int i = 0; i < data.pakages.Count;i++)
                {
                    ABPackageInfo package = data.pakages[i];
                    EditorGUILayout.BeginHorizontal("TextArea",GUILayout.MinHeight(50),GUILayout.Width(330));
                    EditorGUILayout.BeginVertical();

                    EditorGUILayout.BeginHorizontal();
                    {
                        EditorGUILayout.LabelField("补丁包:",GUILayout.Width(100));
                        GUI.color = Color.yellow;
                        EditorGUILayout.LabelField(package.name,GUILayout.Width(100));
                        GUI.color = Color.white;
                        if(package.sizeIncremental == "N/A")
                        {
                            GUI.color = Color.gray;
                            EditorGUILayout.LabelField("此次未更新",GUILayout.Width(100));
                            GUI.color = Color.white;
                        }
                    }
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    {
                        EditorGUILayout.LabelField("依赖包:",GUILayout.Width(100));
                        // GUI.color = Color.red;
                        EditorGUILayout.LabelField(package.dependPackages);
                        GUI.color = Color.white;
                    }
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    {
                        EditorGUILayout.LabelField("迭代包大小:",GUILayout.Width(100));
                        GUI.color = Color.cyan;
                        EditorGUILayout.LabelField(package.sizeIncremental == "N/A" || package.sizeIncremental.Contains("M")  ? package.sizeIncremental : String.Format( "{0:N2}{1} ",   (int.Parse(package.sizeIncremental)/1024f)/1024f, "M"),GUILayout.Width(100));
                        GUI.color = Color.white;
                    }
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    {
                        EditorGUILayout.LabelField("整更包大小:",GUILayout.Width(100));
                        GUI.color = Color.cyan;
                        EditorGUILayout.LabelField(package.sizeWhole == "N/A" || package.sizeWhole.Contains("M") ? package.sizeWhole : String.Format( "{0:N2}{1} ",   (int.Parse(package.sizeWhole)/1024f)/1024f, "M"),GUILayout.Width(100));
                        GUI.color = Color.white;
                    }
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.BeginHorizontal();
                    {
                        EditorGUILayout.LabelField("上次更新版本:",GUILayout.Width(100));
                        GUI.color = Color.cyan;
                        EditorGUILayout.LabelField(package.lastVersion,GUILayout.Width(100));
                        GUI.color = Color.white;

                        if(GUILayout.Button("转到", GUILayout.Width(50)))
                        {
                            int newIndex = Array.IndexOf(mIterativeVersions,package.lastVersion);
                            Debug.Log("转到index = " + newIndex);
                            if(newIndex == -1)
                                EditorUtility.DisplayDialog("警告", "该版本或已删除", "确定");
                            else
                            {
                                if(newIndex != mSelectIndexIterativeVersion)
                                {
                                    selectList[mSelectIndexIterativeVersion] = false;
                                    selectList[newIndex] = true;
                                }
                                mSelectIndexIterativeVersion = newIndex;
                                ABVersionTools.Refresh();
                            }
                        }

                        if(package.sizeIncremental != "N/A")
                        if(GUILayout.Button("查看",GUILayout.Width(50)))
                        {
                            string directoryPath = string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[mSelectIndexOriginalVersion], mIterativeVersions[mSelectIndexIterativeVersion]);
                            EditorUtility.RevealInFinder(directoryPath);
                        }
                    }
                    EditorGUILayout.EndHorizontal();

                    EditorGUILayout.EndVertical();
                    EditorGUILayout.EndHorizontal();
                }
            }
        }

        GUI.color = Color.white;
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
        GUILayout.EndScrollView();
        GUILayout.EndArea();

        GUILayout.Space(500);

        GUILayout.BeginHorizontal();

        GUILayout.EndHorizontal();
        GUILayout.EndVertical();
    }

    void DrawVersionItem()
    {
        EditorGUILayout.BeginVertical("TextArea",GUILayout.Width(110),GUILayout.MinHeight(50));
        {
            GUI.changed = false;
            ABVersionTools.SetChange();
            if (mIterativeVersions != null && mSelectIndexIterativeVersion < mIterativeVersions.Length) {
                for(int i = 0; i < mIterativeVersions.Length; i++)
                {
                    GUILayout.Space(10);
                    EditorGUILayout.BeginHorizontal();
                        //EditorGUILayout.LabelField("hello",GUILayout.Width(100));
                        string dicKey = mOriginalVersions[mSelectIndexOriginalVersion] + "/" + mIterativeVersions[i];
                        if(!ABVersionTools.dataPool.ContainsKey(dicKey)) continue;
                        ABVersionData info = ABVersionTools.GetVersionData(mIterativeVersions[i]);
                        if(info != null && info.mark == "CantDel")
                            GUI.color = Color.red;

                        GUILayout.Space(8);
                        if(selectList[i] != GUILayout.Toggle (selectList[i], mIterativeVersions[i], EditorStyles.miniButton,GUILayout.Width(110),GUILayout.Height(25)))
                        {
                            if(mSelectIndexIterativeVersion != i)
                            {
                                selectList[i] = !selectList[i];
                                selectList[mSelectIndexIterativeVersion] = false;
                            }
                            mSelectIndexIterativeVersion = i;
                            ABVersionTools.Refresh();
                        }
                        GUILayout.Space(5);
                        GUI.color = Color.white;
                    EditorGUILayout.EndHorizontal();
                }
            }

            if (GUI.changed) {
                if (Event.current.button == 1) {
                    ABVersionTools.loadPath = mOriginalVersions[mSelectIndexOriginalVersion] + "/" + mIterativeVersions[mSelectIndexIterativeVersion];
                    ABVersionTools.originalVersion = mOriginalVersions[mSelectIndexOriginalVersion];
                   // Debug.LogError("mOriginalVersions[mSelectIndexOriginalVersion] = " + mOriginalVersions[mSelectIndexOriginalVersion]);
                   // Debug.LogError("mIterativeVersions[i] = " + mIterativeVersions[mSelectIndexIterativeVersion]);

                    string markStr = ABVersionTools.data.mark == "CantDel" ? "解除标记" : "标记";
                    GenericMenu menu = new GenericMenu();
                    menu.AddItem(new GUIContent("显示目录"), false, () => {
                        string directoryPath = string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[mSelectIndexOriginalVersion], mIterativeVersions[mSelectIndexIterativeVersion]);
                        EditorUtility.RevealInFinder(directoryPath);
                    });

                    menu.AddItem(new GUIContent("上传资源"), false, () => UploadFileToServer(true));
                    menu.AddItem(new GUIContent("更新资源内容"), false, () => UploadFileToServer(false));
                    if ("Original" != mIterativeVersions[mSelectIndexIterativeVersion])
                    {
                        menu.AddItem(new GUIContent(markStr),false,()=>{
                            ABVersionTools.SetCheckType(ABVersionTools.data.mark == "CantDel" ? "None" : "CantDel");
                            ABVersionTools.SaveVersionData();
                        });
                        menu.AddItem(new GUIContent("删除版本"), false, () => {
                            string directoryPath = string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[mSelectIndexOriginalVersion], mIterativeVersions[mSelectIndexIterativeVersion]);
                            // Debug.Log(directoryPath);
                            if ("Original" == mIterativeVersions[mSelectIndexIterativeVersion]) {
                                EditorUtility.DisplayDialog("警告", "初始版本不能删除", "确定");
                                return;
                            }
                            if(ABVersionTools.data.mark == "CantDel"){
                                EditorUtility.DisplayDialog("警告", "此补丁已标记不可删除！", "确定");
                                return;
                            }

                            if (EditorUtility.DisplayDialog("删除资源", string.Format("你确定删除此补丁！{0}", mIterativeVersions[mSelectIndexIterativeVersion]), "确定", "取消")) {
                                Debug.Log("删除: " + directoryPath);
                                ABVersionTools.Dispose(); //需要释放掉编辑器读取的txt数据，否则无法删除
                                if(FileUtil.DeleteFileOrDirectory(directoryPath))
                                {
                                    GetIterativeVersion(mOriginalVersions[mSelectIndexOriginalVersion]);
                                }
                            }
                        });
                    }
                    else
                    {
                        menu.AddItem(new GUIContent("引入工程"), false, () => CopyAssetBundleToStreamAssets());
                    }
					menu.AddItem(new GUIContent("上传必要文件"), false, UploacMainFiles);
					menu.ShowAsContext();
                }
            }

        }
        EditorGUILayout.EndVertical();
    }

    void Archive7Zip(string versionRoot) {
        // Debug.Log(versionRoot);
        lzip.compressDir(versionRoot, 1, versionRoot + ".pkg");
        lzip.compress_File(1, versionRoot + ".pkg", versionRoot + "/../version.txt", true);
        lzip.compress_File(1, versionRoot + ".pkg", versionRoot + "/../asset_bundle_manifest", true);
        if (versionRoot.Contains("whole")) {
            lzip.compress_File(1, versionRoot + ".pkg", versionRoot + "/../AssetDataFullManifest.xml", true);
        }
    }

    //是否需要处理资源
    bool TheAssetBundleNeedProces(string filePath) {
        if (filePath.StartsWith("lua/")) {
            if (!filePath.StartsWith("lua/lua_package")) {
                return true;
            }
            if (filePath.StartsWith("lua/lua_package_public") || filePath.StartsWith("lua/lua_package_henanmj")) {
                return true;
            }

            var packages = GetSelectPackages();
            foreach (var packageName in packages)
            {
                if (filePath.Contains(packageName)) {
                    return true;
                }
            }
            return false;
        }
        if (filePath.StartsWith("public/")) {
            return true;
        }

        foreach (GameBuildPackageResTag tag in Enum.GetValues(typeof(GameBuildPackageResTag))) {
            if ((mEditorGameBuildConfigurations.gameBuildPackageResTag & tag) != 0) {
                if (filePath.Contains((tag).ToString() + "/")) {
                    return true;
                }
            }
        }
        return false;
    }

    List<string> GetSelectPackages()
    {
        List<string> selectedPackages = new List<string>();
        selectedPackages.Add("public");
        // selectedPackages.Add("publictable");
        foreach (GameBuildPackageResTag tag in Enum.GetValues(typeof(GameBuildPackageResTag))) {
            if ((mEditorGameBuildConfigurations.gameBuildPackageResTag & tag) != 0) {
                if (tag != GameBuildPackageResTag.end) {
                    selectedPackages.Add(tag.ToString().ToLower());
                }
            }
        }
        return selectedPackages;
    }

    //获取主版本
    void GetOriginalVersion() {
        Directory.CreateDirectory(DataConfigProject.externalAssetBundleVersionPath);
        mOriginalVersions = Directory.GetDirectories(DataConfigProject.externalAssetBundleVersionPath);
        for (int i = 0; i < mOriginalVersions.Length; i++) {
            mOriginalVersions[i] = mOriginalVersions[i].Replace(DataConfigProject.externalAssetBundleVersionPath, "");
        }
        var listTmp = mOriginalVersions.ToList();
        listTmp.Sort((x, y) => {
            int tempX = 0, tempY = 0;
            if (x.Contains('_')) {
                tempX = int.Parse(x.Split('_')[1]);
            }
            else {
                tempX = int.Parse(x);
            }
            if (y.Contains('_')) {
                tempY = int.Parse(y.Split('_')[1]);
            } else {
                tempY = int.Parse(y);
            }
            return -(tempX - tempY);
        });
        mOriginalVersions = listTmp.ToArray();
    }

    /// <summary> 获取独立版本下的迭代版本 </summary>
    void GetIterativeVersion(string originalVersion) {
        mIterativeVersions = Directory.GetDirectories(DataConfigProject.externalAssetBundleVersionPath + originalVersion + "/");

        List<string> listTmp = new List<string>();
        selectList = new List<bool>();
        for (int i = 0; i < mIterativeVersions.Length; i++) {
            selectList.Add(i == 0);

            ABVersionTools.Refresh();
            if (mIterativeVersions[i].Contains("Original")) {
                ABVersionTools.loadPath = originalVersion + "/Original";
                SetEditorConfig(mIterativeVersions[i],"Original",mIterativeVersions,originalVersion);
                continue;
            }
            var key = mIterativeVersions[i].Replace(DataConfigProject.externalAssetBundleVersionPath + originalVersion + "/", "");
            ABVersionTools.loadPath = originalVersion + "/" + key;
            SetEditorConfig(mIterativeVersions[i],key,mIterativeVersions,originalVersion);
            listTmp.Add(key);
        }
        listTmp.Sort((x, y) => -(int.Parse(x) - int.Parse(y)));
        listTmp.Add("Original");

        mIterativeVersions = listTmp.ToArray();
        //Debug.Log("mIterativeVersions.length = "+ mIterativeVersions.Length);
        //Debug.Log("selectList.length = "+ selectList.Count);
        ABVersionTools.Refresh();
        isInitFinish = true;
        lastPackageName = "0";
    }

	public ABVersionData GetNewestVersion()
	{
		return ABVersionTools.GetVersionData(mIterativeVersions[0]);
	}

	// 设置编辑器中的打包配置
	private void SetEditorConfig(string dir,string key, string[] mIterativeVersions, string originalVersion)
    {
        bool isNeedReDo = false;
        List<string> allpackages = Enum.GetNames(typeof(GameBuildPackageResTag)).ToDynList();
        allpackages.Insert(0, "public");
        // allpackages.Add("publictable");
        // Debug.Log("ABVersionTools.data.pakages.Count = " + ABVersionTools.data.pakages.Count);
        // Debug.Log("allpackages.Count = " + allpackages.Count);
        // if(ABVersionTools.data.pakages.Count > 0)
        //     Debug.Log("ABVersionTools.data.pakages[0].sizeIncremental = " + ABVersionTools.data.pakages[0].sizeIncremental);
        if(key == "Original")
            ABVersionTools.data.pakages = new List<ABPackageInfo>();
        else if(ABVersionTools.data.pakages.Count < allpackages.Count) // 已无老版本 无需兼容 || !(ABVersionTools.data.pakages.Count > 0 && ABVersionTools.data.pakages[0].sizeIncremental.Contains("M")))
            isNeedReDo = true;


        if(ABVersionTools.data.name == key && !isNeedReDo) return;  // 已有配置，不在刷新

        string flagMode = key.Contains("Original") ? "None" : ABVersionTools.isUseHash ? "Hash" : ABVersionTools.isUseMd5 ? "Md5"  : "UnKnow";
        string deleteType = key.Contains("Original") ? CheckType.CantDel.ToString() : "None";
        string lastVesion = key.Contains("Original") ? "None" : "Original";
        ABVersionTools.data.name = key;
        ABVersionTools.data.flagMode = flagMode;
        if(lastVesion != "None")
        {
            for(int k = 0; k < mIterativeVersions.Length; k++)
            {
                string version = mIterativeVersions[k].Replace(DataConfigProject.externalAssetBundleVersionPath + originalVersion + "/", "");
                if(version == "Original" || version == key) continue;
                if(lastVesion == "Original" && int.Parse(version) < int.Parse(key))
                    lastVesion = version;
                else if(lastVesion != "Original" && int.Parse(key) - int.Parse(lastVesion) > 0 && int.Parse(key) - int.Parse(lastVesion) > int.Parse(key) - int.Parse(version))
                {
                    lastVesion = version;
                }
            }
        }
        bool needChange = ABVersionTools.data.lastVersion == "" || ABVersionTools.data.lastVersion == "Original" || ABVersionTools.data.lastVersion == string.Empty;
        ABVersionTools.data.lastVersion = needChange ? lastVesion : ABVersionTools.data.lastVersion;
        ABVersionTools.data.mark = isNeedReDo ? ABVersionTools.data.mark : deleteType;
        //ABVersionTools.data.pakages = new List<ABPackageInfo>();
        if(key == "Original") return;

        foreach(var packageName in allpackages)
        {
            if(packageName == "end") continue;
            string package = packageName;
            if(packageName == "henanmj") package = "public";
            ABPackageInfo info = ABVersionTools.data.pakages.Find(a => a.name == package);

            if(info == null)
            {
                info = new ABPackageInfo();
                ABVersionTools.data.pakages.Add(info);
            }
            else
                continue;

            info.name = package;
            info.dependPackages = getDependPackagesNames(package);
            if(File.Exists(dir + "/" + package + "_incremental.pkg"))
            {
                FileInfo fInfo = new FileInfo(dir + "/" + package + "_incremental.pkg");
                info.sizeIncremental = fInfo.Length.ToString();//String.Format( "{0:N2}{1} ",   (fInfo.Length/1000f)/1000f, "M");
            }




            if(File.Exists(dir + "/" + package + "_whole.pkg"))
            {
                //Debug.Log("whole.pkg");
                FileInfo fInfo = new FileInfo(dir + "/" + package + "_whole.pkg");
                info.sizeWhole = fInfo.Length.ToString();//String.Format( "{0:N2}{1} ",   (fInfo.Length/1000f)/1000f, "M");
            }

            for(int i = 0; i < mIterativeVersions.Length; i++)
            {
                string version = mIterativeVersions[i].Replace(DataConfigProject.externalAssetBundleVersionPath + originalVersion + "/", "");
                if(version != "Original")
                {
                    if(version == key) continue;

                    if(File.Exists(mIterativeVersions[i] + "/" + package + "_incremental.pkg"))
                    {
                        if(info.lastVersion == "Original" && int.Parse(version) < int.Parse(key))
                            info.lastVersion = version;
                        else if(info.lastVersion != "Original" && int.Parse(key) - int.Parse(info.lastVersion) > int.Parse(key) - int.Parse(version))
                        {
                            info.lastVersion = version;
                        }
                    }
                    else  //如果本地没有资源包文件 需要检查所有的配置，看是否真的没有引用
                    {
                        //Debug.Log("0: " + mIterativeVersions[i]);
                        ABVersionData oldData = ABVersionTools.GetVersionData(version);
                        if(oldData != null)
                        {
                            ABPackageInfo oldInfo = oldData.pakages.Find(a => a.name == package);
                            if(oldInfo != null && oldInfo.sizeIncremental != "N/A")
                            {
                                if(info.lastVersion == "Original" && int.Parse(version) < int.Parse(key))
                                    info.lastVersion = version;
                                else if(info.lastVersion != "Original" && int.Parse(key) - int.Parse(info.lastVersion) > int.Parse(key) - int.Parse(version))
                                {
                                    info.lastVersion = version;
                                }
                            }
                        }
                        else
                            Debug.LogError("没有" + mIterativeVersions[i] + "的配置！");

                    }
                }
            }

        }
    }

    /// <summary> 生成独立版本 </summary>
    public void GenerationStandaloneVersion() {
        bool assetBundleFilePathEncrypt = GameConfigProject.instance.assetBundleFilePathEncrypt;
        //复制GameDll

        foreach (var item in Directory.GetDirectories(Application.streamingAssetsPath))
        {
            FileUtil.DeleteFileOrDirectory(item);
        }
#if UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN
        GameConfigProject.instance.assetBundleFilePathEncrypt = false;
#endif
        string assetBundlePath = Application.streamingAssetsPath + "/" + FileUtility.EncryptFilePath(string.Format("{0}/AssetDataBytes/AssetBundle/asset_bundle_manifest", DataConfigProject.platform));
        Directory.CreateDirectory(Path.GetDirectoryName(assetBundlePath));
        FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest", assetBundlePath);

        if (File.Exists(DataConfigProject.externalAssetBundlePathCompression + "AndroidUnCompression")) { //复制AssetBundle的清单文件，并且改名
            FileUtil.DeleteFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest");
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest", DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest");
            FileUtil.DeleteFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest.manifest");
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest.manifest", DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest.manifest");
        }
        Dictionary<string,string> hashDic = new Dictionary<string, string>();
        var assetBundle = AssetBundle.LoadFromFile(string.Format("{0}{1}Compression", DataConfigProject.externalAssetBundlePathCompression, DataConfigProject.platform));
        var manifest = assetBundle.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
        List<string> assetBundlesPath = manifest.GetAllAssetBundles().ToDynList();
        for(int i = 0; i < assetBundlesPath.Count;i++)
        {
            uint crc;
            if (!BuildPipeline.GetCRCForAssetBundle(DataConfigProject.externalAssetBundlePathCompression + assetBundlesPath[i], out crc))
            {
                Debug.LogError("检测CRC失败： " + assetBundlesPath[i] + " " + crc);
                return;
            }
            hashDic[assetBundlesPath[i]] = crc.ToString();
            Debug.LogWarning("key = " + assetBundlesPath[i] + "  value = " + hashDic[assetBundlesPath[i]]);
        }

        assetBundlesPath.Add("asset_bundle_manifest");
        assetBundle.Unload(true);
        {
        }
        {
        }

        string nowTime = DateTime.Now.Year.ToString().Substring(2, 2) + System.DateTime.Now.ToLocalTime().ToString("MMddHHmm");
        XmlEx xml = new XmlEx("<BaseNode></BaseNode>");
        var mainNode = xml.AddXmlNodeEx("Main");
        mainNode.AddAttribute("Version", nowTime);

        string versionRootDirectorPath = DataConfigProject.externalAssetBundleVersionPath + Application.version + "_" + nowTime + "/Original//Sources/";
        Directory.CreateDirectory(versionRootDirectorPath);

        //Resources中的AssetBundleBytes路径
        string appResourcesAssetRootPath = string.Format("{0}/AssetDataBytes/AssetBundle/", DataConfigProject.platform);


        foreach (var item in assetBundlesPath) {
            if (string.IsNullOrEmpty(item)) {
                continue;
            }
            if (!TheAssetBundleNeedProces(item)) {
                continue;
            }
            var nodeFull = xml.AddXmlNodeEx("Data");
            nodeFull.AddAttribute("Path", item);
            byte[] fileBytes = File.ReadAllBytes(DataConfigProject.externalAssetBundlePathCompression + item);
            string md5 = SecurityUtil.GetMd5HashFromBytes(fileBytes);

            string targetFilePath = versionRootDirectorPath + item;

            Directory.CreateDirectory(Path.GetDirectoryName(targetFilePath));   //复制到外部的版本目录
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + item, targetFilePath);
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + item + ".manifest", targetFilePath + ".manifest");

            nodeFull.AddAttribute("PathType", ((int)AssetDataInfo.PathType.AppResources).ToString());
            targetFilePath = Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(appResourcesAssetRootPath + item));
            Debug.Log(targetFilePath);
            Directory.CreateDirectory(Path.GetDirectoryName(targetFilePath));
            FileUtil.DeleteFileOrDirectory(targetFilePath);
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + item, targetFilePath);

            nodeFull.AddAttribute("MD5", md5);
            if(hashDic.ContainsKey(item))
                nodeFull.AddAttribute("HashCode",hashDic[item]);
            else
                nodeFull.AddAttribute("HashCode",string.Empty);
        }

        FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest", versionRootDirectorPath + "/asset_bundle_manifest");
        FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest.manifest", versionRootDirectorPath + "/asset_bundle_manifest.manifest");
        
        xml.SaveToFile(DataConfigProject.externalAssetBundleVersionPath + Application.version + "_" + nowTime + "/Original/Sources/AssetDataFullManifest.xml");
        FileUtility.SaveFile(string.Format("{0}/{1}", Application.streamingAssetsPath, FileUtility.EncryptFilePath(DataConfigProject.platform + "/AssetDataBytes/version.txt")), nowTime);
        string standaloneVersionJson = GetStandaloneVersionJson(nowTime);
        FileUtility.SaveFile(string.Format("{0}/{1}", Application.streamingAssetsPath, FileUtility.EncryptFilePath(DataConfigProject.platform + "/AssetDataBytes/package.txt")), standaloneVersionJson);
        FileUtility.SaveFile(DataConfigProject.externalAssetBundleVersionPath + Application.version + "_" + nowTime + "/Original/version.txt", nowTime);
        FileUtility.SaveFile(DataConfigProject.externalAssetBundleVersionPath + Application.version + "_" + nowTime + "/Original/package.txt", standaloneVersionJson);
        // List<string> packages = GetSelectPackages();
        // foreach(var package in packages)
        // {
        //     FileUtility.SaveFile(appResourcesAssetRootPath + "AssetBundle/" + package + "/version.txt", nowTime);
        // }
        AssetDatabase.Refresh();
        GetOriginalVersion();
        Debug.Log("生成独立版本成功");
        mSelectIndexOriginalVersion = 0;
        ABVersionTools.originalVersion = mOriginalVersions[mSelectIndexOriginalVersion];
        GetIterativeVersion(Application.version + "_" + nowTime );
        GameConfigProject.instance.assetBundleFilePathEncrypt = assetBundleFilePathEncrypt;
    }

    string GetStandaloneVersionJson(string nowTime)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("{");
        sb.Append("\"packages\":[");
        List<string> packages = GetSelectPackages();

        for(int i = 0; i < packages.Count; i ++)
        {
            if(packages[i] == "henanmj" || packages[i] == "public") continue;
            sb.Append("{");
            sb.Append("\"package\":" + "\"" + packages[i] + "\",");
            sb.Append("\"incrementalFileSize\":\"" + 0 + "\",");
            sb.Append("\"wholeFileSize\":\"" + 0 + "\",");
            sb.Append("\"topVersion\":\"" + nowTime +"\",");
            sb.Append("\"lastVersion\":\"" + nowTime + "\"");
            sb.Append("},");
        }
        if(sb.ToString().Contains(","))
            sb.Remove(sb.Length - 1,1);
        sb.Append("]}");
        return sb.ToString();
    }

    //迭代版本
    public List<string> GenerationIterativeVersion() {
        return GenerationIterativeVersion(mSelectIndexOriginalVersion);
    }

    //迭代版本 index:选取的大版本
    List<string> GenerationIterativeVersion(int index) {
        mNowTime = DateTime.Now.Year.ToString().Substring(2, 2) + System.DateTime.Now.ToLocalTime().ToString("MMddHHmm"); //产生详细的Xml信息

        Dictionary<string,string> hashDic = new Dictionary<string, string>();

        var assetBundle = AssetBundle.LoadFromFile(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest");
        var manifest = assetBundle.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
        //manifest.GetAssetBundleHash()
        var assetBundlesPath = manifest.GetAllAssetBundles();
        for(int i = 0; i < assetBundlesPath.Length;i++)
        {
            uint crc;
            if (!BuildPipeline.GetCRCForAssetBundle(DataConfigProject.externalAssetBundlePathCompression + assetBundlesPath[i], out crc))
            {
                Debug.LogError("检测CRC失败： " + assetBundlesPath[i] + " " + crc);
                return null;
            }
            hashDic[assetBundlesPath[i]] = crc.ToString();
            // Debug.LogWarning("key = " + assetBundlesPath[i] + "  value = " + hashDic[assetBundlesPath[i]]);
        }
        assetBundle.Unload(true);

        //获取AssetBundle打包出来的当前生成版本信息
        Dictionary<string, AssetDataInfo> currentAssetDataInfos;
        //获取上一个版本的完事版本信息（包括AppResources与）
        Dictionary<string, AssetDataInfo> originalAssetDataInfos;

        GetAssetManifestInfoFromAssetBundleManifest(DataConfigProject.externalAssetBundlePathCompression, assetBundlesPath, hashDic,out currentAssetDataInfos);
        GetAssetManifestInfoFromAssetDataFullXml(string.Format("{0}{1}/Original/Sources/AssetDataFullManifest.xml", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index]), out originalAssetDataInfos);
        List<AssetDataInfo> newFile = new List<AssetDataInfo>();

        foreach (var element in currentAssetDataInfos) {
            if (string.IsNullOrEmpty(element.Value.relativePath)) {
                continue;
            }
            if (!TheAssetBundleNeedProces(element.Value.relativePath)) {
                continue;
            }

            AssetDataInfo dataInfo;
            if (originalAssetDataInfos.TryGetValue(element.Key, out dataInfo)) {
                if(ABVersionTools.isUseHash)
                {
                    if (dataInfo.hashCode != element.Value.hashCode || dataInfo.hashCode == string.Empty) {
                        newFile.Add(element.Value); //需要更新的文件
                    }
                }

                if(ABVersionTools.isUseMd5)
                {
                    if (dataInfo.recordMd5 != element.Value.recordMd5) {
                        newFile.Add(element.Value); //需要更新的文件
                    }
                }
            } else {
                newFile.Add(element.Value); //如果在原来的文件中没找到
            }
        }

        XmlEx xmlFull = new XmlEx("<BaseNode></BaseNode>");

        if (newFile.Count > 0) {
            // newFile.ForEach(x => Debug.Log("新增资源(与最初的原始版本比较)：" + x.relativePath));

            var fullNode = xmlFull.AddXmlNodeEx("Main");
            fullNode.AddAttribute("Version", mNowTime);
            foreach (var element in originalAssetDataInfos) {
                //最近的完整版本信息
                bool ingore = newFile.FindIndex(y => y.relativePath == element.Value.relativePath) >= 0; //新增的应用过渡掉
                if (ingore) {
                    continue;
                }

                XMLNodeEx node;
                node = xmlFull.AddXmlNodeEx("Data");
                node.AddAttribute("Path", element.Value.relativePath);
                node.AddAttribute("PathType", element.Value.pathType.ToString());
                node.AddAttribute("MD5", element.Value.recordMd5);
                node.AddAttribute("HashCode",element.Value.hashCode);
                if (element.Value.pathType == (int) AssetDataInfo.PathType.AppResources) {
                    //打包进应用的资源过渡掉
                    continue;
                }
            }
            
//            AssetBundleCRCScriptableObject nameInfoObj = ScriptableObject.CreateInstance<AssetBundleCRCScriptableObject>();
//            nameInfoObj.version = int.Parse(mNowTime);
//            nameInfoObj.name = "AssetBundleManifestScriptableObject";

            foreach (var fileName in newFile) {
                //添加或者需要更新文件
                var node = xmlFull.AddXmlNodeEx("Data"); //详细版本信息
                node.AddAttribute("Path", fileName.relativePath);
                node.AddAttribute("PathType", ((int) AssetDataInfo.PathType.PersistentData).ToString());
                byte[] fileBytes = File.ReadAllBytes(DataConfigProject.externalAssetBundlePathCompression + fileName.relativePath);
                string md5 = SecurityUtil.GetMd5HashFromBytes(fileBytes);
                node.AddAttribute("MD5", md5);  //使用的是示压缩的MD5码
                node.AddAttribute("HashCode", fileName.hashCode);
//                nameInfoObj.crcData.Add(fileName.relativePath, uint.Parse(fileName.hashCode));
            }
//            AssetDatabase.CreateAsset(nameInfoObj, "Assets/asset_bundle_crc.asset");
//            AssetDatabase.Refresh();

            string tragetDirectory = string.Format("{0}{1}/{2}", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime);
            Directory.CreateDirectory(tragetDirectory);
            xmlFull.SaveToFile(tragetDirectory + "/AssetDataFullManifest.xml");
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest", tragetDirectory + "/asset_bundle_manifest");
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest.manifest", tragetDirectory + "/asset_bundle_manifest.manifest");
            xmlFull.End();
            Debug.Log("迭代版本处理完成！");
        } else {
            Debug.Log("无迭代版本需求！");
            return null;

        }

        // mark 一下 后续需要按标记版本迭代 在此修改
        string lastAssetDataDirectory = mOriginalVersions[index] + "/Original/Sources";
        int lastTimeDirectory = 0;
        // ABVerSionInfo lastInfo = ABVersionTools.GetVersionInfo("Original", ABVersionTools.dataPool[mOriginalVersions[index] + "/Original"]);
        //要获取目录  changed by Jyz 2017/08/18
        foreach (var element in Directory.GetDirectories(DataConfigProject.externalAssetBundleVersionPath + mOriginalVersions[index])) {
            string directoryName = element.Replace(DataConfigProject.externalAssetBundleVersionPath + mOriginalVersions[index], "");
            directoryName = Path.GetFileNameWithoutExtension(element);
            if (directoryName == "Original" || directoryName == mNowTime) {
                continue;
            }
            lastTimeDirectory = int.Parse(directoryName) > lastTimeDirectory ? int.Parse(directoryName) : lastTimeDirectory;
        }


        if (lastTimeDirectory > 0) {
            lastAssetDataDirectory = mOriginalVersions[index] + "/" + lastTimeDirectory;
        }

        Debug.Log("迭代版本，上一个版本： "+ lastAssetDataDirectory);

        Dictionary<string, AssetDataInfo> lastAssetDataInfos;
        //获取上一次迭代版本
        GetAssetManifestInfoFromAssetDataFullXml(string.Format("{0}{1}/AssetDataFullManifest.xml", DataConfigProject.externalAssetBundleVersionPath, lastAssetDataDirectory), out lastAssetDataInfos);
        //上一个版本的信息
        string tragetDirectoryTmp = string.Format("{0}{1}/{2}/incremental", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime);
        List<AssetDataInfo> incrementalAssetDataInfos = null;
        if (!SingleIterativeVersionFileProcess(currentAssetDataInfos, lastAssetDataInfos, tragetDirectoryTmp, out incrementalAssetDataInfos)) {    //代表与上一个版本比较不需要更新
            string tragetDirectory = string.Format("{0}{1}/{2}", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime);
            FileUtil.DeleteFileOrDirectory(tragetDirectory);
            Debug.Log("无迭代版本需求！");
            return null;
        }
        List<AssetDataInfo> holeAssetDataInfos;
        tragetDirectoryTmp = string.Format("{0}{1}/{2}/whole", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime);
        SingleIterativeVersionFileProcess(currentAssetDataInfos, originalAssetDataInfos, tragetDirectoryTmp, out holeAssetDataInfos);
        
        //--TODO: 出现过两个怪现象，迭代版本中有新数据，但是整包更新中没有.如a.prefab的hash值为，怀疑是Unity的锅
        foreach (var item in incrementalAssetDataInfos)
        {
            if (!(holeAssetDataInfos.FindIndex(y => y.relativePath == item.relativePath) >= 0))
            {
                string error = "迭代版本中有数据，但是整包补丁中没有，请检测资源的Hash表!\n" + item.relativePath;
                Debug.LogError(error);
            }
        }

        StringBuilder filesNameInfoBuilder = new StringBuilder();
        filesNameInfoBuilder.AppendLine(string.Format(@"{0}|{1}", mNowTime, lastTimeDirectory));
        List<string> fileNameList = new List<string>();

        fileNameList.Add(string.Format("{0}{1}/{2}/incremental.pkg", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime));
        fileNameList.Add(string.Format("{0}{1}/{2}/whole.pkg", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime));

        fileNameList.Add(string.Format("{0}{1}/{2}/version.txt", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime));
        FileUtility.SaveFile(string.Format("{0}{1}/{2}/version.txt", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime), filesNameInfoBuilder.ToString());
        //FileUtility.SaveFile(string.Format("{0}{1}/{2}/package.txt", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime), "");
        //return null;
        List<string> packages = GetSelectPackages();
        foreach(var package in packages)
        {
            if(package == "public" || package == "henanmj") continue;
            string packagePathIn = string.Format("{0}{1}/{2}/incremental/{3}{3}",DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime, package);
            string packagePathWhole = string.Format("{0}{1}/{2}/whole/{3}{3}", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime, package);
            if(!Directory.Exists(packagePathIn) && Directory.Exists(packagePathWhole))
            {
                //如果只有整更包没有迭代包，那么这次更新就不需要这个整更包
                FileUtil.DeleteFileOrDirectory(packagePathWhole);
            }
            if(Directory.Exists(packagePathIn) || Directory.Exists(packagePathWhole))
            {
                string incrementalRootPath = string.Format("{0}{1}/{2}/incremental/{3}{3}/{3}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime, package);
                string wholeRootPath = string.Format("{0}{1}/{2}/whole/{3}{3}/{3}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime, package);
                FileUtility.SaveFile(incrementalRootPath + "version.txt", mNowTime.ToString());
                FileUtility.SaveFile(wholeRootPath + "version.txt", mNowTime.ToString());
                FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest", packagePathIn + "/" + package +"/asset_bundle_manifest");
                FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest", packagePathWhole + "/" + package + "/asset_bundle_manifest");
                string singlePackageUpdateJson = createPackgeUpdateJson(package, int.Parse(mNowTime), true, packagePathIn, packagePathWhole);
                FileUtility.SaveFile(incrementalRootPath + "single_package_update_data.txt", singlePackageUpdateJson);
                singlePackageUpdateJson = createPackgeUpdateJson(package, int.Parse(mNowTime), false, packagePathIn, packagePathWhole);
                FileUtility.SaveFile(wholeRootPath + "single_package_update_data.txt", singlePackageUpdateJson);


                //打包
                Archive7Zip(packagePathIn);
                Archive7Zip(packagePathWhole);
                FileUtil.CopyFileOrDirectory(packagePathIn + ".pkg",string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime) + package + "_incremental.pkg");
                FileUtil.CopyFileOrDirectory(packagePathWhole +  ".pkg",string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime) + package + "_whole.pkg");
                FileUtil.DeleteFileOrDirectory(packagePathIn + ".pkg");
                FileUtil.DeleteFileOrDirectory(packagePathWhole + ".pkg");
                FileUtil.DeleteFileOrDirectory(packagePathIn);   //删除分包文件与文件夹，剩下的全部打包进public
                FileUtil.DeleteFileOrDirectory(packagePathWhole);
            }
        }

        string pubulicPathIn = string.Format("{0}{1}/{2}/incremental", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime);
        string pubulicPathWhole =string.Format("{0}{1}/{2}/whole", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime);
        string[] publicFiles = Directory.GetFiles(pubulicPathIn, "*", SearchOption.AllDirectories);
        if(publicFiles.Length > 0)
        {
            string singlePackageUpdateJson = createPackgeUpdateJson("public", int.Parse(mNowTime), true, pubulicPathIn , pubulicPathWhole);
            FileUtility.SaveFile(pubulicPathIn + "/single_package_update_data.txt", singlePackageUpdateJson);
            singlePackageUpdateJson = createPackgeUpdateJson("public", int.Parse(mNowTime), false, pubulicPathIn, pubulicPathWhole);
            FileUtility.SaveFile(pubulicPathWhole + "/single_package_update_data.txt", singlePackageUpdateJson);
            //打包
            Archive7Zip(pubulicPathIn);
            Archive7Zip(pubulicPathWhole);
            FileUtil.CopyFileOrDirectory(pubulicPathIn + ".pkg",string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime) + "public_incremental.pkg");
            FileUtil.CopyFileOrDirectory(pubulicPathWhole +  ".pkg",string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime) + "public_whole.pkg");
            FileUtil.DeleteFileOrDirectory(pubulicPathIn + ".pkg");
            FileUtil.DeleteFileOrDirectory(pubulicPathWhole  + ".pkg");
        }

        //不需要保留次资源
        FileUtil.DeleteFileOrDirectory(string.Format("{0}{1}/{2}/incremental", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime));
        FileUtil.DeleteFileOrDirectory(string.Format("{0}{1}/{2}/whole", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime));



        //EditorUtility.RevealInFinder(string.Format("{0}{1}/{2}", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime));
        mSelectIndexIterativeVersion = 0;
        lastPackageName = lastTimeDirectory + "";
        Debug.Log("lastPackageName = " + lastPackageName);
        GetIterativeVersion(mOriginalVersions[mSelectIndexOriginalVersion]);
        string packagePath = string.Format("{0}{1}/{2}", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[mSelectIndexOriginalVersion], mIterativeVersions[mSelectIndexIterativeVersion]);
        string uploadJson = GetUploadJson(mSelectIndexOriginalVersion, mSelectIndexIterativeVersion);
        FileUtility.SaveFile(packagePath + "/package.txt", uploadJson);
        return fileNameList;
        //PutFile(string.Format("{0}{1}/{2}/Version.txt", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[index], mNowTime));
    }


    string createPackgeUpdateJson(string package, int version, bool isIncrementalUpdate, string packageIncrementalRootPath, string packageWholeRootPath)
    {
        single_package_update_data singlePackageUpdate = new single_package_update_data();
        singlePackageUpdate.packageName = package;
        singlePackageUpdate.version = version;
        singlePackageUpdate.isIncrementalUpdate = isIncrementalUpdate;
        List<string> files = new List<string>();
        string[] filePaths = Directory.GetFiles(packageIncrementalRootPath, "*", SearchOption.AllDirectories);
        string luas = string.Format("lua{0}", Path.DirectorySeparatorChar);
        for (int i = 0; i < filePaths.Length; i++)
        {
            if (filePaths[i].EndsWith("asset_bundle_manifest") || filePaths[i].EndsWith("version.txt"))
            {
                continue;
            }
            string filePath = filePaths[i].Replace(packageIncrementalRootPath + "/", "");
             filePath = filePath.Replace(packageIncrementalRootPath + "\\", "");
            if (filePath.StartsWith(luas))
            {
                filePath = filePath.Replace(luas, "").Replace(".bytes", "");
            }
            files.Add(filePath);
        }
        singlePackageUpdate.incrementalFiles = files.ToArray();

        files = new List<string>();
        filePaths = Directory.GetFiles(packageWholeRootPath, "*", SearchOption.AllDirectories);
        for (int i = 0; i < filePaths.Length; i++)
        {
            if (filePaths[i].EndsWith("asset_bundle_manifest") || filePaths[i].EndsWith("version.txt"))
            {
                continue;
            }
            string filePath = filePaths[i].Replace(packageWholeRootPath + "/", "");
            filePath = filePath.Replace(packageWholeRootPath + "\\", "");
            if (filePath.StartsWith(luas))
            {
                filePath = filePath.Replace(luas, "").Replace(".bytes", "");
            }
            files.Add(filePath);
        }
        singlePackageUpdate.wholeFiles = files.ToArray();

        return JsonUtility.ToJson(singlePackageUpdate);
    }

    void UploadRecordToServer(string appVersion, int preAssetVersion, string uploadJson, ABPackageInfo publicABPackageInfo)
    {
        ABVersionData newVersion = GetNewestVersion();
        ABVersionTools.SaveBuildData(OriginalVersions[mSelectIndexOriginalVersion], newVersion.name, (int)AutoBuildState.Upload);
        var www1 = new EditorWWW();
		www1.WWW("http://test.dhahqp.sincebest.com:8080/dhahqp/bullfight/api/getIp", (m, n) => {
                GetIpRetData data = JsonUtility.FromJson<GetIpRetData>(m);

                string url = mEditorGameBuildConfigurations.resourcesUploadServerHost + "/admin/app/asset/add?token=a9p7e2Tk5JIc4vXq9SBLeE63Cl0vA5Tq";
                WWWForm wwwForm = new WWWForm();

                wwwForm.AddField("platform", DataConfigProject.platform == "iOS" ? "IPhonePlayer" : DataConfigProject.platform);
                wwwForm.AddField("bundleId", Application.identifier);

                wwwForm.AddField("appVersion", appVersion);
                if (mEditorGameBuildConfigurations.resourcesUploadServerHost.EndsWith(":9029")) {
                    // wwwForm.AddField("ipList", "");
                } else {
                    if (int.Parse(data.ret) == 0 && string.IsNullOrEmpty(data.data)) {
                        wwwForm.AddField("ipList", "113.246.154.86");
                    } else {
                        wwwForm.AddField("ipList", "113.246.154.86," + data.data);
                    }
                }


//                ABEditor.AbUpLoadInfo incremental = msg.infos.Find((a)=>a.fileName == mEditorGameBuildConfigurations.mAppBuildName.ToLower() + "/" + DataConfigProject.platform.ToLower() + "/public/public_incremental_" + mOriginalVersions[curSelectOriginalVersion] + "_" + mIterativeVersions[curSelectIterativeVersion] + ".pkg");
//                ABEditor.AbUpLoadInfo whole = msg.infos.Find((a)=>a.fileName == mEditorGameBuildConfigurations.mAppBuildName.ToLower() + "/" + DataConfigProject.platform.ToLower() + "/public/public_whole_" + mOriginalVersions[curSelectOriginalVersion] + "_" + mIterativeVersions[curSelectIterativeVersion] + ".pkg");

            string incrementalPath = AseetBundleUpload.getCdnUrl() + GameEditorConfig.appBuildName.ToLower() + "/" + DataConfigProject.platform.ToLower() + "/public/public_incremental_" + mOriginalVersions[mSelectIndexOriginalVersion] + "_" +
                                     (publicABPackageInfo.sizeIncremental == "N/A" ? publicABPackageInfo.lastVersion : mIterativeVersions[mSelectIndexIterativeVersion]) + ".pkg";

            string wholePath = AseetBundleUpload.getCdnUrl() + GameEditorConfig.appBuildName.ToLower() + "/" + DataConfigProject.platform.ToLower() + "/public/public_whole_" + mOriginalVersions[mSelectIndexOriginalVersion] + "_" +
                               (publicABPackageInfo.sizeIncremental == "N/A" ? publicABPackageInfo.lastVersion : mIterativeVersions[mSelectIndexIterativeVersion]) + ".pkg";


                wwwForm.AddField("appAssetVersion", mIterativeVersions[mSelectIndexIterativeVersion]);
                wwwForm.AddField("preAssetVersion", preAssetVersion);
                wwwForm.AddField("isForceUpdate", "false");
                wwwForm.AddField("incrementalFilePath", incrementalPath);
                wwwForm.AddField("incrementalFileSize", 0);
                wwwForm.AddField("wholeFilePath", wholePath);
                wwwForm.AddField("wholeFileSize", 0);
                wwwForm.AddField("updateContent", uploadJson);
                wwwForm.AddField("gameName", GameEditorConfig.gameName);


                Debug.Log(url + "?" + System.Text.Encoding.Default.GetString(wwwForm.data));
			var www2 = new EditorWWW();
			www2.WWW(url, wwwForm, (x, y) => {
                    Debug.Log(x);
                    if (x.Contains("success\":true")) {
                        // AssetVersionUploadToServerHint
                        if (versionUploadFileToServerSuccessCallback != null) {
                            versionUploadFileToServerSuccessCallback(mEditorGameBuildConfigurations.assetVersionUploadServerName, appVersion + "_" + mIterativeVersions[mSelectIndexIterativeVersion]);
                        }
  
                        if (!assetVersionUploadServerPushMsgToDingDingRobot)
                        {
                            AseetBundleUpload.Dispose();
                        }                    

                    if (EditorUtility.DisplayDialog("补丁资源上传", "上传成功!\nurl = " + mEditorGameBuildConfigurations.resourcesUploadServerHost , "确定"))
                        {
                        }
                    }
                });

            });
    }



    //上传到服务器
    public void UploadFileToServer(bool uploadFile) {
        mEditorGameBuildConfigurations.OpenAllGameBuildResBools();

        string appVersion = "";
        if (mOriginalVersions[mSelectIndexOriginalVersion].Contains('_')) {
            appVersion = mOriginalVersions[mSelectIndexOriginalVersion].Split('_')[0];
        } else {
            Debug.LogError("版本名字不对，请在路径中加上AppVersion");
            return;
        }

        Debug.Log(mOriginalVersions[mSelectIndexOriginalVersion]);
        string directoryPath = string.Format("{0}{1}/{2}", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[mSelectIndexOriginalVersion], mIterativeVersions[mSelectIndexIterativeVersion]);
        if (directoryPath.Contains("Original")) {
            EditorUtility.DisplayDialog("操作无效", "原始版本不能上传！", "确定");
            return;
        }
        string uploadJson = FileUtility.ReadAllText(directoryPath + "/package.txt");
        // string uploadJson = GetUploadJson(curSelectOriginalVersion, curSelectIterativeVersion);
        // FileUtility.SaveFile(directoryPath + "/package.txt", uploadJson);
        // lzip.compress_File(1, directoryPath + "/public_incremental.pkg", directoryPath + "/package.txt", true);
        // lzip.compress_File(1, directoryPath + "/public_whole.pkg", directoryPath + "/package.txt", true);

        FileStream file = new FileStream(directoryPath + "/version.txt", FileMode.Open);
        StreamReader reader = new StreamReader(file);
        List<KeyValuePair<string, string>> fileList = new List<KeyValuePair<string, string>>();
        fileList.Clear();
        ABVersionData versionData = ABVersionTools.GetVersionData(mIterativeVersions[mSelectIndexIterativeVersion]);
        ABPackageInfo publicABPackageInfo = null;
        foreach(var item in versionData.pakages)
        {
            string package = item.name;
            if (package == "public")
            {
                publicABPackageInfo = item;
            }
            string incrementalName = GameEditorConfig.appBuildName.ToLower() + "/" + DataConfigProject.platform.ToLower() + "/" + package + "/" + package + "_incremental_" + mOriginalVersions[mSelectIndexOriginalVersion] + "_" + mIterativeVersions[mSelectIndexIterativeVersion] + ".pkg";
            string wholeName = GameEditorConfig.appBuildName.ToLower() + "/" + DataConfigProject.platform.ToLower() + "/" + package + "/" + package + "_whole_" + mOriginalVersions[mSelectIndexOriginalVersion] + "_" + mIterativeVersions[mSelectIndexIterativeVersion] + ".pkg";
            if(!File.Exists(directoryPath + "/" + package + "_incremental.pkg"))
                continue;
            fileList.Add(new KeyValuePair<string, string>(incrementalName, directoryPath + "/" + package + "_incremental.pkg"));
            fileList.Add(new KeyValuePair<string, string>(wholeName, directoryPath + "/" + package + "_whole.pkg"));
        }


        int preAssetVersion = 0;
        while (!reader.EndOfStream) {
            string content = reader.ReadLine();
            if (content.Contains("|")) {
                preAssetVersion = int.Parse(content.Split('|')[1]);
            }
        }
        reader.Dispose();

        if (uploadFile)
        {
            AseetBundleUpload.UpLoadFiles(fileList,(isSuccess,msg)=>{
                if(!isSuccess)
                {
                    Debug.Log("资源打包上传失败！");
                    AseetBundleUpload.Dispose();
                    return;
                }

                Debug.Log("打包上传成功！");
				UploadRecordToServer(appVersion, preAssetVersion, uploadJson, publicABPackageInfo);
			});
        }
        else
        {
            UploadRecordToServer(appVersion, preAssetVersion, uploadJson, publicABPackageInfo);
        }

    }

	//上传主要的文件
	void UploacMainFiles()
	{
		if (EditorUtility.DisplayDialog("上传主要文件", string.Format("你确定上传此版本必要文件?\n版本号:{0}", mIterativeVersions[mSelectIndexIterativeVersion]), "确定", "取消"))
		{
			ABVersionTools.CommitMainFiles(mOriginalVersions[mSelectIndexOriginalVersion], mIterativeVersions[mSelectIndexIterativeVersion]);
		}
		
	}


    string GetUploadJson(int curSelectOriginalVersion, int curSelectIterativeVersion)
    {
        ABVersionData data = ABVersionTools.GetVersionData(mIterativeVersions[curSelectIterativeVersion]);

        if(data == null)
        {
            Debug.LogError("未获取到当前迭代包记录数据，请稍后手动上传迭代包！");
            return "";
        }

        StringBuilder sb = new StringBuilder();
        Debug.Log(data.lastVersion + "=============");




        sb.Append("{");
        sb.Append("\"baseUrl\":\"" + GameEditorConfig.ossBaseUrl + GameEditorConfig.appBuildName.ToLower() + "/" + DataConfigProject.platform.ToLower() + "/\",");
        sb.Append("\"baseVersion\":\"" + mOriginalVersions[curSelectOriginalVersion] + "\",");
        sb.Append("\"curVersion\":\"" + mIterativeVersions[curSelectIterativeVersion] + "\"," );
        // sb.Append("\"asset_bundle_manifest_version\":\"" + mIterativeVersions[curSelectIterativeVersion] + "\"," );
        sb.Append("\"packages\":[");

        for(int i = 0; i < data.pakages.Count; i ++)
        {

            ABPackageInfo info = data.pakages[i];
            if(info.name == "henanmj" || info.name == "pubic") continue;
            string package = info.name;
            string topVersion = mIterativeVersions[curSelectIterativeVersion];
            int incrementalSize = 0;
            int wholeSize = 0;
            //1712282327
            string lastVersion = info.lastVersion;

            ABVersionData tempdata = ABVersionTools.GetVersionData(info.lastVersion);


            ABPackageInfo tempInfo = tempdata.pakages.Find(a => a.name == info.name);

            //1712262300
            if(tempInfo != null)
                lastVersion = lastVersion == "Original" ? "0" : lastVersion;
            else
                lastVersion = "0";
            if(info.sizeIncremental == "N/A")   //当前版本
            {
                if(tempInfo != null)
                {
                    topVersion = info.lastVersion;
                    incrementalSize = int.Parse(tempInfo.sizeIncremental);
                    wholeSize = int.Parse(tempInfo.sizeWhole);
                    lastVersion = tempInfo.lastVersion == "Original" ? "0" : tempInfo.lastVersion;
                }
                else
                {
                    topVersion = "Original";
                    // lastVersion = "0";
                }
            }
            else
            {
                incrementalSize = int.Parse(info.sizeIncremental);
                wholeSize = int.Parse(info.sizeWhole);
            }
            topVersion = topVersion == "Original" ? "0" : topVersion ;


            sb.Append("{");
            sb.Append("\"package\":" + "\"" + package + "\",");
            sb.Append("\"incrementalFileSize\":\"" + incrementalSize + "\",");
            sb.Append("\"wholeFileSize\":\"" + wholeSize + "\",");
            sb.Append("\"topVersion\":\"" + topVersion + "\",");
            sb.Append("\"lastVersion\":\"" + lastVersion + "\",");
            sb.Append("\"dependPackages\":\"" + getDependPackagesNames(package) + "\"");
            sb.Append("},");
        }

        sb.Remove(sb.Length-1,1);
        sb.Append("]}");
        Debug.Log("分包下载json:" + sb.ToString());
        return sb.ToString();
    }

    string getDependPackagesNames(string package) {
        if (package == "henanmj") {
            package = "majiang";
        }

        bool showPackage = false;


        var assetBundle = AssetBundle.LoadFromFile(DataConfigProject.externalAssetBundlePathCompression + "asset_bundle_manifest");
        var manifest = assetBundle.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
        assetBundle.Unload(false);
        List<string> dependPackages = new List<string>();
        foreach (var item in manifest.GetAllAssetBundles())
        {
            if (item.Substring(0, item.IndexOf("/")) != package) {
                continue;
            }

            if (item.StartsWith("lua") || item.StartsWith("henanmj/") || item.StartsWith("public/")) {
                continue;
            }

            foreach (var dependAssetBundlePath in manifest.GetAllDependencies(item))
            {
                string packageTmp = dependAssetBundlePath.Substring(0, dependAssetBundlePath.IndexOf("/"));

                if (packageTmp == package || packageTmp.StartsWith("lua") || packageTmp.StartsWith("henanmj") || (packageTmp.StartsWith("public") && !packageTmp.StartsWith("publictable"))) {
                    continue;
                }

                //麻将的回放竟然引用了长牌资源，这是干啥子
                if (package == "majiang" && packageTmp == "changpai" ) {
                    continue;
                }

                if (!dependPackages.Contains(packageTmp)) {
                    if (packageTmp != "publictable") {
                        if (showPackage) {
                            showPackage = true;
                            Debug.LogError("检测package的依赖包：" + package);
                        }
                        Debug.LogError(item + " 依赖 " + dependAssetBundlePath);
                    }
                    dependPackages.Add(packageTmp);
                }
            }
        }

        string packages = "";
        for (int i = 0; i < dependPackages.Count; i++)
        {
            if (i != 0) {
                packages += "|";
            }
            packages += dependPackages[i];
        }

        // if (package == "public") {
        //     return "";
        // }
        // if (package == "publictable") {
        //     return "";
        // }
        // if (package == "majiang") {
        //     return "publictable";
        // }
        return packages;
    }



    //处理文件，如果返回False代表没有需要处理的文字
    bool SingleIterativeVersionFileProcess(Dictionary<string, AssetDataInfo> currentAssetDataInfos, Dictionary<string, AssetDataInfo> lastAssetDataInfos, string targetDirectory, out List<AssetDataInfo> addFiles) {
        List<AssetDataInfo> newFile = new List<AssetDataInfo>();
        foreach (var element in currentAssetDataInfos) {
            if (!TheAssetBundleNeedProces(element.Value.relativePath)) {
                continue;
            }
            AssetDataInfo dataInfo;
            if (lastAssetDataInfos.TryGetValue(element.Key, out dataInfo)) {
                if(ABVersionTools.isUseHash)
                {
                    if (dataInfo.hashCode != element.Value.hashCode) {
                        newFile.Add(element.Value);   //需要更新的文件
                    }
                }

                if(ABVersionTools.isUseMd5)
                {
                    if (dataInfo.recordMd5 != element.Value.recordMd5) {
                        newFile.Add(element.Value);   //需要更新的文件
                    }
                }
            } else {
                newFile.Add(element.Value);       //如果在原来的文件中没找到
            }
        }

        if (newFile.Count == 0)
        {
            addFiles = null;
            return false;
        }

        addFiles = newFile;

        foreach (var fileName in newFile) {     //添加或者需要更新文件
           string outPath = targetDirectory + "/" + fileName.relativePath;
            if(fileName.package != "public") {
                outPath = targetDirectory + "/" + fileName.package + fileName.package + "/" + fileName.relativePath;
            }

            string relativePath = fileName.relativePath;
            bool luaNeedModifOutPath = true;
            if (relativePath.StartsWith("lua/lua_package_")) {
                if (!relativePath.StartsWith("lua/lua_package_")) {
                    luaNeedModifOutPath = false;
                }
                if (relativePath.StartsWith("lua/lua_package_public") || relativePath.StartsWith("lua/lua_package_henanmj")) {
                    luaNeedModifOutPath = false;
                }

                if (luaNeedModifOutPath) {
                    string luaPackageName = relativePath.Replace("lua/lua_package_", "");
                    // Debug.Log(luaPackageName);
                    int index = luaPackageName.IndexOf("_");
                    if (index < 0) {
                        index = luaPackageName.IndexOf(".");
                    }
                    luaPackageName = luaPackageName.Substring(0, index);
                    // Debug.Log(luaPackageName);
                    outPath = targetDirectory + "/" + luaPackageName + luaPackageName + "/" + fileName.relativePath;
                    // Debug.Log(outPath);
                }
            }

            Directory.CreateDirectory(Path.GetDirectoryName(outPath));
            FileUtil.CopyFileOrDirectory(DataConfigProject.externalAssetBundlePathCompression + fileName.relativePath, outPath);
        }
        return true;
    }

    void GetAssetManifestInfoFromAssetBundleManifest(string rootPath, string[] assetsPath, Dictionary<string,string> hashDic, out Dictionary<string, AssetDataInfo> assetDataInfos) {
        assetDataInfos = new Dictionary<string, AssetDataInfo>();
        List<string> assetsPathEx = assetsPath.ToList();
        List<string> packages = Enum.GetNames(typeof(GameBuildPackageResTag)).ToDynList();
        assetsPathEx.Add("asset_bundle_manifest");
        foreach (var path in assetsPathEx) {
            if (string.IsNullOrEmpty(path)) {
                continue;
            }
            byte[] fileBytes = File.ReadAllBytes(rootPath + path);
            var dataInfo = new AssetDataInfo();
            dataInfo.relativePath = path;
            string packageName = GetPackageName(path, packages);
            dataInfo.package = packages.Contains(packageName) ? packageName : "public";
            dataInfo.size = fileBytes.Length;
            dataInfo.recordMd5 = SecurityUtil.GetMd5HashFromBytes(fileBytes);
            if(hashDic.ContainsKey(path))
                dataInfo.hashCode = hashDic[path];
            assetDataInfos.Add(dataInfo.relativePath, dataInfo);
        }
    }

    string GetPackageName(string path, List<string> packages)
    {
        path = path.Replace("\\","/");
        string[] dirs = path.Split('/');
        if(dirs.Length > 0)
        {
            //Debug.Log("package = " + dirs[0]);
            if(packages.Contains(dirs[0]) && dirs[0] != "henanmj")
                return dirs[0];
        }
        return "public";
    }

    void GetAssetManifestInfoFromAssetDataFullXml(string xmlPath, out Dictionary<string, AssetDataInfo> assetDataInfos) {
        assetDataInfos = new Dictionary<string, AssetDataInfo>();

        if (!File.Exists(xmlPath)) {
            Debug.LogError("文件不存在:" + xmlPath);
            return;
        }

        XmlEditor.XmlReaderEx xml = new XmlEditor.XmlReaderEx();
        xml.LoadFromContent(File.ReadAllText(xmlPath));
        while (xml.textReader.Read()) {
            if (xml.textReader.Name == "Data") {
                var xmlHashCode = string.Empty;
                var xmlPackage = string.Empty;
                if(xml.textReader.GetAttribute("HashCode") != null)
                    xmlHashCode = xml["HashCode"];
                if(xml.textReader.GetAttribute("Package") != null)
                    xmlPackage = xml["Package"];
                var info = new AssetDataInfo {
                    relativePath = xml["Path"],
                    recordMd5 = xml["MD5"],
                    pathType = xml["PathType"],
                    hashCode = xmlHashCode,
                    package = xmlPackage,
                };
                assetDataInfos.Add(info.relativePath, info);
            }
        }
        xml.End();
    }

    private  bool isHideHead = true;
    private int editIndex = 0;
    // NGUI 的标签头 因有特殊要求所以单独写个  如无特殊要求请使用 GameEditorTools内的NGUI标签头
    private bool DrawItemHeader(string text,ref HeadState state, int index)
    {
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
        //GUILayout.BeginHorizontal();
        GUI.changed = false;

        bool result;
        //EditorGUILayout.BeginVertical(GUILayout.Width(130));
        if (state == HeadState.Edit)
        {
            result = true;
            isHideHead = GUILayout.Toggle(isHideHead, text, "dragtab", GUILayout.Width(130));
            if(!isHideHead)
            {
                state = HeadState.Nomal;
                editIndex = -1;
                isHideHead = true;
                result = false;
            }
        }
        else
            result = !GUILayout.Toggle(true, text, "dragtab", GUILayout.Width(130));
        //EditorGUILayout.EndVertical();
        GUI.backgroundColor = Color.white;
        //GUILayout.EndHorizontal();

        return result;
    }

    // 从Original版本恢复assetbundle到streamassets
    void CopyAssetBundleToStreamAssets()
    {
        
        string directoryPath = string.Format("{0}{1}/{2}/", DataConfigProject.externalAssetBundleVersionPath, mOriginalVersions[mSelectIndexOriginalVersion], mIterativeVersions[mSelectIndexIterativeVersion]) + "Sources/";
        Debug.Log(directoryPath + "asset_bundle_manifest");
        if(!File.Exists(directoryPath + "asset_bundle_manifest"))
        {
            EditorUtility.DisplayDialog("警告", "没有asset_bundle_manifest!", "确定");
            return;
        }

        string[] dirs = Directory.GetDirectories(Application.streamingAssetsPath);
        for(int i = 0;i < dirs.Length; i++)
        {
            FileUtil.DeleteFileOrDirectory(dirs[i]);
        }
#if UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN
        GameConfigProject.instance.assetBundleFilePathEncrypt = false;
#endif

        string assetBundlePath = string.Format("{0}/{1}", Application.streamingAssetsPath, FileUtility.EncryptFilePath(DataConfigProject.platform + "/AssetDataBytes/AssetBundle"));
        Directory.CreateDirectory(assetBundlePath);

        FileUtil.CopyFileOrDirectory(directoryPath + "asset_bundle_manifest",Application.streamingAssetsPath + "/" + FileUtility.EncryptFilePath(DataConfigProject.platform + "/AssetDataBytes/AssetBundle/asset_bundle_manifest"));

        string[] files = Directory.GetFiles(directoryPath, "*", SearchOption.AllDirectories);
        int len = directoryPath.Length;

        if (directoryPath[len - 1] == '/' || directoryPath[len - 1] == '\\') {
            --len;
        }

        for (int i = 0; i < files.Length; i++) {
            if(files[i].Contains("asset_bundle_manifest") || files[i].Contains("AssetDataFullManifest") || files[i].EndsWith(".manifest")) 
                continue;
            string str = files[i].Remove(0, len);
            //Debug.Log("str = " + str);
            string dest = Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(DataConfigProject.platform + "/AssetDataBytes/AssetBundle" + str));
            string dir = Path.GetDirectoryName(dest);
            if(!Directory.Exists(dir))
                Directory.CreateDirectory(dir);
            File.Copy(files[i], dest, true);
        }

        //FileUtility.EncryptFilePath

        if (File.Exists(directoryPath + "../package.txt"))
        {
            string packageText = File.ReadAllText(directoryPath + "../package.txt");
            FileUtility.SaveFile(Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(DataConfigProject.platform + "/AssetDataBytes/package.txt")), packageText);
        }

        var version = mOriginalVersions[mSelectIndexOriginalVersion];
        FileUtility.SaveFile(Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(DataConfigProject.platform + "/AssetDataBytes/version.txt")), version.Split('_')[1]);
        AssetDatabase.Refresh();
    }


}
