




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
---@class GoldEntranceView : View
local GoldEntranceView = Class('goldEntranceView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponent = ModuleCache.ComponentManager.GetComponent
local ComponentUtil = ModuleCache.ComponentUtil
local Manager = require("package.public.module.function_manager")
local PlayerPrefs = UnityEngine.PlayerPrefs
local Color = Color
local Vector3 = Vector3

function GoldEntranceView:initialize(...)
    -- 初始View 
    View.initialize(self, "public/module/goldentrance/public_windowgoldentrance.prefab", "Public_WindowGoldEntrance", 1)
    self:set_1080p()
    self.itemList = {}
    self.moveList = {}
	self.wanFaBtnTable = {}
	self.CenterRoot = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform)
	self:fixed_tran_size(self.CenterRoot, 0.90)
    self.textGoldNum = GetComponentWithPath(self.root, "Top/StatusBar/Gold/TextNum", ComponentTypeName.Text)
    self.textDiamondNum = GetComponentWithPath(self.root, "Top/StatusBar/Diamond/TextNum", ComponentTypeName.Text)
    self.textTiliNum = GetComponentWithPath(self.root, "Top/StatusBar/Tili/TextNum", ComponentTypeName.Text)
    self.textPlayDesc = GetComponentWithPath(self.root, "Center/PlayInfo/PlayText", ComponentTypeName.Text)
    self.textGameName = GetComponentWithPath(self.root, "Top/Text", ComponentTypeName.Text)
    self.objRoom = GetComponentWithPath(self.root, "Center/Room/RoomList/Viewport/RoomListContent/Ex", ComponentTypeName.Transform).gameObject
    self.objRoom:SetActive(false)
    self.spriteHolder = ModuleCache.ComponentManager.GetComponent(self.root, "SpriteHolder");
    self.grid = GetComponentWithPath(self.root, "Center/Table/ScrollView/Viewport/Content", ComponentTypeName.GridLayoutGroup);
    self.stageSpriteHolder = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Room", "SpriteHolder");
    self.scrollTable = GetComponentWithPath(self.root, "Center/Table/ScrollView", ComponentTypeName.ScrollRect)
    self.color = { }
    self.color[1] = Color.New(6 / 255, 73 / 255, 107 / 255, 1)
    self.color[2] = Color.New(134 / 255, 55 / 255, 8 / 255, 1)
    self.color[3] = Color.New(50 / 255, 108 / 255, 6 / 255, 1)
    self.color[4] = Color.New(17 / 255, 90 / 255, 30 / 255, 1)
    self.tagObj = {}
    self.goQuickStart = ModuleCache.ComponentManager.Find(self.root, "Center/Room/StartBtn")
    self.recommodRoom = GetComponentWithPath(self.root, "Center/Room/StartBtn/Text (1)", ComponentTypeName.Text)

    self.wanfalistObj = GetComponentWithPath(self.root, "Center/Room/wanFaList/background/Scroll View/Viewport/Content", ComponentTypeName.Transform).gameObject
	self.wanfaTemplate = GetComponentWithPath(self.wanfalistObj, "ItemTemplate", ComponentTypeName.Transform).gameObject
	
	self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
end

function GoldEntranceView:setRecommondRoom(s)
    self.recommodRoom.text = s
end

--更新金币数量
function GoldEntranceView:refresh_gold(data)
    if not data then
        return
    end
    if data.gold then
        self.textGoldNum.text = Util.filterPlayerGoldNum(tonumber(data.gold))
    end
    if data.cards and data.coins then
        self.textTiliNum.text = Util.filterPlayerGoldNum(tonumber(data.coins))
    end
end
--fylq|ysghf|sxmj|hnsx|fnbjz|fnsmh|hhmj|hbtdh|hnmj2|hzmj
--阜阳临泉|颍上杠后翻|濉溪麻将|淮南寿县|阜南掰夹子|阜南三门胡|换换麻将|淮北推倒胡|淮南麻将|红中麻将
function GoldEntranceView:initWanFaList(wanfaNames)
    if self.wanFaBtnTable and  #self.wanFaBtnTable > 0 then
        for _, _obj in ipairs(self.wanFaBtnTable) do
            Manager.DestroyObject(_obj.gameObject)
        end
        self.wanFaBtnTable = {}
    end
    if not wanfaNames then
        return
    end
    local key = string.format("%s_lastSelectGoldPlayTypeName",ModuleCache.GameManager.curGameId)
    local lastSelectGoldPlayTypeName = PlayerPrefs.GetString(key,"")
    local lastSelectIndex = PlayerPrefs.GetInt(AppData.get_url_game_name() .. "_wanfaType", 1)
    for i=1,#wanfaNames do
        local wanfaName = wanfaNames[i]
        local target  = ComponentUtil.InstantiateLocal(self.wanfaTemplate, Vector3.zero)
        target.transform:SetParent(self.wanfaTemplate.transform.parent)
        target.transform.localScale = Vector3.one
        target.transform.localPosition = Vector3.New(target.transform.localPosition.x, target.transform.localPosition.y, 0)
        target.name = wanfaName.wanfaType
        ComponentUtil.SafeSetActive(target, true)
        local bgObj =  GetComponentWithPath(target, "Bg", ComponentTypeName.Transform).gameObject
        local selectObj =  GetComponentWithPath(target, "Select", ComponentTypeName.Transform).gameObject
        local bgText =  GetComponentWithPath(bgObj, "TextBg", ComponentTypeName.Text)
        local selectText =  GetComponentWithPath(selectObj, "TextSelect", ComponentTypeName.Text)
        bgText.text = wanfaName.name
        selectText.text = wanfaName.name
        if lastSelectGoldPlayTypeName == wanfaName.wanfaType then
            lastSelectIndex = i
        end
        local btn =
        {
            gameObject = target,
            selectObj = selectObj,
        }
        table.insert(self.wanFaBtnTable,btn)
    end
    local curSelectBtn = self.wanFaBtnTable[lastSelectIndex]
    if not curSelectBtn then
        lastSelectIndex = 1
        curSelectBtn = self.wanFaBtnTable[lastSelectIndex]
    end
    curSelectBtn.gameObject.transform:SetSiblingIndex(0)
    self:refresh_wanfa_btn_state(curSelectBtn.gameObject)
    return lastSelectIndex
