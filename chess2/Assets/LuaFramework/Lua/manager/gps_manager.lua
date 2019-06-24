local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local tonumber = tonumber
local string = string
local math = math
--[[
      1.初始化游戏,获取自己的GPS信息,调用ModuleCache.GPSManager.StartGetMyGPSInfo()
      2.进入游戏后将自己的GPS信息发给服务器,自己的的GPS信息:ModuleCache.GPSManager.gps_info
      3.进入牌桌,玩家进来,将玩家的GPS信息保存ModuleCache.GPSManager.AddPlayerGPSInfo()
      4.如果玩家离开删除玩家的GPS信息调用ModuleCache.GPSManager.DeletePlayerGPSInfo(),如果牌桌解散调用ModuleCache.GPSManager.ClearGPSInfo()
      5.玩家都准备好开始玩牌,计算距离调用ModuleCache.GPSManager.StartCalculateGPS()
]]

---@class GPSManager
local GPSManager = {}
GPSManager.gps_info = "0,0,未获取到位置"
GPSManager.gpsAddress = "未获取到位置"

--使用GPS缓存数据时间  半个小时
local reasonableDiffTime = 1800

function GPSManager._get_cache_data(forbidUserCacheData)
    if forbidUserCacheData then
        if ModuleCache.GameManager.platformIsIphone then
            return
        elseif ModuleCache.GameManager.platformIsAndroid then
            if not ModuleCache.GameSDKInterface:IsGpsOpen(false) then                 --当includeAGPS=false是表示如果GPS关了那么不使用任何缓存数据
                ModuleCache.PlayerPrefsManager.SetString("GPSINFO", "0")
                return {errorCodeInfo = "位置服务未开启"}
            end
        end
    else
        if ModuleCache.GameManager.platformIsAndroid then
            if not ModuleCache.GameSDKInterface:IsGpsOpen(true) then     --使用AGPS数据
                ModuleCache.PlayerPrefsManager.SetString("GPSINFO", "0")
                return
            end
        end
    end

    local gpsInfo = ModuleCache.PlayerPrefsManager.GetString("GPSINFO", "0")
    if gpsInfo ~= "0" then
        local gpsInfoGetTime = ModuleCache.PlayerPrefsManager.GetInt("UpdateGPSINFOTime", 0)
        -- 缓存时间内的GPS信息立刻上报
        if gpsInfoGetTime ~= 0 and os.time() - gpsInfoGetTime < reasonableDiffTime then
            local data = {}
            local infoStrs = string.split(gpsInfo, ",")
            data.latitude = tonumber(infoStrs[1])
            data.longitude = tonumber(infoStrs[2])
            data.address = infoStrs[3]
            ModuleCache.GPSManager.gps_info = data.latitude .. "," .. data.longitude .. "," .. data.address
            ModuleCache.GPSManager.gpsAddress = data.address
            ModuleCache.LogManager.custom_Log(string.format('使用GPS缓存数据：%s UpdateGPSINFOTime：%s', ModuleCache.GPSManager.gps_info, gpsInfoGetTime))
            return data
        end
    end
end

