
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local ActivityView = Class('activityView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

---@type JumpManager
local JumpManager = require('package.public.jump_manager')

function ActivityView:initialize(...)

end

function ActivityView:on_dynamic_init()
    -- 初始View
    View.initialize(self, "public/module/activity/public_activity.prefab", "Public_Activity", 1);
    View.set_1080p(self);

    self.activityLeftPreviousViewList = { };
    self.activityRightPreviousViewList = { };
    self.activityFriendRightPreviousViewList = { };
    self.activityLeftPrevious = { };

    self.buttonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button);

    -- 活动左侧item
    self.itemLeft = GetComponentWithSimple(self.root, "itemLeft", ComponentTypeName.Transform).gameObject;
    -- 活动右侧item
    self.itemRight = GetComponentWithSimple(self.root, "itemRight", ComponentTypeName.Transform).gameObject;
    -- 好友分享活动右侧item
    self.itemFriendShareRight = GetComponentWithSimple(self.root, "itemFriendShareRight", ComponentTypeName.Transform).gameObject;

    -- 微信号标签
    self.labelWechatNumber = GetComponentWithSimple(self.root, "LabelWechatNumber", ComponentTypeName.Text);

    self.switcher = GetComponentWithSimple(self.root, "Right", "UIStateSwitcher");
    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");
end

function ActivityView:init(activityLeftViewList, module)

    self.activityLeftViewList = activityLeftViewList;
    self.model = module.model;
    self.module = module
    -- 当前活动id
    self.currentShowID = nil;
    -- 当前选中的红点图片
    self.currentSpriteRed = nil;
    self.isFirstOpen = true
    -- 更新活动左侧视图
    self:updateActivityLeftView();
end

-- 更新活动左侧视图
function ActivityView:updateActivityLeftView()
    
    -- 重复利用itemRight模板
    local childCount = self.itemLeft.transform.parent.childCount;
    for i = 0, childCount - 1 do

        self.itemLeft.transform.parent:GetChild(i).gameObject:SetActive(false);
    end

    -- 去掉上一次的监听
    for key, activity in ipairs(self.activityLeftPreviousViewList) do

        local itemClone = self.itemLeft.transform.parent:GetChild(key).gameObject;
        local toggleTitle = GetComponentWithSimple(itemClone, "ToggleTitle", ComponentTypeName.Toggle);
        toggleTitle.onValueChanged:RemoveListener(activity.onToggleLeft);
        toggleTitle.isOn = false;
    end
    self.activityLeftPreviousViewList = self.activityLeftViewList;

    for key, activity in ipairs(self.activityLeftViewList) do

        -- 重复利用itemRight模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemLeft.gameObject, self.itemLeft.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemLeft.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 活动名称标签
        local labelActivityName = GetComponentWithSimple(itemClone, "LabelActivityName", ComponentTypeName.Text);
        local labelActivityNameHightlight = GetComponentWithSimple(itemClone, "LabelLabelActivityNameHightlight", ComponentTypeName.Text);

        -- 红点图片
        local spriteRed = GetComponentWithSimple(itemClone, "SpriteRed", ComponentTypeName.Image);

        local toggleTitle = GetComponentWithSimple(itemClone, "ToggleTitle", ComponentTypeName.Toggle);

        if activity.onToggleLeft == nil then

            local onToggleLeft = function(flag)
                -- 点击左侧toggle回调
                self:onToggleLeft(spriteRed, activity, flag);
            end
            -- 动态添加回调
            activity.onToggleLeft = onToggleLeft;
            toggleTitle.onValueChanged:AddListener(onToggleLeft);
        end

        local toggleOn = false;
        -- 默认置顶
        if key == 1 then
            toggleOn = true;
        end
        toggleTitle.isOn = toggleOn;

        -- 活动标题
        labelActivityName.text = activity.showTitle;
        labelActivityNameHightlight.text = activity.showTitle;

        local isShowRed = false;
        -- 显示红点
        if tonumber(activity.redPoint) == 1 then
            isShowRed = true;
        end
        spriteRed.gameObject:SetActive(isShowRed);
    end
