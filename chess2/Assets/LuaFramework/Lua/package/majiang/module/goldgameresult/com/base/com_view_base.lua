





local class = require("lib.middleclass")
---@class GoldResultComViewBase
local GoldResultComViewBase = class('goldResultComViewBase')

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName

function GoldResultComViewBase:new()
    local view = {}
    setmetatable(view, { __index = GoldResultComViewBase })
    return view
end

---当界面初始化时
function GoldResultComViewBase:onInit(rootObj)
    self.root = rootObj
    self:on_init_players_info_holder()
    self:initLocationTex()
    self.cloneParent = GetComponentWithPath(rootObj, "Clone", ComponentTypeName.Transform).gameObject
    self.clones = TableUtil.get_all_child(self.cloneParent)
    self.GoldNumbersHolder = GetComponentWithPath(self.root, "Holder/GoldNumbersHolder", "SpriteAtlas")
    self.BlueNumbersHolder = GetComponentWithPath(self.root, "Holder/BlueNumbersHolder", "SpriteAtlas")
end

function GoldResultComViewBase:initLocationTex()
    self.locationTexs = {"本家","下家","对家","上家"}
end

---当初始化玩家信息组件时
function GoldResultComViewBase:on_init_players_info_holder()
    self.infoHolders = {}
    for i=1,4 do
        local infoHolder = {}
        local root = GetComponentWithPath(self.root, "Center/Child/PlayerInfos/"..tostring(i), ComponentTypeName.Transform).gameObject
        self:on_init_info_holder(root,infoHolder)
        table.insert(self.infoHolders,infoHolder)
    end
end

---当初始化玩家信息单个组件时
function GoldResultComViewBase:on_init_info_holder(root,infoHolder)
    infoHolder.gameObject = root
    infoHolder.selfBg =  GetComponentWithPath(root, "selfBg", ComponentTypeName.Transform).gameObject
    infoHolder.otherBg = GetComponentWithPath(root, "otherBg", ComponentTypeName.Transform).gameObject
    infoHolder.handImage =  GetComponentWithPath(root, "handMask/handImage", ComponentTypeName.Image)
    infoHolder.nameText = GetComponentWithPath(root, "nameText", ComponentTypeName.Text)
    infoHolder.locationText = GetComponentWithPath(root, "locationText", ComponentTypeName.Text)
    infoHolder.bankerTag = GetComponentWithPath(root, "bankerTag", ComponentTypeName.Transform).gameObject
    infoHolder.actualAmountText = GetComponentWithPath(root, "actualAmountText", "TextWrap")
    infoHolder.winTopTag = GetComponentWithPath(root, "winTopTag", ComponentTypeName.Transform).gameObject
    infoHolder.loseClearTag = GetComponentWithPath(root, "loseClearTag", ComponentTypeName.Transform).gameObject
end

---当刷新房间信息时
function GoldResultComViewBase:on_refreshRoomInfo(gameState)

end

---当刷新玩家信息时
function GoldResultComViewBase:on_refreshPlayerInfo(gameState)
    local maxLen = #self.infoHolders
    local totalCount = TableManager.curTableData.totalSeat
    for i=1,maxLen do
        local infoHolder = self.infoHolders[i]
        if i > totalCount then
            ComponentUtil.SafeSetActive(infoHolder.gameObject,false)
            return
        end
        ComponentUtil.SafeSetActive(infoHolder.gameObject,true)
        self:on_setPlayerInfo(i,infoHolder,gameState)
    end
end

---当设置当个玩家信息时
function GoldResultComViewBase:on_setPlayerInfo(index,infoHolder,gameState)
    local playerState = gameState.Player[index]
    local ScoreSettle = gameState.ScoreSettle[index]

    local playerId = playerState.UserID
    local localSeat = TableUtil.get_local_seat(index - 1, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)

    ComponentUtil.SafeSetActive(infoHolder.selfBg, localSeat == 1)
    ComponentUtil.SafeSetActive(infoHolder.otherBg, localSeat ~= 1)

    TableUtil.download_seat_detail_info(playerId, function(playerInfo)
        if self.mainView.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
            return
        end
        infoHolder.handImage.sprite = playerInfo.headImage
    end, function(playerInfo)
        if self.mainView.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
            return
        end
        local tex = Util.filterPlayerName(playerInfo.playerName, 10)
        if 1 == localSeat then
            tex = "<color=#1d4b66>"..tex.."</color>";
        else
            tex = "<color=#84590f>"..tex.."</color>";
        end
        infoHolder.nameText.text = tex
    end)

    infoHolder.locationText.text = self.locationTexs[localSeat]

    ComponentUtil.SafeSetActive(infoHolder.bankerTag, gameState.ZhuangJia == index - 1)
    local actualAmount = gameState.ScoreSettle[index].ActualAmount
    local actualAmountText =  Util.filterPlayerGoldNum(actualAmount)
    if actualAmount == 0 then
        infoHolder.actualAmountText.atlas = self.GoldNumbersHolder
    elseif actualAmount >= 0 then
        infoHolder.actualAmountText.atlas = self.GoldNumbersHolder
        actualAmountText = "+"..actualAmountText
    else
        infoHolder.actualAmountText.atlas = self.BlueNumbersHolder
    end
    infoHolder.actualAmountText.text = actualAmountText

    ComponentUtil.SafeSetActive(infoHolder.winTopTag, ScoreSettle.ExtState == 1)
    ComponentUtil.SafeSetActive(infoHolder.loseClearTag, ScoreSettle.ExtState == 2) 
end

return GoldResultComViewBase