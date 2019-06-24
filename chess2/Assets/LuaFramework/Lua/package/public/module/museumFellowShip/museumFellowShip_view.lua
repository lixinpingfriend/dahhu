
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumFellowShipView = Class('museumFellowShipView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

function MuseumFellowShipView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumfellowship/public_museumfellowship.prefab", "Public_MuseumFellowShip", 1)
    View.set_1080p(self)

    self.noFellowShipObj = GetComponentWithPath(self.root, "Top/Child/noFellowShipPanel", ComponentTypeName.Transform).gameObject
    self.haveFellowShipObj = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel", ComponentTypeName.Transform).gameObject
    self.helpObj = GetComponentWithPath(self.root, "Top/Child/helpPanel", ComponentTypeName.Transform).gameObject
    self.notInvitDataObj = GetComponentWithPath(self.root, "Top/Child/noFellowShipPanel/noDataObj", ComponentTypeName.Transform).gameObject
    self.haveInvitDataObj = GetComponentWithPath(self.root, "Top/Child/noFellowShipPanel/ScrollRect_invitation", ComponentTypeName.Transform).gameObject
    self.loadMoreInvitObj = GetComponentWithPath(self.root, "Top/Child/noFellowShipPanel/ScrollRect_invitation/Viewport/Content/LoadMoreInvitationBtn", ComponentTypeName.Transform).gameObject
    self.addMuseum = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/TagBtns/Scroll View/Viewport/Content/addMuseum", ComponentTypeName.Transform)
    self.dissBtnObj = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/TagBtns/Image (3)/dissBtn", ComponentTypeName.Transform).gameObject
    self.quitBtnObj = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/TagBtns/Image (3)/quitBtn", ComponentTypeName.Transform).gameObject

    self.msgBtnObj = GetComponentWithPath(self.root, "Center/Child/msgBtn", ComponentTypeName.Transform).gameObject
    self.memberBtnObj = GetComponentWithPath(self.root, "Center/Child/memberBtn", ComponentTypeName.Transform).gameObject

    self.loadPlayerObj = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/Viewport/Content/loadPlayerBtn", ComponentTypeName.Transform).gameObject

    self.contents = {}
    self.copyItems = {}-- 1 联谊被邀请列表     2 联谊大厅左边联谊中的亲友圈列表       3 联谊玩家
    self.copyItems[1] = GetComponentWithPath(self.root, "Top/Child/ItemPrefabHolder/InvitationItem", ComponentTypeName.Transform).gameObject
    self.copyItems[2] = GetComponentWithPath(self.root, "Top/Child/ItemPrefabHolder/museumItem2", ComponentTypeName.Transform).gameObject
    self.copyItems[3] = GetComponentWithPath(self.root, "Top/Child/ItemPrefabHolder/playerItem", ComponentTypeName.Transform).gameObject
    self.copyItems[4] = GetComponentWithPath(self.root, "Top/Child/ItemPrefabHolder/dataItem", ComponentTypeName.Transform).gameObject

    self.copyParents ={}
    self.copyParents[1] = GetComponentWithPath(self.root, "Top/Child/noFellowShipPanel/ScrollRect_invitation/Viewport/Content", ComponentTypeName.Transform)
    self.copyParents[2] = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/TagBtns/Scroll View/Viewport/Content", ComponentTypeName.Transform)
    self.copyParents[3] = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/Viewport/Content", ComponentTypeName.Transform)
    self.copyParents[4] = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_data/Viewport/Content", ComponentTypeName.Transform)
    self.verticalLayoutGroup_fellowShip = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_data/Viewport/Content", ComponentTypeName.VerticalLayoutGroup)
    self.contentSizeFitter_fellowShip = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_data/Viewport/Content", ComponentTypeName.ContentSizeFitter)


    self.museumDropdown = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/TopBar/museumDropdown", ComponentTypeName.Dropdown)
    self.winerSortToggle = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/TopBar/bigWinerBtn/Image", ComponentTypeName.Toggle)
    self.winerSortIcon = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/TopBar/bigWinerBtn/Image", ComponentTypeName.Transform)

    self.roundSortToggle = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/TopBar/RoundNumBtn/Image", ComponentTypeName.Toggle)
    self.roundSortIcon = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/TopBar/RoundNumBtn/Image", ComponentTypeName.Transform)

    self.playerInput = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/FilterBar/InputField", ComponentTypeName.InputField)
    self.playerFilterToggles = {}
    for i = 1, 5 do
        self.playerFilterToggles[i] = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_player/FilterBar/Toggle ("..i..")", ComponentTypeName.Toggle)
    end

    self.dataFilterToggles = {}
    for i = 1, 5 do
        self.dataFilterToggles[i] = GetComponentWithPath(self.root, "Top/Child/haveFellowShipPanel/ScrollRects/ScrollRect_data/FilterBar/Toggle ("..i..")", ComponentTypeName.Toggle)
	end
	
	self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
	self:fixed_tran_size(GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
end


--初始化联谊邀请列表
function MuseumFellowShipView:initLoopScrollViewList_invit(data)
    self.invitList = data.list

    if not self.invitList then
        return
    end

    self:reset(1)
    self.notInvitDataObj:SetActive(#self.invitList == 0)
    self.haveInvitDataObj:SetActive(#self.invitList ~= 0)

    if(#self.invitList > 0) then
        for i=1,#self.invitList do
            self:fillItem_invit(self:get_item(self.invitList[i], i, 1))
        end

        self.loadMoreInvitObj:SetActive(data.page < data.totalPage)
        self.loadMoreInvitObj.transform:SetAsLastSibling()
    end
end

function MuseumFellowShipView:fillItem_invit(item)
    local data = item.data
    local _parent = GetComponentWithPath(item.gameObject, "Scroll View/Viewport/Content", ComponentTypeName.Transform)
    local _item = GetComponentWithPath(item.gameObject, "museumItem", ComponentTypeName.Transform).gameObject
    local _contents = TableUtil.get_all_child(_parent.gameObject)
    for i=1,#_contents do
        ComponentUtil.SafeSetActive(_contents[i], false)
    end

    local obj = nil
    local _parlorData = nil
    local imageHead = nil
    local parlorName = nil
    local parlorNum = nil
    local tagObj = nil
    for i = 1,#data.parlorList do
        _parlorData = data.parlorList[i]
        if i<=#_contents then
            obj = _contents[i]
        else
            obj = TableUtil.clone(_item,_parent.gameObject,Vector3.zero)
        end
        obj.name = "item_" .. i
        ComponentUtil.SafeSetActive(obj, true)

        imageHead = GetComponentWithPath(obj.gameObject, "museumImg/Avatar/Image", ComponentTypeName.Image)
        parlorName = GetComponentWithPath(obj.gameObject, "name", ComponentTypeName.Text)
        parlorNum = GetComponentWithPath(obj.gameObject, "number", ComponentTypeName.Text)
        tagObj = GetComponentWithPath(obj.gameObject, "museumImg/tag", ComponentTypeName.Transform).gameObject
        if _parlorData then

            parlorName.text = Util.filterPlayerName(_parlorData.parlorName, 12)
            parlorNum.text =  string.format("0%s(%s人)", _parlorData.parlorNum , _parlorData.playerNum )
            tagObj:SetActive(_parlorData.parlorId == data.sourceParlorId)

            if(_parlorData.parlorLogo) then
                _parlorData.imageHead = _parlorData.parlorLogo
            else
                _parlorData.imageHead = _parlorData.headImg
            end
            self:image_load_sprite(imageHead, _parlorData.imageHead)
        end
    end
end


--初始化联谊亲友圈列表
function MuseumFellowShipView:initLoopScrollViewList_museum(data,museumData)
    self.museumList = data
    self.isInitiator = museumData.initiatorParlorId == museumData.orginalParlorId

    if not self.museumList then
        return
    end

    self:reset(2)
    self.museumDropdown.options:Clear()
    local optionData = UnityEngine.UI.Dropdown.OptionData("所有亲友圈")
    self.museumDropdown.options:Add(optionData)
    if(#self.museumList > 0) then
        for i=1,#self.museumList do
            self:fillItem_museum(self:get_item(self.museumList[i], i, 2))

            optionData = UnityEngine.UI.Dropdown.OptionData("0"..self.museumList[i].parlorNum)
            self.museumDropdown.options:Add(optionData)
        end

        self.addMuseum:SetAsLastSibling()
    end

    self.addMuseum.gameObject:SetActive(museumData.playerRole == "OWNER") --仅联谊圈（发起圈）的圈主有邀请按钮
end

function MuseumFellowShipView:fillItem_museum(item)
    local data = item.data
    local imageHead = GetComponentWithPath(item.gameObject, "museumImg/Avatar/Image", ComponentTypeName.Image)
    local parlorName = GetComponentWithPath(item.gameObject, "name", ComponentTypeName.Text)
    local parlorNum = GetComponentWithPath(item.gameObject, "number", ComponentTypeName.Text)
    local tagObj = GetComponentWithPath(item.gameObject, "museumImg/tag", ComponentTypeName.Transform).gameObject
    local kickBtnObj = GetComponentWithPath(item.gameObject, "kickBtn", ComponentTypeName.Transform).gameObject

    if data then
        parlorName.text = Util.filterPlayerName(data.parlorName, 12)
        parlorNum.text =  string.format("圈号:0%s(%s)", data.parlorNum , data.playerNum )
        tagObj:SetActive(data.fellowshipType == 2)
        kickBtnObj:SetActive(data.fellowshipType ~= 2 and self.isInitiator)

        if(data.parlorLogo) then
            data.imageHead = data.parlorLogo
        else
            data.imageHead = data.headImg
        end
        self:image_load_sprite(imageHead, data.imageHead)
    end
end


function MuseumFellowShipView:initLoopScrollViewList_Member(data)
    self.memberList = data.list

    if not self.memberList then
        return
    end

    self:reset(3)

    if(#self.memberList > 0) then
        for i=1,#self.memberList do
            self:fillItem_member(self:get_item(self.memberList[i], i, 3))
        end

        self.loadPlayerObj:SetActive(data.page < data.totalPage)
        self.loadPlayerObj.transform:SetAsLastSibling()
    end
end

local groupString = {"正常","A组","B组","C组","封停","D组","E组","F组","G组","H组"}
function MuseumFellowShipView:fillItem_member(item)
    local data = item.data
    local imageHead = GetComponentWithPath(item.gameObject, "Avatar/Image", ComponentTypeName.Image)
    local nick = GetComponentWithPath(item.gameObject, "nick", ComponentTypeName.Text)
    local parlorNum = GetComponentWithPath(item.gameObject, "parlorNum", ComponentTypeName.Text)
    --local changeParlorBtn = GetComponentWithPath(item.gameObject, "parlorNum/changeParlorBtn", ComponentTypeName.Transform).gameObject

    local bigWinerNum = GetComponentWithPath(item.gameObject, "bigWinerNum", ComponentTypeName.Text)
    local roundNum = GetComponentWithPath(item.gameObject, "roundNum", ComponentTypeName.Text)
    local groupTex = GetComponentWithPath(item.gameObject, "groupBtn", ComponentTypeName.Text)
    local checkRecordObj = GetComponentWithPath(item.gameObject, "checkRecordBtn", ComponentTypeName.Transform).gameObject

    if data then
        nick.text = Util.filterPlayerName(data.name , 12)

        checkRecordObj:SetActive(not data.disabled)
        groupTex.gameObject:SetActive(not data.disabled)
        if not data.disabled  then
            parlorNum.text = "0"..  data.currentParlorNum
            --0 正常     1 A组    2 B组    3 C组    4 封顶  5 D组  6 E     7 F     8 G     9 H
            groupTex.text = groupString[data.groupNum +1]
        else
            parlorNum.text = "已退出"
        end

        bigWinerNum.text = data.bigWinerCount
        roundNum.text = data.tableCount

        --changeParlorBtn:SetActive(data.allParlorId ~= tostring(data.currentParlorId))


        if data.headImg then
            self:image_load_sprite(imageHead, data.headImg)
        end

    end
end


function MuseumFellowShipView:initLoopScrollViewList_Data(data)
    self.dataList = data

    if not self.dataList then
        return
    end

    self:reset(4)

    if(#self.dataList > 0) then
        for i=1,#self.dataList do
            self.dataList[i].item = self:get_item(self.dataList[i], i, 4)
            self:fillItem_Data(self.dataList[i].item)
        end
    end
end

function MuseumFellowShipView:fillItem_Data(item)
    local data = item.data
    local parlorNum = GetComponentWithPath(item.gameObject, "totalData/parlorNum", ComponentTypeName.Text)
    local cashPowerNum = GetComponentWithPath(item.gameObject, "totalData/cashPowerNum", ComponentTypeName.Text)
    local powerNum = GetComponentWithPath(item.gameObject, "totalData/powerNum", ComponentTypeName.Text)
    local winerNun = GetComponentWithPath(item.gameObject, "totalData/winerNun", ComponentTypeName.Text)
    local roundNun = GetComponentWithPath(item.gameObject, "totalData/roundNun", ComponentTypeName.Text)

    item.openIcon =  GetComponentWithPath(item.gameObject, "totalData/openIcon", ComponentTypeName.Transform)
    item.dataInfoParent =  GetComponentWithPath(item.gameObject, "dataInfo", ComponentTypeName.Transform).gameObject
    item.contentSizeFitter_dataInfo =   GetComponentWithPath(item.gameObject, "dataInfo",ComponentTypeName.ContentSizeFitter)
    item.verticalLayoutGroup_dataInfo =   GetComponentWithPath(item.gameObject, "dataInfo",ComponentTypeName.VerticalLayoutGroup)

    item.contentSizeFitter =  ModuleCache.ComponentManager.GetComponent(item.gameObject,ComponentTypeName.ContentSizeFitter)
    item.verticalLayoutGroup =  ModuleCache.ComponentManager.GetComponent(item.gameObject,ComponentTypeName.VerticalLayoutGroup)

    if data then
        parlorNum.text ="0"..data.slaveParlorNum
        cashPowerNum.text = data.coinsAndHp
        powerNum.text = data.hp
        winerNun.text = data.bigWinerCount
        roundNun.text = data.tableCount
    end
end

function MuseumFellowShipView:initLoopScrollViewList_dayData(data,item)

    local _contentSizeFitter = GetComponentWithPath(item.gameObject, "dataInfo", ComponentTypeName.ContentSizeFitter)
    local _parent = GetComponentWithPath(item.gameObject, "dataInfo", ComponentTypeName.Transform)
    local _item = GetComponentWithPath(item.gameObject, "dataInfoItem", ComponentTypeName.Transform).gameObject
    local _contents = TableUtil.get_all_child(_parent.gameObject)
    for i=1,#_contents do
        ComponentUtil.SafeSetActive(_contents[i], false)
    end

    if not data or #data == 0 then
        return
    end

    local obj = nil
    local time = nil
    local cashPowerNum = nil
    local powerNum = nil
    local winerNun = nil
    local roundNun = nil

    for i=1,#data do

        if i<=#_contents then
            obj = _contents[i]
        else
            obj = TableUtil.clone(_item,_parent.gameObject,Vector3.zero)
        end
        obj.name = "item_" .. i
        ComponentUtil.SafeSetActive(obj, true)

        time = GetComponentWithPath(obj.gameObject, "time", ComponentTypeName.Text)
        cashPowerNum = GetComponentWithPath(obj.gameObject, "cashPowerNum", ComponentTypeName.Text)
        powerNum = GetComponentWithPath(obj.gameObject, "powerNum", ComponentTypeName.Text)
        winerNun = GetComponentWithPath(obj.gameObject, "winerNun", ComponentTypeName.Text)
        roundNun = GetComponentWithPath(obj.gameObject, "roundNun", ComponentTypeName.Text)
        if data[i] then
            time.text = data[i].eventDate
            cashPowerNum.text = data[i].coinsAndHp
            powerNum.text = data[i].hp
            winerNun.text = data[i].bigWinerCount
            roundNun.text = data[i].tableCount
        end
    end

    _contentSizeFitter:SetLayoutVertical()
end


function MuseumFellowShipView:get_item(data, i,type)
    local obj = nil
    local item = {}
    if i<=#self.contents[type] and self.contents[type][i].name ~= "LoadMoreInvitationBtn" and self.contents[type][i].name ~= "addMuseum" and self.contents[type][i].name ~= "loadPlayerBtn" then
        obj = self.contents[type][i]
    else
        obj = TableUtil.clone(self.copyItems[type],self.copyParents[type].gameObject,Vector3.zero)
    end
    obj.name = "item_" .. i
    ComponentUtil.SafeSetActive(obj, true)
    item.gameObject = obj
    item.data = data
    return item
end

function MuseumFellowShipView:reset(type)
    if not self.copyParents[type] then
        return
    end

    self.contents[type] = TableUtil.get_all_child(self.copyParents[type].gameObject)
    for i=1,#self.contents[type] do
        if self.contents[type][i].name ~= "addMuseum" and self.contents[type][i].name ~= "LoadMoreInvitationBtn" and self.contents[type][i].name ~= "loadPlayerBtn"then
            ComponentUtil.SafeSetActive(self.contents[type][i], false)
        end

    end
end

return MuseumFellowShipView