---@param callback table
---@param forbidUserCacheData table 需要实时获取准确位置
function GPSManager.begin_location(callback, forbidUserCacheData)
    if (ModuleCache.GameManager.iosAppStoreIsCheck) then
        return
    end

    if callback then
        local cacheData = GPSManager._get_cache_data(forbidUserCacheData)
        if cacheData then
            if cacheData.errorCodeInfo == "位置服务未开启" then
                callback(cacheData)
                callback = nil
                ModuleCache.LogManager.custom_Log("位置服务未开启")
                return
            end
            ModuleCache.GPSManager.gps_info = cacheData.latitude .. "," .. cacheData.longitude .. "," .. cacheData.address
            ModuleCache.GPSManager.gpsAddress = cacheData.address
            callback(cacheData)
            callback = nil
            if os.time() - ModuleCache.PlayerPrefsManager.GetInt("UpdateGPSINFOTime", 0) < 60 then
                return
            end
        end
    else
        if forbidUserCacheData then
            if ModuleCache.GameManager.platformIsAndroid then
                if not ModuleCache.GameSDKInterface:IsGpsOpen(false) then                   --判断是否开启了GPS关闭
                    --ModuleCache.PlayerPrefsManager.SetString("GPSINFO", "0")
                    return
                end
            end
        end
    end

    ModuleCache.WechatManager.onBeginLocation(true, function(data)
        print_table(data, "onBeginLocation")
        if (not data) then
            data = {}
        end

        if (not data.address) then
            if ModuleCache.GameManager.platformIsIphone and data.errorCode then
                if data.errorCode == 2 then
                    data.errorCodeInfo = "位置服务未开启"
                    data.address = "未获取到位置"
                    data.latitude = 0
                    data.longitude = 0
                    ModuleCache.PlayerPrefsManager.SetString("GPSINFO", "0")
                    ModuleCache.LogManager.custom_Log("GPS数据获取失败：位置服务未开启" )
                end
            else
                local cacheData = GPSManager._get_cache_data()
                if not cacheData then
                    if not callback then
                        -- 如果没有回调的情况下就不更新gpsAddress信息了
                        local gpsInfoGetTime = ModuleCache.PlayerPrefsManager.GetInt("UpdateGPSINFOTime", 0)
                        if gpsInfoGetTime ~= 0 and os.time() - gpsInfoGetTime < reasonableDiffTime then
                            ModuleCache.LogManager.custom_Log("GPS数据获取失败但是还在缓存时间内，所以认为还是有GPS数据!UpdateGPSINFOTime：" .. tostring(gpsInfoGetTime))
                            return
                        end
                    end
                    data.address = "未获取到位置"
                    data.latitude = 0
                    data.longitude = 0
                else
                    data = cacheData
                end
            end
        else
            if data.address ~= "" then
                ModuleCache.PlayerPrefsManager.SetString("GPSINFO", data.latitude .. "," .. data.longitude .. "," .. data.address)
                ModuleCache.PlayerPrefsManager.SetInt("UpdateGPSINFOTime", os.time())
                ModuleCache.LogManager.custom_Log(string.format("储存GPS数据(%s)：%s,%s,%s", ModuleCache.SDKInterface().get_cur_signal_type(), data.latitude, data.longitude, data.address))
            end
        end
        ModuleCache.GPSManager.gps_info = data.latitude .. "," .. data.longitude .. "," .. data.address
        ModuleCache.GPSManager.gpsAddress = data.address
        if callback then
            callback(data)
        end
    end, forbidUserCacheData)
end

--- 计算距离
function GPSManager.caculate_distance(latitude1, longitude1, latitude2, longitude2)
    -- print(longitude1,latitude1,longitude2,latitude2)
    if (longitude1 and latitude1 and longitude2 and latitude2) then
        local var2 = 0.01745329251994329
        local var4 = longitude1
        local var6 = latitude1
        local var8 = longitude2
        local var10 = latitude2
        var4 = var4 * 0.01745329251994329
        var6 = var6 * 0.01745329251994329
        var8 = var8 * 0.01745329251994329
        var10 = var10 * 0.01745329251994329
        local var12 = math.sin(var4)
        local var14 = math.sin(var6)
        local var16 = math.cos(var4)
        local var18 = math.cos(var6)
        local var20 = math.sin(var8)
        local var22 = math.sin(var10)
        local var24 = math.cos(var8)
        local var26 = math.cos(var10)
        local var28 = { }
        local var29 = { }
        var28[1] = var18 * var16
        var28[2] = var18 * var12
        var28[3] = var14
        var29[1] = var26 * var24
        var29[2] = var26 * var20
        var29[3] = var22
        local var30 = math.sqrt((var28[1] - var29[1]) * (var28[1] - var29[1]) + (var28[2] - var29[2]) * (var28[2] - var29[2]) + (var28[3] - var29[3]) * (var28[3] - var29[3]))
        return (math.asin(var30 / 2.0) * 1.27420015798544E7)
    else
        print("非法坐标值")
        return -1
    end
end

return GPSManager
