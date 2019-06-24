
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local CurGameAdView = Class('CurGameAdView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName

function CurGameAdView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/curgamead/public_curgamead.prefab", "Public_CurGameAd", 1)
    View.set_1080p(self)
    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

    self.bgSprite = GetComponentWithPath(self.root, "BaseBackground", ComponentTypeName.Image)

    self.bgSpriteTable = {}

    for i=1,3 do
        self.bgSpriteTable[i] = GetComponentWithPath(self.root, "BaseBackground" .. i, ComponentTypeName.Image)
        self.bgSpriteTable[i].gameObject:SetActive(false)
    end
    self.bgSpriteTable[1].gameObject:SetActive(true)
end


return CurGameAdView