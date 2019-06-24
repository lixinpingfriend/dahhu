using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using LuaInterface;
using UGUIExtend;

public class GameModule : MonoBehaviour
{
	public string projectName;
	public string packageName;

	public string moduleName;

	LuaFunction onCustomData = null;

	public List<ComponentCache> componentCache;

    [HideInInspector]
    public List<CanvasData> m_canvasList;
	public Canvas canvasRoot;
	
	[HideInInspector]
	public List<RendererSorting> rendererSortingList;

	public void InitComponent (LuaTable table)
	{
		table ["transformRoot"] = transform;
		canvasRoot = GetComponent<Canvas>();
		if (canvasRoot != null) {
			table ["canvasRoot"] = canvasRoot;
		}

		if (componentCache != null) {
			foreach (var item in componentCache) {
				item.SetCacheToLua (table);
			}
		}
	}
	
	public void SetLayers()
    {
		int curLayer = 0;
        if (canvasRoot == null)
        {
			canvasRoot = GetComponent<Canvas>();
        }
		if(canvasRoot!=null)
		{
			curLayer = canvasRoot.sortingOrder;
		}
	
        if (m_canvasList == null || m_canvasList.Count == 0)
            return;
        int count = m_canvasList.Count;
        
        for (int i = 0; i < count; i++)
        {
             switch(m_canvasList[i].type)
            {
                case SortOrderType.canvas:
				if(m_canvasList[i].canvas!=null)
				{
					m_canvasList[i].canvas.overrideSorting = true;
                    m_canvasList[i].canvas.sortingOrder = curLayer + m_canvasList[i].sortLayer;
				}   
                break;
                case SortOrderType.renderer:
				if(m_canvasList[i].renderer!=null)
				{
  					m_canvasList[i].renderer.sortingOrder = curLayer + m_canvasList[i].sortLayer;
				} 
                break;
            }          
        }
    }

	[NoToLua]
	public void AddRendererSorting(RendererSorting renderer)
	{
		if (rendererSortingList == null)
		{
			rendererSortingList = new List<RendererSorting>();
		}

		if (!rendererSortingList.Contains(renderer))
		{
			rendererSortingList.Add(renderer);
		}
	}

	public void SetRendererSortingOrder()
	{
		int curLayer = 0;
		if (canvasRoot == null)
		{
			canvasRoot = GetComponent<Canvas>();
		}
		if(canvasRoot!=null)
		{
			curLayer = canvasRoot.sortingOrder;
		}
		if (rendererSortingList != null)
		{
			foreach (var rendererSorting in rendererSortingList)
			{
				rendererSorting.renderer.sortingOrder = curLayer + rendererSorting.initialSortLayer;
			}
		}
	}

	[LuaInterface.NoToLua]
	public void OnPointerDown (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onPressHandle (packageName, moduleName, g, eventData);
	}

	[LuaInterface.NoToLua]
	public void OnPointerUp (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onPressUpHandle (packageName, moduleName, g, eventData);
	}

	[LuaInterface.NoToLua]
	public void OnBeginDrag (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		PointerEventData ped = eventData as PointerEventData;
		GameUGUIEventDispatcher.onBeginDragHandle (packageName, moduleName, g, ped);
	}

	[LuaInterface.NoToLua]
	public void OnEndDrag (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		PointerEventData ped = eventData as PointerEventData;
		GameUGUIEventDispatcher.onEndDragHandle (packageName, moduleName, g, ped);
	}

	[LuaInterface.NoToLua]
	public void OnDrag (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		PointerEventData ped = eventData as PointerEventData;
		GameUGUIEventDispatcher.onDragHandle (packageName, moduleName, g, ped);
	}

	[LuaInterface.NoToLua]
	public void OnDrop (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onDropHandle (packageName, moduleName, g, eventData);
	}

	[LuaInterface.NoToLua]
	public void OnPointerClick (BaseEventData eventData)
	{
		//PointerEventData ped = eventData as PointerEventData;
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onClickHandle (packageName, moduleName, g, eventData);
	}

	[LuaInterface.NoToLua]
	public void OnSelect (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onSelectHandle (packageName, moduleName, g, eventData);
	}

	[LuaInterface.NoToLua]
	public void OnCancel (BaseEventData eventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onCancelHandle (packageName, moduleName, g, eventData);
	}

	[LuaInterface.NoToLua]
	public void OnButtonClick ()
	{
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onClickHandle (packageName, moduleName, g); //Debug.Log("you are click "+g);
	}

	[LuaInterface.NoToLua]
	public void OnButtonClick (PointerEventData pointerEventData)
	{
		var g = EventSystem.current.currentSelectedGameObject;
		GameUGUIEventDispatcher.onClickHandle (packageName, moduleName, g); //Debug.Log("you are click "+g);
	}

}

public enum SortOrderType
{
    canvas,
    renderer,
}

[System.Serializable]
public class CanvasData
{
    public SortOrderType type = SortOrderType.canvas;
    public Canvas canvas;
    public Renderer renderer;
    public int sortLayer;
}