end

-- 更新活动右侧视图
function ActivityView:updateActivityRightView(activityObject)

    local showType = tonumber(activityObject.leftActivity.showType);
    self.activityLeft = activityObject.leftActivity;
    -- 活动
    if showType == 1 then
        -- 是否为好友分享活动
        local isFriendShareActivity, activityFriendShareList, activityID, friendShareTitle = self:isFriendShareActivity(activityObject.rightActivity);
        -- 好友分享活动
        if isFriendShareActivity then
            self.activityFriendRightViewList = activityFriendShareList;
            self.switcher:SwitchState("activityFriendShare");
            print(222222, "===", activityID);
            print_table(activityObject.rightActivity);
            -- 更新右侧好友分享活动视图
            self:updateRightFriendShareActivityView(activityID, friendShareTitle);
            -- 普通活动
        else
            self.activityRightViewList = activityObject.rightActivity;
            self.switcher:SwitchState("activity");
            -- 更新右侧活动类型视图
            self:updateActivityTypeView();
        end

        -- 公告
    elseif showType == 2 then

        self.switcher:SwitchState("notice");
        -- 更新右侧公告类型视图
        self:updateNoticeTypeView();
        -- 广告图
    elseif showType == 3 then

        self.switcher:SwitchState("ad");
        -- 更新右侧广告类型视图
        self:updateAdTypeView();
    end
end

