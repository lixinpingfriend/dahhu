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

    public class SimulateLoadedAssetBundle : LoadedAssetBundle {
        //readonly Dictionary<string, Object> mAssetObjects = new Dictionary<string, Object>();

        public SimulateLoadedAssetBundle(Object obj, string assetBundleName) : base(obj, assetBundleName) {
#if UNITY_EDITOR
            if (assetObjects == null) {
                assetObjects = new Dictionary<string, Object>();
            }

            if (sprites == null) {
                sprites = new Dictionary<string, Sprite>();
            }
#endif
        }

        public override void LoadAllAssets() {
#if UNITY_EDITOR
            if (loadedAssets) {
                return;
            }

            string[] assetPaths = AssetDatabase.GetAssetPathsFromAssetBundle(assetBundleName);
            if (assetPaths.Length != 0) {
                foreach (var path in assetPaths) {
                    if (path.EndsWith(".png") || path.EndsWith(".jpg")) {
                        var assets = AssetDatabase.LoadAllAssetsAtPath(path);
                        foreach (var tmp in assets) {
                            Sprite spriteTmp = tmp as Sprite;
 
                            if (spriteTmp != null) {
                                if (!sprites.ContainsKey(tmp.name)) {
                                    sprites.Add(tmp.name, spriteTmp);
                                } else {
                                    //Debug.LogError("有重复的资源：" + tmpLowerName);
                                }
                            }
                        }
                    } else if (path.EndsWith(".prefab")) {
                        var assets = AssetDatabase.LoadMainAssetAtPath(path);
                        if (assets is GameObject) {
                            assetObjects.Add(assets.name, assets);
                        }
                    }
                }
            } 
#endif
            loadedAssets = true;
        }


        public override Object GetAsset(string assetName, bool findIndependAssetBundles) {
#if UNITY_EDITOR
            Object asset = GetAssetByAssetDataBase(this.assetBundleName, assetName, null);
            if (asset != null) {
                return asset;
            }

            if (findIndependAssetBundles && dependAssetBundles != null) {
                for (int i = 0, len = dependAssetBundles.Length; i < len; ++i) {
                    asset = dependAssetBundles[i].GetAsset(assetName, true);
                    if (asset != null) {
                        break;
                    }
                }
            }
            return asset;
#else
            return null;
#endif
        }

        [NoToLua]
        public override T GetAsset<T>(string assetName, bool findIndependAssetBundles) {
#if UNITY_EDITOR
            T asset = GetAssetByAssetDataBase(this.assetBundleName, assetName, typeof(T)) as T;
            if (asset != null) {
                return asset;
            }

            if (findIndependAssetBundles && dependAssetBundles != null) {
                for (int i = 0, len = dependAssetBundles.Length; i < len; ++i) {
                    asset = dependAssetBundles[i].GetAsset<T>(assetName, true);
                    if (asset != null) {
                        break;
                    }
                }
            }
            return asset;
#else
            return null;
#endif
        }

        Object GetAssetByAssetDataBase(string assetBundleName, string assetName, Type type) {
#if UNITY_EDITOR
            LoadAllAssets();
            bool isSprite = type == typeof(Sprite);
            if (isSprite) {
                Sprite sprite;
                if (sprites.TryGetValue(assetName, out sprite)) {
                    return sprite;
                }
                return null;
            }

            Object loadAsset;
            if (assetObjects.TryGetValue(assetName, out loadAsset)) {
                //缓存以后的速度快好多了,主要是加载Prefab等 
                return loadAsset;
            }

            string[] assetPaths = AssetDatabase.GetAssetPathsFromAssetBundleAndAssetName(assetBundleName, assetName);
            if (assetPaths.Length != 0) {
                foreach (var path in assetPaths) {
                    if (loadAsset == null) {
                        var assets = AssetDatabase.LoadMainAssetAtPath(path);
                        if (assets != null && assets.name == assetName) {
                            loadAsset = assets;
                            assetObjects.Add(assetName, assets);
                        }
                    }
                }
                return loadAsset;
            } 
#endif
            return null;
        }
    }

}
