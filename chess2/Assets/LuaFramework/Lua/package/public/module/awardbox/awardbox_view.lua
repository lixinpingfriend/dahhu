
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local AwardBoxView = Class('awardBoxView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple
local MatchingManager = require("package.public.matching_manager")
function AwardBoxView:initialize(...)

    -- 初始View
    View.initialize(self, "public/module/awardbox/public_awardbox.prefab", "Public_AwardBox", 2, nil, 1);
    View.set_1080p(self);
    self.gameModule = ModuleCache.ComponentManager.GetComponent(self.root, "GameModule")
    -- 确定按钮
    self.buttonYes = GetComponentWithSimple(self.root, "ButtonYes", ComponentTypeName.Button);

    -- 标题标签
    self.labelTitle = GetComponentWithSimple(self.root, "LabelTitle", ComponentTypeName.Text);
    -- 确定标签
    self.labelYes = GetComponentWithSimple(self.root, "LabelYes", ComponentTypeName.Text);

    -- 奖励item
    self.itemAward = GetComponentWithSimple(self.root, "item", ComponentTypeName.Transform).gameObject;
    self.itemAward:SetActive(false);

    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");

    -- 特效画布
    self.effectCanvas = GetComponentWithSimple(self.root, "EffectCanvas", ComponentTypeName.Canvas);
    self.effect1 = GetComponentWithSimple(self.root, "tongyong_TX", "UnityEngine.Renderer");
    self.effect2 = GetComponentWithSimple(self.root, "gun", "UnityEngine.Renderer");
    self.effect3 = GetComponentWithSimple(self.root, "guanglizi", "UnityEngine.Renderer");
    self.effect4 = GetComponentWithSimple(self.root, "xingxing", "UnityEngine.Renderer");
    -- 最上层画布
    self.baseCanvas = GetComponentWithSimple(self.root, "BaseCanvas", ComponentTypeName.Canvas);
end

function AwardBoxView:setSortOrder()
    self.effectCanvas.sortingOrder = self.canvas.sortingOrder + 1;
    self.effect1.sortingOrder = self.canvas.sortingOrder + 2;
    self.effect2.sortingOrder = self.canvas.sortingOrder + 2;
    self.effect3.sortingOrder = self.canvas.sortingOrder + 2;
    self.effect4.sortingOrder = self.canvas.sortingOrder + 2;
    self.baseCanvas.sortingOrder = self.canvas.sortingOrder + 10;
end

function AwardBoxView:init(awardList)

    self.awardList = awardList;
    -- 更新奖励视图
    self:updateAwardView();
end

-- 更新奖励视图
function AwardBoxView:updateAwardView()

    -- 重复利用itemAward模板
    local childCount = self.itemAward.transform.parent.childCount;
    for i = 0, childCount - 1 do
        self.itemAward.transform.parent:GetChild(i).gameObject:SetActive(false);
    end

    for key, award in ipairs(self.awardList) do

        -- 重复利用itemRight模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemAward.gameObject, self.itemAward.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemAward.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 道具数量标签
        local labelItemCount = GetComponentWithSimple(itemClone, "LabelItemCount", ComponentTypeName.Text);
        -- 道具名字标签
        local labelItemName = GetComponentWithSimple(itemClone, "LabelItemName", ComponentTypeName.Text);
        -- 道具图标
        local spriteItemIcon = GetComponentWithSimple(itemClone, "SpriteItemIcon", ComponentTypeName.Image);

        if award.amountType then
            --转盘物品格式  （不同的模块传过来的物品格式不一样，要兼容不同格式，好尴尬呀）
            local awardType = tonumber(award.amountType);
            local spriteIconTemp = nil;
            local itemNameTemp = nil;
            local awardCount = 0;
            -- 金币
            if awardType == 9 then

                spriteIconTemp = self.spriteHolder:FindSpriteByName("gold");
                itemNameTemp = "金币";
                awardCount = "×" .. award.amount;
                -- 钻石
            elseif awardType == 2 then
                spriteIconTemp = self.spriteHolder:FindSpriteByName("diamond");
                itemNameTemp = "钻石";
                awardCount = "×" .. award.amount;
                -- 道具
            elseif awardType == 10 then
                local onStartComplete = function(sprite)
                    if sprite then
                        spriteIconTemp = sprite;
                    else
                        spriteIconTemp = self.spriteHolder:FindSpriteByName("item");
                    end
                end
                self:image_load_sprite(nil, award.itemIcon, onStartComplete);
                itemNameTemp = award.itemName;
                awardCount = "×" .. award.itemNum;
            end
            -- 道具图标
            spriteItemIcon.sprite = spriteIconTemp;
            spriteItemIcon:SetNativeSize();
            -- 道具名称
            labelItemName.text = itemNameTemp;
            -- 道具数量
            labelItemCount.text = awardCount;
        else
            --邮件物品格式
            MatchingManager:goodsNameAndIcon2(award.type, spriteItemIcon, labelItemCount, labelItemName, award.num, award.itemName, award.itemIcon, award.other, award.otherImg, self.spriteHolder)

        end
    end
end

-- 更新标题文字
function AwardBoxView:updateTiltle(titleName)

    self.labelTitle.text = titleName;
end

-- 更新确定文字
function AwardBoxView:updateYes(yesName)

    self.labelYes.text = yesName;
end

-- 克隆
function AwardBoxView:clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos);
    target.name = obj.name;
    ComponentUtil.SafeSetActive(target, true);
    return target;
end


return AwardBoxView;
