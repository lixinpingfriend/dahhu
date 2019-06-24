
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local BagView = Class('bagView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple

function BagView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/bag/public_bag.prefab", "Public_Bag", 0);
    View.set_1080p(self);

    self.previousBagList = { };

    -- 返回按钮
    self.buttonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Transform).gameObject;

    -- 道具item
    self.item = GetComponentWithSimple(self.root, "item", ComponentTypeName.Transform).gameObject;
    self.item:SetActive(false);

    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");
    self.switcher = GetComponentWithSimple(self.root, "ItemDetailBox", "UIStateSwitcher");

    -- 道具弹框
    self.itemBox = GetComponentWithSimple(self.root, "ItemBox", ComponentTypeName.Transform).gameObject;
    self.itemBox:SetActive(false);

    -- 道具详情弹框
    self.itemDetailBox = GetComponentWithSimple(self.root, "ItemDetailBox", ComponentTypeName.Transform).gameObject;
    self.itemDetailBox:SetActive(false);
    -- 道具详情遮罩按钮
    self.buttonItemDetailBack = GetComponentWithSimple(self.root, "SpriteItemDetailMask", ComponentTypeName.Button);
    -- 道具详情图标
    self.spriteItemDetailIcon = GetComponentWithSimple(self.root, "SpriteItemDetailIcon", ComponentTypeName.Image);
    -- 道具详情名称标签
    self.labelItemDetailName = GetComponentWithSimple(self.root, "LabelItemDetailName", ComponentTypeName.Text);
    -- 道具详情数量标签
    self.labelItemDetailCount = GetComponentWithSimple(self.root, "LabelItemDetailCount", ComponentTypeName.Text);
    -- 道具描述标签
    self.labelItemDetail = GetComponentWithSimple(self.root, "LabelItemDetail", ComponentTypeName.Text);
    -- 道具使用时间标签
    self.labelItemUseTime = GetComponentWithSimple(self.root, "LabelItemUseTime", ComponentTypeName.Text);
    -- 按钮1标签
    self.labelItemDetail1 = GetComponentWithSimple(self.root, "LabelItemDetail1", ComponentTypeName.Text);
    -- 按钮2标签
    self.labelItemDetail2 = GetComponentWithSimple(self.root, "LabelItemDetail2", ComponentTypeName.Text);
    -- 道具详情按钮1
    self.buttonItemDetail1 = GetComponentWithSimple(self.root, "ButtonItemDetail1", ComponentTypeName.Button);
    -- 道具详情按钮2
    self.buttonItemDetail2 = GetComponentWithSimple(self.root, "ButtonItemDetail2", ComponentTypeName.Button);
    -- 把按钮和标签放到列表里,动态更新按钮事件和标签
    self.itemGOList = { };
    self.itemGO1 = { };
    self.itemGO1.button = self.buttonItemDetail1;
    self.itemGO1.label = self.labelItemDetail1;
    self.itemGO2 = { };
    self.itemGO2.button = self.buttonItemDetail2;
    self.itemGO2.label = self.labelItemDetail2;
    table.insert(self.itemGOList, self.itemGO1);
    table.insert(self.itemGOList, self.itemGO2);

    -- 空数据弹框
    self.itemEmptyBox = GetComponentWithSimple(self.root, "ItemEmptyBox", ComponentTypeName.Transform).gameObject;
    self.itemEmptyBox:SetActive(false);

    -- 道具赠送弹框
    self.itemGiveBox = GetComponentWithSimple(self.root, "ItemGiveBox", ComponentTypeName.Transform).gameObject;
    self.itemGiveBox:SetActive(false);
    -- 道具赠送遮罩按钮
    self.buttonItemGiveBack = GetComponentWithSimple(self.root, "SpriteItemGivelMask", ComponentTypeName.Button);
    -- 道具赠送图标
    self.spriteItemGiveIcon = GetComponentWithSimple(self.root, "SpriteItemGiveIcon", ComponentTypeName.Image);
    -- 道具赠送名称标签
    self.labelItemGiveName = GetComponentWithSimple(self.root, "LabelItemGiveName", ComponentTypeName.Text);
    -- 道具赠送数量标签
    self.labelItemGiveCount = GetComponentWithSimple(self.root, "LabelItemGiveCount", ComponentTypeName.Text);
    -- 赠送数量输入框
    self.inputGiveCount = GetComponentWithSimple(self.root, "InputGiveCount", ComponentTypeName.InputField);
    -- 数量减按钮
    self.buttonItemGivePlus = GetComponentWithSimple(self.root, "ButtonItemGivePlus", ComponentTypeName.Button);
    -- 数量加按钮
    self.buttonItemGiveAdd = GetComponentWithSimple(self.root, "ButtonItemGiveAdd", ComponentTypeName.Button);
    -- 全部赠送按钮
    self.buttonItemAllGive = GetComponentWithSimple(self.root, "ButtonItemAllGive", ComponentTypeName.Button);
    -- 玩家id输入框
    self.inputPlayerID = GetComponentWithSimple(self.root, "InputPlayerID", ComponentTypeName.InputField);
    -- 确认赠送按钮
    self.buttonItemGiveSure = GetComponentWithSimple(self.root, "ButtonItemGiveSure", ComponentTypeName.Button);
    -- 减背景
    self.spritePlusBg = GetComponentWithSimple(self.root, "ButtonItemGivePlus", ComponentTypeName.Image);
    -- 减图标
    self.spritePlus = GetComponentWithSimple(self.root, "SpritePlus", ComponentTypeName.Image);
    -- 加背景
    self.spriteAddBg = GetComponentWithSimple(self.root, "ButtonItemGiveAdd", ComponentTypeName.Image);
    -- 加图标
    self.spriteAdd = GetComponentWithSimple(self.root, "SpriteAdd", ComponentTypeName.Image);

    -- 道具赠送弹框
    self.itemGiveSureBox = GetComponentWithSimple(self.root, "ItemGiveSureBox", ComponentTypeName.Transform).gameObject;
    self.itemGiveSureBox:SetActive(false);
    -- 道具确认赠送遮罩按钮
    self.buttonGiveSureBack = GetComponentWithSimple(self.root, "SpriteUserInfoMask", ComponentTypeName.Button);
    -- 取消赠送按钮
    self.buttonUserGiveCancel = GetComponentWithSimple(self.root, "ButtonUserGiveCancel", ComponentTypeName.Button);
    -- 确认赠送按钮
    self.buttonUserGiveSure = GetComponentWithSimple(self.root, "ButtonUserGiveSure", ComponentTypeName.Button);
    -- 玩家名称标签
    self.labelPlayerName = GetComponentWithSimple(self.root, "LabelPlayerName", ComponentTypeName.Text);
    -- 玩家id标签
    self.labelPlayerID = GetComponentWithSimple(self.root, "LabelGiveSurePlayerID", ComponentTypeName.Text);
    -- 玩家头像
    self.spritePlayerIcon = GetComponentWithSimple(self.root, "SpritePlayerIcon", ComponentTypeName.Image);
