
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
---@type JumpManager
local JumpManager = require('package.public.jump_manager')
local OperateView = Class('operateView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local PlayModeUtil = ModuleCache.PlayModeUtil
local GestureType = {
    None = 0,
    Left = 1,
    Right= 2,
}
local GameItemCount = 5
local perPageMaxItemCount = 6

function OperateView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/operate/public_operate.prefab", "Public_Operate", 0);
    View.set_1080p(self);


    -- 用户信息组件
    -- 玩家头像
    self.spritePlayerIcon = GetComponentWithSimple(self.root, "SpritePlayerIcon", ComponentTypeName.Image);
    -- 玩家名字标签
    self.labelPlayerName = GetComponentWithSimple(self.root, "LabelPlayerName", ComponentTypeName.Text);
    -- 玩家ID标签
    self.labelPlayerID = GetComponentWithSimple(self.root, "LabelPlayerID", ComponentTypeName.Text);
    -- 复制按钮
    self.buttonCopy = GetComponentWithSimple(self.root, "ButtonCopyID", ComponentTypeName.Button);
    -- 头像按钮
    self.buttonRole = GetComponentWithSimple(self.root, "ButtonRole", ComponentTypeName.Button);

    -- 运营活动模板
    self.itemOperateActivity = GetComponentWithSimple(self.root, "ItemOperateActivity", ComponentTypeName.Transform).gameObject;
    self.itemOperateActivity:SetActive(false);
    -- 推荐游戏模板
    self.itemGame = GetComponentWithSimple(self.root, "itemGame", ComponentTypeName.Transform).gameObject;
    self.itemGame:SetActive(false);
    -- 亲友圈模板
    self.itemMuseum = GetComponentWithSimple(self.root, "itemMuseum", ComponentTypeName.Transform).gameObject;
    self.itemMuseum:SetActive(false);

    -- 推荐游戏toggle
    self.toggleGame = GetComponentWithSimple(self.root, "ToggleGame", ComponentTypeName.Toggle);
    local onToggleGame = function(flag)
        -- 点击发行toggle
        self:onToggleOperate(flag, 1);
    end
    self.toggleGame.onValueChanged:AddListener(onToggleGame);

    --亲友圈按钮
    self.buttonChessMuseum = GetComponentWithSimple(self.root, "ButtonChessmuseum", ComponentTypeName.Button);

    -- 亲友圈toggle
    self.toggleMuseum = GetComponentWithSimple(self.root, "ToggleMuseum", ComponentTypeName.Toggle);
    local onToggleMuseum = function(flag)
        -- 点击发行toggle
        self:onToggleOperate(flag, 2);
    end
    self.toggleMuseum.onValueChanged:AddListener(onToggleMuseum);


    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");

	self.goShowHall = ModuleCache.ComponentManager.Find(self.root, "Center/ButtonHall");
	self:fixed_tran_size(self.goShowHall.transform.parent, 0.94)
    self.imageShowHall = GetComponentWithSimple(self.goShowHall, "wanfa", ComponentTypeName.Image);

    -- 发行翻页组件
    self.adContentInfo = { }
    self.adContentInfo.curIndex = 0
    -- self.adContentInfo.cellSize = { x = 1920, y = 1080 }
    --self.adContentInfo.cellSize = { x = self.rootTransform.sizeDelta.x, y = self.rootTransform.sizeDelta.y }
     self.adContentInfo.cellSize = { x = 705, y = 827 }
    self.adContentInfo.root = GetComponentWithSimple(self.root, "AdContent", ComponentTypeName.Transform).gameObject
    --self.adContentInfo.scrollRectContent = GetComponentWithSimple(self.root, "ADScrollView", ComponentTypeName.ScrollRect)
    self.adContentInfo.content = GetComponentWithSimple(self.adContentInfo.root, "Content", ComponentTypeName.Transform)
    self.adContentInfo.prefabItem = GetComponentWithSimple(self.root, "ADItem", ComponentTypeName.Transform).gameObject
    self.adContentInfo.prefabPageTag = GetComponentWithSimple(self.root, "ADPoint", ComponentTypeName.Transform).gameObject
    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");
    -- 广告翻页item列表
    self.adItemList = { };

    -- 推荐游戏翻页组件
    self.recommendGamesContentInfo = { }
    self.recommendGamesContentInfo.gameObjectList = { }
    self.recommendGamesContentInfo.curIndex = 0
    self.recommendGamesContentInfo.cellSize = { x = 646, y = 518 }
    self.recommendGamesContentInfo.root = GetComponentWithSimple(self.root, "RecommendGames", ComponentTypeName.Transform).gameObject
    self.recommendGamesContentInfo.scrollRectContent = GetComponentWithSimple(self.recommendGamesContentInfo.root, "GameScrollView", ComponentTypeName.ScrollRect)
    self.recommendGamesContentInfo.prefabPageItem = GetComponentWithSimple(self.recommendGamesContentInfo.root, "gamePage", ComponentTypeName.Transform).gameObject
    self.recommendGamesContentInfo.prefabPageTag = GetComponentWithSimple(self.recommendGamesContentInfo.root, "PagePoint", ComponentTypeName.Transform).gameObject
    self.recommendGamesContentInfo.pageSelectImageArray = { }

    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");
    -- 广告翻页item列表
    self.recommendGameItemList = { };
    self.recommendGamePageHolderList = {}
    self.recommendGamePageTagHolderList = {}

    self.spritecustomerServiceRed = GetComponentWithSimple(self.root, "SpriteRed", ComponentTypeName.Transform).gameObject

    self.goLogoHaoCai = GetComponentWithSimple(self.root, "LogoHaoCai", ComponentTypeName.Transform).gameObject
    self.goLogoDaHu = GetComponentWithSimple(self.root, "LogoDaHu", ComponentTypeName.Transform).gameObject

    self:initThirdGamesView()
    --"Bottom/Image/ItemMoreGame"
end

function OperateView:refreshMoreGameBtn(buttonMoreGame)
    buttonMoreGame = buttonMoreGame or self.buttonMoreGame
    buttonMoreGame.gameObject:SetActive(true)
    -- if ModuleCache.GameManager.channel ~= "Official" then
    --     buttonMoreGame.gameObject:SetActive(false)
    -- else
    --     buttonMoreGame.gameObject:SetActive(true)
    -- end
end

function OperateView:refreshCurGameIcon()
    local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.getCurGameId())
    self.imageShowHall.sprite =   ModuleCache.PlayModeUtil.getHeadIconRes(playMode, ModuleCache.GameManager.getCurProvinceId())
    self.imageShowHall:SetNativeSize();
    local scale = 160 / self.imageShowHall.transform.sizeDelta.x
    self.imageShowHall.transform.localScale = UnityEngine.Vector3.New(scale, scale, 1)
