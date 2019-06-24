




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local BaiCaiShenView = Class('baicaishenView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance

function BaiCaiShenView:initialize(...)
    View.initialize(self,"public/module/baicaishen/public_windowbaicaishen.prefab", "Public_WindowBaiCaiShen", 1);

    print("self.root :"..self.root.name)

    self.effectBBTS =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_BBTS", ComponentTypeName.Transform).gameObject;
    self.animatorBBTS =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_BBTS/Animator", "UnityEngine.Animator");
    self.particleBBTS =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_BBTS/Particle/Particle System", "UnityEngine.ParticleSystem");

    self.effectBUT =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_But", ComponentTypeName.Transform).gameObject;
    self.animatorBUT =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_But/Animator", "UnityEngine.Animator");

    self.effectCYHT = GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_CYHT", ComponentTypeName.Transform).gameObject;
    self.animatorCYHT =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_CYHT/Animator", "UnityEngine.Animator");

    self.effectWCYY =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_WCYY", ComponentTypeName.Transform).gameObject;
    self.animatorWCYY =  GetComponentWithPath(self.root, "Center/Child/Anim_Public_BaiCaiShen_WCYY/Animator", "UnityEngine.Animator");

    self:ResetEffect()
end

function BaiCaiShenView:ShowEffect(effect)
    if self.timingId then
        CSmartTimer:Kill(self.timingId)
    end
    local hideTiming = 0
    if 1 == effect then
        self.curAnimator = self.animatorWCYY
        self.animatorWCYY:Play(0,0)
        ComponentUtil.SafeSetActive(self.effectWCYY, true);
        hideTiming = 1.95
    elseif 2 == effect then
        self.curAnimator = self.animatorCYHT
        self.animatorCYHT:Play(0,0)
        ComponentUtil.SafeSetActive(self.effectCYHT, true);
        hideTiming = 2.85
    elseif 3 == effect then
        self.curAnimator = self.animatorBBTS
        self.animatorBBTS:Play(0,0)
        self.particleBBTS:Play()
        ComponentUtil.SafeSetActive(self.effectBBTS, true);
        hideTiming = 2.85
    end

    self.timingId = self:subscibe_time_event(hideTiming, false, 1):OnComplete(function(t)
        self.timingId = nil
        self:ResetEffect()
    end).id

    print("播放财神特效："..effect)
end

function BaiCaiShenView:ResetEffect()
    self.animatorBBTS:Play(0,0)
    self.particleBBTS:Stop()
    ComponentUtil.SafeSetActive(self.effectBBTS, false);

    self.animatorBUT:Play(0,0)
    ComponentUtil.SafeSetActive(self.effectBUT, false);

    self.animatorWCYY:Play(0,0)
    ComponentUtil.SafeSetActive(self.effectWCYY, false);

    self.animatorCYHT:Play(0,0)
    ComponentUtil.SafeSetActive(self.effectCYHT, false);
end



return BaiCaiShenView