-- 更新右侧活动类型视图
function ActivityView:updateActivityTypeView()
    print_table(self.activityRightViewList);

    -- 重复利用itemRight模板
    local childCount = self.itemRight.transform.parent.childCount;
    for i = 0, childCount - 1 do
        self.itemRight.transform.parent:GetChild(i).gameObject:SetActive(false);
    end

    -- 去掉上一次的监听
    for key, activity in ipairs(self.activityRightPreviousViewList) do

        local itemClone = self.itemRight.transform.parent:GetChild(key).gameObject;
        local buttonGetAward = GetComponentWithSimple(itemClone, "ButtonGetAward", ComponentTypeName.Button);
        buttonGetAward.onClick:RemoveListener(activity.onGetAward);
    end
    self.activityRightPreviousViewList = self.activityRightViewList;

    for key, activity in ipairs(self.activityRightViewList) do

        -- 重复利用itemRight模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemRight.gameObject, self.itemRight.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemRight.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 活动名称标签
        local labelActivityName = GetComponentWithSimple(itemClone, "LabelTitle", ComponentTypeName.Text);
        -- 活动描述标签
        local labelDetail = GetComponentWithSimple(itemClone, "LabelDetail", ComponentTypeName.Text);
        -- 活动进度标签
        local labelProgress = GetComponentWithSimple(itemClone, "LabelProgress", ComponentTypeName.Text);
        -- 活动icon图片
        local spriteIcon = GetComponentWithSimple(itemClone, "SpriteIcon", ComponentTypeName.Image);
        -- 领取图标
        local spriteGetAward = GetComponentWithSimple(itemClone, "SpriteGetAward", ComponentTypeName.Image);
        -- 活动进度条
        local sliderActivity = GetComponentWithSimple(itemClone, "ActivitySlider", ComponentTypeName.Slider);
        -- 领取奖励按钮
        local buttonGetAward = GetComponentWithSimple(itemClone, "ButtonGetAward", ComponentTypeName.Button);
        -- 奖励文字标签
        local labelGetAward = GetComponentWithSimple(itemClone, "LabelGetAward (1)", ComponentTypeName.Text);

        local noGetAward = GetComponentWithSimple(itemClone, "NoAward", ComponentTypeName.Transform);
        if activity.onGetAward == nil then

            local onGetAward = function()
                -- 点击领取按钮
                self:onGetAward(self.activityLeft, activity);
            end
            activity.onGetAward = onGetAward;
            buttonGetAward.onClick:AddListener(onGetAward);
        end

        -- 活动标题
        labelActivityName.text = activity.name;
        -- 活动描述
        labelDetail.text = activity.remark;

        local spriteIconTemp = nil;
        if #activity.appAwards ~= 0 then
            -- 奖励类型
            local awardType = tonumber(activity.appAwards[1].amountType);
            -- 金币
            if awardType == 9 then

                spriteIconTemp = self.spriteHolder:FindSpriteByName("Money");
                -- 钻石
            elseif awardType == 2 then

                spriteIconTemp = self.spriteHolder:FindSpriteByName("Diamond");
                -- 体力
            elseif awardType == 3 then

                spriteIconTemp = self.spriteHolder:FindSpriteByName("Power");
                -- 红包
            elseif awardType == 4 then


                -- cdkey
            elseif awardType == 5 then

                -- 道具
            elseif awardType == 10 then
                spriteIconTemp = self.spriteHolder:FindSpriteByName("Item");
            end
        end
        -- 活动图标
        spriteIcon.sprite = spriteIconTemp;
        spriteIcon:SetNativeSize();

        local type = tonumber(activity.type);
        -- 有领取条件,才显示当前进度
        if type == 3 then

            if activity.currentNum ~= nil and activity.targetNum ~= nil then

                local activityProgressTemp = "";
                -- 充值类型
                if activity.code == "charge_amount" then
                    local currentNum = math.floor(activity.currentNum / 100 * 10) * 0.1;
                    local targetNum = math.floor(activity.targetNum / 100 * 10) * 0.1;
                    activityProgressTemp = currentNum .. "/" .. targetNum;
                else
                    activityProgressTemp = string.format("%d/%d", activity.currentNum, activity.targetNum);
                end
                -- 活动进度
                labelProgress.text = activityProgressTemp;
                -- 设置活动进度条
                sliderActivity.maxValue = activity.targetNum;
                sliderActivity.value = activity.currentNum;
                sliderActivity.gameObject:SetActive(true);
            end
            -- 没有领取条件,进度条不显示
        elseif type == 2 then
            sliderActivity.gameObject:SetActive(false);
        end

        local isReceive = tonumber(activity.isReceive);
        local isCanClick = false;
        local awardTemp = "";
        -- 未领取
        buttonGetAward.gameObject:SetActive(true)
        noGetAward.gameObject:SetActive(false)
        if isReceive == 0 then
            awardTemp = "领取";
            isCanClick = true;
            -- 已领取
        elseif isReceive == 1 then
            awardTemp = "已领取";
            isCanClick = false;
            -- 未达成
        elseif isReceive == 2 then
            awardTemp = "未完成";
            isCanClick = true;
            buttonGetAward.gameObject:SetActive(false)
            noGetAward.gameObject:SetActive(true)
        end
        -- 奖励文字描述
        labelGetAward.text = awardTemp;
        buttonGetAward.interactable =isCanClick;
    end
end

