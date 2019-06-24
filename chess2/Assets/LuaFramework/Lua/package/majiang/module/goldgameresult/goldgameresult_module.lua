




local class = require("lib.middleclass")
local Base = require('core.mvvm.module_base')

---@class GoldGameResultModule:ModuleBase
local GoldGameResultModule = class('goldGameResultModule', Base)

local ModuleCache = ModuleCache


function GoldGameResultModule:initialize(...)
    Base.initialize(self,"goldgameresult_view",nil,...)
end

---初始化组件
function GoldGameResultModule:initCom(initData)
    local comCtrl = require('package.majiang.module.goldgameresult.com.'..initData.comType.."_ctrl")
    self.comCtrl = comCtrl:new()
    self.comCtrl.module = self
    self.comCtrl.mainView = self.view
    self.comCtrl:onInit(initData)
    self.view.comView = self.comCtrl.comView
end

function GoldGameResultModule:on_show(initData)
    if not self.Ctrl then
        self:initCom(initData)
    end
    self.gameState = initData.gameState
    self.view:refresh_view(self.gameState)
end

function GoldGameResultModule:on_click(obj, arg)
    if obj == self.view.closeBtn then
        self:Close()
        self:dispatch_module_event("onegameresult", "Event_Close_OneGameResult")
    elseif obj == self.view.changeTableBtn then
        local goldid = self.modelData.tableCommonData.goldFildId
        self:dispatch_module_event("tablestrategy", "Event_Gold_Room_Jump",goldid)
    elseif obj == self.view.shareBtn then
        ModuleCache.ShareManager().shareImage(false)
    elseif obj == self.view.continueBtn then
        self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
        self:Close()
    end
    self.comCtrl:onClick(obj, arg)
end

function GoldGameResultModule:Close()
    self.comCtrl:onClose()
    ModuleCache.ModuleManager.destroy_module("majiang", "goldgameresult")
end

return GoldGameResultModule