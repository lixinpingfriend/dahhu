




local class = require("lib.middleclass")
---@class GoldResultComCtrlBase
local GoldResultComCtrlBase = class('goldCommonResultModule')

local Vector3 = Vector3
local ModuleCache = ModuleCache

function GoldResultComCtrlBase:new()
    local ctrl = {}
    setmetatable(ctrl, { __index = GoldResultComCtrlBase })
    return ctrl
end

function GoldResultComCtrlBase:onInit(initData)
    self.gameState = initData.gameState
    self.comType = initData.comType
    local comView = require('package.majiang.module.goldgameresult.com.'..self.comType.."_view")
    self.comView = comView:new()
    local s1 = "majiang/module/goldgameresult/majiang_goldresultcom_"..self.comType..".prefab"
    local s2 = "MaJiang_GoldResultCom_"..self.comType
    local comViewRootObj = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.mainView.root)
    comViewRootObj.transform.localScale = Vector3.one
    self.comView.mainView = self.mainView
    self.comView:onInit(comViewRootObj)
end

function GoldResultComCtrlBase:onClick(obj, arg)

end

function GoldResultComCtrlBase:onClose()

end

return GoldResultComCtrlBase