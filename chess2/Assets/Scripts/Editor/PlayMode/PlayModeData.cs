using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Text;
using System.IO;

// create by jyz 2017/8/15 
namespace PlayModeEditor{
	[System.Serializable]
	public class PlayModeInfo{
		public string img = "Public_Electorate_按钮_图标_红中";
		public string hallName = "";
		public string bg = "BackgroundHongZhong";
		public string btnImg = "HongZhong_Main_入口_图标_";
		public TagEnum tag = TagEnum.None;
		public string name = "红中麻将";
		public string gameName = "HZMJ";
		public int gameId = 1;
		public bool isOpen = false;
		public string package = "majiang";
		public int location = 1;
		public bool isOnline = true;
		public bool isOpenGold = false;
		public bool isOpenMatch = false;

		public string playTypeName = "";

        //金币场房间名字
        public string goldRoomName = "";



		public string createName = "";

		public string wanfaType = "";

		public int showIndex = -1; //在选择玩法界面中的排序，编辑器中如何排序  选择玩法界面就如何排序
		
		public string tips = ""; //玩法自定义使用字段 由各玩法开发自己定夺

		public string cardTheame = "1|1|2"; //默认麻将卡牌皮肤

		public string headIcon = "Main_入口_通用玩法";
		
		

		public string GetString()
		{
			StringBuilder sb = new StringBuilder();
			string space = "                ";
			sb.Append("            {\n");
			sb.Append(space + "img          = \"" + img.Trim()       + "\",\n");
			sb.Append(space + "headIcon     = \"" + headIcon.Trim()  + "\",\n");
			sb.Append(space + "hallName     = \"" + hallName.Trim()  + "\",\n");
			sb.Append(space + "bg           = \"" + bg.Trim()        + "\",\n");
			sb.Append(space + "btnImg       = \"" + btnImg.Trim()    + "\",\n");
			sb.Append(space + "tag          = "   + (int)tag + ",\n");
			sb.Append(space + "name         = \"" + name.Trim()      + "\",\n");
			sb.Append(space + "gameName     = \"" + gameName.Trim()  + "\",\n");
			sb.Append(space + "gameId       = "   + gameId   + ",\n");
			sb.Append(space + "isOpen       = "   + isOpen.ToString().ToLower()   + ",\n");
			sb.Append(space + "package      = \"" + package.Trim()   + "\",\n");
			sb.Append(space + "location     = "   + location+ ",\n");
			sb.Append(space + "showIndex    = "   + showIndex + ",\n");
			sb.Append(space + "isOnline     = "   + isOnline.ToString().ToLower() + ",\n");
			sb.Append(space + "isOpenGold   = "   + isOpenGold.ToString().ToLower() + ",\n");
            sb.Append(space + "isOpenMatch   = " + isOpenMatch.ToString().ToLower() + ",\n");
			if(playTypeName != "")
				sb.Append(space + "playTypeName = \"" + playTypeName.Trim()  + "\",\n");
			if(wanfaType != "")
				sb.Append(space + "wanfaType    = \"" + wanfaType.Trim()  + "\",\n");
			if(createName != "")
				sb.Append(space + "createName   = \"" + createName.Trim()  + "\",\n");
			if(tips != "")
				sb.Append(space + "tips         = \"" + tips.Trim()  + "\",\n");
            if (goldRoomName != "")
                sb.Append(space + "goldRoomName         = \"" + goldRoomName.Trim() + "\",\n");
            if (cardTheame != "")
				sb.Append(space + "cardTheame   = \"" + cardTheame.Trim()  + "\",\n");
			sb.Append("            }");
			return sb.ToString();
		}
		