-- 更新右侧好友分享活动视图
function ActivityView:updateRightFriendShareActivityView(activityID, friendShareTitle)

    -- 重复利用itemRight模板
    local childCount = self.itemFriendShareRight.transform.parent.childCount;
    for i = 0, childCount - 1 do
        self.itemFriendShareRight.transform.parent:GetChild(i).gameObject:SetActive(false);
    end

    -- 去掉上一次的监听
    for key, activity in ipairs(self.activityFriendRightPreviousViewList) do

        local itemClone = self.itemFriendShareRight.transform.parent:GetChild(key).gameObject;
        local buttonGetAward = GetComponentWithSimple(itemClone, "ButtonGetAward", ComponentTypeName.Button);
        buttonGetAward.onClick:RemoveListener(activity.onGetAward);
    end
    self.activityFriendRightPreviousViewList = self.activityFriendRightViewList;

    for key, activity in ipairs(self.activityFriendRightViewList) do

        -- 重复利用itemRight模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemFriendShareRight.gameObject, self.itemFriendShareRight.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemFriendShareRight.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 玩家头像标签
        local labelPlayerName = GetComponentWithSimple(itemClone, "LabelPlayerName", ComponentTypeName.Text);
        -- 分享状态标签
        local labelShareStatus = GetComponentWithSimple(itemClone, "LabelShareStatus", ComponentTypeName.Text);
        -- 奖励文字标签
        local labelGetAward = GetComponentWithSimple(itemClone, "LabelGetAward", ComponentTypeName.Text);

        -- 玩家头像
        local spritePlayerIcon = GetComponentWithSimple(itemClone, "SpritePlayerIcon", ComponentTypeName.Image);
        -- 领取奖励按钮
        local buttonGetAward = GetComponentWithSimple(itemClone, "ButtonGetAward", ComponentTypeName.Button);

        if activity.onGetAward == nil then

            local onGetAward = function()
                -- 点击分享好友领取按钮
                self:onGetFriendShareAward(self.activityLeft, activity, activityID);
            end
            activity.onGetAward = onGetAward;
            buttonGetAward.onClick:AddListener(onGetAward);
        end

        -- 下载玩家头像
        if activity.headImg then
            local onDownComplete = function(sprite)
                if not sprite then
                    spritePlayerIcon.sprite = self.spriteHolder:FindSpriteByName("playerDefault");
                else
                    spritePlayerIcon.sprite = sprite;
                end
            end
            self:image_load_sprite(nil, activity.headImg, onDownComplete);
        else
            spritePlayerIcon.sprite = self.spriteHolder:FindSpriteByName("playerDefault");
        end

        -- 玩家名称
        local filterPlayerName = Util.filterPlayerName(activity.nickname, 10);
        labelPlayerName.text = filterPlayerName;

        -- 邀请成功待绑定
        if activity.shareStatus == 0 then
            labelShareStatus.text = "进入游戏,赶紧拉TA一起玩";
            -- 邀请完成已绑定
        elseif activity.shareStatus == 1 then
            labelShareStatus.text = "完成邀请";
        end

        local buttonStatus = tonumber(activity.buttonStatus);
        local isCanClick = false;
        local awardTemp = "";
        -- 未领取
        if buttonStatus == 0 then
            awardTemp = "领取";
            isCanClick = true;
            -- 已领取
        elseif buttonStatus == 1 then
            awardTemp = "已领取";
            isCanClick = false;
            -- 未达成
        elseif buttonStatus == 2 then
            awardTemp = "未完成";
            isCanClick = true;
        end
        -- 奖励文字描述
        labelGetAward.text = awardTemp;
        buttonGetAward.interactable = isCanClick;
    end

    -- 分享好友标签
    local labelFriendShareTitle = GetComponentWithSimple(self.root, "LabelFriendShareTitle", ComponentTypeName.Text);
    labelFriendShareTitle.text = friendShareTitle;
    -- 邀请好友按钮
    self.buttonInviteFriend = GetComponentWithSimple(self.root, "ButtonInviteFriend", ComponentTypeName.Button);
end

-- 更新右侧公告类型视图
function ActivityView:updateNoticeTypeView()

    -- 公告标签
    local labelNotice = GetComponentWithSimple(self.root, "LabelNotice", ComponentTypeName.Text);
    -- 广告conteng实体
    local contentADGB = GetComponentWithSimple(labelNotice.transform.parent.gameObject, "Content", ComponentTypeName.RectTransform);
    contentADGB.anchoredPosition = Vector3.New(0, 0, 0);
    local content = string.gsub(self.activityLeft.remark,"<AppName>", ModuleCache.UnityEngine.Application.productName)

    labelNotice.text = content;
end

