

using System;
using LuaInterface;
using UnityEngine;
using UnityEngine.Assertions.Must;
using Utility;

public enum TimeEventType {
    /// <summary> Unity的平常时间，会受TimeScale影响 </summary>
    Time,
    /// <summary> 真实时间 </summary>
    IngoreTimeScale,
    /// <summary> 使用服务器的时间 </summary>
    RealServerTime
}

public class TimeEvent {

    /// <summary> 过去了的时间（可用于普通增量计时） </summary>
    public float elapsedTime;
    /// <summary> 剩余的时间（可用于倒计时）,有可能小于0 </summary>
    public float surplusTime;
    /// <summary> 从某时开始增量 </summary>
    public float elapsedcurrentTime;

    public int surplusTimeRound {
        get { return Mathf.RoundToInt(surplusTime); }   //四舍五入到最近的整数
    }

    public int elapsedTimeRound {
        get { return Mathf.RoundToInt(elapsedTime); }   //四舍五入到最近的整数
    }

    public int elapsedcurrentTimeRound {
        get { return Mathf.RoundToInt(elapsedcurrentTime); }   //四舍五入到最近的整数
    }

    /// <summary> 携带的Object </summary>
    public UnityEngine.Object msgObj;

    internal void OnUpdate(string v) {
        throw new NotImplementedException();
    }

    /// <summary> 用来标识事件的唯一性，每一次生成的事件都不相同 </summary>
    public int id;
    /// <summary> 是否暂停 </summary>
    bool mPause = false;

    /// <summary> 起始时间 </summary>
    float mStartTime;
    /// <summary> 结束的时间 </summary>
    float mEndTime;
    /// <summary> 传入时间 </summary>
    float mCallTime;
    /// <summary> 是否使用结束时间，忘记代表什么意思了 </summary>
    private bool mUseEndTime = true;
    /// <summary> 下一次触发时间 </summary>
    float mNextTriggerTime;
    /// <summary> 更新的间隔(默认为一秒) </summary>
    float mUpdateIntervalTime = 1;

    bool mHasEventCallback;

    TimeEventType mTimeEventType = TimeEventType.Time;

    //上一次UpdateCallback调用的时间，以逝去的时间做比较，避免频繁毁掉
    private float mLastUpdateCallbackTime;

    float currentTime {
        get {
            if (mTimeEventType == TimeEventType.Time) {
                return Time.time;
            }
            return Time.realtimeSinceStartup;
        }
    }

    /// <summary> 结束回调 </summary>
    Action<TimeEvent> mOnCompleteCallback;
    /// <summary> 更新回调 </summary>
    Action<TimeEvent> mOnUpdateCallback;
    /// <summary> 终止回调 </summary>
    Action<TimeEvent> mOnKillCallback;

    [NoToLua]
    public void Init(float callTime, int eventGlobalId, TimeEventType timeType, UnityEngine.Object msgObj) {
        mTimeEventType = timeType;
        mStartTime = currentTime;
        mEndTime = mStartTime + callTime;
        mNextTriggerTime = mEndTime;
        mCallTime = callTime;
        id = eventGlobalId;
        this.msgObj = msgObj;
        mUpdateIntervalTime = 1;
    }

    /// <summary>
    /// 执行
    /// </summary>
    /// <returns> 是否需要回收 </returns>
    [NoToLua]
    public bool Execute() {
        if (!mHasEventCallback) {   //如果没有任何监听函数
#if DEBUG
            Debug.LogWarning("没有任何回调监听函数，退出并回收! ");
#endif
            Reset();
            return true;
        }

        try {
            bool executeComplete = false;
            if (mNextTriggerTime <= currentTime) {
                elapsedTime = currentTime - mStartTime;
                surplusTime = mEndTime - currentTime;
                elapsedcurrentTime = currentTime + mCallTime - mStartTime;

                if (mOnUpdateCallback != null && (mNextTriggerTime >= mEndTime || mLastUpdateCallbackTime < 0.1f || elapsedTime - mLastUpdateCallbackTime > mUpdateIntervalTime - 0.001f)) {
                    mOnUpdateCallback(this);
                    mLastUpdateCallbackTime = elapsedTime;
                }

                if (mNextTriggerTime >= mEndTime && mUseEndTime) {
                    executeComplete = true;
                    if (mOnCompleteCallback != null) {
                        mOnCompleteCallback(this);
                    }
                    Reset();
                } else {
                    mNextTriggerTime = mStartTime + elapsedTime + mUpdateIntervalTime;
                    mNextTriggerTime = Mathf.Min(mNextTriggerTime, mEndTime);
                }
            }
            return executeComplete;
        } catch (Exception ex) {
            Debug.LogError(ex);
            return true;
        }
    }

