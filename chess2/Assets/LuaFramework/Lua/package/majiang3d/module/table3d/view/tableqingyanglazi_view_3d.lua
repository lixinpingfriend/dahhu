local class = require("lib.middleclass")
---@type TableQingYangPingHuView_3d
local Base = require('package.majiang3d.module.table3d.view.tableqingyangpinghu_view_3d')
---@class TableQingYangLaZiView_3d:TableQingYangPingHuView_3d
local TableQingYangLaZiView_3d = class('tableQingYangLaZiView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

function TableQingYangLaZiView_3d:show_table_pop(data, i)
    Base.show_table_pop(self,data,i)
    ---@type TablePopQingYangModule
    local tablePopQingYangModule = ModuleCache.ModuleManager.get_module("majiang", "tablepopqingyang")
    ---@type TablePopQingYangView
    local tablePopQingYangView = tablePopQingYangModule.view
    tablePopQingYangView.pao2Btn:SetActive(false)

    if self.ruleJsonInfo.PaiXingFen == 1 then
        tablePopQingYangView.pao1Btn.name = "5"
        tablePopQingYangView.pao1BtnText.text = "买5"
    elseif self.ruleJsonInfo.PaiXingFen == 2 then
        tablePopQingYangView.pao1Btn.name = "10"
        tablePopQingYangView.pao1BtnText.text = "买10"
    elseif self.ruleJsonInfo.PaiXingFen == 3 then
        tablePopQingYangView.pao1Btn.name = "20"
        tablePopQingYangView.pao1BtnText.text = "买20"
    elseif self.ruleJsonInfo.PaiXingFen == 4 then
        tablePopQingYangView.pao1Btn.name = "30"
        tablePopQingYangView.pao1BtnText.text = "买30"
    elseif self.ruleJsonInfo.PaiXingFen == 5 then
        tablePopQingYangView.pao1Btn.name = "50"
        tablePopQingYangView.pao1BtnText.text = "买50"
    end
end

function TableQingYangLaZiView_3d:on_show_head_add_info(seatHolder, seatData, userState)
    local paoNum = tonumber(seatData["PiaoNum"])
    seatHolder:show_head_add_text2("")
    if paoNum and paoNum > 0 then
        seatHolder:show_head_add_text2("买"..tostring(paoNum))
    else
        seatHolder:show_head_add_text2("买0")
    end
end

---开始设置玩家状态（gameState）
function TableQingYangLaZiView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    ---@type SeatHolder2D
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder:show_head_add_text1("0花")
    for i=1,#playerState.state do 
        local state = playerState.state[i]
        if state.id == 13 then
            seatHolder:show_head_add_text1(state.ext[1].. "花")
            break
        end
    end
end

return TableQingYangLaZiView_3d