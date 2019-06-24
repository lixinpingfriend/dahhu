using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using UGUIExtend;
using UnityEngine.UI;
using System.IO;
using System.Text;
using System;
namespace ParametersReplace
{

    public enum HeadState
    {
        Nomal, Edit, None,
    }
    public class ParametersReplaceWindow : EditorWindow
    {
        private static ParametersReplaceWindow _window = null;

        static string[] config;


        static GameParameters gamePrameters;
        public static ParametersReplaceWindow window
        {
            get
            {
                if (_window == null)
                    Init();
                return _window;
            }
        }
        [MenuItem("Tools/设置游戏参数/全部替换 ", false, 2)]
        public static void ReplaceAll()
        {
            Init();
            SetManifest();
            SetConfigInfo();
            modifyEditorPackageName();
            Debug.Log("全部替换 Success ");
        }

        [MenuItem("Tools/设置游戏参数/设置游戏名与包名 ", false, 2)]
        public static void SetPackageName()
        {
            Init();
            modifyEditorPackageName();
            Debug.Log("设置游戏名与包名 Success");
        }
        [MenuItem("Tools/设置游戏参数/替换androidmanifest参数 ", false, 2)]
        public static void replaceManifest()
        {
            Init();
            SetManifest();
            Debug.Log("替换androidmanifest参数 Success");
        }
        [MenuItem("Tools/设置游戏参数/替换configinfo参数 ", false, 2)]
        public static void replaceConfigInfo()
        {
            Init();
            SetConfigInfo();
            Debug.Log("替换configinfo参数 Success");
        }

        static void Init()
        {
            gamePrameters = new GameParameters();
            LoadPrameters();
        }

        static void LoadPrameters()
        {
            config = File.ReadAllLines("Assets/LuaFramework/lua/const/game_parameters.lua");
            for (int i = 0; i < config.Length; i++)
            {
                string str = config[i];
                if (str.Contains("GameName"))
                {
                    gamePrameters.gameName = SetParameters(str);
                }
                else if (str.Contains("PackageName"))
                {
                    gamePrameters.packageName = SetParameters(str);
                }
                else if (str.Contains("WECHAT_APPID"))
                {
                    gamePrameters.wechatAppid = SetParameters(str);
                }
                else if (str.Contains("Andoird_BUGLY_APPID"))
                {
                    gamePrameters.andoird_BUGLY_APPID = SetParameters(str);
                }
                else if (str.Contains("Ios_BUGLY_APPID"))
                {
                    gamePrameters.ios_BUGLY_APPID = SetParameters(str);
                }
                else if (str.Contains("AndroidAmapApiKey"))
                {
                    gamePrameters.androidAmapApiKey = SetParameters(str);
                }
                else if (str.Contains("IosAmapApiKey"))
                {
                    gamePrameters.iosAmapApiKey = SetParameters(str);
                }
                else if (str.Contains("TalkingData_APPID"))
                {
                    gamePrameters.talkingData_APPID = SetParameters(str);
                }
                else if (str.Contains("AndroidChannel"))
                {
                    gamePrameters.androidChannel = SetParameters(str);
                }
                else if (str.Contains("IosChannel"))
                {
                    gamePrameters.iosChannel = SetParameters(str);
                }
                else if (str.Contains("JPUSH_APPKEY"))
                {
                    gamePrameters.JPUSH_APPKEY = SetParameters(str);
                }
                else if (str.Contains("OpeninstallKey"))
                {
                    gamePrameters.openinstallKey = SetParameters(str);
                }
                else if (str.Contains("HTTPDNS_AccountID"))
                {
                    gamePrameters.HTTPDNS_AccountID = SetParameters(str);
                }
                else if (str.Contains("HTTPDNS_PreResolveHosts"))
                {
                    gamePrameters.HTTPDNS_PreResolveHosts = SetParameters(str);
                }
                else if (str.Contains("Android_MW_APPID"))
                {
                    gamePrameters.android_MW_APPID = SetParameters(str);
                }
                else if (str.Contains("Ios_MW_APPID"))
                {
                    gamePrameters.ios_MW_APPID = SetParameters(str);
                }
                else if (str.Contains("Android_MW_CHANNEL"))
                {
                    gamePrameters.android_MW_CHANNEL = SetParameters(str);
                }
                else if (str.Contains("ALIPAY_APPID"))
                {
                    gamePrameters.alipayAppid = SetParameters(str);
                }
                else if (str.Contains("XIANLIAO_APPID"))
                {
                    gamePrameters.xianliaoAppid = SetParameters(str);
                }
            }
            Debug.Log("parameter load success");
        }

