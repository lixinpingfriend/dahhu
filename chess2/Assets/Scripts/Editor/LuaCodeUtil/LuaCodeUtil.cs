

using System.Collections;
using System.Collections.Generic;

namespace CustomEditorUtil
{	
	//查找注释的状态
	internal enum NoteState{
		Normal,       //普通字符
		GetCharOne,   //遇到第一个'-'
		DoubleQuotes,
		SingleQuote,
		EscapeSingle,
		EscapeDouble,
		FindNote,     //找到两个'-' 注释开始
		NoteStart,   // -- 后未接[情况
		FindNoteOne, //找到--[
		FindNoteMult, //找到--[[开始的注释
		FindNoteMultEnd1, //找到] 疑似多行注释结束标志
		NoteEnd,      // 注释开始后遇到'\n' 或者 EOF 注释结束
	}

	//查找Lua代码中的空格状态
	internal enum SpaceState{
		Normal,       // 普通字符
		DoubleQuotes, // 遇到了一个双引号
		SingleQuote,  // 单引号
		GetSpace,     // 遇到了一个空格
		SurplusSpace, // 多余的空格，此状态下的空格全部删除
		EscapeSingle, // 遇到了转义字符 此状态只会在DoubleQuotes与SingleQuote状态下才会有  后缀代表是以'起头的字符串还是以"起头的字符串
		EscapeDouble,
		SpaceEnd,     // 空格结束
	}

	//Lua脚本代码辅助类
	public class LuaCodeUtil{

		/// <summary>
    	/// 将Lua脚本从开发版本转为发布版本
		/// 此函数会删除lua脚本中的注释，去掉换行，每段有效执行代码以一个空格隔开
    	/// </summary>
		public static string LuaCodeToRelease(string luacode)
		{
			char[] chars = DelLuaNoteChar(luacode.ToCharArray());
			chars        = DelLuaCodeSpace(chars);
			return new string(chars);
		}

		/// <summary>
		/// 2017/10/24版本修改 为方便bugly查看堆栈信息作出修改
    	/// 1 从识别 -- 注释标记开始 删除 -- 到 \n或者EOF之间的注释信息 
		/// 2 将 --起始的一行直接删除
		/// 3 --[]多行注释不做处理
    	/// </summary>
		private static char[] DelLuaNoteChar(char[] chars)
		{
			NoteState state     = NoteState.Normal;
			List<char> outChars = new List<char>();
			for(int i = 0; i < chars.Length; i++)
			{
				char c = chars[i];

				// 初始状态有三种转换可能
				if(state == NoteState.Normal && c == '-')
					state = NoteState.GetCharOne;
				else if(state == NoteState.Normal && c == '\'')
					state = NoteState.SingleQuote;
				else if(state == NoteState.Normal && c == '\"')
					state = NoteState.DoubleQuotes;
				
				// 处于单引号字符串状态时 有结束字符串和切换到遇到转义字符状态
				else if(state == NoteState.SingleQuote && c == '\'')
					state = NoteState.Normal;
				else if(state == NoteState.SingleQuote && c == '\\')
					state = NoteState.EscapeSingle;
				else if(state == NoteState.EscapeSingle)
					state = NoteState.SingleQuote;

				// 双引号状态
				else if(state == NoteState.DoubleQuotes && c == '\"')
					state = NoteState.Normal;
				else if(state == NoteState.DoubleQuotes && c == '\\')
					state = NoteState.EscapeDouble;
				else if(state == NoteState.EscapeDouble)
					state = NoteState.DoubleQuotes;

				
				else if(state == NoteState.GetCharOne && c == '-')
					state = NoteState.FindNote;
				else if(state == NoteState.GetCharOne)
				{
					state = NoteState.Normal;
					outChars.Add('-');
				}

				else if(state == NoteState.FindNote && c == '[')
					state = NoteState.FindNoteOne;
				else if(state == NoteState.FindNote && (i == chars.Length - 1 || c == '\n'))
					state = NoteState.NoteEnd;
				

				// 找到--[后的情况
				else if(state == NoteState.FindNoteOne && c == '[')
				{
					outChars.Add('-');
					outChars.Add('-');
					outChars.Add('[');
					state = NoteState.FindNoteMult;
				}
				else if(state == NoteState.FindNoteOne && (i == chars.Length - 1 || c == '\n'))
					state = NoteState.Normal;
				else if(state == NoteState.FindNoteOne)
					state = NoteState.FindNote;

				else if(state == NoteState.FindNoteMult && c == ']')
					state = NoteState.FindNoteMultEnd1;

				else if(state == NoteState.FindNoteMultEnd1 && c == ']')
				{
					state = NoteState.NoteEnd;
					outChars.Add(']');
				}
				else if(state == NoteState.FindNoteMultEnd1)
					state = NoteState.FindNoteMult;

				else if(state == NoteState.FindNote)
					state = NoteState.NoteStart;

				else if(state == NoteState.NoteStart && (i == chars.Length - 1 || c == '\n'))
				{
					state = NoteState.NoteEnd;
					if(c == '\n') outChars.Add('\n');
				}

				if(state != NoteState.FindNote && state != NoteState.GetCharOne &&
				 state != NoteState.NoteEnd && state != NoteState.NoteStart && state != NoteState.FindNoteOne)
				{
					outChars.Add(chars[i] == '\n' ? '\n' :chars[i]);
				}

				if(state == NoteState.NoteEnd)
					state = NoteState.Normal;

			}
			string outStr = new string(outChars.ToArray());
			//UnityEngine.Debug.Log("去除空格之前:\n" + outStr);
			return outStr.ToCharArray();
		}

