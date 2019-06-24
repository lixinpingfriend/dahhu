using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using System.Text;
using System;
using System.Globalization;

public class EmojiElement
{
    /// <summary>
    /// 表情对应的unicode,eg:1f601
    /// </summary>
    public string unicode = string.Empty;
    /// <summary>
    /// 是否是表情
    /// </summary>
    public bool isEmoji = false;

    public string originalText = string.Empty;
}

public struct EmojiInfo
{
    public float x;
    public float y;
    public float size;
    public int len;
}

public class EmojiUtil
{
    public static string emojiTextConfigPath = "single/emoji/emoji.bytes";
    public static string emojiMaterialPath = "single/emoji/material/uguiemoji.bytes";

    public static string replaceStr = "嗯";
    public static Material emojiMaterial = null;
    protected static Dictionary<string, EmojiInfo> emojiIndex = new Dictionary<string, EmojiInfo>();
    public static Dictionary<string, EmojiInfo> EmojiIndex
    {
        get
        {
            if (emojiIndex == null || emojiIndex.Count == 0)
            {
                var bundle = GameAsset.AssetBundleManager.instance.LoadAssetBundle(emojiTextConfigPath);
                TextAsset emojiContent = null;
                if (bundle != null)
                {
                    string assetName = Path.GetFileNameWithoutExtension(emojiTextConfigPath);
                    emojiContent = bundle.GetAsset<TextAsset>(assetName, false);
                }
                if (emojiContent != null)
                {
                    string[] lines = emojiContent.text.Split('\n');
                    for (int i = 1; i < lines.Length; i++)
                    {
                        if (!string.IsNullOrEmpty(lines[i]))
                        {
                            string[] strs = lines[i].Split('\t');
                            EmojiInfo info;
                            info.x = float.Parse(strs[3]);
                            info.y = float.Parse(strs[4]);
                            info.size = float.Parse(strs[5]);
                            info.len = 0;
                            emojiIndex[strs[0]] = info;
                        }
                    }
                }
            }
            return emojiIndex;
        }
    }


    public static Material EmojiMaterial
    {
        get
        {
            if (emojiMaterial == null)
            {
                var loadedAssetBundle = GameAsset.AssetBundleManager.instance.LoadAssetBundle(emojiMaterialPath);
                if (loadedAssetBundle != null)
                {
                    emojiMaterial = loadedAssetBundle.GetAsset<Material>("UGUIEmoji", false);
                }
            }
            return emojiMaterial;
        }
    }

