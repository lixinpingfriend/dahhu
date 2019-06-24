using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using System.Text;

//Create by Jyz 2017/08/23
namespace UICreator{
	public enum UIType{
		Window, //窗口
		Dialog, //对话框
		FullScreen, //全屏界面
	}

	public enum ScriptName{
		View,
		Model,
		Module,
	}
	public class UICreatorPathTools {

		public  static string  mTestViewPath = "GameRoot/Game/UIRoot/UIWindowParent/Canvas/TestWindow";

		public static string mUICreatorPath{
			get
			{
				return string.Format("{0}/Scripts/Editor/UICreator", Application.dataPath);
			}
		}

		public static string mCreatorResPath{
			get{
				return "Assets/Scripts/Editor/UICreator/RES/";
			}
		}

		public static string mCreatorConfigPath{
			get{
				return string.Format("{0}/Scripts/Editor/UICreator/Config/", Application.dataPath);
			}
		}

		public static string mPackageRESPath{
			get
			{
				return string.Format("{0}/Game/PackagingResources/", Application.dataPath);
			}
		}

		public static string mPackageLuaPath{
			get
			{
				return string.Format("{0}/LuaFramework/Lua/package/", Application.dataPath);
			}
		}

		public static string GetPackagePath(string packageName)
		{
			return "";
		}
		
		private static List<string> _packageNames = new List<string>();
		public static List<string> packageNames
		{
			get{
				string[] dirs = Directory.GetDirectories(mPackageRESPath);
				if(_packageNames == null || _packageNames.Count != dirs.Length)
				{
					_packageNames = new List<string>();
					for(int i = 0; i < dirs.Length; i++)
					{
						string packageName = GetFloderName(dirs[i]);
						_packageNames.Add(packageName);
					}

				}
				return _packageNames;
			}
		}

		public static string GetResDir(string packageName, string uiName)
		{
			return mPackageRESPath + packageName + "/Module/" +  uiName + "/";
		}

		public static string GetLuaDir(string packageName, string uiName)
		{
			return  mPackageLuaPath + packageName.ToLower() + "/module/" + uiName.ToLower() + "/";
		}

		public static string GetFloderName(string dirPath)
		{
			//Debug.Log("dirPath = " + dirPath);
			string[] strs = dirPath.Split('/');
			if(strs.Length > 0) 
				return strs[strs.Length - 1];
			return "";
		}

		public static string ReadLuaText(ScriptName name)
		{
			string str = string.Empty;
			switch(name)
			{
				case ScriptName.View:
					Debug.Log(mCreatorConfigPath + "view.lua");
					if(File.Exists(mCreatorConfigPath + "view.lua"))
						str = FileUtility.ReadAllText(mCreatorConfigPath + "view.lua");
					// str =  GetViewLua();
					break;
				case ScriptName.Model:
					Debug.Log(mCreatorConfigPath + "model.lua");
					if(File.Exists(mCreatorConfigPath + "model.lua"))
						str = FileUtility.ReadAllText(mCreatorConfigPath + "model.lua");
					// str =  GetModelLua();
					break;
				case ScriptName.Module:
					Debug.Log(mCreatorConfigPath + "module.lua");
					if(File.Exists(mCreatorConfigPath + "module.lua"))
						str = FileUtility.ReadAllText(mCreatorConfigPath + "module.lua");
					// str =  GetModuleLua();
					break;

			}
			// Debug.Log(str);
			return str;
		}

