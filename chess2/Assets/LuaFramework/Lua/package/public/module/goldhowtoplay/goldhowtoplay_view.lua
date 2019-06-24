




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')

local GoldHowToPlayView = Class('goldHowToPlayView', View)

local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName

function GoldHowToPlayView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/goldhowtoplay/public_windowgoldhowtoplay.prefab", "Public_WindowGoldHowToPlay", 1)
    self.buttonClose = GetComponentWithPath(self.root, "TopRight/Child/ButtonClose", ComponentTypeName.Button)
    self.howToPlayGoldText = GetComponentWithPath(self.root, "Center/Child/Panels/Panel/HowToPlayText", ComponentTypeName.Text)
end

---设置文本信息
function GoldHowToPlayView:SetText(text)
    self.howToPlayGoldText.text = text
end

return GoldHowToPlayView