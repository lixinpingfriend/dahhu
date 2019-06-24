
local class = require("lib.middleclass");
local View = require('core.mvvm.view_base');
-- ==========================================================================

local ComponentUtil = ModuleCache.ComponentUtil
local BranchPackageName = AppData.BranchRunfastName;
local ModuleCache = ModuleCache;
local ComponentTypeName = ModuleCache.ComponentTypeName;
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local cjson = require("cjson");

local RecordPokerShopView = class('RecordPokerShopView', View);

function RecordPokerShopView:initialize()
    View.initialize(self, BranchPackageName .. "/module/recordpokershop/runfast_recordpokershop.prefab", "RunFast_RecordPokerShop", 1)

    self.BtnClose = GetComponentWithPath(self.root, "BaseBackground/BtnClose", ComponentTypeName.Button)
    self.ContentRoot = GetComponentWithPath(self.root,"Center/ListScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.ItemPrefab = GetComponentWithPath(self.root,"Holder/ItemPrefab", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(self.ItemPrefab, false)
end


function RecordPokerShopView:init_view(itemDataList)
    print_table(itemDataList)
    if(itemDataList and #itemDataList > 0) then
        for i=1,#itemDataList do
            local itemData = itemDataList[i]
            local item = ModuleCache.ComponentUtil.InstantiateLocal(self.ItemPrefab, self.ContentRoot)
            ModuleCache.ComponentUtil.SafeSetActive(item.gameObject, true)
            self:FillItem(item,itemData)
        end
    else
        print("error====没有记牌物品购买数据")
    end
end

function RecordPokerShopView:FillItem(item,itemData)
    item.name = itemData.itemId
    local UseDate = GetComponentWithPath(item, "Bg/UseDate", ComponentTypeName.Text)
    local instructions = GetComponentWithPath(item, "Bg/instructions", ComponentTypeName.Text)
    local CostCount = GetComponentWithPath(item, "Bg/BtnBuy/CostCount", ComponentTypeName.Text)
    local CurrencyTypeSwitcher = GetComponentWithPath(item, "Bg/BtnBuy/CurrencyType", "UIStateSwitcher")
    UseDate.text = itemData.itemName
    instructions.text = itemData.itemDesc
    CostCount.text = itemData.coins
    CurrencyTypeSwitcher:SwitchState(tostring(itemData.coinsType))
end

return RecordPokerShopView