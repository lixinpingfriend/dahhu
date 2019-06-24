
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local BranchPackageName = AppData.BranchRunfastName
local RoomDetailView = Class('roomDetailView', View)
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function RoomDetailView:initialize(...)
    View.initialize(self, BranchPackageName .. "/module/roomdetail/runfast_windowroomdetail.prefab", "Runfast_WindowRoomDetail", 1)
    self.buttonClose = GetComponentWithPath(self.root, "Top/Title/closeBtn", ComponentTypeName.Button)
    self.buttonBack = GetComponentWithPath(self.root, "Top/Title/backBtn", ComponentTypeName.Button)
    self.lookGameBtn = GetComponentWithPath(self.root, "Top/Title/lookGameBtn", ComponentTypeName.Button)
    self.textRoomID = GetComponentWithPath(self.root, "Top/Title/TextRoomID", ComponentTypeName.Text)
    self.textCreateTime = GetComponentWithPath(self.root, "Top/Title/TextCreateTime", ComponentTypeName.Text)
    self.textRuleDesc = GetComponentWithPath(self.root, "Top/Child/Image/LabelRuleName", ComponentTypeName.Text)
    self.Name1 = GetComponentWithPath(self.root, "BaseBackground/bg/Bg/List/Name1", ComponentTypeName.Text)
    self.Name2 = GetComponentWithPath(self.root, "BaseBackground/bg/Bg/List/Name2", ComponentTypeName.Text)
    self.Name3 = GetComponentWithPath(self.root, "BaseBackground/bg/Bg/List/Name3", ComponentTypeName.Text)
    self.Name4 = GetComponentWithPath(self.root, "BaseBackground/bg/Bg/List/Name4", ComponentTypeName.Text)
    self.content = GetComponentWithPath(self.root, "Center/Panels/ListScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.cloneObj = GetComponentWithPath(self.root, "Center/Panels/ItemPrefabHolder/RoundItem", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(self.cloneObj, false)
    self.RoundItem2 = GetComponentWithPath(self.root, "Center/Panels/ItemPrefabHolder/RoundItem2", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(self.RoundItem2, false)
end

function RoomDetailView:initRoomInfo(data)
    self.disUserId = nil
    if(data.data and data.data.disUserName) then
        self.disUserId = data.data.disUserName
    end
    -- 玩法信息
    self.textRuleDesc.text = TableManager:GetRunfastRuleText(data.roomInfo.playRule)

    self.playerInfoList = data.data.players
    -- 自己排在最前面
    for i = 1, #self.playerInfoList do
        if (self.playerInfoList[i].userId == tonumber(self.modelData.roleData.userID)) then
            local temp = self.playerInfoList[1]
            self.playerInfoList[1] = self.playerInfoList[i]
            self.playerInfoList[i] = temp
        end
    end

    self.seatUserIds = { }
    for i = 1, #self.playerInfoList do
        local locId = self.playerInfoList[i].userId
        self.seatUserIds[i] = self.playerInfoList[i].userId
        local isfangzhu = data.roomInfo.creatorId and data.roomInfo.creatorId == self.playerInfoList[i].userId
        local titleShowName = Util.filterPlayerName(self.playerInfoList[i].playerName, 8)
        -- Util.filterPlayerName(self.playerInfoList[i].playerName,8)
        if (titleShowName == "999") then
            titleShowName = tostring(self.playerInfoList[i].userId)
        end
        if(self.disUserId and not self.disUserName) then
            if(tonumber(locId) == tonumber(self.disUserId)) then
                self.disUserName = titleShowName
                print("====================self.disUserName=",self.disUserName)
            end
        end
        self:SetTitleBar(i, titleShowName, isfangzhu)
    end
end

function RoomDetailView:get_data(obj)
    return self.roundList[tonumber(obj.transform.parent.parent.name)]
end

function RoomDetailView:initLoopScrollViewList(roomData)
    print("==RoomDetailView.initLoopScrollViewList=")
    print_table(roomData)
    self.contents = TableUtil.get_all_child(self.content)
    self.roundList = roomData.list
    self.playerInfos = roomData.players
    self.totalJuShu = roomData.roundCound
    for i = 1, #self.contents do
        ModuleCache.SafeSetActive(self.contents[i], false)
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
        ModuleCache.ComponentUtil.SafeSetActive(obj, true)
        item.gameObject = obj
        item.data = self.roundList[i]
        self:fillItem(item, i)
    end

    --解散房间的发起者
    if(self.disUserName == nil) then
        --print("====不是解散的")
    else
        local obj = TableUtil.clone(self.RoundItem2, self.content, Vector3.zero)
        local Name = GetComponentWithPath(obj.gameObject, "DissolveRoomInfo/Name", ComponentTypeName.Text)
        Name.text = self.disUserName
    end
end


function RoomDetailView:fillItem(item, index)
    local data = item.data
    print("==index="..tostring(index).. "==recordId="..tostring(data.recordId))
    print_table(data)
    local TextRoundCount = GetComponentWithPath(item.gameObject, "RoundCount", ComponentTypeName.Text)
    TextRoundCount.text = tostring(index)

    local playBackRootIsShow = true
    local playBackRoot = GetComponentWithPath(item.gameObject,"Title", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(playBackRoot, playBackRootIsShow)
    -- string.format( "第 %d 局",index)
    local playerDataList = data.scores
    if (playerDataList ~= nil and #playerDataList > 0) then
        for i = 1, #playerDataList do
            local seatUserId = self.seatUserIds[i]
            local seatData = self:GetSeatUserIdData(playerDataList, seatUserId)
            if (seatData ~= nil) then
                local locShowScore = seatData.score
                local locScoreGo_TextWrap = nil
                if (locShowScore >= 0) then
                    locScoreGo_TextWrap = GetComponentWithPath(item.gameObject, "RedScore" .. i, "TextWrap")
                    locScoreGo_TextWrap.text = "+" .. tostring(locShowScore)
                else
                    locScoreGo_TextWrap = GetComponentWithPath(item.gameObject, "GreenScore" .. i, "TextWrap")
                    locScoreGo_TextWrap.text = tostring(locShowScore)
                end
            end
        end
    end
end

function RoomDetailView:GetSeatUserIdData(playerDataList, seatUserId)
    for i = 1, #playerDataList do
        if (playerDataList[i].userId == seatUserId) then
            return playerDataList[i]
        end
    end
    return nil
end

-- 设置标题栏
function RoomDetailView:SetTitleBar(i, locName, isfangzhu)
    if (i == 1) then
        self.Name1.text = locName or ""
        self:SetFangZhu(self.Name1, isfangzhu)
    elseif (i == 2) then
        self.Name2.text = locName or ""
        self:SetFangZhu(self.Name2, isfangzhu)
    elseif (i == 3) then
        self.Name3.text = locName or ""
        self:SetFangZhu(self.Name3, isfangzhu)
    elseif (i == 4) then
        self.Name4.text = locName or ""
        self:SetFangZhu(self.Name4, isfangzhu)
    end
end

function RoomDetailView:SetFangZhu(NameGo, isfangzhu)
    local CreateGo = GetComponentWithPath(NameGo.gameObject, "Create", ComponentTypeName.Transform).gameObject
    if (CreateGo) then
        ModuleCache.ComponentUtil.SafeSetActive(CreateGo, isfangzhu)
    end
end

return RoomDetailView