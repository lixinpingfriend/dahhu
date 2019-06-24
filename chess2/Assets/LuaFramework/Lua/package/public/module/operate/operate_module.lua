
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local OperateModule = class("operateModule", ModuleBase)
---@type JumpManager
local JumpManager = require('package.public.jump_manager')
-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function OperateModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "operate_view", "operate_model", ...)

end

function OperateModule:on_update()
    self.view:update()
end

function OperateModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ButtonBack" then
        --self.view:stop_auto_play_content(self.adContentInfo);
        --self.view:stop_auto_play_content(self.recommendGamesContentInfo);
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common_mini(string.format("您确定要退出游戏？"), function()
            UnityEngine.Application.Quit()
        end , nil)
        --ModuleCache.ModuleManager.destroy_module("public", "operate");
        -- 复制按钮
    elseif obj == self.view.buttonCopy.gameObject then
        local playerID = self.view.userData.userId
        if playerID then
            -- 复制玩家id到剪切板
            ModuleCache.GameSDKInterface:CopyToClipboard(playerID);

            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("游戏ID复制成功");
        end
        -- 头像按钮
    elseif obj == self.view.buttonRole.gameObject then
        local data = {
            showType = 1,
            uid = self.modelData.roleData.userID,
        }
        ModuleCache.ModuleManager.show_module("public", "playerinfodetail", data)
        -- 更多游戏按钮
    elseif obj.name == 'ItemMoreGame' then
        if ModuleCache.GameManager.channel == "HAOCAI" then
            ModuleCache.ModuleManager.show_module("public", "switchgame")
        else
            ModuleCache.ModuleManager.show_module("public", "setplaymode", ModuleCache.GameManager.getCurProvinceId())
        end 
    elseif obj == self.view.buttonChessMuseum.gameObject then
        ModuleCache.ModuleManager.show_module("public", "chessmuseum")
    elseif (obj.name == "ButtonHall") then
        self:hide()
    elseif (obj.name == "ButtonSetting") then
        ModuleCache.ModuleManager.show_module("public", "setting")
    elseif (obj.name == "ButtonService") then
        self:getIsCustomer(function(retData)
            if (retData.success) then
                if retData.data then
                    ModuleCache.ModuleManager.show_public_module("customerservicesystem");
                    self.view.spritecustomerServiceRed:SetActive(false)
                else
                    ModuleCache.ModuleManager.show_module("public", "customerservice");
                end
            end
        end)
        --ModuleCache.ModuleManager.show_module("public", "hall")
    elseif (obj.name == "otherItem (2)") then
        local data = {
            --link = "http://fishwxh5.naler.cn/mayouquan/tyby/?userId=exsv32v&name=%E9%80%9F%E6%AF%94%E4%BF%A1&purl=http%3a%2f%2fwww.baidu.com&sign=xxxx",
            link = "https://csh5.tuyoo.com/test.html?userId=66666&name=%E5%BC%A0%E4%B8%89&purl=https%3A%2F%2Fwww.sincebest.com&sign=306d3da424d210656a96b50f54ab0384",
            showType = 0,
            style = 4,
            --hide = true
        }
        ModuleCache.ModuleManager.show_module("public", "webgame", data);
    end
end

function OperateModule:on_show(showFromHall)

    self.view:hide();

    -- 请求获取发行配置协议
    self.model:getOperateConfig();

    -- 请求获取用户信息协议
    self.model:getUserInfo();

    self.view.goShowHall:SetActive(showFromHall)
    self:getNewChatCount()
    if(self.modelData.roleData.webGameDataList)then
        self.view:refreshThirdGamesView(self.modelData.roleData.webGameDataList)
    else
        self.view:refreshThirdGamesView()
        JumpManager:getWebGameList(function(webGameDataList)
            self.view:refreshThirdGamesView(webGameDataList)
        end)
    end
end

