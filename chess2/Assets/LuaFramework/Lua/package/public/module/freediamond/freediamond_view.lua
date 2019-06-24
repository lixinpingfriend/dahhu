
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local FreeDiamondView = Class('freediamondView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local ViewUtil = ModuleCache.ViewUtil;
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

function FreeDiamondView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/freediamond/public_freediamond.prefab", "Public_FreeDiamond", 1);
    self:set_1080p()
    -- 分享按钮
    self.buttonShare = GetComponentWithSimple(self.root, "ButtonShare", ComponentTypeName.Button);
    -- 返回按钮
    self.buttonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button)

    ---- 奖励描述
    --self.labelReward = GetComponentWithSimple(self.root, "LabelReward", ComponentTypeName.Text);

    -- 截屏画布实体
    self.shareCanvasGB = UnityEngine.GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/CanvasShareOnly");


    self.freeDiamondImg = GetComponentWithSimple(self.root, "SpriteReward", ComponentTypeName.Image)
end

-- 更新分享图片视图
function FreeDiamondView:updateShareImage(data, spriteShareImage, spriteShareBg)

    if self.shareImagePrefab == nil then
        -- 实例化分享图片预置
        self.shareImagePrefab = ViewUtil.InitGameObject("public/module/shareimage/shareimage.prefab", "ShareImage", self.shareCanvasGB);
        -- 二维码图片
        self.spriteQRCode = GetComponentWithSimple(self.shareImagePrefab, "SpriteQRCode", ComponentTypeName.Image);
        -- 分享背景图片
        self.spriteShareBg = GetComponentWithSimple(self.shareImagePrefab, "SpriteBg", ComponentTypeName.Image);
        -- 游戏名标签
        self.labelGameName = GetComponentWithSimple(self.shareImagePrefab, "LabelGameName", ComponentTypeName.Text);
        -- 微信号标签
        self.labelWechatNumber = GetComponentWithSimple(self.shareImagePrefab, "LabelWechatNumber", ComponentTypeName.Text);

        self.goIcon = ModuleCache.ComponentManager.Find(self.shareImagePrefab, "SpriteIcon");
        self.goIconGuiLin = ModuleCache.ComponentManager.Find(self.shareImagePrefab, "GuiLin");
    else
        self.shareImagePrefab:SetActive(true);
    end

    self.goIcon:SetActive(not (ModuleCache.AppData.Game_Name == "GLZP"))
    self.goIconGuiLin:SetActive(ModuleCache.AppData.Game_Name == "GLZP")

    self.spriteQRCode.sprite = spriteShareImage;
    if spriteShareBg ~= nil then
        self.spriteShareBg.sprite = spriteShareBg;
    end
    self.labelGameName.text = data.gameName;
    self.labelWechatNumber.text = "联系客服:" .. data.custosmerService;
end

-- 更新奖励视图
function FreeDiamondView:updateRewardView(activityList, code)

    -- 通过code获取活动数据
    local activity = self:getActivityByCode(activityList, code);

    if activity.backGroundUrl and activity.backGroundUrl ~= "" and type(activity.backGroundUrl) == "string" then
        self:image_load_sprite(self.freeDiamondImg, activity.backGroundUrl )
    end

    -- 数量下限
    local downAmount = nil;
    -- 数量上限
    local upAmount = nil;
    for key, award in ipairs(activity.appAwards) do

        -- 钻石
        if award.amountType == 2 then
            -- 数量下限
            downAmount = award.downAmount;
            -- 数量上限
            upAmount = award.upAmount;
        end
    end

    -- 领取次数
    local getRewardCount = activity.userLimit;

    if downAmount ~= nil and upAmount ~= nil and getRewardCount ~= nil then
        --self.labelReward.text = string.format("%d-%d", downAmount, upAmount);
    end
end

-- 通过code获取活动数据
function FreeDiamondView:getActivityByCode(activityList, code)

    local activity = nil;

    for key, activityTemp in ipairs(activityList) do

        if activityTemp.code == code then

            activity = activityTemp;
            return activity;
        end
    end

    return activity;
end

return FreeDiamondView;
