




local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableBengBuMaJiangView:TableCommonView
local TableBengBuMaJiangView = class('tableBengBuMaJiangView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = UnityEngine.Color

function TableBengBuMaJiangView:init_ui()
    Base.init_ui(self)
    self.actionCancel = GetComponentWithPath(self.root, "Bottom/Child/Button_Cancel", ComponentTypeName.Transform).gameObject
end

function TableBengBuMaJiangView:game_state_begin(gameState)
    Base.game_state_begin(self,gameState)
    self.actionCancel:SetActive(false)
end

---中途能否报听
function TableBengBuMaJiangView:show_mid_ting(showMidTing)
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
function TableBengBuMaJiangView:mid_ting_handle(isGray)
    if(not self.isMidTing and not isGray) then
        return
    end
    local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(mj.gameObject.activeSelf) then
            local gray = isGray and not self:show_mid_ting_pai(pai)
            mj:set_disable(gray)
            if(gray) then
                mj:set_color(Color.gray, mj.skinObj)
            else
                mj:set_color(Color.white, mj.skinObj)
            end
        end
    end
    self.isMidTing = isGray
end

--- 报听中的听牌
function TableBengBuMaJiangView:show_mid_ting_pai(pai)
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

return  TableBengBuMaJiangView
