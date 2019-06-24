




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local Sequence = DG.Tweening.DOTween.Sequence;

local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local BaseTableVideoPlayerView = class('baseTableVideoPlayerView', View)

function BaseTableVideoPlayerView:initialize(assetBundleName, mainAssetName, sortingLayer)
    View.initialize(self, assetBundleName, mainAssetName, sortingLayer)
    self.GetComponentWithPath = GetComponentWithPath

    self.buttonClose = GetComponentWithPath(self.root, "Buttons/ButtonClose", ComponentTypeName.Button)
    self.buttonReset = GetComponentWithPath(self.root, "Buttons/ButtonReset", ComponentTypeName.Button)
    self.buttonNextStep = GetComponentWithPath(self.root, "Buttons/ButtonNext", ComponentTypeName.Button)
    self.buttonPreStep = GetComponentWithPath(self.root, "Buttons/ButtonPre", ComponentTypeName.Button)
    self.buttonPlay = GetComponentWithPath(self.root, "Buttons/ButtonPlay", ComponentTypeName.Button)
    self.buttonPause = GetComponentWithPath(self.root, "Buttons/ButtonPause", ComponentTypeName.Button)
    self.buttonPreRound = GetComponentWithPath(self.root, "Buttons/ButtonPreRound", ComponentTypeName.Button)
    self.buttonNextRound = GetComponentWithPath(self.root, "Buttons/ButtonNextRound", ComponentTypeName.Button)

end


--显示播放按钮
function BaseTableVideoPlayerView:showPlayBtn(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonPlay.gameObject, show or false)
end

--显示暂停按钮
function BaseTableVideoPlayerView:showPauseBtn(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonPause.gameObject, show or false)
end

return  BaseTableVideoPlayerView