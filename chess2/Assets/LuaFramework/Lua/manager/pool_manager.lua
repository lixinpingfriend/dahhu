local Util = Util
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local GameObject = UnityEngine.GameObject
local Yield = Yield

local PoolManager = {}

PoolManager._transformCache = {}

PoolManager._transformRoot = ModuleCache.ComponentManager.Find(ModuleCache.GameManager.gameRoot, "Game/Pool").transform

function PoolManager:init()
    
    
end

function PoolManager.load_asset_async(assetBundleName, mainAssetName)
    ModuleCache.UnityEngine.Application.backgroundLoadingPriority = UnityEngine.ThreadPriority.Normal
    local startTime = ModuleCache.Log.cur_time()
    ModuleCache.Log.print_red("load_asset：" .. ModuleCache.Log.cur_time())
    ModuleCache.AssetBundleManager:LoadAssetBundleAsync(assetBundleName, mainAssetName, function (loadAssetBundle)
        if loadAssetBundle then
            ModuleCache.Log.print_red("load_asset end：" .. ModuleCache.Log.cur_time() - startTime)
            --StartCoroutine(function ()
            --    ModuleCache.Log.print_red("load_asset end：" .. ModuleCache.Log.cur_time() - startTime)
            --    --local load = loadAssetBundle.assetBundle:LoadAssetAsync(mainAssetName)
            --    --Yield(load)
            --    --ModuleCache.Log.print_red("load_asset：" .. ModuleCache.Log.cur_time() - startTime)
            --end)
        end
    end)
end

function PoolManager.load_asset(assetBundleName, mainAssetName)
    local startTime = ModuleCache.Log.cur_time()
    ModuleCache.Log.print_red("load_asset：" .. ModuleCache.Log.cur_time())
    local loadAssetBundle = ModuleCache.AssetBundleManager:LoadAssetBundle(assetBundleName)
    if loadAssetBundle then
        ModuleCache.Log.print_red("load_asset：" .. ModuleCache.Log.cur_time() - startTime)
        loadAssetBundle.assetBundle:LoadAsset(mainAssetName)
        ModuleCache.Log.print_red("load_asset：" .. ModuleCache.Log.cur_time() - startTime)
    end
end


---push 添加进缓存池
---@param gameObject UnityEngine.GameObject
---@param group string
---@param name string
function PoolManager.push(gameObject, group, name)
    local groupData = PoolManager._transformCache[group]
    if not groupData then
        groupData = {}
        PoolManager._transformCache[group] = groupData
    end
    
    local groupItemData = groupData[name]
    if not groupItemData then
        groupItemData = {}
        groupData[name] = groupItemData
        groupItemData.data = {}
        groupItemData._parentTransform =  GameObject.New().transform
        groupItemData._parentTransform.name = group
        groupItemData._parentTransform:SetParent(PoolManager._transformRoot)
    end
    groupItemData.data[#groupItemData.data + 1] = gameObject
    gameObject.transform:SetParent(groupItemData._parentTransform)
end



---spawn 从缓存池中取
---@param group string 属于哪个组
---@param name string 
---@param targetParentTransform UnityEngine.Transform
function PoolManager.spawn(group, name, targetParentTransform)
    local dataTmp = PoolManager._transformCache[group]
    if dataTmp then
        dataTmp = dataTmp[name]
        if dataTmp and #(dataTmp.data) > 0 then
            if #dataTmp.data < 2 then
                local go = GameObject.Instantiate(dataTmp.data[1])
                if targetParentTransform then
                    go.transform:SetParent(targetParentTransform.transform)
                end
                return go
            else
                local go = dataTmp.data[#dataTmp.data]
                dataTmp.data[#dataTmp.data] = nil
                return go
            end         
        end
    end
end

function PoolManager.clear_all()
    PoolManager._transformCache = {}
    local _parentTransform = PoolManager._transformRoot.parent
    GameObject.Destroy(PoolManager._transformRoot.gameObject)
    PoolManager._transformRoot = GameObject.New("Pool").transform
    PoolManager._transformRoot:SetParent(_parentTransform)
end

return PoolManager
