
local class = require("lib.middleclass");
local View = require('core.mvvm.view_base');
-- ==========================================================================

local ComponentUtil = ModuleCache.ComponentUtil
local BranchPackageName = AppData.BranchRunfastName;
local ModuleCache = ModuleCache;
local ComponentTypeName = ModuleCache.ComponentTypeName;
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple;
local UIHelper = require(string.format("package/%s/module/uihelper/uihelper", BranchPackageName));
local TableRunfastHelper = require(string.format("package/%s/module/tablerunfast/tablerunfast_helper", BranchPackageName));
local CardCommon = require(string.format("package/%s/module/tablerunfast/gamelogic_common", BranchPackageName))
local TableRunfastLogic = require(string.format("package/%s/module/tablerunfast/tablerunfast_logic", BranchPackageName))
local cjson = require("cjson");

---@class CurrentGameAccountView : View
local CurrentGameAccountView = class('CurrentGameAccountView', View);

function CurrentGameAccountView:initialize()
    View.initialize(self, BranchPackageName .. "/module/currentgameaccount/runfast_currentgameaccount.prefab", "RunFast_CurrentGameAccount", 1);
    -- 实例化的所有牌实体字典
    self.pokerTotalDictionary = { };
    -- 玩家item字典
    self.playerItemDictionary = { };
end

-- 初始化
function CurrentGameAccountView:init(modelData)

    -- 销毁数据
    self:destoryData();

    -- 牌桌数据
    self.tableData = modelData.curTableData;

    -- 座位信息列表
    self.seatInfoList = self.tableData.roomInfo.seatInfoList;
    -- 玩家自己的id
    self.myID = self.tableData.roomInfo.mySeatInfo.playerId;

    -- 标题图片
    self.spriteTitle = GetComponentWithSimple(self.root, "SpriteTitle", ComponentTypeName.Image);
    -- 继续游戏图片
    self.spriteContinue = GetComponentWithSimple(self.root, "SpriteContinue", ComponentTypeName.Image);

    -- 继续按钮
    self.buttonContinue = GetComponentWithSimple(self.root, "ButtonContinue", ComponentTypeName.Button);
    self.GoldMatchBtnRoot = GetComponentWithSimple(self.root, "GoldMatchBtnRoot", ComponentTypeName.Transform).gameObject
    self.ButtonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button)
    self.ButtonReady = GetComponentWithSimple(self.root, "ButtonReady", ComponentTypeName.Button)

    -- 玩家信息标签
    self.LabelTopLeft = GetComponentWithSimple(self.root, "LabelTopLeft", ComponentTypeName.Text)
    -- 开始时间标签
    self.labelStartTime = GetComponentWithSimple(self.root, "LabelStartTime", ComponentTypeName.Text);
    -- 结束时间标签
    self.labelEndTime = GetComponentWithSimple(self.root, "LabelEndTime", ComponentTypeName.Text);

    self.resultHolder = GetComponentWithSimple(self.root, "ResultHolder", "SpriteHolder");
    self.cardHolder = GetComponentWithSimple(self.root, "CardHolder", "SpriteHolder");
    -- 玩家数据模板
    self.item = GetComponentWithSimple(self.root, "item", ComponentTypeName.Transform).gameObject;
    --回放节点
    self.PlayBackUIRoot = GetComponentWithSimple(self.root, "PlayBackUIRoot", ComponentTypeName.Transform).gameObject;
    self.PBBtnClose = GetComponentWithSimple(self.root, "PBBtnClose", ComponentTypeName.Button);
    self.PB_ReplayBtn = GetComponentWithSimple(self.root, "PB_ReplayBtn", ComponentTypeName.Button);
    self.PB_StopBtn = GetComponentWithSimple(self.root, "PB_StopBtn", ComponentTypeName.Button);
    self.PB_BackBtn = GetComponentWithSimple(self.root, "PB_BackBtn", ComponentTypeName.Button);
    self.PB_PauseBtn = GetComponentWithSimple(self.root, "PB_PauseBtn", ComponentTypeName.Button);
    self.PB_PlayBtn = GetComponentWithSimple(self.root, "PB_PlayBtn", ComponentTypeName.Button);
    self.PB_ForwardBtn = GetComponentWithSimple(self.root, "PB_ForwardBtn", ComponentTypeName.Button);
    self.TimeDown = GetComponentWithSimple(self.root, "TimeDown", ComponentTypeName.Text)
    ModuleCache.ComponentUtil.SafeSetActive(self.TimeDown.gameObject, false)
    self.LabelScore = GetComponentWithSimple(self.root, "LabelScore", ComponentTypeName.Text)

    -- 更新小结算视图
    self:updateResuleView();
	ModuleCache.ComponentUtil.SafeSetActive(self.item.gameObject,false)
	
	local Manager = require("package.public.module.function_manager")
	self:fixed_tran_size(Manager.FindObject(self.root, "Center"))
