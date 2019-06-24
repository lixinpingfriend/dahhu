
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MatchAwardsView = Class('matchAwardsView', View)

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local Vector3 = Vector3
local MatchingManager = require("package.public.matching_manager")
function MatchAwardsView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/matchawards/public_windowmatchawards.prefab", "Public_WindowMatchAwards", 1,nil,1)

    View.set_1080p(self)
    self.gameModule = ModuleCache.ComponentManager.GetComponent(self.root,"GameModule")
    self.uiState = GetComponentWithPath(self.root, "Root", "UIStateSwitcher")
    self.failTrans = GetComponentWithPath(self.root, "Root/Fail", ComponentTypeName.Transform)
    self.spriteHolder = GetComponentWithPath(self.root, "Root/Success/Canvas", "SpriteHolder")

    self.rankImg = GetComponentWithPath(self.root, "Root/Success/Canvas/Rank", ComponentTypeName.Image)

    self.goodsItem = GetComponentWithPath(self.root, "Root/Success/Canvas/Award/Content/Goods", ComponentTypeName.Transform).gameObject
    self.buttonObj = GetComponentWithPath(self.root, "Root/Success/Canvas/Button", ComponentTypeName.Transform).gameObject
    self.centerCavans = GetComponentWithPath(self.root, "Root/Success/Canvas", "UnityEngine.Canvas")
    self.centerCavans.sortingOrder = self.canvas.sortingOrder + 12
    ComponentUtil.SafeSetActive(self.goodsItem, false)
end

-- 更新比赛结果弹窗视图
function MatchAwardsView:updateResultTipsView(data)
    self.gameModule:SetLayers()
    self.uiState:SwitchState("success")
    self.rankImg.sprite = self.spriteHolder:FindSpriteByName("rank" .. data.rank)

    for i = 1, #data.award do
        local awards = data.award[i]
        local obj = self:clone(i .. "", self.goodsItem)
        local icon = GetComponentWithPath(obj, "Icon", ComponentTypeName.Image)
        local textNum = GetComponentWithPath(obj, "Num", ComponentTypeName.Text)
        local textName = GetComponentWithPath(obj, "Name", ComponentTypeName.Text)
        MatchingManager:goodsNameAndIcon2(awards.awardType, icon, textNum, textName, awards.awardNum, awards.itemName, awards.itemIcon, awards.awardOther, awards.awardOtherImg, self.spriteHolder)

    end
end

function MatchAwardsView:MatchFailClose(func)
    self:do_scale(self.failTrans,nil,nil,func)
    self:do_fade(self.mengbanImg)
end

function MatchAwardsView:MatchFail(data)
    self.uiState:SwitchState("fail")
    --self:do_scale(self.failTrans, nil, 1.6)
    --self:do_fade(self.mengbanImg, nil, 0.6)
    local rankText = GetComponentWithPath(self.root, "Root/Fail/Info/Num1", ComponentTypeName.Text)
    local slider = GetComponentWithPath(self.root, "Root/Fail/Progress/Slider", ComponentTypeName.Slider)
    local uistate = GetComponentWithPath(self.root, "Root/Fail/Progress/Node", "UIStateSwitcher")
    rankText.text = data.rank
    if data.circle > 1 then
        if data.rank <= 3 then
            slider.value = 1
            uistate:SwitchState("3")
        else
            slider.value = 0.5
            uistate:SwitchState("2")
        end
    else
        slider.value = 0
        uistate:SwitchState("1")
    end
    local nodeText = {}
    for i = 1, 3 do
        nodeText[i] = GetComponentWithPath(self.root, "Root/Fail/Progress/Node/" .. i .. "/Text", ComponentTypeName.Text)
        if data.circle > 1 then
            nodeText[i].text = "第" .. data.circle + i - 2 .. "轮"
        else

            nodeText[i].text = "第" .. data.circle + i - 1 .. "轮"
        end

    end
    local index = 1
    if data.circle > 1 then
        if data.rank <= 3 then
            index = 3
        else
            index = 2
        end
    end
    local rObj = GetComponentWithPath(self.root, "Root/Fail/Progress/Node/" .. index .. "/Rank", ComponentTypeName.Transform).gameObject
    local rText = GetComponentWithPath(self.root, "Root/Fail/Progress/Node/" .. index .. "/Rank/Text", ComponentTypeName.Text)
    rObj:SetActive(true)
    rText.text = data.rank .. "名"
end

function MatchAwardsView:clone(name, obj, parent)
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

function MatchAwardsView:hideBtn(hide)
    self.buttonObj:SetActive(hide)
end

return MatchAwardsView