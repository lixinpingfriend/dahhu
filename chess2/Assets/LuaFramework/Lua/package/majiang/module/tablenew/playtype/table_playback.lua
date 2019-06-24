

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.playtype.table_custom')
---@class TablePlayBack:TableCustom
---@field view TableCommonView
local TablePlayBack = class('tablePlayBack', Base)

local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath

function TablePlayBack:on_initialize()
    self.view.textWanFa.text = self.view.wanfaName
    if self.curTableData.videoData.roomid or self.curTableData.videoData.hallnum then
        if(self.curTableData.videoData.hallnum and self.curTableData.videoData.hallnum > 0) then
            self.view.textRoomNum1.text = AppData.MuseumName .."房号:" ..  self.curTableData.videoData.roomid
        else
            self.view.textRoomNum1.text = "房号:" ..  self.curTableData.videoData.roomid
        end
    end
    self.view.topRightObj:SetActive(false)
    self.view.buttonSetting.gameObject:SetActive(false)
    self.view.bottomRightObj:SetActive(false)
    --self.view.jushuObj:SetActive(false)
    self.view.inviteAndExit:SetActive(false)
    if(self.view.ruleJsonInfo.isPrivateRoom) then
        self.view.textWanFa.text = self.view.wanfaName .. " 私人房"
    end

    self.topLeftRuleBtn = GetComponentWithPath(self.view.root,"TopLeft/Child/Begin/RoomID/ButtonRule", ComponentTypeName.Transform).gameObject

    self.topLeftRuleBtn:SetActive(true)
    self.view.textRoomNum1.transform.localPosition = self.view.textRoomNum1.transform.localPosition +  Vector3.New(27, 0, 0)

end

function TablePlayBack:on_init()

end

--- 显示局数
function TablePlayBack:show_round(gameState)
    Base.show_round(self,gameState)
    for i=1,#self.view.seatHolderArray do
        ---@type SeatHolder2D
        local seatHolder = self.view.seatHolderArray[i]
        if seatHolder
                and seatHolder.serverSeat
                and seatHolder.playerId
                and "0" ~= seatHolder.playerId then
            local playerState = gameState.Player[seatHolder.serverSeat + 1]
            if playerState and 0 ~= playerState.UserID and seatHolder.playerId ~= playerState.UserID then
                seatHolder:refresh_player_info(playerState.UserID)
                self.view.curTableData.seatUserIdInfo[seatHolder.serverSeat .. ""] = playerState.UserID
            end
        end
    end
end

--- 显示倒计时
function TablePlayBack:show_time_down()
    self.view:show_time_down(0)
end

function TablePlayBack:on_refresh_game_state(gameState)
    Base.on_refresh_game_state(self,gameState)
    local myPlayerState = gameState.Player[self.view.mySeat + 1]
    for i=1,#myPlayerState.state do
        local state = myPlayerState.state[i]
        if 1 == state.id then
            self.view:show_ke_chi(true)
        elseif 2 == state.id then
            self.view:show_ke_peng(true)
        elseif 3 == state.id then
            self.view:show_ke_gang(true)
        elseif 4 == state.id then
            self.view:show_ke_hu(true)
        elseif 5 == state.id then

        end
    end
end

return  TablePlayBack