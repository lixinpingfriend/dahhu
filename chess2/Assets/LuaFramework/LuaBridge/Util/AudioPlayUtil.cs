using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LuaInterface;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Networking;
using BestHTTP;
using System.IO;

public static class AudioPlayUtil {
    //带有超时机制的请求
    public static AudioPlayOperation Create(AudioSource audioSource, AudioClip clip, float len) {
        var audioPlayOperation = new AudioPlayOperation(audioSource, clip, len);
        MonoBehaviourDispatcher.instance.AddCoroutine(audioPlayOperation);
        return audioPlayOperation;
    }
}



public class AudioPlayOperation : IEnumerator{
    private Action<AudioPlayOperation> mOnComplete;
    private AudioSource m_audioSource;
    private bool m_isFinish;
    private bool m_isStop;
    private bool m_isStarted;
    private AudioClip m_clip;

    private float m_startTime;
    private float m_len;

    public AudioClip clip
    {
        get{return m_clip;}
    }

    public AudioSource audioSource
    {
        get{return m_audioSource;}
    }

    public bool isFinish
    {
        get{return m_isFinish;}
    }
    public bool isStop
    {
        get{return m_isStop;}
    }
     [NoToLua]
    public AudioPlayOperation(AudioSource audioSource, AudioClip clip, float len)
    {
        m_clip = clip;
        m_audioSource = audioSource;
        m_audioSource.clip = clip;
        m_len = len;
    }

    [NoToLua]
    public object Current {
        get { return null; }
    }

    [NoToLua]
    public bool MoveNext() {
        if(m_isFinish){
            return false;
        }
        if(m_isStop){
            return false;
        }
        if(m_isStarted && !m_audioSource.isPlaying){
            m_isFinish = true;
            if(mOnComplete != null){
                mOnComplete(this);
            }
            return false;
        }

        if (m_startTime > 0 && m_len > 0 && Time.realtimeSinceStartup - m_startTime >= m_len) {
            this.Stop();
            return false;
        }
        return true;
    }

    [NoToLua]
    public void Reset() {

    }


    public AudioPlayOperation Subscribe(Action<AudioPlayOperation> onComplete) {
        mOnComplete = onComplete;
        return this;
    }

    public AudioPlayOperation Play()
    {
        m_isStarted = true;
        m_isFinish = false;
        m_isStop = false;
        m_startTime = Time.realtimeSinceStartup;
        m_audioSource.Play();
        return this;
    }

    public AudioPlayOperation Stop()
    {
        if(this.m_isStop || this.m_isFinish){
            return this;
        }
        this.m_isStop = true;
        this.m_isFinish = true;
        if(mOnComplete != null){
            mOnComplete(this);
        }
        return this;
    }
}

