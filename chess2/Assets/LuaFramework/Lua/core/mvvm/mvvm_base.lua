






local ModuleCache = ModuleCache
local class = require("lib.middleclass")
local CSmartTimer = ModuleCache.SmartTimer.instance
local DOTween = DG.Tweening.DOTween
local Sequence = DOTween.Sequence
local Util = require('util.game_util')
local ApplicationEvent = ApplicationEvent
local modelData = require("package.public.model.model_data")

---@class MVVMBase
local MVVMBase = class('MVVMBase')
local StartCoroutine = StartCoroutine
local StopCoroutine = StopCoroutine
local coroutine = coroutine

function MVVMBase:initialize()
    -- 时间缓存数据
    self._timeEventDatas = {}
    self._sequenceDatas = {}

    -- 是否禁用GPS上报缓存信息
    --self._forbiddenGpsUploadCacheData = false
    --self._gpsCacheDataExpiresTime = 7200
end



--- 订阅时间事件
--- @param callTime float 如果useTimestamp=true代表使用时间戳，否则为从现在开始往后执行的时间
function MVVMBase:subscibe_time_event_on(callTime, onFinish)
    local timeEventData = CSmartTimer:Subscribe(callTime, false, 0)
    self._timeEventDatas[timeEventData.id] = timeEventData.id
    timeEventData:OnComplete(onFinish)
    return timeEventData
end

--- 订阅真实时间事件
--- @param callTime float 如果useTimestamp=true代表使用时间戳，否则为从现在开始往后执行的时间
function MVVMBase:subscibe_realtime_event_on(callTime, onFinish)
    local timeEventData = CSmartTimer:Subscribe(callTime, false, 1)
    self._timeEventDatas[timeEventData.id] = timeEventData.id
    timeEventData:OnComplete(onFinish)
    return timeEventData
end

--- 订阅时间事件
--- @param callTime float 如果useTimestamp=true代表使用时间戳，否则为从现在开始往后执行的时间
--- @param useTimestamp boolean 是否为时间戳，否则为时间差值。false 使用时间差值
--- @param timeEventType int 计时时间类型  0:{Time}, 1:{IngoreTimeScale}, 2:{RealServerTime】
function MVVMBase:subscibe_time_event(callTime, useTimestamp, timeEventType)
    local timeEventData = CSmartTimer:Subscribe(callTime, useTimestamp or false, timeEventType or 0)
    self._timeEventDatas[timeEventData.id] = timeEventData.id
    return timeEventData
end

-- 清除所有时间事件
function MVVMBase:clear_all_time_event()
    for _kId, vId in pairs(self._timeEventDatas) do
        if vId then
            CSmartTimer:Kill(vId)
        end
    end
    self._timeEventDatas = {}
end

function MVVMBase:create_sequence()
    local sequence = Sequence()
    sequence:SetId(Util.guid())
    table.insert( self._sequenceDatas, sequence)
    return sequence
end

-- 原生lua的
function MVVMBase:start_lua_coroutine(func)
    local co = coroutine.start(func)
    self._luaCoroutineList = self._luaCoroutineList or {}
    self._luaCoroutineList[co] = co
    return co
end

-- Unity中的LuaCoroutine.cs中的协程
function MVVMBase:start_unity_coroutine(func)
    local co = StartCoroutine(func)
    self._coroutineList = self._coroutineList or {}
    self._coroutineList[co] = co
    return co
end

-- 原生lua的
function MVVMBase:stop_lua_coroutine(co)
    coroutine.stop(co)
    if self._luaCoroutineList then
        self._luaCoroutineList[co] = nil
    end
end

-- Unity中的LuaCoroutine.cs中的协程
function MVVMBase:stop_unity_coroutine(co)
    StopCoroutine(co)
    if self._coroutineList then
        self._coroutineList[co] = nil
    end
end


function MVVMBase:clear_all_sequence()
    for _, v in pairs(self._sequenceDatas) do
        DOTween.Kill(v.id, false)
        --print("kill sequence-------------", v.id)
    end
    self._sequenceDatas = {}
end

function MVVMBase:subscibe_app_focus_event(onAppFocusCallback)
    if onAppFocusCallback then
        self._onAppFocusCallbackList = self._onAppFocusCallbackList or {}
        table.insert(self._onAppFocusCallbackList, onAppFocusCallback)
        ApplicationEvent.subscibe_app_focus_event(onAppFocusCallback)
    end
end

function MVVMBase:http_get(requestData, responeSuccessCallback, responeErrorCallback, responeCacheData, serverErrorCallback)
    Util.http_get(requestData, function(data)
        if(self and (not self._clearedHttpCallback))then
            if(responeSuccessCallback)then
                responeSuccessCallback(data)
            end
        end
    end, function(data)
        if(self and (not self._clearedHttpCallback))then
            if(responeErrorCallback)then
                responeErrorCallback(data)
            end
        end
    end, function(data)
        if(self and (not self._clearedHttpCallback))then
            if(responeCacheData)then
                responeCacheData(data)
            end
        end
    end, function(data)
        if(self and (not self._clearedHttpCallback))then
            if(serverErrorCallback)then
                serverErrorCallback(data)
            elseif data then
                --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
            end
        end
    end)
end


function MVVMBase:http(requestData, responeSuccessCallback, responeErrorCallback, responeCacheData, serverErrorCallback)
    if requestData.params.uid then
        if not requestData.url then
            requestData.url = requestData.baseUrl
        end
        requestData.baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. requestData.url
        if not requestData.cacheDataKey then
            requestData.cacheDataKey = string.format("%suid=%s", requestData.url, requestData.params.uid)
            requestData.cacheDataImmediatelyCallback = true
        end
    end
    self:http_get(requestData, responeSuccessCallback, responeErrorCallback, responeCacheData, serverErrorCallback)
end


function MVVMBase:clear_all_http_get()
    self._clearedHttpCallback = true
end


function MVVMBase:begin_location(callback, forbidUserCacheData)
    ModuleCache.GPSManager.begin_location(function (data)
        if not self._clearedLocationCallback then
            if callback then
                callback(data)
            end
        end
    end, forbidUserCacheData)
end

function MVVMBase:clear_all_location_callback()
    self._clearedLocationCallback = true
end

--获取通用数据
function MVVMBase:get_general_data(userId, userdataCallback)
    ModuleCache.UserDataManager.get_general_data(userId, function (userdata)
        if not self._is_destroyed and userdataCallback then
            userdataCallback(userdata)
        end
    end)
end

--获取货币数据
function MVVMBase:get_currency_data(userId, userdataCallback)
    ModuleCache.UserDataManager.get_currency_data(userId, function (userdata)
        if not self._is_destroyed and userdataCallback then
            userdataCallback(userdata)
        end
    end)
end

function MVVMBase:get_userinfo(playerId, callback)
    if not playerId then
        return
    end

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
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil)
    end)

