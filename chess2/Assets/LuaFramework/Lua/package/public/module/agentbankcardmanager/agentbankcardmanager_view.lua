
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local AgentBankCardmManagerView = Class('agentBankCardmManagerView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local cityData = require('package.public.module.agentbankcardmanager.city')

function AgentBankCardmManagerView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/agentbankcardmanager/public_agentbankcardmanager.prefab", "Public_AgentBankCardManager", 1)
    View.set_1080p(self)
    self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root,"UIStateSwitcher")

    self.getIdCodeObj = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (6)/InputField/getIDCodeBtn/Text",ComponentTypeName.Transform).gameObject
    self.getIdCode_cdTex = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (6)/InputField/getIDCodeBtn/countDownTex",ComponentTypeName.Text)

    self.province_dropdown = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (2)/Dropdown",ComponentTypeName.Dropdown)
    self.city_dropdown = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (2)/Dropdown (1)",ComponentTypeName.Dropdown)
    self.bankSubbranchInput = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (3)/InputField",ComponentTypeName.InputField)
    self.bankAccountNameInput = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (4)/InputField",ComponentTypeName.InputField)
    self.bankCardNoInput = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (5)/InputField",ComponentTypeName.InputField)
    self.smsCodeInput = GetComponentWithPath(self.root,"Center/AddCardPancel/Text (6)/InputField",ComponentTypeName.InputField)

    self.copyItem = GetComponentWithPath(self.root, "Center/CardOptionPancel/ItemPrefabHolder/CopyItem", ComponentTypeName.Transform).gameObject
    self.copyParent = GetComponentWithPath(self.root, "Center/CardOptionPancel/ListScrollView/Viewport/Content", ComponentTypeName.RectTransform)

    self:initProvinceData()

end

function AgentBankCardmManagerView:initProvinceData()

    self.province_dropdown.options:Clear()
    self.provinceList = {}
    for i = 1, #cityData.root.province do
        self.provinceList[i] = cityData.root.province[i]
        local optionData = UnityEngine.UI.Dropdown.OptionData(cityData.root.province[i].name)
        self.province_dropdown.options:Add(optionData)
    end

    self.province_dropdown.value = 0
    self.province_dropdown:RefreshShownValue()
    self:updateCityData(0)
    self.city_dropdown.value = 0
    self.city_dropdown:RefreshShownValue()
end

function AgentBankCardmManagerView:updateCityData(idx)
    idx = idx +1
    self.city_dropdown.options:Clear()
    self.cityList = self.provinceList[idx].city
    for i = 1, #self.cityList do
        local optionData = UnityEngine.UI.Dropdown.OptionData(self.cityList[i])
        self.city_dropdown.options:Add(optionData)
    end
end

function AgentBankCardmManagerView:showCard(cardData)
    return string.format("%s (%s %s)",  cardData.bankAccountName ,cardData.bankName, string.sub(cardData.bankCardNo, #cardData.bankCardNo -4,#cardData.bankCardNo)      )
    --local name = string.rep("*",#cardData.bankAccountName / 3 -1).. string.sub(cardData.bankAccountName, #cardData.bankAccountName-2,#cardData.bankAccountName)
    --return string.format("%s (%s %s)",  name ,cardData.bankName, string.sub(cardData.bankCardNo, #cardData.bankCardNo -4,#cardData.bankCardNo)      )
end





--初始化亲友圈列表
function AgentBankCardmManagerView:initLoopScrollViewList(dataList, data)
    self.data = data
    self.dataList = dataList

    if not self.dataList then
        return
    end

    --self.notDataObj:SetActive(#dataList == 0)
    self:reset()

    if(#self.dataList > 0) then
        for i=1,#self.dataList do
            self:fillItem(self:get_item(self.dataList[i], i))
        end
    end
end

function AgentBankCardmManagerView:fillItem(item)
    local data = item.data

    local cardInfoTex = GetComponentWithPath(item.gameObject, "Text (5)", ComponentTypeName.Text)
    local cardInfoTex1 = GetComponentWithPath(item.gameObject, "Text (3)", ComponentTypeName.Text)
    ModuleCache.ComponentManager.GetComponent(item.gameObject,"UIStateSwitcher"):SwitchState(self.data.type)

    if(data) then
        cardInfoTex.text = self:showCard(data)
        cardInfoTex1.text =  cardInfoTex.text
    end
end

function AgentBankCardmManagerView:get_item(data, i)
    local obj = nil
    local item = {}
    if i<=#self.contents then
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

function AgentBankCardmManagerView:reset()
    self.contents = TableUtil.get_all_child(self.copyParent.gameObject)
    for i=1,#self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end

return AgentBankCardmManagerView