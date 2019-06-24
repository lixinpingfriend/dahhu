

using System;
using UnityEngine;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using UnityEditor.SceneManagement;
using UnityEngine.SceneManagement;
using System.Threading;
using System.Collections;
#if UNITY_EDITOR
using UnityEditor;
#endif
using Debug = UnityEngine.Debug;
using UnityEngine.UI;

public class EditorGameBuildTool : EditorWindow
{
    public static EditorGameBuildTool instance;
    EditorGameBuildConfigurations mEditorGameBuildConfigurations;
    EditorAssetBundleVersion mEditorAssetBundleVersion;

    //ios打包工程路径
    private string mIosPackingProjectPath;

    //是否Build
    private bool mBuild = false;

    //同时生成Apk
    private bool mBuildApp = true;

    private bool mExportProject = false;

    //同时生成AssetBundle
    private bool mBuildAssetBundle = true;

    //是否复制AssetBundle资源到打包工程
    private bool mCopyAssetBundleToPackingProject = true;

    //自动上传到服务器上
    private bool mAutoUploadServer = true;

    private bool mAutoUploadServerAll = false;

    private bool mAutoRunPlayer = false;

    private bool mPushMsgToDingDingRobot = true;

    //上传资源版本是否开启钉钉通知
    public bool mAssetVersionUploadServerPushMsgToDingDingRobot = false;

    private string mAssetVersionUploadServerLog = "";

    private string host1 = "";
    private string host2 = "";

    private int hosInt1 = 1;
    private int hosInt2 = 2;


    //公司的产品研发群
    private string url_dingding =       GameEditorConfig.url_dingding;

    private bool mAppAutoPublishToFir = true; //打包出的App是否自动上传fir
    private bool mAppAutoPublishToBruceXuFir = false; //打包出的App是否自动上传到Bruce.Xu的fir

    //private string m_api_token = "509014074736bd3326893fc301864579";//公司的tokenID
    private string m_api_token
    {
        get
        {
            return GameEditorConfig.firToken; //公司的tokenID
        }
    }

    private string url_Credentials = GameEditorConfig.firUrl; //获取凭证url
    private string url_upload = GameEditorConfig.qiniuUrl; //上传App的url
    private string mFirLog = "修复了一些BUG, 详情见tapd"; //Fir日志
    private string mAPP_SavePath; //app保存路径
    private string m_AppName; //app名字
    private string appshort_url; //app短链接
    private string m_bundleIdentifier;
    private string m_version;
    private string m_bundleVersionCode;

    private string mInputNeedGetRealName = "";

    private Hashtable fir_ht;
    private Dictionary<string, string> uselessMoveRes = new Dictionary<string, string>();

    [MenuItem("Tools/AssetBundles/Version %&v")]
    public static void Init()
    {
        instance = GetWindow<EditorGameBuildTool>("GameBuilder");
        instance.minSize = instance.maxSize = new Vector2(1000, 800);
        instance.Show();
        instance.Focus();
        ABEditor.ABVersionTools.Refresh();
    }

    void OnGUI()
    {
        if (mEditorGameBuildConfigurations == null)
        {
            mEditorGameBuildConfigurations = new EditorGameBuildConfigurations();
        }

        if (mEditorAssetBundleVersion == null)
        {
            mEditorAssetBundleVersion = new EditorAssetBundleVersion(mEditorGameBuildConfigurations);
        }

        GUILayout.Space(20);
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.BeginVertical(GUILayout.Width(500));
        mEditorAssetBundleVersion.OnGUI();
        EditorGUILayout.EndVertical();
        //GUILayout.Space(500);
        EditorGUILayout.BeginVertical();
        EditorGUILayout.BeginHorizontal();
        mEditorGameBuildConfigurations.OnGUI();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        DrawBuild();
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
    }