end

function OperateView:init(operateList, module)

    self.operateList = operateList;
    self.model = module.model;
    self.module = module;
    -- 发行页签类型
    self.typeOperate = 1;
    self:refreshCurGameIcon()
    -- 更新推荐游戏视图
    self:updateRecommendGameView();
    self:updateLogo()
    -- 更新运营活动视图
    --self:updateOperateActivityView();

    -- 切换页签
    self:switchToggle();

    self:refreshAdContent()
    --self:start_auto_play_content(self.adContentInfo)
end

-- 更新用户信息视图
function OperateView:updateUserInfoView(userData)

    self.userData = userData;
    self:image_load_sprite(self.spritePlayerIcon, userData.headImg);

    -- 玩家名字
    self.labelPlayerName.text = Util.filterPlayerName(userData.nickname, 10);
    -- 玩家id
    self.labelPlayerID.text = "ID:" .. userData.userId;
end

-- 更新运营活动视图
function OperateView:updateOperateActivityView()

    -- 重复利用itemOperateActivity模板
    local childCount = self.itemOperateActivity.transform.parent.childCount;
    for i = 0, childCount - 1 do
        self.itemOperateActivity.transform.parent:GetChild(i).gameObject:SetActive(false);
    end
    for key, operateActivity in ipairs(self.operateList.func) do
        -- 重复利用itemOperateActivity模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemOperateActivity.gameObject, self.itemOperateActivity.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemOperateActivity.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 运营活动按钮
        local buttonOperateActivity = GetComponentWithSimple(itemClone, itemClone.name, ComponentTypeName.Button);
        buttonOperateActivity.onClick:RemoveAllListeners();

        local onClickButtonActivity = function()
            -- 点击运营活动按钮
            self:onClickOperateActivityButton(operateActivity);
        end
        buttonOperateActivity.onClick:AddListener(onClickButtonActivity);

        -- 活动标题标签
        local labelOpeateActivity = GetComponentWithSimple(itemClone, "LabelOperateActivity", ComponentTypeName.Text);
        labelOpeateActivity.text = operateActivity.content;
    end

