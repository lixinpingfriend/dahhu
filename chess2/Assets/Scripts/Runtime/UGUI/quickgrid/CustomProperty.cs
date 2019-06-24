using UnityEngine;
using System;

//public class MultipleEnum : PropertyAttribute
//{
//    public System.Type type;

//    public MultipleEnum(System.Type type)
//    {
//        this.type = type;
//    }
//}

//public class UIName : PropertyAttribute
//{
//    public string lab;

//    public UIName() { lab = "UI Name"; }

//    public UIName(string lab) { this.lab = lab; }
//}

[AttributeUsage(AttributeTargets.Field, Inherited = true, AllowMultiple = true)]
public class PropertyLabel : PropertyAttribute
{
    public string lab;

    public PropertyLabel(string lab) { this.lab = lab; }
}



//public class FileName : PropertyAttribute
//{
//    public enum FileType
//    {
//        None,
//        OutputSprites,//导出到Sprites文件
//        Scene,//需要一个string[]且变量名相同(+Arr)的字段配合使用,最终名称列表保存在数组中,操作方式:没有则添加有则删除
//    }

//    public FileType funcType;

//    public System.Type type;

//    public FileName() { this.funcType = FileType.None; type = typeof(Object); }

//    public FileName(FileType funcType)
//    {
//        this.funcType = funcType;
//        switch (funcType)
//        {
//            case FileType.OutputSprites:
//                type = typeof(Texture);
//                break;
//            default:
//                type = typeof(Object);
//                break;
//        }
//    }

//    public FileName(FileType funcType, System.Type type)
//    {
//        this.funcType = funcType;
//        this.type = type;
//    }
//}

//public class DBField : PropertyAttribute
//{
//    public string fieldName;
//    public string dbPath;
//}

//public class StringInEditor : PropertyAttribute
//{

//}