		/*  2017/10/24 屏蔽原版
		/// <summary>
    	/// 1 从识别 -- 注释标记开始 删除 -- 到 \n或者EOF之间的注释信息
		/// 2 将所有\n 替换为space
    	/// </summary>
		private static char[] DelLuaNoteChar(char[] chars)
		{
			NoteState state     = NoteState.Normal;
			List<char> outChars = new List<char>();
			for(int i = 0; i < chars.Length; i++)
			{
				char c = chars[i];

				// 初始状态有三种转换可能
				if(state == NoteState.Normal && c == '-')
					state = NoteState.GetCharOne;
				else if(state == NoteState.Normal && c == '\'')
					state = NoteState.SingleQuote;
				else if(state == NoteState.Normal && c == '\"')
					state = NoteState.DoubleQuotes;
				
				// 处于单引号字符串状态时 有结束字符串和切换到遇到转义字符状态
				else if(state == NoteState.SingleQuote && c == '\'')
					state = NoteState.Normal;
				else if(state == NoteState.SingleQuote && c == '\\')
					state = NoteState.EscapeSingle;
				else if(state == NoteState.EscapeSingle)
					state = NoteState.SingleQuote;

				// 双引号状态
				else if(state == NoteState.DoubleQuotes && c == '\"')
					state = NoteState.Normal;
				else if(state == NoteState.DoubleQuotes && c == '\\')
					state = NoteState.EscapeDouble;
				else if(state == NoteState.EscapeDouble)
					state = NoteState.DoubleQuotes;

				
				else if(state == NoteState.GetCharOne && c == '-')
					state = NoteState.FindNote;
				else if(state == NoteState.GetCharOne)
				{
					state = NoteState.Normal;
					outChars.Add('-');
				}

				else if(state == NoteState.FindNote && c == '[')
					state = NoteState.FindNoteOne;
				else if(state == NoteState.FindNote && (i == chars.Length - 1 || c == '\n'))
					state = NoteState.NoteEnd;
				

				// 找到--[后的情况
				else if(state == NoteState.FindNoteOne && c == '[')
					state = NoteState.FindNoteMult;
				else if(state == NoteState.FindNoteOne && (i == chars.Length - 1 || c == '\n'))
					state = NoteState.Normal;
				else if(state == NoteState.FindNoteOne)
					state = NoteState.FindNote;

				else if(state == NoteState.FindNoteMult && c == ']')
					state = NoteState.FindNoteMultEnd1;

				else if(state == NoteState.FindNoteMultEnd1 && c == ']')
				{
					state = NoteState.NoteEnd;
				}
				else if(state == NoteState.FindNoteMultEnd1)
					state = NoteState.FindNoteMult;

				else if(state == NoteState.FindNote)
					state = NoteState.NoteStart;

				else if(state == NoteState.NoteStart && (i == chars.Length - 1 || c == '\n'))
				{
					state = NoteState.NoteEnd;
					if(c == '\n') outChars.Add(' ');
				}

				if(state != NoteState.FindNote && state != NoteState.GetCharOne && state != NoteState.FindNoteOne &&
					state != NoteState.FindNoteMult && state != NoteState.FindNoteMultEnd1 && state != NoteState.NoteEnd && state != NoteState.NoteStart)
				{
					outChars.Add(chars[i] == '\n' ? ' ' :chars[i]);
				}

				if(state == NoteState.NoteEnd)
					state = NoteState.Normal;

			}
			string outStr = new string(outChars.ToArray());
			//UnityEngine.Debug.Log("去除空格之前:\n" + outStr);
			return outStr.ToCharArray();
		}
		*/