    public TimeEvent SetIntervalTime(float intervalCallTime, Action<TimeEvent> onUpdate = null) {
        mUpdateIntervalTime = intervalCallTime;
        mNextTriggerTime = mStartTime + mUpdateIntervalTime;
        mNextTriggerTime = Mathf.Min(mNextTriggerTime, mEndTime);
        mOnUpdateCallback = onUpdate;
        mHasEventCallback = true;
        return this;
    }

    public TimeEvent ResetInterval(float intervalCallTime) {
        mUpdateIntervalTime = intervalCallTime;
        mNextTriggerTime = mStartTime + elapsedTime + mUpdateIntervalTime;
        mNextTriggerTime = Mathf.Min(mNextTriggerTime, mEndTime);
        return this;
    }

    public TimeEvent SetPause(bool pauseState) {
        mPause = pauseState;
        return this;
    }

    public TimeEvent OnUpdate(Action<TimeEvent> onUpdate) {
        mHasEventCallback = true;
        mOnUpdateCallback = onUpdate;
        mNextTriggerTime = currentTime; //有OnUpdate的情况下会在下个update时触发一次
        //ResetInterval(mUpdateIntervalTime);
        return this;
    }


    public TimeEvent OnComplete(Action<TimeEvent> onComplete) {
        mHasEventCallback = true;
        mOnCompleteCallback = onComplete;
        return this;
    }

    public TimeEvent OnKill(Action<TimeEvent> onKill) {
        mHasEventCallback = true;
        mOnKillCallback = onKill;
        return this;
    }

    //设置唯一，不管调用多少次都只会有一个存在
    public TimeEvent Single() {
        if (!mHasEventCallback) {
            Debug.LogError("请在设置完回调函数再使用Single功能");
        }
        SmartTimer.instance.SingleSet(this);    //此处调用外部功能有点不爽，但又不想在初始化中设置太多的选项
        return this;
    }

    //TODO 延时执行还未实现
    //延时执行
    public TimeEvent Delay() {
        return this;
    }

    //判断回调是否相同
    [NoToLua]
    public bool CallbackEqual(TimeEvent targetTimeEvent) {
        if (mOnCompleteCallback == targetTimeEvent.mOnCompleteCallback || mOnUpdateCallback == targetTimeEvent.mOnUpdateCallback) {
            return true;
        }
        return false;
    }

    /// <summary>  开始执行，否则就要等到下一次条件满足时才执行。Start要放到最后调用  </summary>
    public TimeEvent Start() {
        mNextTriggerTime = mStartTime;
        mNextTriggerTime = Mathf.Min(mNextTriggerTime, mEndTime);
        if (Execute()) {
            Reset();
        }
        return this;
    }

    [NoToLua]
    /// <summary>  强制杀死，会触发Kll回调  </summary>
    internal void Kill() {
        if (mOnKillCallback != null) {
            mOnKillCallback(this);
        }
        Reset();
    }

    //重置，以供下一次使用，不对外使用
    private void Reset() {
        id = 0;
        mStartTime = 0;
        mEndTime = 0;
        mPause = false;
        msgObj = null;
        mUpdateIntervalTime = 0;
        mLastUpdateCallbackTime = 0;
        mHasEventCallback = false;
        mOnCompleteCallback = null;
        mOnUpdateCallback = null;
        mOnKillCallback = null;
    }
}

public class SmartTimer : MonoBehaviour {
    private static SmartTimer _instance;
    public static SmartTimer instance {
        get { return _instance; }
    }