end

function OperateView:updateLogo()
    local isHaoCai = ModuleCache.GameManager.channel == "HAOCAI"
    self.goLogoHaoCai:SetActive(isHaoCai)
    self.goLogoDaHu:SetActive(not isHaoCai)
end

-- 更新推荐游戏视图
function OperateView:updateRecommendGameView()
    -- 重复利用itemOperateActivity模板
    for i, v in pairs(self.recommendGamePageHolderList) do
        local pageHolder = v
        pageHolder.root:SetActive(false)
        for i, v in pairs(pageHolder.itemHolderList) do
            v.root:SetActive(false)
        end
    end

    for i, v in pairs(self.recommendGamePageTagHolderList) do
        v.root:SetActive(false)
    end

    local tempGameIds = {}

    --检查游戏已经在推荐表中
    local function check_have_game(_gameId, _provinceId)
        for i = 1, #tempGameIds do
            if tempGameIds[i].gameId == _gameId and tempGameIds[i].provinceId == _provinceId then
                return true
            end
        end
        return false
    end

    local function set_game_info(operateGame, index, isLocal, itemClone)
        --先处理是否重复的
        local provinceConf = ModuleCache.PlayModeUtil.getProvinceByAppName(operateGame.province)
        local playModeConf = PlayModeUtil.getDeepCopyTable(require(provinceConf.modName))
        local playMode
        if isLocal then
            playMode = ModuleCache.PlayModeUtil.getInfoByGameId(operateGame.gameId, playModeConf)
        else
            local gameName = string.split(operateGame.gameId, "_")[2]
            playMode = PlayModeUtil.getInfoByGameName(gameName, playModeConf)
        end
        if check_have_game(playMode.gameId, provinceConf.id) then return false end
        table.insert(tempGameIds, { gameId = playMode.gameId , provinceId = provinceConf.id })

        --处理推荐类型
        local spriteBaseTemp = nil;
        if operateGame.type == -1 then
            spriteBaseTemp = self.spriteHolder:FindSpriteByName("defaultBase");
        elseif operateGame.type == 0 or operateGame.type == 1 or operateGame.type == 2 then  -- 推荐(0=无标签 1=推荐 2=热门)
            spriteBaseTemp = self.spriteHolder:FindSpriteByName("recommendBase");
        elseif operateGame.type == -99 then -- 官方
            spriteBaseTemp = self.spriteHolder:FindSpriteByName("officialBase");
        end

        -- 重复利用itemOperateActivity模板
        --if index > childCount then
        --    itemClone = self:clone(self.itemGame.gameObject, self.itemGame.transform.parent.gameObject, Vector3.zero);
        --    itemClone.name = itemClone.name .. index - 1;
        --else
        --    itemClone = self.itemGame.transform.parent:GetChild(index - 1).gameObject;
        --    itemClone:SetActive(true);
        --end
        itemClone:SetActive(true)
        itemClone.transform.parent.gameObject:SetActive(true)
        -- 推荐游戏按钮
        local buttonGame = GetComponentWithSimple(itemClone, itemClone.name, ComponentTypeName.Button);
        -- 推荐游戏名字标签
        local labelGameName = GetComponentWithSimple(itemClone, "LabelGameName", ComponentTypeName.Text);
        -- 推荐游戏底板
        local spriteBase = GetComponentWithSimple(itemClone, 'icon', ComponentTypeName.Image);
        if(not spriteBase)then
            spriteBase = GetComponentWithSimple(itemClone, itemClone.name, ComponentTypeName.Image);
        end
        spriteBase.sprite = spriteBaseTemp;

        -- 游戏icon
        local spriteGameIcon = GetComponentWithSimple(itemClone, "SpriteGameIcon", ComponentTypeName.Image);
        spriteGameIcon.sprite = ModuleCache.PlayModeUtil.getHeadIconRes(playMode, provinceConf.id);
        spriteGameIcon:SetNativeSize();

        buttonGame.onClick:RemoveAllListeners();
        local onClickButtonGame = function()
            -- 点击推荐游戏按钮
            self:onClickOperateGameButton(provinceConf.id, playMode);
        end
        buttonGame.onClick:AddListener(onClickButtonGame);
        -- 推荐游戏名字
        labelGameName.text = playMode.name;
        return true
    end
    local usedList = ModuleCache.GameManager.get_used_playMode()
    local curIndex = 0
    if usedList ~= nil then
        for i = 1, #usedList do
            curIndex = curIndex + 1
            local province = ModuleCache.PlayModeUtil.getProvinceById(usedList[i].provinceId)
            local go = self:GetGameItemHolder(curIndex)
            if not set_game_info({province = province.appName, gameId = usedList[i].gameId, type = -1}, curIndex, true, go) then
                curIndex = curIndex - 1
            end
            if curIndex >= GameItemCount then break end
        end
    end


    for _, operateGame in ipairs(self.operateList.games) do
        curIndex = curIndex + 1
        if curIndex > GameItemCount then break end
        local go = self:GetGameItemHolder(curIndex)
        if  not set_game_info(operateGame, curIndex, false, go) then curIndex = curIndex - 1 end
    end

    local contentInfo = self.recommendGamesContentInfo
    local len = 0
    len, contentInfo.gameObjectList = self:refreshRecommendGameRectContentSize()
    contentInfo.pageSelectImageArray = {}
    for i = 1, len do
        local pageTagHolder = self.recommendGamePageTagHolderList[i]
        if(not pageTagHolder)then
            pageTagHolder = {}
            local prefab = contentInfo.prefabPageTag
            pageTagHolder.root = ModuleCache.ComponentUtil.InstantiateLocal(prefab, prefab.transform.parent.gameObject)
            pageTagHolder.imageSelect = GetComponentWithSimple(pageTagHolder.root, 'Select', ComponentTypeName.Image)
            self.recommendGamePageTagHolderList[i] = pageTagHolder
        end
        pageTagHolder.root:SetActive(true)
        table.insert(contentInfo.pageSelectImageArray, pageTagHolder.imageSelect)
    end
    contentInfo.lastIndex = 1
    local obj = {name = 'itemGame'}
    --self:onBeginDragContent(obj)
    --self:onEndDragContent(nil, obj)
    ModuleCache.TransformUtil.SetX(self.recommendGamesContentInfo.scrollRectContent.content.transform, 0, true)
    self:setScrollViewDragStatus(contentInfo)
    self:refreshPageTag(contentInfo.lastIndex, contentInfo)
