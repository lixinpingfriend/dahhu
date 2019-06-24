local class = require("lib.middleclass")
local Base = require('core.mvvm.module_base')

---@class MaiMaiModule:ModuleBase
local MaiMaiModule = class('maiMaiModule', Base)

function MaiMaiModule:initialize(...)
    Base.initialize(self,"maima_view",nil,...) 
end

function MaiMaiModule:on_show(initData)
    self.initData = initData
    local gameState = initData.gameState
    self.view:refresh_mj_color_scale()
    if initData.userMultiple then
        self.view:play_multiple_mai_mai_info_ani(gameState,onComplateCallBack)
    else
        self.view:play_one_mai_mai_info_ani(gameState,onComplateCallBack)
    end
end

function MaiMaiModule:on_click(obj, arg)
    
end

return MaiMaiModule