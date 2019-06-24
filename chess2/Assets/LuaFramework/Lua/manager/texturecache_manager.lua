




local ModuleCache = ModuleCache
---@class TextureCacheManager
local TextureCacheManager = { }

local rootPath = UnityEngine.Application.persistentDataPath
local cachePath = rootPath .. "/cachefiles"
local coroutine = coroutine

TextureCacheManager._spriteCaches = { }
-- TextureCacheManager._spriteDownload
-- ==============================--
-- desc:
-- time:2017-07-05 10:02:58
-- @url:
-- @onFinish: 回调函数
-- @callModule: 调用的模块（用来判断回调时是否可用）
-- @isUseFormat: 是否使用格式下载,为true,安卓使用ETCRGB4,苹果使用PVRTCRGB4;为false或nil,默认使用ARGB32
-- @return
-- ==============================--

function TextureCacheManager.init()
    if TextureCacheManager._init then
        return
    end

    require("UnityEngine.AsyncOperation")
    require("UnityEngine.Texture")
    require("UnityEngine.Texture2D")

    local t = typeof('UnityEngine.TextureFormat')
    local field = tolua.getfield(t, 'RGB24')
    TextureCacheManager.textprompt = field:Get(nil)
    TextureCacheManager._init = true
end

function TextureCacheManager.loadTexFromCacheOrDownload(url, onFinish, callModule, isUseFormat, isPng,errUseImg)
    if not TextureCacheManager._init then
        TextureCacheManager.init()
    end

    if url and type(url) ~= "string" then
        if errUseImg then
            onFinish(nil, errUseImg,nil)
        end
        return
    end

    if not url or not string.find(url, "http") then
        if errUseImg then
            onFinish(nil, errUseImg,nil)
        else
            print("loadTexFromCacheOrDownload url 错误：" , url)
            if ModuleCache.GameManager.developmentMode then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("loadTexFromCacheOrDownload url 错误：" , url);
            end
        end
        return
    end

    local pathMd5 = ModuleCache.SecurityUtil.GetMd5HashFromStr(url)
    local localPath = cachePath .. "/" .. pathMd5

    local sprite = TextureCacheManager._spriteCaches[localPath]
    if sprite then
        onFinish(nil, sprite,localPath)
        return
    end

    if (ModuleCache.FileUtility.Exists(localPath)) then
        -- 获取下载的图片
        local texture = TextureCacheManager._get_local_downLoad_texture(localPath, isUseFormat, isPng);
        if texture then
            local sprite = ModuleCache.CustomerUtil.CreateSpriteFromTexture(texture, 0, 0)
            TextureCacheManager._spriteCaches[localPath] = sprite
            onFinish(nil, sprite,localPath)
            return
        else
            print("read local texture failed")
        end
    end

    TextureCacheManager._get_texture_with_www(url, 10,function (err, texture)
        if callModule and callModule.isDestroy then
            return
        end

        if texture then
            local sprite = ModuleCache.CustomerUtil.CreateSpriteFromTexture(texture, 0, 0)
            TextureCacheManager._spriteCaches[localPath] = sprite
            onFinish(nil, sprite,localPath)
        else
            onFinish(err, nil,localPath)
        end
    end, localPath)

    --coroutine.start(TextureCacheManager._get_texture_with_unity_web_request, url, function(texture)
    --    TextureCacheManager._spriteCaches[localPath] = texture
    --    onFinish(nil, texture)
    --end)
end

function TextureCacheManager.load_raw_texture(url, onFinish)
    if not TextureCacheManager._init then
        TextureCacheManager.init()
    end
    if not url or not string.find(url, "http") then
        if ModuleCache.GameManager.developmentMode then
            print("loadTexFromCacheOrDownload url 错误：" .. url)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("loadTexFromCacheOrDownload url 错误：" .. url);
        end
        return
    end

    local pathMd5 = ModuleCache.SecurityUtil.GetMd5HashFromStr(url)
    local localPath = cachePath .. "/" .. pathMd5

    local texture = TextureCacheManager._spriteCaches[localPath]
    if texture then
        onFinish(nil, texture)
        return
    end

    if (ModuleCache.FileUtility.Exists(localPath)) then
        texture = TextureCacheManager._get_local_downLoad_texture(localPath);
        TextureCacheManager._spriteCaches[localPath] = texture
        onFinish(nil, texture)
    else
        TextureCacheManager._get_texture_with_www(url, 10,function (error, texture)
            local t = typeof('UnityEngine.TextureWrapMode')
            local field = tolua.getfield(t, 'Clamp')
            texture.wrapMode = field:Get(nil)
            if not texture then
                onFinish(error, nil)
            else
                TextureCacheManager._spriteCaches[localPath] = texture
                onFinish(nil, texture)
            end
        end, localPath)
        -- 暂时先屏蔽掉
        --coroutine.start(TextureCacheManager._get_texture_with_unity_web_request, url, function(texture)
        --    TextureCacheManager._spriteCaches[localPath] = texture
        --    onFinish(nil, texture)
        --end)
    end