        static void SetConfigInfo()
        {
            string filepath = "Assets/Plugins/iOS/SDKInterface/ConfigInfo.h";
            string[] infostr = File.ReadAllLines(filepath);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < infostr.Length; i++)
            {
                string str = infostr[i];
                if (i == 0)
                {
                    if (str == "")
                    {
                        sb.AppendFormat("//auto generated by editor {0}\r\n", DateTime.Now.ToString());
                    }
                    else if (str.Contains("auto"))
                    {
                        sb.AppendFormat("//auto generated by editor {0}\r\n", DateTime.Now.ToString());
                    }
                    else
                    {
                        sb.AppendFormat("//auto generated by editor {0}", DateTime.Now.ToString());
                        sb.AppendLine(str);
                    }
                }
                else if (i == infostr.Length - 1)
                {
                    if (str == "")
                    {
                        sb.AppendFormat("//auto generated by editor end {0}", DateTime.Now.ToString());
                    }
                    else if (str.Contains("auto"))
                    {
                        sb.AppendFormat("//auto generated by editor end {0}", DateTime.Now.ToString());
                    }
                    else
                    {
                        sb.AppendLine(str);
                        sb.AppendFormat("//auto generated by editor end {0}=", DateTime.Now.ToString());
                    }
                }
                else {
                    if (str.Contains("Bugly_APPID"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.ios_BUGLY_APPID));                        
                    }else if (str.Contains("AMapServices_Key"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.iosAmapApiKey));
                    }
                    else if (str.Contains("MW_APIKey"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.ios_MW_APPID));
                    }