    readonly ObjectPool<TimeEvent> mTimeMonitors = new ObjectPool<TimeEvent>();

    /// <summary>
    /// 服务器与客户端的秒数差。正数代表服务器比本地时间慢，负数代表服务器比本机快
    /// </summary>
    public long serverTimeDiff { get; set; }

    float mCurrentTime = 0;

    //用来全局标识事件
    private int mEventId = 0;

    void Awake() {
        _instance = this;
    }

    void Update() {
        if (mTimeMonitors.usingObjects.Count > 0) {
            for (int i = 0; i < mTimeMonitors.usingObjects.Count; i++) {
                var timeEvent = mTimeMonitors.usingObjects[i];
                if (timeEvent.Execute()) {
                    mTimeMonitors.Recycle(timeEvent);     //只有标志位可回收，才能回收
                    --i;
                }
            }
        }
    }

    /// <summary>
    /// 一次使用的时间事件，当结束后后自动回收
    /// </summary>
    /// <param name="callTimeFromNow">如果useTimestamp=true代表使用时间戳，否则为从现在开始往后执行的时间</param>
    /// <param name="useTimestamp">是否为时间戳，否则为时间差值</param>
    /// <param name="timeEventType">计时时间类型</param>
    public TimeEvent Subscribe(double callTimeFromNow, bool useTimestamp, int timeEventType) {
        return Subscribe(callTimeFromNow, useTimestamp, (TimeEventType)timeEventType);
    }


    /// <summary>
    /// 时间事件
    /// </summary>
    /// <param name="callTimeFromNow">如果useTimestamp=true代表使用时间戳，否则为从现在开始往后执行的时间</param>
    /// <param name="useTimestamp">是否为时间戳，否则为时间差值</param>
    /// <param name="timeEventType">计时时间类型</param>
    /// <param name="msgObj">携带的消息</param>
    [NoToLua]
    public TimeEvent Subscribe(double callTimeFromNow, bool useTimestamp, TimeEventType timeEventType, UnityEngine.Object msgObj = null) {
        float timeDiff = 0;
        if (timeEventType == TimeEventType.RealServerTime) {
            timeDiff = serverTimeDiff;
        }

        if (callTimeFromNow < 0) {
            callTimeFromNow = 0;
        }

        if (!useTimestamp) {    //不使用时间戳
            callTimeFromNow = callTimeFromNow + timeDiff;
        } else {
            //callTime为服务器的时间戳
            callTimeFromNow = callTimeFromNow - TimeUtility.nowToTimestamp + timeDiff;
        }
        var timeMonitor = mTimeMonitors.Spawn();
        mEventId++;
        timeMonitor.Init((float)callTimeFromNow, mEventId, timeEventType, msgObj); //此处已经可以转换成float，是转换后的时间差
        return timeMonitor;
    }

    /// <summary>
    /// 设置为回调响应为唯一，用于一些比较特别的情况
    /// </summary>
    public TimeEvent SingleSet(TimeEvent timeEvent) {
        for (int i = 0; i < mTimeMonitors.usingObjects.Count; i++) {
            var timeEventTmp = mTimeMonitors.usingObjects[i];
            if (timeEventTmp != timeEvent && timeEventTmp.CallbackEqual(timeEvent)) {   //把之前的删除
                timeEventTmp.Kill();
            }
        }
        return timeEvent;
    }

    /// <summary>
    /// 通过ID把即时器终止，模块中可以保存ID，用来随时终止
    /// </summary>
    /// <param name="id"></param>
    public void Kill(int id) {
        for (int i = 0; i < mTimeMonitors.usingObjects.Count; i++) {
            var timeEventTmp = mTimeMonitors.usingObjects[i];
            if (timeEventTmp.id == id) {   //把之前的
                timeEventTmp.Kill();
                break;
            }
        }
    }

    internal DateTime StampToDateTime(long timeStamp) {
        DateTime dateTimeStart = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));
        long lTime = long.Parse(timeStamp + "0000000");
        TimeSpan toNow = new TimeSpan(lTime);
        DateTime r = dateTimeStart.Add(toNow);
        return r;
    }

    void OnDestroy() {
        
    }

}
