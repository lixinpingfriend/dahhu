







local class = require("lib.middleclass")
local Module = require("core.mvvm.module_base")
---@class UpdateModule : Module
---@field view UpdateView
local UpdateModule = class("Hall.UpdateModule", Module)

-- 常用模块引用
local ModuleCache = ModuleCache
local GameManager = ModuleCache.GameManager
local UnityEngine = UnityEngine


function UpdateModule:initialize(...)
	-- 开始初始化                view        model           模块数据
	Module.initialize(self, "update_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，model初始化完成
function UpdateModule:on_module_inited()
	-- 更新错误次数
	self.update_error_count = 0
	self.update_saeve_file_error_count = 0
	self.update_apk_error_count = 0
	self.view.sliderProgress.value = 0
	self.view.textVersion.text = ModuleCache.GameManager.appVersion .. "|" .. ModuleCache.GameManager.appAssetVersion
end

function UpdateModule:on_show(intentData)
	if self:view_is_active() and (self.isDownloadFile or self.isDecompress7Zip) then
		--ModuleCache.Log.report_exception("调用UpdateModule过多", ModuleCache.Log.print_debug("堆栈", 8))
		--if ModuleCache.GameManager.isTestUser then
		--	ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("调用UpdateModule过多", function()
		--	end, nil)
		--end
		return
	end

	self.update_error_count = 0
	self.update_saeve_file_error_count = 0
	self.updateIntentData = intentData
	print_table(intentData, "updateIntentData")
	if intentData and intentData.assetVersion then
		self._assetVersionData = intentData.assetVersion
		self._updateSuccessCallback = intentData.updateSuccessCallback
		self._updateFinishCallback = intentData.updateFinishCallback
		self._updateFailureCallback = intentData.updateFailureCallback
		self:_update_server_asset(self._assetVersionData)
	elseif(intentData and intentData.appData)then		--更新apk
		self._updateSuccessCallback = intentData.updateSuccessCallback
		self._updateFailureCallback = intentData.updateFailureCallback
		self.noDisplayProgress = not intentData.display
		self.view:displayProgress(not self.noDisplayProgress)
		--f ModuleCache.FileUtility.Exists(intentData.appData.saveFilePath) then
		--	ModuleCache.FileUtility.Delete(intentData.appData.saveFilePath)
		--end
		--self:_update_apk(intentData.appData)
		--if ModuleCache.GameManager.appVersion ~= "2.5.1" then
		--	self:_update_apk(intentData.appData)
		--else
		--	self:_update_apk_with_browser(intentData.appData)
		--end
		--self:_update_apk(intentData.appData)
		--if ModuleCache.AppData.Is_Independent_App then
		self:_update_apk(intentData.appData)
		--else
		--	self:_update_apk_with_browser(intentData.appData)
		--end
	end
	ModuleCache.Log.print_debug("updateshow", 9)
end

function UpdateModule:on_hide()
	self.isDownloadFile = false
	self.isDecompress7Zip = false
end

function UpdateModule:on_destroy()
	self.isDownloadFile = false
	self.isDecompress7Zip = false
end

function UpdateModule:on_click(obj, arg)
	if "ButtonUpdateApkRetry" == obj.name then
		UnityEngine.Application.OpenURL(self.updateIntentData.appData.url)
	end
end

function UpdateModule:_update_server_asset(assetVersionData)
	self.updateView.textInfo.text = "资源更新"
	local assetsDownloadFilePath = ModuleCache.AppData.ASSETS_DOWNLOAD_ROOT .. assetVersionData.fileName
	local downFiles = function()
		self.isDownloadFile = true
		self.isDecompress7Zip = false
		ModuleCache.FileUtility.DownloadFile(assetVersionData.filePath, assetsDownloadFilePath, function(result)
			self.isDownloadFile = false
			ModuleCache.Log.print(result, assetVersionData.filePath)
			if result == "download sucess" then
				-- self.view.textSliderInfo.text = ""
				self.isDecompress7Zip = true
				ModuleCache.FileUtility.Decompress7ZipAsync(assetsDownloadFilePath, ModuleCache.AppData.ASSETS_DATA_ROOT, false, true, function(result)
					self.isDecompress7Zip = false
					if result == 1 then

					else
						print("解压资源失败：" .. result)
						ModuleCache.Log.report_exception("解压资源失败",  result .. " | " .. assetVersionData.fileName)
						ModuleCache.PackageManager.clear_all_package_download_data()
						self:subscibe_time_event(0.3, false, 0):OnComplete(function(t)
							ModuleCache.GameManager.reboot()
						end)
						if self.view then
							self.view.textInfo.text = "解压资源失败：" .. result
						end
						return
					end

					if (self._updateFinishCallback) then
						self._updateFinishCallback(self.updateIntentData)
					else
						self:subscibe_time_event(0.3, false, 0):OnComplete(function(t)
							ModuleCache.GameManager.reboot()
						end)
					end
				end, function(decompressProgress)
					if self.view then
						self.view.textInfo.text = "资源解压中(不消耗流量)..."
					end
					-- print(decompressProgress, "decompress progress")
				end)

				if self.view and self.view.textInfo then
					self.view.textInfo.text = "资源下载完成，开始解压"
				end
			elseif result == "save file error" then
				self.update_saeve_file_error_count = self.update_saeve_file_error_count + 1
				if self.update_saeve_file_error_count > 1 then
					ModuleCache.Log.report_exception("下载保存文件失败", assetVersionData.fileName)
					local errorInfo = string.format("保存文件失败，请检查您设备的磁盘是否足够\n<size=20>%s\n稍后请重新启动应用</size>", assetVersionData.fileName)
					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(errorInfo, function()
						UnityEngine.Application.Quit()
					end, nil)
				else
					self:_update_server_asset(assetVersionData)
				end
			else
				print("下载失败需要重试：" .. result)
				self.update_error_count = self.update_error_count + 1
				if self.update_error_count > 3 then
					-- self:update_error_prompt("下载失败: " .. result)
					if self._updateFailureCallback then
						self._updateFailureCallback(result)
					end
				else
					self:_update_server_asset(assetVersionData)
				end
			end
		end, function(downloadProgress)
			if self.view then
				self.view.textSliderInfo.text = string.format("资源下载中:%d", downloadProgress * 100) .. "%"
				self.view.sliderProgress.value = downloadProgress
			end
			-- print(downloadProgress, "downloadProgress progress")
		end)
	end
	downFiles()
end

-- 浏览器下载
function UpdateModule:_update_apk_with_browser(appData)
	--local fileSize = "25M"
	self.view.goButtonUpdateApkRetry:SetActive(true)
	self.view.sliderProgress.gameObject:SetActive(false)
	self.updateView.textInfo.text = "检测到新版本需要更新\n<size=30>请使用浏览器下载安装</size>"
	self.updateView.textInfo.transform.localPosition = Vector3(7.1,105.7,0)
	UnityEngine.Application.OpenURL(appData.url)

end

--本地下载
function UpdateModule:_update_apk(appData)
	--local fileSize = "25M"
	self.updateView.textInfo.text = "新版本更新"
	local url = appData.url
	local saveFilePath = appData.saveFilePath
	local install_apk
	local downFiles = function()
		print(url, saveFilePath)
		self:downLoadFile(url, saveFilePath, function(error)
			if not error then
				if not self.noDisplayProgress then --如果是默默下载的,那么下载完就不用管了
					install_apk(saveFilePath)
				end
			else
				print("安装包下载失败需要重试：" .. error)
				self.update_error_count = self.update_error_count + 1
				if self.update_error_count > 3 then
					if self._updateFailureCallback then
						self._updateFailureCallback(error)
					end
				else
					self:_update_apk(appData)
				end
			end
		end, function(wwwData)
			local downloadProgress = wwwData.www.progress
			if self.view then
				self.view.textSliderInfo.text = string.format("安装包下载中:%d", downloadProgress * 100) .. "%"
				self.view.sliderProgress.value = downloadProgress
				--if self.noDisplayProgress then
				--	print(self.view.textSliderInfo.text)
				--end
			end
		end)
	end

	install_apk = function(filePath)
		self:subscibe_time_event(5, false, 0):OnComplete(function(t)
			self.view.goButtonUpdateApkRetry:SetActive(true)
			self.view.sliderProgress.gameObject:SetActive(false)
			if not self.unsubscibe_app_focus_event then
				--更新apk失败
				ModuleCache.TalkingDataMgr().setEvent("InstallApkFail")
				UnityEngine.Application.OpenURL(appData.url)
			end
		end)

		self.view.textInfo.text = "安装包下载完成，开始安装"
		self.view.sliderProgress.value = 100
		self.view.textSliderInfo.text = "正在安装..."


		local onAppFocusCallback
		onAppFocusCallback = function ( eventHead, eventData )
			if(eventData)then
				self.update_apk_error_count = self.update_apk_error_count + 1
				if self.update_apk_error_count < 3 then
					self:_update_apk(appData)
				else
					ApplicationEvent.unsubscibe_app_focus_event(onAppFocusCallback)
				end
			else
				self.unsubscibe_app_focus_event = true
			end
		end
		ApplicationEvent.subscibe_app_focus_event(onAppFocusCallback)
		self.filePath = filePath
		ModuleCache.GameSDKInterface:InstallApk(filePath)
		--UnityEngine.Application.OpenURL(filePath)
	end

	if not string.find(appData.url, ".apk") then
		self:_update_apk_with_browser(appData)
		return
	end

	if ModuleCache.GameManager.appVersion == "1.6.0" then
		appData.url = "http://www.sincebest.com/app/dhqpyx"
		self:_update_apk_with_browser(appData)
	else
		if(ModuleCache.FileUtility.Exists(saveFilePath))then
			if not self.noDisplayProgress then
				print("文件早已下载完成,直接安装")
				install_apk(saveFilePath)
			end
			return
		end

		downFiles()
	end
end

function UpdateModule:downLoadFile(url, savePath, onComplete, onProgress)
	print("start down ", url, savePath)
	ModuleCache.WWWUtil.Get(url):SubscribeWithProgress(function(wwwData)
		-- 因为之前的WWWUtil错误的时候，不会抛出错误，所以打了个补丁
		if wwwData.www.error ~= nil then
			if(onComplete)then
				onComplete(wwwData.www.error)
			end
		else
			if self.view then
				self.view.sliderProgress.value = 100
			end
			ModuleCache.FileUtility.SaveFile(savePath, wwwData.www.bytes, false)
			if(onComplete)then
				onComplete(nil)
			end
		end
	end, function(wwwData)
		if(onComplete)then
			onComplete(wwwData.www.error)
		end
	end, onProgress)
end


return UpdateModule



