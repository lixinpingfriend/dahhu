
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumRankingView = Class('museumRankingView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil

local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function MuseumRankingView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumranking/public_museumranking.prefab", "Public_MuseumRanking", 1)
    View.set_1080p(self)
    
    self.roundTag = GetComponentWithPath(self.root, "Top/Child/TagBtns/Scroll View/Viewport/Content/CopyBtn", ComponentTypeName.Toggle)
    self.scoreTag = GetComponentWithPath(self.root, "Top/Child/TagBtns/Scroll View/Viewport/Content/CopyBtn (1)", ComponentTypeName.Toggle)
    
    self.roundTagCheckObj = GetComponentWithPath(self.roundTag.gameObject, "Checkmark", ComponentTypeName.Transform).gameObject
    self.scoreTagCheckObj = GetComponentWithPath(self.scoreTag.gameObject, "Checkmark", ComponentTypeName.Transform).gameObject

    self.roundPanel = GetComponentWithPath(self.root, "Top/Child/Panels/RoundRanking", ComponentTypeName.Transform).gameObject
    self.scorePanel = GetComponentWithPath(self.root, "Top/Child/Panels/ScoreRanking", ComponentTypeName.Transform).gameObject

    self.subTags= {}
    self.subTags[1]= GetComponentWithPath(self.roundPanel, "ToggleGruup/Toggle", ComponentTypeName.Toggle)
    self.subTags[2]= GetComponentWithPath(self.roundPanel, "ToggleGruup/Toggle (1)", ComponentTypeName.Toggle)
    self.subTags[3]= GetComponentWithPath(self.scorePanel, "ToggleGruup/Toggle", ComponentTypeName.Toggle)
    self.subTags[4]= GetComponentWithPath(self.scorePanel, "ToggleGruup/Toggle (1)", ComponentTypeName.Toggle)

    self.subTags[5]= GetComponentWithPath(self.roundPanel, "ToggleGruup/Toggle (2)", ComponentTypeName.Toggle)
    self.subTags[6]= GetComponentWithPath(self.scorePanel, "ToggleGruup/Toggle (2)", ComponentTypeName.Toggle)

    self.roundThreeRankTex= GetComponentWithPath(self.roundPanel, "ToggleGruup/Toggle (2)/Label", ComponentTypeName.Text)
    self.scoreThreeRankTex= GetComponentWithPath(self.scorePanel, "ToggleGruup/Toggle (2)/Label", ComponentTypeName.Text)

    self.subPanels = {}
    self.subPanels[1]= GetComponentWithPath(self.roundPanel, "ScrollRect_Yesterday", ComponentTypeName.Transform).gameObject
    self.subPanels[2]= GetComponentWithPath(self.roundPanel, "ScrollRect_Today", ComponentTypeName.Transform).gameObject
    self.subPanels[3]= GetComponentWithPath(self.scorePanel, "ScrollRect_Yesterday", ComponentTypeName.Transform).gameObject
    self.subPanels[4]= GetComponentWithPath(self.scorePanel, "ScrollRect_Today", ComponentTypeName.Transform).gameObject

    self.subPanels[5]= GetComponentWithPath(self.roundPanel, "ScrollRect_Interval", ComponentTypeName.Transform).gameObject
    self.subPanels[6]= GetComponentWithPath(self.scorePanel, "ScrollRect_Interval", ComponentTypeName.Transform).gameObject

    self.copyItem = GetComponentWithPath(self.root, "Top/Child/ItemPrefabHolder/Item", ComponentTypeName.Transform).gameObject
    self.copyParents = {}
    self.rankTexs = {}
    self.numTexs = {}
    self.loadButtons = {}
    for i =1,6 do
        self.copyParents[i]= GetComponentWithPath( self.subPanels[i], "Viewport/Content", ComponentTypeName.Transform).gameObject
        self.rankTexs[i] = GetComponentWithPath( self.subPanels[i], "ButtomBar/RankTex/Text (1)", ComponentTypeName.Text)
        self.numTexs[i] = GetComponentWithPath( self.subPanels[i], "ButtomBar/RountTex/Text (1)", ComponentTypeName.Text)
        self.loadButtons[i] = GetComponentWithPath( self.subPanels[i], "Viewport/Content/loadButton", ComponentTypeName.Transform).gameObject
    end

    self.stateSwitcher_round = ModuleCache.ComponentManager.GetComponent(self.roundPanel,"UIStateSwitcher")
    self.stateSwitcher_score = ModuleCache.ComponentManager.GetComponent(self.scorePanel,"UIStateSwitcher")

	self.dropDown= GetComponentWithPath(self.root, "Top/Child/Dropdown", ComponentTypeName.Dropdown)
	
	self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
	self:fixed_tran_size(GetComponentWithPath(self.root, "TopLeft", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
end

function MuseumRankingView:initLoopScrollViewList(data, panelIdx)
    self:reset()

    if data.currentUser and data.currentUser.rank > 0 then
        self.rankTexs[panelIdx].text = data.currentUser.rank
    else
        self.rankTexs[panelIdx].text = "未上榜"
    end

    ----TODO XLQ 字牌 排行榜积分需要除1000
    --if ( panelIdx == 3 or panelIdx == 4 or panelIdx == 6) and (AppData.Game_Name == 'LDZP' or AppData.Game_Name == 'XXZP') then
    --    self.numTexs[panelIdx].text = tonumber(data.currentUser.bonusPoints)/1000
    --else
        self.numTexs[panelIdx].text = data.currentUser.bonusPoints
    --end


    if(#data.userRankList > 0) then
        for i=1,#data.userRankList do
            self:fillItem(self:get_item(data.userRankList[i], i,panelIdx))
        end
    end
    self.subPanels[panelIdx]:SetActive(false)
    self.subPanels[panelIdx]:SetActive(true)

    self.loadButtons[panelIdx]:SetActive(data.currentPage < data.totalPage)
    self.loadButtons[panelIdx].transform:SetAsLastSibling()
end

function MuseumRankingView:get_item(data, i,panelIdx)
    local obj = nil
    local item = {}
    if(i<=#self.contents[panelIdx] and self.contents[panelIdx][i] ~= self.loadButtons[panelIdx]  ) then
        obj = self.contents[panelIdx][i]
    else
        obj = TableUtil.clone(self.copyItem,self.copyParents[panelIdx],Vector3.zero)
    end
    obj.name = "item_" .. i
    obj.gameObject:SetActive(true)
    item.gameObject = obj
    item.data = data
    item.data.panelIdx = panelIdx
    return item
end

function MuseumRankingView:reset()
    self.contents = {}
    for i =1,6 do
        self.contents[i] = TableUtil.get_all_child(self.copyParents[i])
        for j=1,#self.contents[i] do
            ComponentUtil.SafeSetActive(self.contents[i][j], false)
        end
    end

end

function MuseumRankingView:fillItem(item)
    local data = item.data
    local rankImg = GetComponentWithPath(item.gameObject,"RankingImg",ComponentTypeName.Image)
    local rankSprHolder = GetComponentWithPath(item.gameObject,"RankingImg","SpriteHolder")
    local rankTex = GetComponentWithPath(item.gameObject,"RankingTex",ComponentTypeName.Text)

    local imageHead = GetComponentWithPath(item.gameObject, "player/Mask/SpritePlayerIcon", ComponentTypeName.Image)
    local nickName = GetComponentWithPath(item.gameObject, "player/nameLbl", ComponentTypeName.Text)

    local timeTex = GetComponentWithPath(item.gameObject,"TimeTex",ComponentTypeName.Text)
    local numTex = GetComponentWithPath(item.gameObject,"NumTex",ComponentTypeName.Text)

    if(data) then
        rankSprHolder.gameObject:SetActive(data.rank < 4)
        rankTex.gameObject:SetActive(data.rank > 3)
        rankImg.sprite = rankSprHolder:FindSpriteByName(data.rank)
        rankTex.text = data.rank

        nickName.text = Util.filterPlayerName(data.nickname, 10)
        self:image_load_sprite(imageHead, data.headImg)

        if data.lastUpdateTime ~= ModuleCache.Json.null then
            timeTex.text = data.lastUpdateTime
        else
            timeTex.text = ""
        end

        ----TODO XLQ 字牌 排行榜积分需要除1000
        --if ( data.panelIdx == 3 or data.panelIdx == 4 or data.panelIdx == 6) and (AppData.Game_Name == 'LDZP' or AppData.Game_Name == 'XXZP') then
        --    numTex.text = tonumber(data.bonusPoints)/1000
        --else
            numTex.text = data.bonusPoints
        --end
    end
end

return MuseumRankingView