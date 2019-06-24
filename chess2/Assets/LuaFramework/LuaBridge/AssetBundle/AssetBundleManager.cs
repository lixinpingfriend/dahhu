using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using LuaInterface;
using Object = UnityEngine.Object;
#if UNITY_EDITOR
using UnityEditor;
#endif

namespace GameAsset
{
    public class AssetBundleManager : SingletonProject<AssetBundleManager>
    {
        
        public LuaFunction onEventFn;

        //游戏中所有资源的统计
        AssetBundleManifest mGameFullAssetBundleManifest;

        /// <summary> 已加载或正在加载的AssetBundle </summary>
        readonly Dictionary<string, LoadedAssetBundle> mLoadedAssetBundleDic = new Dictionary<string, LoadedAssetBundle>();

        /// <summary> 已经卸载掉的AssetBundle </summary>
        readonly Dictionary<string, bool> mAllUnLoadedAssetBundleDicName = new Dictionary<string, bool>();
        
        /// <summary> 已经卸载掉的AssetBundle </summary>
        Dictionary<string, uint> mNeedLoadedAssetBundleCRC = new Dictionary<string, uint>();
        
        /// <summary> 已经卸载掉的AssetBundle </summary>
        Dictionary<string, byte> mGameFullAssetBundleManifestDic;

        public bool loadAssetBundleNeedCRC = false;
        
        public bool loadAssetBundleCheckInManifest = false;
        
        /// <summary> 初始化，获取manifest的信息 </summary>
        public void Initialize()
        {
#if UNITY_EDITOR
            if (GameConfigProject.instance.assetLoadType == (int)GameConfigProject.LoadType.SimulateEditor)
            {//模拟AssetBundle
                return;
            }
#endif
            Debug.Log(string.Format("初始化AssetBundle: {0}", DataConfigProject.platform));
            LoadedAssetBundle assetBundle;
            if (mLoadedAssetBundleDic.TryGetValue("asset_bundle_manifest", out assetBundle))
            {
                if (assetBundle.assetBundle != null)
                {
                    assetBundle.UnloadAssetBundle(true);
                }
                assetBundle.Reset();
                mLoadedAssetBundleDic.Remove("asset_bundle_manifest");
            }
            assetBundle = GetOrGenerateLoadedAssetBundle("asset_bundle_manifest", true, false);
            mGameFullAssetBundleManifest = assetBundle.GetAsset("AssetBundleManifest", false) as AssetBundleManifest;
            if (loadAssetBundleCheckInManifest)
            {
                mGameFullAssetBundleManifestDic = new Dictionary<string, byte>();
                foreach (var path in mGameFullAssetBundleManifest.GetAllAssetBundles())
                {
                    mGameFullAssetBundleManifestDic.Add(path, 1);
                }
            }
            // Debug.Log(string.Format("初始化AssetBundle完成: {0}", DataConfigProject.platform));
        }

        public bool LoadAssetBundleManifestScriptableObject(string path, string assetName)
        {
            try
            {
                AssetBundle assetBundle = LoadAssetBundleFromFile(path);
                if (assetBundle != null)
                {
                    mNeedLoadedAssetBundleCRC = assetBundle.LoadAsset<AssetBundleCRCScriptableObject>(assetName).crcData;
                    return true;
                }
            }
            catch (Exception e)
            {
                Debug.LogException(e);
            }
            return false;
        }

        public AssetBundleManifest GetFullManifest()
        {
            return mGameFullAssetBundleManifest;
        }

        public Dictionary<string, LoadedAssetBundle> GetLoadedAssetBundleDic()
        {
            return mLoadedAssetBundleDic;
        }

        public void Reset(bool unloadAssetBundle)
        {
            foreach (var data in mLoadedAssetBundleDic)
            {
                var loadedAssetBundle = data.Value;
                if (loadedAssetBundle != null)
                {
                    //回收AssetBundle
                    if (loadedAssetBundle.assetBundle != null)
                    {
                        loadedAssetBundle.UnloadAssetBundle(unloadAssetBundle);
                    }
                    //RemoveFromLoadedDic(loadedAssetBundle);
                    loadedAssetBundle.Reset();
                }
            }
            mLoadedAssetBundleDic.Clear();
            mGameFullAssetBundleManifest = null;
        }