    /// <summary>
    /// codePoint是否是表情字符
    /// 参考java的codePointAt
    /// </summary>
    public static bool isEmojiCharacter(int codePoint)
    {
        object obj = CustomerUtil.EmojiEventInvoke("isEmojiCharacter", codePoint);
        if (obj != null)
        {
            bool result = obj is bool && (bool)obj;
            if (result) return true;//lua判断是表情字符,那么就是表情字符。否则继续下面的判断
        }
        return (codePoint >= 0x2600 && codePoint <= 0x27BF) // 杂项符号与符号字体
                || codePoint == 0x303D
                || codePoint == 0x2049
                || codePoint == 0x203C
                || (codePoint >= 0x2000 && codePoint <= 0x200F)//
                || (codePoint >= 0x2028 && codePoint <= 0x202F)//
                || codePoint == 0x205F //
                || (codePoint >= 0x2065 && codePoint <= 0x206F)//
                                                               /* 标点符号占用区域 */
                || (codePoint >= 0x2100 && codePoint <= 0x214F)// 字母符号
                || (codePoint >= 0x2300 && codePoint <= 0x23FF)// 各种技术符号
                || (codePoint >= 0x2B00 && codePoint <= 0x2BFF)// 箭头A
                || (codePoint >= 0x2900 && codePoint <= 0x297F)// 箭头B
                || (codePoint >= 0x3200 && codePoint <= 0x32FF)// 中文符号
                || (codePoint >= 0xD800 && codePoint <= 0xDFFF)// 高低位替代符保留区域
                || (codePoint >= 0xE000 && codePoint <= 0xF8FF)// 私有保留区域
                || (codePoint >= 0xFE00 && codePoint <= 0xFE0F)// 变异选择器
                || codePoint >= 0x10000; // Plane在第二平面以上的，char都不可以存，全部都转
    }
    /// <summary>
    /// 是否是国旗表情,国旗占两位
    /// </summary>
    /// <returns></returns>
    private static bool isFlag(int codePoint)
    {
        object obj = CustomerUtil.EmojiEventInvoke("isFlag", codePoint);
        if (obj != null)
        {
            bool result = obj is bool && (bool)obj;
            if (result) return true;//lua判断是,那么就是。否则继续下面的判断
        }
        if (codePoint >= 0x1f1e0 && codePoint <= 0x1f1ff)
        {
            return true;
        }
        return false;
    }
    /// <summary>
    /// 是不是结尾表情符
    /// </summary>
    private static bool isEndCodePoint(int codePoint)
    {
        object obj = CustomerUtil.EmojiEventInvoke("isEndCodePoint", codePoint);
        if (obj != null)
        {
            bool result = obj is bool && (bool)obj;
            if (result) return true;//lua判断是,那么就是。否则继续下面的判断
        }
        if (codePoint >= 0x1f3fb && codePoint <= 0x1f3ff)
        {
            return true;
        }
        if (codePoint == 0x20e3)
        {
            return true;
        }
        return false;
    }
    /// <summary>
    /// 
    /// </summary>
    private static bool isGetEmoji(int codePoint, int nextCodePoint, int curEmojiCount)
    {
        object obj = CustomerUtil.EmojiEventInvoke("isGetEmoji", codePoint);
        if (obj != null)
        {
            bool result = obj is bool && (bool)obj;
            if (result) return true;//lua判断是,那么就是。否则继续下面的判断
        }
        if (curEmojiCount == 1)
        {
            if (isEndCodePoint(nextCodePoint))
            {
                return false;//下一个表情是结尾的
            }
            if (nextCodePoint == 0x200d || nextCodePoint == 0x2764)
            {
                return false;//下一个表情符必须要
            }
            if (isFlag(codePoint))
            {
                return false;//国旗符一定是两个组成
            }
            return true;
        }
        if (curEmojiCount == 2)
        {
            if (isFlag(codePoint))
            {
                return true;
            }
            if (isEndCodePoint(codePoint))
            {
                return true;
            }
            if (codePoint == 0x200d || codePoint == 0x2764)
            {
                return false;
            }
        }
        //这里就一直往下加
        return false;
    }
    /// <summary>
    /// 将中文或者表情放到list中
    /// 参考java的codePoint
    /// 两个表情挨着的情况暂时没处理
    /// out的resultText,将表情符号替换为█,用来计算Text的cachedTextGenerator
    /// </summary>
    public static List<EmojiElement> getEmojiList(string str, out string resultText)
    {
        resultText = str;
        List<EmojiElement> arr = new List<EmojiElement>();
        StringInfo si = new StringInfo(str);
        StringBuilder builder = new StringBuilder();
        int emojiCount = 0;
        for (int i = 0; i < si.LengthInTextElements; i++)
        {
            string ele = si.SubstringByTextElements(i, 1);
            string unicode = "0x" + toUnicode(ele);
            //Debug.Log("i : " + i);
            string nextUnicode = string.Empty;
            if (i < si.LengthInTextElements - 1)
            {
                string element1 = si.SubstringByTextElements(i + 1, 1);
                nextUnicode = "0x" + toUnicode(element1);
            }
            try
            {
                int e = Convert.ToInt32(unicode, 16);
                bool isEmoji = isEmojiCharacter(e);

                int nextInt = 0;
                bool isNextEmoji = false;
                if (!string.IsNullOrEmpty(nextUnicode))
                {
                    nextInt = Convert.ToInt32(nextUnicode, 16);
                    isNextEmoji = isEmojiCharacter(nextInt);
                }
                if (isEmoji)
                {
                    builder.Append(ele);
                    emojiCount++;
                    if (isGetEmoji(e, nextInt, emojiCount))
                    {
                        EmojiElement ee1 = new EmojiElement();
                        ee1.isEmoji = true;
                        ee1.unicode = toUnicode(builder.ToString());
                        ee1.originalText = builder.ToString();
                        resultText = resultText.Replace(ee1.originalText, replaceStr);
                        arr.Add(ee1);
                        builder.Remove(0, builder.Length);
                        emojiCount = 0;
                    }
                }
                else
                {
                    if (!string.IsNullOrEmpty(builder.ToString()))
                    {
                        EmojiElement ee1 = new EmojiElement();
                        ee1.isEmoji = true;
                        ee1.unicode = toUnicode(builder.ToString());
                        ee1.originalText = builder.ToString();
                        resultText = resultText.Replace(ee1.originalText, replaceStr);
                        arr.Add(ee1);
                        builder.Remove(0, builder.Length);
                        emojiCount = 0;
                    }
                    EmojiElement ee = new EmojiElement();
                    ee.isEmoji = false;
                    arr.Add(ee);
                }
                if (i == si.LengthInTextElements - 1)
                {
                    if (!string.IsNullOrEmpty(builder.ToString()))
                    {
                        EmojiElement ee1 = new EmojiElement();
                        ee1.isEmoji = true;
                        ee1.unicode = toUnicode(builder.ToString());
                        ee1.originalText = builder.ToString();
                        resultText = resultText.Replace(ee1.originalText, replaceStr);
                        arr.Add(ee1);
                        builder.Remove(0, builder.Length);
                        emojiCount = 0;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.Log(ex.ToString());
            }

        }
        return arr;
    }
    /// <summary>
    /// 将表情字符串转成unicode（result eg1:1f60a(微笑) eg2:1f1e8_1f1f3(国旗表情)）
    /// 结果与表情图片相对应
    /// </summary>
    public static string toUnicode(string s)
    {
        object obj = CustomerUtil.EmojiEventInvoke("toUnicode", s);
        if (obj != null && obj is string)
        {
            string result = (string)obj;
            if (!string.IsNullOrEmpty(result)) return result;//lua层能返回结果,那么以lua为准
        }
        else
        {
            Debug.LogWarning("toUnicode call failure");
        }
        var bytes = Encoding.UTF32.GetBytes(s);
        var stringBuilder = new StringBuilder();
        List<List<byte>> resultList = new List<List<byte>>();
        List<byte> tempList = new List<byte>();
        for (int i = 0, length = bytes.Length; i < length; i++)
        {
            tempList.Add(bytes[i]);
            if (tempList.Count == 4)
            {
                tempList.Reverse();
                resultList.Add(tempList);
                tempList = new List<byte>();
            }
        }
        for (int i = 0, length = resultList.Count; i < length; i++)
        {
            List<byte> elist = resultList[i];
            bool isFirst = false;
            for (int j = 0; j < elist.Count; j++)
            {
                string b = elist[j].ToString("x2");
                if (b == "00" && j < 2)
                    continue;
                if (!isFirst)
                {
                    isFirst = true;
                    if (j < 2)
                        b = elist[j].ToString("x");
                    stringBuilder.Append(b);
                }
                else
                {
                    stringBuilder.Append(b);
                }
                //Debug.Log(b);
            }
            if (isFirst && i != length - 1)
            {
                stringBuilder.Append("_");
            }
        }
        return stringBuilder.ToString().Replace("_0000", "");
    }

    public static void CopyTextValueToEmojiText(UnityEngine.UI.Text text, EmojiText emojiText) {
            emojiText.text = text.text;

            emojiText.font = text.font;
            emojiText.fontStyle = text.fontStyle;
            emojiText.fontSize = text.fontSize;
            emojiText.lineSpacing = text.lineSpacing;
            emojiText.supportRichText = text.supportRichText;

            emojiText.alignment = text.alignment;
            emojiText.alignByGeometry = text.alignByGeometry;
            emojiText.horizontalOverflow = text.horizontalOverflow;
            emojiText.verticalOverflow = text.verticalOverflow;
            emojiText.resizeTextForBestFit = text.resizeTextForBestFit;
            emojiText.resizeTextMinSize = text.resizeTextMinSize;
            emojiText.resizeTextMaxSize = text.resizeTextMaxSize;

            emojiText.color = text.color;
            emojiText.material = EmojiMaterial;
            emojiText.raycastTarget = text.raycastTarget;
    }

    public static EmojiText ReplaceComponentText(UnityEngine.UI.Text text, string showText)
    {
        if (text != null)
        {
            GameObject textRoot = text.gameObject;
            // Font font = text.font;
            // int fontSize = text.fontSize;
            // FontStyle fontStyle = text.fontStyle;
            // bool alignByGeometry = text.alignByGeometry;
            // TextAnchor alignment = text.alignment;
            // HorizontalWrapMode horizontalOverflow = text.horizontalOverflow;
            // VerticalWrapMode verticalOverflow = text.verticalOverflow;
            // Color color = text.color;

            // //处理GradientColor
            // UiEffect.GradientColor gradientColor = textRoot.GetComponent<UiEffect.GradientColor>();
            // bool withGradientColor = false;
            // UiEffect.GradientColor.DIRECTION direction = UiEffect.GradientColor.DIRECTION.Both;
            // Color colorBottom = Color.white;
            // Color colorTop = Color.white;
            // Color colorLeft = Color.white;
            // Color colorRight = Color.white;
            // if (gradientColor != null)
            // {
            //     withGradientColor = true;
            //     direction = gradientColor.direction;
            //     colorTop = gradientColor.colorTop;
            //     colorBottom = gradientColor.colorBottom;
            //     colorLeft = gradientColor.colorLeft;
            //     colorRight = gradientColor.colorRight;
            // }
            // Component.Destroy(gradientColor);
            Component.DestroyImmediate(text);
            EmojiText emojiText = textRoot.AddUniqueComponent<EmojiText>();
            EmojiUtil.CopyTextValueToEmojiText(text, emojiText);

            // eText.font = font;
            // eText.fontSize = fontSize;
            // eText.fontStyle = fontStyle;
            // eText.alignByGeometry = alignByGeometry;
            // eText.alignment = alignment;
            // eText.horizontalOverflow = horizontalOverflow;
            // eText.verticalOverflow = verticalOverflow;
            // eText.color = color;
            // eText.material = EmojiMaterial;
            // eText.text = showText;
            // eText.raycastTarget = text.raycastTarget;
            // eText.resizeTextForBestFit = text.resizeTextForBestFit;
            // eText.resizeTextMinSize = text.resizeTextMinSize;
            // eText.resizeTextMaxSize = text.resizeTextMaxSize;

            //eText.material.shader = Shader.Find(eText.material.shader.name);
            //处理GradientColor
            UiEffect.GradientColor gradientColor = textRoot.GetComponent<UiEffect.GradientColor>();
            if (gradientColor != null)
            {
                gradientColor.Refresh();
            }

            // if(withGradientColor)
            // {
            //     UiEffect.GradientColor newGradientColor = textRoot.AddComponent<UiEffect.GradientColor>();
            //     newGradientColor.direction = direction;
            //     newGradientColor.colorBottom = colorBottom;
            //     newGradientColor.colorTop = colorTop;
            //     newGradientColor.colorLeft = colorLeft;
            //     newGradientColor.colorRight = colorRight;
            // }
            return emojiText;
        }
        return null;
    }

    /// <summary>
    /// 字符串是否包含表情
    /// </summary>
    public static bool containsEmoji(string source)
    {
        int len = source.Length;
        char[] arr = source.ToCharArray();
        bool isEmoji = false;
        for (int i = 0; i < len; i++)
        {
            char hs = arr[i];
            if (0xd800 <= hs && hs <= 0xdbff)
            {
                if (source.Length > 1)
                {
                    char ls = arr[i + 1];
                    int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f77f)
                    {
                        return true;
                    }
                }
            }
            else
            {
                // non surrogate
                if (0x2100 <= hs && hs <= 0x27ff && hs != 0x263b)
                {
                    return true;
                }
                else if (0x2B05 <= hs && hs <= 0x2b07)
                {
                    return true;
                }
                else if (0x2934 <= hs && hs <= 0x2935)
                {
                    return true;
                }
                else if (0x3297 <= hs && hs <= 0x3299)
                {
                    return true;
                }
                else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50 || hs == 0x231a)
                {
                    return true;
                }
                if (!isEmoji && source.Length > 1 && i < source.Length - 1)
                {
                    char ls = arr[i + 1];
                    if (ls == 0x20e3)
                    {
                        return true;
                    }
                }
            }
        }
        return isEmoji;
    }
    /// <summary>
    /// 获取长度,一个表情算一个长度
    /// 翻译自ios,好像并没有用
    /// </summary>
    public static int getLength(string source)
    {
        char[] arr = source.ToCharArray();
        int stringLength = 0;
        for (int i = 0, len = arr.Length; i < len; i++)
        {
            char hs = arr[0];
            if (0xd800 <= hs && hs <= 0xdbff)
            {
                if (len > 1)
                {
                    char ls = arr[1];
                    int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                    if (0x1d000 <= uc && uc <= 0x1f9c0)
                    {
                        stringLength += 1;
                    }
                }
            }
            else if (len > 1)
            {
                // non surrogate
                char ls = arr[1];
                if (ls == 0x20e3 || ls == 0xfe0f || ls == 0xd83c)
                {
                    stringLength += 1;
                }
            }
            else
            {
                if (0x2100 <= hs && hs <= 0x27ff)
                {
                    stringLength += 1;
                }
                else if (0x2B05 <= hs && hs <= 0x2b07)
                {
                    stringLength += 1;
                }
                else if (0x2934 <= hs && hs <= 0x2935)
                {
                    stringLength += 1;
                }
                else if (0x3297 <= hs && hs <= 0x3299)
                {
                    stringLength += 1;
                }
                else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030
                    || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
                {
                    stringLength += 1;
                }
            }
        }
        return stringLength;
    }
}