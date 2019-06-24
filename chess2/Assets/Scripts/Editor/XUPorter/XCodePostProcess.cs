using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
using UnityEditor.Callbacks;
using UnityEditor.XCodeEditor;
#endif
using System.IO;

public static class XCodePostProcess
{

#if UNITY_EDITOR
	[PostProcessBuild(999)]
	public static void OnPostProcessBuild(BuildTarget target, string pathToBuiltProject )
	{
		if (target != BuildTarget.iOS) {
			Debug.LogWarning("Target is not iPhone. XCodePostProcess will not run");
			return;
		}

		// Create a new project object from build target
		XCProject project = new XCProject( pathToBuiltProject );

		// Find and run through all projmods files to patch the project.
		// Please pay attention that ALL projmods files in your project folder will be excuted!
		string[] files = Directory.GetFiles( Application.dataPath + "/Scripts/Editor/GameEditorConfig", "*.projmods", SearchOption.AllDirectories );
		foreach( string file in files ) {
			Debug.Log("ProjMod File: "+file);
			project.ApplyMod( file );
		}

		//TODO implement generic settings as a module option
		// project.overwriteBuildSetting("CODE_SIGN_IDENTITY[sdk=iphoneos*]", "iPhone Distribution", "Release");
		
      	project.overwriteBuildSetting("ENABLE_BITCODE","NO", "Release");
        project.overwriteBuildSetting("ENABLE_BITCODE","NO", "Debug");
		project.overwriteBuildSetting("ENABLE_BITCODE","NO", "ReleaseForProfiling");
		project.overwriteBuildSetting("ENABLE_BITCODE","NO", "ReleaseForRunning");

		project.overwriteBuildSetting("OTHER_LDFLAGS","-ObjC", "Release");
        project.overwriteBuildSetting("OTHER_LDFLAGS","-ObjC", "Debug");
		project.overwriteBuildSetting("OTHER_LDFLAGS","-ObjC", "ReleaseForProfiling");
		project.overwriteBuildSetting("OTHER_LDFLAGS","-ObjC", "ReleaseForRunning");

		EditorCode(pathToBuiltProject);
		// Finally save the xcode project
		project.Save();

	}

	private static void EditorCode(string filePath)
    {
		
		//读取UnityAppController.mm文件
        XClass UnityAppController = new XClass(filePath + "/Classes/UnityAppController.mm");
 
        //在指定代码后面增加一行代码
        // UnityAppController.WriteBelow("#include \"PluginBase/AppDelegateListener.h\"","#import \"SDKForTABT.h\"");
 
        //在指定代码中替换一行 
        UnityAppController.Replace("return [[window rootViewController] supportedInterfaceOrientations] | _forceInterfaceOrientationMask;","return  (1 << UIInterfaceOrientationLandscapeRight) | (1 << UIInterfaceOrientationLandscapeLeft) | (1 << UIInterfaceOrientationPortrait);");
 
        //在指定代码后面增加一行
        // UnityAppController.WriteBelow("[GetAppController().unityView recreateRenderingSurfaceIfNeeded];","[[SDKForTABT SharedInstance] searchtabtinvoice];");
 
    }
#endif

	public static void Log(string message)
	{
		Debug.Log("PostProcess: "+message);
	}
}
