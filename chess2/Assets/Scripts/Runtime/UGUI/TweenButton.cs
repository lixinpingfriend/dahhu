using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using DG.Tweening;

public class TweenButton : MonoBehaviour,IPointerEnterHandler,IPointerExitHandler {

	RectTransform rectTrans;
	Text btnText;
	RectTransform popImg;
	public float scaleNum = 1.2f;
	public bool isNeedPopUp = false;
	public float moveY = 20f;
	public float moveTime = 1f;

	private Vector2 vTrans;
	private int fontSize;
	private Vector2 vImg;
	private Vector3 pTrans;

	Sequence scaleSeq;
	Sequence posSeq;
	Tween t;
	private bool isInit = false;
	void Awake()
	{
		rectTrans = GetComponent<RectTransform>();
		vTrans = rectTrans.sizeDelta;
		btnText = GetComponentInChildren<Text>(true);
		fontSize = btnText.fontSize;
		popImg = transform.Find("Image").GetComponent<RectTransform>();
		vImg = popImg.sizeDelta;
		pTrans = rectTrans.localPosition;
		scaleSeq = DOTween.Sequence();
		posSeq = DOTween.Sequence();
		
	}

	public void OnPointerEnter(PointerEventData eventData)
    {
		scaleSeq.Kill();
		if(t != null)
			t.Pause();
		scaleSeq.Append(
			DOTween.To(
				() => rectTrans.sizeDelta,
				(s) => rectTrans.sizeDelta = s,
				vTrans * scaleNum,
				0.2f
			)
		).Append(
			DOTween.To(
				() => btnText.fontSize,
				(s) => btnText.fontSize = s,
				(int)(fontSize * scaleNum),
				0.2f
			)
		).Append(
			DOTween.To(
				() => popImg.sizeDelta,
				(s) => popImg.sizeDelta = s,
				vImg * scaleNum,
				0.2f
			)
		);

	}
 
    public void OnPointerExit(PointerEventData eventData)
    {
		scaleSeq.Kill();
		scaleSeq.Append(
			DOTween.To(
				() => rectTrans.sizeDelta,
				(s) => rectTrans.sizeDelta = s,
				vTrans,
				0.2f
			)
		).Append(
			DOTween.To(
				() => btnText.fontSize,
				(s) => btnText.fontSize = s,
				fontSize,
				0.2f
			)
		).Append(
			DOTween.To(
				() => popImg.sizeDelta,
				(s) => popImg.sizeDelta = s,
				vImg,
				0.2f
			)
		);

		TweenPopUp();
	}

	void OnDisable()
	{
		Reset();
	}
	public void TweenPopUp()
	{
		if(isNeedPopUp) 
		{
			if(!isInit)
			{
				isInit = true;
				t = rectTrans.DOLocalMove(new Vector3(pTrans.x,pTrans.y+moveY,pTrans.z),moveTime).SetLoops(-1,LoopType.Yoyo);
				posSeq.Append(t);
			}
			t.Play();
		}
		else
		{
			isInit = false;
			if(t != null)
				t.Kill();
			posSeq.Kill();
			rectTrans.localPosition = pTrans;
		}
			
	}

	public void Reset()
	{
		isInit = false;
		isNeedPopUp = false;
		ResetAllTrans();
	}

	private void ResetAllTrans()
	{
		scaleSeq.Kill();
		if(t != null)
			t.Kill();
		posSeq.Kill();
		rectTrans.sizeDelta = rectTrans.sizeDelta;
		rectTrans.localPosition = pTrans;
		btnText.fontSize = fontSize;
		popImg.sizeDelta = vImg;
	}
}
