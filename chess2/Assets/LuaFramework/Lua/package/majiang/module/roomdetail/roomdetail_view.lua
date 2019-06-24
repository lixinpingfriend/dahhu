
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local RoomDetailView = Class('roomDetailView', View)

local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil


function RoomDetailView:initialize(...)
    -- 初始View
    View.initialize(self, "majiang/module/roomdetail/henanmj_windowroomdetail.prefab", "HeNanMJ_WindowRoomDetail", 1)

    self.textPlayer1 = GetComponentWithPath(self.root, "Top/Child/Image/Player1", ComponentTypeName.Text)
    self.textPlayer2 = GetComponentWithPath(self.root, "Top/Child/Image/Player2", ComponentTypeName.Text)
    self.textPlayer3 = GetComponentWithPath(self.root, "Top/Child/Image/Player3", ComponentTypeName.Text)
    self.textPlayer4 = GetComponentWithPath(self.root, "Top/Child/Image/Player4", ComponentTypeName.Text)
    self.textRuleDesc = GetComponentWithPath(self.root, "Top/Child/SpriteRule/LabelRuleName", ComponentTypeName.Text)
    self.buttonClose = GetComponentWithPath(self.root, "TopLeft/Child/ImageBack", ComponentTypeName.Button)
    self.buttonCheckRoundVideo = GetComponentWithPath(self.root, "TopRight/Child/LookMatch", ComponentTypeName.Button)
    self.content = GetComponentWithPath(self.root, "Top/Panels/ListScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.cloneObj = GetComponentWithPath(self.root, "Top/Panels/ItemPrefabHolder/RoundItem", ComponentTypeName.Transform).gameObject
end

function RoomDetailView:initRoomInfo(data)

    local wanfaName = ""
    local ruleName = ""
   
    wanfaName, ruleName = TableUtil.get_rule_name(data.roomInfo.playRule,data.roomInfo.parlorId and data.roomInfo.parlorId > 0 );
    -- 玩法信息
    self.textRuleDesc.text = ruleName;
    -- print_table(roomInfo)

    -- 多次一举啊
    -- self.textPlayer1.text = Util.filterPlayerName(self.modelData.roleData.nickname, 10)
    -- self.textPlayer2.text = Util.filterPlayerName(roomInfo.playerAName, 10)
    -- self.textPlayer3.text = Util.filterPlayerName(roomInfo.playerBName, 10)
    -- self.textPlayer4.text = Util.filterPlayerName(roomInfo.playerCName, 10)
    self.seatIds = { }
    for i = 1, 4 do
        local text = GetComponentWithPath(self.root, "Top/Child/Image/Player" .. i, ComponentTypeName.Text)
        local fangzhu = GetComponentWithPath(text.gameObject, "fangzhu", ComponentTypeName.Transform).gameObject
        if (i <= #data.roomInfo.players) then

            for k, v in pairs(data.data.players) do
                if v.userId == data.roomInfo.players[i].userId then
                    self.seatIds[i] = v.seatId
                end
            end


            text.text = Util.filterPlayerName(data.roomInfo.players[i].playerName, 10)
            if fangzhu then
                fangzhu:SetActive(data.roomInfo.creatorId and data.roomInfo.creatorId == data.roomInfo.players[i].userId)
            end
        else
            text.text = ""
        end
    end

end

function RoomDetailView:get_data(obj)
    return self.roundList[tonumber(obj.transform.parent.parent.name)]
end

function RoomDetailView:initLoopScrollViewList(roomData)

    print_table(roomData)
    self.roominfo = roomData.roomInfo
    roomData = roomData.data
    self.contents = TableUtil.get_all_child(self.content)
    self.roundList = roomData.list
    self.playerInfos = roomData.players
    self.totalJuShu = roomData.roundCount
    if (#self.roundList < self.totalJuShu) then
        local data = { }
        data.breakEnd = true

        data.disUserName = roomData.disUserName
        table.insert(self.roundList, data)
    end
    for i = 1, #self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
    local item = { }
    for i = 1, #self.roundList do
        local obj = nil
        if (i <= #self.contents) then
            obj = self.contents[i]
        else
            obj = TableUtil.clone(self.cloneObj, self.content, Vector3.zero)
        end
        obj.name = i .. ""
        ComponentUtil.SafeSetActive(obj, true)
        item.gameObject = obj
        item.data = self.roundList[i]
        self:fillItem(item, i)
    end
end

function RoomDetailView:reset()
    for i = 1, #self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end

function RoomDetailView:fillItem(item, index)
    local data = item.data
    local textRoundNum = GetComponentWithPath(item.gameObject, "Title/RoundNumLbl", ComponentTypeName.Text)
    local textRoundNumObj = textRoundNum.gameObject
    local breakEndText = GetComponentWithPath(item.gameObject, "Title/breakEndLbl", ComponentTypeName.Text)
    local shareObj = GetComponentWithPath(item.gameObject, "Title/shareBtn", ComponentTypeName.Button).gameObject
    local playVideoObj = GetComponentWithPath(item.gameObject, "Title/playVideoBtn", ComponentTypeName.Button).gameObject
    local playerObj = GetComponentWithPath(item.gameObject, "Players", ComponentTypeName.Transform).gameObject
    local redAtlas = GetComponentWithPath(item.gameObject, "RedNumbersHolder", "SpriteAtlas")
    local greenAtlas = GetComponentWithPath(item.gameObject, "GreenNumbersHolder", "SpriteAtlas")

    textRoundNum.text = string.format("第 %d 局", index)
    ComponentUtil.SafeSetActive(breakEndText.gameObject, data.breakEnd)

    if (data.breakEnd) then
        ComponentUtil.SafeSetActive(shareObj, false)
        ComponentUtil.SafeSetActive(playVideoObj, false)
        ComponentUtil.SafeSetActive(playerObj, false)
        ComponentUtil.SafeSetActive(textRoundNumObj, false)

        if(data.disUserName and data.disUserName ~= "") then
            breakEndText.text = data.disUserName .. "发起的解散"
        else
            ----TODO XLQ roominfo.closeTime = null 时 牌局还在进行中
            --if type(self.roominfo.closeTime) == "userdata" then
            --    breakEndText.text = "正在进行中..."
            --else
                breakEndText.text = "解散房间，非正常结束"
            --end

        end
    else
        ComponentUtil.SafeSetActive(shareObj, true)
        ComponentUtil.SafeSetActive(playVideoObj, true)
        ComponentUtil.SafeSetActive(playerObj, true)
        ComponentUtil.SafeSetActive(textRoundNumObj, true)

        for i = 1, 4 do
            local playerGo = GetComponentWithPath(item.gameObject, "Players/player" .. i, ComponentTypeName.Transform).gameObject
            local textWrapRedScore = GetComponentWithPath(playerGo, "redScore", "TextWrap")
            if (i <= #data.scores) then
                ComponentUtil.SafeSetActive(playerGo, true)

                for k, v in ipairs(data.scores) do
                    if v.seatId == self.seatIds[i] then
                        local score = v.score
                        if score >= 0 then
                            textWrapRedScore.atlas = redAtlas
                        else
                            textWrapRedScore.atlas = greenAtlas or redAtlas
                        end
                        if v.ratio and 1~= v.ratio then
                            score = score * v.ratio
                        end
                        if (score > 0) then
                            textWrapRedScore.text = "+" .. score
                        else
                            textWrapRedScore.text = score
                        end
                    end
                end
            else
                ComponentUtil.SafeSetActive(playerGo, false)
            end
        end
    end
end

return RoomDetailView