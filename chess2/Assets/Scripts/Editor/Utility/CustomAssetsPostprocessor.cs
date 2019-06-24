

using System;
#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine;

class CustomPostprocessor : AssetPostprocessor
{
    /// <summary> 删除空文件夹 </summary>
    static void DeleteEmptyFolder()
    {
        AssetDatabase.DeleteAsset("Assets/Mesh Explosion"); //一定要注意不加最后面的/符号
        AssetDatabase.DeleteAsset("Assets/Shader");
        AssetDatabase.DeleteAsset("Assets/Scripts/Editor");
        AssetDatabase.DeleteAsset("Assets/Scripts/ScriptPublic");
        AssetDatabase.DeleteAsset("Assets/ThirdLibs/PlayModePersist");
        AssetDatabase.DeleteAsset("Assets/Plugins/GameScripts");
        AssetDatabase.DeleteAsset("Assets/Game/Animation/Role/BackUp");
        AssetDatabase.DeleteAsset("Assets/Resources/Sequence");
        AssetDatabase.DeleteAsset("Assets/Plugins/Behavior Designer");
        AssetDatabase.DeleteAsset("Assets/ThirdLibs/Behavior Designer");
    }

    static int count = 1;

    /// <summary> 在导入所有资源之后,相比其它的回调函数是最后执行,在一些资源被导入后调用(当资源进度条到达末端) </summary>
    static void OnPostprocessAllAssets(string[] importedAssets, string[] deletedAssets, string[] movedAssets,
        string[] movedFromAssetPaths)
    {
        bool needRefresh = false;
        //AssetDatabase.RemoveUnusedAssetBundleNames();
        foreach (var item in importedAssets)
        {
            //needRefresh = ProcessGameDllAssets(item) | needRefresh;
            needRefresh = ProcessAssetImport(item) | needRefresh;
            needRefresh = mj3dTools.OnPostprocessMj3dSkinAssets(item) | needRefresh;
        }

        if (needRefresh)
        {
            AssetDatabase.Refresh();
        }
    }


    /// <summary>
    /// 自动出来资源导入
    /// </summary>
    public static bool ProcessAssetImport(string name)
    {
        if (name.EndsWith(".dds"))
        {
            if (EditorUtility.DisplayDialog("出现了dds格式的纹理，这是不允许的！不要问为什么。", name, "删除"))
            {
                AssetDatabase.DeleteAsset(name);
            }
            else
            {
                AssetDatabase.DeleteAsset(name);
            }

            return false;
        }

        if (!name.Contains("/Custom/") && (name.EndsWith(".png") || name.EndsWith(".jpg")))
        {
            TextureImporter textureImporter = AssetImporter.GetAtPath(name) as TextureImporter;
            bool customSetting = false;
            AssetDatabase.GetLabels(textureImporter).ForEach((x) =>
            {
                if (x == "TextureImporterFormatCustomSetting")
                {
                    customSetting = true;
                }
            });

            if (!customSetting)
            {
                textureImporter.spriteImportMode = SpriteImportMode.Single;
                textureImporter.alphaIsTransparency = true;
                if (textureImporter != null)
                {
                    textureImporter.mipmapEnabled = false;
                    textureImporter.wrapMode = TextureWrapMode.Clamp;
                    if (name.StartsWith("Assets/Game/PackagingResources/") && (name.Contains("/Module/") || name.Contains("/Effect")) && name.Contains("/Image/"))
                    {

                        bool needSaveAndReimport = false;

                        if (textureImporter.textureType != TextureImporterType.Sprite)
                        {
                            textureImporter.textureType = TextureImporterType.Sprite;
//                            if (name.EndsWith(".jpg"))
//                            {
//                                textureImporter.alphaSource = TextureImporterAlphaSource.None;
//                            }
                            needSaveAndReimport = true;
                        }
                        
                        needSaveAndReimport |= ProcessIosAssetSpriteImport(textureImporter);
                        needSaveAndReimport |= ProcessAndroidAssetSpriteImport(textureImporter);
                        if (needSaveAndReimport)
                        {
                            textureImporter.SaveAndReimport();
                        }
                    }
                    else if (name.Contains("/ModuleEffectPicture/"))
                    {
                        if (name.EndsWith(".jpg"))
                        {
                            textureImporter.alphaSource = TextureImporterAlphaSource.FromInput;
                        }

                        if (textureImporter.textureType != TextureImporterType.Sprite)
                        {
                            textureImporter.textureType = TextureImporterType.Sprite;
                            textureImporter.SaveAndReimport();
                        }
                    }
                }
            }
        }

        return EditorAssetBundleEditorTool.AutoProcessAsset(name);
    }

