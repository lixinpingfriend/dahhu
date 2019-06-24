local class = require("lib.middleclass")
local Base = require('core.mvvm.view_base')

---@class MaiMaView:View
local MaiMaView = class('maiMaView', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local DOTween = DG.Tweening.DOTween

---初始化
function MaiMaView:initialize(...)
    Base.initialize(self, "majiang/module/maima/majiang_maima.prefab", "MaJiang_MaiMa", 0)
    Base.set_1080p(self)


    self.maMaInfoHolders = {}
    self.maiMaPanel = GetComponentWithPath(self.root,"Center/Child/MaiMaInfo", ComponentTypeName.Transform).gameObject

    for i=1,3 do
        local maMaInfoHolder = {}
        local holderObj = GetComponentWithPath(self.maiMaPanel,tostring(i), ComponentTypeName.Transform).gameObject
        maMaInfoHolder.gameObject = holderObj
        maMaInfoHolder.headImage = GetComponentWithPath(holderObj,"Bg/PlayerInfo/handMask/handImage", ComponentTypeName.Image)
        maMaInfoHolder.nameText = GetComponentWithPath(holderObj,"Bg/PlayerInfo/Text", ComponentTypeName.Text)
        local mjsRoot = GetComponentWithPath(holderObj,"Bg/Mjs", ComponentTypeName.Transform).gameObject
        maMaInfoHolder.mjsRoot = mjsRoot
        maMaInfoHolder.mjs = {}
        for k=1,10 do
            local mj = {}
            mj.gameObject = GetComponentWithPath(mjsRoot,tostring(k), ComponentTypeName.Transform).gameObject
            mj.gameObject:SetActive(false)
            mj.mjImage = GetComponentWithPath(mj.gameObject,"Image", ComponentTypeName.Image)
            mj.highLightObj = GetComponentWithPath(mj.gameObject,"HighLight", ComponentTypeName.Image).gameObject
            mj.animator = ModuleCache.ComponentManager.GetComponent(mj.gameObject,"UnityEngine.Animator")
            table.insert(maMaInfoHolder.mjs,mj)
        end
        table.insert(self.maMaInfoHolders,maMaInfoHolder)
    end
end

function MaiMaView:play_one_mai_mai_info_ani(gameState,callBack)
    local maima = gameState.MaiMa
    local zhongMa = gameState.ZhongMa
    local maMaInfoHolder = nil
    for i=1,#self.maMaInfoHolders do
        local holder = self.maMaInfoHolders[i]
        if 1 ~= i then
            holder.gameObject:SetActive(false)
        else
            holder.gameObject:SetActive(true)
            maMaInfoHolder = holder
        end
    end
    for i=1,#maima do
        local pai = maima[i]
        local mj = maMaInfoHolder.mjs[i]
        if mj then
            mj.gameObject:SetActive(true)
            mj.highLightObj:SetActive(false)
            mj.animator.enabled = true
            for k=1,#zhongMa do
                local zhongMaPai = zhongMa[k]
                if zhongMaPai == pai then
                    mj.highLightObj:SetActive(true)
                    break
                end
            end
        end
    end
end

function MaiMaView:play_multiple_mai_mai_info_ani(gameState,callBack)
    local players = gameState.Player
    local count = 1
    for i=1,#players do
        local playerState = players[i]
        local maima = playerState.MaPai
        if #maima > 0 then
            local playerState = players[i]
            local maMaInfoHolder = self.maMaInfoHolders[count]
            maMaInfoHolder.gameObject:SetActive(true)
            maMaInfoHolder.serverIndex = i - 1
            maMaInfoHolder.nameText.text = tostring(playerState.UserID)
            self:refresh_player_info(playerState.UserID,maMaInfoHolder)
            local delay = 0
            for k=1,#maima do
                local index = k
                local pai = maima[index]
                local mj = maMaInfoHolder.mjs[index]
                local zhongMa = playerState.ZhongMa
                if mj then
                    TableUtil.set_mj(pai,mj.gameObject, self.mjScaleSet)
                    TableUtil.set_mj_bg(1,mj.gameObject, self.mjColorSet)
                    mj.gameObject:SetActive(false)
                    TableUtil.set_mj_color(mj.gameObject,Color.white)
                    delay = delay + 0.1
                    self:subscibe_time_event(delay, false, 1):OnComplete(function()
                        mj.animator.enabled = true
                        mj.gameObject:SetActive(true)
                        mj.highLightObj:SetActive(false)
                    end )
                end
            end        
            self:subscibe_time_event(delay + 0.5, false, 1):OnComplete(function()
                for i=1,#maima do
                    local mj = maMaInfoHolder.mjs[i]
                    local zhongMa = playerState.ZhongMa
                    if mj then
                        for k=1,#zhongMa do
                            if i - 1 == zhongMa[k] then
                                mj.highLightObj:SetActive(true)
                                TableUtil.set_mj_color(mj.gameObject,Color.yellow)                               
                            end
                        end
                    end
                end
            end )
            count = count + 1
        end
    end
end


function MaiMaView:refresh_player_info(userId,maMaInfoHolder)
    TableUtil.download_seat_detail_info(userId,function(playerInfo)
        maMaInfoHolder.headImage.sprite = playerInfo.headImage
    end,function(playerInfo)
        local nameStr = Util.filterPlayerName(playerInfo.playerName, 10, playerInfo.isRedName)
        local localSeat = TableUtil.get_local_seat(maMaInfoHolder.serverIndex, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)
        if TableManager.curTableData.HallID and TableManager.curTableData.HallID >0 
        and self.museumData and self.museumData.preventionCheat == 1 and localSeat ~= 1 then
            nameStr = "***"  ---亲友圈房间并且开启了防作弊 小结算不显示玩家昵称
        end
        maMaInfoHolder.nameText.text = nameStr
    end)
end

function MaiMaView:refresh_mj_color_scale()
    local config = TableManager.curTableData.playModelData
    local defaultScale = 0
    local defaultColor = 0
    if(config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        defaultScale = tonumber(strs[1])
        defaultColor = tonumber(strs[2])
    end
    self.mjScaleSet = UnityEngine.PlayerPrefs.GetInt(string.format("%s_MJScale",TableManager.curTableData.ruleJsonInfo.GameType), defaultScale)
    self.mjColorSet = UnityEngine.PlayerPrefs.GetInt(string.format("%s_MJColor",TableManager.curTableData.ruleJsonInfo.GameType), defaultColor)
end

return MaiMaView