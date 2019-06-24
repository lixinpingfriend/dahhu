local try = require('lib.try')
local catch = require('lib.catch')
local finally = require('lib.finally')
local ModuleCache = ModuleCache
local Util = Util


local logFileDirPath = UnityEngine.Application.persistentDataPath .. "/log/"
---@class LogManager
local LogManager = {}
LogManager.uid = 0
LogManager.uploadLogStatus = false

local last_timestamp
local log_index = 1
local dateFormat = "%Y_%m_%d"
local timestampFormat1 = '%Y_%m_%d_%H_%M_%S'
local timestampFormat = "%Y/%m/%d %H:%M:%S"
local callback_table = {}
--最多保留天数+1
local log_maximum_period_of_days = 3
--最多保留的大小
local log_max_files_size = 100 * 1024 * 1024
--单个文件的大小
local log_single_file_size = 4 * 1024 * 1024
--清理日志的周期
local log_clear_period_of_times = 1 * 24 * 3600
--开启自动上传日志的周期，60分钟上传的间隔
local auto_upload_log_archive_period_of_times = 600

--上传清空logs的日期
local _last_clear_logs_time = 0


local is_uploaded_file = false
local fileSize = nil
local curFilePath = nil
local curDataTimeString = nil
local curDir = nil

local zipCompressFun = nil

local auto_upload_log_archive_time = 0
local start_auto_upload_log_archive_time = 0

LogManager.get_format_timestamp = function(forFileName, onlyDay, timestamp)
	timestamp = timestamp or os.time()
	if(forFileName)then
		return os.date(timestampFormat1, timestamp)
	end
	if(onlyDay)then
		return os.date(dateFormat, timestamp)
	end
	if(last_timestamp and last_timestamp == timestamp)then
		log_index = log_index + 1
	else
		log_index = 1
	end
	last_timestamp = timestamp
	local str = os.date(timestampFormat, timestamp) .. '-' .. log_index
	return str
end

LogManager.format_log = function(logString, stackTrace)
	local str
	local timestamp_str = string.format('【%s】', LogManager.get_format_timestamp())
	if(stackTrace)then
		str = string.format('%s %s\n%s', timestamp_str, logString, stackTrace)
	else
		str = string.format('%s %s', timestamp_str, logString)
	end
	return str
end

LogManager.custom_Log = function(logString, stackTrace)
	if(logString)then
		local str = string.format('\n【Log】%s ', LogManager.format_log(logString, stackTrace))
		LogManager.append2LogFile(str)
	end
end

LogManager.raw_Log = function(logString)
	LogManager.append2LogFile(logString)
end

LogManager.logHandle_Log = function(logString, stackTrace)
	LogManager.custom_Log(logString, stackTrace)
end

LogManager.logHandle_Error = function(logString, stackTrace)
	if(logString)then
		local str = string.format('\n【Error】%s ', LogManager.format_log(logString, stackTrace))
		LogManager.append2LogFile(str)
	end
end

LogManager.logHandle_Warning = function(logString, stackTrace)
	--if(logString)then
	--	local str = string.format('【Warning】%s\n', LogManager.format_log(logString, stackTrace))
	--	LogManager.append2LogFile(str)
	--end
end

LogManager.logHandle_Assert = function(logString, stackTrace)
	if(logString)then
		local str = string.format('\n【Assert】%s ', LogManager.format_log(logString, stackTrace))
		LogManager.append2LogFile(str)
	end
end

LogManager.logHandle_Exception = function(logString, stackTrace)
	if(logString)then
		local str = string.format('\n【Exception】%s', LogManager.format_log(logString, stackTrace))
		LogManager.append2LogFile(str)
	end
end

local logHandle
logHandle = function(logType, logString, stackTrace)
	logType = logType or ''
	local handle = LogManager['logHandle_' .. logType]
	if(handle)then
		handle(logString, stackTrace)
	end
end

LogManager.logHandle = logHandle

LogManager.register = function()
	--callback_table = {}
	--ModuleCache.CustomerUtil.RegisterLogCallback()
	--ModuleCache.CustomerUtil.logCallback = LogManager.logHandle
	ModuleCache.GameConfigProject.asyncFileOperationCallback = function(operationData)
		local guid = operationData.guid
		local callback = callback_table[guid]
		if(callback)then
			callback_table[guid] = nil
			callback(operationData)
		end
	end