end

function OperateView:GetGameItemHolder(index)
    local pageIndex = math.floor(index / (perPageMaxItemCount)) + 1
    local itemIndex = math.fmod(index, perPageMaxItemCount)
    if(itemIndex == 0)then
        itemIndex = perPageMaxItemCount
        pageIndex = pageIndex - 1
    end
    --print(string.format('index=%d,pageIndex=%d,itemIndex=%d', index, pageIndex, itemIndex))
    local pageHolder = self.recommendGamePageHolderList[pageIndex]
    if(not pageHolder)then
        pageHolder = {
            itemHolderList = {}
        }
        local prefab = self.recommendGamesContentInfo.prefabPageItem
        pageHolder.root = ModuleCache.ComponentUtil.InstantiateLocal(prefab, prefab.transform.parent.gameObject)
        pageHolder.root.name = pageIndex
        pageHolder.prefabItem = GetComponentWithSimple(pageHolder.root, 'itemGame', ComponentTypeName.Transform).gameObject
        pageHolder.buttonMoreGame = GetComponentWithSimple(pageHolder.root, 'ItemMoreGame', ComponentTypeName.Button)
        self.recommendGamePageHolderList[pageIndex] = pageHolder
    end
    local itemHolder = pageHolder.itemHolderList[itemIndex]
    if(not itemHolder)then
        itemHolder = {}
        local prefab = pageHolder.prefabItem
        itemHolder.root = ModuleCache.ComponentUtil.InstantiateLocal(prefab, prefab.transform.parent.gameObject)
        itemHolder.root.name = 'itemGame'
        pageHolder.itemHolderList[itemIndex] = itemHolder
    end
    return itemHolder.root, pageHolder, itemIndex
