local BranchPackageName = AppData.BranchRunfastName
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local CurrentGameAccount1Module = class("CurrentGameAccount1Module", ModuleBase)

local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local CSmartTimer = ModuleCache.SmartTimer.instance;
local MatchingManager = require("package.public.matching_manager");

function CurrentGameAccount1Module:initialize(...)
    ModuleBase.initialize(self, "currentgameaccount1_view", nil, ...)
end

function CurrentGameAccount1Module:on_show(data)
    self.view:hide()
    self.view:init(self.modelData);

    -- 动态sortOrder赋值
    self.view:setSortOrder();
    self.view:show(true)
    -- 自动处理器
    self:autoHandler();
    self:dispatch_module_event("currentgameaccount", "Event_SetAudioMusic", 6)
end

-- 绑定module层的交互事件
function CurrentGameAccount1Module:on_module_event_bind()
    self:subscibe_package_event("Event_Click_BtnClose", function(eventHead, eventData)
        if self.isHide then
            return
        end
        print("退出结算，回到大厅")
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount1", function()
            if self.timerID then
                CSmartTimer:Kill(self.timerID);
                self.timerID = nil;
            end
            self:backHall()
        end)

    end)

end

function CurrentGameAccount1Module:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    -- 继续按钮
    if obj == self.view.BtnContinue.gameObject then
        if self.timerID then
            CSmartTimer:Kill(self.timerID);
            self.timerID = nil;
        end

        -- 继续游戏
        self:continueGame();
    elseif obj == self.view.BtnHuanZhuo.gameObject then
        self:dispatch_module_event("table", "Event_AccountClearTable")
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount1")
        self:dispatch_module_event("currentgameaccount", "Event_HuanZhuo")
    elseif obj.name == "ButtonBack" then
        self:dispatch_module_event("table", "Event_AccountClearTable")
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount1")
        self:dispatch_package_event("Event_RoomSetting_LeaveRoom")
    end
end

-- 继续游戏
function CurrentGameAccount1Module:continueGame()

    -- 好友场或金币场
    if self.view.tableType == 0 or self.view.tableType == 1 then
        --不清除头像
        self:dispatch_module_event("table", "Event_AccountClearTable",1)
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount1")    
        self:dispatch_module_event("currentgameaccount", "Event_CurrentGameAccount")
        -- 比赛场
    elseif self.view.tableType == 2 then
        self:dispatch_module_event("table", "Event_AccountClearTable")
        -- 是否自己被淘汰
        local isMySelfOut = self.view:isMyselfOut();
        -- 通过玩家id获取玩家结算信息
        local myResult = self.view:getPlayerResultByPlayerID(self.view.myID);
        -- 自己被淘汰,显示比赛结果弹框
        if isMySelfOut then
            ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount1")
            local matchResult = self.view.tableData.roomInfo.curAccountData.matchResult;
            -- 调用比赛奖励弹框
            MatchingManager:matchAwards(matchResult.matchId, matchResult.stageId, myResult.matchInfo.rank, matchResult.loopNo);
            -- 未淘汰,继续打牌
        else
            ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount1")
            self:dispatch_module_event("currentgameaccount", "Event_CurrentGameAccount")
        end
    end
end

-- 返回大厅
function CurrentGameAccount1Module:backHall()

    TableManagerPoker:disconnect_game_server();

    self.modelData.curTableData.roomInfo = nil;
    ModuleCache.ModuleManager.destroy_package(BranchPackageName);
    ModuleCache.ModuleManager.destroy_package("public");
    ModuleCache.ModuleManager.show_module("public", "hall");
end

-- 自动处理器
function CurrentGameAccount1Module:autoHandler()

    local currentLabel = nil;
    local currentLabelDefault = nil;
    -- 好友场或比赛场
    if self.view.tableType == 0 or self.view.tableType == 2 then
        currentLabel = self.view.labelContinue;
        currentLabelDefault = "继续";
    else
        self.view.labelContinue.text = "继续游戏"
    end

    if currentLabel then
        local onUpdate = function(t)
            local currentTime = t.surplusTimeRound;
            currentLabel.text = currentLabelDefault .. "(" .. currentTime .. ")";
        end
        local onComplete = function(t)
            -- 好友场或比赛场
            if self.view.tableType == 0 or self.view.tableType == 2 then
                -- 继续游戏
                self:continueGame();
            end
        end
        self.timerID = self:subscibe_time_event(10, false, 1):OnUpdate(onUpdate):OnComplete(onComplete).id;
    end
end

return CurrentGameAccount1Module;