-- 更新右侧广告类型视图
function ActivityView:updateAdTypeView()

    if self.activityLeftPrevious.onButtonAd ~= nil then
        -- 广告跳转按钮
        local buttonAd = GetComponentWithSimple(self.root, "ButtonAd", ComponentTypeName.Button);
        buttonAd.onClick:RemoveListener(self.activityLeftPrevious.onButtonAd);
        self.activityLeftPrevious.onButtonAd = nil;
    end
    self.activityLeftPrevious = self.activityLeft;

    -- 广告图片
    local spriteAd = GetComponentWithSimple(self.root, "SpriteAd", ComponentTypeName.Image);
    -- 广告跳转文字
    local labelAd = GetComponentWithSimple(self.root, "LabelAd", ComponentTypeName.Text);

    -- 广告跳转按钮
    local buttonAd = GetComponentWithSimple(self.root, "ButtonAd", ComponentTypeName.Button);

    local isShowButtonAD = true;
    if self.activityLeft.jumpUrl == nil or self.activityLeft.jumpUrl == "" then
        isShowButtonAD = false;
    end
    buttonAd.gameObject:SetActive(isShowButtonAD);

    if self.activityLeft.onButtonAd == nil then
        local onButtonAd = function(args)

            -- 点击广告跳转按钮
            self:onClickAdButton(self.activityLeft);
        end
        self.activityLeft.onButtonAd = onButtonAd;
        buttonAd.onClick:AddListener(onButtonAd);
    end

    -- 根据showID获取对应的广告图片
    spriteAd.sprite = self.model:getSpriteADByShowID(self.activityLeft.showId);
    labelAd.text = self.activityLeft.jumpText;
end

-- 更新微信视图
function ActivityView:updateWechatView(data)

    -- 微信号
    self.labelWechatNumber.text = data;
end

-- 点击左侧toggle回调
function ActivityView:onToggleLeft(spriteRed, activity, flag)
    if not self.isFirstOpen then
        ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    end 
    self.isFirstOpen = false
    if flag then
        local showID = tonumber(activity.showId);
        -- 防重复点击
        if showID ~= self.currentShowID then

            self.currentShowID = showID;
            local showType = tonumber(activity.showType);
            -- 公告和广告不请求协议
            if showType == 2 or showType == 3 then

                local activityObject =
                {
                    leftActivity = activity;
                    rightActivity = nil;

                };
                -- 更新活动右侧视图
                self:updateActivityRightView(activityObject);
            elseif showType == 1 then

                -- 通过活动id获取活动右侧协议
                self.model:getActivityByViewId(activity);
            end

            self.currentSpriteRed = spriteRed;
            -- 请求检查红点协议
            self.model:clickCheckRedPoint(spriteRed, activity);
        end
    end
end

-- 点击领取按钮
function ActivityView:onGetAward(activityLeft, activity)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

    local isReceive = tonumber(activity.isReceive);
    -- 未达成
    if isReceive == 2 then
        local message = "活动条件不满足";
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);
    else
        -- 请求领取活动奖励协议
        self.model:getAwards(self.currentSpriteRed, activityLeft, activity.activityId);
    end
end

-- 点击分享好友领取按钮
function ActivityView:onGetFriendShareAward(activityLeft, activity, activityID)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

    local buttonStatus = tonumber(activity.buttonStatus);
    -- 未达成
    if buttonStatus == 2 then
        local message = "活动条件不满足";
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(message);
    else
        -- 请求领取活动奖励协议
        self.model:getAwards(self.currentSpriteRed, activityLeft, activityID, activity.id);
    end
end