    public static bool ProcessIosAssetSpriteImport(TextureImporter textureImporter)
    {
        string name = textureImporter.name;
        int maxTextureSize;
        TextureImporterFormat textureFormat;
        int compressionQuality;
        bool needSaveAndReimport = false;
        bool needOverride = false;
        bool isAlpha = true;
        TextureImporterFormat targetTextureImporterFormat = TextureImporterFormat.ETC2_RGBA8;

        if (textureImporter.alphaSource != TextureImporterAlphaSource.FromInput)
        {
            textureImporter.alphaSource = TextureImporterAlphaSource.FromInput;
            needOverride = true;
        }
        
        if (!textureImporter.DoesSourceTextureHaveAlpha())
        {
            isAlpha = false;
        }

        if (textureImporter.GetPlatformTextureSettings("iPhone", out maxTextureSize, out textureFormat, out compressionQuality))
        {
            if (isAlpha)
            {
                string[] labs = AssetDatabase.GetLabels(textureImporter);
                if (labs.Length >= 1)
                {
                    AssetDatabase.GetLabels(textureImporter).ForEach((x) =>
                    {
                        if (x == "TextureImporterFormat_PVRTC_RGBA4")
                        {
                            targetTextureImporterFormat = TextureImporterFormat.PVRTC_RGBA4;
                        }
                    });
                }
            }
            else
            {
                targetTextureImporterFormat = TextureImporterFormat.ETC2_RGBA8;
                AssetDatabase.GetLabels(textureImporter).ForEach((x) =>
                {
                    if (x == "TextureImporterFormat_PVRTC_RGBA4")
                    {
                        targetTextureImporterFormat = TextureImporterFormat.PVRTC_RGB4;
                    }
                });
            }
            if (textureFormat != targetTextureImporterFormat)
            {
                needOverride = true;
            }
        }
        else
        {
            //这个代表是新图需要设置ios的图片格式
            needOverride = true;
            targetTextureImporterFormat = TextureImporterFormat.ETC2_RGBA8;
            if (isAlpha)
            {
                AssetDatabase.GetLabels(textureImporter).ForEach((x) =>
                {
                    if (x == "TextureImporterFormat_PVRTC_RGBA4")
                    {
                        targetTextureImporterFormat = TextureImporterFormat.PVRTC_RGBA4;
                    }
                });
            }
            else
            {
                targetTextureImporterFormat = TextureImporterFormat.ETC2_RGB4;
                AssetDatabase.GetLabels(textureImporter).ForEach((x) =>
                {
                    if (x == "TextureImporterFormat_PVRTC_RGBA4")
                    {
                        targetTextureImporterFormat = TextureImporterFormat.PVRTC_RGB4;
                    }
                });
            }
        }

        if (needOverride)
        {
            TextureImporterPlatformSettings setting = new TextureImporterPlatformSettings();
            setting.overridden = true;
            setting.name = "iPhone";
            // setting.textureCompression = TextureImporterCompression.CompressedHQ;
            setting.crunchedCompression = false;
            setting.maxTextureSize = 2048;
            setting.compressionQuality = 50;
            setting.format = targetTextureImporterFormat;
            textureImporter.SetPlatformTextureSettings(setting);
        }

        return needOverride;
    }
    
