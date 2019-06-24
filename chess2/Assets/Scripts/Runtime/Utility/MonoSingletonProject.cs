


using UnityEngine;
using System.Collections;
// ReSharper disable All

/// <summary> MonoBehaviour单例基类 </summary>
public class MonoSingletonProject<T> : MonoBehaviour where T : MonoBehaviour   ///？？？？
{
    static T mInstance;

    public static T instance {
        get {
            if (null == mInstance) {

                mInstance = FindObjectOfType(typeof(T)) as T;  //查询T类型的对象,只能是激活的对象
                if (null == mInstance) {
                    //if (Application.isPlaying) {
                    //    GameObject go = new GameObject("_" + typeof(T).Name);
                    //    mInstance = go.AddComponent<T>();
                    //}
                    if (null == mInstance) {
                        if (Application.isPlaying/* && !Application.isEditor*/) {
                            Debug.LogError(typeof(T) + " 没有实例化！"); 
                        }
                    }
                }
            } else if (mInstance.gameObject == null) {
                Debug.LogError(typeof(T) + " 没有清理干净！"); 
            }

            return mInstance;
        }
    }

    void Awake() {
        mInstance = this as T;  //查询T类型的对象
#if Debug_Init_TimeWatch
        HelpFun.timeWatch.Reset();
        HelpFun.timeWatch.Start();
        OnAwake();
        HelpFun.timeWatch.Stop();
        if (HelpFun.timeWatch.Elapsed.TotalSeconds > 0.05f) {
            if (DebugManager.instance.log) Debug.Log(string.Format("MonoBehaviour<{0}>OnAwake：{1}", this.ToString(), HelpFun.timeWatch.Elapsed));
        }
#else
        OnAwake();
#endif
        RegisterNotificationListener(true);
    }

    void Start() {
        OnStart();
    }

    void OnDestroy() {
        RegisterNotificationListener(false);
        OnOnDestroy();
        mInstance = null;
    }


    protected virtual void OnAwake() {
    }

    protected virtual void OnStart() {
    }

    protected virtual void OnOnDestroy() {
    }

    protected virtual void RegisterNotificationListener(bool isAdd = true) {

    }
}

/// <summary> 普通单例基类(没有MonoBehaviour) </summary>
public class SingletonProject<T> where T : new()
{
    protected static T mInstance;  //通过静态变量获取类实例

    public static T instance {
        get {
            if (mInstance == null) {
#if Debug_Init_TimeWatch
                HelpFun.timeWatch.Reset();
                HelpFun.timeWatch.Start();
                mInstance = new T();
                HelpFun.timeWatch.Stop();
                if (HelpFun.timeWatch.Elapsed.TotalSeconds > 0.1f) {
                    Debug.Log(string.Format("Singleton<{0}>Ctor：{1}", mInstance.ToString(), HelpFun.timeWatch.Elapsed));
                }
#else
                mInstance = new T();
#endif
            }
            return mInstance;
        }
    }

    public static void New() {
        mInstance = new T();
    }
}
