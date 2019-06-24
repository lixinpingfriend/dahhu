




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local GoldHistoryView = Class('goldHistoryView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

function GoldHistoryView:initialize(...)
    -- 初始View 
    View.initialize(self, "public/module/goldhistory/public_windowgoldhistory.prefab", "Public_WindowGoldHistory", 1)

    -- buttons
    self.btnClose = GetComponentWithPath(self.root, "TopLeft/Child/ImageBack", ComponentTypeName.Button)
    self.btnRoom = GetComponentWithPath(self.root, "Top/TitlePanel/Title/Button1", ComponentTypeName.Button)
    self.btnRank = GetComponentWithPath(self.root, "Top/TitlePanel/Title/Button2", ComponentTypeName.Button)

    -- btn img
    self.roomImg = GetComponentWithPath(self.root, "Top/TitlePanel/Title/Button1/Image", ComponentTypeName.Transform).gameObject
    self.rankImg = GetComponentWithPath(self.root, "Top/TitlePanel/Title/Button2/Image", ComponentTypeName.Transform).gameObject

    -- main
    self.center = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform).gameObject

    -- data = 0
    self.noneObj = GetComponentWithPath(self.root, "Center/SpriteEmpty", ComponentTypeName.Transform).gameObject

    -- scroll
    self.content = GetComponentWithPath(self.root, "Center/Panels/Scroll View/Viewport/Content", ComponentTypeName.Transform)
    self.cloneObj = GetComponentWithPath(self.root, "Center/Panels/ItemPrefabHolder/HistoryItem", ComponentTypeName.Transform).gameObject

    self.matchObj = GetComponentWithPath(self.root, "TopRight/Child/LookMatch", ComponentTypeName.Transform).gameObject
    self:showCenter(false)
end

function GoldHistoryView:showCenter(isbool)
    ComponentUtil.SafeSetActive(self.center, isbool)
    if (AppData.isPokerGame()) then
        ComponentUtil.SafeSetActive(self.matchObj, false)
    end
end

function GoldHistoryView:showUI(curPage)
    if curPage == 1 then
        self:showRoom()
    end

    if curPage == 2 then
        self:showRank()
    end

end

function GoldHistoryView:showRoom()
    self:showCenter(false)
    ComponentUtil.SafeSetActive(self.roomImg, true)
    ComponentUtil.SafeSetActive(self.rankImg, false)
end

function GoldHistoryView:showRank()
    self:showCenter(true)
    local isbool = self.rankData == nil or #self.rankData < 1
    --print("isbool = "..tostring(isbool))
    ComponentUtil.SafeSetActive(self.noneObj, isbool)
    ComponentUtil.SafeSetActive(self.roomImg, false)
    ComponentUtil.SafeSetActive(self.rankImg, true)
    if not isbool then
        self:updateHistoryView(self.rankData)
    end
end

function GoldHistoryView:updateHistoryView(historyDataList)
    local contents = TableUtil.get_all_child(self.content.transform)
    for i = 1, #contents do
        ComponentUtil.SafeSetActive(contents[i], false)
    end

    for i = 1, #historyDataList do
        local obj = nil
        local item = {}
        if (i <= #contents) then
            obj = contents[i]
        else
            obj = TableUtil.clone(self.cloneObj, self.content.gameObject, Vector3.zero)
        end
        obj.name = i .. ""
        ComponentUtil.SafeSetActive(obj, true)
        item.gameObject = obj
        item.data = historyDataList[i]
        self:fillItem(item, i)
    end

end

function GoldHistoryView:fillItem(item, index)
    local data = item.data
    local textRoomNum = GetComponentWithPath(item.gameObject, "Title/RoomNameLbl", ComponentTypeName.Text)
    local textTime = GetComponentWithPath(item.gameObject, "Title/TimeLbl", ComponentTypeName.Text)
    textRoomNum.text = data.playingName .. "  底分: " .. data.baseScore

    textTime.text = data.playTime

    -- 自己排在最前面
    for i = 1, #data.scores do
        if data.scores[i].userId == tonumber(self.modelData.roleData.userID) then
            local temp = data.scores[1]
            data.scores[1] = data.scores[i]
            data.scores[i] = temp
        end
    end

    for i = 1, 6 do
        local playerGo = GetComponentWithPath(item.gameObject, "Players/player" .. i, ComponentTypeName.Transform).gameObject
        if (#data.scores < i) then
            ModuleCache.ComponentUtil.SafeSetActive(playerGo, false)
        else
            ModuleCache.ComponentUtil.SafeSetActive(playerGo, true)
            local textPlayerName = GetComponentWithPath(playerGo, "nameLbl", ComponentTypeName.Text)
            -- 玩家分数
            local labelScore = GetComponentWithSimple(playerGo, "Text", ComponentTypeName.Text);
            local playerData = data.scores[i]

            -- 过滤玩家名字
            local filterPlayerName = Util.filterPlayerName(playerData.playerName, 10);
            if (i == 1) then
                textPlayerName.text = filterPlayerName
            else
                textPlayerName.text = "<color=#7F5F54>" .. filterPlayerName .. "</color>"
            end

            local score = Util.filterPlayerGoldNum(playerData.coin);

            -- 当前积分为nil,显示0积分
            if playerData.coin == nil then
                labelScore.text = "<color=#e20c0c>+0</color>";
            else
                if playerData.coin >= 0 then
                    labelScore.text = "<color=#e20c0c>+" .. score .. "</color>";
                else
                    labelScore.text = "<color=#02c714>" .. score .. "</color>";
                end
            end
        end
    end
end


return GoldHistoryView