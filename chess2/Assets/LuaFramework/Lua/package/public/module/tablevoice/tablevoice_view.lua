
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableVoiceView = Class('tableVoiceView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function TableVoiceView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/tablevoice/public_tablevoice.prefab", "Public_TableVoice", 1)

    self.speaking = GetComponentWithPath(self.root, "Speaking", ComponentTypeName.Transform).gameObject
    self.cancelRecord = GetComponentWithPath(self.root, "CancelRecord", ComponentTypeName.Transform).gameObject
end

return TableVoiceView