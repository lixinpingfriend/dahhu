
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MatchRecordView = Class('matchRecordView', View)

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local Vector3 = Vector3
local MatchingManager = require("package.public.matching_manager")
function MatchRecordView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/matchrecord/public_windowmatchrecord.prefab", "Public_WindowMatchRecord", 1,nil,1)

    View.set_1080p(self)

    self.item = GetComponentWithPath(self.root, "Center/ScrollView/Viewport/Content/item", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(self.item, false)
    self.goodsSpriteHolder = ModuleCache.ComponentManager.GetComponent(self.root, "SpriteHolder");
    self.rankSpriteHolder = GetComponentWithPath(self.root, "Center", "SpriteHolder");
    self.cloneObj = {}
end

function MatchRecordView:record_list(data)
    for i = 1, #data do
        local info = data[i]
        local target
        if self.cloneObj[i] then
            target = self.cloneObj[i]
        else
            target = self:clone(i .. "", self.item)
            table.insert(self.cloneObj, target)
        end
        target:SetActive(true)
        local nameText = GetComponentWithPath(target, "Name", ComponentTypeName.Text)
        local timeText = GetComponentWithPath(target, "Time", ComponentTypeName.Text)
        local rankIcon = GetComponentWithPath(target, "Rank/Top3/RankIcon", ComponentTypeName.Image)
        local labelRank = GetComponentWithPath(target, "Rank/Other/LabelRank", ComponentTypeName.Text)
        local reward = GetComponentWithPath(target, "Reward/Fee", ComponentTypeName.Transform).gameObject
        local goodsImg = GetComponentWithPath(target, "Reward/Fee/Icon", ComponentTypeName.Image)
        local goodsText = GetComponentWithPath(target, "Reward/Fee/Text", ComponentTypeName.Text)
        local none = GetComponentWithPath(target, "Reward/None", ComponentTypeName.Transform).gameObject
        local rankState = GetComponentWithPath(target, "Rank", "UIStateSwitcher")
        nameText.text = info.matchName
        if info.receiveTime and type(info.receiveTime) == "string" then
            timeText.text = "获奖日期 " .. info.receiveTime
        elseif info.createTime and type(info.createTime) == "string" then
            timeText.text = "获奖日期 " .. info.createTime
        end

        if info.rank < 4 then
            rankIcon.sprite = self.rankSpriteHolder:FindSpriteByName(info.rank)
            rankState:SwitchState("top3")
        else
            labelRank.text = info.rank .. ""
            rankState:SwitchState("other")
        end

        if info.resultAwards and type(info.resultAwards) == "table" then
            ComponentUtil.SafeSetActive(reward, true)
            ComponentUtil.SafeSetActive(none, false)
            MatchingManager:goodsNameAndIcon(info.resultAwards[1].awardType, goodsImg, goodsText, info.resultAwards[1].awardNum,
                    info.resultAwards[1].awardItemName, info.resultAwards[1].awardItemIcon, info.resultAwards[1].awardOther, info.resultAwards[1].awardOtherImg, self.goodsSpriteHolder)
        else
            ComponentUtil.SafeSetActive(reward, false)
            ComponentUtil.SafeSetActive(none, true)
        end

        ComponentUtil.SafeSetActive(target, true)
    end
end
function MatchRecordView:clone(name, obj, parent)
    local target = ComponentUtil.InstantiateLocal(obj, Vector3.zero)
    if not parent then
        parent = obj.transform.parent
    end
    target.transform:SetParent(parent.transform)
    target.transform.localScale = Vector3.one
    target.transform.localPosition = Vector3.one
    target.name = tostring(name)
    ComponentUtil.SafeSetActive(target, true)
    return target
end
return MatchRecordView