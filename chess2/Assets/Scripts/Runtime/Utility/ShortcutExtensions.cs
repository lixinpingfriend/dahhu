

using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;
using JetBrains.Annotations;
using UnityEngine.Events;
using UnityEngine.UI;
using Object = UnityEngine.Object;

/// <summary> 自定义Transform静态类 </summary>
public static class ShortcutExtensions
{
    //public static void SetX(this Transform transform, float x, bool setLocalPosition = true)
    //{
    //    if (setLocalPosition)
    //    {
    //        transform.localPosition = new Vector3(x, transform.localPosition.y, transform.localPosition.z);
    //    }
    //    else {
    //        transform.position = new Vector3(x, transform.position.y, transform.position.z);
    //    }
    //}

    //public static void SetAnchoredX(this RectTransform transform, float x)
    //{
    //    transform.anchoredPosition = new Vector2(x, transform.anchoredPosition.y);
    //}

    //public static void SetY(this Transform transform, float y, bool setLocalPosition = true)
    //{
    //    if (setLocalPosition)
    //    {
    //        transform.localPosition = new Vector3(transform.localPosition.x, y, transform.localPosition.z);
    //    }
    //    else {
    //        transform.position = new Vector3(transform.position.x, y, transform.position.z);
    //    }
    //}

    //public static void SetAnchoredY(this RectTransform transform, float y)
    //{
    //    transform.anchoredPosition = new Vector2(transform.anchoredPosition.x, y);
    //}

    //public static void SetZ(this Transform transform, float z, bool setLocalPosition = true)
    //{
    //    if (setLocalPosition)
    //    {
    //        transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, z);
    //    }
    //    else {
    //        transform.position = new Vector3(transform.position.x, transform.position.y, z);
    //    }
    //}

    //public static void AddX(this Transform transform, float x, bool setLocalPosition = true)
    //{
    //    if (setLocalPosition)
    //    {
    //        transform.localPosition = new Vector3(transform.localPosition.x + x, transform.localPosition.y, transform.localPosition.z);
    //    }
    //    else {
    //        transform.position = new Vector3(transform.position.x + x, transform.position.y, transform.position.z);
    //    }
    //}

    //public static void AddY(this Transform transform, float y, bool setLocalPosition = true)
    //{
    //    if (setLocalPosition)
    //    {
    //        transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y + y, transform.localPosition.z);
    //    }
    //    else {
    //        transform.position = new Vector3(transform.position.x, transform.position.y + y, transform.position.z);
    //    }
    //}

    //public static void AddZ(this Transform transform, float z, bool setLocalPosition = true)
    //{
    //    if (setLocalPosition)
    //    {
    //        transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, transform.localPosition.z + z);
    //    }
    //    else {
    //        transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z + z);
    //    }
    //}



    ///<summary> 距离的比较不采取实际真实的vectror的managunate来比较而是使用距离的平方来比较,省去开方的性能损耗</summary>
    ///return----> false:小于等于  true:大于
    public static bool DistanceCompareVector2(this Vector2 endpoint1, Vector2 endpoint2, float distance)
    {
        float dx = endpoint1.x - endpoint2.x;
        float dy = endpoint1.y - endpoint2.y;
        return dx * dx + dy * dy > distance * distance;
    }
    public static bool DistanceCompareVector3(this Vector3 endpoint1, Vector3 endpoint2, float distance)
    {
        float dx = endpoint1.x - endpoint2.x;
        float dy = endpoint1.y - endpoint2.y;
        float dz = endpoint1.z - endpoint2.z;
        return dx * dx + dy * dy + dz * dz > distance * distance;
    }
    public static float Pow2DistanceVector2(this Vector2 endpoint1, Vector2 endpoint2)
    {
        float dx = endpoint1.x - endpoint2.x;
        float dy = endpoint1.y - endpoint2.y;
        return dx * dx + dy * dy;
    }
    public static float Pow2DistanceVector3(this Vector3 endpoint1, Vector3 endpoint2)
    {
        float dx = endpoint1.x - endpoint2.x;
        float dy = endpoint1.y - endpoint2.y;
        float dz = endpoint1.z - endpoint2.z;
        return dx * dx + dy * dy + dz * dz;
    }

    public static T AddUniqueComponent<T>(this GameObject go) where T : Component
    {
        UnityEngine.Component component = go.GetComponent(typeof(T));
        if (component == null)
        {
            return go.AddComponent<T>();
        }
        return component as T;
    }
    public static T AddUniqueComponent<T>(this GameObject go, string childGameObjectPath) where T : Component
    {
        UnityEngine.Component component = go.GetComponent(typeof(T));
        if (component == null)
        {
            return go.AddComponent<T>();
        }
        return component as T;
    }

    public static Component AddUniqueComponent(this GameObject go, Type type)
    {
        Component component = go.GetComponent(type);
        if (component == null)
        {
            return go.AddComponent(type);
        }
        return component;
    }



    /// <summary>
    /// Sets the layer of all base_scripts recursively.
    /// </summary>
    /// <param name='theLayer'>
    /// The layer.
    /// </param>
    public static void SetLayerRecursively(this GameObject theGameObject, int theLayer)
    {
        theGameObject.layer = theLayer;
        Transform trans = theGameObject.transform;

        for (int i = 0; i < trans.childCount; i++)
        {
            SetLayerRecursively(trans.GetChild(i).gameObject, theLayer);
        }
    }

