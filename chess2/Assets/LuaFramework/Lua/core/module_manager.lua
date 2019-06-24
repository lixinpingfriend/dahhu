local require = require
local string = string
local os = os
local debug = debug
---@type ModuleCache
local ModuleCache
local luaPackage = package		--package容易同名 先另取名缓存

---@class ModuleManager
local ModuleManager = {
    _packageModuleDatas = { },
    -- 公用模块
    _publicModuleDatas = { }
}

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

function ModuleManager.init(cache)
    ModuleCache = cache
end


---@return ModuleBase
function ModuleManager.add_module(package, moduleName, show)
    local moduleData = ModuleManager.get_module(package, moduleName)
    if not moduleData then
        local packageData = ModuleManager._packageModuleDatas[package]
        if not packageData then
            packageData = { }
            ModuleManager._packageModuleDatas[package] = packageData
        end
        local modulePath = string.format("package.%s.module.%s", package, moduleName)
        local packageModuleSimpleData = {
            packageName = package,
            moduleName = moduleName,
            modulePath = modulePath,
            show = show
		}
		local strzFilePath = string.format("%s.%s_module", modulePath, moduleName)
		if (package == "huzi" or package == "huazhipai") and (moduleName == "table" or moduleName == "singleresult") then		--huzi和huazhipai的table模块骨骼惊奇 需要清空requre缓存 重复执行
			luaPackage.loaded[strzFilePath] = nil
		end
        moduleData = require(strzFilePath):new(packageModuleSimpleData)
        moduleData:base_init_end(packageModuleSimpleData)
        packageData[moduleName] = moduleData
        -- print("init module: ", package, moduleName)
    end
    --print("add_module", package, moduleName)
    return moduleData
end

--- 显示module，没有注册的module会先注册, intentData 意图数据
function ModuleManager.show_module(package, moduleName, intentData)
    if package == "public" and moduleName == "shop" and ModuleCache.GameManager.iosAppStoreIsCheck then
        moduleName = "appstoreshop"
    end
    local module = ModuleManager.add_module(package, moduleName, true)
    if module then
        module:show(intentData)
    end

    if moduleName ~= "public_tablevoice" then
        ModuleCache.LogManager.custom_Log(_get_call_info(string.format("show_module:%s_%s", package, moduleName)))

        if ModuleCache.GameManager.iosAppStoreIsCheck then
            ModuleCache.TalkingDataMgr().setEventCheckVersion("Check_ShowModule", {package = package, moduleName = moduleName})
        end
    end


    return module
end

--- package是否已经被加载
function ModuleManager.package_is_loaded(package)
    local packageData = ModuleManager._packageModuleDatas[package]
    if not packageData then
        return false
    end
    return true
end

--- 模块是否被显示
function ModuleManager.module_is_active(package, moduleName)
    local module = ModuleManager.get_module(package, moduleName)
    if module then
        return module:view_is_active()
    end
    return false
end



-- 只显示module模块，其他的全部隐藏
function ModuleManager.show_module_only(package, moduleName, intentData)
    ModuleManager.hide_package(package)
    ModuleManager.show_module(package, moduleName, intentData)
end




function ModuleManager.get_module(package, moduleName)
    local packageData = ModuleManager._packageModuleDatas[package]
    if packageData then
        return packageData[moduleName]
    end
    return nil
end

function ModuleManager.destroy_module(package, moduleName)
    local packageData = ModuleManager._packageModuleDatas[package]
    if packageData then
        ---@type ModuleBase
        local moduleData = packageData[moduleName]
        if moduleData then
            packageData[moduleName] = nil
            moduleData:destroy()
        end
    end
end

function ModuleManager.destroy_all_package(nopackage)
    for k, v in pairs(AppData.allPackageConfig) do
        ModuleManager.destroy_package(v.package_name, nopackage)
    end
    ModuleManager.destroy_package("public", nopackage)
end


