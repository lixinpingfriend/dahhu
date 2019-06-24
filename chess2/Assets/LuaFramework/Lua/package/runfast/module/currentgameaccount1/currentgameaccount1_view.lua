
local class = require("lib.middleclass");
local View = require('core.mvvm.view_base');
-- ==========================================================================

local ComponentUtil = ModuleCache.ComponentUtil
local BranchPackageName = AppData.BranchRunfastName;
local ModuleCache = ModuleCache;
local ComponentTypeName = ModuleCache.ComponentTypeName;
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple;
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local cjson = require("cjson");

local CurrentGameAccount1View = class('CurrentGameAccount1View', View);
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
function CurrentGameAccount1View:initialize()
    View.initialize(self, BranchPackageName .. "/module/currentgameaccount1/runfast_currentgameaccount1.prefab", "RunFast_CurrentGameAccount1", 1,nil,2);
    View.set_1080p(self);
    -----------------------------结算------------------------

    self.BtnContinue = GetComponentWithSimple(self.root, "BtnContinue", ComponentTypeName.Button)  -- 继续按钮
    self.BtnContinueGray = GetComponentWithSimple(self.root, "BtnContinueGray", ComponentTypeName.Button)
    self.BtnHuanZhuo = GetComponentWithSimple(self.root, "BtnHuanZhuo", ComponentTypeName.Button)        --换桌按钮
    self.BtnHuanZhuoGray = GetComponentWithSimple(self.root, "BtnHuanZhuoGray", ComponentTypeName.Button)
    self.BtnUIStateSwitcher = GetComponentWithSimple(self.root,"BtnUIStateSwitcher","UIStateSwitcher")
    self.ButtonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button)          -- 返回按钮
    self.ButtonBack.gameObject:SetActive(false);
    self.spriteTitle = GetComponentWithSimple(self.root, "SpriteTitle", ComponentTypeName.Image)         --标题图片
    self.labelContinue = GetComponentWithSimple(self.root, "LabelContinue", ComponentTypeName.Text)      --继续标签
    self.LabelMultiple = GetComponentWithSimple(self.root, "LabelMultiple", ComponentTypeName.Text)         --倍数
    self.LabelServicePrice = GetComponentWithSimple(self.root, "LabelServicePrice", ComponentTypeName.Text) --服务费
    self.holder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder")
    self.switcher = GetComponentWithSimple(self.root, "LineSwitcher", "UIStateSwitcher")

    self.itemResultList = { }
    for i = 1, 3 do
        self.itemResultList[i] = GetComponentWithSimple(self.root, "itemResult" .. i, ComponentTypeName.Transform).gameObject;
    end

    -- 特效画布
    self.effectCanvas = GetComponentWithSimple(self.root, "SpriteTitle", ComponentTypeName.Canvas);
    self.failEffect1 = GetComponentWithSimple(self.root, "shibai", "UnityEngine.Renderer");
    self.failEffect2 = GetComponentWithSimple(self.root, "yun", "UnityEngine.Renderer");
    self.failEffect3 = GetComponentWithSimple(self.root, "shandian_1", "UnityEngine.Renderer");
    self.failEffect4 = GetComponentWithSimple(self.root, "shandian_2", "UnityEngine.Renderer");
    self.failEffect5 = GetComponentWithSimple(self.root, "shandian_3", "UnityEngine.Renderer");
    self.failEffect6 = GetComponentWithSimple(self.root, "yushui", "UnityEngine.Renderer");
    self.failEffect7 = GetComponentWithSimple(self.root, "yushui_1", "UnityEngine.Renderer");
    self.failEffect8 = GetComponentWithSimple(self.root, "lizi", "UnityEngine.Renderer");

    self.winEffect1 = GetComponentWithSimple(self.root, "shengli", "UnityEngine.Renderer");
    self.winEffect2 = GetComponentWithSimple(self.root, "jinbi", "UnityEngine.Renderer");
    self.winEffect3 = GetComponentWithSimple(self.root, "Effect_3", "UnityEngine.Renderer");
    self.winEffect4 = GetComponentWithSimple(self.root, "wenli", "UnityEngine.Renderer");
    self.winEffect5 = GetComponentWithSimple(self.root, "lizi", "UnityEngine.Renderer");
    self.winEffect6 = GetComponentWithSimple(self.root, "xingxing_2", "UnityEngine.Renderer");
