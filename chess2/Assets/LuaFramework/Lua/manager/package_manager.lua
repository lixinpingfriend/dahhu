





local ModuleCache = ModuleCache
local tonumber = tonumber
local io = io
local string = string

---@class PackageManager
local PackageManager = {}

PackageManager.unloadLoadedAssetBundleData = {}

PackageManager._chcheAllPackageJson = nil


function PackageManager.init()
    local readJson
    local file, error = io.open(ModuleCache.AppData.ASSETS_DATA_ROOT .. "package.txt")
    if file then
        readJson = file:read("*a")
        file:close()
    else
        readJson = ModuleCache.GameSDKInterface:ReadFileFromeAssets(ModuleCache.FileUtility.EncryptFilePath(ModuleCache.CustomerUtil.platform .. "/AssetDataBytes/package.txt"))
    end
    PackageManager.set_package_asset_data(readJson)
    PackageManager.asset_bundle_manifest_version = PackageManager._get_asset_bundle_manifest_version()
    ModuleCache.Log.print(PackageManager.asset_bundle_manifest_version)
end

function PackageManager.set_package_asset_data(packageJson)
    ModuleCache.Log.print(packageJson)
    if packageJson ~= nil and packageJson ~= "" and packageJson ~= PackageManager._chcheAllPackageJson then
        PackageManager._chcheAllPackageJson = packageJson
        local updateTable = ModuleCache.Json.decode(packageJson)
        PackageManager.packageAssetData = {}
        if updateTable.baseUrl then
            PackageManager.packageAssetData.baseUrl = updateTable.baseUrl
            PackageManager.packageAssetData.baseVersion = updateTable.baseVersion
            PackageManager.packageAssetData.serverVersion = tonumber(updateTable.curVersion)
            ModuleCache.GameManager.appAssetVersion = PackageManager.packageAssetData.serverVersion

            for i = 1, #updateTable.packages do
                updateTable.packages[i].topVersion = tonumber(updateTable.packages[i].topVersion)
                updateTable.packages[i].lastVersion = tonumber(updateTable.packages[i].lastVersion)
                updateTable.packages[i].wholeFileSize = tonumber(updateTable.packages[i].wholeFileSize)
                updateTable.packages[i].incrementalFileSize = tonumber(updateTable.packages[i].incrementalFileSize)
                updateTable.packages[i].curClientVersion = PackageManager._get_package_version(updateTable.packages[i].package)
                PackageManager.packageAssetData[updateTable.packages[i].package] = updateTable.packages[i]
            end
        end
        --if not PackageManager.packageAssetData.baseUrl then
        --    ModuleCache.GameManager.appAssetVersion = 0
        --end
        -- ModuleCache.Log.print_table(PackageManager.packageAssetData)
    end
end

function PackageManager.set_single_package_asset_data(packageName)
    local packageVersion = PackageManager._get_package_version(packageName)
    PackageManager.packageAssetData[packageName].curClientVersion = packageVersion
    if packageName == "public" then
        -- 如果有Public更新那么需要重新加载AssetBundleManifest
        ModuleCache.GameManager.appAssetVersion = packageVersion
        PackageManager._assetBundleManifestNeedReload = true
        PackageManager.asset_bundle_manifest_version = packageVersion
    end

    if packageName ~= "public" and packageVersion > PackageManager.asset_bundle_manifest_version then
        local state = ModuleCache.GameUtil.file_copy(ModuleCache.AppData.ASSETS_DATA_ROOT .. packageName .. "/asset_bundle_manifest",  ModuleCache.AppData.ASSETS_DATA_ROOT .. "asset_bundle_manifest")
        if state then
            print("更新asset_bundle_manifest：" .. packageName .. " -- " .. packageVersion .. " -- " .. PackageManager.asset_bundle_manifest_version)
            state = PackageManager._save_asset_bundle_manifest_version(packageVersion)
            PackageManager._assetBundleManifestNeedReload = true
            PackageManager.asset_bundle_manifest_version = packageVersion
        else

        end
    end
