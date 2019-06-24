using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;

/// <summary>
/// @author 邱洪波

/// </summary>
namespace littlerbird
{
    /// <summary>
    /// 通用工具
    /// </summary>
    public class PublicUnits
    {
        /// <summary>
        /// 查询指定类型的所有组件,包括子对象和未激活(active=false)的对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="tsf"></param>
        /// <returns></returns>
        public static T[] FindAllComponents<T>(Transform tsf) where T : MonoBehaviour
        {
            List<T> list = new List<T>();
            FindAllComponents<T>(tsf, list);
            return list.ToArray();
        }

        public static void FindAllComponents<T>(Transform tsf, List<T> list) where T : MonoBehaviour
        {
            for (int i = 0; i < tsf.childCount; i++)
            {
                FindAllComponents<T>(tsf.GetChild(i), list);
            }
            T t = tsf.GetComponent<T>();
            if (t)
                list.Add(t);
        }

        /// <summary>
        /// 设备码
        /// </summary>
        public string devId()
        {
            return SystemInfo.deviceUniqueIdentifier;
        }

        /// <summary>
        /// 操作系统
        /// </summary>
        public string os()
        {
            return SystemInfo.operatingSystem;
        }

        /// <summary>
        /// 获取自己的ip4地址,toString192.168.152.99, 或者使用getbytes
        /// </summary>
        /// <returns></returns>
        public static IPAddress getSelfIp()
        {
            IPHostEntry IpEntry = Dns.GetHostEntry(Dns.GetHostName());
            IPAddress[] list = IpEntry.AddressList;
            foreach (var ip in list)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                    return ip;
            }
            return null;
        }

        public static string toString(GameObject obj)
        {
            Transform t = obj.transform;
            string result = "name:" + GetFullName(t) +
                "\npostion:" + t.position + " localPosition:" + t.localPosition +
                "\nscale:" + t.localScale + " rotation:" + t.localRotation.eulerAngles;
            return result;
        }

        public static string tree(Transform t)
        {
            if (t)
            {
                Transform root = t;
                string empty = " +";
                string name = t.name;
                int emptyCount = 0;
                if (t.parent)
                {
                    name = t.parent.name + "/" + name;
                    empty = " -";
                }
                while (t.parent)
                {
                    t = t.parent;
                    emptyCount += t.name.Length;
                }
                for (int i = 0; i < emptyCount; i++)
                {
                    empty += " -";
                }
                empty += " ";

                t = root;
                string result = "";
                if (!t.gameObject.activeInHierarchy)
                    result = empty + "<color=#888888>" + name + "(" + (t.gameObject.activeSelf) + ")</color>";
                else
                    result = empty + name + "(" + (t.gameObject.activeSelf) + ")";

                for (int i = 0; i < t.childCount; i++)
                {
                    result += "\n" + tree(t.GetChild(i));
                }

                return result;
            }
            else
            {

                GameObject[] list = GameObject.FindObjectsOfType<GameObject>();//Resources.FindObjectsOfTypeAll<GameObject>();//
                string result = "";
                for (int i = 0; i < list.Length; i++)
                {
                    if (!list[i].transform.parent)//只处理根节点
                    {
                        if (result.Length > 0)
                            result += "\n";
                        result += tree(list[i].transform);
                    }
                }
                return result;
            }
        }


        /// <summary>
        /// 获取指定游戏对象的完整路径
        /// </summary>
        /// <param name="t"></param>
        /// <returns></returns>
        public static string GetFullName(Object c)
        {
            if (c is GameObject)
                return GetFullName(c as GameObject);
            else if (c is Transform)
                return GetFullName(c as Transform);
            else if (c is Component)
                return GetFullName(c as Component);
            else return null;
        }
        public static string GetFullName(Component c)
        {
            return GetFullName(c.transform);
        }
        public static string GetFullName(GameObject go)
        {
            return GetFullName(go.transform);
        }
        public static string GetFullName(Transform t)
        {
            string result = t.name;
            while (t.parent)
            {
                t = t.parent;
                result = t.name + "/" + result;
            }
            return result;
        }


        /// <summary>
        /// 查找游戏对象,包括active为false的对象
        /// </summary>
        /// <param name="name">可以是完整路径或部分路径</param>
        /// <returns></returns>
        public static GameObject FindByName(string name)
        {
            if (string.IsNullOrEmpty(name))
                return null;

            GameObject go = GameObject.Find(name);
            if (!go)
            {
                string[] names = name.Split('/');
                string lastName = names[names.Length - 1];
                GameObject[] list = Resources.FindObjectsOfTypeAll<GameObject>();
                Transform parent;
                bool find;
                for (int i = 0; i < list.Length; i++)
                {
                    if (list[i].name == lastName)
                    {
                        parent = list[i].transform.parent;
                        find = true;
                        for (int j = names.Length - 2; j >= 0; j--)
                        {
                            if (parent && names[j] == parent.name)
                            {
                                parent = parent.parent;
                            }
                            else
                            {
                                find = false;
                                break;
                            }
                        }
                        if (find)
                            return list[i];
                    }
                }
            }
            return go;
        }

        /// <summary>
        /// 查找指定类型的游戏对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static T FindByType<T>() where T : Object
        {
            T t = GameObject.FindObjectOfType<T>();
            if (!t)
            {
                T[] ts = Resources.FindObjectsOfTypeAll<T>();
                if (ts != null && ts.Length > 0)
                    t = ts[0];
            }
            return t;
        }

        /// <summary>
        /// 查找所有指定名称的游戏对象
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="name"></param>
        /// <returns></returns>
        public static T[] FindAllByName<T>(string name) where T : Component
        {
            if (string.IsNullOrEmpty(name))
                return null;

            T[] list = Resources.FindObjectsOfTypeAll<T>();
            string[] names = name.Split('/');
            string lastName = names[names.Length - 1];
            Transform parent;
            List<T> rs = new List<T>(list.Length);
            bool find;
            for (int i = 0; i < list.Length; i++)
            {
                if (list[i].name == lastName)
                {
                    parent = list[i].transform.parent;
                    find = true;
                    for (int j = names.Length - 2; j >= 0; j--)
                    {
                        if (parent && names[j] == parent.name)
                        {
                            parent = parent.parent;
                        }
                        else
                        {
                            find = false;
                            break;
                        }
                    }
                    if (find)
                        rs.Add(list[i]);
                }
            }
            return rs.ToArray();
        }
    }
}
