using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

[System.Flags]
public enum GameBuildPackageResTag
{
    //请按规则添加packageName
    publictable     = 1 << 0,
    majiang         = 1 << 1,
    majiang3d       = 1 << 2,
    runfast         = 1 << 3,
    guandan         = 1 << 4,
    doudizhu        = 1 << 5,
    changpai        = 1 << 6,
	quickrun		= 1 << 7,
	//paohuzi         = 1 << 7,
	daigoutui       = 1 << 8,
    wushik          = 1 << 9,
    huapai          = 1 << 10,
    jiaojiazi       = 1 << 11,
    huzi            = 1 << 12,
    huazhipai       = 1 << 13,
    daqi            = 1 << 14,
    shengji         = 1 << 15,
    single         = 1 << 16,

    end
}

public static class GameEditorConfig
{
    public static string ossAccessKeyId = "LTAIPNuEYMC30imR";
    public static string ossAccessKeySecret = "jxkDnZDCUYZ4G0Fz7J1VDp6bOqOuk7";
    public static string ossHost = "game.oss.sincebest.com";
    public static string ossCanonicalizedResourcePath = "/sincebest-game-client/";
    public static string ossBaseUrl = "http://game.oss.sincebest.com/";

    public static string resourcesUploadServerHost = "http://test.sincebest.com/oms-bullfight";

    public static string testResourcesUploadServerHost = "自己资源服务器的地址";

    public static string productionResourcesUploadServerHost = "自己资源服务器的地址";



    //热更新补丁上传运营系统的默认GameID
    public static string gameName = "DHGDQP_RUNFAST";

    // 客户端打包的前缀名字    
    public static string appBuildName = "DHQPYX";

    //打包默认包含的package
    public static GameBuildPackageResTag[] buildAppIncludePackageTag =
    {
        GameBuildPackageResTag.publictable,
//        GameBuildPackageResTag.majiang,
//        GameBuildPackageResTag.majiang3d,
        #if UNITY_IPHONE
            GameBuildPackageResTag.runfast,
        #endif
    };


    //安卓签名
    static Dictionary<string, string[]> mAndroidKeyDic = new Dictionary<string, string[]>();
    public static Dictionary<string, string[]> androidKeyDic()
    {
        if (mAndroidKeyDic.Count == 0)
        {
            mAndroidKeyDic.Add("com.sincebest.jisukwx", new string[] { "jskawuxing.keystore", "jskawuxing", "jskwx", "jskawuxing" });
            mAndroidKeyDic.Add("com.sincebest.dahuanqingmajiang", new string[] { "duomimj.keystore", "hnduomimj", "dahuwangjiang", "dhwjmj" });
            mAndroidKeyDic.Add("common", new string[] { "sincebest.keystore", "sincebest", "sincebest", "sincebest" });
        }
        return mAndroidKeyDic;
    }



    public static string url_dingding = "";

    //fir token
    public static string firToken = "509014074736bd3326893fc301864579";

    public static string firUrl = "http://api.fir.im/apps";

    public static string qiniuUrl = "";

    //info.plist 
    public static string[][] plistKV = new string[][] {
        new string[] { "NSPhotoLibraryUsageDescription", "若不允许，您将无法使用图片上传功能" },
        new string[] { "NSPhotoLibraryAddUsageDescription", "若不允许，您将无法把图片保存到相册以便分享给他人" },
        new string[] { "NSCameraUsageDescription", "若不允许，您将无法使用图片上传功能" },
        new string[] { "NSLocationWhenInUseUsageDescription", "若不允许，您将无法使用位置提示功能" },
        new string[] { "NSMicrophoneUsageDescription", "若不允许，您将无法使用语言消息功能" },
    };
}


