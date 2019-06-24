

using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ProvinceView : MonoBehaviour {

    public enum MoveType
    {
        Horizontal,
        Vertical,
        None,
    }

    public class InputPhase
    {
        public TouchPhase phase;
        public Vector3 position;
		public int inputCount = 0;
    }

	public Transform item;

	private float scaleMin = 0.5f;
	private float scaleMax = 3;

    private float curScale = 1;

	private float moveSpeed = 30f;

    private float moveDistanceX = 360;

    private float moveDistanceY = 292.5f;

    private MoveType curMoveType = MoveType.None;
    private float itemCenterX = 640;
    private float itemCenterY = -360;

	//public float moveVer = 0.3f;


	private Vector3 lastPos = Vector3.zero;
    private Vector3 curPos = Vector3.zero;

    private float distance= 0;
    private float lastDist = 0;
    private float curDist = 0;
    int t;
    private Vector3 m_PositionBegan = Vector3.zero;
    private Vector3 m_PostionEnd = Vector3.zero;
    private Camera mainCamera;


	void Awake()
	{
		if(item == null) 
			item = this.transform.Find("Viewport/Content/Item");

        //Debug.LogError(item.localPosition);
        mainCamera = Camera.main;
	}

	public void Init(float moveSpeed, float scaleMin, float scaleMax, float moveDistanceX = 360, float moveDistanceY = 292.5f)
    {
        this.moveSpeed = moveSpeed;
        this.scaleMin = scaleMin;
        this.scaleMax = scaleMax;
        this.moveDistanceX = moveDistanceX;
        this.moveDistanceY = moveDistanceY;
    }

    public void SetItemCenter(float itemCenterX, float itemCenterY)
    {
        this.itemCenterX = itemCenterX;
        this.itemCenterY = itemCenterY;
    }


    public void SetMoveSpeed(float moveSpeed)
    {
        this.moveSpeed = moveSpeed;
    }

    public void SetScaleMin(float scaleMin)
    {
        this.scaleMin = scaleMin;
    }

    public void SetScaleMax(float scaleMax)
    {
        this.scaleMax = scaleMax;
    }

    public void SetMoveDistance(float moveDistanceX, float moveDistanceY)
    {
        this.moveDistanceX = moveDistanceX;
        this.moveDistanceY = moveDistanceY;
    }
    

    void LateUpdate()
    {
        InputPhase inputPhase = GetInputPhase();

        if (inputPhase.inputCount > 0) {
			if(inputPhase.inputCount == 1)
			{
				switch (inputPhase.phase) {
				case TouchPhase.Began:
					TouchBegan(inputPhase.position);
					break;
                case TouchPhase.Moved:
                    TouchMove(inputPhase.position);
                    break;
				case TouchPhase.Ended:
					TouchEnd(inputPhase.position);
					break;
				}
			}
			else if(inputPhase.inputCount > 1)
			{
				if((Input.GetTouch(0).phase==TouchPhase.Moved || Input.GetTouch(1).phase==TouchPhase.Moved))
				{
					var touch1 = Input.GetTouch(0); 
                    var touch2 = Input.GetTouch(1); 

                    curDist = Vector2.Distance(touch1.position, touch2.position);
                    if( t==0 )
                    {
                        lastDist = curDist;
                        t=1;
                    }
                    distance=curDist-lastDist;

                    if((distance < 0 && curScale > scaleMin) || (curScale < scaleMax && distance > 0))
                    {
                        Vector3 targetScale = item.transform.localScale + Vector3.one * distance *Time.deltaTime / 10;
                        if(targetScale.x < scaleMin)
                            item.transform.localScale = new Vector3(scaleMin,scaleMin,scaleMin) ;
                        else if(targetScale.x > scaleMax)
                            item.transform.localScale = new Vector3(scaleMax,scaleMax,scaleMax) ;
                        else
                            item.transform.localScale = targetScale;
                    }
                    else
                    {
                        if(curScale < scaleMin)
                            item.transform.localScale = new Vector3(scaleMin,scaleMin,scaleMin) ;
                        if(curScale > scaleMax)
                            item.transform.localScale = new Vector3(scaleMax,scaleMax,scaleMax) ;
                    }

                    curScale = item.transform.localScale.x;
                    
                    lastDist = curDist;
                }
			}

        }
    }

    private void TouchBegan(Vector3 pos)
    {
        m_PositionBegan = pos;
        lastPos = curPos = pos;
        Debug.Log ("TouchBegan:" + m_PositionBegan);
       // Debug.LogError(item.localPosition);
    }

    private void TouchEnd(Vector3 pos)
    {
        m_PostionEnd = pos;
        lastPos = curPos = pos;
        lastDist = curDist;
        t = 0;
        //curMoveType = MoveType.None;
        Debug.Log ("TouchEnd:" + m_PostionEnd);
    }

    private void TouchMove(Vector3 pos)
    {
        curPos = pos;
        float xValue = curPos.x - lastPos.x;
        float yValue = curPos.y - lastPos.y;
        // if(curMoveType == MoveType.None)
        // {
        //     if(Mathf.Abs(xValue) >= Mathf.Abs(yValue)) 
        //     {
        //         yValue = 0;
        //         curMoveType = MoveType.Horizontal;
        //     }
        //     else {
        //         xValue = 0;
        //         curMoveType = MoveType.Vertical;
        //     }
        // }
        // else if(curMoveType == MoveType.Horizontal)
        //     yValue = 0;
        // else if(curMoveType == MoveType.Vertical)
        //     xValue = 0;

        if(Mathf.Abs(xValue) - Mathf.Abs(yValue) >= 1)
        {
            yValue = 0;
            //curMoveType = MoveType.Horizontal;
        }
        else if(Mathf.Abs(yValue) - Mathf.Abs(xValue) >= 1) {
            xValue = 0;
            //curMoveType = MoveType.Vertical;
        }

        float posX = item.localPosition.x - itemCenterX;
        float posY = item.localPosition.y - itemCenterY;

        // Debug.Log("posX = " + posX);
        // Debug.Log("posY = " + posX);
        // Debug.Log("curScale * moveDistanceX = " + curScale * moveDistanceX);
        // Debug.Log("curScale * moveDistanceY = " + curScale * moveDistanceY);
        
        //Debug.Log("curPos = " + curPos);
        //Debug.Log("lastPos = " + lastPos);
        //Debug.Log("xValue = " + xValue);
        //Debug.Log("yValue = " + yValue);
        //curScale = item.transform.localScale.x;
        float repairNum = curScale <= 1.2 ? 0 : curScale <= 2 ? 0.4f * curScale :  0.6f * curScale;
        if(xValue > 1f)
        {
            if(posX < (curScale + repairNum) * moveDistanceX )
            {
                item.localPosition = new Vector3(item.localPosition.x + (moveSpeed * curScale), item.localPosition.y, item.localPosition.z);
                //Debug.Log("Move x > 1");
            }
        }
        else if(xValue < -1f)
        {
            if(posX > -(curScale + repairNum) * moveDistanceX)
            {
                item.localPosition = new Vector3(item.localPosition.x - (moveSpeed * curScale), item.localPosition.y, item.localPosition.z);
                //Debug.Log("Move x < 1");
            }
        }
        else{

        } 

        if(yValue > 1f)
        {
            if(posY < (curScale + repairNum) * moveDistanceY )
            {
                item.localPosition = new Vector3(item.localPosition.x, item.localPosition.y + (moveSpeed * curScale), item.localPosition.z);
                //Debug.Log("Move y > 1");
            }
        }
        else if(yValue < -1f)
        {
            if(posY > -(curScale + repairNum) * moveDistanceY)
            {
                item.localPosition = new Vector3(item.localPosition.x, item.localPosition.y - (moveSpeed * curScale), item.localPosition.z);
                //Debug.Log("Move y < 1");
            }
        }else{

        }
        lastPos = curPos;
    }


    private InputPhase GetInputPhase()
    {
        InputPhase inputPhase = new InputPhase ();
		inputPhase.inputCount = 0;
        #if UNITY_EDITOR
        if(Input.GetMouseButtonDown(0)){
			inputPhase.inputCount = 1;
            inputPhase.phase = TouchPhase.Began;
            inputPhase.position = Input.mousePosition;
        }else if(Input.GetMouseButtonUp(0)){
			inputPhase.inputCount = 1;
            inputPhase.phase = TouchPhase.Ended;
            inputPhase.position = Input.mousePosition;
        }else if(Input.GetMouseButton(0)){
			inputPhase.inputCount = 1;
            inputPhase.phase = TouchPhase.Moved;
            inputPhase.position = Input.mousePosition;
        }
        #elif UNITY_IOS || UNITY_ANDROID || UNITY_IPHONE

        if (Input.touchCount > 0) {
			Touch touch = Input.touches [0];
			inputPhase.inputCount = Input.touchCount;
			inputPhase.phase = touch.phase;
			inputPhase.position = touch.position;
        }
        #else
        Debug.Log("Unable to identify the game running environment");
        #endif
        return inputPhase;
    }
}
