



local class = require("lib.middleclass")
---@class Table3dTypeCommon
---@field view Table3CommonView
local Table3dTypeCommon = class('table3dTypeCommon')

function Table3dTypeCommon:init(view)
    self.view = view
    self.gData = self.view.gData
    self.root = self.view.root
    self:on_init()
end

function Table3dTypeCommon:on_init()
    self.view.beginImageObj:SetActive(true)
    self.view.beginCountDownObj:SetActive(false)
end

function Table3dTypeCommon:init_ui()
    self.view.jushuObj:SetActive(not self.view.curTableData.isPlayBack)
end

function Table3dTypeCommon:refresh_game_state()
    self.view.jushu.text = "第" .. self.view.gameState.CurRound .. "/" .. self.view.curTableData.RoundCount .. "局"
end

function Table3dTypeCommon:set_time_down(isTimeDown)
    if self.view.gameState.Result ~= 0 then
        self.view.timerSum = -1
    else
        if isTimeDown then
            self.view.timerSum = 15
            self.view:show_time()
        else
            self.view.timerSum = -1
        end
    end
end

function Table3dTypeCommon:set_player_state(seatHolder, playerState, index)
    local beishu = playerState.ZongBeiShu
    local change = playerState.ZongBeiShu - self.view.lastGameState.Player[index].ZongBeiShu
    seatHolder.textScore.text = beishu .. ""
    self.view:play_score_change_text(seatHolder,change)
end

function Table3dTypeCommon:show_report_kick(seatHolder)

end

function Table3dTypeCommon:update_ready()
    self.view.buttonInvite.transform.anchoredPosition = Vector3.New(-200, self.view.buttonInvite.transform.anchoredPosition.y, 0)
    self.view.buttonExit.transform.anchoredPosition = Vector3.New(200, self.view.buttonExit.transform.anchoredPosition.y, 0)
end

function Table3dTypeCommon:update_not_ready()
    self.view.buttonInvite.transform.anchoredPosition = Vector3.New(-440, self.view.buttonInvite.transform.anchoredPosition.y, 0)
    self.view.buttonExit.transform.anchoredPosition = Vector3.New(440, self.view.buttonExit.transform.anchoredPosition.y, 0)
end

function Table3dTypeCommon:delay_random_user_state(data)

end

function Table3dTypeCommon:update_user_state_ui(allReady)
    self.view.beginTopLeft:SetActive(allReady or nil ~= self.view.gameState) --todo:需要基类来修复，暂时如此先测试了
    self.view.readyTopLeft:SetActive(not allReady and not self.view.gameState)
end

function Table3dTypeCommon:init_ui_user_state_side(seatHolder)
    seatHolder.textPlayerName.transform.anchoredPosition = Vector3.New(0, 20, 0)
end

function Table3dTypeCommon:can_kick(seatID, seatHolder)
    return not self.view:all_is_ready() and seatID ~= 0 and self.view.mySeat == 0 and not self.view.gameState
end

function Table3dTypeCommon:get_share_data(shareData)

end

return  Table3dTypeCommon