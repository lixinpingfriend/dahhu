






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local PlayerInfoModule = class("BullFight.PlayerInfoModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local TableManager = TableManager



function PlayerInfoModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "PlayerInfo_view", nil, ...)
end


function PlayerInfoModule:on_show(playerInfo)
    if type(playerInfo) == "number" then
        self.playerId = playerInfo
    else
        self.playerId = playerInfo.playerId
    end

    self.view:hide();

    local onUserInfo = function(userInfo)
        self.view:show();
        if type(playerInfo) == "number" then
            self.playerInfoView:init(userInfo);
        else
            self.playerInfoView:init(playerInfo);
        end

        -- 更新个人签名视图
        self.view:updateSignView(userInfo);
        if(self.playerId..'' == self.modelData.roleData.userID..'')then
            self.view:show_gift_panel(false)
        else
            --暂时屏蔽礼物
            self.view:show_gift_panel(not self._disable_gift)
        end
    end
    self:get_general_data(self.playerId, function (userdata)
        onUserInfo(userdata)
    end)
    -- 获取玩家信息协议
    --self:getUserInfo(self.playerId, onUserInfo);
    self:enable_gift(true)
end

function PlayerInfoModule:enable_gift(show)
    self._disable_gift = not show
    if(self.playerId..'' == self.modelData.roleData.userID..'')then
        self.view:show_gift_panel(false)
    else
        --暂时屏蔽礼物
        self.view:show_gift_panel(not self._disable_gift)
    end
end

function PlayerInfoModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    -- 返回按钮
    if obj == self.view.buttonBack.gameObject or obj == self.view.buttonMask.gameObject then
        ModuleCache.ModuleManager.hide_module("public", "playerinfo");
        return;

        -- 复制按钮
    elseif obj == self.view.buttonCopy.gameObject then
        local playerID = self.view.playerInfo.playerId;
        -- 复制玩家id到剪切板
        ModuleCache.GameSDKInterface:CopyToClipboard(playerID);

        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("复制成功");
    elseif(obj.transform.parent.gameObject == self.view.goGiftPanel or obj.transform.parent.parent.parent.gameObject == self.view.goGiftPanel)then
        print_table(TableManager.curTableData,"~~~~~~1~~~~~~~~~")


        if self.modelData.curTableData then
            print_table(self.modelData.curTableData,"~~~~2~~~~~~~~")
            if(self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0) then
                local rule
                if(self.modelData.curTableData.roomInfo)then
                    rule = self.modelData.curTableData.roomInfo.ruleTable or self.modelData.curTableData.roomInfo.CurRuleTable
                end

                if not rule then
                    rule = ModuleCache.Json.decode(TableManager.curTableData.Rule)
                end

                if not rule.allowInteractiveExpression or rule.allowInteractiveExpression == 1 then
                    self:on_click_gift_btn(obj, arg)
                else
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主禁止发送互动表情。")
                end
            else
                self:on_click_gift_btn(obj, arg)
            end
        else--麻将 跑胡子
            if(TableManager.curTableData.HallID and TableManager.curTableData.HallID > 0) then
                local rule = ModuleCache.Json.decode(TableManager.curTableData.Rule)
                if not rule.allowInteractiveExpression or rule.allowInteractiveExpression == 1 then
                    self:on_click_gift_btn(obj, arg)
                else
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主禁止发送互动表情。")
                end
            else
                self:on_click_gift_btn(obj, arg)
            end
        end
    end
end

function PlayerInfoModule:on_click_gift_btn(obj, arg)
    for i, v in pairs(self.view.giftButtonHolders) do
        if(obj == v.button.gameObject)then
            local data = v.data
            local onFinish = function()
                self:dispatch_package_event("Event_PlayerInfo_SendGift", {receiver = self.playerId, giftName = data.key, times = data.times})
                self.view:set_last_send_time()
                ModuleCache.ModuleManager.hide_module("public", "playerinfo")
            end
            if(data.needGold > 0)then
                --在这里扣费，成功之后发送
                self:request_cost_gold(data.needGold, onFinish)
            else
                onFinish()
            end
        end
    end

end

-- 获取玩家信息协议
function PlayerInfoModule:getUserInfo(playerID, callback)

    local requestData = {
        params =
        {
            uid = playerID,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        cacheDataImmediatelyCallback = true,
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            if callback then
                callback(retData.data);
            end
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end


function PlayerInfoModule:request_cost_gold(goldNum, callback)
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            gameId = ModuleCache.AppData.get_app_and_game_name(),
            coins = goldNum,
            coinType = 8,       --钻石2，金币8
            event = 33,         --表情扣费
        },
        showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "pay/decr?",
    }
    local onResponse = function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.success then
            if callback then
                callback();
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

return PlayerInfoModule



