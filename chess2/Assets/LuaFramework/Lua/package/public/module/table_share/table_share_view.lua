

local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance

local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local TableShareView = class('TableShareView', View)

local Sequence = DG.Tweening.DOTween.Sequence
local GameSDKInterface = ModuleCache.GameSDKInterface

local Util = Util

function TableShareView:initialize(...)
    View.initialize(self, "publictable/module/tableshare/publictable_tableshare.prefab", "PublicTable_TableShare", 1)
    self:set_1080p()
end

function TableShareView:set_liaobei_button_state(state)
    self.goLiaoBei = self.goLiaoBei or ModuleCache.ComponentManager.Find(self.root, "PanelInvite/ButtonInviteLiaoBei")
    self.goLiaoBei:SetActive(state)
end


return  TableShareView