-- 销毁puglicpackage, 是否排除清除静态Module
function ModuleManager.destroy_public_package(inludeStaticModule)
    local moduleDatas = ModuleManager._packageModuleDatas["public"]
    if moduleDatas then
        ModuleManager._packageModuleDatas["public"] = { }
        for k, v in pairs(moduleDatas) do
            if not inludeStaticModule then
                if not v.staticModule then
                    v:destroy()
                else
                    ModuleManager._packageModuleDatas["public"][v.moduleName] = v
                end
            else
                v:destroy()
            end

        end
    end
    ModuleManager.gc()
end

-- 销毁package, 包括其中包含的所有module
function ModuleManager.destroy_package(package,nopackage,nopackageTable) ---保留 nopackage 字段，兼容老代码
    local moduleDatas = ModuleManager._packageModuleDatas[package]
    if moduleDatas then
        ModuleManager._packageModuleDatas[package] = { }
        for k, v in pairs(moduleDatas) do
            if v then
                local needDestroy = true
                if v.moduleName == nopackage then
                    needDestroy = false
                end
                if nopackageTable then
                    for i=1,#nopackageTable do 
                        local moduleName = nopackageTable[i]
                        if v.moduleName == moduleName then
                            needDestroy = false
                            break
                        end
                    end
                end
                if needDestroy then
                    v:destroy()
                else
                    if v.moduleName then
                        ModuleManager._packageModuleDatas[package][v.moduleName] = v
                    end
                end
            end
        end

    end
    ModuleManager.gc()
end

-- 隐藏当前的package，会隐藏所有的模块
function ModuleManager.hide_package(package, excludeMoudleName)
    local moduleDatas = ModuleManager._packageModuleDatas[package]
    if moduleDatas then
        for k, v in pairs(moduleDatas) do
            if excludeMoudleName and v.moduleName and string.find(excludeMoudleName, v.moduleName) then

            else
                v:hide()
            end
        end
    end
end

function ModuleManager.hide_module(package, moduleName, intentData)
    local module = ModuleManager.get_module(package, moduleName)
    if module then
        module:hide(intentData)
    end
end


function ModuleManager.show_public_module(moduleName, intentData)
    local module = ModuleManager.add_module("public", moduleName, true)
    if module then
        module:show(intentData)
    end
    if moduleName ~= "netprompt" then
        if ModuleCache.GameManager.iosAppStoreIsCheck then
            ModuleCache.TalkingDataMgr().setEventCheckVersion("Check_ShowPublicModule", {moduleName = moduleName})
        end

        ModuleCache.LogManager.custom_Log(_get_call_info(string.format("show_public_module:%s", moduleName)))
    end
    return module
end

---@return TextPromptModule
function ModuleManager.show_public_module_textprompt(intentData)
    local module = ModuleManager.add_module("public", "textprompt", true)
    if module then
        module:show(intentData)
    end
    return module
end

---@return AlertDialogModule
function ModuleManager.show_public_module_alertdialog(intentData)
    local module = ModuleManager.add_module("public", "alertdialog", true)
    if module then
        module:show(intentData)
    end
    return module
end

function ModuleManager.hide_public_module_textprompt(intentData)
    local module = ModuleManager.hide_module("public", "textprompt")
    if module then
        module:show(intentData)
    end
    return module
end

function ModuleManager.hide_public_module_alertdialog(intentData)
    local module = ModuleManager.hide_module("public", "alertdialog")
    if module then
        module:show(intentData)
    end
    return module
end


function ModuleManager.hide_public_module(moduleName)
    local module = ModuleManager.get_module("public", moduleName)
    if module then
        module:hide()
    end
    return module
end

function ModuleManager.gc()
    if os.time() - ModuleManager._gcTime < 3600 then
        return
    end
    lua_gc()
    ModuleCache.CustomerUtil.UnloadUnusedAssets()
end



ModuleManager._gcTime = os.time()
return ModuleManager