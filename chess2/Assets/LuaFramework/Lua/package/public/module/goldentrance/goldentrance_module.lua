
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local GoldEntranceModule = class("Public.GoldEntranceModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local PlayModeUtil = ModuleCache.PlayModeUtil
local PlayerPrefs = UnityEngine.PlayerPrefs
local times = 0
local TableManager = TableManager
local MatchingManager = require("package.public.matching_manager")
---@type Config Config
local Config = require("package.public.config.config")
function GoldEntranceModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据

    ModuleBase.initialize(self, "goldentrance_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function GoldEntranceModule:on_module_inited()
    self.getGoldsSeq = 0
    self._get_quickJoin_data_time = 0
end

-- 绑定module层的交互事件
function GoldEntranceModule:on_module_event_bind()
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
        if self.view then
            self.view:refresh_gold(eventData)
            if os.time() - self._get_quickJoin_data_time > 1 then
                self:get_quickJoin_data(true)
            end
        end
    end)
end

-- 绑定Model层事件，模块内交互
function GoldEntranceModule:on_model_event_bind()


end

function GoldEntranceModule:on_show(data)
    self:get_tag_list()
    self.view:initRoomViewList({})
    self.roomData = {}
    self.view:refresh_gold(self.modelData.roleData)
    self:getUserNewMessage()
    self:get_data_list()
    --self:get_quickJoin_data(true)
    self.modelData.tableCommonData.isGoldTable = false
    self.getGoldsSeq = 0
    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_LAST_HALL_OPEN_MODULE, "public_goldentrance_" .. self.tag)
    MatchingManager:jump_jiujijin()
end

function GoldEntranceModule:get_tag_list()
    self.wanfaNames = Config.get_gold_list()
    local lastSelectIndex = self.view:initWanFaList(self.wanfaNames)
    self.tag = lastSelectIndex
end

function GoldEntranceModule:on_click(obj, arg)
    print("===点击按钮===", obj.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    local objName = obj.name
    if objName == "BackBtn" then
        self:close_deal()
        ModuleCache.ModuleManager.hide_module("public", "goldentrance")
        ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_LAST_HALL_OPEN_MODULE, "");
    elseif objName == "StartBtn" then
        self:get_quickJoin_data()
    elseif obj.transform.parent.name == "RoomListContent" then
        local num = tonumber(objName)
        local pd = self:get_point_data(num)
        if pd then
            if self.modelData.roleData.gold >= pd.minJoinCoin and self.modelData.roleData.gold <= pd.maxJoinCoin then
                TableManager:start_enter_gold_matching(self.modelData.roleData.userID, self.modelData.roleData.password, pd.goldId)
            else
                MatchingManager:gold_jump(pd.goldId)
            end
        end
    elseif obj.transform.parent.gameObject == self.view.wanfalistObj then
        local wanfaType = obj.name
        local key = string.format("%s_lastSelectGoldPlayTypeName", ModuleCache.GameManager.curGameId)
        PlayerPrefs.SetString(key, wanfaType)
        self.view:refresh_wanfa_btn_state(obj)
        self.tag = self.view:get_wanfa_index_by_wanfabtn_obj(obj)
        --self.view:initRoomViewList({}) ---立即清理房间列表
        if self.roomData[self.tag] then
            self.view:initRoomViewList(self.roomData[self.tag])
        else
            self:get_data_list()
        end
        self:get_quickJoin_data(true)
    elseif obj.name == "Gold" then
        ModuleCache.ModuleManager.show_module("public", "shop", 1)
    elseif obj.name == "Tili" then
        ModuleCache.ModuleManager.show_module("public", "shop", 5)
    end
end

function GoldEntranceModule:get_point_data(id)
    local data
    if self.roomData[self.tag] then
        for _, i in ipairs(self.roomData[self.tag]) do
            if id == i.goldId then
                data = i
            end
        end
    end
    return data
end