		public void CloneTarget(PlayModeInfo target)
		{
			// this.gameId = target.gameId;
			// this.location = target.location;
			// this.showIndex = target.showIndex;  这三个不需要拷贝

			this.bg = target.bg;
			this.btnImg = target.btnImg;
			this.cardTheame = target.cardTheame;
			this.createName = target.createName;
			this.gameName = target.gameName;
			this.img = target.img;
			this.isOnline = target.isOnline;
			this.isOpen = target.isOpen;
			this.name = target.name;
			this.package = target.package;
			this.playTypeName = target.playTypeName;
			this.tag = target.tag;
			this.tips = target.tips;
            this.goldRoomName = target.goldRoomName;
            this.wanfaType = target.wanfaType;
			this.isOpenGold = target.isOpenGold;
            this.isOpenMatch = target.isOpenMatch;
            this.headIcon = target.headIcon;
		}
	}
	[System.Serializable]
	public class PlayModeConfig{
		public int key;
		public string value;// = "新增的玩法";
		public bool isOpen;// = false;
 		public int showIndex;  //在选择玩法界面中的排序，编辑器中如何排序  选择玩法界面就如何排序
		public List<PlayModeInfo> playModeList = new List<PlayModeInfo>();

		public int GetInfoNextId()
		{
			int count = playModeList.Count;
            int result = key == 1 ? 1 : key*100 + 1;
            for (int i = 0; i < count; i++)
            {
                if (playModeList[i].gameId > result)
                    result = playModeList[i].gameId;
            }
            if (count > 0)
                result++;
            return result;
		}
		public string GetString()
		{
			StringBuilder sb = new StringBuilder();
			string space = "        ";
			sb.Append("    {\n");
			sb.Append(space + "id           = "   + key    + ",\n");
			sb.Append(space + "name         = \"" + value.Trim()    + "\",\n");
			sb.Append(space + "isOpen       = "   + isOpen.ToString().ToLower() + ",\n");
			sb.Append(space + "showIndex    = "   + showIndex + ",\n");
			sb.Append(space + "playModeList ={\n");
			for(int i = 0; i < playModeList.Count; i++)
			{
				sb.Append(playModeList[i].GetString());
				if(i < playModeList.Count - 1)
					sb.Append(",");
				sb.Append("\n");
			}
			sb.Append(space + "},\n");
			sb.Append("    }");
			return sb.ToString();
		}
	}

	[System.Serializable]
	public class ProvinceData{

		public int key;                           // 省份ID
		public bool isOpen = false;               // 该省份是否开启
		public bool isOnline = false;
		public string name = "安徽省";             // 省份名
		public string shortName = "安徽";          // 省份缩略名
		public string gameName = "AnHui";         // 省份游戏内名称 用于游戏内按钮之类          
		public string btnIcon = "";               // 省份按钮图片                              无需导出到Lua，仅供编辑器使用
		public string btnName = "None";           // 省份按钮名 自动生成后为 btn+gameName  
		public string popIcon = "";               // 省份按钮上的气泡Icon                       无需导出到Lua，仅供编辑器使用
		public PopTagEnum popTag = 0;             // 气泡标志
		public string modName = "";               // 该省份的玩法Mod在哪 如:package.public.module.playmodeconfigs.anhui_config
		public string appName = "";
		public string tips = "";
		public List<PlayModeConfig> configs = new List<PlayModeConfig>();    //省份下的玩法列表

		public int GetConfigNextId()
		{
			int count = configs.Count;
            int result = 1;
            for (int i = 0; i < count; i++)
            {
                if (configs[i].key > result)
                    result = configs[i].key;
            }
            if (count > 0)
                result++;
            return result;
		}

		public string GetConfigString()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append("-- 编辑器自动生成，请勿直接修改！\n");
			sb.Append("local playModeConfig = {\n");
			for(int i = 0; i < configs.Count; i++)
			{
				sb.Append(configs[i].GetString());
				if(i < configs.Count - 1)
					sb.Append(",");
				sb.Append("\n");
			}
			sb.Append("}\n");
			sb.Append("return playModeConfig\n");
			return sb.ToString();
		}

