local ModuleCache = ModuleCache
local Log = ModuleCache.Log
local UnityEngine = UnityEngine
local base = _G
-- local GameManager = ModuleCache.GameManager
local AppData = AppData
local string = string
local table = table
local io = io
local type = type
local bit = require('bit')

Util = {}

---@class GameUtil
---@class Util
local Util = Util
local debug = debug

local _get_call_info = function (text)
    local str = text
    for level = 3, 6 do
        -- 打印堆栈每一层
        local info = debug.getinfo(level, "nSl")
        if info == nil then break end
        str = str .. string.format(" [%s:%d %s]", info.source or "", info.currentline, info.name or "")
    end
    return str
end

function Util.split(str, delimiter)
    if str == nil or str == '' or delimiter == nil then
        return nil
    end
    local result = {}
    for match in(str .. delimiter):gmatch("(.-)" .. delimiter) do
        table.insert(result, match)
    end
    return result
end

function Util.get_tokenAndTimestamp(userID)
    local timestamp = os.time()
    local token = ModuleCache.SecurityUtil.Getmd5JiaMi(timestamp, userID, AppData.SALT_A, AppData.SALT_B)
    return token, timestamp
end

function Util.formatParamsForHttp(t, sortFun, exceptKeys)
    local str = ""
    local index = 0
    local keyList = {}
    for i, v in pairs(t) do
        table.insert(keyList, i)
    end
    if(sortFun)then
        sortFun(keyList)
    end
    local is_exceptKey = function(key)
        if(exceptKeys)then
            for i, v in pairs(exceptKeys) do
                if(v == key)then
                    return true
                end
            end
        end
        return false
    end
    for i,key in pairs(keyList) do
        if(not is_exceptKey(key))then
            local val = t[key]
            if(index == 0)then
                str = key .. "=" .. Util.encodeURL(val)
            else
                --  print("#########################"..k.."="..v..".")
                str = str .. "&" .. key .. "=" .. Util.encodeURL(val)
            end
            index = 1
        end
    end
    return str
end

function Util.guid()
    local seed = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'}
    local tb = {}
    for i=1,32 do
        table.insert( tb, seed[math.random( 1, 16 )])
    end
    local sid = table.concat(tb)
    return string.format('%s-%s-%s-%s-%s',
        string.sub( sid, 1, 8),
        string.sub( sid, 9, 12),
        string.sub( sid, 13, 16),
        string.sub( sid, 17, 20),
        string.sub( sid, 21, 32)     
    )
end


function Util.getPreciseDecimal(nNum, n)
    if type(nNum) ~= "number" then
        return nNum;
    end
    
    n = n or 0;
    n = math.floor(n)
    local fmt = '%.' .. n .. 'f'
    local nRet = tonumber(string.format(fmt, nNum))

    return nRet;
