
using UnityEngine;
using System.Collections.Generic;
using System;

public class ToLuaNode<T>
{
    public List<ToLuaNode<T>> childs = new List<ToLuaNode<T>>();
    public ToLuaNode<T> parent = null;
    public T value;
    //添加命名空间节点所在位置，解决A.B.C/A.C存在相同名称却在不同命名空间所造成的Wrap问题
    public int layer;
}

public class ToLuaTree<T> 
{       
    public ToLuaNode<T> _root = null;
    private List<ToLuaNode<T>> _list = null;

    public ToLuaTree()
    {
        _root = new ToLuaNode<T>();
        _list = new List<ToLuaNode<T>>();
    }

    //加入pos跟root里的pos比较，只有位置相同才是统一命名空间节点
    void FindParent(List<ToLuaNode<T>> list, List<ToLuaNode<T>> root, Predicate<T> match, int layer)
    {
        if (list == null || root == null)
        {
            return;
        }

        for (int i = 0; i < root.Count; i++)
        {
            // 加入layer跟root里的pos比较，只有位置相同才是统一命名空间节点
            if (match(root[i].value) && root[i].layer == layer)
            {
                list.Add(root[i]);
            }

            FindParent(list, root[i].childs, match, layer);
        }
    }

    /*public void BreadthFirstTraversal(Action<ToLuaNode<T>> action)
    {
        List<ToLuaNode<T>> root = _root.childs;        
        Queue<ToLuaNode<T>> queue = new Queue<ToLuaNode<T>>();

        for (int i = 0; i < root.Count; i++)
        {
            queue.Enqueue(root[i]);
        }

        while (queue.Count > 0)
        {
            ToLuaNode<T> node = queue.Dequeue();
            action(node);

            if (node.childs != null)
            {
                for (int i = 0; i < node.childs.Count; i++)
                {
                    queue.Enqueue(node.childs[i]);
                }
            }
        }
    }*/

    public void DepthFirstTraversal(Action<ToLuaNode<T>> begin, Action<ToLuaNode<T>> end, ToLuaNode<T> node)
    {
        begin(node);

        for (int i = 0; i < node.childs.Count; i++)
        {            
            DepthFirstTraversal(begin, end, node.childs[i]);
        }

        end(node);
    }

    //只有位置相同才是统一命名空间节点
    public List<ToLuaNode<T>> Find(Predicate<T> match, int layer)
    {
        _list.Clear();
        FindParent(_list, _root.childs, match, layer);
        return _list;
    }

    public ToLuaNode<T> GetRoot()
    {
        return _root;
    }
}
