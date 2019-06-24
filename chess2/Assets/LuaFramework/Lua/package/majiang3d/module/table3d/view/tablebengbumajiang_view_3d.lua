




local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableBengBuMaJiangView_3d:Table3dCommonView
local TableBengBuMaJiangView_3d = class('tableBengBuMaJiangView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = UnityEngine.Color

local Mj3d = require("package.majiang3d.module.table3d.Mj3d")

function TableBengBuMaJiangView_3d:init_ui()
    Base.init_ui(self)
    self.actionCancel = GetComponentWithPath(self.root, "Bottom/Child/Button_Cancel", ComponentTypeName.Transform).gameObject
end

function TableBengBuMaJiangView_3d:game_state_begin(gameState)
    Base.game_state_begin(self,gameState)
    self.actionCancel:SetActive(false)
end

---中途能否报听
function TableBengBuMaJiangView_3d:show_mid_ting(showMidTing)
    local show = false
    if 0 == self.gameState.Result then
        for i=1,#self.gameState.KeLiang do
            local liang = self.gameState.KeLiang[i]
            for j=1,#liang.KeChu do
                local ting = liang.KeChu[j]
                if 1 == #ting.TingPai then
                    show = true
                    break
                end
            end
        end
    end
    return show and self.ConfigData.isMidTing and showMidTing
end

--- 牌局中报听处理
function TableBengBuMaJiangView_3d:mid_ting_handle(isGray)
    if(not self.isMidTing and not isGray) then
        return
    end
    ---@type Mj3d
    local seatHolder = self.seatHolderArray[1]
    local myHandMj3d = seatHolder.mj3dHodler.HandMj
    for i = 1, #myHandMj3d do
        ---@type Mj3d
        local mj3d = myHandMj3d[i]
        local pai = mj3d:Pai()
        local gray = isGray and not self:show_mid_ting_pai(pai)
        if(gray) then
            mj3d:setColliderState(false)
            mj3d:setMj3dDefState(Mj3d.mj3dState.gray)
        else
            local state = Mj3d.mj3dState.normal
            if mj3d.shouZhangData.Gray then
                state = Mj3d.mj3dState.gray
            end
            mj3d:setColliderState(not mj3d.shouZhangData.Gray)
            mj3d:setMj3dDefState(state)
        end
        mj3d:resetDefState()
    end
    self.isMidTing = isGray
end

--- 报听中的听牌
function TableBengBuMaJiangView_3d:show_mid_ting_pai(pai)
    local isOk = false
    if(#self.gameState.KeLiang > 0) then
        for j=1,#self.gameState.KeLiang[1].KeChu do
            if(pai == self.gameState.KeLiang[1].KeChu[j].ChuPai and #self.gameState.KeLiang[1].KeChu[j].TingPai == 1 ) then
                isOk = true
                break
            end
        end
    end
    return isOk
end

return  TableBengBuMaJiangView_3d