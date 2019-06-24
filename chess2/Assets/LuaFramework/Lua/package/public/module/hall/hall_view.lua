
local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local ModuleCache = ModuleCache
local PlayModeUtil = ModuleCache.PlayModeUtil

--- @class HallView : View
local HallView = class('hallView', View)
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ComponentTypeName
---@type JumpManager
local JumpManager = require('package.public.jump_manager')

HallView.AdaptScreen = true

function HallView:initialize()
    if ModuleCache.GameManager.iosAppStoreIsCheck then
     View.initialize(self, "public/module/hall/public_windowhall_create.prefab", "Public_WindowHall_Create")
    else
     View.initialize(self, "public/module/hall/public_windowhall.prefab", "Public_WindowHall")
    end
    -- 初始View
    View.set_1080p(self)
    -- 分享奖励图标
    self.spriteShareReward = GetComponentWithPath(self.root, "Footer/Menu/But (4)/ButtonShare/SpriteReward", ComponentTypeName.Image);

    self.buttonCreateRoom = GetComponentWithPath(self.root, "MainMenu/Create", ComponentTypeName.Button)
    self.buttonJoinRoom = GetComponentWithPath(self.root, "MainMenu/Join", ComponentTypeName.Button)
    self.buttonReturnRoom = GetComponentWithPath(self.root, "MainMenu/Return", ComponentTypeName.Button)
    self.buttonMuseum = GetComponentWithPath(self.root, "Footer/PaiYouQuan", ComponentTypeName.Button)
    self.buttonGoldRoom = GetComponentWithPath(self.root, "MainMenu/GoldBtn", ComponentTypeName.Button)
    self.goldLock = GetComponentWithPath(self.root, "MainMenu/GoldBtn/Lock", ComponentTypeName.Transform).gameObject
    --比赛场
    self.buttonMatch = GetComponentWithPath(self.root, "MainMenu/Match", ComponentTypeName.Button)
    self.matchLock = GetComponentWithPath(self.root,"MainMenu/Match/Lock",ComponentTypeName.Transform).gameObject
    -- 代理按钮
    self.buttonAgent = GetComponentWithPath(self.root, "Footer/Menu/But (0)/ButtonAgent", ComponentTypeName.Button)
    self.agentSwitcher = GetComponentWithPath(self.root, "Footer/Menu/But (0)", "UIStateSwitcher")
    -- 活动按钮
    self.buttonActivity = GetComponentWithPath(self.root, "Footer/Menu/But (1)/ButtonActivity", ComponentTypeName.Button)
    -- 客服按钮
    self.buttonCustomerService = GetComponentWithPath(self.root, "Footer/Menu/But (2)/ButtonCustomerService", ComponentTypeName.Button)
    -- 背包按钮
    self.buttonBag = GetComponentWithPath(self.root, "Footer/Menu/But (6)/ButtonBag", ComponentTypeName.Button)
    -- 背包红点
    self.spriteBagRed = GetComponentWithPath(self.root, "Footer/Menu/But (6)/ButtonBag/SpriteRed", ComponentTypeName.Image)

    self.spritecustomerServiceRed = GetComponentWithPath(self.root, "Footer/Menu/But (2)/ButtonCustomerService/SpriteRed", ComponentTypeName.Transform).gameObject
    --邮件红点
    self.mailRed = GetComponentWithPath(self.root, "Footer/Menu/ButMail/ButtonMail/SpriteReward", ComponentTypeName.Transform).gameObject
    self.buttonCheckResult = GetComponentWithPath(self.root, "Footer/Menu/But (3)/ButtonResult", ComponentTypeName.Button)
    self.buttonShop = GetComponentWithPath(self.root, "Footer/Menu/But (5)/ButtonShop", ComponentTypeName.Button)
    self.buttonShare = GetComponentWithPath(self.root, "Footer/Menu/But (4)/ButtonShare", ComponentTypeName.Button)
    self.buttonPlayingInstrution = GetComponentWithPath(self.root, "Bottom/StatusBar/ButtonHowToPlay", ComponentTypeName.Button)
    self.buttonSetting = GetComponentWithPath(self.root, "Footer/Menu/But (7)/ButtonSettings", ComponentTypeName.Button)
    -- self.buttonBillboard = GetComponentWithPath(self.root, "Bottom/StatusBar/ButtonBillboard", ComponentTypeName.Button)
    self.buttonRole = GetComponentWithPath(self.root, "Header/fixed/User/Head/Role", ComponentTypeName.Button)
    self.buttonAddRoomCard = GetComponentWithPath(self.root, "Header/fixed/User/Currency/Gem", ComponentTypeName.Button)
    -- 免费领钻按钮
    self.buttonFreeDiamond = GetComponentWithPath(self.root, "Operate/Grid/Activity (1)", ComponentTypeName.Button)
    self.buttonFreeDiamond.gameObject:SetActive(false);

    self.buttonHongBaoHuoDong = GetComponentWithPath(self.root, "Operate/Grid/buttonHongBaoHuoDong", ComponentTypeName.Button)
    self.buttonHongBaoHuoDong.gameObject:SetActive(false);


    -- 红包雨按钮
    self.goHongBao = ModuleCache.ComponentManager.Find(self.root, "Operate/Grid/ActivityHongBao")
    self.goHongBao:SetActive(false);

    -- 首充礼包按钮
    self.shouChongObj = ModuleCache.ComponentManager.Find(self.root, "Operate/Grid/buttonShouChong")
    self.shouChongObj:SetActive(false);
    -- 限时宝箱按钮
    self.xianShiObj = ModuleCache.ComponentManager.Find(self.root, "Operate/Grid/buttonXianShi")
    self.xianShiObj:SetActive(false);


    --幸运转盘
    self.buttonLucky = GetComponentWithPath(self.root,"Operate/Grid/Activity (2)", ComponentTypeName.Button)
    self.buttonLucky.gameObject:SetActive(false);

    -- 实名认证按钮
	self.buttonVerify = GetComponentWithPath(self.root, "Operate/Grid/Activity (3)", ComponentTypeName.Button)
	self:fixed_tran_size(self.buttonVerify.transform.parent.parent)
    -- 排行榜按钮
	self.buttonRanking = GetComponentWithPath(self.root, "Side/LeaderBordBtn", ComponentTypeName.Button)
	self:fixed_tran_size(self.buttonRanking.transform.parent,0.925)
	self.buttonVerify.gameObject:SetActive(false);

	self:fixed_tran_size(GetComponentWithPath(self.root, "Header", ComponentTypeName.Transform))

    self.textPlayerName = GetComponentWithPath(self.root, "Header/fixed/User/Head/TextName", ComponentTypeName.Text)
    self.textPlayerNameGo = self.textPlayerName.gameObject
    self.imagePlayerHeadIcon = GetComponentWithPath(self.root, "Header/fixed/User/Head/Avatar/Image", ComponentTypeName.Image)
    self.textPlayerID = GetComponentWithPath(self.root, "Header/fixed/User/Name/TextID", ComponentTypeName.Text)
    self.textCardNum = GetComponentWithPath(self.root, "Header/fixed/User/Currency/Gem/TextNum", ComponentTypeName.Text)
    -- self.textCoinName = GetComponentWithPath(self.root, "Top/StatusBar/DiamondCard/TextName", ComponentTypeName.Text)
    self.textGoldNum = GetComponentWithPath(self.root, "Header/fixed/User/Currency/Gold/TextNum", ComponentTypeName.Text)

    self.textSwitchGameName =  GetComponentWithPath(self.root, "Header/fixed/Switch/Text", ComponentTypeName.Text)
    self.imageGameIcon = GetComponentWithPath(self.root, "MainMenu/Create/CurrentGameIcon", ComponentTypeName.Image)
    self.textPlayerName.text = ''
    self.textPlayerID.text = ''
    self.textCardNum.text = ''


    self.goUpdateVersionBubble = GetComponentWithPath(self.root, "Footer/Menu/But (7)/ButtonSettings/VersionBubble", ComponentTypeName.Transform).gameObject
    self.color = { }
    self.color[1] = Color.New(6 / 255, 73 / 255, 107 / 255, 1)
    self.color[2] = Color.New(134 / 255, 55 / 255, 8 / 255, 1)
    self.color[3] = Color.New(50 / 255, 108 / 255, 6 / 255, 1)
    self.color[4] = Color.New(17 / 255, 90 / 255, 30 / 255, 1)
    self.leftLayout = GetComponentWithPath(self.root, "Operate", ComponentTypeName.GridLayoutGroup)
    self.uiStateSwitcher = GetComponentWithPath(self.root, "Footer/Menu", "UIStateSwitcher")
    if (ModuleCache.GameManager.iosAppStoreIsCheck) then
        self.uiStateSwitcher:SwitchState("IosCheck")
        ModuleCache.ComponentManager.GetComponent(self.root, "UnityEngine.Animator").enabled = false
    else
        -- 实例化免费领钻预置
        -- self.freeDiamondPrefab = ViewUtil.InitGameObject("public/effect/mianfeilingzuan/prefab/anim_mianfeilingzuan.prefab", "Anim_MianFeiLingZuan", self.buttonFreeDiamond.gameObject);
        -- self.freeDiamondPrefab.transform:SetAsFirstSibling()
    end


    if ModuleCache.GameManager.lockAssetUpdate then
        self.goUpdateVersionBubble:SetActive(true)
        GetComponentWithPath(self.root, "Footer/Menu/But (7)/ButtonSettings/VersionBubble/Text", ComponentTypeName.Text).text = "锁定版本，不再更新任何资源"
    end
    self.test = GetComponentWithPath(self.root, "Test", ComponentTypeName.Transform).gameObject
    -- print("是否为测试模式：",ModuleCache.GameManager.isTestUser,self.test)
    ModuleCache.ComponentUtil.SafeSetActive(self.test, ModuleCache.GameManager.isTestUser)

    self:initEffectRender()
    self:initThirdGamesView()
