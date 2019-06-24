




local ModuleCache = ModuleCache
---@class UserDataManager
local UserDataManager = { }

local rootPath = UnityEngine.Application.persistentDataPath
local cachePath = rootPath .. "/cachefiles"
local coroutine = coroutine
local tonumber = tonumber
local Time = Time

local PackageModuleEvent = require("core.package_module_event")

--自己的UserID
UserDataManager.selfUserID = 0
UserDataManager.modelData = nil
UserDataManager._userDataCaches = { }



--self.modelData.roleData.cards = data.cards
--self.modelData.roleData.coins = data.coins
--self.modelData.roleData.male = data.gender == 1
--self.modelData.roleData.gender = data.gender
--self.modelData.roleData.hasBind = data.hasBind
--self.modelData.roleData.headImg = data.headImg
--self.modelData.roleData.lostCount = data.lostCount
--self.modelData.roleData.nickname = data.nickname
--self.modelData.roleData.score = data.score
--self.modelData.roleData.tieCount = data.tieCount
--self.modelData.roleData.winCount = data.winCount
--self.modelData.roleData.userId = data.userId
--self.modelData.roleData.breakRate = data.breakRate
--self.modelData.roleData.unionId = data.unionId
--self.modelData.roleData.ip = data.ip
--self.modelData.roleData.gold = data.gold


function UserDataManager.init()
    require("UnityEngine.AsyncOperation")
    require("UnityEngine.Texture2D")
    UserDataManager._init = true
end


--获取静态数据，比如昵称、头像、性别。可以在牌桌中获取
---get_static_data 如果有headImgCallback的话
---@param userID table
---@param finishCallback
---@param headImgCallback 头像数据回调，因为头像的获取更加延后
function UserDataManager.get_static_data(userID, finishCallback, headImgCallback)

    if not userID then
        error("get_static_data.userID为空")
        return
    else
        userID = tonumber(userID)
    end
    local cacheData = UserDataManager._userDataCaches[userID]
    if finishCallback and cacheData then
        finishCallback(cacheData)

        if headImgCallback then
            headImgCallback(cacheData.headImgSprite)
        end
        return
    end
    UserDataManager._get_userinfo(userID, false,function (text)
        local retData = ModuleCache.Json.decode(text)

        if retData.ret and retData.ret == 0 then
            UserDataManager._set_user_data(retData.data, function (cacheUserData)
                if finishCallback and cacheUserData then
                    finishCallback(cacheUserData)
                end
            end, headImgCallback)
        end
    end)
end

function UserDataManager._set_user_currency_data(data)
    local cacheData = UserDataManager._userDataCaches[UserDataManager.selfUserID]
    if not cacheData then
        cacheData = {}
        cacheData.userId = UserDataManager.selfUserID
    end

    return cacheData
end

-- 获取get_user_new_message
function UserDataManager:get_user_new_message()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "msg/getNewMsg?",
        params = {
            uid = UserDataManager.selfUserID,
            gameName = ModuleCache.AppData.get_common_game_name()
        }
    }

    ModuleCache.GameUtil.http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        print_table(retData)
        if retData.ret == 0 then
            local data = retData.data
            PackageModuleEvent:dispatch_module_event(nil, nil, "Event_Package_Refresh_Userinfo", UserDataManager._set_user_currency_data(data))
            if (data.msg) and not ModuleCache.GameManager.iosAppStoreIsCheck then
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(data.msg)
            end
        else

        end
    end, function(errorData)
        print(errorData.error)
    end)
end


