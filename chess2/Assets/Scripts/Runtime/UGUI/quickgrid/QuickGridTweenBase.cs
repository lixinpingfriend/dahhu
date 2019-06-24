using UnityEngine;
using System.Collections;
using DG.Tweening;


namespace littlerbird.UI
{
    public class QuickGridTweenBase : MonoBehaviour
    {
        public enum PosType
        {
            Pos,//固定位移
            Offset,//相对位移
            OffsetX,//x使用相对位移,Y使用固定值
            OffsetY,//y使用相对位移,X使用固定值
        }

        public QuickGrid config;

        //public QuickGrid.GridTweenType type;

        [Tooltip("Item动画时长")]
        [Range(0, 10)]
        public float interval = 0.4f;

        [Tooltip("Line/Row动画间隔")]
        [Range(0, 10)]
        public float lineRowDelay = 0.1f;//每行间隔,选择type=Cell,则该值设置无效

        [Tooltip("Item动画间隔")]
        [Range(0, 10)]
        public float cellDelay = 0.1f;//一行/列中每个格子间隔(例如要每个格子都一样则lineRowDelay=(lineCount + 1) * cellDelay)

        [Tooltip("透明度")]
        [Range(0f, 1f)]
        public float alpha = 1f;

        [PropertyLabel("起点类型")]
        public PosType posType = PosType.Offset;

        [PropertyLabel("动画起点")]
        public Vector2 offset = Vector2.zero;


        [PropertyLabel("动画类型")]
        public Ease easeType = Ease.OutExpo;

        internal bool isTweening;//是否正在播放动画

#if UNITY_EDITOR
        [LuaInterface.NoToLua]
        public void StopTween()
        {
            Stop();
        }
#endif

        internal void Stop()
        {
            if (!isTweening)
                return;

            var items = config.items;
            for (int i = 0; i < items.Count; i++)
            {
                items[i].localTsf.DOKill(true);
                if(alpha < 1)
                {
                    CanvasGroup cg = items[i].GetComponent<CanvasGroup>();
                    if (cg)
                        cg.alpha = 1;
                }
            }
            isTweening = false;
        }

        internal void Play(int index, QuickGridItemBase item, Vector2 pos, bool isLast)
        {
            isTweening = true;
            item.localTsf.DOKill(true);
            item.localGo.SetActive(false);
            switch (config.tweenType)
            {
                case QuickGrid.GridTweenType.Line:
                    PlayLineTween(index % config.pageCells, item, pos, isLast);
                    break;
                case QuickGrid.GridTweenType.Row:
                    PlayRowTween(index % config.pageCells, item, pos, isLast);
                    break;
                case QuickGrid.GridTweenType.Cell:
                    PlayCellTween(index, item, pos, isLast);
                    break;
                case QuickGrid.GridTweenType.Custom:
                    PlayCustom(index, item, pos, isLast);
                    break;
                default:
                    break;
            }

            //if (config.movement == QuickGrid.Movement.Vertical)
            //{
            //    //v.y = GetPosY(item.line);
            //}
            //else
            //{
            //    //v.x = GetPosX(item.line);
            //}
        }

        /// <summary>
        /// 动画播放完成,触发回调并移除CanvasGroup
        /// </summary>
        /// <param name="t"></param>
        /// <param name="item"></param>
        /// <param name="isLast"></param>
        protected void OnTweenComplete(Tweener t, QuickGridItemBase item, bool isLast)
        {
            if (isLast)
            {
                t.OnComplete(() => {
                    item.OnItemTweenComplete();
                    var items = config.items;
                    for (int i = 0; i < items.Count; i++)
                    {
                        if (items[i].localGo.activeSelf)
                            items[i].OnAllTweenComplete();
                    }
                    isTweening = false;
                    if (alpha < 1)
                    {
                        CanvasGroup cg = item.GetComponent<CanvasGroup>();
                        if (cg)
                            GameObject.Destroy(cg, 0.1f);
                    }
                });
            }
            else
            {
                t.OnComplete(() => {
                    item.OnItemTweenComplete();
                    if (alpha < 1)
                    {
                        CanvasGroup cg = item.GetComponent<CanvasGroup>();
                        if (cg)
                            GameObject.Destroy(cg, 0.1f);
                    }
                });
            }
        }

        /// <summary>
        /// 透明渐变
        /// </summary>
        /// <param name="item"></param>
        /// <param name="alpha"></param>
        /// <param name="interval"></param>
        protected void DoTweenAlpha(QuickGridItemBase item, float alpha, float interval)
        {
            if (alpha < 1)
            {
                CanvasGroup cg = item.GetComponent<CanvasGroup>();
                if (!cg)
                    cg = item.localGo.AddComponent<CanvasGroup>();
                cg.DOFade(alpha, interval).From();
            }
        }

        /// <summary>
        /// 获取出发点位置
        /// </summary>
        /// <param name="item"></param>
        /// <param name="pos"></param>
        /// <returns></returns>
        protected Vector2 GetFormPos(QuickGridItemBase item, Vector2 pos)
        {
            switch (posType)
            {
                case PosType.Pos:
                    return offset;
                case PosType.Offset:
                    return offset + pos;
                case PosType.OffsetX:
                    return new Vector2(offset.x + pos.x, offset.y);
                case PosType.OffsetY:
                    return new Vector2(offset.x, offset.y + pos.y);
            }
            return pos;
        }

        /// <summary>
        /// 按行播放
        /// 0<= index < 每行格子数
        /// </summary>
        /// <param name="index">在当前行中的序列,行数通过item.line获取</param>
        /// <param name="item"></param>
        /// <param name="pos">目标位置</param>
        protected virtual void PlayLineTween(int index, QuickGridItemBase item, Vector2 pos, bool isLast)
        {
            Tweener t = item.localTsf.DOLocalMove(GetFormPos(item, pos), interval).OnStart(() => {
                item.localGo.SetActive(true);
                DoTweenAlpha(item, alpha, interval);
            }).From().SetDelay(lineRowDelay * item.line + index * cellDelay).SetEase(easeType);
            OnTweenComplete(t, item, isLast);
        }

        /// <summary>
        /// 按列播放
        /// 0<= index < 每列格子数
        /// </summary>
        /// <param name="index"></param>
        /// <param name="item"></param>
        /// <param name="pos"></param>
        protected virtual void PlayRowTween(int index, QuickGridItemBase item, Vector2 pos, bool isLast)
        {
            Tweener t = item.localTsf.DOLocalMove(GetFormPos(item, pos), interval).OnPlay(() => {
                item.localGo.SetActive(true);
                DoTweenAlpha(item, alpha, interval);
            }).From().SetDelay(lineRowDelay * item.line + index * cellDelay).SetEase(easeType);
            OnTweenComplete(t, item, isLast);
        }

        /// <summary>
        /// 按格子播放
        /// </summary>
        /// <param name="index">在整个表格中的序列,从0开始</param>
        /// <param name="item"></param>
        /// <param name="pos"></param>
        protected virtual void PlayCellTween(int index, QuickGridItemBase item, Vector2 pos, bool isLast)
        {
            Tweener t = item.localTsf.DOLocalMove(GetFormPos(item, pos), interval).OnPlay(() => {
                item.localGo.SetActive(true);
                DoTweenAlpha(item, alpha, interval);
            }).From().SetDelay(index * cellDelay).SetEase(easeType);
            OnTweenComplete(t, item, isLast);
        }

        protected virtual void PlayCustom(int index, QuickGridItemBase item, Vector2 pos, bool isLast)
        {

        }
        
    }
}

