
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local PlayerInfoView = Class('playerInfoView', View)
local giftConfig = require('package.public.module.table_gift.gift_config')
local ModuleCache = ModuleCache
local CSmartTimer = ModuleCache.SmartTimer.instance
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath

--self.modeldata.tableCommonData.tableType   --0 房卡场 1 金币场 2 比赛场
function PlayerInfoView:initialize()
    self.modeldata = require("package.public.model.model_data")

    print("--------------self.modeldata.tableCommonData.tableType",self.modeldata.tableCommonData.tableType)
    -- 初始View
    if self.modeldata.tableCommonData.tableType == 1 then
        self._isGoldTable = true
        View.initialize(self, "public/module/playerinfo/public_windowplayerinfo_gold.prefab", "Public_WindowPlayerInfo_Gold", 1)
    else
        self._isGoldTable = false
        View.initialize(self, "public/module/playerinfo/public_windowplayerinfo.prefab", "Public_WindowPlayerInfo", 1)
    end

    View.set_1080p(self)

    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");

    self.buttonBack = GetComponentWithSimple(self.root, "ButtonBack", ComponentTypeName.Button);
    self.buttonMask = GetComponentWithSimple(self.root, "SpriteMask", ComponentTypeName.Button);
    -- 复制按钮
    self.buttonCopy = GetComponentWithSimple(self.root, "ButtonCopy", ComponentTypeName.Button);

    -- 性别图标
    self.spriteMale = GetComponentWithSimple(self.root, "SpriteMale", ComponentTypeName.Image);
    -- 头像图标
    self.spriteAvatar = GetComponentWithSimple(self.root, "SpriteAvatar", ComponentTypeName.Image);
    -- 玩家名字标签
    self.labelName = GetComponentWithSimple(self.root, "LabelName", ComponentTypeName.Text);
    -- 玩家id标签
    self.labelID = GetComponentWithSimple(self.root, "LabelID", ComponentTypeName.Text);
    -- ip标签
    self.labelIP = GetComponentWithSimple(self.root, "LabelIP", ComponentTypeName.Text);
    -- 位置标签
    self.labelLocationDoc = GetComponentWithSimple(self.root, "LabelLocationDoc", ComponentTypeName.Text);
    self.labelLocation = GetComponentWithSimple(self.root, "LabelLocation", ComponentTypeName.Text);
    -- 签名输入框
    self.inputSign = GetComponentWithSimple(self.root, "InputSign", ComponentTypeName.InputField);
    self.inputSign.interactable = false;


    self.LabelSign_gold = GetComponentWithSimple(self.root, "LabelSign_gold", ComponentTypeName.Text);
    self.duijushu_Text = GetComponentWithSimple(self.root, "duijushu_Text", ComponentTypeName.Text);
    self.shenglv_Text = GetComponentWithSimple(self.root, "shenglv_Text", ComponentTypeName.Text);
    self.zuigaofanshu_Text = GetComponentWithSimple(self.root, "zuigaofanshu_Text", ComponentTypeName.Text);


    self.goGiftPanel = GetComponentWithSimple(self.root, "Gifts", ComponentTypeName.Transform).gameObject
    self.giftButtonHolders = {}
    local configTable = giftConfig.get_gift_config()
    self.gift_buttonNames = {
        ButtonRose = configTable['rose'],
        ButtonRing = configTable['ring'],
        ButtonBomb = configTable['bomb'],
        ButtonEgg = configTable['egg'],
        ButtonBrick = configTable['brick'],
        ButtonKiss = configTable['kiss'],
        ButtonZhuoJi = configTable['zhuoji'],
        ButtonBingDong = configTable['bingdong'],
        ButtonGuiLian = configTable['guilian'],
    }
    for i, v in pairs(self.gift_buttonNames) do
        local holder = {}
        holder.data = v
        holder.button = GetComponentWithSimple(self.goGiftPanel, i, ComponentTypeName.Button)
        holder.mask = GetComponentWithSimple(holder.button.gameObject, 'Mask', ComponentTypeName.Image)
        holder.priceLab = GetComponentWithPath(holder.button.gameObject, 'Text', ComponentTypeName.Text)
        holder.timesLab = GetComponentWithPath(holder.button.gameObject, 'Times/Text', ComponentTypeName.Text)
        if(holder.priceLab)then
            if(v.needGold > 0)then
                holder.priceLab.text = string.format('%d金币', v.needGold)
            else
                holder.priceLab.text = '免费'
            end
        end
        if(holder.timesLab)then
            if(v.times and v.times > 1)then
                holder.timesLab.text = string.format('%d连发', v.times)
                ModuleCache.ComponentUtil.SafeSetActive(holder.timesLab.transform.parent.gameObject, true)
            else
                ModuleCache.ComponentUtil.SafeSetActive(holder.timesLab.transform.parent.gameObject, false)
            end
        end
        if(self._isGoldTable)then
            ModuleCache.ComponentUtil.SafeSetActive(holder.button.gameObject, v.enabledInGoldTable)
        else
            ModuleCache.ComponentUtil.SafeSetActive(holder.button.gameObject, v.enabledInCommonTable)
        end

        self.giftButtonHolders[i] = holder
    end

    print("牌桌类型：",self.modeldata.tableCommonData.tableType )
    if self.modeldata.tableCommonData.tableType == 1 then
        self.labelID.gameObject:SetActive(false)
        self.labelIP.gameObject:SetActive(false)
        self.labelLocationDoc.gameObject:SetActive(false)
        self.labelLocation.gameObject:SetActive(false)
    end
