using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace UGUIExtend
{
    /// <summary>
    /// 事件接受并抛给lua
    /// </summary>
    public class GameEventCollector : MonoBehaviour
    {
        [LuaInterface.NoToLua]
        public string projectName;

        public string packageName;

        public string moduleName;

        [LuaInterface.NoToLua]
        public void OnPointerDown(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onPressHandle(packageName, moduleName, g, eventData);
        }

        [LuaInterface.NoToLua]
        public void OnPointerUp(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onPressUpHandle(packageName, moduleName, g, eventData);
        }

        [LuaInterface.NoToLua]
        public void OnBeginDrag(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            PointerEventData ped = eventData as PointerEventData;
            GameUGUIEventDispatcher.onBeginDragHandle(packageName, moduleName, g, ped);
        }

        [LuaInterface.NoToLua]
        public void OnEndDrag(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            PointerEventData ped = eventData as PointerEventData;
            GameUGUIEventDispatcher.onEndDragHandle(packageName, moduleName, g, ped);
        }

        [LuaInterface.NoToLua]
        public void OnDrag(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            PointerEventData ped = eventData as PointerEventData;
            GameUGUIEventDispatcher.onDragHandle(packageName, moduleName, g, ped);
        }

        [LuaInterface.NoToLua]
        public void OnDrop(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onDropHandle(packageName, moduleName, g, eventData);
        }
        
        [LuaInterface.NoToLua]
        public void OnPointerClick(BaseEventData eventData)
        {
            //PointerEventData ped = eventData as PointerEventData;
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onClickHandle(packageName, moduleName, g, eventData);
        }

        [LuaInterface.NoToLua]
        public void OnSelect(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onSelectHandle(packageName, moduleName, g, eventData);
        }

        [LuaInterface.NoToLua]
        public void OnCancel(BaseEventData eventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onCancelHandle(packageName, moduleName, g, eventData);
        }
     
        [LuaInterface.NoToLua]
        public void OnButtonClick()
        {
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onClickHandle(packageName, moduleName, g); //Debug.Log("you are click "+g);
        }

        [LuaInterface.NoToLua]
        public void OnButtonClick(PointerEventData pointerEventData)
        {
            var g = EventSystem.current.currentSelectedGameObject;
            GameUGUIEventDispatcher.onClickHandle(packageName, moduleName, g); //Debug.Log("you are click "+g);
        }

    }
}