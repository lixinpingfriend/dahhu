local class = require("lib.middleclass")
local Base = require('core.mvvm.view_base')

---@class GuoActionView:View
local GuoActionView = class('guoActionView', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName

---初始化
function GuoActionView:initialize(...)
    Base.initialize(self, "majiang/module/guoaction/majiang_guoaction.prefab", "MaJiang_GuoAction", 0)

    Base.set_1080p(self)

    self.titelText =  GetComponentWithPath(self.root,"ApplyPanel/background/titel/Text", ComponentTypeName.Text)
    self.contectText =  GetComponentWithPath(self.root,"ApplyPanel/background/Center/Text", ComponentTypeName.Text)
    self.okBtn  = GetComponentWithPath(self.root,"ApplyPanel/background/Bottom/Button_Ok",ComponentTypeName.Transform).gameObject
    self.noBtn = GetComponentWithPath(self.root,"ApplyPanel/background/Bottom/Button_No",ComponentTypeName.Transform).gameObject

    self.openGuoCheckToggle = GetComponentWithPath(self.root,"ApplyPanel/background/Center/Toggle",ComponentTypeName.Toggle)
    self.checkBoxText =  GetComponentWithPath(self.root,"ApplyPanel/background/Center/Toggle/Text", ComponentTypeName.Text)

    self.openGuoCheckToggle.isOn = false
end


function GuoActionView:refresh_info(titelTex,contectTex,checkBoxTex)
    self.titelText.text = titelTex or "是否过牌"
    self.contectText.text = contectTex or "您是否选择过牌?"
    self.checkBoxText.text = checkBoxTex or ""
    self.openGuoCheckToggle.gameObject:SetActive(nil ~= checkBoxTex)
end

return GuoActionView