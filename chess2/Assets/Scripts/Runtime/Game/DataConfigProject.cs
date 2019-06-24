

using System;
using System.Collections.Generic;
using UnityEngine;

public class DataConfigProject
{
#if UNITY_EDITOR
    public static string externalAssetBundlePath {
        get {
            return string.Format("{0}/AssetBundles/{1}/", Application.dataPath.Replace("/Assets", ""), platform);
        }
    }

    public static string externalAssetBundlePathCompression {
        get {
            return string.Format("{0}/AssetBundles/{1}/{1}Compression/", Application.dataPath.Replace("/Assets", ""), platform);
        }
    }

    public static string externalAssetBundlePathUnCompression {
        get {
            return string.Format("{0}/AssetBundles/{1}/{1}UnCompression/", Application.dataPath.Replace("/Assets", ""), platform);
        }
    }


    public static string externalAssetBundleVersionPath {
        get {
            return string.Format("{0}/AssetBundles/{1}/{1}Version/", Application.dataPath.Replace("/Assets", ""), platform);
        }
    }


    public static string hostHttpServer {
        get {
            return string.Format("{0}/AssetBundles/{1}/HttpServer/", Application.dataPath.Replace("/Assets", ""), platform);
        }
    }
#endif

    public static string platform {
        get {
#if UNITY_EDITOR
            switch (UnityEditor.EditorUserBuildSettings.activeBuildTarget) {
                case UnityEditor.BuildTarget.Android:
                    return "Android";
                case UnityEditor.BuildTarget.iOS:
                    return "iOS";
                case UnityEditor.BuildTarget.StandaloneWindows:
                case UnityEditor.BuildTarget.StandaloneWindows64:
                    return "Windows";
                case UnityEditor.BuildTarget.StandaloneOSXIntel:
                case UnityEditor.BuildTarget.StandaloneOSXIntel64:
                case UnityEditor.BuildTarget.StandaloneOSX:
                    return "OSX";
                // Add more build targets for your own.
                // If you add more targets, don't forget to add the same platforms to GetPlatformFolderForAssetBundles(RuntimePlatform) function.
                default:
                return null;
            }
#else
            switch (Application.platform)
            {
                case RuntimePlatform.WindowsEditor:
                    return "Windows";
                case RuntimePlatform.Android:
                    return "Android";
                case RuntimePlatform.IPhonePlayer:
                    return "iOS";
                case RuntimePlatform.WindowsPlayer:
                    return "Windows";
                case RuntimePlatform.OSXPlayer:
                    return "OSX";
                default:
                    return null;
            }
#endif
        }
    }
}

