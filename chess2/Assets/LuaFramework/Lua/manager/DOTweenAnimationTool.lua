local DOTweenAnimationTool = { };
local UnityEngine = UnityEngine;
local ComponentUtil = ModuleCache.ComponentUtil;
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple
require("DG.Tweening.Core.ABSAnimationComponent")

-- <summary>
-- 完成动画
-- </summary>
-- <param name="prefab"></param>
-- <param name="componentIndex"></param>
function DOTweenAnimationTool.DOComplete(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOComplete();
end
-- <summary>
-- 播放动画
-- </summary>
function DOTweenAnimationTool.DOPlay(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlay();
end
-- <summary>
-- 播放此物体上id的动画
-- </summary>
function DOTweenAnimationTool.DOPlayById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayById(id);
end
-- <summary>
-- 播放所有物体local组件上id相同的动画
-- </summary>
function DOTweenAnimationTool.DOPlayAllById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayAllById(id);
end
-- <summary>
-- 按顺序播放单个动画
-- </summary>
function DOTweenAnimationTool.DOPlayNext(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayNext();
end
-- <summary>
-- 正序播放动画
-- </summary>
function DOTweenAnimationTool.DOPlayForwards(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayForward();
end
-- <summary>
-- 正序播放此物体上id相同的动画
-- </summary>
function DOTweenAnimationTool.DOPlayForwardById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayForwardById(id);
end
-- <summary>
-- 正序播放所有物体local组件上id相同的动画
-- </summary>
function DOTweenAnimationTool.DOPlayForwardAllById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayForwardAllById(id);
end
-- <summary>
-- 动画倒序播放
-- </summary>
function DOTweenAnimationTool.DOPlayBackwards(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayBackwards();
end
-- <summary>
-- 倒序播放此物体上id相同的动画
-- </summary>
-- <param name="prefab"></param>
-- <param name="id"></param>
-- <param name="componentIndex"></param>
function DOTweenAnimationTool.DOPlayBackwardsById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayBackwardsById(id);
end
-- <summary>
-- 倒序播放所有物体local组件上id相同的动画
-- </summary>
-- <param name="prefab"></param>
-- <param name="id"></param>
-- <param name="componentIndex"></param>
function DOTweenAnimationTool.DOPlayBackwardsAllById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPlayBackwardsAllById(id);
end
-- <summary>
-- 暂停动画
-- </summary>
function DOTweenAnimationTool.DOPause(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPause();
end
-- <summary>
-- 暂停所有id相同的动画
-- </summary>
function DOTweenAnimationTool.DOPauseAllById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOPauseAllById(id);
end
-- <summary>
-- 重播动画
-- </summary>
-- <param name="flag"></param>
function DOTweenAnimationTool.DORestart(prefab, flag)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DORestart(flag);
end
-- <summary>
-- 通过id重播动画
-- </summary>
-- <param name="id"></param>
function DOTweenAnimationTool.DORestartById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DORestartById(id);
end
-- <summary>
-- 通过id重新播放所有动画
-- </summary>
-- <param name="id"></param>
function DOTweenAnimationTool.DORestartAllById(prefab, id)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DORestartAllById(id);
end
-- <summary>
-- 动画瞬间倒带
-- </summary>
function DOTweenAnimationTool.DORewind(prefab)

    local dotweenAnimationList = ComponentUtil.GetComponents(prefab, ComponentTypeName.DOTweenAnimation);
    for key, dotweenAnimation in pairs(dotweenAnimationList) do
        dotweenAnimationList[key]:DORewind();
    end
end
-- <summary>
-- 动画平滑倒带
-- </summary>
-- <param name="prefab"></param>
function DOTweenAnimationTool.DOSmoothRewind(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOSmoothRewind();
end
-- <summary>
-- 瞬间重置动画并按顺序播放单个动画
-- </summary>
function DOTweenAnimationTool.DORewindAndPlayNext(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DORewindAndPlayNext();
end
-- <summary>
-- 动画播放与暂停切换
-- </summary>
function DOTweenAnimationTool.DOTogglePause(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOTogglePause();
end
-- <summary>
-- 移除动画效果(移除动画后，再操作动画失效)
-- </summary>
function DOTweenAnimationTool.DOKill(prefab)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    dotweenAnimation:DOKill();
end
-- <summary>
-- 添加创建完成侦听
-- </summary>
function DOTweenAnimationTool.AddOnCreatedListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);

    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    --        if (not dotweenAnimation.hasOnTweenCreated)

    --            dotweenAnimation.onTweenCreated = new UnityEvent();
    --        end

    dotweenAnimation.onTweenCreated:AddListener(action);
end
-- <summary>
-- 添加开始侦听
-- </summary>
function DOTweenAnimationTool.AddOnStartListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);

    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnStart(action);
end
-- <summary>
-- 添加运行侦听
-- </summary>
function DOTweenAnimationTool.AddOnPlayListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);

    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnPlay(action);
end
-- <summary>
-- 添加更新侦听
-- </summary>
function DOTweenAnimationTool.AddOnUpdateListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);

    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnUpdate(action);
end
-- <summary>
-- 添加单步完成侦听
-- </summary>
function DOTweenAnimationTool.AddOnStepCompleteListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);

    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnStepComplete(action);
end
-- <summary>
-- 添加完成侦听
-- </summary>
function DOTweenAnimationTool.AddOnCompleteListener(prefab, callback)

    --    local isDelayTemp = false;
    --    if isDelay == nil or isDelay then
    --        isDelayTemp = true;
    --    end

    --    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    --    if isDelayTemp then

    --        local coroutine = function()
    --            WaitForEndOfFrame();

    --            local action = function()

    --                if callback ~= nil then
    --                    callback(dotweenAnimation);
    --                end
    --            end
    --            print(dotweenAnimation.gameObject.name);
    --            dotweenAnimation.tween:OnComplete(action);
    --        end
    --        StartCoroutine(coroutine);
    --    else
    --        local action = function()

    --            if callback ~= nil then
    --                callback(dotweenAnimation);
    --            end
    --        end
    --        print(dotweenAnimation.gameObject.name);
    --        dotweenAnimation.tween:OnComplete(action);
    --    end

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);

    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnComplete(action);
end

-- <summary>
-- 添加暂停侦听
-- </summary>
function DOTweenAnimationTool.AddOnPauseListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnPause(action);
end
-- <summary>
-- 添加移除动画侦听
-- </summary>
function DOTweenAnimationTool.AddOnKillListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnKill(action);
end
-- <summary>
-- 添加动画倒带完成侦听
-- </summary>
function DOTweenAnimationTool.AddOnRewindListener(prefab, callback)

    local dotweenAnimation = GetComponentWithSimple(prefab, prefab.name, ComponentTypeName.DOTweenAnimation);
    local action = function()

        if callback ~= nil then
            callback(dotweenAnimation);
        end
    end
    dotweenAnimation.tween:OnRewind(action);
end


return DOTweenAnimationTool;