end

function BagView:init(bagList, module)

    self.bagList = bagList;
    self.model = module.model;
    -- 更新背包视图
    self:updateBagView();
end

-- 更新背包视图
function BagView:updateBagView()

    -- 空数据,显示空数据弹框
    if #self.bagList == 0 then
        self.itemEmptyBox:SetActive(true);
    else
        self.itemEmptyBox:SetActive(false);
    end

    -- 重复利用itemRight模板
    local childCount = self.item.transform.parent.childCount;
    for i = 0, childCount - 1 do

        self.item.transform.parent:GetChild(i).gameObject:SetActive(false);
    end

    -- 去掉上一次的监听
    for key, bag in ipairs(self.previousBagList) do

        local itemClone = self.item.transform.parent:GetChild(key).gameObject;
        local buttonItem = GetComponentWithSimple(itemClone, itemClone.name, ComponentTypeName.Button);
        buttonItem.onClick:RemoveListener(bag.onButtonItem);
    end
    self.previousBagList = self.bagList;

    for key, bag in ipairs(self.bagList) do
        -- 重复利用itemRight模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.item.gameObject, self.item.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.item.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 道具名称标签
        local labelItemName = GetComponentWithSimple(itemClone, "LabelItemName", ComponentTypeName.Text);
        -- 道具图标
        local spriteItemIcon = GetComponentWithSimple(itemClone, "SpriteItemIcon", ComponentTypeName.Image);
        -- 红点图标
        local spriteRed = GetComponentWithSimple(itemClone, "SpriteRed", ComponentTypeName.Image);
        -- 道具数量标签
        local labelItemCount = GetComponentWithSimple(itemClone, "LabelItemCount", ComponentTypeName.Text);
        -- 道具按钮
        local buttonItem = GetComponentWithSimple(itemClone, itemClone.name, ComponentTypeName.Button);
        if bag.onButtonItem == nil then
            local onButtonItem = function()
                -- 点击道具按钮
                self:onClickItemButton(bag);
            end
            -- 动态添加回调
            bag.onButtonItem = onButtonItem;
            buttonItem.onClick:AddListener(onButtonItem);
        end

        -- 道具名字
        labelItemName.text = bag.itemName;
        -- 下载道具图标
        if bag.itemIcon then
            local onDownComplete = function(sprite)
                if not sprite then
                    spriteItemIcon.sprite = self.spriteHolder:FindSpriteByName("itemDefault");
                else
                    spriteItemIcon.sprite = sprite;
                end
            end
            self:image_load_sprite(nil, bag.itemIcon, onDownComplete);
        else
            spriteItemIcon.sprite = self.spriteHolder:FindSpriteByName("itemDefault");
        end
        -- 道具数量
        labelItemCount.text = "×" .. bag.onwerNum;
        -- 是否显示红点
        spriteRed.gameObject:SetActive(bag.highlight);
    end