end

--下载头像
function MVVMBase:startDownLoadHeadIcon(targetImage, url, callback)
    self:image_load_sprite(targetImage, url, callback)
end

--image加载Sprite图片
function MVVMBase:image_load_sprite(targetImage, url, callback, onErrorCallBack,useDefaultHead,errUseImg)
    if useDefaultHead  then
        if targetImage then
            targetImage.sprite =  modelData.defaultHead
        end


        if(callback)then
            callback(modelData.defaultHead)
        end
        return
    end
    
    if (not url or type(url) == "userdata" or url == "") then
        if targetImage then
            targetImage.sprite =  nil
        end

        if(callback)then
            callback(nil)
        end
        return
    end

    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(url, function(err, sprite)
        if(self._clearedDownLoadHeadIconCallback)then
            return
        end
        if(err) then
            print('error down load '.. url .. 'failed:' .. err.error)
            if string.find(err.error, 'Network Timeout') and string.find(err.error, 'http') == 1 then
                if(self)then
                    --connectCount = connectCount + 1
                    --if (connectCount < 3) then
                    --
                    --end
                    --self:image_load_sprite(targetImage, url, callback)
                end
                if onErrorCallBack then
                    onErrorCallBack()
                end
            end

            if errUseImg then
                if targetImage then
                    targetImage.sprite = errUseImg
                end
            end
        else
            if targetImage then
                targetImage.sprite = sprite
            end
            if(callback)then
                callback(sprite)
            end
        end
    end,nil,nil,nil,errUseImg)
end

--image加载Sprite图片
function MVVMBase:rawimage_load_sprite(targetImage, url, callback, onErrorCallBack)
    ModuleCache.TextureCacheManager.load_raw_texture(url, function(err, texture)
        if(self._clearedDownLoadHeadIconCallback)then
            return
        end
        if(err) then
            print('error down load '.. url .. 'failed:' .. err.error)
            if string.find(err.error, 'Network Timeout') and string.find(err.error, 'http') == 1 then
                if(self)then
                    --connectCount = connectCount + 1
                    --if (connectCount < 3) then
                    --
                    --end
                    --self:image_load_sprite(targetImage, url, callback)
                end
                if onErrorCallBack then
                    onErrorCallBack()
                end
            end

        else
            if targetImage then
                targetImage.texture = texture
            end
            if(callback)then
                callback(texture)
            end
        end
    end)
end

function MVVMBase:share_room_info_text(shareData)
    self._share_room_info_text = true
    ModuleCache.ShareManager().share_room_info_text(shareData)
end

function MVVMBase:clear_share_room_info_text(shareData)
    if self._share_room_info_text then
        self._share_room_info_text = false
        ModuleCache.ShareManager().clear_share_room_info_text()
    end
end

function MVVMBase:clear_all_down_load_head_icon_callback()
    self._clearedDownLoadHeadIconCallback = true
end



function MVVMBase:base_destroy()
    MVVMBase.clear_all_time_event(self)
    MVVMBase.clear_all_sequence(self)
    MVVMBase.clear_all_http_get(self)
    MVVMBase.clear_all_location_callback(self)
    self:clear_all_down_load_head_icon_callback()
    self._is_destroyed = true
    if self._onAppFocusCallbackList then
        for i=1,#self._onAppFocusCallbackList do
            ApplicationEvent.unsubscibe_app_focus_event(self._onAppFocusCallbackList[i])
        end
    end
    if self._share_room_info_text then
        ModuleCache.ShareManager().clear_share_room_info_text()
    end

    if self._luaCoroutineList then
        for k, v in pairs(self._luaCoroutineList) do
            coroutine.stop(v)
        end
    end

    if self._coroutineList then
        for k, v in pairs(self._coroutineList) do
            StopCoroutine(v)
        end
    end
end

return MVVMBase