end

-- 获取下载的图片
function TextureCacheManager._get_local_downLoad_texture(localPath)

    --local textureBytes = ModuleCache.FileUtility.ReadAllBytes(localPath)
    local textureBytes = ModuleCache.GameUtil.file_load(localPath)
    if ModuleCache.GameManager.isEditor then
        textureBytes = ModuleCache.FileUtility.ReadAllBytes(localPath)
    end

    local texture = ModuleCache.UnityEngine.Texture2D(1, 1, TextureCacheManager.textprompt, false)
    ModuleCache.UnityEngine.ImageConversion.LoadImage(texture, textureBytes, true)
    return texture
end

-- 获取本地聊天图片
TextureCacheManager._cachesChatTexture = {}
function TextureCacheManager._get_local_chat_texture(localPath)
    if TextureCacheManager._cachesChatTexture[localPath] then
        return TextureCacheManager._cachesChatTexture[localPath]
    end

    local textureBytes = ModuleCache.GameUtil.file_load(localPath)
    if ModuleCache.GameManager.isEditor then
        textureBytes = ModuleCache.FileUtility.ReadAllBytes(localPath)
    end

    local texture = ModuleCache.UnityEngine.Texture2D(1, 1, TextureCacheManager.textprompt, false)
    ModuleCache.UnityEngine.ImageConversion.LoadImage(texture, textureBytes, true)

    TextureCacheManager._cachesChatTexture[localPath] = texture
    if # TextureCacheManager._cachesChatTexture > 20 then
        TextureCacheManager._cachesChatTexture = {}
    end
    return texture
end

function TextureCacheManager.GetTexture2dSize(texture)
    return Vector2.New(texture.width,texture.height)
end

function TextureCacheManager._get_texture_with_www(url, timeOutReconnectTime, callback, localPath)
    ModuleCache.WWWUtil.GetSafe(url, 10):Subscribe( function(wwwOperation)
        local www = wwwOperation.www;
        ModuleCache.FileUtility.SaveFile(localPath, www.bytes, false)

        local texture = ModuleCache.UnityEngine.Texture2D(1, 1, TextureCacheManager.textprompt, false)
        ModuleCache.UnityEngine.ImageConversion.LoadImage(texture, www.bytes, true)
        callback(nil, texture)
    end , function(errorData)
        --超时重试
        if(errorData.error and errorData.error ~= '' and errorData.error == "Network Timeout") then
            if timeOutReconnectTime and timeOutReconnectTime - 1 > 0 then
                timeOutReconnectTime = timeOutReconnectTime - 1
                TextureCacheManager._get_texture_with_www(url, timeOutReconnectTime, callback, localPath)
                return
            end
        end

        callback(errorData, nil)
    end)
end

-- 这样的加载效率最高
function TextureCacheManager._get_texture_with_unity_web_request(url, callback)
    local unityWebRequest = ModuleCache.UnityEngine.Networking.UnityWebRequestTexture.GetTexture(url, true)
    ModuleCache.Coroutine.Yield(unityWebRequest:SendWebRequest())
    if unityWebRequest.isNetworkError or unityWebRequest.isHttpError then
        print(unityWebRequest.error)
        if callback then
            callback(unityWebRequest.error, nil)
        end
    else
        local texture = ModuleCache.UnityEngine.Networking.DownloadHandlerTexture.GetContent(unityWebRequest)
        if texture and callback then
            callback(nil, texture)
        end
    end
end


function TextureCacheManager:startDownLoadHeadIcon(url, callback)
    self.loadTexFromCacheOrDownload(url, function(err, HeadIcon)
        if (err) then
            print("error down load" .. url .. " failed:" .. err.error)
            if string.find(err.error, 'Network Timeout') and string.find(url, 'http') == 1 then
                -- if(self)then
                --     self:image_load_sprite(targetImage, url)
                -- end
            end
        else
            if (callback) then
                callback(HeadIcon)
            end
        end
    end )
end






return TextureCacheManager;


