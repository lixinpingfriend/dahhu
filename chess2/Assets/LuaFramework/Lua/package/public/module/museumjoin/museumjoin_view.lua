
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumJoinView = Class('museumJoinView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

function MuseumJoinView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumjoin/public_museumjoin.prefab", "Public_MuseumJoin", 1)
    View.set_1080p(self)
    
end

return MuseumJoinView