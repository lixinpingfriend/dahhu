
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumCostPowerView = Class('museumCostPowerView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local costNum = 0

function MuseumCostPowerView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumcostpower/public_museumcostpower.prefab", "Public_MuseumCostPower", 1)
    View.set_1080p(self)
    self.scrollView = GetComponentWithPath(self.root, "Center/Scroll View", ComponentTypeName.ScrollRect)
    self.copyItem = GetComponentWithPath(self.root, "Center/CopyItem", ComponentTypeName.Transform).gameObject
    self.copyParent = GetComponentWithPath(self.root, "Center/Scroll View/Viewport/Content", ComponentTypeName.Transform).gameObject
    --self.imageTitle = GetComponentWithPath(self.root, "Center/Image/Image", ComponentTypeName.Image)
    --self.titleHolder = GetComponentWithPath(self.root, "Center/Image/Image", "SpriteHolder")
    self.titleText = GetComponentWithPath(self.root, "Center/Image/Text", ComponentTypeName.Text)
    self.payTypeTitle = {"亲友圈", "大赢家", "房费均摊"}

    self.items = TableUtil.get_all_child(self.copyParent)
end

function MuseumCostPowerView:get_round_data(data)
    for i=1,#self.modelData.AppGlobalConfig.consumeConfigs do
        local config = self.modelData.AppGlobalConfig.consumeConfigs[i]
        if(config.round == data.roundCount) then
            return config
        end
    end
    return nil
end

function MuseumCostPowerView:initLoopScrollViewList(data)
    costNum = 0
    self.showVals = {}
    print_table(data,"~~~~~~initLoopScrollViewList~~~~~~~~")
    local config = self:get_round_data(data)
    if not config then
        ModuleCache.ModuleManager.hide_module("public", "createroom")
        ModuleCache.ModuleManager.hide_module("public", "rulesetting")
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("当前选择的玩法未找到亲友圈配置，请联系客服！", function()
            self:dispatch_module_event("rulesetting", "not_get_parlor_cost")
        end, nil)
        return;
    end
    local datas = string.split(config.coinNums, ",")
    costNum = #datas

    --parlorChargingType 1以房间为基准 2以人数为基准
    if self.modelData.AppGlobalConfig.parlorChargingType == 1 then
        if(data.payType == 1 or data.payType == 2) then
             for i=1,#datas do
                self.showVals[i] = tonumber(datas[i])
            end
        else
            for i=1,#datas do
                self.showVals[i] = math.ceil(tonumber(datas[i])/data.playerCount)
            end
        end
    elseif self.modelData.AppGlobalConfig.parlorChargingType == 2 then
        if(data.payType == 3) then
             for i=1,#datas do
                self.showVals[i] = tonumber(datas[i])

                 if not AppData.isPokerGame() and data.playerCount == 2 then

                     --self.modelData.AppGlobalConfig.twoPersonEqThree  1： 2人==3人      2： 2人 ~= 3人
                     if not self.modelData.AppGlobalConfig.twoPersonEqThree or tonumber(self.modelData.AppGlobalConfig.twoPersonEqThree) == 1 then
                         self.showVals[i] = math.ceil(tonumber(datas[i]) *3 / 2)
                     else
                         self.showVals[i] = tonumber(datas[i])
                     end
                 end
            end
        else
            for i=1,#datas do
                self.showVals[i] = tonumber(datas[i])*data.playerCount

                if not AppData.isPokerGame() and data.playerCount == 2 then
                    --self.modelData.AppGlobalConfig.twoPersonEqThree  1： 2人==3人      2： 2人 ~= 3人
                    if not self.modelData.AppGlobalConfig.twoPersonEqThree or tonumber(self.modelData.AppGlobalConfig.twoPersonEqThree) == 1 then
                        self.showVals[i] = tonumber(datas[i])*3
                    else
                        self.showVals[i] = tonumber(datas[i])*2
                    end
                end
            end
        end

    end

    self.posVals = {}
    for i=1,costNum do
        self.posVals[i] = 1 - (i - 1)/(costNum - 1)
    end
    local jumpIndex = 1
    --self.imageTitle.sprite = self.titleHolder:FindSpriteByName(data.payType .. "")
    --self.imageTitle:SetNativeSize()
    self.titleText.text = self.payTypeTitle[tonumber(data.payType)]


    self:reset()
    self.items = {}
    for i=1,2 do
        self:fillItem(self:get_item(nil, i), true)
    end
    for i=3,costNum + 2 do
        local index = i - 2
        local item = nil
        item = self:get_item(self.showVals[index], i)
        if(data.payNum == self.showVals[index]) then
            jumpIndex = index
        end
        self:fillItem(item, false)
        table.insert(self.items, item)
    end
    for i=costNum + 3,costNum + 4 do
        self:fillItem(self:get_item(nil, i), true)
    end
    local selectIndex = jumpIndex
    self.scrollView.verticalNormalizedPosition = self.posVals[selectIndex]
    self.selectPower = self:get_power(selectIndex, data)
    self:select_item(jumpIndex)
end

function MuseumCostPowerView:get_item(data, i)
    local obj = nil
    local item = {}
    if(i<=#self.contents) then
        obj = self.contents[i]
    else
        obj = TableUtil.clone(self.copyItem,self.copyParent,Vector3.zero)
    end
    obj.name = "item_" .. i 
    ComponentUtil.SafeSetActive(obj, true)  
    item.gameObject = obj
    item.data = data
    return item
end

function MuseumCostPowerView:reset()
    self.contents = TableUtil.get_all_child(self.copyParent)
    for i=1,#self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end

function MuseumCostPowerView:fillItem(item, isEmpty)
    local data = item.data
    local objFull = GetComponentWithPath(item.gameObject, "Full", ComponentTypeName.Transform).gameObject
    local objEmpty = GetComponentWithPath(item.gameObject, "Empty", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(objFull, not isEmpty)
    ComponentUtil.SafeSetActive(objEmpty, isEmpty)
    if(data) then
        item.powerText = GetComponentWithPath(objFull, "Text", ComponentTypeName.Text)
        item.powerText.text = data .. ""
        item.selectLight = GetComponentWithPath(item.gameObject, "Full/Image", ComponentTypeName.Transform).gameObject
        item.imageBg_notSelect = GetComponentWithPath(objFull, "Empty (1)", ComponentTypeName.Transform).gameObject
    end
end

function MuseumCostPowerView:get_power(index, data)
    return self.items[index].data
end

function MuseumCostPowerView:select_item(index)
    for i = 1, #self.items do
        local item = self.items[i]
        if(i == index) then
            item.selectLight:SetActive(true)
            item.imageBg_notSelect:SetActive(false)
        else
            item.selectLight:SetActive(false)
            item.imageBg_notSelect:SetActive(true)
        end
    end
end

return MuseumCostPowerView