end

-- 克隆
function CurrentGameAccountView:clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos);
    target.name = obj.name;
    ComponentUtil.SafeSetActive(target, true);
    return target;
end

-- 根据玩家id获取座位信息
function CurrentGameAccountView:getSeatInfo(playerID)
    local seatInfoList = self.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (tostring(playerID) == tostring(seatInfo.playerId)) then
            return seatInfo;
        end
    end
end

-- 更新小结算视图
function CurrentGameAccountView:updateResuleView()
    if(self.tableData.roomInfo.isGoldSettle) then
        self.LabelScore.text = "金币"
    end
    local TopLeftShowStr = ""
    local isJinBiChang = self.tableData.roomInfo.isJinBiChang
    ModuleCache.ComponentUtil.SafeSetActive(self.GoldMatchBtnRoot.gameObject, isJinBiChang)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonContinue.gameObject, not isJinBiChang)
    if(isJinBiChang) then
        TopLeftShowStr = "经典玩法"
        TopLeftShowStr = TopLeftShowStr  .. " " .. "底分:" .. self.tableData.roomInfo.baseCoinScore
    else
        TopLeftShowStr = TopLeftShowStr .. "房号:" .. self.tableData.roomInfo.roomNum-- 房间号
        TopLeftShowStr = TopLeftShowStr .. " " .. self.tableData.roomInfo.CurTip-- 玩法信息
        TopLeftShowStr = TopLeftShowStr .. " " .. string.format("第%d/%d局", self.tableData.roomInfo.curRoundNum, self.tableData.roomInfo.totalRoundCount)-- 局数
    end
    self.LabelTopLeft.text = TopLeftShowStr 
    
    self.labelStartTime.text = os.date("%Y/%m/%d %H:%M", tonumber(self.tableData.roomInfo.curAccountData.startTime));-- 开始时间
    self.labelEndTime.text = os.date("%Y/%m/%d %H:%M", tonumber(self.tableData.roomInfo.curAccountData.endTime));-- 结束时间

    local spriteContinue = nil;
    -- 大结算
    if self.tableData.roomInfo.curAccountData.is_summary_account then
        spriteContinue = self.resultHolder:FindSpriteByName("total");
    else
        spriteContinue = self.resultHolder:FindSpriteByName("continue");
    end
    -- 继续图片
    self.spriteContinue.sprite = spriteContinue;
    self.spriteContinue:SetNativeSize();
    local red10_player_id = self.tableData.roomInfo.curAccountData.red10_player or 0

    for key, player in ipairs(self.tableData.roomInfo.curAccountData.players) do

        local item = self:clone(self.item.gameObject, self.item.transform.parent.gameObject, Vector3.zero);
        item.name = item.name .. key;
        self.playerItemDictionary[key] = item;

        -- 玩家名字标签
        local labelPlayerName = GetComponentWithSimple(item.gameObject, "LabelPlayerName", ComponentTypeName.Text);
        -- 玩家id标签
        local labelPlayerID = GetComponentWithSimple(item.gameObject, "LabelPlayerID", ComponentTypeName.Text);
        -- 剩余牌数标签
        local labelRemainCardCount = GetComponentWithSimple(item.gameObject, "LabelRemainCardCount", ComponentTypeName.Text);
        -- 炸弹数标签
        local labelBomb = GetComponentWithSimple(item.gameObject, "LabelBomb", ComponentTypeName.Text);

        -- 玩家自己选中背景
        local itemImage = GetComponentWithSimple(item.gameObject, item.name, ComponentTypeName.Image);
        -- 玩家头像
        local spritePlayerImage = GetComponentWithSimple(item.gameObject, "SpritePlayerImage", ComponentTypeName.Image);
        -- 首发图片
        local spriteFirstPlay = GetComponentWithSimple(item.gameObject, "SpriteFirstPlay", ComponentTypeName.Image);
        -- 全关图片
        local spriteQuanguan = GetComponentWithSimple(item.gameObject, "SpriteQuanguan", ComponentTypeName.Image);
        local Red10 = GetComponentWithSimple(item.gameObject, "Red10", ComponentTypeName.Transform).gameObject;
        ModuleCache.ComponentUtil.SafeSetActive(Red10.gameObject, red10_player_id == tonumber(player.player_id))


        local redAtlas = GetComponentWithSimple(item.gameObject, "RedNumbersHolder", "SpriteAtlas");
        local greenAtlas = GetComponentWithSimple(item.gameObject, "GreenNumbersHolder", "SpriteAtlas");

        local textWrapRedScore = GetComponentWithSimple(item.gameObject, "redScore", "TextWrap")
        local GoldRoot = GetComponentWithSimple(item.gameObject, "GoldRoot", ComponentTypeName.Transform).gameObject
        local LoseOver =  GetComponentWithSimple(item.gameObject, "LoseOver", ComponentTypeName.Transform).gameObject
        ModuleCache.ComponentUtil.SafeSetActive(LoseOver.gameObject, false)
        if(isJinBiChang and player.coinBalance and player.coinBalance <= 0) then
            ModuleCache.ComponentUtil.SafeSetActive(LoseOver.gameObject, true)
        end

        local isGoldSettle = self.tableData.roomInfo.isGoldSettle
        ModuleCache.ComponentUtil.SafeSetActive(GoldRoot.gameObject, isGoldSettle)
        ModuleCache.ComponentUtil.SafeSetActive(textWrapRedScore.gameObject, not isGoldSettle)
        local GoldCount = GetComponentWithSimple(item.gameObject, "GoldCount", ComponentTypeName.Text)
        if(isJinBiChang) then
            GoldCount.text = self:GetColorText(player.coin)
        elseif(isGoldSettle) then    
            GoldCount.text = self:GetColorText(player.coin + player.restCoin)
        else
            -- 当前积分为nil,显示0积分
            if player.current_score == nil then
                textWrapRedScore.atlas = redAtlas
                textWrapRedScore.text = "+" .. 0;
            else
                if player.current_score >= 0 then
                    textWrapRedScore.atlas = redAtlas
                    textWrapRedScore.text = "+" .. player.current_score;
                else
                    textWrapRedScore.atlas = greenAtlas;
                    textWrapRedScore.text = player.current_score;
                end
            end
        end


        -- 根据玩家id获取座位信息
        local seatInfo = self:getSeatInfo(player.player_id)
        if(seatInfo) then --玩家信息有,直接赋值
            if seatInfo.playerInfo ~= nil then
                labelPlayerName.text = seatInfo.playerInfo.playerName-- 玩家名字
                if seatInfo.playerInfo.spriteHeadImage ~= nil then-- 玩家头像
                    spritePlayerImage.sprite = seatInfo.playerInfo.spriteHeadImage;
                end
            end
        else
            --玩家信息没有,去拉取
            self:get_userinfo(player.player_id, function(err, playerData)
                print("====拉取finish get userInfo")
                if(err)then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(err)	
                    ModuleCache.ModuleManager.hide_public_module("netprompt")
                    return
                end
                labelPlayerName.text = Util.filterPlayerName(playerData.nickname)-- 玩家名字
                ModuleCache.TextureCacheManager:startDownLoadHeadIcon(playerData.headImg,function (HeadIcon)
                    spritePlayerImage.sprite = HeadIcon
                end)
            end)
        end
  
        
        labelPlayerID.text = "ID:" .. tostring(player.player_id)-- 玩家id
        local roomRule = self.tableData.roomInfo.createRoomRule
        -- 房间初始牌数等于玩家剩余手牌,显示全关图片
        if tonumber(roomRule.init_card_cnt) == tonumber(player.remain_card_cnt) then
            spriteQuanguan.gameObject:SetActive(true);
        else
            spriteQuanguan.gameObject:SetActive(false);
        end

        -- 首发id等于玩法id,显示首发图片
        local firstPlayID = self.tableData.roomInfo.curAccountData.first_player_id;
        if tonumber(firstPlayID) == tonumber(player.player_id) then
            spriteFirstPlay.gameObject:SetActive(true);
        else
            spriteFirstPlay.gameObject:SetActive(false);
        end

        -- 判断是否为自己
        if tonumber(player.player_id) == tonumber(self.myID) then

            local spriteTitle = nil;
            -- 剩余手牌大于0,则本局输
            if player.remain_card_cnt > 0 then
                spriteTitle = self.resultHolder:FindSpriteByName("fail");
                ModuleCache.SoundManager.play_sound(BranchPackageName, BranchPackageName .. "/sound/table/gamelost.bytes", "gamelost")
            else
                spriteTitle = self.resultHolder:FindSpriteByName("win")
                ModuleCache.SoundManager.play_sound(BranchPackageName, BranchPackageName .. "/sound/table/gamewin.bytes", "gamewin")
            end
            -- 标题图片
            self.spriteTitle.sprite = spriteTitle;
            itemImage.enabled = true;
            -- 剩余牌数
            labelRemainCardCount.text = "<color=#fff047>" .. tostring(player.remain_card_cnt) .. "</color>";
            if player.current_bomb_cnt == nil then
                -- 炸弹数
                labelBomb.text = "<color=#fff047>0</color>";
            else
                -- 炸弹数
                labelBomb.text = "<color=#fff047>" .. tostring(player.current_bomb_cnt) .. "</color>";
            end

        else
            itemImage.enabled = false;

            -- 剩余牌数
            labelRemainCardCount.text = tostring(player.remain_card_cnt);
            if player.current_bomb_cnt == nil then
                -- 炸弹数
                labelBomb.text = "0";
            else
                -- 炸弹数
                labelBomb.text = tostring(player.current_bomb_cnt);
            end
        end

        local pokerObjectDictionary = { };
        self.pokerPlayDictionary = { };
        self.pokerPlayList = { };
        self.pokerCurrentGBDictionary = { };
        self.pokerTotalList = { };
        self.pokerUnPlayList = { };
        self.pokerLineGBDictionary = { };
        pokerObjectDictionary["playDictionary"] = self.pokerPlayDictionary;
        pokerObjectDictionary["playList"] = self.pokerPlayList;
        pokerObjectDictionary["pokerGB"] = self.pokerCurrentGBDictionary;
        pokerObjectDictionary["totalList"] = self.pokerTotalList;
        pokerObjectDictionary["unPlayList"] = self.pokerUnPlayList;
        pokerObjectDictionary["pokerLineGB"] = self.pokerLineGBDictionary;
        self.pokerTotalDictionary[key] = pokerObjectDictionary;

        -- 更新牌与牌之间的间距视图
        self:updatePokerSpaceView(item);

        -- 刷新打出的牌视图
        self:updatePlayPokerView(item, player, key);

        -- 刷新没有打出的牌视图
        self:updateUnPlayPokerView(item, player, key);

        -- 刷新关联线视图
        self:updateRelationLineView(item, player, key);
    end