function UserDataManager._set_user_data(data, finishCallback)
    local lastCacheData = UserDataManager._userDataCaches[data.userId]
    local cacheData = data

    if lastCacheData then
        cacheData.headImgSprite = lastCacheData.headImgSprite
        cacheData.headSprite = lastCacheData.headSprite
    end
    UserDataManager._userDataCaches[data.userId] = cacheData

    if data.gender then
        cacheData.male = data.gender == 1
    end
    cacheData.updateTime = Time.realtimeSinceStartup

    -- 显示到界面昵称
    cacheData.uiNickname = data.nickname

    -- 缩略昵称
    cacheData.uiContractionsNickname = ModuleCache.GameUtil.filterPlayerName(cacheData.nickname, 10)


    if cacheData.isRedName then
        cacheData.uiNickname = string.format("<color=red>%s</color>", data.nickname)
        cacheData.uiContractionsNickname = string.format("<color=red>%s</color>", cacheData.uiContractionsNickname)
        cacheData.uiUserId = string.format("<color=red>ID:%s</color>", cacheData.userId)
    else
        cacheData.uiUserId = "ID:" .. data.userId
    end


    --if data.userId .. '' == UserDataManager.selfUserID .. '' then
    --    UserDataManager.modelData.roleData.agentsId = data.agentsId
    --end
    print_table(cacheData)

    if finishCallback and cacheData.headImgSprite then
        finishCallback(cacheData)
        finishCallback = nil
    end

    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(cacheData.headImg, function (error, sprite)
        if sprite then
            cacheData.headSprite = sprite
            cacheData.headImgSprite = sprite
        else
            cacheData.headSprite = nil
            cacheData.headImgSprite = nil
        end

        if finishCallback then
            finishCallback(cacheData)
        end
    end)
end

--获取通用数据，不能用于货币的获取
function UserDataManager.get_general_data(userID, finishCallback)
    if not userID then
        print("get_currency_data.userID为空")
        return
    end

    UserDataManager._get_userinfo(userID, false,function (text)
        local retData = ModuleCache.Json.decode(text)
        print_table(retData)
        if retData.ret and retData.ret == 0 then
            UserDataManager._set_user_data(retData.data, function (cacheUserData)
                if finishCallback and cacheUserData then
                    finishCallback(cacheUserData)
                    return
                end
            end)
        end
    end)
end

--获取货币数据
function UserDataManager.get_currency_data(userID, finishCallback)
    if not userID then
        return
    end
    UserDataManager._get_userinfo(userID, true,function (text)
        local retData = ModuleCache.Json.decode(text)

        if retData.ret and retData.ret == 0 then
            UserDataManager._set_user_data(retData.data, function (cacheUserData)
                if finishCallback and cacheUserData then
                    finishCallback(cacheUserData)
                    return
                end
            end)
        end
    end)
end

-- 如果是错误与超时需要提供重试功能，重试上限为5次
function UserDataManager._get_userinfo(userID, getCurrencyData, finishCallback, upLoadTimes)
    if not userID then
        error("userID为空")
        return
    end

    upLoadTimes = upLoadTimes or 10
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = userID,
        },
    }

    if getCurrencyData then
        requestData.cacheDataKey = string.format("user/info?uid=%s&gameName=%s", userID, ModuleCache.AppData.get_url_game_name())
        requestData.cacheDataImmediatelyCallbackAndSuccessCallback = true
    else
        requestData.cacheDataKey = string.format("user/info?uid=%s", userID)
        requestData.cacheDataImmediatelyCallback = true
    end

    ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
        print(wwwOperation.www.text, "=====")
        if finishCallback then
            finishCallback(wwwOperation.www.text, nil)
        end
    end, function(error)
        print(error.error)
        ----超时
        --if(error.error and error.error ~= '' and error.error == "Network Timeout") then
        --    upLoadTimes = upLoadTimes - 1
        --    if upLoadTimes > 0 then
        --        UserDataManager._get_userinfo(userID, getCurrencyData, finishCallback, upLoadTimes)
        --    end
        --end
    end, function(cacheDataText)
        if finishCallback then
            finishCallback(cacheDataText, nil)
        end
    end, function(retData)
        -- 被封号
        if UserDataManager.selfUserID == tonumber(userID) and retData.code == "INVALID_USER" then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
            ModuleCache.GameManager.logout(true)
        end
    end)
end

function UserDataManager.get_user_ip()

end





return UserDataManager;


