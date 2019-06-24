local class = require("lib.middleclass")
local Base = require('core.mvvm.module_base')

---@class GuoActionModule:ModuleBase
---@field view GuoActionView
local GuoActionModule = class('guoActionModule', Base)

local ModuleCache = ModuleCache

function GuoActionModule:initialize(...)
    Base.initialize(self,"guoaction_view",nil,...)

    self.view.openGuoCheckToggle.onValueChanged:AddListener(function()
        if self.onCheckBoxChange then
            self.onCheckBoxChange(self.view.openGuoCheckToggle.isOn)
        end
    end)
end

function GuoActionModule:on_show(initData)
    self.okCallBack = initData.okCallBack
    self.noCallBack = initData.noCallBack
    self.onCheckBoxChange = initData.onCheckBoxChange
    self.view:refresh_info(initData.totelText,initData.contectText,initData.checkBoxTex)
end


function GuoActionModule:on_click(obj, arg)
    if self.view.okBtn == obj then
        if self.okCallBack then
            self.okCallBack()
        end
        ModuleCache.ModuleManager.destroy_module("majiang", "guoaction")
    elseif self.view.noBtn == obj then
        if self.noCallBack then
            self.noCallBack()
        end
        ModuleCache.ModuleManager.destroy_module("majiang", "guoaction")
    end
end

return GuoActionModule