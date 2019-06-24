using UnityEngine;  
using UnityEditor;  
  
[InitializeOnLoad]  
public class InitializeOnLoad {  
	
	static InitializeOnLoad()  
	{  
		EditorSettings.spritePackerMode = SpritePackerMode.BuildTimeOnly;
		EditorSettings.projectGenerationUserExtensions = new[] {"txt", "xml", "fnt", "cd", "lua", "h", "c", "m", "mm", "entitlements", "projmods"};
//		EditorUserBuildSettings.androidBuildSubtarget = MobileTextureSubtarget.ETC2;
		EditorSettings.etcTextureCompressorBehavior = 2;
		EditorSettings.etcTextureFastCompressor = 1;
		EditorSettings.etcTextureNormalCompressor = 3;
		EditorSettings.etcTextureBestCompressor = 1;
//		EditorUserBuildSettings.SetCompressionType(BuildTargetGroup.Android, Compression.Lz4);
	}  
}  