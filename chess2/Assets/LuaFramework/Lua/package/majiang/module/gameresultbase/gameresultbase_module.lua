local class = require("lib.middleclass")
local Base = require('core.mvvm.module_base')

---@class GameResultModuleBase:ModuleBase
---@field view GameResultViewBase
local GameResultModuleBase = class('gameResultModuleBase', Base)

local ModuleCache = ModuleCache
local TableManager = TableManager

function GameResultModuleBase:initialize(...)
    Base.initialize(self,...)
    self:subscibe_module_event("table","Event_Total_Result",function (gameState)
        self.initData.gameState = gameState
        self.view:refresh_total_result_btn_state(gameState,TableManager.curTableData)
    end)
end

function GameResultModuleBase:on_show(initData)
    self.initData = initData
    self.view:refresh_view(initData.gameState,TableManager.curTableData)
end

function GameResultModuleBase:on_click(obj, arg)
    if obj == self.view.closeBtn then
        self:close()
    elseif obj == self.view.btnLookTotal then
        self:show_total_result(self.initData.gameState)
    elseif obj == self.view.btnRestart then
        self:restart()
    end
end


function GameResultModuleBase:set_auto_goto_total_result(autoOpenTotalResultTime)
    -- body
end

function GameResultModuleBase:show_total_result(gameState)
    local initData = {}
    initData.gameState = gameState
    ModuleCache.ModuleManager.show_module("majiang", "totalgameresult",initData)
    ModuleCache.ModuleManager.destroy_module("majiang",self.initData.normalResultType)
end


function GameResultModuleBase:restart()
    self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
    ModuleCache.ModuleManager.destroy_module("majiang",self.initData.normalResultType)
end

function GameResultModuleBase:close()
    self:dispatch_module_event("onegameresult", "Event_Close_OneGameResult")
    self:on_close()
    ModuleCache.ModuleManager.destroy_module("majiang",self.initData.normalResultType)
end

function GameResultModuleBase:on_close()

end

return GameResultModuleBase