        //重置加载的Package
        public void ResetPackage(string package, bool unloadAssetBundle)
        {
            List<string> needResetPackages = new List<string>();
            foreach (var data in mLoadedAssetBundleDic)
            {
                if (!data.Key.StartsWith(package))
                {
                    continue;
                }

                var loadedAssetBundle = data.Value;
                if (loadedAssetBundle != null)
                {
                    needResetPackages.Add(data.Key);
                    //回收AssetBundle
                    if (loadedAssetBundle.assetBundle != null)
                    {
                        loadedAssetBundle.UnloadAssetBundle(unloadAssetBundle);
                    }
                    //RemoveFromLoadedDic(loadedAssetBundle);
                    loadedAssetBundle.Reset();
                }
            }

            foreach (var item in needResetPackages)
            {
                mLoadedAssetBundleDic.Remove(item);
            }

            // //这种写法是有问题的
            // foreach (var data in mLoadedAssetBundleDic) {
            //     if (!data.Key.StartsWith(package)) {
            //         continue;
            //     }
            //     mLoadedAssetBundleDic.Remove(data.Key);
            // }
        }

        //对应的Package是否加载了
        public bool PackageHaveLoad(string package, bool unloadAssetBundle)
        {
            foreach (var data in mLoadedAssetBundleDic)
            {
                if (data.Key.StartsWith(package))
                {
                    return true;
                }
            }
            return false;
        }

        //获取加载的Package
        public List<string> GetPackageHaveLoadeds(string package, bool unloadAssetBundle)
        {
            List<string> packageLoads = new List<string>();
            foreach (var data in mLoadedAssetBundleDic)
            {
                if (data.Key.StartsWith(package))
                {
                    packageLoads.Add(data.Key);
                }
            }
            return packageLoads;
        }

        public void UnLoadAssetBundle(string assetBundlePath, bool unloadAllLoadedObjects = true)
        {
            LoadedAssetBundle assetBundle;
            if (mLoadedAssetBundleDic.TryGetValue(assetBundlePath, out assetBundle))
            {
                if (assetBundle.assetBundle != null)
                {
                    assetBundle.UnloadAssetBundle(unloadAllLoadedObjects);
                }
                mLoadedAssetBundleDic.Remove(assetBundlePath);
            }
        }


        public List<string> GetDependPackages(string assetBundlePath)
        {
            List<string> packageLoads = new List<string>();
            foreach (var path in mGameFullAssetBundleManifest.GetAllDependencies(assetBundlePath))
            {
                string package = path.Split('/')[0];
                if (!packageLoads.Contains(package))
                {
                    packageLoads.Add(package);
                }
            }
            return packageLoads;
        }

        public bool AssetBundleIsInManifest(string assetBundlePath)
        {
            return mGameFullAssetBundleManifestDic.ContainsKey(assetBundlePath);
        }

        public bool AssetBundleExist(string assetBundlePath)
        {
            bool exist = false;
            string filePath = null;
            try
            {
#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN
                filePath = string.Format("{0}/assetsdata/{1}", Application.persistentDataPath, assetBundlePath);
                if (File.Exists(filePath))
                {
                    return true;
                }
                filePath = Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(String.Format("{0}/AssetDataBytes/AssetBundle/{1}", DataConfigProject.platform, assetBundlePath)));
                if (File.Exists(filePath))
                {
                    return true;
                }

                if (assetBundlePath != assetBundlePath.ToLower())
                {
                    throw new Exception("AssetBundleName必须为小写请修改！");
                }
                string[] allAssetBundlesName;
#if UNITY_EDITOR
                if (GameConfigProject.instance.assetLoadType == (int)GameConfigProject.LoadType.SimulateEditor)
                {//模拟AssetBundle
                    allAssetBundlesName = AssetDatabase.GetAllAssetBundleNames();
                }
                else
                {
                    allAssetBundlesName = mGameFullAssetBundleManifest.GetAllAssetBundles();
                }
#else
                allAssetBundlesName = mGameFullAssetBundleManifest.GetAllAssetBundles();
#endif
                foreach (var element in allAssetBundlesName)
                {
                    if (element == assetBundlePath)
                    {
                        return true;
                    }
                }
#endif
                filePath = string.Format("{0}/assetsdata/{1}", Application.persistentDataPath, assetBundlePath);
                if (File.Exists(filePath))
                {   //先从外部持久目录寻找资源
                    return true;
                }

#if UNITY_IPHONE
                filePath = Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(String.Format("iOS/AssetDataBytes/AssetBundle/{0}", assetBundlePath)));      //在Linux下大小写敏感，所有的AssetBundle资源名都是小写的
                if (File.Exists(filePath)) {   
                    return true;
                } 
#else
                //安卓用LoadFromFile是可以同步加载streamingAssetsPath中的，但不能使用直接使用Application.streamingAssetsPath  因为多了一个jar:file://
                filePath = FileUtility.EncryptFilePath(string.Format("Android/AssetDataBytes/AssetBundle/{0}", assetBundlePath));