end

function CurrentGameAccount1View:setSortOrder()
    self.effectCanvas.sortingOrder = self.effectCanvas.sortingOrder + self.canvas.sortingOrder + 1;
    self.failEffect1.sortingOrder = self.failEffect1.sortingOrder + self.canvas.sortingOrder + 2;
    self.failEffect2.sortingOrder = self.failEffect2.sortingOrder + self.canvas.sortingOrder + 2;
    self.failEffect3.sortingOrder = self.failEffect3.sortingOrder + self.canvas.sortingOrder + 2;
    self.failEffect4.sortingOrder = self.failEffect4.sortingOrder + self.canvas.sortingOrder + 2;
    self.failEffect5.sortingOrder = self.failEffect5.sortingOrder + self.canvas.sortingOrder + 2;
    self.failEffect6.sortingOrder = self.failEffect6.sortingOrder + self.canvas.sortingOrder + 2;
    self.failEffect7.sortingOrder = self.failEffect7.sortingOrder + self.canvas.sortingOrder + 2;
    self.failEffect8.sortingOrder = self.failEffect8.sortingOrder + self.canvas.sortingOrder + 2;

    self.winEffect1.sortingOrder = self.winEffect1.sortingOrder + self.canvas.sortingOrder + 2;
    self.winEffect2.sortingOrder = self.winEffect2.sortingOrder + self.canvas.sortingOrder + 2;
    self.winEffect3.sortingOrder = self.winEffect3.sortingOrder + self.canvas.sortingOrder + 2;
    self.winEffect4.sortingOrder = self.winEffect4.sortingOrder + self.canvas.sortingOrder + 2;
    self.winEffect5.sortingOrder = self.winEffect5.sortingOrder + self.canvas.sortingOrder + 2;
    self.winEffect6.sortingOrder = self.winEffect6.sortingOrder + self.canvas.sortingOrder + 2;
end

-- 初始化
function CurrentGameAccount1View:init(modelData)
    -- 牌桌数据
    self.tableData = modelData.curTableData;
    -- 座位信息列表
    self.seatInfoList = self.tableData.roomInfo.seatInfoList;
    -- 玩家自己的id
    self.myID = tonumber(self.tableData.roomInfo.mySeatInfo.playerId)
    -- 牌桌类型 0=房卡场 1=金币场 2=比赛场
    self.tableType = modelData.tableCommonData.tableType;
    -- 更新结算视图
    self:updateResultView();
    -- 更新按钮视图
    self:updateButtonView();
end

