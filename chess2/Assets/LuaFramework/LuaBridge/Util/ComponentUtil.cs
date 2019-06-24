using System;
using UnityEngine;
using System.Collections;
using System.Reflection;
using LuaInterface;
using Object = UnityEngine.Object;
using System.Collections.Generic;

public static class ComponentUtil
{
    static Dictionary<string, Type> cacheClassType = new Dictionary<string, Type>();
    static Dictionary<string, Assembly> cacheAssembly = new Dictionary<string, Assembly>();

    public static void SetLayer(Transform transform, int layer, bool includeChild)
    {
        transform.gameObject.layer = layer;
        if (includeChild)
        {
            var c = transform.childCount;
            for (var i = 0; i < c; i++)
            {
                var child = transform.GetChild(i);
                SetLayer(child, layer, true);
            }
        }
    }

    public static GameObject InstantiateLocal(GameObject original, GameObject parent)
    {
        return InstantiateLocal(original, parent, Vector3.zero);
    }

    public static GameObject InstantiateLocal(GameObject original)
    {
        return InstantiateLocal(original, null, Vector3.zero);
    }

    public static GameObject InstantiateLocal(GameObject original, Vector3 pos)
    {
        return InstantiateLocal(original, null, pos);
    }

    public static GameObject InstantiateLocal(GameObject original, GameObject parent, Vector3 pos)
    {
        var tranformTa = original.transform;
        if (pos == Vector3.zero) pos = tranformTa.localPosition;
        var rota = tranformTa.localRotation;
        var scale = tranformTa.localScale;
        var clone = Object.Instantiate(original);
        var transform = clone.transform;
        if (parent != null) clone.transform.SetParent(parent.transform);
        transform.localPosition = pos;
        transform.localScale = scale;
        transform.localRotation = rota;
        return clone;
    }

    /// <summary>
    /// </summary>
    /// <param name="original"></param>
    /// <param name="parent"></param>
    /// <returns></returns>
    public static GameObject InstantiateGlobal(GameObject original, GameObject parent = null)
    {
        var tranformTa = original.transform;
        var pos = tranformTa.position;
        var rota = tranformTa.rotation;
        var scale = tranformTa.localScale;
        var clone = Object.Instantiate(original);
        var transform = clone.transform;
        if (parent != null) clone.transform.SetParent(parent.transform);
        transform.position = pos;
        transform.localScale = scale;
        transform.rotation = rota;
        return clone;
    }

    /// <summary>
    /// 设置父对象
    /// </summary>
    /// <param name="child"></param>
    /// <param name="parent"></param>
    public static void SetParent(GameObject child, GameObject parent)
    {
        var tranformTa = child.transform;
        var pos = tranformTa.localPosition;
        var rota = tranformTa.localRotation;
        var scale = tranformTa.localScale;

        child.transform.SetParent(parent.transform);
        tranformTa.localPosition = pos;
        tranformTa.localScale = scale;
        tranformTa.localRotation = rota;
    }

    /// <summary>
    /// getType
    /// </summary>
    /// <param name="classname"></param>
    /// <returns></returns>
    public static Type GetClassType(string classname)
    {
        Type t = null;
        //缓存以后好多了
        if (cacheClassType.TryGetValue(classname, out t)) {
            return t;
        }
        Assembly assb = null;

        if (cacheAssembly.Count == 0) {
            assb = AppDomain.CurrentDomain.Load("UnityEngine");
            if (assb != null) {
                cacheAssembly.Add("UnityEngine", assb);
            }
            assb = AppDomain.CurrentDomain.Load("UnityEngine.UI");
            if (assb != null) {
                cacheAssembly.Add("UnityEngine.UI", assb);
            }
        }

        foreach (var item in cacheAssembly)
        {
            t = item.Value.GetType(classname);
            if (t != null)
            {
                cacheClassType.Add(classname, t);
                return t;
            }
        }
        // assb = AppDomain.CurrentDomain.Load("UnityEngine");
        // Debug.Log(assb.FullName);
        // assb = AppDomain.CurrentDomain.Load("UnityEngine.UI");
        // Debug.Log(assb.FullName);
        var assbs = AppDomain.CurrentDomain.GetAssemblies();
        for (var i = 0; i < assbs.Length; i++)
        {
            assb = assbs[i];
            t = assb.GetType(classname);
            if (t != null)
            {
                cacheClassType.Add(classname, t);
                return t;
            }
        }
        return null;
    }