		private static char[] DelLuaCodeSpace(char[] chars)
		{
			SpaceState state    = SpaceState.Normal;
			List<char> outChars = new List<char>();
			for(int i = 0; i < chars.Length; i++)
			{
				char c = chars[i];

				// 读取字符时 从普通状态开始有三种转换状态可能
				if(state == SpaceState.Normal && c == ' ')                                       
					state = SpaceState.GetSpace;
				else if(state == SpaceState.Normal && c == '\'')
					state = SpaceState.SingleQuote;
				else if(state == SpaceState.Normal && c == '\"')
					state = SpaceState.DoubleQuotes;

				// 处于单引号字符串状态时 有结束字符串和切换到遇到转义字符状态
				else if(state == SpaceState.SingleQuote && c == '\'')
					state = SpaceState.Normal;
				else if(state == SpaceState.SingleQuote && c == '\\')
					state = SpaceState.EscapeSingle;
				else if(state == SpaceState.EscapeSingle)
					state = SpaceState.SingleQuote;

				// 双引号状态
				else if(state == SpaceState.DoubleQuotes && c == '\"')
					state = SpaceState.Normal;
				else if(state == SpaceState.DoubleQuotes && c == '\\')
					state = SpaceState.EscapeDouble;
				else if(state == SpaceState.EscapeDouble)
					state = SpaceState.DoubleQuotes;
				
				// 已经读取到一个空格的状态
				else if(state == SpaceState.GetSpace && c == ' ')
					state = SpaceState.SurplusSpace;
				else if(state == SpaceState.GetSpace && c == '\'')
					state = SpaceState.SingleQuote;
				else if(state == SpaceState.GetSpace && c == '\"')
					state = SpaceState.DoubleQuotes;
				
				// 多余空格的状态
				else if(state == SpaceState.SurplusSpace && c == ' ')
					state = SpaceState.SurplusSpace;
				else if(state == SpaceState.SurplusSpace && c == '\'')
					state = SpaceState.SingleQuote;
				else if(state == SpaceState.SurplusSpace && c == '\"')
					state = SpaceState.DoubleQuotes;

				else if(state == SpaceState.SurplusSpace)
					state = SpaceState.Normal;
				else if(state == SpaceState.GetSpace)
					state = SpaceState.Normal;

				if(state != SpaceState.SurplusSpace)
				{
					outChars.Add(chars[i]);
				}

			}
			//UnityEngine.Debug.Log("去除空格之后:\n" + new string(outChars.ToArray()));
			return outChars.ToArray();
		}
	}

}