end

function OperateView:refreshRecommendGameRectContentSize()
    local len = 0
    local totalItemCount = 0
    local gameObjectList = {}
    for i = 1, #self.recommendGamePageHolderList do
        local v = self.recommendGamePageHolderList[i]
        v.buttonMoreGame.gameObject:SetActive(false)
        if(v.root.activeSelf)then
            len = len + 1
            table.insert(gameObjectList, v.root)
            for _, itemHolder in pairs(v.itemHolderList) do
                if(itemHolder.root.activeSelf)then
                    totalItemCount = totalItemCount + 1
                end
            end
        end
    end
    print(len, totalItemCount)
    local itemIndex = math.fmod(totalItemCount, perPageMaxItemCount)
    if(itemIndex == 0)then
        local go, pageHolder, index = self:GetGameItemHolder(totalItemCount + 1)
        go:SetActive(false)
        pageHolder.root:SetActive(true)
        len = len + 1
        table.insert(gameObjectList, pageHolder.root)
    end
    print(itemIndex, len)
    local lastPageHolder = self.recommendGamePageHolderList[len]
    lastPageHolder.buttonMoreGame.transform:SetAsLastSibling()
    self:refreshMoreGameBtn(lastPageHolder.buttonMoreGame)

    local x = len * self.recommendGamesContentInfo.cellSize.x
    local y = self.recommendGamesContentInfo.scrollRectContent.content.sizeDelta.y
    self.recommendGamesContentInfo.scrollRectContent.content.sizeDelta = ModuleCache.CustomerUtil.ConvertVector2(x, y)
    return len, gameObjectList
end

-- 更新亲友圈视图
function OperateView:updateMuseumView(museumList)
    -- 重复利用itemOperateActivity模板
    local childCount = self.itemMuseum.transform.parent.childCount;
    for i = 0, childCount - 1 do

        self.itemMuseum.transform.parent:GetChild(i).gameObject:SetActive(false);
    end

    for key, museum in ipairs(museumList) do
        -- 重复利用itemOperateActivity模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemMuseum.gameObject, self.itemMuseum.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemMuseum.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 亲友圈按钮
        local buttonMuseum = GetComponentWithSimple(itemClone, itemClone.name, ComponentTypeName.Button);
        local provinceConf = ModuleCache.PlayModeUtil.getProvinceByAppName(museum.province)
        local playModeConf = PlayModeUtil.getDeepCopyTable(require(provinceConf.modName))
        local gameName = string.split(museum.gameId, "_")[2]
        local playMode = PlayModeUtil.getInfoByGameName(gameName, playModeConf)
        buttonMuseum.onClick:RemoveAllListeners();
        local onClickButtonMuseum = function()
            -- 点击推荐游戏按钮
            self:onClickMuseumButton(provinceConf.id, playMode, museum);
        end
        buttonMuseum.onClick:AddListener(onClickButtonMuseum);
        -- 亲友圈号标签
        local labelMusuemNumber = GetComponentWithSimple(itemClone, "LabelMuseumNumber", ComponentTypeName.Text);
        -- 亲友圈圈名标签
        local labelMusuemName = GetComponentWithSimple(itemClone, "LabelMuseumName", ComponentTypeName.Text);
        -- 亲友圈icon
        local spriteMusuemIcon = GetComponentWithSimple(itemClone, "SpriteMuseumIcon", ComponentTypeName.Image);
        self:image_load_sprite(spriteMusuemIcon, museum.parlorLogo);

        -- 亲友圈号
        labelMusuemNumber.text = "0" .. museum.parlorNum;
        -- 亲友圈名
        labelMusuemName.text = museum.gameName;
    end
end

