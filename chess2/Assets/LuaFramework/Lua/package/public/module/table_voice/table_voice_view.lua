




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance

local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local BaseTableView = class('tableVoiceView', View)

local Sequence = DG.Tweening.DOTween.Sequence
local GameSDKInterface = ModuleCache.GameSDKInterface

local Util = Util

function BaseTableView:initialize(...)

end

function BaseTableView:init()
    if(self.is_inited)then
        return
    end
    View.initialize(self, "public/module/tablevoice/tablevoice.prefab", "TableVoice", 1)

    self.GetComponentWithPath = GetComponentWithPath
    self.ComponentTypeName = ComponentTypeName
    self.CSmartTimer = CSmartTimer
    self.goSpeaking = GetComponentWithPath(self.root, "Speaking", ComponentTypeName.Transform).gameObject
    self.goCancelSpeaking = GetComponentWithPath(self.root, "CancelRecord", ComponentTypeName.Transform).gameObject
    self.goIniting = GetComponentWithPath(self.root, "ImageIniting", ComponentTypeName.Transform).gameObject
    self.is_inited = true
    View.show(self)
end

function BaseTableView:show(showTop)
    if(self.is_inited)then
        View.show(self, showTop)
    end
end

function BaseTableView:set_1080p()
    if(self.is_inited)then
        View.set_1080p(self)
    end
end

function BaseTableView:set_image_fill(image,size)
    if(self.is_inited)then
        View.set_image_fill(self)
    end
end

function BaseTableView:hide()
    if(self.is_inited)then
        View.hide(self)
    end
end

function BaseTableView:is_active()
    if(self.is_inited)then
        return View.is_active(self)
    end
    return false
end

function BaseTableView:destroy()
    if(self.is_inited)then
        View.destroy(self)
    end
end

function BaseTableView:show_speaking_amin(show)
    self:init()
    ModuleCache.ComponentUtil.SafeSetActive(self.goSpeaking, show) 
end

function BaseTableView:show_cancel_speaking_amin(show)
    self:init()
    ModuleCache.ComponentUtil.SafeSetActive(self.goCancelSpeaking, show) 
end

function BaseTableView:show_initing(show)
    self:init()
    ModuleCache.ComponentUtil.SafeSetActive(self.goIniting, show)
end

return  BaseTableView