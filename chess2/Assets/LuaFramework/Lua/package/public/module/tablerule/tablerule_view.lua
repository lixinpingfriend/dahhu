
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableRuleView = Class('tableRuleView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local yOffset = 75
local xTotalOffset = 276 * 2
local bgBeginHeight = 77
local addOffset = 10
local TableUtil = require("package.public.table_util")
local color1 = Color.New(177/255,58/255,31/255,1)
local color2 = Color.New(122/255,88/255,68/255,1)
local table = table

---@field ruleTableStateType
TableRuleView.viewState =
{
    common = 1, ---普通模式
    gold = 2, ---金币场模式
}

function TableRuleView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/tablerule/public_tablerule.prefab", "Public_TableRule", 1)


    self.commonDisObj =  GetComponentWithPath(self.root, "commonRoomTypeDis", ComponentTypeName.Transform).gameObject
    self.goldDisObj =  GetComponentWithPath(self.root, "goldRoomTypeDis", ComponentTypeName.Transform).gameObject

    self.buttonClose = GetComponentWithPath(self.root, "commonRoomTypeDis/Center/Child/ImageBack", ComponentTypeName.Button)
    self.titleTex = GetComponentWithPath(self.root,"commonRoomTypeDis/Center/Child/Title/bg/Text",ComponentTypeName.Text)

    self.titleTex2 = GetComponentWithPath(self.goldDisObj,"Child/Center/Child/Title/bg/Text",ComponentTypeName.Text)
    self.goldRoomRuleText = GetComponentWithPath(self.goldDisObj, "Child/GoldRoomRuleText", ComponentTypeName.Text)

    self.cloneParent = GetComponentWithPath(self.root, "commonRoomTypeDis/Clone", ComponentTypeName.Transform).gameObject
    self.BgParent = GetComponentWithPath(self.root, "commonRoomTypeDis/Top/Panels/Scroll View/Viewport/Content", ComponentTypeName.RectTransform)
    self.copyBgItem = GetComponentWithPath(self.root, "commonRoomTypeDis/Top/Panels/Scroll View/Viewport/Content/BgItem", ComponentTypeName.Transform).gameObject
    self.copyGroupItem = GetComponentWithPath(self.copyBgItem, "GroupItem", ComponentTypeName.Transform).gameObject
    self.copyToggleItem = GetComponentWithPath(self.copyBgItem, "GroupItem/CopyItem", ComponentTypeName.Transform).gameObject
    self.payInfoTitle = GetComponentWithPath(self.root, "commonRoomTypeDis/Bottom/Child/PayInfo/TextTitle (1)", ComponentTypeName.Text)
    self.payInfoObj = GetComponentWithPath(self.root, "commonRoomTypeDis/Bottom/Child/PayInfo", ComponentTypeName.Transform).gameObject
    self.payInfoObj_museum = GetComponentWithPath(self.root, "commonRoomTypeDis/Bottom/Child/PayInfo_museum", ComponentTypeName.Text)

    self.bgItemBeginPos = self.copyBgItem.transform.localPosition
    self.groupItemBeginPos = self.copyGroupItem.transform.localPosition
    self.toggleBeginPos = self.copyToggleItem.transform.localPosition
    TableUtil.move_clone(self.copyToggleItem, self.cloneParent)
    TableUtil.move_clone(self.copyGroupItem, self.cloneParent)
    TableUtil.move_clone(self.copyBgItem, self.cloneParent)
    self.copyPayItem = GetComponentWithPath(self.root, "commonRoomTypeDis/Bottom/Child/PayInfo/CopyPayItem", ComponentTypeName.Transform).gameObject
    self.payItemBeginPos = self.copyPayItem.transform.localPosition
    TableUtil.move_clone(self.copyPayItem, self.cloneParent)
    self.clones = TableUtil.get_all_child(self.cloneParent)
    
end

function TableRuleView:switchViewState(viewState)
    ComponentUtil.SafeSetActive(self.commonDisObj,self.viewState.common == viewState)
    ComponentUtil.SafeSetActive(self.goldDisObj,self.viewState.gold == viewState)
end

function TableRuleView:show_create(wanfaType, rule)
    self.bigShow = {}
    self.smallShow = {}
    self.twoBgItems = {}
    local ruleTable = ModuleCache.Json.decode(rule)
    self.enterBaseScore = ruleTable.baseScore or 0
    self.Config = ModuleCache.PlayModeUtil.getGameRuleConfig(ruleTable.GameID) --require(string.format("package.public.config.%s.config_%s",AppData.App_Name,AppData.Game_Name))
    local data = self.Config.createRoomTable[wanfaType]
    self:handle_pay_toggles(data,wanfaType,rule)
    self.toggles = {}
    TableUtil.hide_childs(self.BgParent.gameObject,"BgItem")
    local bgOffset = 0
    local addI = 1
    -- 计算偏移
    for i=1,#data do
        local togglesData = data[i]
        local keyData = togglesData.tag
        if(not keyData.isPay and self:is_active(keyData)) then
            local bgHeight = bgBeginHeight
            local bgItem = TableUtil.get_or_clone(addI, "BgItem", self.BgParent.gameObject, self.bgItemBeginPos - Vector3.New(0, bgOffset, 0), self.poorObjs, self.clones)
            local moveNum = 3

            if(addI < moveNum) then
                table.insert(self.twoBgItems, bgItem)
            end
            TableUtil.hide_childs(bgItem, "GroupItem")
            local groupOffset = 0
            self.toggles[addI] = 
            {
                select = false,
                list = {}
            }
            for j=1,#togglesData.list do
                local groupData = togglesData.list[j]
                local rowNum = groupData.rowNum or keyData.rowNum
                local addHeight = 0
                local groupItem = TableUtil.get_or_clone(j, "GroupItem", bgItem, self.groupItemBeginPos - Vector3.New(0, groupOffset, 0), self.poorObjs, self.clones)
                local toggleParentGrid = ModuleCache.ComponentManager.GetComponent(groupItem, ComponentTypeName.ToggleGroup)
                TableUtil.hide_childs(groupItem)
                local addK = 1
                for k=1,#groupData do
                    local xOffset = xTotalOffset / (rowNum - 1)
                    local toggleData = groupData[k]
                    if(self:is_small_show(toggleData)) then
                        local toggleItem = TableUtil.get_or_clone(addK, "CopyItem", groupItem, Vector3.New(0, 0, 0), self.poorObjs, self.clones)
                        toggleItem.transform.localPosition = self.toggleBeginPos + Vector3.New(((addK - 1) % rowNum) * xOffset, math.floor((addK - 1) / rowNum) * -yOffset, 0)
                        local toggle = self:set_toggle_data(toggleItem,toggleData,toggleParentGrid,rule)
                        table.insert(self.toggles[addI].list, toggle)
                        if(toggle.toggle.isOn and toggleData.clickBigShow) then -- 点击影响整个分类显示不显示
                            table.insert(self.bigShow, toggleData.clickBigShow)
                        end
                        if(toggle.toggle.isOn and toggleData.clickSmallShow) then -- 点击只影响一个toggle
                            table.insert(self.smallShow, toggleData.clickSmallShow)
                        end
                        addK = addK + 1
                    end
                end
                if(j == 1) then
                    addHeight = math.ceil((addK - 1)/rowNum - 1) * yOffset
                else
                    addHeight = math.ceil((addK - 1)/rowNum) * yOffset
                end
                bgHeight = bgHeight + addHeight
                if(addHeight == -yOffset) then
                    addHeight = -bgBeginHeight
                end
                if(j == 1) then
                    groupOffset = bgBeginHeight
                end
                groupOffset = groupOffset + addHeight
            end
            local bgTrans = GetComponentWithPath(bgItem, "Image", ComponentTypeName.RectTransform)
            bgTrans.sizeDelta = Vector2.New(bgTrans.sizeDelta.x, bgHeight)
            bgOffset = bgOffset + bgHeight + addOffset
            local bgText = GetComponentWithPath(bgItem, "TextTitle", ComponentTypeName.Text)
            bgText.text = keyData.togglesTile
            addI = addI + 1
        end
        
        self.BgParent.sizeDelta = Vector2.New(self.BgParent.sizeDelta.x, bgOffset)
    end
end





function TableRuleView:is_active(keyData)
    local hallID = self.hallID
    if TableManager:cur_game_is_gold_room_type() and keyData.hideInGoldTable == true then ---当这个设置为Ture时，在金币场不显示
        return false
    end
    local active = (hallID == 0 and (keyData.goldSet == nil or keyData.goldSet))
        or (hallID > 0 and not keyData.goldSet)
    return (not keyData.bigShow or (keyData.bigShow and self:is_big_show(keyData))) and active and not keyData.hideTableRule
end

function TableRuleView:is_small_show(toggleData)
    local have = (toggleData.smallShow == nil)
    if(toggleData.smallShow) then
        for i=1,#self.smallShow do
            if(self.smallShow[i] == toggleData.smallShow) then
                have = true
            end
        end
    end
    if(toggleData.moreBaseScore) then
        have = have and self.enterBaseScore >= toggleData.moreBaseScore
    end
    if(toggleData.lessBaseScore) then
        have = have and self.enterBaseScore < toggleData.lessBaseScore
    end
    if(not toggleData.smallShow) then
        return have
    else
        return ((have and toggleData.smallShowType == 1) or (not have and toggleData.smallShowType == 2))
    end
end

function TableRuleView:is_big_show(keyData)
    local hallID = self.hallID
    if(hallID > 0 and keyData.bigShow == "customEnterSet") then
        return true
    end
    local haveBigShow = false
    for i=1,#self.bigShow do
        if(self.bigShow[i] == keyData.bigShow) then
            haveBigShow = true
        end
        if(haveBigShow and (not keyData.bigShowType or keyData.bigShowType == 1)) then
            return true
        end
    end
    if(not haveBigShow and keyData.bigShowType == 2) then
        return true
    end
    return false
end

function TableRuleView:refresh_textColor(toggle)
    if(toggle.toggle.isOn) then
        toggle.toggleText.color = color1
    else
        toggle.toggleText.color = color2
    end
end

function TableRuleView:handle_pay_toggles(data,wanfaType,rule)
    local ruleTable = ModuleCache.Json.decode(rule)
    TableUtil.hide_childs(self.payInfoObj, "CopyPayItem")
    for i=1,#data do
        local togglesData = data[i]
        local keyData = togglesData.tag
        if(keyData.isPay and self:is_active(keyData)) then
            self.payInfoTitle.text = "支付:"
            for j=1,#togglesData.list do
                local groupData = togglesData.list[j]
                local toggleParentGrid = ModuleCache.ComponentManager.GetComponent(self.payInfoObj, ComponentTypeName.ToggleGroup)
                for k=1,#groupData do
                    local xOffset = xTotalOffset / (keyData.rowNum - 1)
                    local toggleData = groupData[k]
                    local toggleItem = TableUtil.get_or_clone(k, "CopyPayItem", self.payInfoObj, Vector3.New(0, 0, 0), self.poorObjs, self.clones)
                    toggleItem.transform.localPosition = self.payItemBeginPos + Vector3.New(((k - 1) % keyData.rowNum) * xOffset, 0, 0)
                    local toggle = self:set_toggle_data(toggleItem,toggleData,toggleParentGrid,rule)
                    if(toggle.toggle.isOn and toggleData.clickBigShow) then -- 点击影响整个分类显示不显示
                        table.insert(self.bigShow, toggleData.clickBigShow)
                    end
                    if(toggle.toggle.isOn and toggleData.clickSmallShow) then -- 点击只影响一个toggle
                        table.insert(self.smallShow, toggleData.clickSmallShow)
                    end
                end
            end
        end
    end
end

function TableRuleView:set_toggle_data(toggleItem,toggleData,toggleParentGrid,rule)
    local toggle = {}
    toggle.toggleData = toggleData
    local toggle1 = GetComponentWithPath(toggleItem, "Toggle1", ComponentTypeName.Transform).gameObject
    local toggle3 = GetComponentWithPath(toggleItem, "Toggle2", ComponentTypeName.Transform).gameObject
    local newToggle = toggle1
    ComponentUtil.SafeSetActive(toggle1, toggleData.toggleType == 1)
    ComponentUtil.SafeSetActive(toggle3, toggleData.toggleType == 2)
    if(toggleData.toggleType == 1) then
        newToggle = toggle1
    elseif(toggleData.toggleType == 2) then
        newToggle = toggle3
    end
    toggle.toggle = ModuleCache.ComponentManager.GetComponent(newToggle, ComponentTypeName.Toggle)
    if(toggleData.toggleType == 1) then
        toggle.toggle.group = toggleParentGrid
    else
        toggle.toggle.group = nil
    end
    toggle.toggleText = GetComponentWithPath(toggle.toggle.gameObject, "TextSelect", ComponentTypeName.Text)
    toggle.toggleText.text = toggleData.toggleTitle

    ---@type UnityEngine.UI.Dropdown
    toggle.drop = GetComponentWithPath(toggle.toggleText.gameObject, "drop/Dropdown", ComponentTypeName.Dropdown)
    ---@type UnityEngine.RectTransform
    toggle.dropRect = GetComponentWithPath(toggle.toggleText.gameObject, "drop/Dropdown/Template", ComponentTypeName.RectTransform)
    ---@type UnityEngine.UI.Text
    toggle.dropText = GetComponentWithPath(toggle.toggleText.gameObject, "drop/Dropdown/Label", ComponentTypeName.Text)
    local isOn, onIndex = TableUtil.check_toggle_on(toggleData, rule)
    toggle.toggle.isOn = isOn
    self:refresh_textColor(toggle)
    
    if(toggle.drop) then
        toggle.drop.transform.parent.gameObject:SetActive(toggleData.dropDown ~= nil)
        if(toggleData.dropDown) then
            local splitStrs = string.split(toggleData.dropDown, ",")
            local splitTitles = nil
            if(toggleData.dropDownTitles) then
                splitTitles = string.split(toggleData.dropDownTitles, ",")
            end
            toggle.drop.transform.sizeDelta = Vector2(toggleData.dropDownWidth or 106,toggle.drop.transform.sizeDelta.y)
            toggle.dropRect.sizeDelta = Vector2(toggle.dropRect.sizeDelta.x,65*#splitStrs)
            toggle.drop.options:Clear()
            for i = 1, #splitStrs do
                local title = splitStrs[i] .. (toggleData.dropAddStr or "倍")
                if(splitTitles) then
                    title = splitTitles[i]
                end
                local optionData = UnityEngine.UI.Dropdown.OptionData(title)
                toggle.drop.options:Add(optionData)
            end
            toggle.dropText.text = splitStrs[onIndex] .. (toggleData.dropAddStr or "倍")
            if(splitTitles) then
                toggle.dropText.text = splitTitles[onIndex]
            end
            toggle.drop.value = onIndex - 1
        end
        toggle.drop.interactable = false
        if(isOn) then
            toggle.dropText.color = color1
        else
            toggle.dropText.color = color2
        end
    end
    return toggle
end

return TableRuleView