-- 点击推荐游戏按钮
function OperateView:onClickOperateGameButton(provinceId, playMode)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    -- 请求发送发名单协议
    self.model:sendWhilt(self.module, provinceId, playMode);
end

-- 点击亲友圈按钮
function OperateView:onClickMuseumButton(provinceId, playMode, museum)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

    -- 请求点击亲友圈按钮协议
    self.model:getClickParlor(museum.parlorId);

    local onComplete = function()
        local module = ModuleCache.ModuleManager.show_module("public", "hall");
        -- 打开亲友圈
        --module:get_museum_list();
        ModuleCache.PlayerPrefsManager.SetInt("museumIndex", museum.parlorId)
        ModuleCache.ModuleManager.show_module("public", "chessmuseum")
    end
    -- 请求发送发名单协议
    self.model:sendWhilt(self.module, provinceId, playMode, onComplete);
end

-- 点击运营活动按钮
function OperateView:onClickOperateActivityButton(operateActivity)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    local data = {
        link = operateActivity.url,
        style = 3,
        hide = false
    }
    -- 展示h5界面
    ModuleCache.ModuleManager.show_module("public", "webview", data);
end

-- 点击发行toggle
function OperateView:onToggleOperate(flag, type)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if flag then

        -- 防重复点击
        if self.typeOperate ~= type then
            self.typeOperate = type;
            print("11111===", self.typeOperate);

            -- 亲友圈
            if self.typeOperate == 2 then
                -- 请求获取亲友圈列表协议
                self.model:getParlorList();
            end
        end
    end
end

-- 切换页签
function OperateView:switchToggle()

    -- 推荐游戏
    if self.typeOperate == 1 then

        self.toggleGame.isOn = true;
        self.toggleMuseum.isOn = false;
        -- 亲友圈
    elseif agentType == 2 then

        self.toggleGame.isOn = false;
        self.toggleMuseum.isOn = true;
    end
end

-------------------- 发行翻页---------------------------------

