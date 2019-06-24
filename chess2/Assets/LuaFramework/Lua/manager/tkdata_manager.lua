





local LoginType = {}
LoginType.Any = 0
LoginType.REGISTERED = 1
LoginType.SINA_WEIBO = 2
LoginType.QQ = 3
LoginType.QQ_WEIBO = 4
LoginType.ND91 = 5
LoginType.WeChat = 6
LoginType.TYPE1 = 11
LoginType.TYPE2 = 12
LoginType.TYPE3 = 13
LoginType.TYPE4 = 14
LoginType.TYPE5 = 15

---@class TalkingDataMgr
---@field public LoginType LoginType
local TalkingDataMgr = {}
local ModuleCache = ModuleCache
local Json        = require("cjson")

TalkingDataMgr.appId = "CA0E977CC1564F44A3B5F762EE471D3F"
TalkingDataMgr.channel = ""
TalkingDataMgr.LoginType = LoginType

function TalkingDataMgr.init()
    if not ModuleCache.GameManager.deviceIsMobile then
        return
    end

    --print("----------------TalkingData init start -----------------------")
    TalkingDataMgr.channel = ModuleCache.GameManager.channel
    local params = {}
    params.appId = TalkingDataMgr.appId
    params.channel = TalkingDataMgr.channel
    TalkingDataMgr.sendRequest("TalkingDataInitRequest",params)
end

---@param roleData modelData.roleData
---@param loginType LoginType
function TalkingDataMgr.setAccount(roleData,loginType)
    --if not ModuleCache.GameManager.deviceIsMobile then
    --    return
    --end
    local params = {}
    params.accountId = roleData.userID
    params.accountType = loginType
    params.accountName = roleData.nickname or ""
    params.gender = roleData.gender or 1
    params.gameServer = ModuleCache.AppData.get_app_and_game_name()
    TalkingDataMgr.sendRequest("TalkingDataLoginRequest",params)
end

---@param eventName string
---@param eventMap key value pair
function TalkingDataMgr.setEvent(eventName, eventMap)
    if not ModuleCache.GameManager.deviceIsMobile then
        return
    end
    print("----------------TalkingData setEvent start -----------------------")
    local eventMap = eventMap or {}
    eventMap.eventId = eventName
    TalkingDataMgr.sendRequest("TalkingDataEventRequest",eventMap)
end

---@param eventName string
---@param eventMap key value pair
function TalkingDataMgr.setEventData(data)
    if not ModuleCache.GameManager.deviceIsMobile then
        return
    end
    if data and data.eventId then
        TalkingDataMgr.sendRequest("TalkingDataEventRequest",data)
    end
end

---@param eventName string
---@param eventMap key value pair
function TalkingDataMgr.setEventCheckVersion(eventName, eventMap)
    local eventMap = eventMap or {}
    eventName = eventName .. "_" ..ModuleCache.GameManager.appVersion
    eventMap.eventId = eventName
    eventMap.deviceModel = ModuleCache.CustomerUtil.deviceModel
    eventMap.uid = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0") .. "_" .. tostring(os.date("%Y-%m-%d %H:%M:%S"))
    TalkingDataMgr.sendRequest("TalkingDataEventRequest",eventMap)
end

---@param eventName string
---@param eventMap key value pair
function TalkingDataMgr.setEventWithUID(eventName, eventMap)

    local eventMap = eventMap or {}
    eventMap.eventId = eventName
    eventMap.uid = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0")
    eventMap.uidTime = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0") .. "_" .. tostring(os.date("%Y-%m-%d %H:%M:%S"))
    TalkingDataMgr.sendRequest("TalkingDataEventRequest",eventMap)
end

---@param eventName string
---@param eventMap key value pair
function TalkingDataMgr.setEventWithUIDData(eventName, eventMap)

    local eventMap = eventMap or {}
    eventMap.eventId = eventName
    eventMap.uid = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0")
    eventMap.data = string.format("%s_%s_%s", ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0")) .. "_" .. tostring(os.date("%Y-%m-%d %H:%M:%S"))
    TalkingDataMgr.sendRequest("TalkingDataEventRequest",eventMap)
end



function TalkingDataMgr.sendRequest(protoName,params)
    local protoParams    = Json.encode(params)
    local requestStr     = "{"
    requestStr           = requestStr.."\"protoName\":\""..protoName.."\","
    requestStr           = requestStr.."\"protoParams\":"
    requestStr           = requestStr..protoParams
    requestStr           = requestStr.."}"
    print("requestStr = "..requestStr)
    if not ModuleCache.GameManager.deviceIsMobile then
        return
    end
    ModuleCache.GameSDKInterface:SendRequestToPhone(requestStr)
end
TalkingDataMgr.init()
return TalkingDataMgr