    /// <summary>
    /// Sets the scale recursively
    /// </summary>
    /// <param name="theTransform"></param>
    /// <param name="theScale"></param>
    public static void SetScaleRecursively(this Transform theTransform, Vector3 theScale)
    {
        for (int i = 0; i < theTransform.childCount; i++)
        {
            SetScaleRecursively(theTransform.GetChild(i), theScale);
        }
        theTransform.localScale = theScale;
    }

    //public static void DistancePow(Vector2 vec2, )

    /// <summary> 把某个trans换算成目标gameobject的值 </summary>
    public static Vector3 ConvertTo(this Transform trans, GameObject go)
    {
        Vector3 vec3 = trans.localPosition;
        //Transform transParent = trans.parent;
        //Transform targetParent = go.transform.parent;
        //while (transParent != targetParent) {

        //}

        Transform sourceParent = trans.parent;
        trans.parent = go.transform.parent;
        vec3 = trans.localPosition;
        trans.parent = sourceParent;
        return vec3;
    }

    public static Material GetMaterial(this Renderer rend)
    {
#if UNITY_EDITOR
        return rend.material;
#else
        return rend.sharedMaterial; 
#endif
    }

    public static List<T> ToDynList<T>(this IEnumerable<T> theList)
    {
        return new List<T>(theList);
    }

    public static T FindComponent<T>(this Transform transform, string targetTransformPath) where T : Component
    {
        Transform trans = transform.Find(targetTransformPath);
        if (trans != null)
        {
            return trans.GetComponent<T>();
        }
        return default(T);
    }


    /// <summary>
    /// 返回文件名不带扩展民
    /// </summary>
    public static string GetFilePathWithoutExtension(this string filePath)
    {
        int index = filePath.LastIndexOf('.');
        if (index >= 0)
        {
            filePath = filePath.Substring(0, index);
        }
        return filePath;
    }

    static public Transform SetParentAndNormalize(this Transform trans, Transform parent)
    {
        trans.SetParent(parent);
        trans.localPosition = Vector3.zero;
        trans.localEulerAngles = Vector3.zero;
        trans.localScale = Vector3.one;
        return trans;
    }

    static public Transform SetParentAndNormalize(this RectTransform trans, Transform parent) {
        trans.SetParent(parent);
        trans.anchorMin = Vector2.one * 0.5f;
        trans.anchorMax = Vector2.one * 0.5f;
        trans.anchoredPosition3D = Vector3.zero;
        trans.localEulerAngles = Vector3.zero;
        trans.localScale = Vector3.one;

        return trans;
    }

    static public Transform SetParentAndNormalize(this Transform trans, Transform parent, float scale)
    {
        trans.SetParent(parent);
        trans.localPosition = Vector3.zero;
        trans.localEulerAngles = Vector3.zero;
        trans.localScale = Vector3.one * scale;
        return trans;
    }

    /// <summary>
    /// Converts byte array to hex string
    /// </summary>
    /// <param name="buffer"></param>
    /// <returns></returns>
    public static string ToHexString(byte[] buffer)
    {
        string aHexString = string.Empty;
        for (int i = 0; i < buffer.Length; i++)
        {
            aHexString += string.Format("{0:x02}", buffer[i]);
        }
        return aHexString;
    }


}

public static class UGUIExtensions
{
    public static Image SetSpriteAndReSize(this Image image, Sprite sprite)
    {
        image.sprite = sprite;
        image.SetNativeSize();
        return image;
    }

    public static void AddUniqueClickListener(this Button go, UnityAction t, bool playSound = true)
    {
        go.onClick.RemoveAllListeners();
        go.onClick.AddListener(t);
    }

    public static void AddOnValueChangeUniqueListener(this Slider slider, UnityAction<float> t)
    {
        slider.onValueChanged.RemoveAllListeners();
        slider.onValueChanged.AddListener(t);
    }

    public static void AddOnValueChangeUniqueListener(this Toggle toggle, UnityAction<bool> t)
    {
        toggle.onValueChanged.RemoveAllListeners();
        toggle.onValueChanged.AddListener(t);
    }
}


public static class CollectionExtensions
{
    public static TResult[] ConvertAll<T, TResult>(this T[] items, Converter<T, TResult> transformation)
    {
        return Array.ConvertAll<T, TResult>(items, transformation);
    }

    public static T Find<T>(this T[] items, Predicate<T> predicate)
    {
        return Array.Find<T>(items, predicate);
    }

    public static T[] FindAll<T>(this T[] items, Predicate<T> predicate)
    {
        return Array.FindAll<T>(items, predicate);
    }

    public static void ForEach<T>(this IEnumerable<T> items, Action<T> action)
    {
        if (items != null)
        {
            foreach (T local in items)
            {
                action(local);
            }
        }
    }

    /// <summary>
    /// Join to string with separator
    /// </summary>
    /// <param name="theList"></param>
    /// <param name="theSeparator"></param>
    /// <returns></returns>
    public static string JoinToString<T>(this T[] theList, string theSeparator)
    {
        if (theList == null)
            return "";
        List<string> aListStrings = new List<string>();
        for (int i = 0; i < theList.Length; i++)
        {
            aListStrings.Add(theList[i].ToString());
        }
        return string.Join(theSeparator, aListStrings.ToArray());
    }


    public static bool IsNullOrEmpty(this IEnumerable @this)
    {
        if (@this != null)
        {
            return !@this.GetEnumerator().MoveNext();
        }
        return true;
    }
}
