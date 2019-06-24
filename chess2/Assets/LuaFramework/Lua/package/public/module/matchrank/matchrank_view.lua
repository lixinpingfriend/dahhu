
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MatchRankView = Class('MatchRankView', View)

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local Vector3 = Vector3
local MatchingManager = require("package.public.matching_manager")
function MatchRankView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/matchrank/public_windowmatchrank.prefab", "Public_WindowMatchRank", 1)

    View.set_1080p(self)
    self.rewardItemList = {}
    self.item = GetComponentWithPath(self.root, "Center/ScrollView/Viewport/Content/item", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(self.item, false)
    self.rankSpriteHolder = GetComponentWithPath(self.root, "Center", "SpriteHolder");
    self.goodsSpriteHolder = GetComponentWithPath(self.root, "Background", "SpriteHolder");
    self.titleText =  GetComponentWithPath(self.root, "Background/Title/Text", ComponentTypeName.Text);
end

function MatchRankView:initRank(info)
    self.titleText.text = info.matchName
    for i = 1, #info.awards do
        local awards = info.awards[i]
        local item
        if not self.rewardItemList[awards.rank] then

            item = self:clone(awards.awardId, self.item, self.item.transform.parent)
            self.rewardItemList[awards.rank] = item
        else
            item = self.rewardItemList[awards.rank]
        end
        local rankText = GetComponentWithPath(item, "Rank", ComponentTypeName.Text)
        local rankImg = GetComponentWithPath(item, "Icon", ComponentTypeName.Image)
        local feeText = GetComponentWithPath(item, "Fee/Num", ComponentTypeName.Text)
        local iconImg = GetComponentWithPath(item, "Fee/Icon", ComponentTypeName.Image)
        if awards.rank <4 then
            rankImg.sprite = self.rankSpriteHolder:FindSpriteByName(awards.rank.."");
            ComponentUtil.SafeSetActive(rankImg.transform.gameObject, true )
            ComponentUtil.SafeSetActive(rankText.transform.gameObject, false )
        else
            ComponentUtil.SafeSetActive(rankImg.transform.gameObject, false )
            ComponentUtil.SafeSetActive(rankText.transform.gameObject, true )
        end

        rankText.text = "第" .. awards.rank .. "名"
        MatchingManager:goodsNameAndIcon(awards.awardType, iconImg, feeText, awards.awardNum, awards.itemName,
        awards.itemIcon, awards.awardOther, awards.awardOtherImg ,self.goodsSpriteHolder)
        ComponentUtil.SafeSetActive(item, true )
    end
end

function MatchRankView:clone(name, obj, parent)
    local target = ComponentUtil.InstantiateLocal(obj, Vector3.zero)
    if not parent then
        parent = obj.transform.parent
    end
    target.transform:SetParent(parent.transform)
    target.transform.localScale = Vector3.one
    target.name = tostring(name)
    ComponentUtil.SafeSetActive(target, true)
    return target
end




return MatchRankView