		public string GetString()
		{
			StringBuilder sb = new StringBuilder();
			string space = "            ";
			sb.Append("        {\n");
			sb.Append(space + "id           = "   + key    + ",\n");
			sb.Append(space + "isOpen       = "   + isOpen.ToString().ToLower()    + ",\n");
			sb.Append(space + "isOnline     = "   + isOnline.ToString().ToLower() + ",\n");
			sb.Append(space + "name         = "   + "\"" + name.Trim()    + "\",\n");
			sb.Append(space + "shortName    = "   + "\"" + shortName.Trim()    + "\",\n");
			sb.Append(space + "gameName     = "   + "\"" + gameName.Trim()    + "\",\n");
			sb.Append(space + "appName     = "   + "\"" + appName.Trim()    + "\",\n");
			sb.Append(space + "btnName      = "   + "\"btn" + gameName.Trim()    + "\",\n");
			sb.Append(space + "popTag       = "   + (int)popTag    + ",\n");
			sb.Append(space + "popIcon     = "   + "\"" + System.IO.Path.GetFileNameWithoutExtension(popIcon) + "\",\n");
			sb.Append(space + "modName      = "   + "\"package.public.module.playmodeconfigs." + gameName.ToLower().Trim()   + "_config\",\n");
			if(tips != "")
				sb.Append(space + "tips         = \"" + tips.Trim()  + "\",\n");
			sb.Append("        }\n");
			return sb.ToString();
		}

	}

	[System.Serializable]
	public class PlayModeData : ScriptableObject {

		public bool isLocal = false;     // 是否全国包（用于编辑器适配所有工程）
		public int localId = 1;         // 非全国包显示的省份
		public List<ProvinceData> configs = new List<ProvinceData>();
		
		public string GetString()
		{
			StringBuilder sb = new StringBuilder();
			sb.Append("-- 编辑器自动生成，请勿直接修改！\n");
			sb.Append("---@class provinceConfig\n");
			sb.Append("local provinceConfig = {\n");
			sb.Append("    isLocal      = "    + isLocal.ToString().ToLower() + ",\n");
			if(isLocal) 
				sb.Append("    localId      = "    + localId + ",\n");
			sb.Append("    provinceList ={\n");
			for(int i = 0; i < configs.Count; i++)
			{
				sb.Append(configs[i].GetString());
				if(i < configs.Count - 1)
					sb.Append("        ,");
				sb.Append("\n");
			}
			sb.Append("    }\n");
			sb.Append("}\n");
			sb.Append("return provinceConfig\n");
			return sb.ToString();
		}

		public int GetConfigNextId()
		{
			int count = configs.Count;
            int result = 1;
            for (int i = 0; i < count; i++)
            {
                if (configs[i].key > result)
                    result = configs[i].key;
            }
            if (count > 0)
                result++;
            return result;
		}
		
	}

	public enum PopTagEnum{
		None = 0,
		Test = 1,
	}

	public enum TagEnum{
		None = 0,   //无
		Hot = 1,   //热门
		Recommend = 2, //推荐
		Test = 3, //内测
	}

	public enum ColorEnum{
		White = 1,
		Red = 2,
	}

	public class PlayModeTools{
		private static PlayModeData _data = null;  // 全国数据
		public static int curProvince = -1;  // 当前选择编辑的省份
		public static PlayModeData data
		{
			get
			{
				if(_data == null)
				{
					_data = Load();
					SortData();
				}
				return _data;
			}
		}

		public static ProvinceData pData{
			get
			{
				if(curProvince == -1)
					return null;
				return data.configs[curProvince];
			}

		}

		public static PlayModeInfo copyData = null;

		public static string dataPath
		{
			get
			{
				return Application.dataPath + "/Scripts/Editor/PlayMode/PlayModeData.asset";
			}
		}

		public static string backupPath
		{
			get
			{
				return Application.dataPath + "/Scripts/Editor/PlayMode/backUp/PlayModeData_"+ System.DateTime.Now.Year.ToString().Substring(2, 2) + System.DateTime.Now.ToLocalTime().ToString("MMddHHmm") + ".asset";
			}
		}

		public static string provinceLuaPath
		{
			get
			{
				return Application.dataPath + "/LuaFramework/Lua/package/public/module/playmodeconfigs/all_configs.lua";
			}
		}

		public static string luaPath
		{
			get
			{
				return Application.dataPath + "/LuaFramework/Lua/package/public/module/playmodeconfigs/" + data.configs[curProvince].gameName.ToLower() + "_config.lua";
			}
		}
		private static List<string> _provinceNames;
		public static List<string> provinceNames
		{
			get
			{
				bool isNeedRefresh = false;
				if(_provinceNames == null || _provinceNames.Count != data.configs.Count)
					isNeedRefresh = true;
				else
					for(int i = 0; i < data.configs.Count; i++)
					{
						if(_provinceNames[i] != data.configs[i].name)
						{
							isNeedRefresh = true;
							break;
						}
					}


				if(isNeedRefresh)
				{
					_provinceNames = new List<string>();
					for(int i = 0; i < data.configs.Count; i++)
					{
						_provinceNames.Add(data.configs[i].name);
					}
				}

				return _provinceNames;
			}
		}

		public static void copyOrPasteInfo(PlayModeInfo info)
		{
			if(copyData == null)
			{
				copyInfo(info);
				return;
			}
			
			pasteInfo(info);
		}

		// 拷贝一个PlayModeInfo
		private static void copyInfo(PlayModeInfo info)
		{
			if(info == null) return;

			copyData = new PlayModeInfo();
			copyData.CloneTarget(info);
		}

		// 将当前拷贝的PlayModeInfo 赋值给传入的info
		private static void pasteInfo(PlayModeInfo info)
		{
			if(copyData == null)
			{
				Debug.LogError("当前拷贝的PlayModeInfo为Null，无法完成复制！");
				return ;
			}

			if(!Directory.Exists(Application.dataPath + "/Scripts/Editor/PlayMode/backUp"))
				Directory.CreateDirectory(Application.dataPath + "/Scripts/Editor/PlayMode/backUp");

			File.Copy(dataPath,backupPath);
			UnityEditor.AssetDatabase.SaveAssets();
            UnityEditor.AssetDatabase.Refresh();

			info.CloneTarget(copyData);

			copyData = null;
		}

		public static void SortData()
		{
			if(pData == null) return;
			for(int i = 0; i < pData.configs.Count; i++)
			{
				pData.configs[i].showIndex = i + 1;
				if(pData.configs[i].playModeList == null) continue;
				for(int j = 0; j < pData.configs[i].playModeList.Count; j++)
				{
					PlayModeInfo info = pData.configs[i].playModeList[j];
					info.showIndex = j+1;
				}
			}
			SaveData();
		}

		public static void SortData(ProvinceData curData)
		{
			if(curData == null) return;
			for(int i = 0; i < curData.configs.Count; i++)
			{
				curData.configs[i].showIndex = i + 1;
				if(curData.configs[i].playModeList == null) continue;
				for(int j = 0; j < curData.configs[i].playModeList.Count; j++)
				{
					PlayModeInfo info = curData.configs[i].playModeList[j];
					info.showIndex = j+1;
				}
			}
			SaveData();
		}

		public static void SaveData()
		{
			UnityEditor.EditorUtility.SetDirty(_data);
            UnityEditor.AssetDatabase.SaveAssets();
            UnityEditor.AssetDatabase.Refresh();
		}

		public static string GetFileName(string filePath)
		{
			if(!filePath.Contains("/"))
				return filePath;
			string[] strs = filePath.Split('/');
			return strs[strs.Length -1];
		}

		public static string GetBtnImgStr(string filePath)
		{
			string fileName = GetFileName(filePath);
			if(!fileName.Contains("_"))
				return fileName;
			string[] strs = fileName.Split('_');
			string str = string.Empty;
			for(int i = 0; i < strs.Length-1; i++)
			{
				str += strs[i];
				str += "_";
			}
			return str;
		}

		public static void ExportLuaScript()
		{
			ExportProvinceLuaScript();
			for(int i = 0; i < data.configs.Count; i++)
			{
				string path = Application.dataPath + "/LuaFramework/Lua/package/public/module/playmodeconfigs/" + data.configs[i].gameName.ToLower() + "_config.lua";
				ProvinceData curData = data.configs[i];
				SortData(curData);
				FileUtility.SaveFile(path,curData.GetConfigString());
			}
		}

		public static void ExportProvinceLuaScript()
		{
			FileUtility.SaveFile(provinceLuaPath,_data.GetString());
		}

		public static void ExportPlayModeLuaScript()
		{
			SortData();
			FileUtility.SaveFile(luaPath, pData.GetConfigString());
		}

		public static void ReSortId()
		{
			for(int i = 0; i < data.configs.Count; i++)
			{
				for(int j = 0; j < data.configs[i].configs.Count; j ++)
				{
					PlayModeConfig config = data.configs[i].configs[j];
					for(int k = 0; k < config.playModeList.Count; k++)
					{
						PlayModeInfo info = config.playModeList[k];

						info.gameId = config.key == 1 ? 1 + k : config.key*100 + 1 + k;
					}
				}
			}
		}

		private static PlayModeData Load()
		{
			PlayModeData modeData = modeData = (PlayModeData)UnityEditor.AssetDatabase.LoadAssetAtPath<PlayModeData>("Assets/Scripts/Editor/PlayMode/PlayModeData.asset");	
			if(!modeData)
			{
				modeData = ScriptableObject.CreateInstance<PlayModeData>();
				UnityEditor.AssetDatabase.CreateAsset(modeData, "Assets/Scripts/Editor/PlayMode/PlayModeData.asset");
			}
			return modeData;
		}
	}


	public class PublicConfig{
		private PlayModeConfig config = new PlayModeConfig();

		private PublicConfig()
		{
			config.key = 1;
			config.isOpen = false;
			config.value = "大众玩法";
			config.showIndex = 1;
			List<PlayModeInfo> copyList = new List<PlayModeInfo>();
			if(PlayModeTools.data.configs.Count > 0 && PlayModeTools.data.configs[0].configs[0].playModeList.Count > 0) 
			{
				List<PlayModeInfo> playModeList = PlayModeTools.data.configs[0].configs[0].playModeList;
				for(int i = 0; i < playModeList.Count; i++)
				{
					PlayModeInfo info = new PlayModeInfo();
					info.gameId = playModeList[i].gameId;
					info.location = playModeList[i].location;
					info.showIndex = playModeList[i].showIndex;
					info.CloneTarget(playModeList[i]);
					info.isOpen = false;
					copyList.Add(info);
				}
			}

			copyList.Sort((a, b) => {
				if(a.gameId > b.gameId)
					return 1;
				else if(a.gameId == b.gameId)
					return -1;
				else
					return -1;
			});
			config.playModeList = copyList;
		}

		private static PublicConfig _instance;
		public static PublicConfig instance
		{
			get
			{
				if(_instance == null)
					_instance = new PublicConfig();
				return _instance;
			}
		}


		public PlayModeConfig GetClone()
		{
			PlayModeConfig clone = new PlayModeConfig();
			clone.key = config.key;
			clone.isOpen = config.isOpen;
			clone.value = config.value;
			clone.showIndex = config.showIndex;
			clone.playModeList = new List<PlayModeInfo>(config.playModeList.ToArray()); 
			return clone;
		}
	}

}
