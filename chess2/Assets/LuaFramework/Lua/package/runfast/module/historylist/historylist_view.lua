
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local HistoryListView = Class('historyListView', View)
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple
local BranchPackageName = AppData.BranchRunfastName
local ComponentUtil = ModuleCache.ComponentUtil
local TableData = require("package/runfast/module/tablerunfast/tablerunfast_data")

function HistoryListView:initialize(...)
    View.initialize(self, BranchPackageName.."/module/historylist/runfast_windowhistorylist.prefab", "Runfast_WindowHistoryList", 1)
    self.PlayerMaxCount = TableData.seatMaxCount
    self.buttonClose = GetComponentWithPath(self.root, "Top/closeBtn", ComponentTypeName.Button)
    self.buttonCheckRoundVideo = GetComponentWithPath(self.root, "Top/checkVideoBtn", ComponentTypeName.Button)
    self.NoDataRoot = GetComponentWithPath(self.root, "FrameBg/NoData", ComponentTypeName.Transform).gameObject
    self.loopScrollView = GetComponentWithPath(self.root, "Center/Panels/ListScrollView", "LoopScrollView")
    self.loopScrollView.OnDataChange:AddListener(function(item)
        self:fillItem(item)
    end)
    self.loopScrollView.onValueChanged:AddListener(function(value)
        self.lastScrollValue = value.y        
    end)

    -- 金币场需要隐藏的物件
    self.titleObj  = GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform).gameObject;
    --self.replayObj = GetComponentWithPath(self.root, "TopRight",  ComponentTypeName.Transform).gameObject;
    --self.backObj   = GetComponentWithPath(self.root, "TopLeft",   ComponentTypeName.Transform).gameObject;
    self.maskObj   = GetComponentWithPath(self.root, "WindowMask",    ComponentTypeName.Transform).gameObject;
end


function HistoryListView:on_view_init()
end

function HistoryListView:get_data(obj)
    local stringNum = string.gsub(obj.name,"item","")
    local intNum = tonumber(stringNum) + 1 
    return self.history[intNum]
end

function HistoryListView:initLoopScrollViewList(historyList, indexPos)    
    self.history = historyList
    indexPos = indexPos or 0
    self.loopScrollView:SetData(historyList, indexPos)
end

function HistoryListView:fillItem(item)
    ModuleCache.ComponentUtil.SafeSetActive(self.NoDataRoot, false)
    local data = item.data
    --print("=====HistoryListView:fillItem")
    --print_table(data)
     local isShowGoldIcon = false;
    -- 金币
    if data.settleType == 1 then
        isShowGoldIcon = true;
    end

    local textRoomNum = GetComponentWithPath(item.gameObject, "Title/RoomNameLbl", ComponentTypeName.Text)
    local textTime = GetComponentWithPath(item.gameObject, "Title/TimeLbl", ComponentTypeName.Text)
    textRoomNum.text = "房号:" .. data.roomNumber
    
    textTime.text = data.createTime     --os.date("%Y-%m-%d   %H:%M", data.time)

    --自己排在最前面
    for i=1,#data.players do
        if data.players[i].userId == tonumber(self.modelData.roleData.userID) then
            local temp = data.players[1]
             data.players[1] =data.players[i]
             data.players[i] = temp
        end
    end
    --
    for i=1,self.PlayerMaxCount do
        local playerGo = GetComponentWithPath(item.gameObject, "Players/player" .. i, ComponentTypeName.Transform).gameObject
        local ShowContentRoot = GetComponentWithPath(playerGo, "ShowContentRoot", ComponentTypeName.Transform).gameObject
        if (#data.players < i) then
            ModuleCache.ComponentUtil.SafeSetActive(ShowContentRoot, false)
        else
            local playerData = data.players[i]
            ModuleCache.ComponentUtil.SafeSetActive(ShowContentRoot, true)
            local textPlayerName = GetComponentWithPath(playerGo, "ShowContentRoot/nameLbl", ComponentTypeName.Text)
            local isfangzhu = data.creatorId and data.creatorId == data.players[i].userId
            local fangzhuGo = GetComponentWithPath(playerGo, "ShowContentRoot/create", ComponentTypeName.Transform).gameObject
            ModuleCache.ComponentUtil.SafeSetActive(fangzhuGo, isfangzhu)
            local AvatarImage = GetComponentWithPath(playerGo, "ShowContentRoot/Avatar/Mask/Image", ComponentTypeName.Image)
             -- 金币图标
            local spriteGoldIcon = GetComponentWithSimple(playerGo, "SpriteGoldIcon", ComponentTypeName.Image);
            -- 玩家分数
            local labelScore = GetComponentWithSimple(playerGo, "LabelScore", ComponentTypeName.Text);
            self:image_load_sprite(AvatarImage,playerData.headImg)
            
            
            local locShowPlayerName = Util.filterPlayerName(playerData.playerName,8)
            if(locShowPlayerName=="999") then
                locShowPlayerName = tostring(data.players[i].userId)
            end
            if(i == 1)then
                textPlayerName.text = locShowPlayerName
            else
                textPlayerName.text = "<color=#84590F>" .. locShowPlayerName .. "</color>"
            end
            
            -- 金币图标
            spriteGoldIcon.gameObject:SetActive(isShowGoldIcon);
            local scoreTemp = nil;
            if isShowGoldIcon then
                scoreTemp = playerData.playerCoin + playerData.playerRestCoin;
                scoreTemp = Util.filterPlayerGoldNum(scoreTemp);
            else
                scoreTemp = playerData.playerScore;
            end

            local matchScore = nil;
            if isShowGoldIcon then
                matchScore = playerData.playerCoin + playerData.playerRestCoin;
            else
                matchScore = playerData.playerScore;
            end
            -- 当前积分为nil,显示0积分
            if matchScore == nil then
                labelScore.text = "<color=#e20c0c>+0</color>";
            else
                if matchScore >= 0 then
                    labelScore.text = "<color=#e20c0c>+" .. scoreTemp .. "</color>";
                else
                    labelScore.text = "<color=#02c714>" .. scoreTemp .. "</color>";
                end
            end
        end
    end
end


function HistoryListView:showGold(isbool)
    ComponentUtil.SafeSetActive(self.titleObj, isbool)
--    ComponentUtil.SafeSetActive(self.replayObj, isbool)
--    ComponentUtil.SafeSetActive(self.backObj, isbool)
    ComponentUtil.SafeSetActive(self.maskObj, isbool)
end
return HistoryListView