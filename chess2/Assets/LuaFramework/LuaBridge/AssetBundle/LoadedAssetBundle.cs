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



namespace GameAsset {



    
    
    
    /// <summary>
    /// 已经加载的AssetBundle资源
    /// </summary>
    public class LoadedAssetBundle {
        //加载的AsetBundleName,完整路径
        public string assetBundleName;

        public AssetBundle assetBundle;

        private bool mIsSpriteAtlas;

        protected Dictionary<string, Sprite> sprites = new Dictionary<string, Sprite>();

        public Dictionary<string, Object> assetObjects = new Dictionary<string, Object>();

        public GameObject cacheGameObject;

        /// <summary> 依赖的资源 </summary>
        public LoadedAssetBundle[] dependAssetBundles;

        public int referencedCount;

        /// <summary> 是否已经完成加载(发生错误也算加载完), 不包含依赖 </summary>
        public bool isLoaded = false;

        public string erroMsg = null;

        /// <summary> 加载完成的回调 </summary>
        public Action onLoaded;

        /// <summary> 是否为异步加载 </summary>
        public bool asyncLoad;
        
        /// <summary> 是否正在异步加载 </summary>
        public bool isAsyncLoading;

        /// <summary> 是否为静态资源，是的话表示常驻内存 </summary>
        public bool isStatic;

        /// <summary> 是否加载了资源 </summary>
        protected bool loadedAssets;
        
        public AssetBundleCreateRequest assetBundleCreateRequest;
        
        public AssetBundleRequest assetBundleRequest;

        protected LoadedAssetBundle(Object obj, string assetBundleName) {
            this.assetBundleName = assetBundleName;
        }

        [NoToLua]
        public LoadedAssetBundle(string assetBundleName, bool asyncLoad) {
            Init(assetBundleName, asyncLoad);
        }


        /// <summary> 加载的初始化 </summary>
        [NoToLua]
        public void Init(string assetBundleName, bool asyncLoad, Action onLoaded = null) {
            this.asyncLoad = asyncLoad;
            this.assetBundleName = assetBundleName;
            referencedCount = 1;
            this.onLoaded = onLoaded;
            dependAssetBundles = null;
            mIsSpriteAtlas = assetBundleName.LastIndexOf(".atlas", StringComparison.Ordinal) > 0;    //判断最后的atlas是否为Sprite
        }

        /// <summary> 是否已完全加载(包括所有的依赖) </summary>
        public bool IsLoadedAll() {
            if (!isLoaded) {
                return isLoaded;
            }
            
            if (dependAssetBundles == null || dependAssetBundles.Length == 0) {
                return isLoaded;
            }
            
            for (int i = 0, len = dependAssetBundles.Length; i < len; ++i) {
                if (!dependAssetBundles[i].IsLoadedAll()) {
                    return false;
                }
            }
            return isLoaded;
        }

        //是否加载AssetBundle中的资源
        public virtual void LoadAllAssets() {
            if (/*loadedAssets*/ true) {
                return;
            }
            if (mIsSpriteAtlas) {
                foreach (var source in assetBundle.LoadAllAssets<Sprite>()) {
                    //加载对应的
#if DEBUG
                    if (sprites.ContainsKey(source.name)) {
                        Debug.LogError("有相同的资源名：" + source.name);
                    }
#endif

                    sprites.Add(source.name, source);
                }
                //UnloadAssetBundle();
            }
            else {
                if (assetBundleName.StartsWith("ui/")) {
                    foreach (var source in assetBundle.LoadAllAssets()) {
                        //加载对应的
                        assetObjects.Add(source.name, source);
                    }
                }
            }
            loadedAssets = true;
        }

        public virtual Object GetAsset(string assetName, bool findIndependAssetBundles) {
            if (assetBundle == null) {
                return null;
            }

            Object loadAsset;
            // Debug.Log(string.Format("Begin GetAsset: {0} | {1}", assetName, findIndependAssetBundles));
            assetObjects.TryGetValue(assetName, out loadAsset); //缓存以后的速度快好多了
            if (loadAsset == null) {
                loadAsset = assetBundle.LoadAsset(assetName);
                if (loadAsset != null) {
                    assetObjects.Add(assetName, loadAsset);
                }
            }
            if (loadAsset == null && findIndependAssetBundles && dependAssetBundles != null) {
                for (int i = 0, len = dependAssetBundles.Length; i < len; ++i) {
                    loadAsset = dependAssetBundles[i].GetAsset(assetName, true);
                    if (loadAsset != null) {
                        break;
                    }
                }
            }
            //  Debug.Log(string.Format("End GetAsset: {0} | {1}", assetName, findIndependAssetBundles));
            return loadAsset;
        }