                    else if (str.Contains("TalkingData_APPID"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.talkingData_APPID));
                    }
                    else if (str.Contains("Channel"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.iosChannel));
                    }
                    else if (str.Contains("JiGuang_APIKey"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.JPUSH_APPKEY));
                    }
                    else if (str.Contains("ALIPAY_APPID"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.alipayAppid));
                    }
                    else if (str.Contains("XIANLIAO_APPID"))
                    {
                        sb.AppendLine(SetAppInfoLine(str, gamePrameters.xianliaoAppid));
                    }
                    else if (str.Contains("HTTPDNS_AccountID"))
                    { 
                        string newstr = "";
                        string[] s = str.Split(new char[] { '=' });
                        newstr = string.Format("{0}={1};", s[0], gamePrameters.HTTPDNS_AccountID);
                        sb.AppendLine(newstr);
                    }
                    else if (str.Contains("HTTPDNS_PreResolveHosts"))
                    {
                        string newstr = "";
                        string[] s = str.Split(new char[] { '[',']','{','}' });
                        string[] hosts = gamePrameters.HTTPDNS_PreResolveHosts.Split(new char[] { ',' });
                        string host = "";
                        for (int j = 0; j < hosts.Length; j++)
                        {
                            host = host + "@\"" + hosts[j] + "\",";
                        }
                        newstr = string.Format("{0}[{1}]{2}  {3}{4}{5};", s[0],s[1],s[2],"{", host,"}");
                        sb.AppendLine(newstr);
                    }
                    else
                    {
                        sb.AppendLine(str);
                    }
                }
            }
            SaveFile(filepath, sb);
        }

        static void SetManifest()
        {
            string filepath = "Assets/Plugins/Android/AndroidManifest.xml";
            string[] mainfestStr = File.ReadAllLines(filepath);
            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < mainfestStr.Length; i++)
            {
                string str = mainfestStr[i];
                if (i == 0 )
                {
                    if (str == "")
                    {
                        sb.AppendFormat("<!--auto generated by editor {0}-->\r\n", DateTime.Now.ToString());
                    }else if (str.Contains("auto"))
                    {
                        sb.AppendFormat("<!--auto generated by editor {0}-->\r\n", DateTime.Now.ToString());
                    }
                    else
                    {
                        sb.AppendFormat("<!--auto generated by editor {0}-->", DateTime.Now.ToString());
                        sb.AppendLine(str);
                    }                  
                }else if(i == mainfestStr.Length-1)
                {
                    if (str == "")
                    {
                        sb.AppendFormat("<!--auto generated by editor end {0}-->", DateTime.Now.ToString());
                    }
                    else if (str.Contains("auto"))
                    {
                        sb.AppendFormat("<!--auto generated by editor end {0}-->", DateTime.Now.ToString());
                    }
                    else
                    {
                        sb.AppendLine(str);
                        sb.AppendFormat("<!--auto generated by editor end {0}-->", DateTime.Now.ToString());                        
                    }
                }
                else
                {
                    if (str.Contains("WECHAT_APPID"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.wechatAppid));
                    }else if(str.Contains("BUGLY_APPID")) {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.andoird_BUGLY_APPID));
                    }
                    else if (str.Contains("BUGLY_APP_CHANNEL"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.androidChannel));
                    }
                    else if (str.Contains("com.amap.api.v2.apikey"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.androidAmapApiKey));
                    }
                    else if (str.Contains("HTTPDNS_AccountID"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.HTTPDNS_AccountID));
                    }
                    else if (str.Contains("HTTPDNS_PreResolveHosts"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.HTTPDNS_PreResolveHosts));
                    }
                    else if (str.Contains("TalkingData_APPID"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.talkingData_APPID));
                    }
                    else if (str.Contains("\"channel\""))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.androidChannel));
                    }
                    else if (str.Contains("JPUSH_CHANNEL"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.androidChannel));
                    }
                    else if (str.Contains("JPUSH_APPKEY"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.JPUSH_APPKEY));
                    }
                    else if (str.Contains("com.openinstall.APP_KEY"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.openinstallKey));
                    }
                    else if (str.Contains("\"MW_APPID\""))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.android_MW_APPID));
                    }
                    else if (str.Contains("MW_CHANNEL"))
                    {
                        sb.AppendLine(SetManifestLine(str, gamePrameters.android_MW_CHANNEL));
                    }
                    else if (str.Contains("package="))
                    {
                        string newstr = "";
                        string[] s = str.Split(new char[] { '"' });
                        newstr = string.Format("{0}\"{1}\"", s[0], gamePrameters.packageName);
                        sb.AppendLine(newstr);
                    }
                    else if (str.Contains("permission.JPUSH_MESSAGE"))
                    {
                        string newstr = "";
                        string[] s = str.Split(new char[] { '"' ,'.'});
                        newstr = string.Format("{0}\"{1}.{2}.{3}\"{4}", s[0], gamePrameters.packageName,s[4],s[5],s[6]);
                        sb.AppendLine(newstr);
                    }
                    else if (str.Contains("<category android:name=\"com."))
                    {
                        string newstr = "";
                        string[] s = str.Split(new char[] { '"' });
                        newstr = string.Format("{0}\"{1}\"{2}", s[0], gamePrameters.packageName,s[2]);
                        sb.AppendLine(newstr);
                    }
                    else if (str.Contains("android:authorities=\"com"))
                    {
                        string newstr = "";
                        string[] s = str.Split(new char[] { '"','.' });
                        newstr = string.Format("{0}\"{1}.{2}\"", s[0], gamePrameters.packageName, s[4]);
                        sb.AppendLine(newstr);
                    }
                    else
                    {
                        sb.AppendLine(str);
                    }
                   
                }
                
            }
            SaveFile(filepath, sb);
         
        }

        static string SetManifestLine(string str,string pra)
        {
            string newstr = "";
            string[] s = str.Split(new char[] { '"' });
            newstr = string.Format("{0}\"{1}\"{2}\"{3}\"{4}", s[0], s[1], s[2], pra, s[4]);
            return newstr;
        }
        static string SetAppInfoLine(string str, string pra)
        {
            string newstr = "";
            string[] s = str.Split(new char[] { '@' });
            newstr = string.Format("{0}@\"{1}\";", s[0], pra);
            return newstr;
        }
        static void WriteFile()
        {
            //static StringBuilder sb = new StringBuilder();
        }

        static void modifyEditorPackageName()
        {
            PlayerSettings.productName = gamePrameters.gameName;
            PlayerSettings.SetApplicationIdentifier(BuildTargetGroup.Android, gamePrameters.packageName);
            PlayerSettings.SetApplicationIdentifier(BuildTargetGroup.iOS, gamePrameters.packageName);

        }

        static string SetParameters(string str)
        {
            string[] s = str.Split(new char[] { '"' });
            return s[1];
        }

        static void SaveFile(string file, StringBuilder sb)
        {
            using (StreamWriter textWriter = new StreamWriter(file, false, Encoding.UTF8))
            {
                textWriter.Write(sb.ToString());
                textWriter.Flush();
                textWriter.Close();
            }
        }

        //public void OnGUI()
        //{
        //      }

    }

    public class GameParameters
    {
        public string gameName;
        public string packageName;

        public string wechatAppid;

        public string HTTPDNS_AccountID;
        public string HTTPDNS_PreResolveHosts;

        public string openinstallKey;

        public string JPUSH_APPKEY;

        public string iosChannel;
        public string androidChannel;

        public string talkingData_APPID;

        public string androidAmapApiKey;
        public string iosAmapApiKey;

        public string andoird_BUGLY_APPID;
        public string ios_BUGLY_APPID;

        public string ios_MW_APPID;
        public string android_MW_APPID;
        public string android_MW_CHANNEL;

        public string xianliaoAppid;

        public string alipayAppid;
    }
}