end

LogManager.un_register = function()
	ModuleCache.CustomerUtil.logCallback = nil
end

LogManager.append2LogFile = function(appendStr)
	local dataTimeString = LogManager.get_format_timestamp(nil, true)
	local dir = LogManager.get_dir_path()
	if(curDataTimeString ~= dataTimeString or curDir ~= dir)then
		curDataTimeString = dataTimeString
		curDir = dir
		local filePath, isNew = LogManager.genFileName(dir, dataTimeString, false)
		if(not isNew)then
			fileSize = Util.file_size(filePath)
		else
			fileSize = 0
		end
		curFilePath = filePath
	end
	if(fileSize > log_single_file_size)then
		curFilePath = LogManager.genFileName(curDir, curDataTimeString, true)
		fileSize = 0
	end
	fileSize = fileSize + #appendStr
	LogManager.append2File(curFilePath, appendStr)
end

LogManager.genFileName = function(dir, dataTimeString, newFile)
	local filePath = string.format('%s%s', dir, LogManager.get_format_timestamp(true))
	if(newFile)then
		return filePath, true
	end
	local matchFiles = LogManager.match_file_name(logFileDirPath, {dir, dataTimeString})
	if(#matchFiles > 0)then
		table.sort(matchFiles, function (a, b) return string.lower(a) > string.lower(b) end)
		filePath = matchFiles[1]
		return filePath, false
	end
	return filePath, true
end

LogManager.append2File = function(filePath, appendStr)
	ModuleCache.AsyncFileUtil.AddFileOperationToQueue(filePath, appendStr, 'append')
	--ModuleCache.FileUtility.SaveFile(filePath, appendStr, true)
end

LogManager.get_dir_path = function(uid)
	uid = uid or LogManager.uid or 0
	local parentDirName = ModuleCache.AppData.Game_Name or "main"
	return string.format('%s%s/%s/', logFileDirPath, parentDirName, uid..''), parentDirName
end

LogManager.match_file_name = function(dirPath, filters)
	local result = {}
	if(not ModuleCache.FileUtility.DirectoryExists(dirPath))then
		return result
	end
	local files = ModuleCache.FileUtility.GetDirectoryFiles(dirPath, nil)
	if(files.Count > 0)then
		local len = files.Count - 1
		for i = 0, len do
			local file = files[i]
			local isMatch = LogManager.is_match(file, filters)
			if(isMatch)then
				table.insert(result, file)
			end
		end
	end
	return result
end

LogManager.get_file_size = function(filePath)
	local text = ModuleCache.FileUtility.ReadAllText(filePath)
	if(not text)then
		return #text
	end
	return 0
end

LogManager.is_match = function(filePath, filters)
	local file = filePath
	file = string.gsub(file, '\\', '/')
	file = string.gsub(file, '-', '_')
	local isMatch = true
	for j, v in ipairs(filters) do
		v = string.gsub(v, '-', '_')
		local match = string.find(file, v)
		--print(match, file, v)
		if(match and match >=1)then
			isMatch = isMatch and true
		else
			isMatch = false
		end
	end
	return isMatch
end

LogManager.upload_log_archive = function(onFinish, onProgress, onError)
	if(not ModuleCache.FileUtility.DirectoryExists(logFileDirPath))then
		if onError then
			onError('没有本地日志')
		end
		return
	end
	LogManager.upload_log_archive_ing = true
	start_auto_upload_log_archive_time = os.time()
	local zipFilePath = string.format('%s/log.zip', ModuleCache.UnityEngine.Application.persistentDataPath)
	if not ModuleCache.FileUtility.Exists(zipFilePath) then  --重要，只有当log.zip不存在才去上传
		LogManager.compress_file(logFileDirPath, zipFilePath)
	end
	local key = string.format('%s/log/%s-%s-%s.zip', ModuleCache.AppData.App_Name, LogManager.uid, LogManager.get_format_timestamp(true), math.random(0,999999) .. '')
	ModuleCache.OssManager.upload_file(key, zipFilePath, nil, function(key, tmpfilePath, bytes, url)
		LogManager.tell_api_server(url, nil, function()
			LogManager.upload_log_archive_ing = false
			auto_upload_log_archive_time = os.time()
			--这里有个漏洞，如果在上传的过程中，又写入了新的log日志，这时如果删除就会丢失这一部分的数据
			if ModuleCache.ModuleManager.module_is_active("public", "hall") then
				ModuleCache.FileUtility.DirectoryDelete(logFileDirPath, true)
			end
			ModuleCache.FileUtility.Delete(zipFilePath)
			if(onFinish)then
				onFinish()
			end
		end, function (erro)
			LogManager.upload_log_archive_ing = false
		end)
	end, 5, nil, function(finished, total)
		if(onProgress)then
			onProgress(finished, total)
		end
	end, function(err)
		if(onError)then
			onError(err)
		end
	end)
end

-- 自动上传log日志
LogManager.auto_upload_log_archive = function(uploadLogStatus, onFinish, onProgress, onError)

	if (uploadLogStatus and uploadLogStatus == ModuleCache.PlayerPrefsManager.GetInt("auto_upload_log_status", 0)) then
		return
	end
	local needUploadLog = false
	if (os.time() - auto_upload_log_archive_time > auto_upload_log_archive_period_of_times and (not LogManager.upload_log_archive_ing)) then
		needUploadLog = true

	elseif LogManager.upload_log_archive_ing and  os.time() - start_auto_upload_log_archive_time > 60 then --如果在上传的过程中一分钟内没上传成功再上传一次
		needUploadLog = true
	end
	if needUploadLog then
		LogManager.upload_log_archive(function ()
			if uploadLogStatus then
				ModuleCache.PlayerPrefsManager.SetInt("auto_upload_log_status", uploadLogStatus)
			end
			if onFinish then
				onFinish()
			end
		end)
	end
end

LogManager.upload_files = function()
	if(is_uploaded_file)then
		return
	end
	is_uploaded_file = true
	local dir, parentDirName = LogManager.get_dir_path(0)
	local matchFiles = LogManager.match_file_name(logFileDirPath, {dir})
	--print_table(matchFiles)
	if(#matchFiles > 0)then
		local min, max = LogManager.get_min_max_data_str(dir, matchFiles)
		LogManager.compress_file(dir, string.format('%s/%s%s_%s.zip', dir, parentDirName))
	end

	if(LogManager.uid and LogManager.uid ~= 0)then
		dir, parentDirName = LogManager.get_dir_path()
		matchFiles = LogManager.match_file_name(logFileDirPath, {dir})
		if(#matchFiles > 0)then
			local min, max = LogManager.get_min_max_data_str(dir, matchFiles)
			LogManager.compress_file(dir, string.format('%s/%s%s_%s.zip', dir, parentDirName, min, max))
		end
	end
end

LogManager.get_min_max_data_str = function(dir, matchFiles)
	local min
	local max
	local tmpDir = string.gsub(dir, '\\', '/')
	for i = 1, #matchFiles do
		local tmpFilePath = string.gsub(matchFiles[i], '\\', '/')
		local dateStr = string.gsub(tmpFilePath, tmpDir, '')
		local dateNum = string.gsub(dateStr, '_', '')
		if(not min)then
			min = dateNum
		end
		if(not max)then
			max = dateNum
		end
		if(max < dateNum)then
			max = dateNum
		end
		if(min > dateNum)then
			min = dateNum
		end
	end
	return min, max
end

LogManager.start_fileOperation = function(filePath, content, method, onFinish, insert)
	local guid = Util.guid()
	callback_table[guid] = onFinish
	ModuleCache.AsyncFileUtil.AddFileOperationToQueue(filePath, content, method, insert or false, guid)
end

LogManager.upload = function(filePath, onFinish)
	local relativePath = string.gsub(filePath, logFileDirPath, '')
	relativePath = string.gsub(relativePath, '\\', '/')
	if(not relativePath)then
		return
	end
	local key = string.format('%s/%s-%s-%s.log', ModuleCache.AppData.App_Name, relativePath, LogManager.uid or '0', math.random(0,999999) .. '')
	print(relativePath, key, filePath, '------------------------------')
	if(true)then
		return
	end
	LogManager.start_fileOperation(filePath, nil, 'readAllBytes', function(operationData)
		local bytes = operationData.content
		local key = string.format('%s/%s-%s-%s.log', ModuleCache.AppData.App_Name, relativePath, LogManager.uid or '0', math.random(0,999999) .. '')
		ModuleCache.OssManager.upload_file(key, nil, bytes, function(key, tmpfilePath, bytes, url)
			LogManager.tell_api_server(url, filePath, onFinish)
		end)
	end)
end

LogManager.compress_file = function(srcDir, dstFile)
	local compress_fun = LogManager.get_lzip_compress_fun()
	compress_fun(srcDir, dstFile)
end

LogManager.tell_api_server = function(url, filePath, onFinish, error)
	local count = 0
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "dataProcess/saveLog?",
		params = {
			uid = LogManager.uid,
			gameId = ModuleCache.AppData.Game_Name,
			url = url,
		},
	}

	if tostring(LogManager.uid) == '0' then
		return
	end

	ModuleCache.GameUtil.http_get(requestData, function(wwwOperation)
		local www = wwwOperation.www;
		local retData = ModuleCache.Json.decode(www.text)
		if retData.ret and retData.ret == 0 then    --OK
			if(onFinish)then
				onFinish(filePath)
				return
			end
			ModuleCache.AsyncFileUtil.AddFileOperationToQueue(filePath, nil, 'delete', true)
		else

		end
	end, function(error)
		print(error.error)
		count = count + 1
		if count < 10 then
			LogManager.tell_api_server(url)
		else
			if error then
				error(error.error)
			end
		end
	end)
end

LogManager._clear_expire_logs = function()
	if(not ModuleCache.FileUtility.DirectoryExists(logFileDirPath))then
		return
	end
	local files = ModuleCache.FileUtility.GetDirectoryFiles(logFileDirPath, nil)
	if(files.Count == 0)then
		return
	end
	local stayList = {}
	local now = os.time()
	for i = log_maximum_period_of_days, 0, -1 do
		local timestamp = now - i * 3600 * 24
		local dataTimeString = LogManager.get_format_timestamp(nil, true, timestamp)
		table.insert(stayList, {dataTimeString = dataTimeString})
	end
	local totalSize = 0
	local stayFileList = {}
	local needClearFiles = {}
	local len = files.Count - 1
	for i = 0, len do
		local isMatch = false
		local path = string.gsub(files[i], '\\', '/')
		for j = 1, #stayList do
			local stay = stayList[j]
			local match = string.find(path, stay.dataTimeString)
			if(match and match >=1)then
				isMatch = true
				local fileSize = Util.file_size(path)
				totalSize = totalSize + fileSize
				local fileName = string.sub(path, -19, -1)
				local timestamp = string.gsub(fileName, '_', '')
				table.insert(stayFileList, {fileSize = fileSize, path = path, timestamp = timestamp})
			end
		end
		if(not isMatch)then
			table.insert(needClearFiles, path)
		end
	end

	table.sort(stayFileList, function(a, b)
		return a.timestamp < b.timestamp
	end)

	if(totalSize > log_max_files_size)then
		for i = 1, #stayFileList do
			local stayFileData = stayFileList[i]
			if(totalSize > log_max_files_size)then
				totalSize = totalSize - stayFileData.fileSize
				table.insert(needClearFiles, stayFileData.path)
			end
		end
	end

	for i = 1, #needClearFiles do
		if(ModuleCache.FileUtility.Exists(needClearFiles[i]))then
			ModuleCache.FileUtility.Delete(needClearFiles[i])
		end
	end
end

LogManager.get_lzip_compress_fun = function()
	if(not zipCompressFun)then
		require 'tolua.reflection'
		tolua.loadassembly('Assembly-CSharp-firstpass')
		local type_lzip = typeof('lzip')
		zipCompressFun = tolua.getmethod(type_lzip, 'compressDir', typeof('System.String'), typeof('System.Int32'), typeof('System.String'), typeof('System.Boolean'))
	end
	return function(srcDir, dstFile)
		zipCompressFun:Call(srcDir, 1, dstFile, true)
	end
end


LogManager.clear_logs = function()
	if os.time() - _last_clear_logs_time < log_clear_period_of_times then
		return
	end
	_last_clear_logs_time = os.time()
	coroutine.start(function ()
		coroutine.wait(0)
		LogManager._clear_expire_logs()
	end)
end

LogManager.clear_logs()

LogManager.try_write_log = function(str)
	try
	{
		function()
			ModuleCache.LogManager.raw_Log(str)
		end,
		catch
		{
			function(errors)
				if(errors)then
					coroutine.start(function ()
						coroutine.wait(0)
						assert(not errors, 'catch errors:' .. errors)
					end)
				end
			end
		}
	}
end

return LogManager

