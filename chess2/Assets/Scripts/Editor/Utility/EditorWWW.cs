using UnityEngine;
using System;
using UnityEditor;
using System.Collections.Generic;

public class EditorWWW {
    private WWW mWWW;
    private Action<string, object[]> mOperateWWWResult;
    private object[] mArguments;

    public void WWW(string path, WWWForm form, Action<string, object[]> operateWWWResult, params object[] arguments) {
        mOperateWWWResult = operateWWWResult;
        mArguments = arguments;
		mWWW = new WWW(path, form);
        EditorApplication.update += Tick;
    }

    public void WWW(string path, Action<string, object[]> operateWWWResult, params object[] arguments) {
        mOperateWWWResult = operateWWWResult;
        mArguments = arguments;
		mWWW = new WWW(path);
        EditorApplication.update += Tick;
    }

    public void WWW(string path, byte[] postData, Dictionary<string, string> headers, Action<string, object[]> operateWWWResult) {
        mOperateWWWResult = operateWWWResult;
		mWWW = new WWW(path, postData, headers);
        EditorApplication.update += Tick;
    }

    public void Tick() {
        if(mWWW.isDone) {
            EditorApplication.update -= Tick;
            if(!mWWW.error.IsNullOrEmpty()) {
                Debug.Log("Error during WWW process:\n" + mWWW.error);
            } else {
                if(mOperateWWWResult != null) mOperateWWWResult(mWWW.text, mArguments);
            }
            mWWW.Dispose();
        }
    }

    public void StopWWW() {
        EditorApplication.update -= Tick;
        if (mWWW != null) mWWW.Dispose();
    }
}