



using LuaInterface;
using UnityEngine;

namespace UGUIExtend
{
    /// <summary>
    /// 事件处理
    /// </summary>
    public static class GameUGUIEventDispatcher
    {
        #region public

        public static void onCustomerHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onCustomerFn != null)
            {
                onCustomerFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onCustomerHandle(string packageName, string moduleName, object sender, Vector3 arg)
        {
            if (onCustomerFn != null && sender != null)
            {
                onCustomerFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onPressHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onPressFn != null && sender != null)
            {
                onPressFn.Call(packageName, moduleName, sender, arg);
            }
        }
        public static void onPressUpHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onPressUpFn != null && sender != null)
            {
                onPressUpFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onClickHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onClickFn != null && sender != null)
            {
                onClickFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onClickHandle(string packageName, string moduleName, object sender)
        {
            if (onClickFn != null && sender != null)
            {
                onClickFn.Call(packageName, moduleName, sender);
            }
        }

        public static void onEndDragHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onEndDragFn != null && sender != null)
            {
                onEndDragFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onBeginDragHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onBeginDragFn != null && sender != null)
            {
                onBeginDragFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onDragHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onDragFn != null && sender != null)
            {
                onDragFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onDropHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onDropFn != null && sender != null)
            {
                onDropFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onDropHandle(string packageName, string moduleName, object sender, bool arg)
        {
            if (onDropFn != null && sender != null)
            {
                onDropFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onDropHandle(string packageName, string moduleName, object sender, Vector3 arg)
        {
            if (onDropFn != null && sender != null)
            {
                onDropFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onSelectHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onSelectFn != null && sender != null)
            {
                onSelectFn.Call(packageName, moduleName, sender, arg);
            }
        }

        public static void onCancelHandle(string packageName, string moduleName, object sender, object arg)
        {
            if (onCancelFn != null && sender != null)
            {
                onCancelFn.Call(packageName, moduleName, sender, arg);
            }
        }

		public static void RemoveAllEvents()
		{
			onCustomerFn = null;
			onPressFn = null;
			onClickFn = null;
			onDragFn = null;
            onEndDragFn = null;
            onBeginDragFn = null;
			onDropFn = null;
			onSelectFn = null;
			onCancelFn = null;
            onPressUpFn = null;
		}

        #endregion
        public static LuaFunction onCustomerFn;

        public static LuaFunction onPressFn;

        public static LuaFunction onClickFn;

        public static LuaFunction onDragFn;

        public static LuaFunction onEndDragFn;

        public static LuaFunction onBeginDragFn;

        public static LuaFunction onDropFn;

        public static LuaFunction onSelectFn;

        public static LuaFunction onCancelFn;
        //public static LuaFunction onDoubleFn;

        public static LuaFunction onPressUpFn;
    }

}