                return GameSDKInterface.instance.AssetsFileExistInInternalAssets(filePath);
#endif

            }
            catch (Exception ex)
            {
                Debug.LogException(ex);
            }
            return exist;
        }


        /// <summary>
        /// 加载AssetBundle资源。这里需要注意需自行管理AssetBundle的生命周期
        /// </summary>
        /// <param name="assetBundleName"></param>
        public LoadedAssetBundle LoadAssetBundle(string assetBundleName)
        {
#if UNITY_EDITOR
            if (assetBundleName != assetBundleName.ToLower())
            {
                Debug.LogErrorFormat("加载的AssetBundleName含有大写字母！必须是小写！【{0}】请改正", assetBundleName);
                throw new Exception(string.Format("加载的AssetBundleName含有大写字母！必须是小写！【{0}】请改正", assetBundleName));
                // assetBundleName = assetBundleName.ToLower();
            }
            if (GameConfigProject.instance.assetLoadType == (int)GameConfigProject.LoadType.SimulateEditor)
            {
                string[] assetPaths = AssetDatabase.GetAssetPathsFromAssetBundle(assetBundleName);
                if (assetPaths.Length == 0)
                {
                    return null;
                }

                LoadedAssetBundle loaded;
                if (mLoadedAssetBundleDic.TryGetValue(assetBundleName, out loaded))
                { //如果AssetBundle已经加载则其引用+1
                    ++loaded.referencedCount;
                    return loaded;
                }
                Object target = AssetDatabase.LoadMainAssetAtPath(assetPaths[0]);
                SimulateLoadedAssetBundle simulateAb = new SimulateLoadedAssetBundle(target, assetBundleName);
                AddToLoadedDic(assetBundleName, simulateAb);
                simulateAb.dependAssetBundles = GetDependAssetBundles(assetBundleName, false);
                simulateAb.isLoaded = true;
                return simulateAb;
            }
#endif
//            Debug.Log("LoadAssetBundle：" + assetBundleName + " | " + Time.realtimeSinceStartup);
            LoadedAssetBundle assetBundle = GetOrGenerateLoadedAssetBundle(assetBundleName, false, false);
            return assetBundle;
        }

#if UNITY_EDITOR
        string package1 = "public";
        string package2 = "henanmj";
        // string package3 = "majiang";
        string package4 = "publictable";
        bool IsAllowDepend(string assetBundleName, string dependPath)
        {
            string abPackage = GetPackageName(assetBundleName);
            string dependPackage = GetPackageName(dependPath);
            if (dependPackage == "majiang" && (abPackage == "majiang3d"))
            {
                return true;
            }


            if (dependPackage != abPackage && dependPackage != package1 && dependPackage != package2 && dependPackage != package4)
            {
                Debug.Log(dependPackage + " - " + abPackage);
                return false;
            }

            return true;
        }
        string GetPackageName(string path)
        {
            string[] strs = path.Split('/');
            //Debug.Log(strs[0]);
            if (strs.Length > 0)
                return strs[0];
            return path;
        }