end

function HallView:on_view_init()


end

--每次打开都需要根据界面渲染层级来指定所有的特效渲染层级
function HallView:initEffectRender()
    self.effectRenders = {}
    self.sortingOrders = {}
    local obj = ModuleCache.ComponentUtil.GetComponentWithPath(self.root, "Footer/PaiYouQuan/Image/paiyouquan_2", ComponentTypeName.Transform).gameObject
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(obj, "UnityEngine.ParticleSystemRenderer")
    obj = ModuleCache.ComponentUtil.GetComponentWithPath(self.root, "Header/fixed/Switch/More/dizhi", ComponentTypeName.Transform).gameObject
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(obj, "UnityEngine.ParticleSystemRenderer")
    obj = ModuleCache.ComponentUtil.GetComponentWithPath(self.root, "Header/fixed/Switch/tip/qiehuan", ComponentTypeName.Transform).gameObject
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(obj, "UnityEngine.ParticleSystemRenderer")
    obj = ModuleCache.ComponentUtil.GetComponentWithPath(self.root, "Header/fixed/User/Currency/Gold/icon", ComponentTypeName.Transform).gameObject
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(obj, "UnityEngine.ParticleSystemRenderer")
    obj = ModuleCache.ComponentUtil.GetComponentWithPath(self.root, "Header/fixed/User/Currency/Gem/icon", ComponentTypeName.Transform).gameObject
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(obj, "UnityEngine.ParticleSystemRenderer")
    obj = ModuleCache.ComponentUtil.GetComponentWithPath(self.root, "Operate/Grid/Activity (1)/ButtonFreeDiamond/Anim_MianFeiLingZuan", ComponentTypeName.Transform).gameObject
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(obj, "UnityEngine.ParticleSystemRenderer")
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(self.buttonMatch.gameObject, "UnityEngine.ParticleSystemRenderer")
    self.effectRenders[#self.effectRenders + 1] = ModuleCache.ComponentUtil.GetComponentsInChildren(self.buttonGoldRoom.gameObject, "UnityEngine.ParticleSystemRenderer")
end

function HallView:set_effect_sortingOrder()
    for i = 1, #self.effectRenders do
        for j = 0, self.effectRenders[i].Length - 1 do
            local rander = self.effectRenders[i][j]
            if self.sortingOrders[rander] == nil then
                self.sortingOrders[rander] = rander.sortingOrder
            end
            rander.sortingOrder =  self.canvas.sortingOrder + self.sortingOrders[rander]
        end
    end
end

-- 刷新与玩法相关的显示
function HallView:setGameName()
    local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.getCurGameId())
    self.textSwitchGameName.text = playMode.name
    self.imageGameIcon.sprite =   ModuleCache.PlayModeUtil.getHeadIconRes(playMode, ModuleCache.GameManager.getCurProvinceId())
    self.imageGameIcon:SetNativeSize()
    ModuleCache.ComponentUtil.SafeSetActive(self.goldLock.gameObject, not playMode.isOpenGold)
    ModuleCache.ComponentUtil.SafeSetActive(self.matchLock.gameObject, not playMode.isOpenMatch)
    if ModuleCache.AppData.Is_Independent_App then
        self.goldLock.gameObject:SetActive(false)
        self.matchLock.gameObject:SetActive(false)
    end
