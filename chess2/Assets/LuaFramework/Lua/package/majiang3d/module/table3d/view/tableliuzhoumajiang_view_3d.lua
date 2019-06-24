local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableLiuZhouMaJiangView_3d:Table3dCommonView
local TableLiuZhouMaJiangView_3d = class('tableLiuZhouMaJiangView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

function TableLiuZhouMaJiangView_3d:init_config()
    Base.init_config(self)
    self.actionSounds["33"] = {"jiepao"}
    self.actionSounds["54"] = {"gangshangkaihua"}
end

---开始设置玩家状态（gameState）
function TableLiuZhouMaJiangView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    self:show_player_ex_state(playerState,localSeat)
end

function TableLiuZhouMaJiangView_3d:show_player_ex_state(playerState,localSeat)
    Base.show_player_ex_state(self)
    local playerExStateHolders = self.PlayerExStateHolders
    local stateHodler = playerExStateHolders[localSeat]
    stateHodler:hideTag()
    for i=1,#playerState.state do
        local state = playerState.state[i]
        if 1000 == state.id then
            stateHodler:showTag("chisanbi")
            break
        end
    end
end

--- 小结算时需要播放胡音效
function TableLiuZhouMaJiangView_3d:play_hu_sound_on_result()
    return false
end

return  TableLiuZhouMaJiangView_3d