end

function PackageManager.get_cur_package_version(packageName)
    if not PackageManager.packageAssetData then
        return 0
    end

    local packageData = PackageManager.packageAssetData[packageName]
    if packageData then
        return packageData.curClientVersion
    end
    return 0
end

-- 重新加载AssetBundleManifest
function PackageManager._reload_asset_bundle_manifest()
    local manifest = ModuleCache.AssetBundleManager:LoadAssetBundle("asset_bundle_manifest")
    manifest.referencedCount = 0
    ModuleCache.AssetBundleManager:UnLoadLoadedAssetBundle(manifest, false)
    ModuleCache.AssetBundleManager:Initialize()
end

function PackageManager._get_asset_bundle_manifest_version()
    local version = 0
    local file, error = io.open(ModuleCache.AppData.ASSETS_DATA_ROOT .. "asset_bundle_manifest_version.txt")
    if file then
        version = file:read("*n")
        file:close()
    else
        local file, error = io.open(ModuleCache.AppData.ASSETS_DATA_ROOT .. "version.txt")
        if file then
            version = file:read("*n")
            file:close()
        end
    end
    return version
end

function PackageManager._save_asset_bundle_manifest_version(version)
    return ModuleCache.GameUtil.file_save(ModuleCache.AppData.ASSETS_DATA_ROOT .. "asset_bundle_manifest_version.txt", version)
end


-- 获取package_version
function PackageManager._get_package_version(package)
    local version = 0


    if package == "public" then
        local file, error = io.open(ModuleCache.AppData.ASSETS_DATA_ROOT .. "version.txt")
        if file then
            version = file:read("*n")
            file:close()
        else
            version = ModuleCache.GameManager.appInternalAssetVersion
        end
    else
        local file, error = io.open(ModuleCache.AppData.ASSETS_DATA_ROOT .. package .. "/version.txt")
        if file then
            version = file:read("*n")
            file:close()
        end
    end
    return version or 0
end

---get_app_package_update_info 根据packageName获取更新数据
---@param packageName string
function PackageManager.get_app_package_update_info(packageName)
    if ModuleCache.GameManager.isEditor and ModuleCache.GameConfigProject.assetLoadType == 0 then
        return nil
    end

    if not PackageManager.packageAssetData then
        return nil
    end

    local getDownloadFileData  = function(targetPackageUpdateData)
        -- 需要判断是否加载依赖包
        if targetPackageUpdateData.curClientVersion >= targetPackageUpdateData.topVersion then
            return nil
        end
        local downloadFileData = {}
        downloadFileData.isForceUpdate = true
        downloadFileData.packageName = packageName
        if targetPackageUpdateData.lastVersion ~= 0 and targetPackageUpdateData.curClientVersion == targetPackageUpdateData.lastVersion then
            downloadFileData.filePath = PackageManager.packageAssetData.baseUrl .. packageName .. "/" .. packageName .. "_incremental_" .. PackageManager.packageAssetData.baseVersion .. "_" .. targetPackageUpdateData.topVersion .. ".pkg"
            downloadFileData.fileName = packageName .. "_incremental.pkg"
            downloadFileData.fileSize = targetPackageUpdateData.fileSizeIncremental
        else
            downloadFileData.filePath = PackageManager.packageAssetData.baseUrl .. packageName .. "/" .. packageName .. "_whole_" .. PackageManager.packageAssetData.baseVersion .. "_" .. targetPackageUpdateData.topVersion .. ".pkg"
            downloadFileData.fileName = packageName .. "_whole.pkg"
            downloadFileData.fileSize = targetPackageUpdateData.fileSizeWhole
        end
        return downloadFileData
    end

    local targetPackageUpdateData = PackageManager.packageAssetData[packageName]



    --先获取依赖的package
    if targetPackageUpdateData then
        return getDownloadFileData(targetPackageUpdateData)
    else
        print_table(PackageManager.packageAssetData, "没找到对应的package数据：" .. packageName)
    end
    return nil
