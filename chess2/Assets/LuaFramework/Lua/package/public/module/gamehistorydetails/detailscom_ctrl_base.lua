
local Class = require("lib.middleclass")
---@class DetailComCtrlBase
local DetailComCtrlBase = Class("detailComCtrlBase")

local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local GameObject = UnityEngine.GameObject
local string = string

function DetailComCtrlBase:Init(module)
    ---@type GameHistoryDetailsModule
    self.module = module
    ---@type GameHistoryDetailsView
    self.mainView = module.view

    local comPrefabName = string.lower(self.module.comType)
    if self.module.initData.comPrefabName then
        comPrefabName = self.module.initData.comPrefabName
    end
    ---@type DetailComViewBase
    self.comView = require("package.public.module.gamehistorydetails.com."..self.module.comType.."_view"):new()
    local s1 = "public/module/gamehistorydetails/com/"..string.lower(comPrefabName)..".prefab"
    local s2 = comPrefabName
    self.comViewGameObject = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.mainView.comRootParent)
    self.comView.mainView = self.mainView
    self.comView:on_Init(self.comViewGameObject)

    self:on_Init()
end

function DetailComCtrlBase:Destroy()
    self:on_destroy()
    self.comView:on_destroy()
    GameObject.Destroy(self.comViewGameObject)
end

function DetailComCtrlBase:on_show(roomDetailsInfo)

end

function DetailComCtrlBase:on_click(obj, arg)

end

function DetailComCtrlBase:on_Init()
    
end

function DetailComCtrlBase:on_destroy()
    
end

return DetailComCtrlBase