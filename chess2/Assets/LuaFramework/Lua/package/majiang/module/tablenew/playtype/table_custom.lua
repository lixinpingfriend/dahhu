

local class = require("lib.middleclass")
---@class TableCustom
---@field view TableCommonView
local TableCustom = class('tableCustom')
local ModuleCache = ModuleCache

function TableCustom:initialize(view)
    self.view = view
    self.curTableData = self.view.curTableData
    self:on_initialize()
end

function TableCustom:on_initialize()
    if(self.curTableData.HallID and self.curTableData.HallID > 0) then
        self.view.textRoomNum1.text = AppData.MuseumName .."房号:" .. self.curTableData.RoomID
    else
        self.view.textRoomNum1.text = "房号:" .. self.curTableData.RoomID
    end
    self.view.textWanFa.text = self.view.wanfaName
    self.view.textRoomNum2.text = self.view.textRoomNum1.text  --.." ".. self.view.wanfaName
    self.view.topRightObj:SetActive(true)
    self.view.buttonSetting.gameObject:SetActive(true)
    self.view.bottomRightObj:SetActive(true)
    self.view.inviteAndExit:SetActive(true)
    if(self.view.ruleJsonInfo.isPrivateRoom) then
        self.view.textWanFa.text = self.view.wanfaName .. " 私人房"
    end
end

--- 要初始化自己的座位数据 重连的时候没有userState 只有userInfo 而且还没有自己的 所以要刷新一波自己的
function TableCustom:on_init()
    local mySeatData =
    {
        UserID = self.curTableData.modelData.roleData.userID,
        SeatID = self.view.mySeat
    }
    self.view:refresh_seat_info(mySeatData)
end

--- 显示局数
function TableCustom:show_round(gameState)
    self.view.roomType:show_round(gameState)
end

--- 显示倒计时
function TableCustom:show_time_down()
    self.view:begin_time_down(15, function (t)
        self.view:show_time_down(t)
        if(t == 3) then
            if(self.view.gameState.Result == 0) then
                self.view:play_voice("common/timedown")
            end
        end
        if t == 0 and self.view.gameState and self.view.gameState.KeChu then
            if(self.view.openShake) then
                ModuleCache.GameSDKInterface:ShakePhone(1000)
            end
        end
    end)
end

function TableCustom:on_refresh_game_state(gameState)

end

return  TableCustom