end


---update_package_version 更新Package，同时也会更新依赖的资源包
---@param package string
function PackageManager.update_package_version(curPackageName, updateFinishCallback)
    if ModuleCache.GameManager.isEditor and ModuleCache.GameConfigProject.assetLoadType == 0 then
        if updateFinishCallback then
            updateFinishCallback()
        end
        return
    end

    if ModuleCache.GameManager.iosAppStoreIsCheck then
        if updateFinishCallback then
            updateFinishCallback()
        end
        return
    end


    print("update_package_version：" .. curPackageName)
    PackageManager.needRoot = false;


    local updatePackageAssetData = PackageManager.get_app_package_update_info("public")
    --单独更新包
    --local singlePackageAssetData = PackageManager.get_app_package_update_info("single")
    local intentData = {
        updatePackageName = curPackageName,
        assetVersion = updatePackageAssetData,
        canCancelUpdate = false,
        updateFinishCallback = nil,
        --是否静默更新
        silentlyUpdate = false,
    }

    intentData.updateFailureCallback = function(ret)	-- 更新失败需要再次走更新逻辑
        ModuleCache.ModuleManager.destroy_module("public", "update")
        local errorInfo = string.format("资源下载失败，请检查网络后重试\n<size=20>%s\n%s</size>", ret, intentData.assetVersion.filePath)
        ModuleCache.ModuleManager.show_public_module_alertdialog():show_center_button(errorInfo, function()
            PackageManager.update_package_version(curPackageName, updateFinishCallback)
        end)
    end


    -- 有主包更新的情况 更新完主包后判断下是否有分包下载
    intentData.updateFinishCallback = function(updateIntentData, notUpdateModuleCallback)
        if not notUpdateModuleCallback then
            ---TODO 需要判断是否需要复制asset_bundle_manifest到主目录，并且重置AssetBundleManifest
            PackageManager.set_single_package_asset_data(updateIntentData.updatePackageName)
            if updateIntentData and not PackageManager.needRoot then
                PackageManager.needRoot = PackageManager._get_update_finish_need_root(updateIntentData.updatePackageName)
            end
        end

        updatePackageAssetData = PackageManager._get_app_depend_package_update_info(curPackageName)
        if not updatePackageAssetData then
            updatePackageAssetData = ModuleCache.PackageManager.get_app_package_update_info(curPackageName)
        end

        -- 更新完了后需要
        if updatePackageAssetData then
            intentData.assetVersion = updatePackageAssetData
            intentData.updatePackageName = updatePackageAssetData.packageName
            ModuleCache.ModuleManager.show_module("public", "update", intentData)
        --elseif singlePackageAssetData then
        --    intentData.assetVersion = singlePackageAssetData
        --    intentData.updatePackageName = singlePackageAssetData.packageName
        --    ModuleCache.ModuleManager.show_module("public", "update", intentData)
        else
            PackageManager.clear_package_file("public")
            PackageManager.clear_package_file("publictable")
            if ModuleCache.GameManager.isTestUser then
                PackageManager.clear_package_file(curPackageName)
            end
            if not PackageManager.needRoot then
                -- 有任何Package更新而不重启的更新都应该重新加载AssetBundleManifest
                print("reload_asset_bundle_manifest：" .. PackageManager.asset_bundle_manifest_version or 0)
                if PackageManager._assetBundleManifestNeedReload then
                    PackageManager._reload_asset_bundle_manifest()
                end
                PackageManager._assetBundleManifestNeedReload = false
                ModuleCache.ModuleManager.destroy_module("public", "update")
                if updateFinishCallback then
                    updateFinishCallback()
                end
            else
                ModuleCache.CSmartTimer:Subscribe(0.3, false, 1):OnComplete(function(t)
                    ModuleCache.GameManager.reboot()
                end)
            end
        end
    end

    -- 先更public package
    if updatePackageAssetData then
        intentData.updatePackageName = "public"
        ModuleCache.ModuleManager.show_module("public", "update", intentData)
    else
        intentData.updateFinishCallback(intentData, true)
    end


