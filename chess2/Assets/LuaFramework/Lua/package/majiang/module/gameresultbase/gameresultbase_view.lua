local class = require("lib.middleclass")
local Base = require('core.mvvm.view_base')

---@class GameResultViewBase:View
local GameResultViewBase = class('gameResultViewBase', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName

---初始化
function GameResultViewBase:initialize(...)
    Base.initialize(self,...)

    self.closeBtn = GetComponentWithPath(self.root,"TopLeft/Child/closeBtn",ComponentTypeName.Transform).gameObject
    self.btnRestart = GetComponentWithPath(self.root, "Bottom/Child/BtnRestart", ComponentTypeName.Transform).gameObject
    self.btnLookTotal = GetComponentWithPath(self.root, "Bottom/Child/BtnLookTotal", ComponentTypeName.Transform).gameObject
    self.hodlerRoot = GetComponentWithPath(self.root,"Holder",ComponentTypeName.Transform).gameObject

    self:init_all_player_hodlers()
    self:init_room_info_holder()
end

function GameResultViewBase:init_all_player_hodlers()
    self.playerInfoHodlers = {}
    self:on_init_all_player_hodlers()
end
function GameResultViewBase:init_room_info_holder()
    self:on_init_room_info_holder()
end
function GameResultViewBase:refresh_view(gameState,curTableData)
    self:on_refresh_view(gameState,curTableData)
    self:refersh_player_infos(gameState,curTableData)
    self:refersh_room_info(gameState,curTableData)
    self:refresh_total_result_btn_state(gameState,curTableData)
end
function GameResultViewBase:refersh_player_infos(gameState,curTableData)
    for i=1,#gameState.Player do
        local playerState = gameState.Player[i]
        self:on_refersh_player_info(i,playerState,gameState,curTableData)
    end
end
function GameResultViewBase:refersh_room_info(gameState,curTableData)
    self:on_refersh_room_info(gameState,curTableData)
end
function GameResultViewBase:refresh_total_result_btn_state(gameState,curTableData)
    local needShowLookTotal = curTableData.needShowTotalResult 
        or curTableData.dismiss or (curTableData.RoomType == 3 and gameState.RestTime == 1000)
    ComponentUtil.SafeSetActive(self.btnRestart,not needShowLookTotal)
    ComponentUtil.SafeSetActive(self.btnLookTotal,needShowLookTotal)
end



function GameResultViewBase:on_init_all_player_hodlers()
 
end
function GameResultViewBase:on_init_room_info_holder()
 
end
function GameResultViewBase:on_refresh_view(gameState,curTableData)

end
function GameResultViewBase:on_refersh_player_info(index,playerState,gameState,curTableData)

end
function GameResultViewBase:on_refersh_room_info(gameState,curTableData)

end



return GameResultViewBase