end

-- 更新道具详情视图
function BagView:updateItemDetailView(bag)

    self.itemDetailBox:SetActive(true);

    -- 下载道具图标
    if bag.itemIcon then
        local onDownComplete = function(sprite)
            if not sprite then
                self.spriteItemDetailIcon.sprite = self.spriteHolder:FindSpriteByName("itemDefault");
            else
                self.spriteItemDetailIcon.sprite = sprite;
            end
        end
        self:image_load_sprite(nil, bag.itemIcon, onDownComplete);
    else
        self.spriteItemDetailIcon.sprite = self.spriteHolder:FindSpriteByName("itemDefault");
    end
    -- 道具名字
    self.labelItemDetailName.text = bag.itemName;
    -- 道具数量
    self.labelItemDetailCount.text = "拥有数量: " .. bag.onwerNum;
    -- 道具描述
    self.labelItemDetail.text = bag.itemDesc;
    -- 道具有效期
    self.labelItemUseTime.text = bag.effectStr;

    -- 分隔按钮类型
    local buttonTypes = Util.split(bag.itemButtonType, ",");
    if not buttonTypes then
        buttonTypes = { };
    end
    print("按钮数量==", #buttonTypes);
    print_table(bag);
    if #buttonTypes == 0 then
        self.switcher:SwitchState("Zero");
        -- 显示一个按钮
    elseif #buttonTypes == 1 then
        self.switcher:SwitchState("One");
        -- 显示两个按钮
    elseif #buttonTypes == 2 then
        self.switcher:SwitchState("Two");
    end

    -- 移除所有按钮回调
    for key, itemGO in ipairs(self.itemGOList) do
        itemGO.button.onClick:RemoveAllListeners();
    end

    for key, buttonTypeString in ipairs(buttonTypes) do
        local buttonType = tonumber(buttonTypeString);

        local onItemDetailButton = function()
            self:onClickItemDetailButton(bag, buttonType);
        end
        self.itemGOList[key].button.onClick:AddListener(onItemDetailButton);

        -- 兑换
        if buttonType == 1  then
            self.itemGOList[key].label.text = "兑换";
            -- 使用
        elseif buttonType == 2 or buttonType == 4 then
            self.itemGOList[key].label.text = "使用";
            -- 赠送
        elseif buttonType == 3 then
            self.itemGOList[key].label.text = "赠送";
        end
    end
end

-- 更新道具赠送视图
function BagView:updateItemGiveView(bag)

    self.itemGiveBox:SetActive(true);
    self.inputPlayerID.text = "";
    self.inputGiveCount.text = "1";

    -- 下载道具图标
    if bag.itemIcon then
        local onDownComplete = function(sprite)
            if not sprite then
                self.spriteItemGiveIcon.sprite = self.spriteHolder:FindSpriteByName("itemDefault");
            else
                self.spriteItemGiveIcon.sprite = sprite;
            end
        end
        self:image_load_sprite(nil, bag.itemIcon, onDownComplete);
    else
        self.spriteItemGiveIcon.sprite = self.spriteHolder:FindSpriteByName("itemDefault");
    end

    -- 道具名字
    self.labelItemGiveName.text = bag.itemName;
    -- 道具数量
    self.labelItemGiveCount.text = "拥有数量: " .. bag.onwerNum;

    local onItemAllGive = function()
        -- 点击全部赠送按钮
        self:onClickItemAllGiveButton(bag);
    end
    self.buttonItemAllGive.onClick:RemoveAllListeners();
    self.buttonItemAllGive.onClick:AddListener(onItemAllGive);

    local onItemGiveSure = function()
        -- 点击赠送弹框中确认赠送按钮
        self:onClickItemGiveSureButton(bag);
    end
    self.buttonItemGiveSure.onClick:RemoveAllListeners();
    self.buttonItemGiveSure.onClick:AddListener(onItemGiveSure);

    local onItemGivePlus = function()
        -- 点击赠送减少按钮
        self:onClickItemGivePlusButton(bag);
    end
    self.buttonItemGivePlus.onClick:RemoveAllListeners();
    self.buttonItemGivePlus.onClick:AddListener(onItemGivePlus);

    local onItemGiveAdd = function()
        -- 点击赠送增加按钮
        self:onClickItemGiveAddButton(bag);
    end
    self.buttonItemGiveAdd.onClick:RemoveAllListeners();
    self.buttonItemGiveAdd.onClick:AddListener(onItemGiveAdd);

    self.bag = bag;
    local onInputGiveCount = function(value)
        -- 道具赠送输入框变化
        self:onInputGiveCountChange(value, bag);
    end
    self.inputGiveCount.onValueChanged:RemoveAllListeners();
    -- 道具赠送输入框变化
    UpdateBeat:Add(self.onInputGiveCountChange, self)
    -- self.inputGiveCount.onValueChanged:AddListener(onInputGiveCount);
end

-- 临时方法
function BagView:removeUpdate()
    -- 道具赠送输入框变化
    UpdateBeat:Remove(self.onInputGiveCountChange, self)
end

-- 更新玩家信息视图
function BagView:updateUserInfoView(bag, userInfo)

    self.itemGiveBox:SetActive(false);
    self.itemGiveSureBox:SetActive(true);
    self:removeUpdate();

    -- 下载道具图标
    if userInfo.headImg then
        local onDownComplete = function(sprite)
            if not sprite then
                self.spritePlayerIcon.sprite = self.spriteHolder:FindSpriteByName("playerDefault");
            else
                self.spritePlayerIcon.sprite = sprite;
            end
        end
        self:image_load_sprite(nil, userInfo.headImg, onDownComplete);
    else
        self.spritePlayerIcon.sprite = self.spriteHolder:FindSpriteByName("playerDefault");
    end

    local onUserGiveSure = function()
        -- 点击玩家信息弹框中确认赠送按钮
        self:onClickUserGiveSureButton(bag, userInfo.userId);
    end
    self.buttonUserGiveSure.onClick:RemoveAllListeners();
    self.buttonUserGiveSure.onClick:AddListener(onUserGiveSure);

    print("玩家信息");
    print_table(userInfo);
    -- 玩家名称
    self.labelPlayerName.text = userInfo.nickname;
    -- 玩家id
    self.labelPlayerID.text = "ID:" .. userInfo.userId;
end

-- 点击道具按钮
function BagView:onClickItemButton(bag)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    -- 有红点
    if bag.highlight then
        -- 请求点击红点协议
        self.model:clickRedPoint(bag.itemId);
    end

    -- 更新道具详情视图
    self:updateItemDetailView(bag);
end

-- 点击道具详情弹框功能按钮
function BagView:onClickItemDetailButton(bag, buttonType)

    print("类型==", buttonType);
    -- 兑换
    if buttonType == 1 then

        ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
        self.itemDetailBox:SetActive(false);

        local token, timestamp = Util.get_tokenAndTimestamp(self.modelData.roleData.userID)
        local gameName = AppData.get_url_game_name(); 
        local urlNew = bag.exchangeUrl .. "&uid=" .. self.modelData.roleData.userID .. "&timestamp=" .. timestamp .. "&token=" .. token .. "&gameName=" .. gameName .. "&apiUrl=" .. Util.encodeURL(ModuleCache.GameManager.netAdress.httpCurApiUrl);
        print("地址==", urlNew);
        local data = {
            link = urlNew,
            style = 3,
            hide = false
        }
        local onBackButton = function()
            -- 获取背包详情协议
            self.model:getBagDetail();
        end
        ModuleCache.ModuleManager.show_module("public", "webview", data):addBackButtonListener(onBackButton);
        --        -- 跳转到网页
        --        UnityEngine.Application.OpenURL(urlNew);
        -- 赠送
    elseif buttonType == 3 then
        ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
        self.itemDetailBox:SetActive(false);

        -- 更新道具赠送视图
        self:updateItemGiveView(bag);
    elseif  buttonType == 4 then
        self.itemDetailBox:SetActive(false)
        local data = {
            callBack = function()
                -- 获取背包详情协议
                self.model:getBagDetail();
            end,
            exchangeId = bag.itemId,
        }
        ModuleCache.ModuleManager.show_public_module("goodsexchange", data)
    end
end

-- 点击全部赠送按钮
function BagView:onClickItemAllGiveButton(bag)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    print("最大道具数量==", bag.onwerNum);
    -- 设置当前道具最大数量
    self.inputGiveCount.text = bag.onwerNum;
end

-- 点击赠送弹框中确认赠送按钮
function BagView:onClickItemGiveSureButton(bag)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    -- 去空格
    local playerIDString = Util.trim(self.inputPlayerID.text);
    local playerID = tonumber(playerIDString);
    if not playerID then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("玩家ID不能为空");
        return;
    end

    -- 设置道具赠送数量
    local itemGiveCount = tonumber(self.inputGiveCount.text);
    bag.giveNum = itemGiveCount;
    -- 获取玩家信息协议
    self.model:getUserInfo(bag, playerID);
end

-- 点击玩家信息弹框中确认赠送按钮
function BagView:onClickUserGiveSureButton(bag, playerID)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button");

    -- 请求赠送道具协议
    self.model:giveItem(bag, playerID);
end

-- 点击赠送减少按钮
function BagView:onClickItemGivePlusButton(bag)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    local currentItemCount = tonumber(self.inputGiveCount.text);
    currentItemCount = currentItemCount - 1;

    if currentItemCount <= 1 then
        currentItemCount = 1;
    end
    -- 设置道具数量
    self.inputGiveCount.text = currentItemCount .. "";
end

-- 点击赠送增加按钮
function BagView:onClickItemGiveAddButton(bag)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    local currentItemCount = tonumber(self.inputGiveCount.text);
    currentItemCount = currentItemCount + 1;

    if currentItemCount >= bag.onwerNum then
        currentItemCount = bag.onwerNum;
    end
    -- 设置道具数量
    self.inputGiveCount.text = currentItemCount .. "";
end

-- 道具赠送输入框变化
function BagView:onInputGiveCountChange()

    local value = self.inputGiveCount.text;
    local currentCount = tonumber(value);
    print("当前数量==", currentCount);
    if not currentCount then
        self.inputGiveCount.text = "1";
        return;
    end
    -- 最小值
    if currentCount <= 1 then
        self.inputGiveCount.text = "1";
        self.spritePlusBg.sprite = self.spriteHolder:FindSpriteByName("buttonGrey");
        self.spritePlus.sprite = self.spriteHolder:FindSpriteByName("plusGrey");
        self.spriteAddBg.sprite = self.spriteHolder:FindSpriteByName("buttonGreen");
        self.spriteAdd.sprite = self.spriteHolder:FindSpriteByName("addGreen");
        -- 最大值
    elseif currentCount >= self.bag.onwerNum then
        self.inputGiveCount.text = self.bag.onwerNum;
        self.spritePlusBg.sprite = self.spriteHolder:FindSpriteByName("buttonGreen");
        self.spritePlus.sprite = self.spriteHolder:FindSpriteByName("plusGreen");
        self.spriteAddBg.sprite = self.spriteHolder:FindSpriteByName("buttonGrey");
        self.spriteAdd.sprite = self.spriteHolder:FindSpriteByName("addGrey");
    else
        self.spritePlusBg.sprite = self.spriteHolder:FindSpriteByName("buttonGreen");
        self.spritePlus.sprite = self.spriteHolder:FindSpriteByName("plusGreen");
        self.spriteAddBg.sprite = self.spriteHolder:FindSpriteByName("buttonGreen");
        self.spriteAdd.sprite = self.spriteHolder:FindSpriteByName("addGreen");
    end
end

-- 克隆
function BagView:clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos);
    target.name = obj.name;
    ComponentUtil.SafeSetActive(target, true);
    return target;
end


return BagView;