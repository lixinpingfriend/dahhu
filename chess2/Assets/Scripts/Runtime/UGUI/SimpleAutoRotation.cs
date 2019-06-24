

using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SimpleAutoRotation : MonoBehaviour 
{
    public enum Direction
    {
        /// <summary>逆时针</summary>
        Left = 0,
        /// <summary>顺时针</summary>
        Right,
    }

    public enum RotationType
    {
        Smoonth,
        StepByStep,
    }

    /// <summary>旋转方向</summary>
    public Direction dirRotate = Direction.Right;
    public RotationType rotationType = RotationType.Smoonth;
    /// <summary>旋转的角速度</summary>
    public float angleVectory = 100.0f;

    public bool ingorTime = false;


    public int partNumARound = 4;
    public float stepIntervalTime = 0.1f;
    Transform mTran;
    Vector3 mLocalAngle = Vector3.zero;

    private float m_lastStepTime = 0;
    private int m_curStepIndex = 0;
	void Start() 
	{
        mTran = this.transform;
        mLocalAngle = mTran.localEulerAngles;
	}
	
    void LateUpdate() {
        if(rotationType == RotationType.Smoonth)
        {
            float pastTime = ingorTime ? Time.unscaledDeltaTime : Time.deltaTime;
            if (dirRotate == Direction.Left) {
                mTran.Rotate(0.0f, 0.0f, pastTime * angleVectory);
            } else if (dirRotate == Direction.Right) {
                mTran.Rotate(0.0f, 0.0f, -pastTime * angleVectory);
            }
        }
        else if(rotationType == RotationType.StepByStep)
        {
            float curTime = ingorTime ? Time.realtimeSinceStartup : Time.time;
            if(curTime > m_lastStepTime + stepIntervalTime)
            {
                m_lastStepTime = curTime;
                if (dirRotate == Direction.Left) {
                    mTran.localEulerAngles = new Vector3(0f,0f,(360f/partNumARound) * m_curStepIndex++);
                } else if (dirRotate == Direction.Right) {
                    mTran.localEulerAngles = new Vector3(0f,0f,(-360f/partNumARound) * m_curStepIndex++);
                }
                if(m_curStepIndex == partNumARound)
                {
                    m_curStepIndex = 0;
                }
            }
        }
        
    }

}
