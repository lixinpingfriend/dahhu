local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableYuXiWuLiuTongView_3d:Table3dCommonView
local TableYuXiWuLiuTongView_3d = class('tableYuXiWuLiuTongView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
local Vector3 = Vector3

function TableYuXiWuLiuTongView_3d:init_config()
    Base.init_config(self)
    self.actionSounds["4"] = {"dianpao1"}
    self.actionSounds["33"] = {"jiepao"}
    self.actionSounds["54"] = {"gangshangkaihua"}
    self.actionSounds["87"] = {"shilaotou"}
    self.actionSounds["88"] = {"wumeihua"}
end

--- 小结算时需要播放胡音效
function TableYuXiWuLiuTongView_3d:play_hu_sound_on_result()
    return false
end

function TableYuXiWuLiuTongView_3d:game_state_lai_gen(show)
    show = true --self.allReady or (nil ~= self.gameState)
    self.laiGenMJ:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(23, nil, {gameObject = self.laiGenMJ, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.laiGenText.text = ""
    self.baoPaiMidText.text = "杠上花"
    self.baoPai:SetActive(true)
end

function TableYuXiWuLiuTongView_3d:game_state_wei_zhang(show)
    show = true --self.allReady or (nil ~= self.gameState)
    self.WeiZhang:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(24, nil, {gameObject = self.WeiZhang, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.weiZhangText.text = ""
    self.baoPaiMidText.text = "杠上花"
    self.baoPai:SetActive(true)
end

function TableYuXiWuLiuTongView_3d:game_state_end_hand(serverSeat)
    Base.game_state_end_hand(self,serverSeat)
    local localSeat = self:server_to_local_seat(serverSeat)
    if self:is_me(localSeat) then
        local playerState = self.gameState.Player[serverSeat + 1]
        local ShouZhang = playerState.ShouZhang
        local showTagPais = {}
        for i=1,#ShouZhang do
            local needShowGangTag = false
            local pai = ShouZhang[i].Pai
            local counter = 0
            for j=1,#ShouZhang do
                if ShouZhang[j].Pai == pai then
                    counter = counter + 1
                end
            end
            if counter >= 4 then
                needShowGangTag = true
            end
            for j=1,#playerState.XiaZhang do
                local kan = playerState.XiaZhang[j]
                if #kan.Pai == 3  
                    and kan.Pai[1] == kan.Pai[2] 
                    and kan.Pai[2] == kan.Pai[3] 
                    and kan.Pai[3] == kan.Pai[1]
                    and kan.Pai[3] == pai then
                        needShowGangTag = true
                end
            end
            if needShowGangTag then
                local needAdd = true
                for j=1,#showTagPais do
                    if showTagPais[j] == pai then
                        needAdd = false
                        break
                    end
                end
                if needAdd then
                    table.insert(showTagPais,pai)
                end
            end
        end

        ---@type SeatHolder3D
        local seatHolder = self.seatHolderArray[1]
        local mjs = seatHolder.mj3dHodler.HandMj
        local keGang = showTagPais
        local checked = {}
        for i=1,#keGang do
            local gangPai = keGang[i]
            for j = #mjs,1,-1 do
                local needCheck = true
                for k=1,#checked do
                    if checked[k] == gangPai then
                        needCheck = false
                        break
                    end
                end
                ---@type Mj3d
                local mj3d = mjs[j]
                if gangPai == mj3d:Pai() and true then
                    local tex = self.tagSpriteH:FindSpriteByName(tostring(10)).texture
                    mj3d:setTag(tex)
                    mj3d.isKeGang = true
                    table.insert(checked,gangPai)
                end
            end
        end
    end
end

function TableYuXiWuLiuTongView_3d:play_action_tx(action, seatInfo)
    ---@type SeatHolder2D
    local seatHolder = seatInfo
    if action == 78 then
        if 1 == seatHolder.seatId then 
            local txObj = seatInfo:play_action_tx(action)
            txObj.transform.position = Vector3.zero
        end
    else
        Base.play_action_tx(self,action, seatInfo)
    end
end

function TableYuXiWuLiuTongView_3d:game_state_dun()
    Base.game_state_dun(self)
    local Dun = self.gameState.Dun
    if #Dun <= 8  and #Dun > 0 then
        self:setPlayerWaitStateTagsState(1,self.playerWaitTagType.last8Zhang,true)
    else
        self:setPlayerWaitStateTagsState(1,self.playerWaitTagType.last8Zhang,false)
    end
end

return TableYuXiWuLiuTongView_3d