function OperateView:start_auto_play_content(contentInfo)
    contentInfo.autoPlayAdTimeEventID = self:subscibe_time_event(5, false, 0):OnComplete( function(t)
        if (contentInfo.isDraging) then
            return
        end

        if (contentInfo.lastIndex == 1) then
            contentInfo.auto_play_offset = 1
        elseif (contentInfo.lastIndex == #contentInfo.pageSelectImageArray) then
            contentInfo.auto_play_offset = -1
        end
        if (not contentInfo.auto_play_offset) then
            contentInfo.auto_play_offset = 1
        end

        contentInfo.scrollRectContent.horizontalNormalizedPosition = contentInfo.scrollRectContent.horizontalNormalizedPosition + 0.01 * contentInfo.auto_play_offset
        local obj = {}
        if(contentInfo == self.recommendGamesContentInfo)then
            obj.name = 'itemGame'
        end
        self:onBeginDragContent(obj)
        self:onEndDragContent(contentInfo.auto_play_offset, obj)
        self:stop_auto_play_content(contentInfo)
        self:start_auto_play_content(contentInfo)
    end ).id
end

function OperateView:stop_auto_play_content(contentInfo)
    if (contentInfo.autoPlayAdTimeEventID) then
        CSmartTimer:Kill(contentInfo.autoPlayAdTimeEventID)
        contentInfo.autoPlayAdTimeEventID = nil
    end
end

function OperateView:refreshAdContent()

    for key, item in ipairs(self.adItemList) do
        UnityEngine.Object.Destroy(item);
    end

    --    local adSpriteList = { };
    --    for i = 1, 5 do
    --        local adSprite = self.spriteHolder:FindSpriteByName(i .. "");
    --        table.insert(adSpriteList, adSprite);
    --    end

    local adSpriteList = self.operateList.spriteImageList;
    -- 广告图片只有一张,禁止拖拽和隐藏标签
    local isShowTag = true;
    if #adSpriteList == 1 then
        isShowTag = false;
    end
    self.adContentInfo.prefabPageTag.transform.parent.gameObject:SetActive(isShowTag);

    self.adContentInfo.ads = adSpriteList
    self.adContentInfo.gameObjectList = { }
    local len = #adSpriteList
    --local x = len * self.adContentInfo.cellSize.x
    --local y = self.adContentInfo.scrollRectContent.content.sizeDelta.y
    --self.adContentInfo.scrollRectContent.content.sizeDelta = ModuleCache.CustomerUtil.ConvertVector2(x, y)
    self.adContentInfo.pageSelectImageArray = { }

    for i = 1, len do
        local item = ModuleCache.ComponentUtil.InstantiateLocal(self.adContentInfo.prefabItem, self.adContentInfo.content.gameObject)
        item.name = "ad_item"
        --local itemRectTransform = GetComponentWithSimple(item, item.name, ComponentTypeName.RectTransform)
        --itemRectTransform.sizeDelta = Vector2.New(self.rootTransform.sizeDelta.x, self.rootTransform.sizeDelta.y);
        table.insert(self.adItemList, item);
        ModuleCache.TransformUtil.SetX(item.transform, 0, true)
        ModuleCache.TransformUtil.SetY(item.transform, 0, true)
        item:SetActive(true)
        local spriteAD = GetComponentWithSimple(item, item.name, ComponentTypeName.Image);
        spriteAD.sprite = adSpriteList[i];
        spriteAD:SetNativeSize()
        table.insert(self.adContentInfo.gameObjectList, item)


        local pageTag = ModuleCache.ComponentUtil.InstantiateLocal(self.adContentInfo.prefabPageTag, self.adContentInfo.prefabPageTag.transform.parent.gameObject)
        --table.insert(self.adItemList, pageTag);
        pageTag:SetActive(true)
        local imageSelect = ModuleCache.ComponentUtil.GetComponentWithPath(pageTag, "Select", ComponentTypeName.Image)
        table.insert(self.adContentInfo.pageSelectImageArray, imageSelect)
    end
    self.adContentInfo.lastIndex = self.adContentInfo.lastIndex == nil and 1  or self.adContentInfo.lastIndex
    --self:setScrollViewDragStatus(self.adContentInfo)
    --self:refreshPageTag(self.adContentInfo.lastIndex, self.adContentInfo)
end


function OperateView:update()
    self:updateScrollContent(self.recommendGamesContentInfo)
    --self:updateScrollContent(self.adContentInfo)
end

function OperateView:updateScrollContent(contentInfo)
    if contentInfo.isDraging and  #contentInfo.pageSelectImageArray > 1 then
        if (contentInfo.lastIndex == 1 and self:getGestureDir(contentInfo) == GestureType.Left) or
        (contentInfo.lastIndex == #contentInfo.pageSelectImageArray and self:getGestureDir(contentInfo) == GestureType.Right)then
            contentInfo.scrollRectContent.horizontal = true
        end
    end
end

--获取拖拽时手势方向
function OperateView:getGestureDir(contentInfo)
    local lastPosX = ModuleCache.UnityEngine.Input.mousePosition.x;
    if lastPosX - contentInfo.startDragPosX > 0 then
        return GestureType.Right
    elseif lastPosX - contentInfo.startDragPosX < 0 then
        return GestureType.Left
    else
        return GestureType.None
    end
end

function OperateView:onBeginDragContent(obj, arg)
    if(obj.name ~= 'Viewport' and obj.name ~= 'itemGame' and obj.name ~= 'ItemMoreGame')then
        return
    end
    local contentInfo = self.recommendGamesContentInfo
    contentInfo.isDraging = true
    contentInfo.startDragPosX = ModuleCache.UnityEngine.Input.mousePosition.x
end

function OperateView:onDragContent(obj, arg)
    if(obj.name ~= 'Viewport' and obj.name ~= 'itemGame' and obj.name ~= 'ItemMoreGame')then
        return
    end
    local contentInfo = self.recommendGamesContentInfo
    self.onDragDelta = arg.delta
    local targetPos, targetIndex = self:getNearestScrollViewPos(nil, nil, contentInfo)
    self:refreshPageTag(targetIndex, contentInfo)
end




function OperateView:refreshPageTag(targetIndex, contentInfo)
    for i = 1, #contentInfo.pageSelectImageArray do
        if (targetIndex == i) then
            ModuleCache.ComponentUtil.SafeSetActive(contentInfo.pageSelectImageArray[i].gameObject, true)
        else
            ModuleCache.ComponentUtil.SafeSetActive(contentInfo.pageSelectImageArray[i].gameObject, false)
        end
    end

end

function OperateView:onEndDragContent(offsetIndex, obj, arg)
    local get_contentInfo = function()
        if(obj.name ~= 'Viewport' and obj.name ~= 'itemGame' and obj.name ~= 'ItemMoreGame')then
            return
        end
        local contentInfo = self.recommendGamesContentInfo
        return contentInfo
    end
    local contentInfo = get_contentInfo()
    if (not contentInfo or not contentInfo.isDraging) then
        return
    end
    local targetPos, targetIndex, curPos = self:getNearestScrollViewPos(nil, nil, contentInfo)
    local offset = 0
    if (arg and self.onDragDelta.x < 0) then
        if (contentInfo.lastIndex == targetIndex) then
            if (targetPos < curPos) then
                offset = 1
            end
        else

        end
    elseif (arg and self.onDragDelta.x > 0) then
        if (contentInfo.lastIndex == targetIndex) then
            if (targetPos > curPos) then
                offset = -1
            end
        else

        end
    end

    contentInfo.isDraging = false
    targetPos, targetIndex, curPos = self:getNearestScrollViewPos(offsetIndex, offset, contentInfo)
    ModuleCache.CustomerUtil.ToGeterSeterFloat( function()
        local contentInfo = get_contentInfo()
        if not contentInfo then
            print("已经销毁了")
            return
        end
        return contentInfo.scrollRectContent.horizontalNormalizedPosition
    end ,
    function(x)
        if self.isDestroy then
            return
        end
        local contentInfo = get_contentInfo()
        if contentInfo and contentInfo.scrollRectContent then
            contentInfo.scrollRectContent.horizontalNormalizedPosition = x
            if (Util.getPreciseDecimal(x, 3) == Util.getPreciseDecimal(targetPos, 3)) then
                self:refreshPageTag(targetIndex, contentInfo)
                contentInfo.lastIndex = targetIndex
            end
        end
    end ,
    targetPos, 0.2)

    self:setScrollViewDragStatus(contentInfo)
end

--设置广告ScrollView是否禁用拖拽
function OperateView:setScrollViewDragStatus(contentInfo)
    if contentInfo.lastIndex == 1  and contentInfo.lastIndex == #contentInfo.pageSelectImageArray then
        contentInfo.scrollRectContent.horizontal = false
    else
        contentInfo.scrollRectContent.horizontal = true
    end
end


function OperateView:getNearestScrollViewPos(offsetIndex, offset, contentInfo)
    offsetIndex = offsetIndex or 0
    offset = offset or 0
    local curPos = contentInfo.scrollRectContent.horizontalNormalizedPosition
    local minOffset = 1
    local targetPosX = curPos
    local targetIndex = 1
    local len = #contentInfo.gameObjectList
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
-----------------------------------------------------------------


-- 克隆
function OperateView:clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos);
    target.name = obj.name;
    ComponentUtil.SafeSetActive(target, true);
    return target;
end


function OperateView:initThirdGamesView()
    local holder = {}
    holder.root = GetComponentWithPath(self.root, "Center/ThirdGame", ComponentTypeName.Transform).gameObject
    holder.itemPrefab = GetComponentWithPath(holder.root, "ThirdGame/Item", ComponentTypeName.Transform).gameObject
    holder.spriteDefault = GetComponentWithPath(holder.itemPrefab, "icon/bg", ComponentTypeName.Image).sprite
    holder.spriteHolder = GetComponentWithPath(holder.root,"IconSpriteHolder","SpriteHolder")
    holder.itemHolderList = {}
    self.thirdGamesViewHolder = holder
end

function OperateView:refreshThirdGamesView(list)
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
                    JumpManager:openWebGame(holder.data.code, 'Operate')
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

function OperateView:fillItem(item, url)
    local image = ModuleCache.ComponentManager.GetComponent(item, ComponentTypeName.Image)
    self:image_load_sprite(image, url)
end

return OperateView