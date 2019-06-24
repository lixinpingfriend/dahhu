

using System;
using UnityEngine;
using System.Collections;
using UGUIExtend;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using DG.Tweening;

public class GameEventTriggerClickListener : MonoBehaviour, IPointerClickHandler, IPointerDownHandler, IPointerUpHandler
{
    public GameEventCollector gameEventCollector;

    public GameModule gameModule;

    // public float changeScale = 0.8f;

    // public float changeTime = 0.2f;

    // public GameObject changeObj;

    // public Ease outEase = Ease.Linear;

    // public Ease inEase = Ease.Linear;

    // int clickStatus = 0;

    public void OnPointerClick(PointerEventData eventData)
    {
        if (gameEventCollector != null)
        {
            gameEventCollector.OnButtonClick();
        }

        if (gameModule != null) {
            gameModule.OnButtonClick();
        }
        // if (changeObj != null)
        // {
        //     changeObj.transform.DOScale(new Vector3(1, 1, 1), changeTime);
        // }
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        if (gameEventCollector)
        {
            gameEventCollector.OnPointerDown(eventData);
        }
        if (gameModule != null) {
            gameModule.OnPointerDown(eventData);
        }
        // if (changeObj != null)
        // {
        //     changeObj.transform.DOScale(new Vector3(changeScale, changeScale, 1), changeTime).SetEase(outEase);
        // }
        // clickStatus = 1;
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        if (gameEventCollector)
        {
            gameEventCollector.OnPointerUp(eventData);
        }
        if (gameModule != null) {
            gameModule.OnPointerUp(eventData);
        }
        // if (changeObj != null)
        // {
        //     changeObj.transform.DOScale(new Vector3(1, 1, 1), changeTime).SetEase(inEase);
        // }
        // clickStatus = 2;
    }
    // public void OnApplicationFocus(bool focus)
    // {
    //     if (!focus && clickStatus == 1 && changeObj != null)
    //     {
    //         clickStatus = 2;
    //         changeObj.transform.DOScale(new Vector3(1, 1, 1), changeTime).SetEase(inEase);
    //     }
    // }
}