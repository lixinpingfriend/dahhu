using System;
using System.Collections;
using System.Collections.Generic;
using GameAsset;
using LuaInterface;
using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif

public class DynamicPrefable  : MonoBehaviour {

    public string assetBundlePath;

    public string prefableName;

    //延迟加载的时间
    public float delayLoadTime;

    //异步加载
    public bool asyncLoad;

    public bool awakeLoad = false;

    public Action<GameObject> onLoaded;

    public GameObject targetGameObject;

    bool mIsLoad;


    void Awake() {
        if (awakeLoad && targetGameObject == null) {
            if (delayLoadTime > 0.0001) {
                StartCoroutine(StartLoad());
            } else {
                Load();
            }
        }
    }

    void OnEnable() {
        if (!awakeLoad && targetGameObject == null) {
            if (delayLoadTime > 0.0001) {
                StartCoroutine(StartLoad());
            } else {
                Load();
            }
        }
    }

    IEnumerator StartLoad() { 
        if (mIsLoad) {
            yield break;
        }

        if (delayLoadTime > 0.0001) {
            yield return new WaitForSeconds(delayLoadTime);
        }
        Load();
    }


    void Load() {
        if (!asyncLoad) {
            var loadedAssetBundle = AssetBundleManager.instance.LoadAssetBundle(assetBundlePath);
            targetGameObject = ComponentUtil.InstantiateLocal(loadedAssetBundle.GetAsset<GameObject>(prefableName, false), gameObject);
            if (onLoaded != null) {
                onLoaded(targetGameObject);
            }
            #if UNITY_EDITOR
                foreach (Transform t in targetGameObject.GetComponentsInChildren<Transform>(true)) {
                    t.gameObject.hideFlags = HideFlags.NotEditable | HideFlags.DontSave;
                }
            #endif
        } else {
            AssetBundleManager.instance.LoadAssetBundleAsync(assetBundlePath, prefableName, x =>
            {
                x.GetAssetAsync<GameObject>(prefableName, false, y =>
                {
                    if (y != null) {
                        targetGameObject = UnityEngine.Object.Instantiate(y, transform);
                        if (onLoaded != null) {
                            onLoaded(targetGameObject);
                        }
                        #if UNITY_EDITOR
                            foreach (Transform t in targetGameObject.GetComponentsInChildren<Transform>(true)) {
                                t.gameObject.hideFlags = HideFlags.NotEditable | HideFlags.DontSave;
                            }
                        #endif
                    }

                });
            });
        }
        mIsLoad = true;
    }






    #if UNITY_EDITOR

    [NoToLua]
    public string assetPath;
    [NoToLua]
    public GameObject originGameObject;
    [NoToLua]
    public void Prview() {
        if (!EditorApplication.isPlaying) {
            while(transform.childCount > 0){
            	GameObject.DestroyImmediate (transform.GetChild(0).gameObject);
            }
            string[] assetPaths = AssetDatabase.GetAssetPathsFromAssetBundle(assetBundlePath);
            if (assetPaths.Length > 0)
            {
                assetPath = assetPaths[0];
                originGameObject = AssetDatabase.LoadMainAssetAtPath(assetPath) as GameObject;
                targetGameObject = UnityEngine.Object.Instantiate(originGameObject, transform);
                #if UNITY_EDITOR
                    foreach (Transform t in targetGameObject.GetComponentsInChildren<Transform>(true)) {
                        t.gameObject.hideFlags = HideFlags.NotEditable | HideFlags.DontSave;
                    }
                #endif
            }

        }
    }
    #endif
}
