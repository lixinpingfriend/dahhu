




local ModuleCache = ModuleCache
local AssetBundleManager = LuaBridge.AssetBundleManager.instance
local CustomImageManager = {}
CustomImageManager.CachesTexture = {} --缓存图片文件

local TextureScaler = require("TextureScaler")

--require 时删除本地的图片文件
local imagePath = UnityEngine.Application.persistentDataPath .. "/image"
ModuleCache.FileUtility.DirectoryDelete(imagePath, true)
ModuleCache.FileUtility.DirectoryCreate(imagePath)

function CustomImageManager:init()

end

function CustomImageManager.set_event_listener(onUploadImageFileComplete, onDownloadImageFileComplete)
	CustomImageManager._onUploadImageFileComplete = onUploadImageFileComplete
	CustomImageManager._onDownloadImageFileComplete = onDownloadImageFileComplete
end


-- 上传图片文件i
function CustomImageManager.upload_image_file(bytes, imageSizeV2)
	local texture = ModuleCache.UnityEngine.Texture2D(1, 1)
	ModuleCache.UnityEngine.ImageConversion.LoadImage(texture, bytes)

	local v2 = ModuleCache.TextureCacheManager.GetTexture2dSize(texture)
	if v2.x > 1280 and v2.y > 720 then
		if v2.x > v2.y then
			local height = math.ceil(1280 * v2.y / v2.x)

			texture = TextureScaler.scaled(texture, 1280, height,3)
			bytes = UnityEngine.ImageConversion.EncodeToJPG(texture, 50)

			v2 = Vector2.New(1280, height)
		else
			local with = math.ceil(720 * v2.x / v2.y)

			texture = TextureScaler.scaled(texture, with, 720,3)
			bytes = UnityEngine.ImageConversion.EncodeToJPG(texture, 50)

			v2 = Vector2.New(with, 720)
		end
	else
		if v2.x > 1280  then
			local height = math.ceil(1280 * v2.y / v2.x)

			texture = TextureScaler.scaled(texture, 1280, height,3)
			bytes = UnityEngine.ImageConversion.EncodeToJPG(texture, 50)

			v2 = Vector2.New(1280, height)
			--ModuleCache.FileUtility.SaveFile(UnityEngine.Application.persistentDataPath .. "/screenShot/uploadImg.jpg", bytes, false)
		elseif v2.y > 720  then
			local with = math.ceil(720 * v2.x / v2.y)

			texture = TextureScaler.scaled(texture, with, 720,3)
			bytes = UnityEngine.ImageConversion.EncodeToJPG(texture, 50)

			v2 = Vector2.New(with, 720)
		end
	end

	local key = 'image/' .. Util.get_tokenAndTimestamp(ModuleCache.PlayerPrefsManager.GetString(AppData.PLAYER_PREFS_KEY_USERID, "0")) .."_"..v2.x.."_"..v2.y .."_new.jpg"
	ModuleCache.OssManager.upload_file(key, nil, bytes, function(key, path, bytes, url)
		if(CustomImageManager._onUploadImageFileComplete)then
			CustomImageManager._onUploadImageFileComplete(key)
		end
	end,nil,"image/jpeg")--"application/octet-stream"		"image/jpeg"
end

-- 下载图片文件
function CustomImageManager.download_image_file(key, savePath, callback)
	if(key)then
		local arr = string.split(key, "_")
		if # arr == 3 then -- 加客服系统前上传的图片   key为 “imag/xxxxxxx_120_123”
			key = arr[1]
		end
		--print("$$$$$$$$$$$$$$",key)
		if CustomImageManager.CachesTexture[key] then
			if callback then
				callback(CustomImageManager.CachesTexture[key])
			end
		else
			ModuleCache.OssManager.download_file(key, savePath, function(key, path, url)
				if(CustomImageManager._onDownloadImageFileComplete)then
					CustomImageManager._onDownloadImageFileComplete(path)
				end
				if callback then
					callback(path)
				end
				CustomImageManager.CachesTexture[key] = path
			end)
		end

	end
end


return CustomImageManager