--获取金币场数据
function GoldEntranceModule:get_data_list()
    self.gameType = Config.get_gold_wanfaType_name(self.tag)
    local cacheKey = "gold/getGolds?uid=" .. self.modelData.roleData.userID .. "&gameName=" .. ModuleCache.AppData.get_app_and_game_name() .. "tag=" .. self.tag
    local lastCacheData = ModuleCache.PlayerPrefsManager.GetString(cacheKey, "")

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/getGolds?",
        params = {
            uid = self.modelData.roleData.userID,
            tagCode = self.gameType
        },
        cacheDataKey = cacheKey
    }
    self.getGoldsSeq = self.getGoldsSeq + 1
    local _getGoldsSeq = self.getGoldsSeq

    local sucDeal = function(retData)
        if _getGoldsSeq < self.getGoldsSeq then
            print("_getGoldsSeq有脏数据")
            return
        end

        if (retData.success) and type(retData.data) == "table" then
			self.roomData[self.tag] = retData.data
			MatchingManager.roomData = retData.data			--金币场结算中用到 游戏中会删除此模块 存到MatchingManager中
            print("金币场数据获取成功")
            print_table(self.roomData)
            self.view:initRoomViewList(self.roomData[self.tag])
            if #retData.data == 0 then
                self.quickGoldId = 0
                self.view:setRecommondRoom("")
            end
            self:setQuitEffect()
        end
    end

    if lastCacheData ~= "" then
        local retData = ModuleCache.Json.decode(lastCacheData)
        if (retData.success) and type(retData.data) == "table" and #retData.data > 0 then
            sucDeal(retData)
        end
    end
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        sucDeal(retData)
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        print("第" .. times .. "获取金币场数据失败，继续获取")
        if times < 3 then
            times = times + 1
            self:get_data_list()
        end
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        sucDeal(retData)
    end)
end

function GoldEntranceModule:get_quickJoin_data(init)
    self._get_quickJoin_data_time = os.time()
    self.gameType = Config.get_gold_wanfaType_name(self.tag)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "gold/quickJoin?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            tagCode = self.gameType
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            if type(retData.data) == "table" then
                local data = retData.data
                if init then
                    self.quickGoldId = data.goldId
                    self:setQuitEffect()
                    self.view:setRecommondRoom(data.goldName)
                    return
                end
                TableManager:start_enter_gold_matching(self.modelData.roleData.userID, self.modelData.roleData.password, data.goldId)
            else
                if init then
                    self.quickGoldId = 0
                    self:setQuitEffect()
                    if self.roomData[self.tag] and #self.roomData[self.tag] == 0 then
                        self.view:setRecommondRoom("")
                    else
                        self.view:setRecommondRoom("金币不足")
                    end
                    return
                end
                if self.roomData[self.tag] and #self.roomData[self.tag] == 0 then
                    --没有配置金币场数据 点击没有反应
                else
                    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
                            "您的金币不足!是否需要充值?", function()
                                ModuleCache.ModuleManager.show_module("public", "shop", 1)
                            end, nil, true, "确定", "取消")
                end

            end
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function GoldEntranceModule:setQuitEffect()
    if self.quickGoldId and self.roomData and self.roomData[self.tag] then
        local index = 0
        for i = 1, #self.roomData[self.tag] do
            if self.roomData[self.tag][i].goldId == self.quickGoldId then
                index = i
            end
        end
        self.view:setChooseEffect(index)
    end
end

----获取玩家金币数据
function GoldEntranceModule:getUserNewMessage()
    self:dispatch_package_event("Event_Package_RefreshUserInfo")
end

function GoldEntranceModule:close_deal()
    if self.modelData.hallData.normalGameName then
        ModuleCache.GameManager.change_game_by_gameName(self.modelData.hallData.normalGameName)
        self.modelData.hallData.normalGameName = nil
    end
end

function GoldEntranceModule:on_destroy()
    --self:close_deal()
end

return GoldEntranceModule



