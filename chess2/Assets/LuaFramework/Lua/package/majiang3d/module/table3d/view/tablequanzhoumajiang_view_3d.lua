local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableQuanZhouMaJiangView_3d:Table3dCommonView
local TableQuanZhouMaJiangView_3d = class('tableQuanZhouMaJiangView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local TableManager = TableManager
local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")
local GameObject = UnityEngine.GameObject

function TableQuanZhouMaJiangView_3d:init_config()
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
function TableQuanZhouMaJiangView_3d:play_action_sound(action, seatInfo)
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
function TableQuanZhouMaJiangView_3d:show_jianzihu(num)
    return num > 33
end

function  TableQuanZhouMaJiangView_3d:playDisLaiGen(gameState,callBack)
    local laiGen = 0
    if gameState.LaiGens and #gameState.LaiGens > 0 then
        laiGen = gameState.LaiGens[1]
    end
    if 0 == laiGen then
        if callBack then
            callBack()
        end
        return
    end


    local lastIndex = gameState.DunStart
    if lastIndex <= 0 then
        lastIndex = gameState.TotalCount
    end
    if lastIndex > gameState.TotalCount then
        lastIndex = 1
    end
    local anchorMj = self.Mj3dDun.dunMj3ds[lastIndex]
    ---@type Mj3d
    local disMj3d = Mj3d:Create(laiGen,self.Mj3dDun.rootTrans)
    disMj3d.transform.parent = anchorMj.transform.parent
    disMj3d.transform.position = anchorMj.transform.position
    disMj3d.transform.eulerAngles = anchorMj.transform.eulerAngles
    disMj3d:setMj3dDefState(Mj3d.mj3dState.hlight)
    disMj3d:setMj3dState(Mj3d.mj3dState.hlight)
    local effectObj = self:play_3d_effect("DaPai",nil,disMj3d.transform.position,self.Mj3dDun.rootTrans)
    self.cam3d.gameObject.transform.position = disMj3d.transform.position
    self.Mj3dDun.dunMj3ds[lastIndex] = disMj3d


    if "2" == anchorMj.transform.parent.parent.name then
        self.cam3d.gameObject.transform.localPosition = self.cam3d.gameObject.transform.localPosition + Vector3(15,13,5)
        self.cam3d.gameObject.transform.eulerAngles = Vector3(34,-110,0)
    elseif "3" == anchorMj.transform.parent.parent.name then
        self.cam3d.gameObject.transform.localPosition = self.cam3d.gameObject.transform.localPosition + Vector3(0,18,-23)
        self.cam3d.gameObject.transform.eulerAngles = Vector3(34,0,0)
        disMj3d.transform.localEulerAngles = Vector3(disMj3d.transform.localEulerAngles.x,180,disMj3d.transform.localEulerAngles.z)
    else
        self.cam3d.gameObject.transform.localPosition = self.cam3d.gameObject.transform.localPosition + Vector3(15,15,0)
        self.cam3d.gameObject.transform.eulerAngles = Vector3(45,-90,0)
    end

    self.seatHolderArray[1].mj3dHodler:hideAllHandMj()
    self:hide_recommend_out_mj()
    
    self:play_voice("belaizi")

    Mj3dHelper:clearMj3d(anchorMj)

    self:subscibe_time_event(2,false, 0):OnComplete(function()
        self.cam3d.gameObject.transform.position = self.cam3dPos
        self.cam3d.gameObject.transform.eulerAngles = self.cam3deulerAngles
        self.seatHolderArray[1].mj3dHodler:showAllHandMj()
        if 0 < #gameState.RecommendPai then
            self:show_recommend_out_mj(gameState.RecommendPai[1])
        end
        --Mj3dHelper:clearMj3d(disMj3d)
        disMj3d:setMj3dDefState(Mj3d.mj3dState.normal)
        disMj3d:setMj3dState(Mj3d.mj3dState.normal)
        GameObject.Destroy(effectObj)
        if callBack then
            callBack()
        end
    end)
end

function TableQuanZhouMaJiangView_3d:game_state_dun()
    Base.game_state_dun(self)

    if 0 ~= self.gameState.Dice1 and (not self.Diceed) then
        return
    end

    local laiGen = 0
    if self.gameState.LaiGens and #self.gameState.LaiGens > 0 then
        laiGen = self.gameState.LaiGens[1]
    end

    local lastIndex = self.gameState.DunStart
    if lastIndex <= 0 then
        lastIndex = self.gameState.TotalCount
    end
    if lastIndex > self.gameState.TotalCount then
        lastIndex = 1
    end
    local anchorMj = self.Mj3dDun.dunMj3ds[lastIndex]
    local disMj3d = Mj3d:Create(laiGen,anchorMj.transform.parent)
    disMj3d.transform.position = anchorMj.transform.position
    disMj3d.transform.eulerAngles = anchorMj.transform.eulerAngles
    disMj3d:setMj3dDefState(Mj3d.mj3dState.normal)
    disMj3d:setMj3dState(Mj3d.mj3dState.normal)
    disMj3d:setColliderState(false)
    disMj3d.gameObject.name = anchorMj.gameObject.name
    self.Mj3dDun.dunMj3ds[lastIndex] = disMj3d

    if "3" == anchorMj.transform.parent.parent.name then
        disMj3d.transform.localEulerAngles = Vector3(disMj3d.transform.localEulerAngles.x,180,disMj3d.transform.localEulerAngles.z)
    end

    Mj3dHelper:clearMj3d(anchorMj)

    self.Mj3dDun:processDunMjHover()
end

--- 小结算时需要播放胡音效
function TableQuanZhouMaJiangView_3d:play_hu_sound_on_result()
    return false
end

function TableQuanZhouMaJiangView_3d:show_mid_ting(showMidTing)
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

function TableQuanZhouMaJiangView_3d:set_jianzihu(jianZiHuImage, jianZiHuSH)
    jianZiHuImage.sprite = jianZiHuSH:FindSpriteByName("3")
end

function TableQuanZhouMaJiangView_3d:game_state_begin(gameState)
    Base.game_state_begin(self,gameState)
    self:close_center_tips()
end

function TableQuanZhouMaJiangView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
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

function TableQuanZhouMaJiangView_3d:playShowDun(gameState,callback)
    self.showDunCallBack = nil
    if callback then
        callback()
    end
end

return  TableQuanZhouMaJiangView_3d