-- 点击广告跳转按钮
function ActivityView:onClickAdButton(activityLeft)

    local url = activityLeft.jumpUrl;
    if(url and url ~= '')then
        local data = {
            productId = activityLeft.productId,
            productName = activityLeft.productName,
            productPayType = activityLeft.productPayType,
            productPriceStr = activityLeft.productPriceStr,
            productSaleTag = activityLeft.productSaleTag,
            productSalePriceStr = activityLeft.productSalePriceStr,
            productType = activityLeft.productType,
            productNum = activityLeft.productNum,
            productGiveType = activityLeft.productGiveType,
            productGiveNum = activityLeft.productGiveNum,
        }
        data._from = 'Activity'
        JumpManager:ad_jump(url, data)
    end
    ---- 跳转到商城界面
    --if url == "shoping" then
    --    ModuleCache.ModuleManager.show_module("public", "shop",{ showpage = 2, from = "proce_msg_enterroom" });
    --    ModuleCache.ModuleManager.hide_module("public", "activity");
    --elseif url == "buyProduct" then
    --    if(activityLeft.productPayType)then
    --
    --        local exchangeData = {
    --            productNum = activityLeft.productNum,
    --            productType = activityLeft.productType,
    --            productPayType = activityLeft.productPayType,
    --            productsConfig = {
    --                products = {
    --                    {
    --                        id = activityLeft.productId,
    --                        num = activityLeft.productNum,
    --                        payType = activityLeft.productPayType,
    --                        salePrice = activityLeft.productSalePriceStr,
    --                        productType = activityLeft.productType,
    --                    },
    --                },
    --            },
    --        }
    --        local onExchangeFinish = function()
    --            ModuleCache.ModuleManager.show_module("public", "goldexchange", exchangeData)
    --        end
    --        exchangeData.onExchangeFinish = onExchangeFinish
    --        ModuleCache.ModuleManager.show_module("public", "goldexchange", exchangeData)
    --        return
    --    end
    --    ModuleCache.ModuleManager.add_module("public", "shop"):get_pay_type(activityLeft.productId);
    --    --ModuleCache.ModuleManager.hide_module("public", "activity");
    --    -- 跳转到客服界面
    --elseif url == "customerService" then
    --    ModuleCache.ModuleManager.show_module("public", "customerservice");
    --    ModuleCache.ModuleManager.hide_module("public", "activity");
    --
    --    -- 跳转到实名认证界面
    --elseif url == "realNameAuth" then
    --    if self.modelData.hallData.verifyData.status == 0 then
    --        ModuleCache.ModuleManager.show_module("public", "phonebinding", "Binding");
    --        ModuleCache.ModuleManager.hide_module("public", "activity");
    --    else
    --        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您已实名认证，无需再次实名认证！")
    --    end
    --
    --    -- 跳转到分享界面
    --elseif url == "share" then
    --    ModuleCache.ModuleManager.show_module("public", "share");
    --    ModuleCache.ModuleManager.hide_module("public", "activity");
    --
    --elseif string.find(url, '{') and string.find(url, '}') then
    --    local urlData = ModuleCache.Json.decode(url)
    --    if(urlData.type and urlData.type == 'web_game')then
    --        self.module:openWebGame(urlData.code)
    --    end
    --
    --    -- 跳转到浏览器
    --else
    --
    --    local data = {
    --        link = url,
    --        style = 3,
    --        hide = false
    --    }
    --    -- 展示h5界面
    --    ModuleCache.ModuleManager.show_module("public", "webview", data);
    --end
end

-- 克隆
function ActivityView:clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos);
    target.name = obj.name;
    ComponentUtil.SafeSetActive(target, true);
    return target;
end

-- 是否为好友分享活动
function ActivityView:isFriendShareActivity(activityList)

    local isFriendShareActivity = false;
    local activityFriendShareList = nil;
    local activityID = -100;
    -- 分享好友文字描述
    local friendShareTitle = "";
    for key, activity in ipairs(activityList) do

        if activity.code == "share_friend" then
            isFriendShareActivity = true;
            activityFriendShareList = activity.activityShareVoList;
            activityID = activity.activityId;
            friendShareTitle = activity.remark;
            return isFriendShareActivity, activityFriendShareList, activityID, friendShareTitle;
        end
    end
    return isFriendShareActivity, activityFriendShareList, activityID, friendShareTitle;
end


return ActivityView