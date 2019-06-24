
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local RoomDetailView = Class('roomDetailView', View)

local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

function RoomDetailView:initialize(...)
    -- 初始 View
    View.initialize(self, "huzi/module/roomdetail/huzi_windowroomdetail.prefab", "HuZi_WindowRoomDetail", 1)

    self.textPlayer1 = GetComponentWithPath(self.root, "Top/Child/Image/Image/Player1", ComponentTypeName.Text)
    self.textPlayer2 = GetComponentWithPath(self.root, "Top/Child/Image/Image/Player2", ComponentTypeName.Text)
    self.textPlayer3 = GetComponentWithPath(self.root, "Top/Child/Image/Image/Player3", ComponentTypeName.Text)
    self.textPlayer4 = GetComponentWithPath(self.root, "Top/Child/Image/Image/Player4", ComponentTypeName.Text)
    self.textRuleDesc = GetComponentWithPath(self.root, "Top/Child/SpriteRule/LabelRuleName", ComponentTypeName.Text)
    self.buttonClose = GetComponentWithPath(self.root, "TopLeft/Child/ImageBack", ComponentTypeName.Button)
    self.buttonCheckRoundVideo = GetComponentWithPath(self.root, "TopRight/Child/LookMatch", ComponentTypeName.Button)
    self.content = GetComponentWithPath(self.root, "Top/Panels/ListScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.cloneObj = GetComponentWithPath(self.root, "Top/Panels/ItemPrefabHolder/RoundItem", ComponentTypeName.Transform).gameObject
end

function RoomDetailView:initRoomInfo(data)

    local wanfaName = ""
    local ruleName = ""

    if(data.roomInfo.parlorId and data.roomInfo.parlorId ~= 0 and data.roomInfo.parlorId ~= "0") then
        data.roomInfo.playRule =  ModuleCache.Json.decode(data.roomInfo.playRule)
        --TODO XLQ 亲友圈分享，和规则。。，不需要显示支付方式
        data.roomInfo.playRule.PayType = -1
        data.roomInfo.playRule = ModuleCache.Json.encode(data.roomInfo.playRule)
    end

    wanfaName, ruleName = TableUtilPaoHuZi.get_rule_name(data.roomInfo.playRule);
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
        local text = GetComponentWithPath(self.root, "Top/Child/Image/Image/Player" .. i, ComponentTypeName.Text)

        text.gameObject:SetActive(true)
		local fangzhu = GetComponentWithPath(text.gameObject, "fangzhu", ComponentTypeName.Transform).gameObject
		local jiesan = GetComponentWithPath(text.gameObject, "jiesan", ComponentTypeName.Transform).gameObject

        if (i <= #data.roomInfo.players) then

            for k, v in pairs(data.data.players) do
                if v.userId == data.roomInfo.players[i].userId then
                    self.seatIds[i] = v.seatId
                end
            end


            text.text = Util.filterPlayerName(data.roomInfo.players[i].playerName, 10)
            if fangzhu then
				fangzhu:SetActive(data.roomInfo.creatorId and data.roomInfo.creatorId == data.roomInfo.players[i].userId)
				jiesan:SetActive(data.data.disUserId and data.data.disUserId == data.roomInfo.players[i].userId)
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
    self.contents = TableUtilPaoHuZi.get_all_child(self.content)
    self.roundList = roomData.list
    self.playerInfos = roomData.players
    self.totalJuShu = roomData.roundCount
    if (#self.roundList < self.totalJuShu) then
        local data = { }
        data.breakEnd = true
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
            obj = TableUtilPaoHuZi.clone(self.cloneObj, self.content, Vector3.zero)
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
    local breakEndObj = GetComponentWithPath(item.gameObject, "Title/breakEndLbl", ComponentTypeName.Text).gameObject
    local shareObj = GetComponentWithPath(item.gameObject, "Title/shareBtn", ComponentTypeName.Button).gameObject
    local playVideoObj = GetComponentWithPath(item.gameObject, "Title/playVideoBtn", ComponentTypeName.Button).gameObject
    local playerObj = GetComponentWithPath(item.gameObject, "Players", ComponentTypeName.Transform).gameObject
    local redAtlas = GetComponentWithPath(item.gameObject, "RedNumbersHolder", "SpriteAtlas")
    local greenAtlas = GetComponentWithPath(item.gameObject, "GreenNumbersHolder", "SpriteAtlas")

    textRoundNum.text = string.format("第 %d 局", index)
    if (data.breakEnd) then
        ComponentUtil.SafeSetActive(shareObj, false)
        ComponentUtil.SafeSetActive(playVideoObj, false)
        ComponentUtil.SafeSetActive(playerObj, false)
        ComponentUtil.SafeSetActive(textRoundNumObj, false)
        ComponentUtil.SafeSetActive(breakEndObj, true)
    else
        ComponentUtil.SafeSetActive(shareObj, true)
        ComponentUtil.SafeSetActive(playVideoObj, true)
        ComponentUtil.SafeSetActive(playerObj, true)
        ComponentUtil.SafeSetActive(textRoundNumObj, true)
        ComponentUtil.SafeSetActive(breakEndObj, false)
        for i = 1, 4 do
            local playerGo = GetComponentWithPath(item.gameObject, "Players/player" .. i, ComponentTypeName.Transform).gameObject
            local textWrapRedScore = GetComponentWithPath(playerGo, "redScore", "TextWrap")
            if (i <= #data.scores) then
                ComponentUtil.SafeSetActive(playerGo, true)

                for k, v in ipairs(data.scores) do
                    if v.seatId == self.seatIds[i] then
                        if v.score >= 0 then
                            textWrapRedScore.atlas = redAtlas
                        else
                            textWrapRedScore.atlas = greenAtlas or redAtlas
                        end
                        if (v.score > 0) then
                            textWrapRedScore.text = "+" .. v.score
                        else
                            textWrapRedScore.text = v.score
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