end

--- 获取依赖package的更新数据
function PackageManager._get_app_depend_package_update_info(packageName)
    if (not PackageManager.packageAssetData) or (not PackageManager.packageAssetData[packageName]) then
        return nil
    end

    local dependPackagesName = PackageManager.packageAssetData[packageName].dependPackages
    if dependPackagesName and dependPackagesName ~= "" then
        dependPackagesName = string.split(dependPackagesName, "|")
    else
        return nil
    end

    local updatePackageAssetData
    for i = 1, #dependPackagesName do
        updatePackageAssetData = ModuleCache.PackageManager.get_app_package_update_info(dependPackagesName[i])
        if updatePackageAssetData then
            return updatePackageAssetData
        end
    end
    return nil
end

---判断是否需要重启
function PackageManager._get_update_finish_need_root(packageName)
    local packageNamePath = packageName .. "/"
    if packageName == "public" then
        packageNamePath = ""
    end
    local file, error = io.open(ModuleCache.AppData.ASSETS_DATA_ROOT .. packageNamePath .. "single_package_update_data.txt")
    if file then
        local json = file:read("*a")
        file:close()
        local single_package_update_data = ModuleCache.Json.decode(json)
        local updateFiles;
        if single_package_update_data.isIncrementalUpdate then
            updateFiles = single_package_update_data.incrementalFiles
        else
            updateFiles = single_package_update_data.wholeFiles
        end
        local assetBundleIsLoaded = false
        --print_table(updateFiles)
        --local soundPath = packageName .. "/sound/"
        for i = 1, #updateFiles do
            --print(updateFiles[i])
            assetBundleIsLoaded = ModuleCache.AssetBundleManager:AssetBundleIsLoadedOnly(updateFiles[i])
            if assetBundleIsLoaded then
                print("当前package更新需要重启：" .. packageName .. " : " .. updateFiles[i])
                return true
            elseif string.find(updateFiles[i], "lua_") then
                assetBundleIsLoaded = ModuleCache.AssetBundleManager:LuaAssetBundleIsLoaded(updateFiles[i])
                if assetBundleIsLoaded then
                    print("当前package更新需要重启：" .. packageName .. " : " .. updateFiles[i])
                    return true
                end
            elseif string.find(updateFiles[i], "/sound/") then
                ModuleCache.SoundManager.unload_audio_clip_cache(updateFiles[i])
            end
        end
        print("当前package更新不需要重启：" .. packageName)
        return false;
    end
    print("当前package更新需要重启，没有找到single_package_update_data：" .. packageName)
    return true;
end



function PackageManager.unloadLoadedAssetBundle(loadedAssetBundle, unloadAllLoadedObjects)
    PackageManager.unloadLoadedAssetBundleData[loadedAssetBundle.assetBundleName] = true
    ModuleCache.AssetBundleManager:UnLoadLoadedAssetBundle(loadedAssetBundle, unloadAllLoadedObjects)
end

function PackageManager.get_directories(path)
    if(not PackageManager.getDirectoriesFun)then
        local type_lzip = typeof('System.IO.Directory')
        PackageManager.getDirectoriesFun = tolua.getmethod(type_lzip, 'GetDirectories', typeof('System.String'))
    end
    return PackageManager.getDirectoriesFun:Call(path)
end

