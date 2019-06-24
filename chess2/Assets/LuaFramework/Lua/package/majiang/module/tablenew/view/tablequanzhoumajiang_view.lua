local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableQuanZhouMaJiangView:TableCommonView
local TableQuanZhouMaJiangView = class('tableQuanZhouMaJiangView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local TableManager = TableManager

function TableQuanZhouMaJiangView:init_config()
    Base.init_config(self)
    self.actionSounds["6"] = {"hu_wohule"}
    self.actionSounds["79"] = {"zhuayu"}

    self.actionSounds["17"] = {"tianhu"}
    self.actionSounds["43"] = {"pengpenghu"}
    self.actionSounds["44"] = {"qingyise"}
    self.actionSounds["54"] = {"gangshangkaihua"}


    self.actionSounds["80"] = {"hunyise"}
    self.actionSounds["81"] = {"lanpai"}
    self.actionSounds["82"] = {"qiangganghu"}
    self.actionSounds["83"] = {"qixiaodui"}
    self.actionSounds["84"] = {"qixingguiwei"}
    self.actionSounds["85"] = {"dasanyuan"}
    self.actionSounds["86"] = {"gangshangpao"} 
    self.actionSounds["89"] = {"hu_wohule"} 
end

--- 播放操作声音
function TableQuanZhouMaJiangView:play_action_sound(action, seatInfo)
    local needPlayHuBaoSound = false
    if action == self.actions.chi 
        or action == self.actions.peng 
        or action == self.actions.mingGang 
        or action == self.actions.dianGang then
            local serverIndex = seatInfo.serverSeat
            local playerState = self.gameState.Player[serverIndex + 1]
            if playerState.state and #playerState.state > 0 then ---处理各种附加状态
                for i=1,#playerState.state do 
                    local state = playerState.state[i]
                    if state.id == 1001 then  ---有互包关系
                        needPlayHuBaoSound = true
                        break
                    end
                end
            end
    end 
    if needPlayHuBaoSound then
        if(seatInfo.gender == 1) then
            self:play_voice("femalesound_hn/hubao")
        else
            self:play_voice("malesound_hn/hubao")
        end
    else
        Base.play_action_sound(self,action, seatInfo)
    end
end

--- 显示见字胡
function TableQuanZhouMaJiangView:show_jianzihu(num)
    return num > 33
end

--- 小结算时需要播放胡音效
function TableQuanZhouMaJiangView:play_hu_sound_on_result()
    return false
end

function TableQuanZhouMaJiangView:show_mid_ting(showMidTing)
    local mySeat = self.newMySeat or self.mySeat
    local myPlayerState = self.gameState.Player[mySeat + 1]
    local canFirstMidTing = false
    for i=1,#myPlayerState.state do 
        local state = myPlayerState.state[i]
        if state.id == 10 then  ---可以起手听牌
            canFirstMidTing = true
            break
        end
    end
    local keMidTing = Base.show_mid_ting(self,showMidTing)
    return keMidTing and canFirstMidTing
end

function TableQuanZhouMaJiangView:set_jianzihu(jianZiHuImage, jianZiHuSH)
    jianZiHuImage.sprite = jianZiHuSH:FindSpriteByName("3")
end

function TableQuanZhouMaJiangView:game_state_begin(gameState)
    Base.game_state_begin(self,gameState)
    self:close_center_tips()
end

function TableQuanZhouMaJiangView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self,playerState, localSeat, serverSeat)

    local seatHolder = self.seatHolderArray[localSeat]
    if TableManager.curTableData.HallID and TableManager.curTableData.HallID >0 
    and seatHolder.museumData and seatHolder.museumData.preventionCheat == 1 and localSeat ~= 1 then
        return
    end

    local myName = seatHolder.textPlayerName.text

    if self.gameState.Result == 0 and playerState.state and #playerState.state > 0 then ---处理各种附加状态
        local hubaoNickNames = {}
        myName = "<color=#fdf059>"..myName.."</color>";
        local hubaoStr = myName.." 与 "
        for i=1,#playerState.state do 
            local state = playerState.state[i]
            if state.id == 1001 then  ---有互包关系
                local maxNum = #state.ext
                for j=1,maxNum do
                    local otherServerIndex = state.ext[j]
                    local otherLocalIndex = self:server_to_local_seat(otherServerIndex)
                    local nickName = self.seatHolderArray[otherLocalIndex].textPlayerName.text
                    nickName = "<color=#fdf059>"..nickName.."</color>";
                    table.insert(hubaoNickNames,nickName)
                    if #hubaoNickNames == maxNum then
                        for k=1,#hubaoNickNames do
                            local nickName = hubaoNickNames[k]
                            hubaoStr = hubaoStr..nickName
                            if k ~= #hubaoNickNames then
                                hubaoStr = hubaoStr.." "
                            end
                        end
                        hubaoStr = hubaoStr.." 互包"
                        self:show_table_center_tips(hubaoStr,2)
                    end
                end
            end
        end
    end
end

return  TableQuanZhouMaJiangView