end

-- 更新牌与牌之间的间距视图
function CurrentGameAccountView:updatePokerSpaceView(item)

    -- 打出牌布局
    local pokerPlayLayout = GetComponentWithSimple(item.gameObject, "PokersPlayLayout", ComponentTypeName.GridLayoutGroup);
    -- 未打出牌布局
    local pokerNotPlayLayout = GetComponentWithSimple(item.gameObject, "PokersNotPlayLayout", ComponentTypeName.GridLayoutGroup);

    local playerCount = self.tableData.roomInfo.createRoomRule.playerCount;

    -- 牌与牌间距
    local space = nil;
    -- 玩家为四人
    if playerCount == 4 then

        space = -1.53;
        -- 玩家为三人或两人
    elseif playerCount == 3 or playerCount == 2 then

        space = -12.27;
    end

    pokerPlayLayout.spacing = Vector2.New(space, 0);
    pokerNotPlayLayout.spacing = Vector2.New(space, 0);
end

-- 刷新打出的牌视图
function CurrentGameAccountView:updatePlayPokerView(item, player, index)

    local spritePlayPoker = GetComponentWithSimple(item.gameObject, "SpritePlayPoker", ComponentTypeName.Image);

    -- 反序列化打出的牌数据
    self.pokerPlayDictionary = cjson.decode(player.played_cards);
    self.pokerTotalDictionary[index]["playDictionary"] = self.pokerPlayDictionary;

    local length = 0;
    -- 获取出牌次数
    for key, pokerList in pairs(self.pokerPlayDictionary) do
        length = length + 1;
    end

    -- 因为key为字符串,无法用fori和forp循环
    local index = 0;
    for i = 1, length do

        local pokerList = self.pokerPlayDictionary[tostring(i)];
        if pokerList ~= "PASS" then

            -- 如果是顺子,飞机,连对,进行牌从小到大进行排序
            if #pokerList == 10 then

                pokerList = TableRunfastLogic:PokerListSort(pokerList);
                self.pokerPlayDictionary[tostring(i)] = pokerList;
                -- 如果是三带一对,进行牌从小到大进行排序
            elseif #pokerList == 5 then
                pokerList = TableRunfastLogic:PokerListSort(pokerList);
                self.pokerPlayDictionary[tostring(i)] = pokerList;
            end

            for key1, poker in ipairs(pokerList) do
                -- print("牌号:", poker);
                index = index + 1;
                self.pokerPlayList[index] = poker;
                local playPokerClone = self:clone(spritePlayPoker.gameObject, spritePlayPoker.transform.parent.gameObject, Vector3.zero);
                playPokerClone.name = playPokerClone.name .. poker;
                local spritePlayPokerClone = GetComponentWithSimple(playPokerClone.gameObject, playPokerClone.name, ComponentTypeName.Image);

                local PokerTable = TableRunfastHelper:NumberToPokerTable(poker)
                local sprite = self.cardHolder:FindSpriteByName(PokerTable.SpriteName);
                spritePlayPokerClone.sprite = sprite;

                self.pokerCurrentGBDictionary[poker] = playPokerClone;
            end
        end
    end