--清空所有下载的数据
function PackageManager.clear_all_package_download_data(onlyClearVersion)
    if not ModuleCache.FileUtility.DirectoryExists(ModuleCache.UnityEngine.Application.persistentDataPath .. "/assetsdata/") then
        return
    end

    if ModuleCache.FileUtility.Exists(ModuleCache.AppData.ASSETS_DATA_ROOT .. "version.txt") then
        ModuleCache.FileUtility.Delete(ModuleCache.AppData.ASSETS_DATA_ROOT .. "version.txt")
    end
    local paths = PackageManager.get_directories(ModuleCache.AppData.ASSETS_DATA_ROOT)
    if paths then
        for i = 0, paths.Length - 1 do
            if ModuleCache.FileUtility.Exists(paths[i] .. "/version.txt") then
                ModuleCache.FileUtility.Delete(paths[i] .. "/version.txt")
            end
        end
    end
    if onlyClearVersion then
        return true
    end

    local result = ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/assetsdata", true)
    if not ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/image", true) then
        result = false
    end
    if not ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/temp", true) then
        result = false
    end
    if not ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/voice", true) then
        result = false
    end
    return result
end

--清空本地的缓存数据，保留log
function PackageManager.clear_persistent_data()
    ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/assetsdata", true)
    ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/voice", true)
    ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/image", true)
    ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/temp", true)
    ModuleCache.FileUtility.DeleteDirectory(ModuleCache.UnityEngine.Application.persistentDataPath .. "/apk", true)
end

--清理本地的package_file
function PackageManager.clear_package_file(packageName)
    if not ModuleCache.GameManager.platformIsAndroid then
        return
    end

    if PackageManager.has_clear_package_file then
        return
    end

    if ModuleCache.PlayerPrefsManager.GetString("clear_package_file_app_version", "") == ModuleCache.GameManager.appVersion then
        PackageManager.has_clear_package_file = true
        return
    end

    local path
    if packageName == "public" then
        path = ModuleCache.AppData.ASSETS_DATA_ROOT .. "single_package_update_data.txt"
    else
        path = ModuleCache.AppData.ASSETS_DATA_ROOT .. packageName .. "/single_package_update_data.txt"
    end

    local updateFiles
    local file, error = io.open(path)
    if file then
        local json = file:read("*a")
        file:close()
        local single_package_update_data = ModuleCache.Json.decode(json)
        if single_package_update_data and single_package_update_data.wholeFiles then
            updateFiles = single_package_update_data.wholeFiles
            table.insert(updateFiles, "asset_bundle_manifest")
            table.insert(updateFiles, "single_package_update_data.txt")
            table.insert(updateFiles, "version.txt")
            ModuleCache.LogManager.custom_Log(ModuleCache.Log.print_table(updateFiles, "updateFiles"))
        end
    end

    if packageName ~= "public" then
        ModuleCache.PlayerPrefsManager.SetString("clear_package_file_app_version", tostring(ModuleCache.GameManager.appVersion))
    end

    if not updateFiles then
        return
    end

    local needDeleteFiles = {}
    local fileList = ModuleCache.FileUtility.GetDirectoryFiles(ModuleCache.UnityEngine.Application.persistentDataPath .. "/assetsdata/" .. packageName, nil)
    if fileList then
        local size = fileList.Count
        local inUpdateFiles = false
        local shortFilePath
        local fullFile
        --print(size)
        for i = 1, size do
            inUpdateFiles = false
            fullFile = fileList[i - 1]
            shortFilePath = string.gsub(fullFile, ModuleCache.UnityEngine.Application.persistentDataPath .. "/assetsdata/", "")
            for j = 1, #updateFiles do
                if not inUpdateFiles and string.find(shortFilePath, updateFiles[j]) then
                    inUpdateFiles = true
                end
            end
            if not inUpdateFiles then
                local result = ModuleCache.FileUtility.Delete(fullFile)
                table.insert(needDeleteFiles, tostring(result) .. "_" .. fullFile)
            end
        end
    end
    if #needDeleteFiles > 0 then
        ModuleCache.TalkingDataMgr().setEventWithUID("clear_package_file_" .. packageName)
        ModuleCache.LogManager.custom_Log(ModuleCache.Log.print_table(needDeleteFiles, "needDeleteFiles"))
        ModuleCache.GameManager.reboot()
    else

    end


end





return PackageManager