    public static GameObject Find(GameObject obj, string path)
    {
        Transform trans = obj.transform.Find(path);
        if (trans != null)
        {
            return trans.gameObject;
        }
        else
        {
            return null;
        }
    }

    public static Component GetComponent(GameObject obj, string classname)
    {
        var t = GetClassType(classname);
        return GetComponent(obj, t);
    }

    public static Component GetComponent(GameObject obj, Type t)
    {
        Component comp = null;
        if ((obj != null) && (t != null)) comp = obj.GetComponent(t);
        return comp;
    }

    public static Component AddComponent(GameObject obj, string className)
    {
        var t = GetClassType(className);
        return AddComponent(obj, t);
    }


    public static Component AddComponent(GameObject obj, Type t)
    {
        Component comp = null;
        comp = GetComponent(obj, t);
        if (comp == null) comp = obj.AddComponent(t);
        return comp;
    }

    public static Component GetComponentWithPath(GameObject obj, string path, string classname)
    {
        Component comp = null;

        Transform tr = obj.transform.Find(path);
        if (tr)
        {
            var t = GetClassType(classname);
            if (t != null) {
                comp = GetComponent(tr.gameObject, t);
            }
        }
        return comp;
    }
    /// <summary>
    /// 根据父物体通过名字查找组件
    /// </summary>
    /// <param name="obj">父物体</param>
    /// <param name="name">父物体下的物体名字(父物体任意结构下)</param>
    /// <param name="classname">类型名字</param>
    /// <returns></returns>
    public static Component GetComponentWithSimple(GameObject obj, string name, string classname)
    {
        Component comp = null;

        GameObject findGB = FindGameObject(obj, name);
        if (findGB)
        {
            var t = GetClassType(classname);
            if (t != null) {
                comp = GetComponent(findGB, t);
            }
        }
        return comp;
    }
    
    private static GameObject FindGameObject(GameObject parent, string name)
    {
        if (parent.name == name)
        {
            return parent;
        }
        Transform transform = parent.transform;
        int i = 0;
        int childCount = transform.childCount;
        while (i < childCount)
        {
            GameObject gameObject = FindGameObject(transform.GetChild(i).gameObject, name);
            if (gameObject != null)
            {
                return gameObject;
            }
            i++;
        }
        return null;
    }

    public static Component[] GetComponents(GameObject obj, string classname) {
        var t = GetClassType(classname);
        return GetComponents(obj, t);
    }

    public static Component[] GetComponents(GameObject obj, Type t) {
        Component[] comp = null;
        if ((obj != null) && (t != null)) comp = obj.GetComponents(t);
        return comp;
    }


    public static Component[] GetComponentsInChildren(GameObject obj, string classname) {
        var t = GetClassType(classname);
        return GetComponentsInChildren(obj, t);
    }

    public static Component[] GetComponentsInChildren(GameObject obj, Type t) {
        if ((t != null) && (obj != null)) return obj.transform.GetComponentsInChildren(t);
        return null;
    }


    public static Component GetComponentInChildren(GameObject obj, string classname) {
        var t = GetClassType(classname);
        return GetComponentInChildren(obj, t);
    }


    public static Component GetComponentInChildren(GameObject obj, Type t) {
        Component comp = null;
        if ((t != null) && (obj != null)) comp = obj.GetComponentInChildren(t);
        return comp;
    }

    public static Transform[] GetAllChild(GameObject obj) {
        Transform[] child = null;
        var count = obj.transform.childCount;
        child = new Transform[count];
        for (var i = 0; i < count; i++) {
            child[i] = obj.transform.GetChild(i);
        }
        return child;
    }


    public static void GetAllChildAndCallback(GameObject parent, LuaFunction eachFn) {
        var pr = parent.transform;
        var count = pr.childCount;
        Transform child = null;
        for (var i = 0; i < count; i++) {
            child = pr.GetChild(i);
            eachFn.Call(i, child.gameObject);
        }
    }

    public static void SafeSetActive(this GameObject go, bool active)
    {
        if(go.activeSelf != active)
        {
            go.SetActive(active);
        }
    }

}
