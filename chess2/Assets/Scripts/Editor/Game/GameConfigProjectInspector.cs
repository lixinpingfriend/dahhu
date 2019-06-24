

using System;
using UnityEngine;


#if UNITY_EDITOR
using UnityEditor;
#endif
using System.Collections.Generic;

[CustomEditor(typeof(GameConfigProject))]
public class GameConfigInspector : Editor
{
    GameConfigProject mConfig;


    void OnEnable()
    {
        mConfig = target as GameConfigProject;
    }
    
    public override void OnInspectorGUI()
    {
        
        if (GameEditorTools.DrawHeader("网络设置")) {
            GameEditorTools.BeginContents();
            mConfig.net.httpApiUrl = EditorGUILayout.TextField("api地址", mConfig.net.httpApiUrl);
            GUILayout.BeginHorizontal();
            GUI.color = Color.cyan;
            GUILayout.Label("api服务器地址");
            var lastIpAdressType = mConfig.net.ipAdressType;
            mConfig.net.ipAdressType = (GameConfigNet.IPAdress)EditorGUILayout.Popup((int)mConfig.net.ipAdressType, mConfig.net.ipAdressTypeName);
            GUI.color = Color.white;
            GUILayout.EndHorizontal();
            // if (mConfig.net.ipAdressType == GameConfigNet.IPAdress.Userdefined) {
            //     mConfig.net.loginServerIp = EditorGUILayout.TextField("服务器IP", mConfig.net.loginServerIp);
            //     mConfig.net.loginPort = EditorGUILayout.IntField("服务器Port", mConfig.net.loginPort);
            // } else {
            //     GUI.enabled = false;
            //     EditorGUILayout.TextField("服务器IP", mConfig.net.loginServerIp);
            //     EditorGUILayout.IntField("服务器Port", mConfig.net.loginPort);
            //     GUI.enabled = true;
            // }
            GameEditorTools.EndContents();
            if (lastIpAdressType != mConfig.net.ipAdressType) {
                mConfig.SetIPAdress(mConfig.net.ipAdressType);
            }
        }
        
        if (GameEditorTools.DrawHeader("游戏设置")) {
            GameEditorTools.BeginContents();
            GUI.color = Color.cyan;
            mConfig.showPackage = EditorGUILayout.TextField("显示Package", mConfig.showPackage);
            mConfig.customData = EditorGUILayout.TextField("自定义数据", mConfig.customData);
            mConfig.developmentMode = EditorGUILayout.Toggle("开发者模式", mConfig.developmentMode);
            mConfig.testView = EditorGUILayout.Toggle("测试View(不运行游戏)", mConfig.testView);
            mConfig.isIosEnterprise = EditorGUILayout.Toggle("是否为iOS企业版本", mConfig.isIosEnterprise);
            if (string.IsNullOrEmpty(mConfig.channel))
            {
                mConfig.channel = Channel.Official.ToString();
            }
            Channel channel = (Channel)Enum.Parse(typeof(Channel), mConfig.channel);
            channel = (Channel)EditorGUILayout.EnumPopup("渠道", channel);
            mConfig.channel = channel.ToString();
            GUI.color = Color.white;

            GUI.enabled = false;
            EditorGUILayout.TextField("应用版本号", Application.version);
            GUI.enabled = true;
            GameEditorTools.EndContents();
        }

        if (GameEditorTools.DrawHeader("资源设置")) {
            GameEditorTools.BeginContents();
            mConfig.assetBundleFilePathEncrypt = EditorGUILayout.Toggle("资源路径加密)", mConfig.assetBundleFilePathEncrypt);
            mConfig.luaScriptProcess = EditorGUILayout.Toggle("lua代码加密)", mConfig.luaScriptProcess);
#if UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN
            mConfig.assetBundleFilePathEncrypt = false;
#elif UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN
#endif
            GameConfigProject.LoadType loadType = (GameConfigProject.LoadType)EditorGUILayout.EnumPopup("加载方式", (GameConfigProject.LoadType)mConfig.assetLoadType);
            if (mConfig.assetLoadType != (int)loadType) {
                mConfig.assetLoadType = (int)loadType;
                EditorPrefs.SetInt("SimulateAssetBundles", (int)loadType);
            }
            //GameConfigAssets.AssetBundleCompressType assetBundleCompressType = (GameConfigAssets.AssetBundleCompressType)EditorGUILayout.EnumPopup("AssetBundle压缩方式", mConfig.assets.assetBundleCompressType);
            //if (mConfig.assets.assetBundleCompressType != assetBundleCompressType)
            //{
            //    mConfig.assets.assetBundleCompressType = assetBundleCompressType;
            //    EditorPrefs.SetInt("AssetBundleCompressType", (int)assetBundleCompressType);
            //}
            //EditorGUILayout.LabelField("资源地址", mConfig.assets.httpResourcesServerUrl);
            GameEditorTools.EndContents();
        }

        if (GameEditorTools.DrawHeader("Log显示设置")) {
            GameEditorTools.BeginContents();
            mConfig.netClientStateLogShow = EditorGUILayout.Toggle("C#网络连接log显示", mConfig.netClientStateLogShow);
            mConfig.netLogSendServerShow = EditorGUILayout.Toggle("C#收发包命令显示", mConfig.netLogSendServerShow);
            mConfig.netTransferDataShow = EditorGUILayout.Toggle("Lua收发包内容显示", mConfig.netTransferDataShow);
            mConfig.commonLogShow = EditorGUILayout.Toggle("普通Log显示", mConfig.commonLogShow);
            mConfig.warningLogShow = EditorGUILayout.Toggle("普通警告显示", mConfig.warningLogShow);
            mConfig.errorLogShow = EditorGUILayout.Toggle("普通错误显示", mConfig.errorLogShow);
            GameEditorTools.EndContents();
        }
    }

}
