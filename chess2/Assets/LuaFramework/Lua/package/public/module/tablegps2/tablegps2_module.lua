






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableGPSModule2 = class("tableGPSModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function TableGPSModule2:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "tablegps2_view", nil, ...)
end

function TableGPSModule2:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.buttonClose.gameObject then
        self:hide()
    end
end

function TableGPSModule2:on_show(data)

    local strs = string.split(data, ",")
    self.view.textTip.text = strs[1]
    self.view.textDistance.text = strs[2]
end

return TableGPSModule2