end
--获取中英混合UTF8字符串的真实字符数量
function Util.SubStringGetTotalIndex(str)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat
        lastCount = Util.SubStringGetByteCount(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until(lastCount == 0);
    return curIndex - 1;
end
function Util.SubStringGetTrueIndex(str, index)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat
        lastCount = Util.SubStringGetByteCount(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until(curIndex >= index);
    return i - lastCount;
end

--返回当前字符实际占用的字符数
function Util.SubStringGetByteCount(str, index)
    local curByte = string.byte(str, index)
    local byteCount = 1;
    if curByte == nil then
        byteCount = 0
    elseif curByte > 0 and curByte <= 127 then
        byteCount = 1
    elseif curByte>=192 and curByte<=223 then
        byteCount = 2
    elseif curByte>=224 and curByte<=239 then
        byteCount = 3
    elseif curByte>=240 and curByte<=247 then
        byteCount = 4
    end
    return byteCount;
end
--截取中英混合的UTF8字符串，endIndex可缺省
function Util.SubStringUTF8(str, startIndex, endIndex)
    if startIndex < 0 then
        startIndex = Util.SubStringGetTotalIndex(str) + startIndex + 1;
    end

    if endIndex ~= nil and endIndex < 0 then
        endIndex = Util.SubStringGetTotalIndex(str) + endIndex + 1;
    end

    if endIndex == nil then
        return string.sub(str, Util.SubStringGetTrueIndex(str, startIndex));
    else
        return string.sub(str, Util.SubStringGetTrueIndex(str, startIndex), Util.SubStringGetTrueIndex(str, endIndex + 1) - 1);
    end
end

function Util.filterPlayerGoldNumWan(num)
    local str = ""
    if (num == nil or type(num) ~= "number") then
        return ""
    end
    if (num > 9999 and num < 100000000) then
        str = string.format("%0.1f万", math.floor(num / 10000 * 10) / 10)
    elseif (num > 99999999) then
        str = string.format("%0.2f亿", math.floor(num / 100000000 * 100) / 100)
    else
        return ("" .. num)
    end
    local len = string.len(str)
    local lnum = string.sub(str, len - 3, len - 3)
    local danwei = string.sub(str, len - 2, len)
    local zheng = string.sub(str, 1, len - 5)
    if lnum == "0" then
        str = zheng .. danwei
    end
    return str
end

function Util.filterPlayerGoldNum(num)
    if(num == nil or type(num) ~= "number") then
        return ""
    end

    if(num > 99999 or num < -99999) then
        return string.format("%0.1f万", math.floor(num / 10000 * 10) / 10)
    end
    return ("" .. num)
end

function Util.filterPlayerName(name, maxCharLen, isRedName)
    if(not name or type(name) ~= "string" or name == "") then
        return ""
    end
    maxCharLen = maxCharLen or 8
    local newName = ""
    name = name or ""
    local lenInByte = #name
    local width = 0
    local inputLen = 0
    local i = 1
    local lastNewName = ""
    while (i<=lenInByte) 
    do
        local curByte = string.byte(name, i)
        local byteCount = 1;
        local addLen = 0
        if curByte>0 and curByte<=127 then
            byteCount = 1                                               --1字节字符
            addLen = 1
        elseif curByte>=192 and curByte<223 then
            byteCount = 2                                               --双字节字符
            addLen = 2
        elseif curByte>=224 and curByte<239 then
            byteCount = 3                                               --汉字
            addLen = 2
        elseif curByte>=240 and curByte<=247 then
            byteCount = 4                                               --4字节字符
            addLen = 2
        else
            byteCount = 3
            addLen = 2
        end
        if(inputLen + addLen > maxCharLen)then
            return lastNewName .. ".."
        end
        inputLen = inputLen + addLen
        local char = string.sub(name, i, i+byteCount-1)
        i = i + byteCount                                              -- 重置下一字节的索引
        width = width + 1                                             -- 字符的个数（长度）
        lastNewName = newName
        newName = newName .. char
    end
    if isRedName then
        newName = "<color=red>" .. newName  .. "</color>"
    end
    return newName
end

function Util.GetPreciseDecimal(nNum, n)
    if type(nNum) ~= "number" then
        return nNum;
    end

    n = n or 0;
    n = math.floor(n)
    local fmt = '%.' .. n .. 'f'
    local nRet = tonumber(string.format(fmt, nNum))

    return nRet;
end

function string.widthSingle(inputstr)
    -- 计算字符串宽度
    -- 可以计算出字符宽度，用于显示使用
   local lenInByte = #inputstr
   local width = 0
   local i = 1
    while (i<=lenInByte) 
    do
        local curByte = string.byte(inputstr, i)
        local byteCount = 1;
        if curByte>0 and curByte<=127 then
            byteCount = 1                                               --1字节字符
        elseif curByte>=192 and curByte<223 then
            byteCount = 2                                               --双字节字符
        elseif curByte>=224 and curByte<239 then
            byteCount = 3                                               --汉字
        elseif curByte>=240 and curByte<=247 then
            byteCount = 4                                               --4字节字符
        end
         
        local char = string.sub(inputstr, i, i+byteCount-1)
--        print(char)                                                          --看看这个字是什么
        i = i + byteCount                                              -- 重置下一字节的索引
        width = width + 1                                             -- 字符的个数（长度）
    end
    return width
end

-- @param requestData baseUrl 
-- @param requestData params                        --请求参数，如果有uid 那么会自动添加token
-- @param requestData showModuleNetprompt           --是否显示ModuleNetprompt 以阻塞界面
-- @param requestData notRequiredGameName           --不需要传gameName
-- @param requestData disableTimeOutReconnectTime   --不需要超时重连
-- @param respone 标题
-- @param responeError 内容 
-- @param responeCacheData 缓存的数据返回
function Util.http_get(requestData, responeSuccessCallback, responeErrorCallback, responeCacheData, serverErrorCodeCallback)
    local requestUrl = requestData.baseUrl

    if requestData.params then
        if(not requestData.notRequiredGameName and  not requestData.params.gameName) then
            requestData.params.gameName = AppData.get_url_game_name()
        end

        if requestData.params.uid and not requestData.notRequiredToken then
            requestData.params.token, requestData.params.timestamp = Util.get_tokenAndTimestamp(requestData.params.uid)

            if AppData.userToken then
                requestData.params.userToken = AppData.userToken
            end
        end

        if(string.find(requestUrl, "user/info?") and tostring(requestData.params.uid) == "0") then
            local text = _get_call_info("user/info传入uid为0")
            ModuleCache.LogManager.custom_Log(text)
            ModuleCache.Log.report_exception("user/info传入uid为0", text)
            ModuleCache.TalkingDataMgr().setEventWithUID("UserInfo_UID非法")
            if ModuleCache.GameManager.isEditor then
                error("user/info传入uid为0")
            end
            return
        end


        requestData.params.osTypeVersion = ModuleCache.GameManager.operatingSystem
        requestData.params.deviceType = ModuleCache.GameManager.deviceModel
        requestData.params.platform = Util.platform
        requestData.params.bundleIdentifier = Util.identifier
        requestData.params.appversion = Util.appversion
        requestData.params.appAssetVersion = ModuleCache.GameManager.appAssetVersion

        if requestData.params.gameName and ModuleCache.AppData.is_universal_app_game(requestData.params.gameName) and not requestData.getAppUpgradeInfo then
            local tmp = string.split(requestData.params.gameName, '_')
            if tmp and #tmp > 1 then
                requestData.params.gameName = ModuleCache.AppData.Const_Universal_App_Name .. "_" .. tmp[2]
            end
        end

        requestUrl = requestUrl .. Util.formatParamsForHttp(requestData.params)

    end

    local timeOut = 10
    if requestData.cacheDataKey then
        timeOut = 5
    end

    if requestData.requestTimeOut then
        timeOut = requestData.requestTimeOut
    end

    local timeOutReconnectTime = 6
    if requestData.disableTimeOutReconnectTime then
        timeOutReconnectTime = 0
    end

    if requestData.timeOutReconnectTime then
        timeOutReconnectTime = requestData.timeOutReconnectTime
    end

    if requestData.showModuleNetprompt then
        ModuleCache.ModuleManager.show_public_module("netprompt")
    end

    local sucessCallback, errorCallback

    sucessCallback = function(sucessData)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end


        --自动上传log日志设置
        if(requestData.params and requestData.params.uid and string.find(requestData.baseUrl, "user/info?")) then
            local retData = ModuleCache.GameUtil.json_decode_to_table(sucessData.www.text)
            if retData and retData.ret and retData.ret == 0 then    --OK
                if retData.data.isRedName then
                    retData.data.nickname = string.format("<color=red>%s</color>", retData.data.nickname)
                end

                if tostring(requestData.params.uid) == tostring(ModuleCache.LogManager.uid) then
                    if (ModuleCache.LogManager.uid and retData.data.uploadLogStatus ~= 0 ) then
                        ModuleCache.LogManager.auto_upload_log_archive(retData.data.uploadLogStatus)
                    end
                end
            else
                --ModuleCache.Log.report_exception("获取userInfo失败", tostring(requestData.params.uid) .. " | " .. tostring(sucessData.www.text))
                ModuleCache.LogManager.custom_Log(string.format("获取userInfo失败：%s\n%s", requestData.baseUrl, sucessData.www.text))

                timeOutReconnectTime = timeOutReconnectTime - 1 --只重试6次
                if timeOutReconnectTime >= 0 then
                    if requestData.isPost then
                        Util.__http_post(requestUrl, requestData, sucessCallback, errorCallback)
                    else
                        Util.__http_get(requestUrl, timeOut, timeOutReconnectTime, sucessCallback, errorCallback)
                    end 
                else
                    ModuleCache.Log.report_exception("获取userInfo一直没成功", tostring(requestData.params.uid))
                    ModuleCache.LogManager.custom_Log(string.format("获取userInfo一直没成功：%s\n%s", requestData.baseUrl, sucessData.www.text))
                end
                return
            end
        end

        -- 因为之前的WWWUtil错误的时候，不会抛出错误，所以打了个补丁
        if responeSuccessCallback then
            responeSuccessCallback(sucessData)
        end

        if requestData.cacheDataKey then
            local retData = ModuleCache.GameUtil.json_decode_to_table(sucessData.www.text)
            if retData and retData.ret and retData.ret == 0 then
                ModuleCache.PlayerPrefsManager.SetString(requestData.cacheDataKey, sucessData.www.text)
            end
        end
    end

    errorCallback = function (errorData)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end

        -- 是否缓存数据,
        if requestData.cacheDataKey and responeCacheData then
            local text = ModuleCache.PlayerPrefsManager.GetString(requestData.cacheDataKey, "")
            if text ~= "" then
                responeCacheData(text)
                return
            end
        end

        if responeErrorCallback then
            responeErrorCallback(errorData)
        end

        if(errorData.error and errorData.error ~= '')then
            Util.parseServerError(errorData, not requestData.hideTips500Error, requestUrl)
            --if(data and serverErrorCodeCallback)then
            --    serverErrorCodeCallback(data)
            --end
        end
        print(errorData.error)
    end
    if requestData.isPost then
        Util.__http_post(requestUrl, requestData, sucessCallback, errorCallback)
    else
        Util.__http_get(requestUrl, timeOut, timeOutReconnectTime, sucessCallback, errorCallback)
    end 

    if requestData.cacheDataKey then
        timeOut = 5
        if requestData.cacheDataImmediatelyCallback or requestData.cacheDataImmediatelyCallbackAndSuccessCallback then
            local text = ModuleCache.PlayerPrefsManager.GetString(requestData.cacheDataKey, "")
            if text ~= "" then
                if(string.find(requestData.baseUrl, "user/info?")) and not Util.string_is_json(text)then
                    return
                end

                responeSuccessCallback({www = { text = text }})
                if not requestData.cacheDataImmediatelyCallbackAndSuccessCallback and requestData.cacheDataImmediatelyCallback then
                    responeCacheData = nil
                    responeSuccessCallback = nil
                    responeErrorCallback = nil
                end
                if requestData.showModuleNetprompt then
                    ModuleCache.ModuleManager.hide_public_module("netprompt")
                end
                requestData.showModuleNetprompt = false
            end
        end
    end
end

function Util.__http_get(requestUrl, timeOut, timeOutReconnectTime, sucessCallback, errorCallback)
    ModuleCache.WWWUtil.GetSafe(requestUrl, timeOut):Subscribe(function(wwwData)
        if sucessCallback then
            sucessCallback(wwwData)
        end
    end, function(errorData)
        --超时重试
        if(errorData.error and errorData.error ~= '' and errorData.error == "Network Timeout") then
            ModuleCache.GameManager.get_and_set_net_adress()
            if timeOutReconnectTime and timeOutReconnectTime - 1 > 0 then
                timeOutReconnectTime = timeOutReconnectTime - 1
                Util.__http_get(requestUrl, timeOut, timeOutReconnectTime, sucessCallback, errorCallback)
                return
            end
        end

        if errorCallback then
            errorCallback(errorData)
        end
        ModuleCache.LogManager.custom_Log(string.format("http请求错误：%s\n%s", requestUrl, errorData.error))
        ModuleCache.TalkingDataMgr().setEventWithUID("http请求错误", {url = requestUrl, error = errorData.error})
    end)
end

function Util.__http_post(requestUrl, requestData, sucessCallback, errorCallback)
    Util.post_data(requestUrl, requestData, sucessCallback, errorCallback)
end



function Util.post_data(requestUrl, requestData, responeSuccessCallback, responeErrorCallback)
    local requestUrl =  requestData.baseUrl
    local headers = ModuleCache.CustomerUtil.GenerateEmptyStringStringDic()
    if requestData.headers then
        for i, v in pairs(requestData.headers) do
            headers:Add(i .. '', v .. '')
        end
    end

    if requestData.showModuleNetprompt then
        ModuleCache.ModuleManager.show_public_module("netprompt")
    end
    local str = ""
    for key, value in pairs(requestData.params) do
        if str ~= "" then str = str .. "&" end 
        str = str .. key.. "=" .. value
    end
    ModuleCache.WWWUtil.Post_Data(requestUrl, str, headers):Subscribe(function(wwwData)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end

        if responeSuccessCallback then
            responeSuccessCallback(wwwData)
        end
    end, function(wwwData)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end
        if responeErrorCallback then
            responeErrorCallback(wwwData)
        end
        print(wwwData.error)
    end)
end

function Util.besthttp_put(requestData, responeSuccessCallback, onProgressCallback, responeErrorCallback)
    local requestUrl = requestData.baseUrl
    local headers = ModuleCache.CustomerUtil.GenerateEmptyStringStringDic()
    if requestData.headers then
        for i, v in pairs(requestData.headers) do
            headers:Add(i .. '', v .. '')
        end
    end

    if requestData.showModuleNetprompt then
        ModuleCache.ModuleManager.show_public_module("netprompt")
    end
    local operation = ModuleCache.BestHttpUtil.Create(requestUrl, 'Put', headers, 0)
    if (requestData.uploadFile) then
        operation:SetUploadStream(requestData.filePath)
    elseif (requestData.uploadBytes) then
        operation:SetStreamData(requestData.bytes)
    end

    operation:Subscribe(function(bestHttpOperation)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end

        if responeSuccessCallback then
            responeSuccessCallback(bestHttpOperation.httpRsp)
        end
    end, function(op)
        if(onProgressCallback)then
            onProgressCallback(0, 1)
        end
    end , function(err)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end
        if responeErrorCallback then
            responeErrorCallback(err)
        end
        print(err)
    end)
    operation:Start()
end

function Util.parseServerError(wwwData, tips500Error, requestUrl)
    if tostring(wwwData.error):find("500") ~= nil or tostring(wwwData.error):find("internal server error") ~= nil then
        if wwwData.www.text then
            local retData = wwwData.www.text
            local text = string.format("HTTP请求异常：%s -- %s", requestUrl, retData)
            ModuleCache.LogManager.custom_Log(text)
            retData = ModuleCache.Json.decode(retData)
            if retData and retData.errMsg then
                retData = ModuleCache.Json.decode(retData.errMsg)
                ModuleCache.TalkingDataMgr().setEventWithUID("HTTP请求异常_" .. retData.code)
                if retData.code == "INVALID_USER" then
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                    ModuleCache.GameManager.logout(true)
                elseif retData.code == "TOKEN_EXPIRE" then
                    ModuleCache.GameManager.logout(true)
                elseif retData.code == "SYS_ERR" then
                    ModuleCache.Log.report_exception("HTTP请求异常")
                    if ModuleCache.GameManager.developmentMode then
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                    end
                else
                    if tips500Error then
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                    end
                end
                if ModuleCache.GameManager.developmentMode then
                    ModuleCache.GameSDKInterface:CopyToClipboard(requestUrl)
                end
                return retData
            end
        end
    end
    return nil
end


function Util.encodeURL(s)
    return (string.gsub(s, "([^A-Za-z0-9_])", function(c)
        return string.format("%%%02x", string.byte(c))
    end))
end

function Util.decodeURL(s)
    return (string.gsub(s, "%%(%x%x)", function(hex)
        return string.char(base.tonumber(hex, 16))
    end))
end

local function encodeBase64(source_str)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local s64 = ''
    local str = source_str

    while #str > 0 do
        local bytes_num = 0
        local buf = 0

        for byte_cnt=1,3 do
            buf = (buf * 256)
            if #str > 0 then
                buf = buf + string.byte(str, 1, 1)
                str = string.sub(str, 2)
                bytes_num = bytes_num + 1
            end
        end

        for group_cnt=1,(bytes_num+1) do
            local b64char = math.fmod(math.floor(buf/262144), 64) + 1
            s64 = s64 .. string.sub(b64chars, b64char, b64char)
            buf = buf * 64
        end

        for fill_cnt=1,(3-bytes_num) do
            s64 = s64 .. '='
        end
    end

    return s64
end

local function decodeBase64(str64)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local temp={}
    for i=1,64 do
        temp[string.sub(b64chars,i,i)] = i
    end
    temp['=']=0
    local str=""
    for i=1,#str64,4 do
        if i>#str64 then
            break
        end
        local data = 0
        local str_count=0
        for j=0,3 do
            local str1=string.sub(str64,i+j,i+j)
            if not temp[str1] then
                return
            end
            if temp[str1] < 1 then
                data = data * 64
            else
                data = data * 64 + temp[str1]-1
                str_count = str_count + 1
            end
        end
        for j=16,0,-8 do
            if str_count > 0 then
                str=str..string.char(math.floor(data/math.pow(2,j)))
                data=math.mod(data,math.pow(2,j))
                str_count = str_count - 1
            end
        end
    end

    local last = tonumber(string.byte(str, string.len(str), string.len(str)))
    if last == 0 then
        str = string.sub(str, 1, string.len(str) - 1)
    end
    return str
end


--==============================--
--desc:并行请求
--time:2017-04-24 03:33:30
--@requestData:
--@responeSuccessCallback:
--@responeErrorCallback:错误回调，需要等所有的请求都失败才会回调
--return 
--==============================--
function Util.http_get_concurrence(requestData, responeSuccessCallback, responeErrorCallback)
    local requestUrl = requestData.baseUrl
    if requestData.params then
        if requestData.params.uid then
            requestData.params.token, requestData.params.timestamp = Util.get_tokenAndTimestamp(requestData.params.uid)
        end
        requestUrl = requestUrl .. Util.formatParamsForHttp(requestData.params)
    end
    if requestData.showModuleNetprompt then
	    ModuleCache.ModuleManager.show_public_module("netprompt")
    end
    ModuleCache.WWWUtil.GetSafe(requestUrl, 10):Subscribe(function(wwwData)
        if requestData.showModuleNetprompt then 
	        ModuleCache.ModuleManager.hide_public_module("netprompt")
        end
        if responeSuccessCallback then
            responeSuccessCallback(wwwData)
        end
    end, function(wwwData)
        if requestData.showModuleNetprompt then
	        ModuleCache.ModuleManager.hide_public_module("netprompt")
        end
        if responeErrorCallback then 
            responeErrorCallback(wwwData)
        end 
        print(wwwData.error)
    end)
end

--@responeErrorCallback:错误回调，需要等所有的请求都失败才会回调
--return
--==============================--
function Util.http_get_concurrence(requestData, responeSuccessCallback, responeErrorCallback)
    local requestUrl = requestData.baseUrl
    if requestData.params then
        if requestData.params.uid then
            requestData.params.token, requestData.params.timestamp = Util.get_tokenAndTimestamp(requestData.params.uid)
        end
        requestUrl = requestUrl .. Util.formatParamsForHttp(requestData.params)
    end
    if requestData.showModuleNetprompt then
        ModuleCache.ModuleManager.show_public_module("netprompt")
    end
    ModuleCache.WWWUtil.GetSafe(requestUrl, 10):Subscribe(function(wwwData)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end
        if responeSuccessCallback then
            responeSuccessCallback(wwwData)
        end
    end, function(wwwData)
        if requestData.showModuleNetprompt then
            ModuleCache.ModuleManager.hide_public_module("netprompt")
        end
        if responeErrorCallback then
            responeErrorCallback(wwwData)
        end
        print(wwwData.error)
    end)
end


function Util.string_is_json(text)
    if text and type(text) == "string" and string.sub(text, 1, 1) == "{" then
        return true
    end
    return false
end

---转换成table
---@param text json内容
---@param urlDecode
function Util.json_decode_to_table(text, urlDecode)
    if not Util.string_is_json(text) then
        return nil
    end

    if urlDecode then
        text = Util.decodeURL(text)
    end
    return ModuleCache.Json.decode(text)
end

---table转换成json
---@param text table
---@param urlEncode table
function Util.table_encode_to_json(tableData, urlEncode)
    local retData = ModuleCache.Json.encode(tableData)
    if urlEncode then
        retData = Util.encodeURL(retData)
    end
    return retData
end


-- 去除字符串两边的空格  
function Util.trim(s)   
    return (string.gsub(s, "^%s*(.-)%s*$", "%1"))  
end

function Util.file_copy(sourceFilePath, targetFilePath)
    local file, error = io.open(sourceFilePath, "r")
    if file then
        local text
        if ModuleCache.FunctionManager.isEditor or ModuleCache.GameManager.customPlatformName == "Windows" then
            text = ModuleCache.FileUtility.ReadAllBytes(sourceFilePath)
            ModuleCache.FileUtility.SaveFile(targetFilePath, text, false)
        else
            text = file:read("*all")
            file:close()

            file, error = io.open(targetFilePath, "w")
            if file then
                file:write(text)
                file:close()
            else
                print("保存文件失败：" .. error)
                return false
            end
        end



    else
        print("读取文件失败：" .. error)
        return false
    end
    return true
end

function Util.file_load(filename, model)
    local file
    if filename == nil then
        file = io.stdin
    else
        local err
        file, err = io.open(filename, model or "rb")
        if file == nil then
            Log.print(("Unable to read '%s': %s"):format(filename, err))
            return nil
        end
    end
    local data = file:read("*a")

    if filename ~= nil then
        file:close()
    end

    if data == nil then
        Log.print("Failed to read " .. filename)
    end

    return data
end

function Util.file_save(filename, data, model)
    local file
    if filename == nil then
        file = io.stdout
    else
        local err
        file, err = io.open(filename, model or "wb")
        if file == nil then
            Log.print(("Unable to write '%s': %s"):format(filename, err))
            return nil
        end
    end
    file:write(data)
    if filename ~= nil then
        file:close()
    end
end

function Util.file_size(filename)
    local file
    if filename == nil then
        file = io.stdin
    else
        local err
        file, err = io.open(filename, "rb")
        if file == nil then
            Log.print(("Unable to read '%s': %s"):format(filename, err))
            return -1
        end
    end
    local size = file:seek("end")

    if filename ~= nil then
        file:close()
    end

    if size == nil then
        Log.print("Failed to read " .. filename)
    end

    return size
end

function Util.encodeBase64(source_str)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local s64 = ''
    local str = source_str

    while #str > 0 do
        local bytes_num = 0
        local buf = 0

        for byte_cnt=1,3 do
            buf = (buf * 256)
            if #str > 0 then
                buf = buf + string.byte(str, 1, 1)
                str = string.sub(str, 2)
                bytes_num = bytes_num + 1
            end
        end

        for group_cnt=1,(bytes_num+1) do
            local b64char = math.fmod(math.floor(buf/262144), 64) + 1
            s64 = s64 .. string.sub(b64chars, b64char, b64char)
            buf = buf * 64
        end

        for fill_cnt=1,(3-bytes_num) do
            s64 = s64 .. '='
        end
    end

    return s64
end


--解压base64编码的字符串
 function Util.decodeBase64(str64)
    local b64chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local temp={}
    for i=1,64 do
        temp[string.sub(b64chars,i,i)] = i
    end
    temp['=']=0
    local str=""
    for i=1,#str64,4 do
        if i>#str64 then
            break
        end
        local data = 0
        local str_count=0
        for j=0,3 do
            local str1=string.sub(str64,i+j,i+j)
            if not temp[str1] then
                return
            end
            if temp[str1] < 1 then
                data = data * 64
            else
                data = data * 64 + temp[str1]-1
                str_count = str_count + 1
            end
        end
        for j=16,0,-8 do
            if str_count > 0 then
                str=str..string.char(math.floor(data/math.pow(2,j)))
                data=math.fmod(data,math.pow(2,j))
                str_count = str_count - 1
            end
        end
    end
    local check_last = tonumber(string.byte(str, string.len(str), string.len(str)))  
    if check_last == 0 then  
        str = string.sub(str, 1, string.len(str) - 1)  
    end
    return str
end

Util.platform = ModuleCache.CustomerUtil.platform
Util.identifier = UnityEngine.Application.identifier
Util.appversion = UnityEngine.Application.version

function Util.set_cache_user_info(uid, userInfo_json)
    if(not uid)then
        return
    end
    ModuleCache.PlayerPrefsManager.SetString('cached_userInfo_' .. uid, userInfo_json)
end

function Util.get_cache_user_info(uid)
    if(not uid)then
        return nil
    end
    local userInfo_json = ModuleCache.PlayerPrefsManager.GetString('cached_userInfo_' .. uid, '')
    if(userInfo_json == '')then
        return nil
    end
    return userInfo_json
end

function handler(obj, method)
    return function(...)
        return method(obj, ...)
    end
end

function Util.SetHuziCard(obj, value, colorType, cardType)
    local image = obj.transform:Find("Image"):GetComponent("Image")
    local bundlePath = "huzi/module/table/huzi_tablecards/type".. colorType ..".atlas"
    local assetName = "" .. Huzi_Card_SpriteName[cardType] .. value
    image.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
end


--检测名字是否包含非法字符
local filterStrTab = {"元","角","分","毛","红包","房费"}
function Util.checkNameUnlawful(name)
    for i =1,#filterStrTab do
        if name:find(filterStrTab[i],1) then
            return false
        end
    end

    return true
end

function Util.sign_for_tuyou(params)
    local paramStr = Util.formatParamsForHttp(params, function(keyList)
        table.sort(keyList)
    end, {'sign'})
    local key = 'XRjJqrkG6ZsJReK8'
    local md5Str = ModuleCache.SecurityUtil.GetMd5HashFromStr(paramStr .. key)
    return string.lower(md5Str)
end

function Util.appGameNameToAppNameAndGameName(appGameName)
    if appGameName and string.find(appGameName, "_") then
        local tmp = string.split(appGameName, '_')
        return tmp[1], tmp[2]
    end
end


function Util.addCameraCullingMaskLayer(camera, layer)
    camera.cullingMask = bit.bor(camera.cullingMask, bit.lshift(1, layer))
end

function Util.addCameraCullingMaskLayerByLayerName(camera, layerName)
    Util.addCameraCullingMaskLayer(camera, LayerMask.NameToLayer(layerName))
end

function Util.removeCameraCullingMaskLayer(camera, layer)
    camera.cullingMask = bit.band(camera.cullingMask, bit.bnot(bit.lshift(1, layer)))
end

function Util.removeCameraCullingMaskLayerByLayerName(camera, layerName)
    Util.removeCameraCullingMaskLayer(camera, LayerMask.NameToLayer(layerName))
end

return Util