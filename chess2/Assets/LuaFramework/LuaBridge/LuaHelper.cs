using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using LuaInterface;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using Object = UnityEngine.Object;

public static class LuaHelper  {
    /// <summary>
    ///     the Layersmask
    /// </summary>
    /// <returns>The mask get mask.</returns>
    /// <param name="args">Arguments.</param>
    public static int GetLayerMask(string args)
    {
        var a = args.Split(',');
        return LayerMask.GetMask(a);
    }
    
    /// <summary>
    /// 得到两个点之间的夹角
    /// </summary>
    /// <param name="p1x"></param>
    /// <param name="p1y"></param>
    /// <param name="p2x"></param>
    /// <param name="p2y"></param>
    /// <returns></returns>
    public static float GetAngle(float p1x, float p1y, float p2x, float p2y)
    {
        var tmpx = p2x - p1x;
        var tmpy = p2y - p1y;
        var angle = Mathf.Atan2(tmpy, tmpx) * (180.0f / Mathf.PI);
        return angle;
    }

    /// <summary>
    ///     获取utf8字符串
    /// </summary>
    /// <param name="bytes"></param>
    /// <returns></returns>
    public static string GetUTF8String(Array bytes)
    {
        return Encoding.UTF8.GetString((byte[])bytes);
    }

    /// <summary>
    ///     获取bytes
    /// </summary>
    /// <param name="utf8Str"></param>
    /// <returns></returns>
    public static byte[] GetBytes(string utf8Str)
    {
        return Encoding.UTF8.GetBytes(utf8Str);
    }

    /// <summary>
    ///     Creates from byte array.
    /// </summary>
    /// <returns>The from byte array.</returns>
    /// <param name="bytes">Bytes.</param>
    public static AssetBundle LoadFromMemory(Array bytes)
    {
        var bts = (byte[])bytes;
#if UNITY_5_0 || UNITY_5_1 || UNITY_5_2
			AssetBundle ab = AssetBundle.CreateFromMemoryImmediate(bts);
#else
        var ab = AssetBundle.LoadFromMemory(bts);
#endif
        return ab;
    }

    /// <summary>
    /// 调用GC.Collect
    /// </summary>
    public static void GCCollect()
    {
        GC.Collect();
    }

    /// <summary>
    ///     str 转换为hash code
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    public static int StringToHash(string str)
    {
        var hash = Animator.StringToHash(str);
        return hash;
    }


    public static void ReleaseLuaFn(LuaFunction fn)
    {
        if (fn != null) fn.Dispose();
    }

    public static void SetTextColor(Text text, string color)
    {
        text.color = StringToColor(color);
    }

    public static void SetImageColor(Image img, string color)
    {
        img.color = StringToColor(color);
    }

    public static Color StringToColor(string color)
    {
        float[] rgba = new float[4];

        for (int i = 0; i < 4; i++)
        {
            string s = color.Substring(i * 2, 2);
            float f = (float)System.Convert.ToByte(s, 16) / 255f;
            rgba[i] = f;
        }

        return new Color(rgba[0], rgba[1], rgba[2], rgba[3]);
    }
}
