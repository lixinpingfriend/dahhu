
local class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local json = require("cjson")

local ModuleCache = ModuleCache

local OperateModel = class("operateModel", Model)

function OperateModel:initialize(...)
    Model.initialize(self, ...)

end

-- 请求获取发行配置协议
function OperateModel:getOperateConfig()
    -- 获取常用gameName
    local gameNameTemp = "";
    local usedList = ModuleCache.GameManager.get_used_playMode();
    if usedList then

        local provinceConf = ModuleCache.PlayModeUtil.getProvinceById(usedList[1].provinceId)
        local playModeConf = ModuleCache.PlayModeUtil.getDeepCopyTable(require(provinceConf.modName))
        local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(usedList[1].gameId, playModeConf)

        local createName = string.split(playMode.createName, "_");
        gameNameTemp = createName[1] .. "_" .. createName[2];
    end

    local provinceTemp = ModuleCache.PlayModeUtil.getProvinceById(ModuleCache.GameManager.getCurProvinceId());
    print(provinceTemp.appName);
    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            province = provinceTemp.appName,
            gameName = gameNameTemp;
        },
        showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "operate/getOperateConfig?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            -- 没有发行图片,跳过加载图片
            if #retData.data.carouselImg == 0 then
                retData.data.spriteImageList = { };
                Model.dispatch_event(self, "Event_Operate_GetConfig", retData.data);
                return;
            end

            retData.data.spriteImageList = { };
            -- 发行sprite列表
            local spriteOperateList = { };
            -- 下载次数
            local downCount = 0;
            -- 下载总次数
            local downTotalCount = #retData.data.carouselImg;
            for key, operate in ipairs(retData.data.carouselImg) do
                local onStartComplete = function(sprite)
                    downCount = downCount + 1;
                    spriteOperateList[key] = sprite;

                    if downCount == downTotalCount then
                        -- 所有道具图片下载是否已完成
                        local isAllDownComplete = self:isDownLoadComplete(spriteOperateList);
                        if isAllDownComplete then

                            retData.data.spriteImageList = spriteOperateList;
                            Model.dispatch_event(self, "Event_Operate_GetConfig", retData.data);
                        else
                            retData.data.spriteImageList = { };
                            Model.dispatch_event(self, "Event_Operate_GetConfig", retData.data);
                        end
                    end
                end
                self:image_load_sprite(nil, operate.content, onStartComplete);
            end
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        if data then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
        end
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

-- 请求获取用户信息协议
function OperateModel:getUserInfo()

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        cacheDataImmediatelyCallback = true,
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            Model.dispatch_event(self, "Event_Operate_GetUserInfo", retData.data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        if data then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
        end
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

-- 请求获取亲友圈列表协议
function OperateModel:getParlorList()

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
        },
        showModuleNetprompt = true,
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getUserParlorListGlobal?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then

            Model.dispatch_event(self, "Event_Operate_OnGetMuseumList", retData.data);
        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        if data then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
        end
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

-- 请求点击亲友圈按钮协议
function OperateModel:getClickParlor(museumNumber)

    local requestData = {
        params =
        {
            uid = self.modelData.roleData.userID,
            parlorId = museumNumber,
        },
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/clickParlor?",
    }

    local onResponse = function(wwwOperation)

        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then


        else

        end
    end

    local onError = function(data)
        print(data.error);
    end
    local onSystemError = function(data)
        if data then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
        end
    end

    self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

-- 所有发行图片下载是否已完成
function OperateModel:isDownLoadComplete(spriteOperateList)

    local isAllDownComplete = true;
    for showIDTemp, spriteOperate in pairs(spriteOperateList) do

        if spriteOperate == nil then

            isAllDownComplete = false;
            return isAllDownComplete;
        end
    end

    return isAllDownComplete;
end


-- 请求发送发名单协议
function OperateModel:sendWhilt(module, provinceId, playMode, callback)
    local province = ModuleCache.PlayModeUtil.getProvinceById(provinceId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "/user/isWhiteList?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.modelData.roleData.userID,
            gameName = province.appName .. "_" .. playMode.gameName,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            self:setPlayMode(module, provinceId, playMode, callback)
        end
    end , function(errorData)
        print(errorData.error)
        if tostring(errorData.error):find("500") ~= nil or tostring(errorData.error):find("error") ~= nil then
            if errorData.www.text then
                local retData = errorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
        if not ModuleCache.GameManager.deviceIsMobile then
            self:setPlayMode(module, provinceId, playMode, callback)
        end
    end )
end
function OperateModel:setPlayMode(module, provinceId, playMode, callback)
    if (provinceId == ModuleCache.GameManager.curProvince and playMode.gameId == ModuleCache.GameManager.curGameId) then
        ModuleCache.ModuleManager.hide_module("public", "operate");
        ModuleCache.ModuleManager.show_module("public", "hall")
        ModuleCache.GameManager.select_game_id(playMode.gameId)
        ModuleCache.JpushManager().setTag()
        if callback then
            callback();
        end
        return
    end

    local lastAppName, needRenameAppName = AppData.get_app_name()
    if not needRenameAppName then
        lastAppName = ""
    end

    ModuleCache.GameManager.select_province_id(provinceId)
    ModuleCache.GameManager.select_game_id(playMode.gameId)
    ModuleCache.GameManager.curLocation = playMode.location
    ModuleCache.JpushManager().setTag()

    local curAppName, needRenameAppName = AppData.get_app_name()
    if not needRenameAppName then
        curAppName = ""
    end

    if curAppName ~= lastAppName then
        ModuleCache.GameManager.logout(true)
        return
    end

    ModuleCache.PackageManager.update_package_version(playMode.package, function()
        -- 更新完所有资源再去检测是否有apk、ipa需要更新
        ModuleCache.ModuleManager.hide_module("public", "operate");
        if ModuleCache.ModuleManager.get_module("public", "hall") then
            module:dispatch_package_event("Event_Set_Play_Mode", playMode)
        else
            ModuleCache.ModuleManager.show_module("public", "hall")
        end
        ModuleCache.GameManager.set_used_playMode(ModuleCache.GameManager.curProvince, ModuleCache.GameManager.curGameId)
        if callback then
            callback();
        end
    end )
end

return OperateModel;