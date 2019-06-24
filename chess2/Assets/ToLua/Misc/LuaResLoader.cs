


using UnityEngine;
using LuaInterface;
using System.IO;
using System.Text;

public class LuaResLoader : LuaFileUtils
{
    public LuaResLoader()
    {
        instance = this;
        beZip = false;
    }

    public override byte[] ReadFile(string fileName)
    {
#if !UNITY_EDITOR
        byte[] buffer = ReadDownLoadFile(fileName);

        if (buffer == null)
        {
            buffer = ReadResourceFile(fileName);
        }        
        
        if (buffer == null)
        {
            buffer = base.ReadFile(fileName);
        }        
#else
        byte[] buffer = base.ReadFile(fileName);

        if (buffer == null)
        {
            buffer = ReadResourceFile(fileName);
        }

        if (buffer == null)
        {
            buffer = ReadDownLoadFile(fileName);
        }
#endif

        return buffer;
    }

    public override string FindFileError(string fileName)
    {
        if (Path.IsPathRooted(fileName))
        {
            return fileName;
        }

        if (Path.GetExtension(fileName) == ".lua")
        {
            fileName = fileName.Substring(0, fileName.Length - 4);            
        }

        using (CString.Block())
        {
            CString sb = CString.Alloc(512);

            for (int i = 0; i < searchPaths.Count; i++)
            {
                sb.Append("\n\tno file '").Append(searchPaths[i]).Append('\'');
            }

            sb.Append("\n\tno file './Resources/").Append(fileName).Append(".lua'")
              .Append("\n\tno file '").Append(LuaConst.luaResDir).Append('/')
			  .Append(fileName).Append(".lua'");
            sb = sb.Replace("?", fileName);

            return sb.ToString();
        }
    }

    byte[] ReadResourceFile(string fileName)
    {
        if (!fileName.EndsWith(".lua"))
        {
            fileName += ".lua";
        }

        byte[] buffer = null;
        string path = "Lua/" + fileName;
        TextAsset text = Resources.Load(path, typeof(TextAsset)) as TextAsset;

        if (text != null)
        {
            buffer = text.bytes;
            Resources.UnloadAsset(text);
        }

        return buffer;
    }

    byte[] ReadDownLoadFile(string fileName)
    {
        if (!fileName.EndsWith(".lua"))
        {
            fileName += ".lua";
        }

        string path = fileName;

        if (!Path.IsPathRooted(fileName))
        {            
            path = string.Format("{0}/{1}", LuaConst.luaResDir, fileName);            
        }

        if (File.Exists(path))
        {
#if !UNITY_WEBPLAYER
            return File.ReadAllBytes(path);
#else
            throw new LuaException("can't run in web platform, please switch to other platform");
#endif
        }

        return null;
    }
}