end




function HallView:refreshPlayerInfo(roleData)
    if roleData.cards then
        self.textCardNum.text = Util.filterPlayerGoldNum(tonumber(roleData.cards) + tonumber(roleData.coins))
        if roleData.gold then
            self.textGoldNum.text = Util.filterPlayerGoldNum(roleData.gold)
        else
            self.textGoldNum.text = "0"
        end

        if roleData.headSprite then
            self.imagePlayerHeadIcon.sprite = roleData.headSprite
        end

        --self.textPlayerName.supportRichText = true
        --self.textPlayerName.text = roleData.uiContractionsNickname
        ModuleCache.EmojiUtil().show_with_emoji_text(self.textPlayerName, roleData.nickname, function (emojiText)
            self.textPlayerName = emojiText
        end)
        self.textPlayerID.text = roleData.uiUserId
    end
end



function HallView:refreshAdContent(ads)
    print("ads len = " .. #ads)
    if (ModuleCache.GameManager.iosAppStoreIsCheck) then
        self.adContentInfo.root:SetActive(false)
    else
        self.adContentInfo.root:SetActive(false)
    end

    self.adContentInfo.ads = ads
    self.adContentInfo.gameObjectAds = { }
    local len = #ads
    local x = len * self.adContentInfo.cellSize.x
    local y = self.adContentInfo.scrollRectAdContent.content.sizeDelta.y
    self.adContentInfo.scrollRectAdContent.content.sizeDelta = ModuleCache.CustomerUtil.ConvertVector2(x, y)
    self.adContentInfo.pageSelectImageArray = { }

    if (self.adGameObjects) then
        for k, v in pairs(self.adGameObjects) do
            UnityEngine.GameObject.Destroy(v.gameObject)
        end
    end
    self.adGameObjects = { }
    for i = 1, len do
        local item = ModuleCache.ComponentUtil.InstantiateLocal(self.adContentInfo.prefabItem, self.adContentInfo.scrollRectAdContent.content.gameObject)
        table.insert(self.adGameObjects, item)
        item.name = "ad_item"
        local x =(i - 1) * self.adContentInfo.cellSize.x
        ModuleCache.TransformUtil.SetX(item.transform, x, true)
        ModuleCache.TransformUtil.SetY(item.transform, 0, true)
        item:SetActive(true)
        self:fillItem(item, ads[i].img)
        table.insert(self.adContentInfo.gameObjectAds, item)


        local pageTag = ModuleCache.ComponentUtil.InstantiateLocal(self.adContentInfo.prefabPageTag, self.adContentInfo.prefabPageTag.transform.parent.gameObject)
        table.insert(self.adGameObjects, pageTag)
        pageTag:SetActive(true)
        local imageSelect = ModuleCache.ComponentManager.GetComponentWithPath(pageTag, "Select", ComponentTypeName.Image)
        table.insert(self.adContentInfo.pageSelectImageArray, imageSelect)
    end
    self:refreshAdsPageTag(1)
end

function HallView:initThirdGamesView()
    local holder = {}
    holder.root = GetComponentWithPath(self.root, "MainMenu/ThirdGame", ComponentTypeName.Transform).gameObject
    holder.itemPrefab = GetComponentWithPath(holder.root, "ThirdGame/Item", ComponentTypeName.Transform).gameObject
    holder.spriteDefault = GetComponentWithPath(holder.itemPrefab, "icon/bg", ComponentTypeName.Image).sprite
    holder.spriteHolder = GetComponentWithPath(holder.root,"IconSpriteHolder","SpriteHolder")
    holder.itemHolderList = {}
    self.thirdGamesViewHolder = holder
end

function HallView:refreshThirdGamesView(list)
    list = list or {}
    local itemHolderList = self.thirdGamesViewHolder.itemHolderList
    for i, v in pairs(itemHolderList) do
        ModuleCache.ComponentUtil.SafeSetActive(v.root, false)
    end
    for i = 1, #list do
        local data = list[i]
        local needShow = true
        data.extendData = ModuleCache.Json.decode(data.extendStr)
        if ModuleCache.GameManager.platformIsAndroid then
            data.isOpen = data.status == 0 and ModuleCache.SDKInterface().is_support_webgame()
        else
            data.isOpen = data.status == 0 -- and ModuleCache.SDKInterface().is_support_webgame()
            if not ModuleCache.SDKInterface().is_support_webgame() and data.code == "zhangdu_xiaoshuo" then
                needShow = false
            end
        end

        if needShow then
            local holder = itemHolderList[i]
            if(not holder)then
                local prefab = self.thirdGamesViewHolder.itemPrefab
                holder = {}
                holder.root = ModuleCache.ComponentUtil.InstantiateLocal(prefab, prefab.transform.parent.gameObject)
                holder.root.name = 'WebGameItem'
                holder.button = ModuleCache.ComponentManager.GetComponent(holder.root, ComponentTypeName.Button)
                holder.imageIcon = GetComponentWithPath(holder.root, "icon/bg", ComponentTypeName.Image)
                holder.imageLock = GetComponentWithPath(holder.root, "icon/lock", ComponentTypeName.Image)
                holder.textName = GetComponentWithPath(holder.root, "LabelGameName", ComponentTypeName.Text)
                holder.button.onClick:AddListener(function()
                    if(not holder.data.isOpen)then
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待")
                        return
                    end
                    JumpManager:openWebGame(holder.data.code, 'Hall')
                end)
                itemHolderList[i] = holder
            end
            holder.data = data
            holder.imageIcon.sprite = self.thirdGamesViewHolder.spriteHolder:FindSpriteByName(data.code)
            if(data.logo and data.logo ~= '')then
                self:image_load_sprite(holder.imageIcon, data.logo)
            end
            holder.textName.text = data.name
            ModuleCache.ComponentUtil.SafeSetActive(holder.imageLock.gameObject, not data.isOpen)
            ModuleCache.ComponentUtil.SafeSetActive(holder.root, true)
        end
    end
end

function HallView:fillItem(item, url)
    local image = ModuleCache.ComponentManager.GetComponent(item, ComponentTypeName.Image)
    self:image_load_sprite(image, url)
end


function HallView:onBeginDragAdContent(obj, arg)
    self.adContentInfo.isDraging = true
end

function HallView:onDragAdContent(obj, arg)
    self.onDragDelta = arg.delta
    local targetPos, targetIndex = self:getNearestScrollViewPos()
    self:refreshAdsPageTag(targetIndex)
end



function HallView:refreshAdsPageTag(targetIndex)
    for i = 1, #self.adContentInfo.pageSelectImageArray do
        if (targetIndex == i) then
            ModuleCache.ComponentUtil.SafeSetActive(self.adContentInfo.pageSelectImageArray[i].gameObject, true)
        else
            ModuleCache.ComponentUtil.SafeSetActive(self.adContentInfo.pageSelectImageArray[i].gameObject, false)
        end
    end

end

function HallView:onEndDragAdContent(offsetIndex, obj, arg)
    if (not self.adContentInfo.isDraging) then
        return
    end
    local targetPos, targetIndex, curPos = self:getNearestScrollViewPos()

    local offset = 0
    if (arg and self.onDragDelta.x < 0) then
        if (self.lastIndex == targetIndex) then
            if (targetPos < curPos) then
                offset = 1
            end
        else

        end
    elseif (arg and self.onDragDelta.x > 0) then
        if (self.lastIndex == targetIndex) then
            if (targetPos > curPos) then
                offset = -1
            end
        else

        end
    end

    self.adContentInfo.isDraging = false
    targetPos, targetIndex, curPos = self:getNearestScrollViewPos(offsetIndex, offset)
    ModuleCache.CustomerUtil.ToGeterSeterFloat( function()
        if not self.adContentInfo then
            print("已经销毁了")
            return
        end
        return self.adContentInfo.scrollRectAdContent.horizontalNormalizedPosition
    end,
    function(x)
        if self.isDestroy then
            return
        end
        if self.adContentInfo and self.adContentInfo.scrollRectAdContent then
            self.adContentInfo.scrollRectAdContent.horizontalNormalizedPosition = x
            if (Util.getPreciseDecimal(x, 3) == Util.getPreciseDecimal(targetPos, 3)) then
                self:refreshAdsPageTag(targetIndex)
                self.lastIndex = targetIndex
            end
        end
    end,
    targetPos, 0.2)
end


function HallView:getNearestScrollViewPos(offsetIndex, offset)
    offsetIndex = offsetIndex or 0
    offset = offset or 0
    local curPos = self.adContentInfo.scrollRectAdContent.horizontalNormalizedPosition
    local minOffset = 1
    local targetPosX = curPos
    local targetIndex = 1
    local len = #self.adContentInfo.gameObjectAds
    for i = 1, len do
        local pos =(i - 1) /(len - 1)
        local tmpOffset = math.abs(curPos - pos)
        if (minOffset > tmpOffset) then
            minOffset = tmpOffset
            targetPosX = math.min(math.max((i - 1 + offsetIndex + offset) /(len - 1), 0), 1)
            targetIndex = math.min(math.max(i + offsetIndex + offset, 1), len)
        end
    end
    return targetPosX, targetIndex, curPos
end

-- 更新奖励视图
function HallView:updateRewardView(activityList, code)

    -- 通过code获取活动数据
    local activity = self:getActivityByCode(activityList, code);
    -- 空数据,奖励图标不显示
    if activity == nil then

        activity = { };
        activity.isReceive = 1;
    end

    local isReceive = activity.isReceive;
    -- 是否显示奖励图标
    local isShowReward = false;
    -- 0未领取 1=已领取
    if isReceive == 0 then
        isShowReward = true;
    elseif isReceive == 1 then
        isShowReward = false;
    end

    self.buttonFreeDiamond.gameObject:SetActive(isShowReward);
    self.spriteShareReward.gameObject:SetActive(isShowReward);
    self:setGridActive()
    return isShowReward
end

-- 更新主界面红点(此方法目前只有背包)
function HallView:updateMainRedPoint(data)

    if data.packItemHighlightNum then
        if data.packItemHighlightNum > 0 then
            self.spriteBagRed.gameObject:SetActive(true);
        elseif data.packItemHighlightNum == 0 then
            self.spriteBagRed.gameObject:SetActive(false);
        end
    end

end

function HallView:updateVerifyStatus(view)
    self.buttonVerify.gameObject:SetActive(view);
    self:setGridActive()
end

function HallView:updateLuckyStatus(view)
    self.buttonLucky.gameObject:SetActive(view)
    self.setGridActive()
end

function HallView:updateRedStatus(show, data)
    self.goHongBao:SetActive(show)
    --if data.partner then
    --    self.buttonRedName.gameObject:SetActive(true)
    --    self.buttonRedName.text = data.partner
    --else
    --    self.buttonRedName.gameObject:SetActive(false)
    --end
    --self:setGridActive()
end


function HallView:setGridActive()
    --self.leftLayout.enabled = false
    --self.leftLayout.enabled = true
    --local layout = function()
    --    WaitForSeconds(1)
    --    if not self.isDestroy then
    --        self.leftLayout.enabled = false
    --    end
    --end
    --self:start_unity_coroutine(layout)
end

-- 通过code获取活动数据
function HallView:getActivityByCode(activityList, code)
    local activity
    for key, activityTemp in ipairs(activityList) do

        if activityTemp.code == code then

            activity = activityTemp;
            return activity;
        end
    end

    return activity;
end

function HallView:CalcNearestPos()

end

function HallView:updateAgentStatus(data)
    self.agentSwitcher:SwitchState(not data and "notAgent" or "isAgent")
end

function HallView:show_ParlorAgentTableActivity(state)
    local gameObject = ModuleCache.ComponentManager.Find(self.root, "Operate/Grid/ActivityParlorAgentTable")
    if gameObject then
        gameObject:SetActive(state)
    end
end

function HallView:open_ParlorAgentTableActivity(url)
    local data = {
        link = url,
        showType = 0,
        style = 2
    }
    ModuleCache.ModuleManager.show_module("public", "webview", data);
end

return HallView