-- 更新结算视图
function CurrentGameAccount1View:updateResultView()
    local roomInfo = self.modelData.curTableData.roomInfo
    local Rule = roomInfo.createRoomRule
    self.LabelMultiple.text = "×1"
    self.LabelServicePrice.text = roomInfo.feeNum

    local curRound_winner_id = self.tableData.roomInfo.curAccountData.winner_id --本局赢家id
    print("==服务器发来的赢家id=",tostring(curRound_winner_id))

    local players = self.tableData.roomInfo.curAccountData.players;
    -- 自己排在最前面
    for i = 1, #players do
        if tonumber(players[i].player_id) == self.myID then
            local temp = players[1]
            players[1] = players[i]
            players[i] = temp
            break
        end
    end

    for i = 1, #players do
        local data = players[i]
        local itemGo = self.itemResultList[i]
        local isMyself = (i == 1)
        local HeadImage = GetComponentWithPath(itemGo, "Avatar/Mask/Image", ComponentTypeName.Image)
        local LabelPlayerName = nil
        local SpriteQuanguan = nil
        local RetainCardCount = nil

        if(isMyself)then
            --print("==自己")
            self.IsMyselfWin = data.remain_card_cnt <= 0 or (curRound_winner_id > 0 and curRound_winner_id == data.player_id)
            LabelPlayerName = GetComponentWithPath(itemGo,"MyselfRoot/LabelPlayerName", ComponentTypeName.Text)
            SpriteQuanguan = GetComponentWithPath(itemGo,"MyselfRoot/LabelPlayerName/SpriteQuanguan", ComponentTypeName.Image)
            RetainCardCount = GetComponentWithPath(itemGo,"MyselfRoot/RetainCardRoot/RetainCardCount", ComponentTypeName.Text)
            local SpriteGoldIcon = GetComponentWithPath(itemGo,"MyselfRoot/SpriteGoldBg/SpriteGoldIcon", ComponentTypeName.Image)
            local GoldCountAdd = GetComponentWithPath(itemGo,"MyselfRoot/SpriteGoldBg/GoldCountAdd",ComponentTypeName.Text)
            local GoldCountReduce = GetComponentWithPath(itemGo,"MyselfRoot/SpriteGoldBg/GoldCountReduce",ComponentTypeName.Text)
            local LostAllGo = GetComponentWithPath(itemGo,"MyselfRoot/LostAll", ComponentTypeName.Transform).gameObject
            ModuleCache.ComponentUtil.SafeSetActive(SpriteGoldIcon.gameObject,self:isJinBiChang())
            if(self:isJinBiChang()) then
                GoldCountAdd.gameObject:SetActive(data.coin >= 0)
                GoldCountReduce.gameObject:SetActive(data.coin < 0)
                local lable = data.coin >= 0 and GoldCountAdd or GoldCountReduce
                self:SetLableFilterCount(lable,data.coin)
                ModuleCache.ComponentUtil.SafeSetActive(LostAllGo,data.coinBalance <= 0)
            else
                GoldCountAdd.gameObject:SetActive(data.current_score >= 0)
                GoldCountReduce.gameObject:SetActive(data.current_score < 0)
                data.current_score = data.current_score or 0
                local lable = data.current_score >= 0 and GoldCountAdd or GoldCountReduce
                self:SetLableFilterCount(lable,data.current_score)
                ModuleCache.ComponentUtil.SafeSetActive(LostAllGo,false)
            end
        else
            --print("==别人")
            LabelPlayerName = GetComponentWithPath(itemGo,"OthersRoot/LabelPlayerName", ComponentTypeName.Text)
            SpriteQuanguan = GetComponentWithPath(itemGo,"OthersRoot/LabelPlayerName/SpriteQuanguan", ComponentTypeName.Image)
            RetainCardCount = GetComponentWithPath(itemGo,"OthersRoot/RetainCardRoot/RetainCardCount", ComponentTypeName.Text)
            local SpriteGoldIcon = GetComponentWithPath(itemGo,"OthersRoot/CurrencyCount/Icon", ComponentTypeName.Image)
            local CurrencyCount = GetComponentWithPath(itemGo,"OthersRoot/CurrencyCount", ComponentTypeName.Text)
            local LostAllGo = GetComponentWithPath(itemGo,"OthersRoot/LostAll", ComponentTypeName.Transform).gameObject
            ModuleCache.ComponentUtil.SafeSetActive(SpriteGoldIcon.gameObject,self:isJinBiChang())
            self:SetLableFilterCount(CurrencyCount,self:isJinBiChang() and data.coin or data.current_score)
            ModuleCache.ComponentUtil.SafeSetActive(LostAllGo,self:isJinBiChang() and data.coinBalance <= 0)
        end

        RetainCardCount.text = data.remain_card_cnt
        local isQuanguan = Rule.init_card_cnt == data.remain_card_cnt
        ModuleCache.ComponentUtil.SafeSetActive(SpriteQuanguan.gameObject,isQuanguan)

        local seatInfo = self:getSeatInfo(data.player_id)
        if(seatInfo and seatInfo.playerInfo) then
            LabelPlayerName.text = self:FilterPlayerName(seatInfo.playerInfo.playerName)
            if seatInfo.playerInfo.spriteHeadImage  then
                HeadImage.sprite = seatInfo.playerInfo.spriteHeadImage
            end
        else
            --print("====拉取finish get userInfo")
            self:get_userinfo(data.player_id, function(err, playerData)
                if (err) then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(err)
                    ModuleCache.ModuleManager.hide_public_module("netprompt")
                    return
                end
                LabelPlayerName.text = self:FilterPlayerName(playerData.nickname,10)
            end)
        end
    end

    local spriteTitle = nil
    if(self.IsMyselfWin) then
        spriteTitle = self.holder:FindSpriteByName("win")
        ModuleCache.SoundManager.play_sound(BranchPackageName, BranchPackageName .. "/sound/table/gamewin.bytes", "gamewin")
        self.switcher:SwitchState("Win")
    else
        spriteTitle = self.holder:FindSpriteByName("fail");
        ModuleCache.SoundManager.play_sound(BranchPackageName, BranchPackageName .. "/sound/table/gamelost.bytes", "gamelost")
        self.switcher:SwitchState("Fail")
    end
    self.spriteTitle.sprite = spriteTitle
    self.spriteTitle:SetNativeSize()