end

function PlayerInfoView:init(playerInfo)

    self.playerInfo = playerInfo;
    if self.modeldata.tableCommonData.tableType == 1 then
        self:get_general_data(playerInfo.playerId or playerInfo.userId, function (userdata)
            self.playerInfo.winCount = userdata.winCount
            self.playerInfo.lostCount = userdata.lostCount
            self.playerInfo.tieCount = userdata.tieCount
            self.playerInfo.maxMultiple = userdata.maxMultiple
            self.playerInfo.duijushu = userdata.winCount + userdata.lostCount+ userdata.tieCount

            -- 更新玩家信息视图
            self:updatePlayerInfoView();
        end)
        --self:get_userinfo(playerInfo.playerId or playerInfo.userId, function(data)
        --    print_table(data,"--------------")
        --    self.playerInfo.winCount = data.winCount
        --    self.playerInfo.lostCount = data.lostCount
        --    self.playerInfo.tieCount = data.tieCount
        --    self.playerInfo.maxMultiple = data.maxMultiple
        --    self.playerInfo.duijushu = data.winCount + data.lostCount+ data.tieCount
        --
        --    -- 更新玩家信息视图
        --    self:updatePlayerInfoView();
        --end )
    else
        -- 用户信息

        -- 更新玩家信息视图
        self:updatePlayerInfoView();
    end

end

function PlayerInfoView:get_userinfo(playerId, callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = playerId,
        },
        cacheDataKey = "user/info?uid=" .. playerId,
        cacheDataImmediatelyCallback = true,
    }

    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            --OK
            callback( retData.data)
        else

        end
    end, function(error)
        print(error.error)

    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then
            --OK
            callback(retData.data)
        else

        end
    end)

end

function PlayerInfoView:show_gift_panel(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.goGiftPanel, show or false)
    if (show) then
        local lastSendTimestamp = self:get_last_send_time()
        local interval = os.time() - lastSendTimestamp
        local realTime = UnityEngine.Time.realtimeSinceStartup
        local lastSendTime = realTime - interval
        local coolTime = 15
        if (interval < coolTime) then
            for i, v in pairs(self.giftButtonHolders) do
                local holder = v
                if (holder.timeEventId) then
                    CSmartTimer:Kill(holder.timeEventId)
                    holder.timeEventId = nil
                end
                self:set_gift_btn_mask(holder, 1)
                local timeEvent = self:subscibe_time_event(coolTime - interval, false, 1):SetIntervalTime(0.01):OnUpdate(function()
                    local val = UnityEngine.Time.realtimeSinceStartup - lastSendTime
                    val = 1 - val / coolTime
                    self:set_gift_btn_mask(holder, val)
                end)                  :OnComplete(function(t)
                    self:set_gift_btn_mask(holder, 0)
                end)
                holder.timeEventId = timeEvent.id
            end
        else
            for i, v in pairs(self.giftButtonHolders) do
                local holder = v
                if (holder.timeEventId) then
                    CSmartTimer:Kill(holder.timeEventId)
                    holder.timeEventId = nil
                end
                self:set_gift_btn_mask(holder, 0)
            end
        end
    end
end

