
local ModuleCache = ModuleCache
local GameParameters = GameParameters
---@class OssManager
local OssManager = {}

local accessKeyId = GameParameters.OssAccessKeyId
local accessKeySecret = GameParameters.OssAccessKeySecret
local host = GameParameters.OssHost

OssManager.upload_file = function(key, filePath, bytes, onFinish, upLoadTimes,contentType, onProgress, onError)

	local data
	if(filePath)then
		if(not ModuleCache.FileUtility.Exists(filePath))then
			return
		end
		data = ModuleCache.FileUtility.ReadAllBytes(filePath)
	elseif(bytes)then
		if(bytes.Length and bytes.Length == 0)then
			return
		end
		data = bytes
	end
	local contentLength = data.Length
	local contentMD5 = ModuleCache.CustomerUtil.GetBytesMD5(data)
	local utcGMT = ModuleCache.CustomerUtil.GetUtcGMT()

	contentType = contentType or "application/octet-stream"

	local canonicalizedOSSHeaders = ""
	local canonicalizedResource = GameParameters.OssCanonicalizedResourcePath .. key
	local authorization = ModuleCache.CustomerUtil.GetAuthorization('PUT', contentMD5, contentType, utcGMT, canonicalizedOSSHeaders, canonicalizedResource, accessKeySecret, accessKeyId)

	local url = "http://" .. host .. '/' .. key;
	if string.find(key,"http") then
		url = key
	end

	local requestData = {
		baseUrl = url,
		headers = {
			['Content-Encoding'] = 'utf-8',
			['Content-Md5'] = contentMD5,
			['Content-Disposition'] = 'attachment;filename=' .. key,
			['Date'] = utcGMT,
			['Content-Length'] = contentLength,
			['Host'] = host,
			['Authorization'] = authorization,
			['Content-Type'] = contentType,
		},
		uploadBytes = true,
		bytes = data,
		--uploadFile = true,
		--filePath = filePath,
	}

	--发送图片消息时去掉 "Content-Disposition"   有"Content-Disposition" 在浏览器打开是下载
	if contentType == "image/jpeg" then
		requestData.headers["Content-Disposition"] = nil
	end

	print_table(requestData, '----------------------------------------')
	upLoadTimes = upLoadTimes or 5
	ModuleCache.GameUtil.besthttp_put(requestData, function(retData)
		if(retData and retData.IsSuccess)then
			if(onFinish)then
				onFinish(key, filePath, bytes, url)
			end
			--print('上传'..filePath..'成功')
		else
			if(retData and retData.StatusCode == 403)then
				local text = retData.DataAsText
				if(string.find(text, 'RequestTimeTooSkewed'))then
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请检查您的系统时间是否准确")
					return
				end
			end
			upLoadTimes = upLoadTimes - 1
			if(upLoadTimes > 0)then
				OssManager.upload_file(key, filePath, bytes, onFinish, upLoadTimes,contentType)
			else
				if(onError)then
					onError('上传失败')
				end
			end
		end
	end, function(finished, total)
		if(onProgress)then
			onProgress(finished, total)
		end
	end, function(err)
		upLoadTimes = upLoadTimes - 1
		if(upLoadTimes > 0)then
			OssManager.upload_file(key, filePath, bytes, onFinish, upLoadTimes,contentType)
		else
			if(onError)then
				onError('上传失败')
			end
		end
	end)

end

OssManager.download_file = function(key, filePath, onFinish, requestTimes)

	local url = "http://" .. host .. '/' .. key;
	if string.find(key,"http") then
		url = key
	end

	local requestData = {
		baseUrl = url
	}
	requestTimes = requestTimes or 5
	ModuleCache.GameUtil.http_get(requestData, function(wwwRet)
		--print('text=', wwwRet.www.text)
		local bytes = wwwRet.www.bytes
		ModuleCache.FileUtility.SaveFile(filePath, bytes)
		if(onFinish)then
			onFinish(key, filePath, requestData.baseUrl)
		end
	end, function(err)
		requestTimes = requestTimes - 1
		if(requestTimes > 0)then
			OssManager.download_file(key, filePath, onFinish, requestTimes)
		end
	end)
end

return OssManager