    void DrawBuild()
    {
        EditorGUILayout.BeginHorizontal();
        GUILayout.Space(10);
        EditorGUILayout.BeginVertical();
        GUILayout.Space(10);

        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.LabelField("打包标志:", GUILayout.Width(80));
        if (EditorGUILayout.ToggleLeft("Md5", ABEditor.ABVersionTools.isUseMd5))
        {
            ABEditor.ABVersionTools.isUseMd5 = true;
            ABEditor.ABVersionTools.isUseHash = false;
        }

        if (EditorGUILayout.ToggleLeft("Hash", ABEditor.ABVersionTools.isUseHash))
        {
            ABEditor.ABVersionTools.isUseMd5 = false;
            ABEditor.ABVersionTools.isUseHash = true;
        }

        EditorGUILayout.EndHorizontal();
        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("独立版本", GUILayout.Width(80), GUILayout.Height(35)))
        {
            AssetDatabase.Refresh();
#if UNITY_ANDROID || UNITY_IOS || UNITY_IPHONE
            GameConfigProject.instance.developmentMode = false;
#endif
            if (!EditorApplication.isCompiling)
            {
                if (mBuildAssetBundle) //是否打包资源
                {
                    if (AssetBundleBuildScript.BuildAssetBundles(true))
                    {
                        mEditorAssetBundleVersion.GenerationStandaloneVersion();
                    }
                    else
                    {
                        EditorUtility.DisplayDialog("提示", "打包错误，停止迭代版本", "确定");
                    }
                }

                if (mBuild)
                {
                    string lastProductName = PlayerSettings.productName;
                    if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.Android)
                    {
                        EditorUserBuildSettings.exportAsGoogleAndroidProject = mExportProject;
                    }
                    else
                    {
                        EditorUserBuildSettings.exportAsGoogleAndroidProject = false;
                        if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneWindows
                            || EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneWindows64)
                        {
                            PlayerSettings.productName = Application.identifier;
                        }
                    }

                    RemoveGameRoot(); //移除GameRoot
                    if (mEditorGameBuildConfigurations.buildAppAutoIncreaseVersion)
                    {
                        PlayerSettings.bundleVersion = AutoIncreaseAppVersion();
                    }

                    mEditorGameBuildConfigurations.SetAndroidKeystore();
                    BeginBuild();
                    mEditorGameBuildConfigurations.ResetKeystore();
                    AddGameRoot();
                    PlayerSettings.productName = lastProductName;
                    return;
                }
            }
            else
            {
                EditorUtility.DisplayDialog("提示", "正在编译不能打包！", "确定");
            }
            
        }

        EditorGUILayout.BeginVertical();
        mBuild = GUILayout.Toggle(mBuild, "Build");
        if (mBuild)
        {
            EditorGUILayout.BeginHorizontal();
            GUILayout.Space(18);
            EditorGUILayout.BeginVertical();
            if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.iOS)
            {
                mExportProject = true;
                mBuildApp = GUILayout.Toggle(mBuildApp, "自动生成ipa");
                mAutoRunPlayer = GUILayout.Toggle(mAutoRunPlayer, "AutoRunPlayer");
                if (mAutoRunPlayer)
                {
                    mBuildApp = false;
                }

                mAutoRunPlayer = !mBuildApp;
            }
            else if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.Android)
            {
                mBuildApp = GUILayout.Toggle(mBuildApp, "生成App");
                if (GUI.changed)
                {
                    mExportProject = !mBuildApp;
                }

                mExportProject = GUILayout.Toggle(mExportProject, "导出工程");
                if (GUI.changed)
                {
                    mBuildApp = !mExportProject;
                }
            }
            else
            {
                mBuildApp = GUILayout.Toggle(mBuildApp, "自动生成App");
                mExportProject = false;
            }


            if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.iOS ||
                EditorUserBuildSettings.activeBuildTarget == BuildTarget.Android)
            {
                mAppAutoPublishToFir = GUILayout.Toggle(mAppAutoPublishToFir, "app自动上传fir");

                if (mAppAutoPublishToFir)
                {
                    if (GUI.changed)
                    {
                        mPushMsgToDingDingRobot = true;
                    }

                    EditorGUILayout.LabelField("Fir日志内容:");
                    mFirLog = EditorGUILayout.TextArea(mFirLog, GUILayout.Height(80), GUILayout.Width(250));
                }
                else
                {
                    mPushMsgToDingDingRobot = false;
                }
            }
            else
            {
                mAppAutoPublishToFir = false;
                mPushMsgToDingDingRobot = false;
            }

            if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.Android)
            {
                mAppAutoPublishToBruceXuFir = GUILayout.Toggle(mAppAutoPublishToBruceXuFir, "app自动上传Bruce.Xu的fir");
            }

            EditorGUILayout.EndVertical();
            EditorGUILayout.EndHorizontal();
        }

        EditorGUILayout.EndVertical();
        EditorGUILayout.BeginVertical();
        mBuildAssetBundle = GUILayout.Toggle(mBuildAssetBundle, "资源重构");
        EditorGUILayout.EndVertical();

        EditorGUILayout.EndHorizontal();
        GUILayout.Space(10);
        EditorGUILayout.BeginHorizontal();
        if (GUILayout.Button("生成补丁", GUILayout.Width(80), GUILayout.Height(35)))
        {
            AssetDatabase.Refresh();
            if (!EditorApplication.isCompiling)
            {
                mEditorAssetBundleVersion.versionUploadFileToServerSuccessCallback = (x, y) =>
                {
                    if (mAssetVersionUploadServerPushMsgToDingDingRobot)
                    {
                        AssetVersionUploadToServerHint(x, y);
                    }
                };
                if (AssetBundleBuildScript.BuildAssetBundles(true))
                {
                    mEditorGameBuildConfigurations.OpenAllGameBuildResBools();
                    if (mEditorAssetBundleVersion.GenerationIterativeVersion() != null)
                    {
                        if (mAutoUploadServer)
                        {
                            if (mAutoUploadServerAll)
                            {
                                string host;
                                if (mEditorGameBuildConfigurations.resourcesIpDatas.TryGetValue(
                                    (GameConfigNet.IPAdress) hosInt1, out host))
                                {
                                    mEditorGameBuildConfigurations.resourcesUploadServerHost = host;
                                }

                                mEditorAssetBundleVersion.UploadFileToServer(true);
                                mEditorAssetBundleVersion.versionUploadFileToServerSuccessCallback = (x, y) =>
                                {
                                    if (mEditorGameBuildConfigurations.resourcesIpDatas.TryGetValue(
                                        (GameConfigNet.IPAdress) hosInt2, out host))
                                    {
                                        mEditorGameBuildConfigurations.resourcesUploadServerHost = host;
                                        mEditorAssetBundleVersion.UploadFileToServer(false);
                                        mEditorAssetBundleVersion.versionUploadFileToServerSuccessCallback = (m, n) =>
                                        {
                                            if (mAssetVersionUploadServerPushMsgToDingDingRobot)
                                            {
                                                AssetVersionUploadToServerHint(x, y);
                                            }
                                        };
                                    }
                                };
                            }
                            else
                            {
                                mEditorAssetBundleVersion.UploadFileToServer(true);
                            }
                        }
                    }

                    mEditorGameBuildConfigurations.ResetGameBuildResBools();
                }
                else
                {
                    Debug.LogError("打包错误，停止迭代版本");
                }
            }
            else
            {
                EditorUtility.DisplayDialog("提示", "正在编译不能打包！", "确定");
            }
        }

        EditorGUILayout.BeginVertical();
        EditorGUILayout.BeginHorizontal();
        EditorGUILayout.BeginVertical(GUILayout.Width(80));
        mAutoUploadServer = GUILayout.Toggle(mAutoUploadServer, "上传资源");
        EditorGUILayout.EndVertical();
        EditorGUILayout.BeginVertical();
        EditorGUILayout.BeginHorizontal(GUILayout.Width(180));
        mAutoUploadServerAll = GUILayout.Toggle(mAutoUploadServerAll, "同时上传正式服测试服");
        EditorGUILayout.EndHorizontal();
        EditorGUILayout.EndVertical();
        EditorGUILayout.BeginVertical(GUILayout.Width(120));
        if (mAutoUploadServerAll)
        {
            if (mEditorGameBuildConfigurations.mConfig.net.ipAdressTypeName.Length < 2)
            {
                hosInt1 = 0;
                hosInt2 = 0;
            }

            EditorGUILayout.BeginHorizontal();
            hosInt1 = EditorGUILayout.Popup(hosInt1, mEditorGameBuildConfigurations.mConfig.net.ipAdressTypeName,
                GUILayout.Width(120)); //.resourcesIpDatas.Keys.ToDynList().ToArray());
            EditorGUILayout.EndHorizontal();

            EditorGUILayout.BeginHorizontal();
            hosInt2 = EditorGUILayout.Popup(hosInt2, mEditorGameBuildConfigurations.mConfig.net.ipAdressTypeName,
                GUILayout.Width(120));
            EditorGUILayout.EndHorizontal();

            if (GUI.changed)
            {
                string host;
                if (mEditorGameBuildConfigurations.resourcesIpDatas.TryGetValue((GameConfigNet.IPAdress) hosInt1,
                    out host))
                {
                    host1 = host;
                }

                if (mEditorGameBuildConfigurations.resourcesIpDatas.TryGetValue((GameConfigNet.IPAdress) hosInt2,
                    out host))
                {
                    host2 = host;
                }

                // Debug.Log("GUI.changed----------------------------");
                // Debug.Log("host1: "+host1);
                // Debug.Log("host2: "+host2);
            }
        }

        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();

        bool last = mAssetVersionUploadServerPushMsgToDingDingRobot;
        mAssetVersionUploadServerPushMsgToDingDingRobot = false;
        mEditorAssetBundleVersion.assetVersionUploadServerPushMsgToDingDingRobot =
            mAssetVersionUploadServerPushMsgToDingDingRobot;
        if (mAssetVersionUploadServerPushMsgToDingDingRobot)
        {
            if (last != mAssetVersionUploadServerPushMsgToDingDingRobot)
            {
                mEditorAssetBundleVersion.versionUploadFileToServerSuccessCallback = (x, y) =>
                {
                    if (mAssetVersionUploadServerPushMsgToDingDingRobot)
                    {
                        AssetVersionUploadToServerHint(x, y);
                    }
                };
            }

            EditorGUILayout.LabelField("补丁内容:");
            mAssetVersionUploadServerLog = EditorGUILayout.TextArea(mAssetVersionUploadServerLog, GUILayout.Height(80),
                GUILayout.Width(250));
        }

        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();


        if (GUILayout.Button("测试", GUILayout.Width(80), GUILayout.Height(20)))
        {
            if (EditorApplication.isCompiling)
            {
                EditorUtility.DisplayDialog("提示", "正在编译不能打包！", "确定");
            }

            var crc  = AssetDatabase.LoadAssetAtPath<AssetBundleCRCScriptableObject>("Assets/asset_bundle_crc.asset");
            Debug.Log(crc.crcData.Count);

//            ReadyDingDingRobot();
            //AutoPublishToFir_Windows();
            // AutoPublishToFir("/Users/dred/Workbench/Apps/CrazyCowBoy(v0.6.10)(2017-0423-1444).apk");
            // AutoBuildIpa("/Users/dred/Workbench/Apps/XcodeProject_BullFight_v1.0.0_2017-0501-0033", "BullFight_v1.0.0_2017-0501-0033", mAppAutoPublishToFir);
            // ProcessStartInfo psi = new ProcessStartInfo();
            // psi.FileName = "/bin/bash";
            // psi.WindowStyle= ProcessWindowStyle.Normal;
            // // psi.FileName = "/usr/local/bin/fir";
            // psi.CreateNoWindow=false;
            // psi.UseShellExecute = false;
            // psi.RedirectStandardOutput = true;
            // string shell = Application.dataPath +"/Editor/open.sh" ;
            // psi.Arguments = shell + " fir publish /Users/dred/Workbench/Apps/CrazyCowBoy_v0.6.9_2017-0422-1810.apk";
            // // psi.Arguments = "fir publish /Users/dred/Workbench/Apps/CrazyCowBoy_v0.6.9_2017-0422-1810.apk";

            // Process p = Process.Start(psi); 
            // Thread.Sleep(300);
            // string strOutput = p.StandardOutput.ReadToEnd(); 
            // p.WaitForExit(); 

            // UnityEngine.Debug.Log(strOutput);

            // foreach (var content in mFirLog.Split('\n')) {
            //     Debug.Log(content);
            // }
            // ReadyDingDingRobot();
        }

        if (GUILayout.Button("开启git列表", GUILayout.Width(80), GUILayout.Height(20)))
        {
            string ignoreText = FileUtility.ReadAllText(EditorGitConfig.gitIgnorePath);
            ignoreText = ignoreText.Replace(EditorGitConfig.closeAbGit, "");
            for (int i = 0; i < EditorGitConfig.openAbGit.Length; i++)
            {
                ignoreText = ignoreText.Replace(EditorGitConfig.openAbGit[i], "");
                ignoreText += EditorGitConfig.openAbGit[i];
            }

            //Debug.Log(ignoreText);
            FileUtility.SaveFile(EditorGitConfig.gitIgnorePath, ignoreText);
            EditorUtility.DisplayDialog("提示", "已开启git上传AB包配置！", "确定");
        }

        if (GUILayout.Button("屏蔽git列表", GUILayout.Width(80), GUILayout.Height(20)))
        {
            string ignoreText = FileUtility.ReadAllText(EditorGitConfig.gitIgnorePath);
            ignoreText = ignoreText.Replace(EditorGitConfig.closeAbGit, "");
            for (int i = 0; i < EditorGitConfig.openAbGit.Length; i++)
            {
                Debug.Log("Is contains = " + ignoreText.Contains(EditorGitConfig.openAbGit[i]));
                ignoreText = ignoreText.Replace(EditorGitConfig.openAbGit[i], "");
            }

            ignoreText += EditorGitConfig.closeAbGit;
            //Debug.Log(ignoreText);
            FileUtility.SaveFile(EditorGitConfig.gitIgnorePath, ignoreText);
            EditorUtility.DisplayDialog("提示", "已关闭git上传AB包配置！", "确定");
        }

        mInputNeedGetRealName =
            EditorGUILayout.TextField(mInputNeedGetRealName, GUILayout.Height(40), GUILayout.Width(100));
        if (!string.IsNullOrEmpty(mInputNeedGetRealName))
        {
            string realName = FileUtility.DecryptFilePath(mInputNeedGetRealName.Replace("Assets/StreamingAssets/", ""));
            Debug.Log(realName);
            mInputNeedGetRealName = "";
            EditorUtility.DisplayDialog("真是路径", realName, "确定");
        }


        EditorGUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
    }

    void OnDestroy()
    {
        if (mEditorGameBuildConfigurations != null)
        {
            mEditorGameBuildConfigurations.ResetKeystore();
        }
    }


    void BeginBuild()
    {
        var scenes = new List<string>();
        EditorBuildSettings.scenes.ForEach(x => scenes.Add(x.path));

        BuildOptions options = BuildOptions.None;

        options |= EditorUserBuildSettings.development ? BuildOptions.Development : BuildOptions.None;
        options |= EditorUserBuildSettings.connectProfiler ? BuildOptions.ConnectWithProfiler : BuildOptions.None;
        options |= EditorUserBuildSettings.allowDebugging ? BuildOptions.AllowDebugging : BuildOptions.None;
        options |= BuildOptions.CompressWithLz4;
        options |= EditorUserBuildSettings.exportAsGoogleAndroidProject
            ? BuildOptions.AcceptExternalModificationsToPlayer
            : BuildOptions.None;
        if (mAutoRunPlayer)
        {
            options |= BuildOptions.AutoRunPlayer;
        }

        if (string.IsNullOrEmpty(mEditorGameBuildConfigurations.appExportPath))
        {
            EditorUtility.DisplayDialog("警告", "请先设置App导出路径", "确定");
            return;
        }

        mEditorGameBuildConfigurations.SetBuildTime();
        string apkFullPath = Path.Combine(mEditorGameBuildConfigurations.appExportPath,
            mEditorGameBuildConfigurations.appbuildName);
        mAPP_SavePath = apkFullPath;
        m_AppName = mEditorGameBuildConfigurations.appbuildName;
        string buildResult = BuildPipeline.BuildPlayer(scenes.ToArray(), apkFullPath,
            EditorUserBuildSettings.activeBuildTarget, options);
        if (string.IsNullOrEmpty(buildResult)) //然后重新生成app
        {
            Debug.Log("App生成成功!");
            EditorUtility.RevealInFinder(apkFullPath);
            if (mBuildApp)
            {
                if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.iOS)
                {
                    AutoBuildIpa(apkFullPath, mEditorGameBuildConfigurations.appbuildName.Replace("XcodeProject_", ""),
                        mAppAutoPublishToFir);
                }
                else if (EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneWindows
                         || EditorUserBuildSettings.activeBuildTarget == BuildTarget.StandaloneWindows64
                         || EditorUserBuildSettings.activeBuildTarget == BuildTarget.Android)
                {
                    if (mAppAutoPublishToFir)
                    {
                        AutoPublishToFir_Windows();
                    }

                    if (mAppAutoPublishToBruceXuFir)
                    {
                        AutoPublishToFir_Windows();
                    }
                    
                }
            }
            if (mExportProject){
                AutoBuildGradleApk(apkFullPath, m_AppName);
            }

        }
    }

    void RemoveGameRoot()
    {
        GameObject gameRoot = GameObject.Find("GameRoot");

        if (gameRoot != null)
        {
            Image image = gameRoot.transform.Find("Game/UIRoot/UIWindowParent/Canvas/TestWindow/Image")
                .GetComponent<Image>();
            if (image.sprite != null)
            {
                // EditorUtility.DisplayDialog("补丁资源上传", "上传成功!\nurl = " + mEditorGameBuildConfigurations.resourcesUploadServerHost , "确定");
            }
            
            DestroyImmediate(gameRoot);
            EditorSceneManager.SaveScene(SceneManager.GetActiveScene());
        }
    }

    void AddGameRoot()
    {
        HelpFunEditor.LoadGameRoot();
        EditorSceneManager.SaveScene(SceneManager.GetActiveScene());
    }

    //自动增Appversion
    private string AutoIncreaseAppVersion()
    {
        var versionText = Application.version.Split('.');
        if (versionText.Length < 3)
        {
            return "0.5.0";
        }

        return string.Format("{0}.{1}.{2}", versionText[0], versionText[1], int.Parse(versionText[2]) + 1);
    }

    public static void CopyLuaFilesToRes()
    {
        string path = Application.dataPath + "/Resources/Lua";
        if (Directory.Exists(path))
        {
            Directory.Delete(path, true);
        }

        string destDir = Application.dataPath + "/Resources" + "/Lua";
        AssetBundleBuildScript.CopyLuaBytesFiles(LuaConst.luaDir, destDir);
        AssetBundleBuildScript.CopyLuaBytesFiles(LuaConst.toluaDir, destDir);
        AssetDatabase.Refresh();
        Debug.Log("Copy lua files over");
    }

    #region  Gradle 工程打包
    //安卓工程打完后通过Gradle自动打APK包 
    private void AutoBuildGradleApk(string apkFullPath, string apkName)
    {       

        string srcFolderPath = apkFullPath + "/" + Application.productName;
        string apkPath = apkFullPath + "/" + apkName;
        //因为出的工程是带中文路径的 Gradle 不能出现中文 所以此处手动修改
        if (System.IO.Directory.Exists(srcFolderPath)){
            System.IO.DirectoryInfo folder = new System.IO.DirectoryInfo(srcFolderPath);
            folder.MoveTo(apkPath);
        }
        string strFilePath = Path.Combine(apkPath + @"/src/main/", "AndroidManifest.xml");
        if (File.Exists(strFilePath )){
            string strContent = File.ReadAllText(strFilePath);
            string newstrContent = strContent.Replace("android:hardwareAccelerated=\"false\"", "android:hardwareAccelerated=\"true\"");
            File.WriteAllText(strFilePath , newstrContent);
        }
        string path = FormatPath(Application.dataPath + @"/Editor/") ;                
        if (Application.platform == RuntimePlatform.OSXEditor){
            RunShell(apkPath);
        }
        else if (Application.platform == RuntimePlatform.WindowsEditor)
        {
            RunBat("gradle_build_apk.bat", apkPath , path);
        }
    }

    private string FormatPath(string path)
		{
			path = path.Replace("/", "\\");
			if (Application.platform == RuntimePlatform.OSXEditor)
				path = path.Replace("\\", "/");
            return path;
		}

    private Process CreateShellExProcess(string cmd, string args, string workingDir = "")
		{
			var pStartInfo = new ProcessStartInfo(cmd);
			pStartInfo.Arguments = args;
			pStartInfo.CreateNoWindow = false;
			pStartInfo.UseShellExecute = true;
			pStartInfo.RedirectStandardError = false;
			pStartInfo.RedirectStandardInput = false;
			pStartInfo.RedirectStandardOutput = false;
			if (!string.IsNullOrEmpty(workingDir))
				pStartInfo.WorkingDirectory = workingDir;
			return Process.Start(pStartInfo);
		}
		
    private void RunBat(string batfile, string args, string workingDir = "")
    {
        var p = CreateShellExProcess(batfile, args, workingDir);
        p.WaitForExit();
        p.Close();
        string strFilePath = FormatPath(args + @"/build/outputs/apk/release/");
        if (Directory.Exists(strFilePath)){
            MoveFile(strFilePath);
        }
    }

    private void RunShell(string  args){
        ProcessStartInfo psi = new ProcessStartInfo();
        psi.FileName = "/bin/bash";
        psi.CreateNoWindow = false;
        psi.UseShellExecute = false;
        psi.RedirectStandardOutput = true;
        string shell = Application.dataPath + "/Editor/gradle_build_apk.sh ";
        psi.Arguments = shell + args;
        Process p = Process.Start(psi);
        string strOutput = p.StandardOutput.ReadToEnd();
        p.WaitForExit();
        string strFilePath = FormatPath(args + @"/build/outputs/apk/release/");
        MoveFile(strFilePath);
        UnityEngine.Debug.Log(strOutput);
    }

    private void MoveFile(string srcFolder)
    {
        string destFolder = mEditorGameBuildConfigurations.appExportPath;
        DirectoryInfo directoryInfo = new DirectoryInfo(srcFolder);
        FileInfo[] files = directoryInfo.GetFiles();
        foreach (FileInfo file in files){
            if (file.Extension == ".apk"){
                string pathStr = Path.Combine(destFolder, Application.productName + ".apk");
                if (!File.Exists(pathStr))
                {
                    FileStream fs = File.Create(pathStr);
                    fs.Close();
                }
                file.CopyTo(pathStr, true);
                Directory.Delete(mEditorGameBuildConfigurations.appExportPath + m_AppName, true);
                string newPathStr = Path.Combine(destFolder, file.Name);
                if (!File.Exists(newPathStr))
                {
                    FileStream fs = File.Create(newPathStr);
                    fs.Close();
                }
                File.Copy(pathStr, newPathStr, true);
                File.Delete(pathStr);
            }
        }
    }

    #endregion
    //是否自动
    private void AutoBuildIpa(string xcodeProjectPath, string ipaName, bool publishToFir)
    {
        ProcessStartInfo psi = new ProcessStartInfo();
        psi.FileName = "/bin/bash";
        psi.CreateNoWindow = false;
        psi.UseShellExecute = false;
        psi.RedirectStandardOutput = true;
        string shell = Application.dataPath + "/Editor/build_ipa_publish_to_fir.sh";
        string arguments = " ";
        string xcodeprojPath = xcodeProjectPath + "/Unity-iPhone.xcodeproj" + " "; //$1
        string ipaRootPath = mEditorGameBuildConfigurations.appExportPath + "/ipa/ "; //$2
        string _ipaName = ipaName + ".ipa"; //$3
        string firArguments = " \"fir bi " + xcodeProjectPath +
                              "/Unity-iPhone.xcodeproj -S Unity-iPhone -E development -o " +
                              mEditorGameBuildConfigurations.appExportPath + "/ipa/ -n " + ipaName + "\" "; //$4
        string publishArguments = " ";
        if (publishToFir)
        {
//            publishArguments = "\"fir login " + m_api_token + "\" ";
            publishArguments += "\"fir publish " + mEditorGameBuildConfigurations.appExportPath + "/ipa/" + _ipaName;
            if (!mFirLog.IsNullOrEmpty())
            {
                publishArguments += " -c \'" + mFirLog + "'";
            }

            publishArguments +=
                " -L " + mEditorGameBuildConfigurations.appExportPath + "/ipa/fir_publish_log.txt\" "; //$5
        }

        // arguments += xcodeProjectPath + "/Unity-iPhone.xcodeproj" + " ";                    //$1 目录
        // // arguments += "Unity-iPhone ";                                                       //$2 Sche
        // // arguments += "development ";                                                        //$3
        // arguments += mEditorGameBuildConfigurations.appExportPath + "/ipa/ ";               //$2
        // arguments += ipaName + " ";                                                         //$3
        // // arguments += "\"-p -T 509014074736bd3326893fc301864579 -L " + "'123123  123'" + "\" ";        //$4 $5 $6 $7 $8
        arguments += xcodeprojPath + ipaRootPath + _ipaName + firArguments + publishArguments;

        string pushDingDingRobotArguments = " ";
        if (mPushMsgToDingDingRobot)
        {
            pushDingDingRobotArguments = url_dingding + " "; //$6
            pushDingDingRobotArguments +=
                "\"" + Application.productName + " " + DataConfigProject.platform + "\" "; //$7
            pushDingDingRobotArguments += "\"";
            pushDingDingRobotArguments += "\n###### " + _ipaName;
            pushDingDingRobotArguments += "\n###### 更新日志：";
            foreach (var content in mFirLog.Split('\n'))
            {
                if (!content.IsNullOrEmpty())
                {
                    pushDingDingRobotArguments += "\n - ###### " + content;
                }
            }

            pushDingDingRobotArguments += "\n###### 更新链接：[http://fir.im/dhqpyxipa](http://fir.im/dhqpyxipa)\n";
            pushDingDingRobotArguments += "\" ";
        }

        arguments += pushDingDingRobotArguments;
        psi.Arguments = shell + arguments;
        Process p = Process.Start(psi);
        string strOutput = p.StandardOutput.ReadToEnd();
        UnityEngine.Debug.Log(strOutput);
    }

    private static void AutoPublishToFir(string appPath)
    {
        ProcessStartInfo psi = new ProcessStartInfo();
        psi.FileName = "/bin/bash";
        psi.CreateNoWindow = false;
        psi.UseShellExecute = false;
        psi.RedirectStandardOutput = true;
        string shell = Application.dataPath + "/Editor/publish_to_fir.sh";
        psi.Arguments = shell + " fir publish " + appPath;
        Process p = Process.Start(psi);
        string strOutput = p.StandardOutput.ReadToEnd();
        UnityEngine.Debug.Log(strOutput);
    }

    #region 自动上传fir,钉钉机器人相关代码

    private void AutoPublishToFir_Windows()
    {
        GetParameter();
        GetCredentials();
    }

    //获取参数
    private void GetParameter()
    {
        m_bundleIdentifier = Application.identifier;
        m_version = Application.version;
        m_bundleVersionCode = PlayerSettings.Android.bundleVersionCode.ToString();
        fir_ht = null;
    }

    //获取凭证
    private void GetCredentials()
    {
        Dictionary<string, string> data = new Dictionary<string, string>();
        data.Add("type", "android");
        data.Add("bundle_id", m_bundleIdentifier);
        data.Add("api_token", m_api_token);
        HttpUtility.MySendHttpRequestPost(url_Credentials, data, null, null, DelegateData_Credentials);
    }

    //获取凭证的反馈信息
    private void DelegateData_Credentials(Hashtable ht)
    {
        if (ht == null)
        {
            Debug.LogError("===返回空");
        }
        else
        {
            fir_ht = ht;
            uploadToFir();
        }
    }

    //上传到Fir
    private void uploadToFir()
    {
        appshort_url = "http://fir.im/" + fir_ht["short"].ToString();
        Hashtable htcert = fir_ht["cert"] as Hashtable;
        if (htcert != null)
        {
            Hashtable htbinary = htcert["binary"] as Hashtable;
            if (htbinary != null)
            {
                string cert_binary_key = htbinary["key"].ToString().Trim();
                string cert_binary_token = htbinary["token"].ToString().Trim();
                Dictionary<string, string> dicData = new Dictionary<string, string>();
                dicData.Add("key", cert_binary_key);
                dicData.Add("token", cert_binary_token);
                dicData.Add("x:name", m_AppName);
                dicData.Add("x:version", m_version);
                dicData.Add("x:build", m_bundleVersionCode);
                if (mAppAutoPublishToFir) dicData.Add("x:changelog", mFirLog);

                if (!File.Exists(mAPP_SavePath))
                {
                    Debug.LogError("===不存在包,请检查路径=" + mAPP_SavePath);
                    return;
                }

                //else
                //{
                //    Debug.LogError("===存在包,正在上传中,路径=" + mAPP_SavePath);
                //}
                List<KeyValuePair<string, string>> fileList = new List<KeyValuePair<string, string>>();
                fileList.Add(new KeyValuePair<string, string>("file", mAPP_SavePath));
                HttpUtility.MySendHttpRequestPost(url_upload, dicData, fileList, null, DelegateData_uploadToFir);
            }
        }
    }

    //上传的回馈
    private void DelegateData_uploadToFir(Hashtable ht)
    {
        if (ht == null)
        {
            Debug.LogError("===返回空");
        }
        else
        {
            if (ht["is_completed"] != null)
            {
                if ((ht["is_completed"].ToString().ToLower().Equals("true")))
                {
                    Debug.LogError(string.Format("==={0}上传到Fir成功,url={1}", mAPP_SavePath, appshort_url));
                    if (mPushMsgToDingDingRobot) ReadyDingDingRobot();
                }
                else
                {
                    if (EditorUtility.DisplayDialog("上传失败到Fir!", "是否重新上传？", "是", "否") == false)
                    {
                        //Debug.LogError("取消");//对话框取消
                    }
                    else
                    {
                        //Debug.LogError("确认");//对话框确认
                        AutoPublishToFir_Windows();
                    }
                }
            }
        }
    }

    private void ReadyDingDingRobot()
    {
        string str_md = "\n###### ";
        string textMsg = "{ \"msgtype\": \"markdown\", \"markdown\": {\"title\": \"{0}\",\"text\": \"{1}\"}}";

        string title = Application.productName + " " + DataConfigProject.platform;
        string tName = str_md + m_AppName;
        string tFirLog = "";
        if (mAppAutoPublishToFir && !string.IsNullOrEmpty(mFirLog))
        {
            tFirLog = str_md + "更新日志: ";
            foreach (var content in mFirLog.Split('\n'))
            {
                if (!content.IsNullOrEmpty())
                {
                    tFirLog += "\n - ###### " + content;
                }
            }
        }

        string tUrl = str_md + "更新链接:[http://fir.im/dhqpyxapk](http://fir.im/dhqpyxapk)\n";
        string tStr = title + tName + tFirLog + tUrl;
        textMsg = textMsg.Replace("{0}", title);
        textMsg = textMsg.Replace("{1}", tStr);
        Debug.Log("textMsg ======== " + textMsg);
        Debug.Log("url_dingding ======== " + url_dingding);
        byte[] post_data = System.Text.UTF8Encoding.UTF8.GetBytes(textMsg);
        Dictionary<string, string> JsonDic = new Dictionary<string, string>();
        JsonDic.Add("Content-Type", "application/json");
        new EditorWWW().WWW(url_dingding, GetPost_data(post_data), JsonDic, (x, y) =>
        {
            Debug.Log(x);
            // if (x.Contains("success\":true"))
            // {
            //     EditorUtility.DisplayDialog("补丁资源上传", "上传成功!\nurl = " + mEditorGameBuildConfigurations.resourcesUploadServerHost, "确定");
            // }
        });
    }

    public void AssetVersionUploadToServerHint(string serverAddress, string version)
    {
        string str_md = "\n###### ";
        string textMsg = "{ \"msgtype\": \"markdown\", \"markdown\": {\"title\": \"{0}\",\"text\": \"{1}\"}}";

        string title = string.Format("{0} {1} {2}分支 热更新补丁", Application.productName, DataConfigProject.platform,
            mEditorGameBuildConfigurations.isMaster ? "Master" : "Develop");
        string updateServerAddress = str_md + "更新地址：" + serverAddress;
        string versionName = str_md + "版本号：" + version;
        string tFirLog = "";
        if (mAppAutoPublishToFir && !string.IsNullOrEmpty(mAssetVersionUploadServerLog))
        {
            tFirLog = str_md + "补丁内容: ";
            foreach (var content in mAssetVersionUploadServerLog.Split('\n'))
            {
                if (!content.IsNullOrEmpty())
                {
                    tFirLog += "\n - ###### " + content;
                }
            }
        }

        string tStr = title + updateServerAddress + versionName + tFirLog;
        textMsg = textMsg.Replace("{0}", title);
        textMsg = textMsg.Replace("{1}", tStr);
        byte[] post_data = System.Text.UTF8Encoding.UTF8.GetBytes(textMsg);
        Dictionary<string, string> JsonDic = new Dictionary<string, string>();
        JsonDic.Add("Content-Type", "application/json");
    }

    private static byte[] GetPost_data(byte[] post_data)
    {
        return post_data;
    }

    private string GetPlatfamString()
    {
#if UNITY_ANDROID
        return "Android";
#elif UNITY_IOS || UNITY_IPHONE
        return "ios";
#endif
        return "Android";
    }

    #endregion
}