end

-- 刷新没有打出的牌视图
function CurrentGameAccountView:updateUnPlayPokerView(item, player, index)

    local spriteNotPlayPoker = GetComponentWithSimple(item.gameObject, "SpriteNotPlayPoker", ComponentTypeName.Image);
    -- 打出牌布局节点
    local pokerPlayLayoutRectTransform = GetComponentWithSimple(item.gameObject, "PokersPlayLayout", ComponentTypeName.RectTransform);
    -- 未打出牌布局节点
    local pokerNotPlayLayoutRectTransform = GetComponentWithSimple(item.gameObject, "PokersNotPlayLayout", ComponentTypeName.RectTransform);


    self.pokerTotalList = cjson.decode(player.cards);
    self.pokerTotalDictionary[index]["totalList"] = self.pokerTotalList;

    local indexTemp = 0;
    -- 帅选出未打出牌的数据列表
    for key, poker in ipairs(self.pokerTotalList) do

        local isUnPlay = true;
        for key1, pokerPlay in ipairs(self.pokerPlayList) do

            if pokerPlay == poker then
                isUnPlay = false;
                break;
            end
        end

        -- 为未打出牌
        if isUnPlay then
            indexTemp = indexTemp + 1;
            self.pokerUnPlayList[indexTemp] = poker;
        end
    end

    if #self.pokerUnPlayList == 0 then

        return;
    end

    -- 未打出的牌由牌小到大排序
    CardCommon.SortAsc(self.pokerUnPlayList);
    -- 延迟一帧改变未选牌布局节点位置
    local callback = function()

        WaitForEndOfFrame();

        local offset = 0;
        local pokerTotalList = self.pokerTotalDictionary[index]["totalList"];
        local pokerUnPlayList = self.pokerTotalDictionary[index]["unPlayList"];
        -- 如果为全关,未出的牌不计算偏移量
        if #pokerUnPlayList == #pokerTotalList then
            offset = 0;
        else
            offset = pokerPlayLayoutRectTransform.rect.width + 14;
        end
        pokerNotPlayLayoutRectTransform.anchoredPosition = Vector2.New(pokerPlayLayoutRectTransform.anchoredPosition.x + offset,
        pokerNotPlayLayoutRectTransform.anchoredPosition.y);
    end
    self:start_unity_coroutine(callback);


    -- 遍历实例化未打出牌预置并显示相对应的牌色
    for key, pokerUnPlay in ipairs(self.pokerUnPlayList) do

        local unPlayPokerClone = self:clone(spriteNotPlayPoker.gameObject, spriteNotPlayPoker.transform.parent.gameObject, Vector3.zero);
        self.pokerTotalDictionary[index]["pokerGB"][pokerUnPlay] = unPlayPokerClone;
        local spriteUnPlayPokerClone = GetComponentWithSimple(unPlayPokerClone.gameObject, unPlayPokerClone.name, ComponentTypeName.Image);

        local poker = TableRunfastHelper:NumberToPokerTable(pokerUnPlay)
        local sprite = self.cardHolder:FindSpriteByName(poker.SpriteName)
        spriteUnPlayPokerClone.sprite = sprite
    end
