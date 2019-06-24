using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Text;

/// <summary>
/// @author 邱洪波

/// </summary>
namespace littlerbird.units
{
    /// <summary>
    /// 扩展Unity内部对象的方法
    /// </summary>
    public static class UnityExpand
    {

        public static void E_SortingOrder(this Transform t, int value)
        {
            Renderer ren = t.GetComponent<Renderer>();
            if (ren)
                ren.sortingOrder = value;
        }

        public static int E_SortingOrder(this Transform t)
        {
            Renderer ren = t.GetComponent<Renderer>();
            return ren ? ren.sortingOrder : 0;
        }

        public static void E_SortingOrder(this GameObject go, int value)
        {
            go.transform.E_SortingOrder(value);
        }

        public static int E_SortingOrder(this GameObject go)
        {
            return go.transform.E_SortingOrder();
        }

        public static void E_SortingOrder(this Component go, int value)
        {
            go.transform.E_SortingOrder(value);
        }

        public static int E_SortingOrder(this Component go)
        {
            return go.transform.E_SortingOrder();
        }

        public static void E_SetParentAndReset(this Transform t, Transform parent)
        {
            t.SetParent(parent);
            t.E_Reset();
        }

        public static void E_SetParentAndReset(this Transform t, GameObject parent)
        {
            t.E_SetParentAndReset(parent.transform);
        }

        public static void E_SetParentAndReset(this GameObject go, Transform parent)
        {
            go.transform.E_SetParentAndReset(parent);
        }

        public static void E_SetParentAndReset(this GameObject go, GameObject parent)
        {
            go.transform.E_SetParentAndReset(parent.transform);
        }

        public static void E_SetParentAndReset(this Component com, Transform parent)
        {
            com.transform.E_SetParentAndReset(parent);
        }

        public static void E_Reset(this Transform t)
        {
            t.localScale = Vector3.one;
            t.localPosition = Vector3.zero;
            t.localEulerAngles = Vector3.zero;
        }

        public static void E_Reset(this GameObject go)
        {
            go.transform.E_Reset();
        }

        public static void E_Reset(this Component com)
        {
            com.transform.E_Reset();
        }

        public static bool E_IsChildOf(this Component c, Transform parent)
        {
            return c.transform.IsChildOf(parent);
        }

        public static bool E_IsChildOf(this Component c, Component parent)
        {
            return c.transform.IsChildOf(parent.transform);
        }

        public static bool E_IsChildOf(this Transform c, Component parent)
        {
            return c.IsChildOf(parent.transform);
        }

        public static T E_FindInParent<T>(this Transform t) where T : Component
        {
            Transform p = t.parent;
            T result = null;
            while (p)
            {
                result = p.GetComponent<T>();
                if (result)
                    return result;
                p = p.parent;
            }
            return result;
        }

        public static T E_FindInParent<T>(this GameObject t) where T : Component
        {
            return t.transform.E_FindInParent<T>();
        }

        public static T E_FindInParent<T>(this Component t) where T : Component
        {
            return t.transform.E_FindInParent<T>();
        }
    }

    public static class CShapExpand
    {

        public static string E_Join<T>(this List<T> list, string str = null)
        {
            int count = list.Count;
            StringBuilder sb = new StringBuilder();
            bool empty = string.IsNullOrEmpty(str);
            for (int i = 0; i < count; i++)
            {
                if (i > 0 && !empty)
                    sb.Append(str);
                sb.Append(list[i].ToString());
            }
            return sb.ToString();
        }

        public static string E_Join<T>(this T[] array, string str = null)
        {
            StringBuilder sb = new StringBuilder();
            bool empty = string.IsNullOrEmpty(str);
            for (int i = 0; i < array.Length; i++)
            {
                if (i > 0 && !empty)
                    sb.Append(str);
                sb.Append(array[i].ToString());
            }
            return sb.ToString();
        }

        public static int E_IndexOf<T>(this T[] array, T t)
        {
            return E_IndexOf(array, t, 0, array.Length);
        }

        public static int E_IndexOf<T>(this T[] array, T t, int start, int end = -1)
        {
            if (end == -1)
                end = array.Length;
            for (int i = start; i < end; i++)
            {
                if (array[i].Equals(t))
                    return i;
            }
            return -1;
        }

        public static bool E_Contains<T>(this T[] array, T t)
        {
            return array.E_IndexOf(t) != -1;
        }

        /// <summary>
        /// 数组是否包含ts数组的所有元素(使用Equals判断元素是否相同)
        /// </summary>
        public static bool E_Contains<T>(this T[] array, T[] ts)
        {
            if (ts.Length > array.Length)
                return false;

            for (int i = 0; i < ts.Length; i++)
            {
                if (!array.E_Contains(ts[i]))
                    return false;
            }
            return true;
        }

        /// <summary>
        /// 克隆数组
        /// </summary>
        public static T[] E_Clone<T>(this T[] array)
        {
            if (array == null) return null;
            T[] result = new T[array.Length];
            System.Array.Copy(array, result, array.Length);
            return result;
        }

        /// <summary>
        /// 比较数组的值
        /// </summary>
        public static bool E_EqualsValue<T>(this T[] array, T[] t)
        {
            if (array.Length == t.Length)
            {
                for (int i = 0; i < array.Length; i++)
                {
                    if (!array[i].Equals(t[i]))
                        return false;
                }
            }
            else
                return false;
            return true;
        }



        /// <summary>
        /// 判断数组内容是否一致
        /// </summary>
        /// <param name="sameOrder">是否顺序也一直</param>
        /// <returns></returns>
        public static bool E_Equals<T>(this T[] array, T[] t, bool sameOrder = true)
        {
            if (array == null && t == null)
                return true;
            else if (array == null || t == null || array.Length != t.Length)
                return false;

            if (sameOrder)
            {
                for (int i = 0; i < array.Length; i++)
                {
                    if (!array[i].Equals(t[i]))
                        return false;
                }
            }
            else
            {
                List<T> list = new List<T>(t);
                int index;
                for (int i = 0; i < array.Length; i++)
                {
                    index = list.IndexOf(array[i]);
                    if (index != -1)
                        list.RemoveAt(index);
                    else
                        return false;
                }
            }
            return true;
        }
    }
}