end
function GoldEntranceView:refresh_wanfa_btn_state(curSelectObj)
    for i=1,#self.wanFaBtnTable  do
        local btn = self.wanFaBtnTable[i]
        ComponentUtil.SafeSetActive(btn.selectObj, false)
        if btn.gameObject == curSelectObj then
            ComponentUtil.SafeSetActive(btn.selectObj, true)
        end
    end
end
function GoldEntranceView:get_wanfa_index_by_wanfabtn_obj(obj)
    for i=1,#self.wanFaBtnTable  do
        local btn = self.wanFaBtnTable[i]
        if btn.gameObject == obj then
            return i
        end
    end
end

--初始化房间数据
function GoldEntranceView:initRoomViewList(roomData)
    for i = 1, #roomData do
        local info = roomData[i]
        local target
        if not self.itemList[i] then
            target = ComponentUtil.InstantiateLocal(self.objRoom, Vector3.zero)
            target.transform:SetParent(self.objRoom.transform.parent)
            target.transform.localScale = Vector3.one
            target.transform.localPosition = Vector3.New(target.transform.localPosition.x, target.transform.localPosition.y, 0)
            target.name = tostring(info.goldId)
            self.itemList[i] = target
        else
            target = self.itemList[i]
            target.name = tostring(info.goldId)
        end
        target:SetActive(true)
        local canvas = ModuleCache.ComponentManager.GetComponent(target, "UnityEngine.Canvas")
        canvas.sortingOrder = self.canvas.sortingOrder + 1
        local gameModule = ModuleCache.ComponentManager.GetComponent(target,"GameModule")
        gameModule:SetLayers()
        local nameImg = GetComponentWithPath(target, "Name", ComponentTypeName.Image)
        local enterText = GetComponentWithPath(target, "Info/Coin", ComponentTypeName.Text)
        local personNum = GetComponentWithPath(target, "Info/PersonNum", ComponentTypeName.Text)
        local tagDesc = GetComponentWithPath(target, "Corner/Text", ComponentTypeName.Text)
        local tagObj = GetComponentWithPath(target, "Corner", ComponentTypeName.Transform).gameObject
        local textUiSwitch = GetComponentWithPath(target, "TextStyle", "UIStateSwitcher")
        local textParent = GetComponentWithPath(target, "TextStyle/" .. i, ComponentTypeName.Transform).gameObject
        local nameText = GetComponentWithPath(textParent, "NameText", ComponentTypeName.Text)
        local difenText = GetComponentWithPath(textParent, "DiFenText", ComponentTypeName.Text)
        textUiSwitch:SwitchState(i)
        personNum.text = info.onLine
        nameText.text = info.goldName
        difenText.text = "底分<size=95>" .. info.baseScore .. "</size>"
        if tonumber(info.maxJoinCoin) >= 99999999 then
            enterText.text = Util.filterPlayerGoldNumWan(tonumber(info.minJoinCoin)) .. "以上"

        else
            enterText.text = Util.filterPlayerGoldNumWan(tonumber(info.minJoinCoin)) .. "-" .. Util.filterPlayerGoldNumWan(tonumber(info.maxJoinCoin))

        end
        if info.goldTagDesc and type(info.goldTagDesc) == "string" and info.goldTagDesc ~= "" then

            ComponentUtil.SafeSetActive(tagObj, true)
            tagDesc.text = info.goldTagDesc
        else
            ComponentUtil.SafeSetActive(tagObj, false)
        end
        nameImg.sprite = self.stageSpriteHolder:FindSpriteByName(i .. "");
    end
    self.goQuickStart:SetActive(#roomData > 0)
    if #self.itemList > #roomData then
        for i = #roomData + 1, #self.itemList do
            self.itemList[i]:SetActive(false)
        end
    end
end

function GoldEntranceView:setChooseEffect(index)
    for i = 1,#self.itemList do
        local obj = self.itemList[i]
        local choose =  GetComponentWithPath(obj, "Choose", ComponentTypeName.Transform).gameObject
        choose:SetActive(i == index)
    end
end

function GoldEntranceView:state_str(num)
    local str
    num = tonumber(num)
    if num <= 20 then
        str = 1
    elseif num <= 100 then
        str = 2
    else
        str = 3
    end
    return str
end




return GoldEntranceView