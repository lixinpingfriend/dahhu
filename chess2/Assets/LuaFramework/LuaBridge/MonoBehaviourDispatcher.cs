using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

class MonoBehaviourDispatcher : MonoBehaviour {

    static MonoBehaviourDispatcher mInstance;

    private List<IEnumerator> mCoroutine = new List<IEnumerator>();

    public static MonoBehaviourDispatcher instance {
        get {
            if (mInstance == null) {
                mInstance = new GameObject("MonoBehaviourDispatcher").AddComponent<MonoBehaviourDispatcher>();
                DontDestroyOnLoad(mInstance);
            }
            return mInstance;
        }
    }


    private void Awake() {
        StartCoroutine(RunUpdateCoroutine());
    }

    private void Start() {

    }

    IEnumerator RunUpdateCoroutine() {
        while (true) {
            yield return null;
            for (int i = 0; i < mCoroutine.Count; i++) {
                if (!mCoroutine[i].MoveNext()) {
                    mCoroutine.RemoveAt(i);
                    i--;
                }
            }
        }
    }

    public void AddCoroutine(IEnumerator enumerator) {
        mCoroutine.Add(enumerator);
    }

}