		// 这里遇到个坑，读取的txt写入到Lua脚本无法使用 报unexpected symbol
		// 暂时使用字符串拼接
		// private static string GetViewLua()
		// {
		// 	StringBuilder sb = new StringBuilder();
		// 	sb.Append("-- UICreator 自动生成\n");
		// 	sb.Append("-- 层级调整请改变 View.initialize(self, value1, value2, value3) 的Value3\n");
		// 	sb.Append("-- 若是特殊UI，请自行调整\n");
		// 	sb.Append("\n");
		// 	sb.Append("local Class = require(\"lib.middleclass\")\n");
		// 	sb.Append("local View = require('core.mvvm.view_base')\n");
		// 	sb.Append("\n");
		// 	sb.Append("local ClassName = Class('ViewName', View)\n");
		// 	sb.Append("\n");
		// 	sb.Append("local ModuleCache = ModuleCache\n");
		// 	sb.Append("local ComponentTypeName = ModuleCache.ComponentTypeName\n");
		// 	sb.Append("function ClassName:initialize(...)\n");
		// 	sb.Append("    -- 初始View \n");
		// 	sb.Append("    View.initialize(self, \"AssetPath\", \"AssetName\", 1)\n");
		// 	sb.Append("end\n");
		// 	sb.Append("return ClassName\n");
		// 	return sb.ToString();
		// }

		// private static string GetModelLua()
		// {
		// 	StringBuilder sb = new StringBuilder();
		// 	sb.Append("local Class = require(\"lib.middleclass\")\n");
		// 	sb.Append("local Model = require('core.mvvm.model_base')\n");
		// 	sb.Append("\n");
		// 	sb.Append("local ClassName = Class('ModelName', Model)\n");
		// 	sb.Append("\n");
		// 	sb.Append("function ClassName:initialize(...)\n");
		// 	sb.Append("    Model.initialize(self, ...)\n");
		// 	sb.Append("end\n");
		// 	sb.Append("return ClassName\n");
		// 	return sb.ToString();
		// }

		// private static string GetModuleLua()
		// {
		// 	StringBuilder sb = new StringBuilder();

		// 	sb.Append("    -- 初始化 \n");
		// 	sb.Append("local class = require(\"lib.middleclass\")\n");
		// 	sb.Append("local ModuleBase = require('core.mvvm.module_base')\n");
		// 	sb.Append("local ClassName = class(\"PackageName.ClassName\", ModuleBase)\n");
		// 	sb.Append("\n");
		// 	sb.Append("local ModuleCache = ModuleCache\n");
		// 	sb.Append("local NetClientManager = ModuleCache.net.NetClientManager\n");
		// 	sb.Append("function ClassName:initialize(...)\n");
		// 	sb.Append("    -- 开始初始化                view        loginModel           模块数据\n");
		// 	sb.Append("    ModuleBase.initialize(self, \"UIName_view\", ModelName, ...)\n");
		// 	sb.Append("end\n");

		// 	sb.Append("\n");
		// 	sb.Append("-- 模块初始化完成回调，包含了view，Model初始化完成\n");
		// 	sb.Append("function ClassName:on_module_inited()\n");
		// 	sb.Append("\n");
		// 	sb.Append("end\n");

		// 	sb.Append("\n");
		// 	sb.Append("-- 每次显示模块时调用\n");
		// 	sb.Append("function ClassName:on_show(data)\n");
		// 	sb.Append("\n");
		// 	sb.Append("end\n");

		// 	sb.Append("\n");
		// 	sb.Append("-- 绑定module层的交互事件\n");
		// 	sb.Append("function ClassName:on_module_event_bind()\n");
		// 	sb.Append("\n");
		// 	sb.Append("end\n");

		// 	sb.Append("\n");
		// 	sb.Append("-- 绑定Model层事件，模块内交互\n");
		// 	sb.Append("function ClassName:on_model_event_bind()\n");
		// 	sb.Append("\n");
		// 	sb.Append("end\n");

		// 	sb.Append("\n");
		// 	sb.Append("-- 点击事件响应\n");
		// 	sb.Append("function ClassName:on_click(obj, arg)\n");
		// 	sb.Append("    ModuleCache.SoundManager.play_sound(\"public\", \"public/sound/button.bytes\", \"button\")\n");
		// 	sb.Append("end\n");

		// 	sb.Append("\n");
		// 	sb.Append("return ClassName\n");

		// 	return sb.ToString();
		// }
	}
}

