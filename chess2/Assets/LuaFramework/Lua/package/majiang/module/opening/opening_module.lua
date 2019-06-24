
local class = require("lib.middleclass")
---@type ModuleBase
local Base = require("core.mvvm.module_base")
---@class OpeningModule : ModuleBase
---@field view OpeningView
local OpeningModule = class("openingModule", Base)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

local lastRefershPlayers = nil

function OpeningModule:initialize(...)
    Base.initialize(self,"opening_view",nil, ...)

end

function OpeningModule:on_show(initData)
    if not initData then
        return
    end
    self.initData = initData
    if self.initData.players then
        self.view:init_player_infos(#self.initData.players)
        self.view:refresh_all_player_info(self.initData.players)
        lastRefershPlayers = self.initData.players
        if 1 == self.initData.aniStep then
            self.view:play_opening_ani_Begin_Step(initData.callBack)
        elseif 2 == self.initData.aniStep then
            self.view:play_opening_ani_End_Step(initData.callBack)
        end
    end
end

function OpeningModule:on_click(obj, arg)
   
end

function OpeningModule:refresh_player_infos(players)
    -- body
end

function OpeningModule:get_last_refresh_player_infos()
    return lastRefershPlayers
end

function OpeningModule:clear_last_refresh_player_infos()
    lastRefershPlayers = nil
end

return OpeningModule