end

-- 刷新关联线视图
function CurrentGameAccountView:updateRelationLineView(item, player, index)

    local spriteLine = GetComponentWithSimple(item.gameObject, "SpriteLine", ComponentTypeName.Image);

    local callback = function()

        WaitForEndOfFrame();

        local length = 0;
        -- 获取出牌次数
        for key, pokerList in pairs(self.pokerTotalDictionary[index]["playDictionary"]) do
            length = length + 1;
        end

        -- 因为key为字符串,无法用fori和forp循环
        local indexTemp = 0;
        for i = 1, length do

            local pokerList = self.pokerTotalDictionary[index]["playDictionary"][tostring(i)];
            if pokerList ~= "PASS" then

                -- 单次出牌1张以上,才划线
                if #pokerList > 1 then

                    local spriteLineClone = self:clone(spriteLine.gameObject, spriteLine.transform.parent.gameObject, Vector3.zero);
                    indexTemp = indexTemp + 1;
                    self.pokerTotalDictionary[index]["pokerLineGB"][indexTemp] = spriteLineClone;
                    spriteLineClone.name = spriteLineClone.name .. indexTemp;
                    local spriteLineCloneRectTransform = GetComponentWithSimple(spriteLineClone.gameObject, spriteLineClone.name, ComponentTypeName.RectTransform);

                    -- 起始牌实体
                    local startPokerGB = self.pokerTotalDictionary[index]["pokerGB"][pokerList[1]];
                    local startPokerGBRectTransform = GetComponentWithSimple(startPokerGB.gameObject, startPokerGB.name, ComponentTypeName.RectTransform);
                    -- 结束牌位置实体
                    local endPokerGB = self.pokerTotalDictionary[index]["pokerGB"][pokerList[#pokerList]];
                    local endPokerGBRectTransform = GetComponentWithSimple(endPokerGB.gameObject, endPokerGB.name, ComponentTypeName.RectTransform);

                    local spriteLineWidth = endPokerGBRectTransform.anchoredPosition.x - startPokerGBRectTransform.anchoredPosition.x;
                    spriteLineCloneRectTransform.sizeDelta = Vector2.New(spriteLineWidth + 7, spriteLineCloneRectTransform.rect.height);
                    spriteLineCloneRectTransform.transform.position = Vector3.New(startPokerGBRectTransform.transform.position.x - 0.03, spriteLineCloneRectTransform.transform.position.y, 0);
                end
            end
        end
    end
    self:start_unity_coroutine(callback);
end

-- 销毁数据
function CurrentGameAccountView:destoryData()

    if self.playerItemDictionary ~= nil then

        for key, item in ipairs(self.playerItemDictionary) do
            UnityEngine.Object.Destroy(item);
        end

        -- 清空玩家item数据
        self.playerItemDictionary = { };
        -- 清空扑克数据
        self.pokerTotalDictionary = { };
    end
end

function CurrentGameAccountView:GetColorText(count)
    local countStr = Util.filterPlayerGoldNum(count)
    if(count >= 0) then
        return "<color=#E20C0C>".. "+" .. countStr .."</color>"
    else
        return "<color=#02C714>" .. countStr .."</color>"
    end
end

function CurrentGameAccountView:SetTimeDown(showTime)
    ModuleCache.ComponentUtil.SafeSetActive(self.TimeDown.gameObject, true)
    self.TimeDown.text = tostring(showTime)
end

return CurrentGameAccountView