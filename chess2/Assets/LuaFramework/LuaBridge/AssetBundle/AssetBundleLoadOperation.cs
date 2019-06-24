using System;
using UnityEngine;
using System.Collections;
using System.Security.Permissions;

namespace GameAsset
{
    public abstract class AsyncOperation : IEnumerator
    {
        public object Current {
            get { return null; }
        }

        public bool MoveNext() {
            return !IsDone();
        }

        public void Reset() {}

        public abstract bool IsDone();
    }


    public abstract class AssetBundleAsyncOperation : AsyncOperation {
        public abstract T GetAsset<T>(string assetname, bool findIndependAssetBundles) where T : UnityEngine.Object;
        public abstract void UnLoad(bool unloadAllLoadedObjects = false);
        public virtual LoadedAssetBundle loadedAssetBundle { get; protected set; }
    }

    public class LoadedAssetBundleAsyncOperation : AssetBundleAsyncOperation
    {
        public override LoadedAssetBundle loadedAssetBundle { get; protected set; }

        private AssetBundleCreateRequest mAssetBundleCreateRequest;

        private bool mAssetBundleAllLoaded;


        public LoadedAssetBundleAsyncOperation(LoadedAssetBundle assetBundle)
        {
            loadedAssetBundle = assetBundle;
            loadedAssetBundle.isAsyncLoading = true;
            loadedAssetBundle.isLoaded = false;
            mAssetBundleCreateRequest = AssetBundleManager.LoadAssetBundleFromFileAsync(assetBundle.assetBundleName);
        }


        public override T GetAsset<T>(string assetname, bool findIndependAssetBundles)
        {
#if UNITY_EDITOR
            if (assetname.Contains("."))
            {
                Debug.LogErrorFormat("获取的资源{0}含有后缀名！请去掉。", assetname);
            }
#endif
            if (loadedAssetBundle == null)
            {
                return null;
            }

            return loadedAssetBundle.GetAsset<T>(assetname, true);
        }

        public override void UnLoad(bool unloadAllLoadedObjects = false)
        {
            if (!loadedAssetBundle.IsLoadedAll())
            {
                //待完成之后就卸载
                loadedAssetBundle.onLoaded = () =>
                    AssetBundleManager.instance.UnLoadLoadedAssetBundle(loadedAssetBundle, unloadAllLoadedObjects);
            }
            else
            {
                AssetBundleManager.instance.UnLoadLoadedAssetBundle(loadedAssetBundle, unloadAllLoadedObjects);
                loadedAssetBundle = null;
            }
        }

        public override bool IsDone()
        {

            if (!loadedAssetBundle.isLoaded && mAssetBundleCreateRequest != null)
            {
                loadedAssetBundle.isLoaded = mAssetBundleCreateRequest.isDone;
            }

            mAssetBundleAllLoaded = loadedAssetBundle.IsLoadedAll();

            if (mAssetBundleAllLoaded)
            {
                if (loadedAssetBundle.assetBundle == null)
                {
                    loadedAssetBundle.assetBundle = mAssetBundleCreateRequest.assetBundle;
                }
                else
                {
#if DEBUG
                    Debug.LogError("已经使用同步方法加载完成" + loadedAssetBundle.assetBundleName);
#endif
                }

                mAssetBundleCreateRequest = null;
#if DEBUG
//                Debug.LogFormat("异步加载完成 {0} - {1} | {2}", Time.frameCount, Time.realtimeSinceStartup, loadedAssetBundle.assetBundleName);
#endif
            }

            return mAssetBundleAllLoaded;
        }
    }
}
