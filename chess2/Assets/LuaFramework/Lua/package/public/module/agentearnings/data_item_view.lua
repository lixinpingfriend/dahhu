local class = require("lib.middleclass")
local ItemBaseView = require ("package.public.module.gridex.item_view")
local MVVMBase = require('core.mvvm.mvvm_base')
local ItemDataView = class("ItemDataView",ItemBaseView)

local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath


function ItemDataView:initialize(go, initData)
    ItemBaseView.initialize(self, go, initData);
    self.time= GetComponentWithPath(self.gameObject,"Time",ComponentTypeName.Text)
    self.stoneCount = GetComponentWithPath(self.gameObject,"StoneCount",ComponentTypeName.Text)
    self.payCount = GetComponentWithPath(self.gameObject,"PayCount",ComponentTypeName.Text)
    if self.initData.type ~= 3 then
        self.getCount = GetComponentWithPath(self.gameObject,"GetCount",ComponentTypeName.Text)
        self.biliCount = GetComponentWithPath(self.gameObject,"Bili/Count",ComponentTypeName.Text)
        self.biliLv1 = GetComponentWithPath(self.gameObject,"Bili/LV1",ComponentTypeName.Transform).gameObject
        self.biliLv2 = GetComponentWithPath(self.gameObject,"Bili/LV2",ComponentTypeName.Transform).gameObject
        self.daili = GetComponentWithPath(self.gameObject,"PayUser/Diali",ComponentTypeName.Transform).gameObject
        self.idNum = GetComponentWithPath(self.gameObject,"PayUser/Diali/ID",ComponentTypeName.Text)
        self.headObj = GetComponentWithPath(self.gameObject,"PayUser/HeadInfo",ComponentTypeName.Transform).gameObject
        self.headIcon = GetComponentWithPath(self.headObj,"Avatar/Image",ComponentTypeName.Image)
        self.playerName = GetComponentWithPath(self.headObj,"TextName",ComponentTypeName.Text)
        self.playerId = GetComponentWithPath(self.headObj,"TextID",ComponentTypeName.Text)
    end
end

--重写父类
function ItemDataView:update_data()
    if self.initData.type == 3 then
        self.time.text = self.m_Data.dateTime
        self.payCount.text = self.m_Data.money
        self.stoneCount.text = self.m_Data.desc
        return
    end
    self.time.text = self.m_Data.createTime
    self.biliCount.text = self.m_Data.ratio
    self.stoneCount.text = self.initData.type == 1 and self.m_Data.orderCoins or self.m_Data.roomNum
    self.payCount.text = self.initData.type == 1 and self.m_Data.originalAmount or self.m_Data.consumeHp
    self.getCount.text =  self.m_Data.amount
    self.biliLv1:SetActive(self.m_Data.caste == 1)
    self.biliLv2:SetActive(self.m_Data.caste == 2)
    if self.initData.type == 2 or self.m_Data.sourceTargetType == 2  then
        self.playerId.text = self.m_Data.sourceTargetId
        MVVMBase:image_load_sprite(nil, self.m_Data.sourceHeadimg, function (headIcon)
            self.headIcon.sprite = headIcon
        end);
        self.playerName.text = ModuleCache.GameUtil.filterPlayerName(self.m_Data.sourceTagetName, 10)
        self.headObj:SetActive(true)
        self.daili:SetActive(false)
    else
        self.headObj:SetActive(false)
        self.daili:SetActive(true)
        self.idNum.text = self.m_Data.sourceTargetId
    end
end

return ItemDataView;