        /// <summary> 获取资源，一定要注意资源的类型匹配 </summary>
        [NoToLua]
        public virtual T GetAsset<T>(string assetName, bool findIndependAssetBundles) where T : Object {
            if (assetBundle == null) {
                return null;
            }

            LoadAllAssets();
            T asset = null;
            bool isSprite = typeof(T) == typeof(Sprite);
            if (assetBundle != null) {
                if (isSprite) {
                    Sprite sprite;
                    if (sprites.Count == 0) {
#if UNITY_EDITOR
                        // assetBundle.GetAllAssetNames().ForEach(x => Debug.Log(x));
#endif
                        foreach (var item in assetBundle.LoadAllAssets<Sprite>()) {
                            sprites.Add(item.name, item);
                        }
                    }
                    sprites.TryGetValue(assetName, out sprite);
                    asset = sprite as T;
                } else {
                    Object loadAsset;
                    
                    assetObjects.TryGetValue(assetName, out loadAsset); //缓存以后的速度快好多了
                    if (loadAsset == null) {
                        loadAsset = assetBundle.LoadAsset(assetName, typeof(T));
                        if (loadAsset != null) {
                            asset = loadAsset as T;
                            if (asset == null) {
                                Debug.LogErrorFormat("需要加载的【{0}】类型与资源的类型【{1}】不匹配！", typeof(T), loadAsset.GetType());
                            } else {
                                assetObjects.Add(assetName, loadAsset);
                            }
                        }
                    } else {
                        asset = loadAsset as T;
                    }
                }
            }

            if (asset == null && findIndependAssetBundles && dependAssetBundles != null) {
                for (int i = 0, len = dependAssetBundles.Length; i < len; ++i) {
                    asset = dependAssetBundles[i].GetAsset<T>(assetName, true);
                    if (asset != null) {
                        break;
                    }
                }
            }
            return asset;
        }

//        public IEnumerator LoadAssetAsync(string assetName)
//        {
//            Object loadAsset;
//            assetObjects.TryGetValue(assetName, out loadAsset); //缓存以后的速度快好多了
//            if (loadAsset == null) {
//                assetBundleRequest = assetBundle.LoadAssetAsync(assetName);
//                yield return assetBundleRequest;
//                //为什么要判断呢，是因为如果有同步加载的AssetBundle逻辑
//                if (!assetObjects.ContainsKey(assetName)) {
//                    assetObjects.Add(assetName, assetBundleRequest.asset);
//                }
//
//                assetBundleRequest = null;
//            } 
//        }
        
        [NoToLua]
        public virtual void GetAssetAsync<T>(string assetName, bool findIndependAssetBundles, Action<T> loadedCallBack) where T : Object
        {
            if (assetBundle == null && loadedCallBack != null) {
                loadedCallBack(null);
                return;
            }

            T asset = null;
            Object loadAsset;
            assetObjects.TryGetValue(assetName, out loadAsset); //缓存以后的速度快好多了
            if (loadAsset == null)
            {
                MonoBehaviourDispatcher.instance.StartCoroutine(LoadAssetAsync(assetName, loadedCallBack));
            }
            else
            {
                asset = loadAsset as T;
                if (asset != null && loadedCallBack != null)
                {
                    loadedCallBack(asset);
                }
            }
        }
        
        IEnumerator LoadAssetAsync<T>(string assetName, Action<T> loadedCallBack) where T : Object
        {
            if (assetBundle == null && loadedCallBack != null) {
                loadedCallBack(null);
                yield break;
            }

            AssetBundleRequest assetBundleRequest;
            Object loadAsset;
            assetObjects.TryGetValue(assetName, out loadAsset); //缓存以后的速度快好多了
            if (loadAsset == null) {
                assetBundleRequest = assetBundle.LoadAssetAsync<T>(assetName);
                yield return assetBundleRequest;
                loadAsset = assetBundleRequest.asset;
            } 
            T asset = loadAsset as T;
            if (asset != null && loadedCallBack != null)
            {
                loadedCallBack(asset);
            }
        }
        

        public void Reset() {
            assetBundleName = null;
            erroMsg = null;
            assetBundle = null;
            dependAssetBundles = null;
            referencedCount = 0;
            onLoaded = null;
            isLoaded = false;
            mIsSpriteAtlas = false;
            loadedAssets = false;
            cacheGameObject = null;
            assetBundleCreateRequest = null;
            if (sprites != null) {
                sprites.Clear();
            }
            if (assetObjects != null) {
                assetObjects.Clear();
            }
            asyncLoad = false;
            isAsyncLoading = false;
        }

        public void UnloadAssetBundle(bool unloadAllLoadedObjects = false) {
            if (assetBundle != null) {
                //Debug.LogWarning("UnloadAssetBundle:<color=yellow>" + assetBundleName + "</color>");
                assetBundle.Unload(unloadAllLoadedObjects);
            }
            //assetBundle = null;
        }
    }

}
