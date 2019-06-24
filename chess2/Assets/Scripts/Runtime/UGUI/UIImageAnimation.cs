using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;

[RequireComponent(typeof(Image))]
public class UIImageAnimation : MonoBehaviour
{
    public string movieName;
    /// <summary> 是否自动播放 </summary>
    public bool autoPlay;
    /// <summary> 是否循环 </summary>
    public bool loop;

    public List<Sprite> sprites;

    /// <summary> 每一帧的时间 </summary>
    public float frameTime = 0.05f;

    float mDelta = 0;
    Image mImageShowe;
    int mCurFrame = 0;
    private bool playing = false;

    private Dictionary<int, List<Action<int>>> mFramePlayerEvents = new Dictionary<int, List<Action<int>>>();

    public float showerWidth {
        get {
            if (mImageShowe == null) {
                return 0;
            }
            return mImageShowe.rectTransform.rect.width;
        }
    }

    public float showerHeight {
        get {
            if (mImageShowe == null) {
                return 0;
            }
            return mImageShowe.rectTransform.rect.height;
        }
    }

    public int frameCount {
        get {
            return sprites.Count;
        }
    }

    /// <summary> 播放一次持续的时间 </summary>
    public float duration {
        get {
            return sprites.Count * frameTime;
        }
    }


    void Awake() {
        mImageShowe = GetComponent<Image>();
        if (mImageShowe == null) {
            Debug.LogError("请确认GameObject已附加Image组件");
        }
        if (string.IsNullOrEmpty(movieName)) {
            movieName = "movieName";
        }
    }
    void Start() {
        if (autoPlay) {
            Play(mCurFrame++); 
        }
    }

    public void Play(int frame) {
        playing = true;
        if (frame < frameCount) {
            mImageShowe.sprite = sprites[frame];
            mImageShowe.SetNativeSize();
            if (mFramePlayerEvents.ContainsKey(frame)) {
                foreach (Action<int> del in mFramePlayerEvents[frame]) {
                    del(frame);
                }
            }
        }
    }

    public void Stop(int frame){
        playing = false;
        mImageShowe.sprite = sprites[frame];
        mImageShowe.SetNativeSize();
    }

    void Update() {
        if (!playing) {
            return;
        }

        mDelta += Time.deltaTime;
        if (mDelta > frameTime) {
            mDelta = 0;
            Play(mCurFrame++);
            if (mCurFrame >= frameCount) {
                mCurFrame = 0;
                if (!loop) {
                    enabled = false;
                }
            }
        }
    }


    public void RegistMovieEvent(int frame, Action<int> delEvent, bool replace) {
        if (!mFramePlayerEvents.ContainsKey(frame)) {
            mFramePlayerEvents.Add(frame, new List<Action<int>>());
        }
        if(replace){
            mFramePlayerEvents[frame].Clear();
        }
        mFramePlayerEvents[frame].Add(delEvent);
    }

    public void UnregistMovieEvent(int frame, Action<int> delEvent) {
        if (!mFramePlayerEvents.ContainsKey(frame)) {
            return;
        }
        if (mFramePlayerEvents[frame].Contains(delEvent)) {
            mFramePlayerEvents[frame].Remove(delEvent);
        }
    }

}