function PlayerInfoView:set_gift_btn_mask(holder, val)
    if(holder.data.hasCoolTime)then
        if (val <= 0) then
            holder.button.enabled = true
            holder.mask.fillAmount = 0
        else
            holder.button.enabled = false
            holder.mask.fillAmount = math.min(1, val)
        end
    end
end

function PlayerInfoView:get_last_send_time()
    return ModuleCache.PlayerPrefsManager.GetInt("Last_Send_Gift_Timestamp", 0)
end

function PlayerInfoView:set_last_send_time(time)
    time = time or os.time()
    return ModuleCache.PlayerPrefsManager.SetInt("Last_Send_Gift_Timestamp", time)
end

-- 更新玩家信息视图
function PlayerInfoView:updatePlayerInfoView()

    self.inputSign.text = "";
    -- 过滤玩家名字
    -- local filterPlayerName = Util.filterPlayerName(self.userInfo.nickname, 10);
    -- 玩家名字
    print_table(self.playerInfo, "wanjia shu ju")
    if (self.playerInfo.textPlayerName) then
        self.labelName.text = Util.filterPlayerName(self.playerInfo.textPlayerName.text, 10, self.playerInfo.isRedName)
    elseif self.playerInfo.nickname then
        self.labelName.text = Util.filterPlayerName(self.playerInfo.nickname, 10, self.playerInfo.isRedName)
    else
        self.labelName.text = Util.filterPlayerName(self.playerInfo.playerName, 10, self.playerInfo.isRedName)
    end
    -- 玩家id
    if self.playerInfo.playerId then
        self.labelID.text = "ID:" .. self.playerInfo.playerId
    else
        self.labelID.text = "ID:" .. self.playerInfo.userId
    end

    -- 玩家头像
    if (self.playerInfo.imagePlayerHead) then
        self.spriteAvatar.sprite = self.playerInfo.imagePlayerHead.sprite
    elseif (self.playerInfo.spriteHeadImage) then
        self.spriteAvatar.sprite = self.playerInfo.spriteHeadImage
    else
        self:image_load_sprite(self.spriteAvatar, self.playerInfo.headImg)
    end

    local locationData = self.playerInfo.locationData;
    if (locationData) then
        if (locationData.address) then
            self.labelLocation.text = self:format_location_address(locationData.address)
        else
            self.labelLocation.text = "位置获取失败";
        end
    else
        self.labelLocation.text = "位置获取中";
    end
    local isGoldRoomType = TableManager:cur_game_is_gold_room_type()
    ModuleCache.ComponentUtil.SafeSetActive(self.labelLocationDoc.gameObject, not isGoldRoomType)
    ModuleCache.ComponentUtil.SafeSetActive(self.labelLocation.gameObject, not isGoldRoomType)
    -- ip
    if (self.playerInfo.ip) and type(self.playerInfo.ip) == "string" and (not isGoldRoomType) then
        self.labelIP.text = "IP:" .. self.playerInfo.ip;
    else
        self.labelIP.text = "";
    end

    -- 男
    if self.playerInfo.gender == 1 then
        self.spriteMale.sprite = self.spriteHolder:FindSpriteByName("male");
        -- 女
    elseif self.playerInfo.gender == 2 then
        self.spriteMale.sprite = self.spriteHolder:FindSpriteByName("female");
    end

    if self.modeldata.tableCommonData.tableType == 1 then
        
        self.duijushu_Text.text = self.playerInfo.duijushu
        self.shenglv_Text.text = string.format( "%.2f",((self.playerInfo.winCount / self.playerInfo.duijushu) *100)..""  ).."%"
        if self.playerInfo.duijushu == 0 then
            self.shenglv_Text.text = "0.00%"
        end
        self.zuigaofanshu_Text.text = self.playerInfo.maxMultiple or "0"
    end

end



function PlayerInfoView:format_location_address(address)
    local str = address
    local startPos, endPos = string.find(address, '市')
    if (endPos and endPos > 1) then
        str = string.sub(address, 1, endPos)
    end
    --print(address, startPos, endPos, str)
    return str
end

-- 更新个人签名视图
function PlayerInfoView:updateSignView(userInfo)

    -- 签名数据不为空,更新签名数据
    if userInfo.signature ~= "" then
        self.inputSign.text = userInfo.signature;

        if self.LabelSign_gold then
            self.LabelSign_gold.text ="个性签名：".. userInfo.signature;
        end

    else
        if self.LabelSign_gold then
            self.LabelSign_gold.text = "个性签名：这个人很懒，什么都没留下...";
        end
    end
end

return PlayerInfoView