
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumFellowShipHistoryView = Class('museumFellowShipHistoryView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

function MuseumFellowShipHistoryView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumfellowshiphistory/public_museumfellowshiphistory.prefab", "Public_MuseumFellowShipHistory", 1)
    View.set_1080p(self)

    self.copyItem = GetComponentWithPath(self.root, "Top/Child/ItemPrefabHolder/CopyItem", ComponentTypeName.Transform).gameObject
    self.copyParent = GetComponentWithPath(self.root, "Top/Child/ScrollRect/Viewport/Content", ComponentTypeName.RectTransform)
    self.verticalLayoutGroup_fellowShip = GetComponentWithPath(self.root, "Top/Child/ScrollRect/Viewport/Content", ComponentTypeName.VerticalLayoutGroup)
    self.contentSizeFitter_fellowShip = GetComponentWithPath(self.root, "Top/Child/ScrollRect/Viewport/Content", ComponentTypeName.ContentSizeFitter)

    self.LoadMoreFellowShipBtn = GetComponentWithPath(self.root, "Top/Child/ScrollRect/Viewport/Content/LoadMoreFellowShipBtn", ComponentTypeName.Transform).gameObject

    self.notDataObj = GetComponentWithPath(self.root, "Top/Child/notDataText", ComponentTypeName.Transform).gameObject
end


--初始化亲友圈列表
function MuseumFellowShipHistoryView:initLoopScrollViewList(data)
    self.dataList = data.list

    self.notDataObj:SetActive(#self.dataList == 0)
    self:reset()
    self.LoadMoreFellowShipBtn:SetActive(false)
    --self.LoadMoreFellowShipBtn.transform:SetAsLastSibling()
    --self.LoadMoreFellowShipBtn:SetActive(data.page < data.totalPage)

    if(#self.dataList > 0) then
        for i=1,#self.dataList do
            self.dataList[i].item = self:get_item(self.dataList[i], i)
            self:fillItem(self.dataList[i].item)
        end
    end
end

function MuseumFellowShipHistoryView:fillItem(item)

    local data = item.data

    item.openIcon =  GetComponentWithPath(item.gameObject, "totalData/Image", ComponentTypeName.Transform)
    item.dataInfoParent =  GetComponentWithPath(item.gameObject, "dataInfo", ComponentTypeName.Transform).gameObject
    item.contentSizeFitter_dataInfo =   GetComponentWithPath(item.gameObject, "dataInfo",ComponentTypeName.ContentSizeFitter)
    item.verticalLayoutGroup_dataInfo =   GetComponentWithPath(item.gameObject, "dataInfo",ComponentTypeName.VerticalLayoutGroup)

    item.contentSizeFitter =  ModuleCache.ComponentManager.GetComponent(item.gameObject,ComponentTypeName.ContentSizeFitter)
    item.verticalLayoutGroup =  ModuleCache.ComponentManager.GetComponent(item.gameObject,ComponentTypeName.VerticalLayoutGroup)
    item.museumDropdown =  GetComponentWithPath(item.gameObject, "dataInfo/TopBar/museumDropdown", ComponentTypeName.Dropdown)

    local parlorItem = {}
    for i=1,3 do
        parlorItem[i] = {}
        parlorItem[i].itemObj = GetComponentWithPath(item.gameObject, "totalData/fellowShipParlors/museumItem"..i, ComponentTypeName.Transform).gameObject

        parlorItem[i].headImg = GetComponentWithPath(parlorItem[i].itemObj, "museumImg/Avatar/Image", ComponentTypeName.Image)
        parlorItem[i].parlorName = GetComponentWithPath(parlorItem[i].itemObj,"name", ComponentTypeName.Text)
        parlorItem[i].parlorNum = GetComponentWithPath(parlorItem[i].itemObj, "number", ComponentTypeName.Text)
        parlorItem[i].tagObj = GetComponentWithPath(parlorItem[i].itemObj, "museumImg/tag", ComponentTypeName.Transform).gameObject
        parlorItem[i].itemObj:SetActive(false)
    end


    local timeTex = GetComponentWithPath(item.gameObject, "totalData/timeTex", ComponentTypeName.Text)
    local cashPowerNum = GetComponentWithPath(item.gameObject, "totalData/cashPowerNum/numTex", ComponentTypeName.Text)
    local roundNum = GetComponentWithPath(item.gameObject, "totalData/roundNum/numTex", ComponentTypeName.Text)

    local endTime = ""
    if(data) then
        if data.dissFellowshipTime and type(data.dissFellowshipTime) ~= "userdata" then
            endTime = data.dissFellowshipTime
        else
            endTime = "正在进行"
        end
        timeTex.text = data.createTime.."-"..endTime
        cashPowerNum.text = data.coinsAndHp
        roundNum.text = data.tableCount

        item.museumDropdown.options:Clear()
        local optionData = nil
        local _parlorData = nil
        item.parlorIdList = {}
        for i=1, #data.parlorList do
            _parlorData = data.parlorList[i]
            item.parlorIdList[i] = _parlorData.parlorId
            optionData = UnityEngine.UI.Dropdown.OptionData("0".. _parlorData.parlorNum)
            item.museumDropdown.options:Add(optionData)

            if i <= #parlorItem then
                parlorItem[i].itemObj:SetActive(true)
                parlorItem[i].parlorName.text = _parlorData.parlorName
                parlorItem[i].parlorNum.text = "圈号:0".. _parlorData.parlorNum.."(".._parlorData.playerNum.."人)"
                parlorItem[i].tagObj:SetActive(_parlorData.fellowshipType  == 2)
                self:image_load_sprite(parlorItem[i].headImg, _parlorData.headImg)
            end
        end
    end

end


function MuseumFellowShipHistoryView:initLoopScrollViewList_dayData(data,item)
    local dayList = data.list


    local _contentSizeFitter = GetComponentWithPath(item.gameObject, "dataInfo", ComponentTypeName.ContentSizeFitter)
    local _parent = GetComponentWithPath(item.gameObject, "dataInfo", ComponentTypeName.Transform)
    local _item = GetComponentWithPath(item.gameObject, "dataInfoItem", ComponentTypeName.Transform).gameObject
    local _loadMoreDayDataBtn = GetComponentWithPath(item.gameObject, "dataInfo/LoadMoreDayDataBtn", ComponentTypeName.Transform).gameObject


    _loadMoreDayDataBtn:SetActive(data.page < data.totalPage)
    _loadMoreDayDataBtn.transform:SetAsLastSibling()
    _contentSizeFitter:SetLayoutVertical()

    local _contents = TableUtil.get_all_child(_parent.gameObject)
    for i=1,#_contents do
        if _contents[i].name ~= "TopBar" and _contents[i].name ~= "LoadMoreDayDataBtn" then
            ComponentUtil.SafeSetActive(_contents[i], false)
        end

    end

    if not dayList or #dayList == 0 then
        return
    end

    local obj = nil
    local time = nil
    local cashPowerNum = nil
    local powerNum = nil
    local winerNun = nil
    local roundNun = nil
    local parlorNum = nil

    for i=1,#dayList do

        if i<=#_contents and _contents[i].name ~= "TopBar" and _contents[i].name ~= "LoadMoreDayDataBtn" then
            obj = _contents[i]
        else
            obj = TableUtil.clone(_item,_parent.gameObject,Vector3.zero)
        end
        obj.name = "item_" .. i
        ComponentUtil.SafeSetActive(obj, true)

        time = GetComponentWithPath(obj.gameObject, "time", ComponentTypeName.Text)
        parlorNum = GetComponentWithPath(obj.gameObject, "parlorNum", ComponentTypeName.Text)
        cashPowerNum = GetComponentWithPath(obj.gameObject, "cashPowerNum", ComponentTypeName.Text)
        powerNum = GetComponentWithPath(obj.gameObject, "powerNum", ComponentTypeName.Text)
        winerNun = GetComponentWithPath(obj.gameObject, "winerNun", ComponentTypeName.Text)
        roundNun = GetComponentWithPath(obj.gameObject, "roundNun", ComponentTypeName.Text)
        if dayList[i] then
            time.text = dayList[i].eventDate
            parlorNum.text ="0".. dayList[i].slaveParlorNum
            cashPowerNum.text = dayList[i].coinsAndHp
            powerNum.text = dayList[i].hp
            winerNun.text = dayList[i].bigWinerCount
            roundNun.text = dayList[i].tableCount
        end
    end

end


function MuseumFellowShipHistoryView:get_item(data, i)
    local obj = nil
    local item = {}
    if i<=#self.contents  and self.contents[i].name ~= "LoadMoreFellowShipBtn" then
        obj = self.contents[i]
    else
        obj = TableUtil.clone(self.copyItem,self.copyParent.gameObject,Vector3.zero)
    end
    obj.name = "item_" .. i
    ComponentUtil.SafeSetActive(obj, true)
    item.gameObject = obj
    item.data = data
    return item
end

function MuseumFellowShipHistoryView:reset()
    self.contents = TableUtil.get_all_child(self.copyParent.gameObject)
    for i=1,#self.contents do
        if self.contents[i].name ~= "LoadMoreFellowShipBtn" then
            ComponentUtil.SafeSetActive(self.contents[i], false)
        end

    end
end

return MuseumFellowShipHistoryView