-- 自动进入游戏
function OperateModule:switch_game_auto(eventData)
    if(ModuleCache.GameManager.curProvince == 0 or ModuleCache.GameManager.curGameId == 0) then
        if eventData.defaultGameId and eventData.defaultGameId ~= "" then
            for i = 1, #eventData.games do
                if eventData.games[i].gameId == eventData.defaultGameId then
                    --先处理是否重复的
                    local provinceConf = ModuleCache.PlayModeUtil.getProvinceByAppName(eventData.games[i].province)
                    local playModeConf = ModuleCache.PlayModeUtil.getDeepCopyTable(require(provinceConf.modName))
                    local gameName = string.split(eventData.games[i].gameId, "_")[2]
                    local playMode = ModuleCache.PlayModeUtil.getInfoByGameName(gameName, playModeConf)
                    self.model:setPlayMode(self, provinceConf.id, playMode)
                    return
                end
            end
        end
    end
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function OperateModule:on_model_event_bind()

    local onGetOperateConfig = function(eventHead, eventData)
        -- 如果不隐藏登录界面，就会有修复、客服的窗口透传上来
        ModuleCache.ModuleManager.hide_module("public", "login")
        self.view:show();

        --TODO:好彩麻将单独处理推荐玩法
        if ModuleCache.GameManager.channel == "HAOCAI" then
            local data = {
                {gameId = "HAOCAI_RUNFAST", province = "HAOCAI", type = 1},
                {gameId = "HAOCAI_DOUDIZHU", province = "HAOCAI", type = 1},
                {gameId = "HAOCAI_QJMJFXJ", province = "HAOCAI", type = 1},
                {gameId = "HAOCAI_DLXZDD", province = "HAOCAI", type = 1},
                {gameId = "HAOCAI_DLTDH", province = "HAOCAI", type = 1},
            }

            local games = {}
            for _, operateGame in ipairs(eventData.games) do
                for i = 1, #data do
                    if data[i].gameId and data[i].gameId == operateGame.gameId then
                        table.insert(games, operateGame)
                        data[i].gameId = nil
                    end
                end
            end
            for i = 1, #data do
                if data[i].gameId then
                    table.insert(games, data[i])
                end
            end

            eventData.games = games
        end

        -- 初始化
        self.view:init(eventData, self);

        self:switch_game_auto(eventData)
    end
    -- 监听请求获取发行配置事件
    self:subscibe_model_event("Event_Operate_GetConfig", onGetOperateConfig);

    local onGetUserInfo = function(eventHead, eventData)

        -- 更新用户信息视图
        self.view:updateUserInfoView(eventData);
    end
    -- 监听请求获取发行配置事件
    self:subscibe_model_event("Event_Operate_GetUserInfo", onGetUserInfo);

    local onGetMuseumList = function(eventHead, eventData)

        -- 更新亲友圈视图
        self.view:updateMuseumView(eventData);
    end
    -- 监听请求获取亲友圈列表事件
    self:subscibe_model_event("Event_Operate_OnGetMuseumList", onGetMuseumList);
end

function OperateModule:on_begin_drag(obj, arg)
    if(obj.name == "ad_item")then
        self.view:stop_auto_play_content(self.view.adContentInfo)
    else
    end
    self.view:onBeginDragContent(obj, arg)
end

function OperateModule:on_drag(obj, arg)
    self.view:onDragContent(obj, arg)
end

function OperateModule:on_end_drag(obj, arg)
    if (self.view) then
        self.view:onEndDragContent(nil, obj, arg)
    end
end

function OperateModule:getIsCustomer(onSuccess)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/isCustomer?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        onSuccess(retData)
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function OperateModule:getNewChatCount()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/getNewChatCount?",
        params = {
            uid = self.modelData.roleData.userID,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if retData.data then
            self.view.spritecustomerServiceRed:SetActive(retData.data > 0)
        end
        --end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end


return OperateModule