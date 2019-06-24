




local ModuleCache = ModuleCache
local PlayerPrefs = UnityEngine.PlayerPrefs
local assert = assert

local playerPrefs_key = 'preload_module_map'
local list = require('list')
local PreLoadManager = {}

local tmpJson = PlayerPrefs.GetString(playerPrefs_key, '{}')
local packageAssetData = ModuleCache.Json.decode(tmpJson)
local lastPackageName = packageAssetData.lastPackageName
local lastModuleName = packageAssetData.lastModuleName

local loadingCount = 0
local on_finish_callback_queue = list:new()

local function doCallback()
    local callback = on_finish_callback_queue:shift()
    while callback do
        callback()
        callback = on_finish_callback_queue:shift()
    end
end

function PreLoadManager.getLastPackageModuleName()
    return lastPackageName, lastModuleName
end

function PreLoadManager.getLoadingCount()
    return loadingCount
end

function PreLoadManager.registerFinishPreLoadCallback(callback)
    --print("registerFinishPreLoadCallback")
    on_finish_callback_queue:push(callback)
    if(loadingCount < 1)then
        doCallback()
    end
end

function PreLoadManager.registerPreLoad(packageName, moduleName, abPath, assetName)
    assert(packageName and type(packageName) == 'string' and packageName ~= '')
    assert(moduleName and type(moduleName) == 'string' and moduleName ~= '')
    assert(abPath and type(abPath) == 'string' and abPath ~= '')
    assert(assetName and type(assetName) == 'string' and assetName ~= '')
    local moduleData = {
        abPath = abPath,
        assetName = assetName
    }
    local packageData = {
        [moduleName] = moduleData
    }
    packageAssetData[packageName] = packageData
    lastPackageName = packageName
    lastModuleName = moduleName

    packageAssetData.lastPackageName = lastPackageName
    packageAssetData.lastModuleName = lastModuleName
    local tmpJson = ModuleCache.Json.encode(packageAssetData)
    PlayerPrefs.SetString(playerPrefs_key, tmpJson)
    PlayerPrefs.Save()
end



function PreLoadManager.preLoad(packageName, moduleName)
    if(true)then
        doCallback()
        return
    end
    if(not packageName)then
        if(not moduleName)then
           moduleName = lastModuleName 
        end
        packageName = lastPackageName
    end
    if(not packageName or packageName == '')then
        if(loadingCount < 1)then
            doCallback()
        end
        return
    end
    local packageData = packageAssetData[packageName]
    if(packageData)then
        if(not moduleName)then
            for k,v in pairs(packageData) do
                local abPath = v.abPath
                local assetName = v.assetName
                PreLoadManager.preLoadAsset(abPath, assetName)
            end
        elseif(packageData[moduleName])then
            local abPath = packageData[moduleName].abPath
            local assetName = packageData[moduleName].assetName
            PreLoadManager.preLoadAsset(abPath, assetName)
        end
    else
        if(loadingCount < 1)then
            doCallback()
        end
    end
end

function PreLoadManager.preLoadAsset(abPath, assetName)
    if(not abPath or abPath == '' or (not assetName) or assetName == '')then
        if(loadingCount < 1)then
            doCallback()
        end
        return
    end
    loadingCount = loadingCount + 1
    ModuleCache.AssetBundleManager:LoadAssetBundleAsync(abPath, assetName, function()
        loadingCount = loadingCount - 1
        if(loadingCount < 1)then
            doCallback()
        end
    end)
end



return PreLoadManager;