    public static bool ProcessAndroidAssetSpriteImport(TextureImporter textureImporter)
    {
        bool needOverride = false;
        if (textureImporter.alphaSource != TextureImporterAlphaSource.FromInput)
        {
            textureImporter.alphaSource = TextureImporterAlphaSource.FromInput;
            needOverride = true;
        }
        
        if (!needOverride && textureImporter.DoesSourceTextureHaveAlpha())
        {
            return false;
        }
        
        int maxTextureSize;
        TextureImporterFormat textureFormat;
        int compressionQuality;

        TextureImporterFormat targetTextureImporterFormat = TextureImporterFormat.ETC2_RGB4;
        if (!textureImporter.GetPlatformTextureSettings("Android", out maxTextureSize, out textureFormat, out compressionQuality))
        {
            needOverride = true;
        }

        if (textureFormat != targetTextureImporterFormat)
        {
            needOverride = true;
        }

        if (needOverride)
        {
            TextureImporterPlatformSettings setting = new TextureImporterPlatformSettings();
            setting.overridden = true;
            setting.name = "Android";
            setting.crunchedCompression = false;
            setting.maxTextureSize = 2048;
            setting.compressionQuality = 50;
            setting.format = targetTextureImporterFormat;
            textureImporter.SetPlatformTextureSettings(setting);
        }
        return needOverride;
    }


    void OnPreprocessTexture()
    {
        //string regexText = @"Assets/Game/Module/UI/\w/";

        //if (assetPath.StartsWith("Assets/Game/Module/UI/")) {   //处理Texture的格式，并默认设置AssetBundle名字
        //    TextureImporter textureImporter = (TextureImporter)assetImporter;
        //    if (textureImporter.textureType == TextureImporterType.Sprite || textureImporter.textureType == TextureImporterType.Advanced) {
        //        return;
        //    }
        //    string spritePackingTagName = assetPath.Replace("Assets/Game/Module/UI/", "");
        //    spritePackingTagName = spritePackingTagName.Substring(0, spritePackingTagName.IndexOf("/", StringComparison.Ordinal));
        //    textureImporter.textureType = TextureImporterType.Sprite;
        //    textureImporter.spriteImportMode = SpriteImportMode.Single;
        //    textureImporter.spritePackingTag = spritePackingTagName;
        //    textureImporter.mipmapEnabled = false;
        //    textureImporter.filterMode = FilterMode.Bilinear;
        //    textureImporter.maxTextureSize = 2048;
        //    textureImporter.textureFormat = TextureImporterFormat.AutomaticTruecolor;
        //    textureImporter.assetBundleName = string.Format("ui/{0}/{1}.atlas", spritePackingTagName, spritePackingTagName);
        //}
    }

    void OnPreprocessAudio()
    {
        AudioImporter audioImporter = (AudioImporter) assetImporter;
        AudioClip audioClip = AssetDatabase.LoadAssetAtPath<AudioClip>(audioImporter.assetPath);
        if (audioClip != null)
        {
            if (audioImporter.defaultSampleSettings.loadType != AudioClipLoadType.CompressedInMemory && audioClip.length > 1.5)
            {
                var defaultSampleSettings = audioImporter.defaultSampleSettings;
                defaultSampleSettings.loadType = AudioClipLoadType.CompressedInMemory;
                audioImporter.defaultSampleSettings = defaultSampleSettings;
                defaultSampleSettings.quality = 0.7f;
                audioImporter.SaveAndReimport();
            }
//            else if (audioImporter.defaultSampleSettings.quality > 0.72) {
//                var defaultSampleSettings = audioImporter.defaultSampleSettings;
//                defaultSampleSettings.quality = 0.7f;
//                audioImporter.SaveAndReimport();
//            }
        }

        // if (assetPath.Contains("mono")) {
        //     // var audioImporter : AudioImporter = assetImporter;
        //     audioImporter.forceToMono = true;
        // }
    }

    //public void OnPostprocessAssetbundleNameChanged(string assetPath, string previousAssetBundleName, string newAssetBundleName) {
    //    Debug.Log("Asset " + assetPath + " has been moved from assetBundle " + previousAssetBundleName + " to assetBundle " + newAssetBundleName + ".");
    //}
}