end

-- 更新按钮视图
function CurrentGameAccount1View:updateButtonView()
    local isShowBackButton = false
    local BtnUIStateSwitcherType = "Continue"

    if(self:isJinBiChang()) then
        isShowBackButton = true
        BtnUIStateSwitcherType = "ContinueAndHuanZhuo"
    end
    self.BtnUIStateSwitcher:SwitchState(BtnUIStateSwitcherType)
    self.ButtonBack.gameObject:SetActive(isShowBackButton)
end


-- 根据玩家id获取座位信息
function CurrentGameAccount1View:getSeatInfo(playerID)
    local seatInfoList = self.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (tostring(playerID) == tostring(seatInfo.playerId)) then
            return seatInfo;
        end
    end
end

-- 通过玩家id获取玩家结算信息
function CurrentGameAccount1View:getPlayerResultByPlayerID(playerID)
    local playerResult = nil;
    for key, player in ipairs(self.tableData.roomInfo.curAccountData.players) do
        if tonumber(player.player_id) == tonumber(playerID) then
            playerResult = player;
            return playerResult;
        end
    end
    return playerResult;
end

-- 是否自己被淘汰
function CurrentGameAccount1View:isMyselfOut()
    local isMyselfOunt = false;
    -- 通过玩家id获取玩家结算信息
    local myResult = self:getPlayerResultByPlayerID(self.myID);
    -- 被淘汰
    if myResult.matchInfo.isKnockout then
        isMyselfOunt = true;
    end
    return isMyselfOunt;
end

function CurrentGameAccount1View:isHaoYouChang()
    --print("==好友场")
    return self.tableType == 0
end

function CurrentGameAccount1View:isJinBiChang()
    --print("==金币场")
    return self.tableType == 1
end

function CurrentGameAccount1View:isBiSaiChang()
    --print("==比赛场")
    return self.tableType == 2
end

function CurrentGameAccount1View:SetLableFilterCount(Lable,Count)
    Lable.text = self:FilterCount(Count)
end

function CurrentGameAccount1View:FilterCount(Count)
    Count = Count or 0
    local Res = Util.filterPlayerGoldNum(Count)
    if(Count >= 0) then
        Res = "+" .. Res
    end
    return Res
end

function CurrentGameAccount1View:FilterPlayerName(name)
    return Util.filterPlayerName(name,10)
end

function CurrentGameAccount1View:SetState_BtnContinueGray(IsShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnContinueGray.gameObject,IsShow)
end

function CurrentGameAccount1View:SetState_BtnHuanZhuoGray(IsShow)
    ModuleCache.ComponentUtil.SafeSetActive(self.BtnHuanZhuoGray.gameObject,IsShow)
end


return CurrentGameAccount1View;