#endif




        /// <summary>  加载AssetBundle资源 </summary>
        public LoadedAssetBundle LoadAssetBundleAsync(string assetBundleName, string assetName, Action<LoadedAssetBundle> loadAssetBundleCallback)
        {
#if UNITY_EDITOR
            if (assetBundleName != assetBundleName.ToLower())
            {
                Debug.LogErrorFormat("加载的AssetBundleName含有大写字母！【{0}】请改正", assetBundleName);
                assetBundleName = assetBundleName.ToLower();
            }
            if (GameConfigProject.instance.assetLoadType == (int)GameConfigProject.LoadType.SimulateEditor)
            {
                string[] assetPaths = AssetDatabase.GetAssetPathsFromAssetBundle(assetBundleName);
                if (assetPaths.Length == 0)
                {
                    //Debug.LogError("There is no assetBundle " + assetBundleName);
                    return null;
                }

                LoadedAssetBundle loaded;
                if (mLoadedAssetBundleDic.TryGetValue(assetBundleName, out loaded))
                { //如果AssetBundle已经加载则其引用+1
                    ++loaded.referencedCount;
                    if (loadAssetBundleCallback != null)
                    {
                        loadAssetBundleCallback(loaded);
                    }
                    return loaded;
                }
                Object target = AssetDatabase.LoadMainAssetAtPath(assetPaths[0]);
                SimulateLoadedAssetBundle simulateAb = new SimulateLoadedAssetBundle(target, assetBundleName);
                AddToLoadedDic(assetBundleName, simulateAb);
                simulateAb.dependAssetBundles = GetDependAssetBundles(assetBundleName, false);
                simulateAb.isLoaded = true;
                if (loadAssetBundleCallback != null)
                {
                    loadAssetBundleCallback(simulateAb);
                }
                return simulateAb;
            }
#endif  
            LoadedAssetBundle loadedAssetBundle = GetOrGenerateLoadedAssetBundle(assetBundleName, false, true);
            if (loadedAssetBundle == null)
            {
                if (loadAssetBundleCallback != null)
                {
                    loadAssetBundleCallback(null);
                }
                return null;
            }
            
            if (loadedAssetBundle.isLoaded || loadedAssetBundle.isAsyncLoading)
            {
                if (loadAssetBundleCallback != null)
                {
                    loadAssetBundleCallback(loadedAssetBundle);
                }
                return loadedAssetBundle;
            }
            MonoBehaviourDispatcher.instance.StartCoroutine(LoadAssetBundleAsyncFromeFile(loadedAssetBundle, assetName, loadAssetBundleCallback));
            return loadedAssetBundle;
        }

        private IEnumerator LoadAssetBundleAsyncFromeFile(LoadedAssetBundle assetBundle, string needLoadAssetName, Action<LoadedAssetBundle> loadedAssetBundleAction)
        {
#if DEBUG

//            Debug.Log(assetBundle.assetBundleName + " -- " + assetBundle.IsLoadedAll() + " --" + Time.frameCount);
#endif
            yield return new LoadedAssetBundleAsyncOperation(assetBundle);
#if DEBUG
//            Debug.Log(assetBundle.assetBundleName + " --loaded " + assetBundle.IsLoadedAll() + " --" + Time.frameCount);
#endif
            if (!string.IsNullOrEmpty(needLoadAssetName))
            {
                // Debug.Log(assetBundle.assetBundleName + " --needLoadAssetName " + assetBundle.IsLoadedAll() + " --" + Time.frameCount);
                Object loadAsset;
                if (!assetBundle.assetObjects.TryGetValue(needLoadAssetName, out loadAsset))
                {
                    var load = assetBundle.assetBundle.LoadAssetAsync(needLoadAssetName);
                    yield return load;
                    //为什么要判断呢，是因为如果有同步加载的AssetBundle逻辑
                    if (!assetBundle.assetObjects.ContainsKey(needLoadAssetName)) {
                        assetBundle.assetObjects.Add(needLoadAssetName, load.asset);
                    }
                } //缓存以后的速度快好多了
            }

            if (loadedAssetBundleAction != null)
            {
                loadedAssetBundleAction(assetBundle);
            }
        }


        //加载依赖资源
        LoadedAssetBundle[] GetDependAssetBundles(string assetBundleName, bool asyncLoad)
        {
            string[] dependencies = null;
#if UNITY_EDITOR
            if (GameConfigProject.instance.assetLoadType == (int)GameConfigProject.LoadType.SimulateEditor)
            {

                string[] assetPaths = AssetDatabase.GetAssetPathsFromAssetBundle(assetBundleName);
                if (assetPaths.Length == 0)
                {

                    Debug.LogError("There is no assetBundle" + assetBundleName);
                    return null;
                }
                Object target = AssetDatabase.LoadMainAssetAtPath(assetPaths[0]);
                var dependenciesPath = AssetDatabase.GetDependencies(new string[] { AssetDatabase.GetAssetPath(target) });
                List<string> dependenciesAssetBundleName = new List<string>();
                for (int i = 0; i < dependenciesPath.Length; ++i)
                {
                    AssetImporter assetImporter = AssetImporter.GetAtPath(dependenciesPath[i]);
                    if (string.IsNullOrEmpty(assetImporter.assetBundleName) || assetImporter.assetBundleName == assetBundleName)
                    {
                        continue;
                    }
                    if (IsAllowDepend(assetBundleName, assetImporter.assetBundleName))
                    {
                        dependenciesAssetBundleName.Add(assetImporter.assetBundleName);
                    }
                    else
                    {
                        Debug.LogError(assetBundleName + " 引用了 " + GetPackageName(assetImporter.assetBundleName) + " 内的资源：" + assetImporter.assetPath);
                        return null;
                    }
                    // dependenciesAssetBundleName.Add(assetImporter.assetBundleName);
                }
                dependencies = dependenciesAssetBundleName.ToArray();
            }
            else
            {
                dependencies = mGameFullAssetBundleManifest.GetAllDependencies(assetBundleName);
                if (dependencies.Length == 0) return null;
            }
#else
            dependencies = mGameFullAssetBundleManifest.GetAllDependencies(assetBundleName);
            if (dependencies.Length == 0) return null;
#endif
            LoadedAssetBundle[] arry = new LoadedAssetBundle[dependencies.Length];
            for (int i = 0, len = dependencies.Length; i < len; ++i)
            {  //有可能加载出来的名字是空的
                if (string.IsNullOrEmpty(dependencies[i]) || assetBundleName == dependencies[i])
                {
                    continue;
                }
                if (asyncLoad)
                {
                    arry[i] = LoadAssetBundleAsync(dependencies[i], null, null);
                }
                else
                {
                    arry[i] = LoadAssetBundle(dependencies[i]);
                }
#if DEBUG
                //                Debug.LogFormat("依赖资源开始加载：{0} -- {1} -- {2}", assetBundleName, dependencies[i], arry[i].isLoaded);
#endif
            }
            return arry;
        }


        LoadedAssetBundle GetOrGenerateLoadedAssetBundle(string assetBundleName, bool isLoadingAssetBundleManifest, bool asyncLoad)
        {
            LoadedAssetBundle loaded;
            if (mLoadedAssetBundleDic.TryGetValue(assetBundleName, out loaded))
            { //如果AssetBundle已经加载则其引用+1
                ++loaded.referencedCount;
                // 此处只考虑本身是否已加载完成
                if (loaded.isLoaded)
                {
                    //                    Debug.LogError(string.Format("OnLoadAssetBundle 已有对应AssetBundle!!! {0}", assetBundleName));
                    return loaded;
                }
            }

            if (!isLoadingAssetBundleManifest && loadAssetBundleCheckInManifest && !instance.AssetBundleIsInManifest(assetBundleName))
            {
                return null;
            }
            
            
            if (loaded == null)
            {
                loaded = new LoadedAssetBundle(assetBundleName, asyncLoad);
                AddToLoadedDic(assetBundleName, loaded);
            }

            if (loaded.assetBundle != null)
            {
                Debug.LogError(string.Format("OnLoadAssetBundle 已有对应AssetBundle!!!"));
            }
#if DEBUG
            var startTime = Time.realtimeSinceStartup;
//            Debug.LogFormat("开始{0}加载：{1} - {2} | {3}", asyncLoad ? "异步" : "同步", Time.frameCount, Time.realtimeSinceStartup, assetBundleName);
#endif
            if (!isLoadingAssetBundleManifest)
            {    //必须要先加载依赖的AssetBundle
                loaded.dependAssetBundles = GetDependAssetBundles(assetBundleName, asyncLoad);
            }
            if (!asyncLoad)
            {
                if (loaded.assetBundle == null)
                {
                    loaded.assetBundle = LoadAssetBundleFromFile(assetBundleName);
                }
                else
                {
                    var asset = loaded.assetBundle.mainAsset;
                }
                loaded.isLoaded = true;
#if DEBUG
            Debug.LogFormat("加载{0}完成：{1} - {2} | {3}", asyncLoad ? "异步" : "同步", Time.realtimeSinceStartup, (Time.realtimeSinceStartup - startTime) * 1000, assetBundleName);
#endif
            }
            return loaded;
        }


        /// <summary> 卸载已加载的AssetBundle  </summary>
        public void UnLoadLoadedAssetBundle(LoadedAssetBundle loadedAssetBundle, bool unloadAllLoadedObjects = false, bool force = false)
        {
            --loadedAssetBundle.referencedCount;
            if (loadedAssetBundle.referencedCount <= 0 || force)
            {
                // Debug.LogError("UnLoadLoadedAssetBundle：" + loadedAssetBundle.assetBundleName);
                if (loadedAssetBundle.dependAssetBundles != null)
                {
                    for (int i = 0, len = loadedAssetBundle.dependAssetBundles.Length; i < len; ++i)
                    {
                        if (loadedAssetBundle.dependAssetBundles[i] != null)
                        {
                            UnLoadLoadedAssetBundle(loadedAssetBundle.dependAssetBundles[i]);
                        }
                    }
                }
                //回收AssetBundle
                if (loadedAssetBundle.assetBundle != null)
                {
                    loadedAssetBundle.UnloadAssetBundle(unloadAllLoadedObjects);
                }
                RemoveFromLoadedDic(loadedAssetBundle);
                loadedAssetBundle.Reset();
            }
        }


        bool AddToLoadedDic(string key, LoadedAssetBundle loadedAssetBundle)
        {
            if (mLoadedAssetBundleDic.ContainsKey(key))
            {
                Debug.LogError(string.Format("增加失败!!,已加载字典里面已包含【{0}】", key));
                return false;
            }
            mLoadedAssetBundleDic.Add(key, loadedAssetBundle);
            return true;
        }

        public bool RemoveFromLoadedDic(LoadedAssetBundle loadedAssetBundle)
        {
            if (!string.IsNullOrEmpty(loadedAssetBundle.assetBundleName) && mLoadedAssetBundleDic.ContainsKey(loadedAssetBundle.assetBundleName))
            {
                mLoadedAssetBundleDic.Remove(loadedAssetBundle.assetBundleName);
                if (!mAllUnLoadedAssetBundleDicName.ContainsKey(loadedAssetBundle.assetBundleName))
                {
                    mAllUnLoadedAssetBundleDicName.Add(loadedAssetBundle.assetBundleName, true);
                }
                return true;
            }
            Debug.LogError(string.Format("移除失败！！已加载字典里面不包含【{0}】", loadedAssetBundle.assetBundleName));
            return false;
        }

        public static byte[] LoadBytesFromStreamingAssets(string assetBundlePath, string assetName)
        {
            byte[] buffer = null;
            try
            {
                AssetBundle assetBundle = AssetBundle.LoadFromFile(assetBundlePath);
                if (assetBundle != null)
                {
                    var luaCode = assetBundle.LoadAsset<TextAsset>(assetName);
                    if (luaCode != null)
                    {
                        buffer = luaCode.bytes;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.LogException(ex);
            }
            return buffer;
        }


        //判断AssetBundle是否加载了，包括依赖资源
        public bool AssetBundleIsLoaded(string assetBundlePath)
        {
            // Debug.Log("AssetBundleIsLoaded: " + assetBundlePath);
            // foreach (var item in mLoadedAssetBundleDic)
            // {
            //     Debug.Log("mLoadedAssetBundleDic: " + item.Key);
            // }
            LoadedAssetBundle loaded;
            if (mLoadedAssetBundleDic.TryGetValue(assetBundlePath, out loaded))
            { //如果AssetBundle已经加载则其引用+1
                return loaded.IsLoadedAll();
            }
            return false;
        }


        public bool LuaAssetBundleIsLoaded(string luaAssetBundlePath)
        {
            return LuaLoader.LuaFileIsLoaded(luaAssetBundlePath);
        }

        //统一判断是否加载了某个资源
        public bool AssetBundlesIsLoadedOnly(string[] assetBundlePaths)
        {
            for (int i = 0; i < assetBundlePaths.Length; i++)
            {
                if (AssetBundleIsLoaded(assetBundlePaths[i]))
                {
                    return true;
                }
            }

            return false;
        }

        //判断AssetBundle是否加载了，包括Unload资源
        public bool AssetBundleIsLoadedOnly(string assetBundlePath)
        {
            bool isload = mLoadedAssetBundleDic.ContainsKey(assetBundlePath);
            if (isload)
            {
                return isload;
            }
            isload = mAllUnLoadedAssetBundleDicName.ContainsKey(assetBundlePath);
            return isload;
        }


        private static string GetAssetBundleAbstractFilePath(string assetBundlePath)
        {
            string filePath = null;
#if UNITY_EDITOR || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN
            filePath = string.Format("{0}/assetsdata/{1}", Application.persistentDataPath, assetBundlePath);
            if (File.Exists(filePath))
            {

            }
            else
            {
                string path = DataConfigProject.platform + "/AssetDataBytes/AssetBundle/" + assetBundlePath;
                // Debug.Log(path);
                path = FileUtility.EncryptFilePath(path);

                filePath = String.Format("{0}/{1}", Application.streamingAssetsPath, path);
            }
            return filePath;
#endif
            filePath = string.Format("{0}/assetsdata/{1}", Application.persistentDataPath, assetBundlePath);


            if (File.Exists(filePath))
            {   //先从外部持久目录寻找资源，这里是个大问题

            }
            else
            {
#if UNITY_IPHONE 
                filePath = Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(String.Format("iOS/AssetDataBytes/AssetBundle/{0}", assetBundlePath)));      //在Linux下大小写敏感，所有的AssetBundle资源名都是小写的
#else
                //安卓用LoadFromFile是可以同步加载streamingAssetsPath中的，但不能使用直接使用Application.streamingAssetsPath  因为多了一个jar:file://
                filePath = Application.dataPath + "/assets/" + FileUtility.EncryptFilePath(string.Format("Android/AssetDataBytes/AssetBundle/{0}", assetBundlePath));
#endif
            }
            return filePath;
        }

        public static AssetBundle LoadAssetBundleFromFile(string assetBundlePath)
        {
            AssetBundle bundle = null;
            try
            {
                var filePath = GetAssetBundleAbstractFilePath(assetBundlePath);
                if (!string.IsNullOrEmpty(filePath))
                {
                    uint crc = 0;
                    if (instance.loadAssetBundleNeedCRC)
                    {

                        if (instance.mNeedLoadedAssetBundleCRC.TryGetValue(assetBundlePath, out crc))
                        {
                        }
                    }
                    bundle = AssetBundle.LoadFromFile(filePath, crc);
                }
            }
            catch (Exception ex)
            {

                if (instance.onEventFn != null)
                {
                    instance.onEventFn.Call("LoadFromFile", "Error", assetBundlePath, ex.ToString());
                }
                Debug.LogException(ex);
                return bundle;
            }

            if (bundle == null)
            {
                if (instance.onEventFn != null)
                {
                    instance.onEventFn.Call("LoadFromFileError", assetBundlePath);
                }
                Debug.LogError("AssetBundle.LoadFromFile Error:" + assetBundlePath);
            }
            return bundle;
        }

        public static AssetBundleCreateRequest LoadAssetBundleFromFileAsync(string assetBundlePath)
        {
            AssetBundleCreateRequest bundle = null;
            try
            {
                var filePath = GetAssetBundleAbstractFilePath(assetBundlePath);
                if (!string.IsNullOrEmpty(filePath))
                {
                    uint crc = 0;
                    if (instance.loadAssetBundleNeedCRC)
                    {
                        if (instance.mNeedLoadedAssetBundleCRC.TryGetValue(assetBundlePath, out crc))
                        {
                            
                        }
                    }
                    bundle = AssetBundle.LoadFromFileAsync(filePath, crc);
                }
            }
            catch (Exception ex)
            {
                if (instance.onEventFn != null)
                {
                    instance.onEventFn.Call("LoadFromFileAsyncError", "Error", assetBundlePath);
                }
                Debug.LogException(ex);
                
                return bundle;
            }
            if (bundle == null)
            {
                if (instance.onEventFn != null)
                {
                    instance.onEventFn.Call("LoadFromFileAsyncError", assetBundlePath);
                }
                Debug.LogError("AssetBundle.LoadFromFile Error:" + assetBundlePath);
            }
            return bundle;
        }

    }

}

