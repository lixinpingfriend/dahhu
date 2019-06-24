






local ModuleCache = ModuleCache
local class = require("lib.middleclass")
local PackageModuleEvent = require("core.package_module_event")


local MVVMBase = require('core.mvvm.mvvm_base')
---@class ModuleEventBase : MVVMBase
local ModuleEventBase = class('ModuleEventBase', MVVMBase)


function ModuleEventBase:initialize()
    MVVMBase.initialize(self)

    self._moduleEventDatas = {}
end

-- 订阅package层的事件，用来处理package之间的交互
function ModuleEventBase:subscibe_package_event(eventName, callback)
    self._packageModuleEventDatas = self._packageModuleEventDatas or {}
    self:unsubscibe_package_event(eventName)
    self._packageModuleEventDatas[eventName] = callback
    PackageModuleEvent:subscibe_module_event(nil, nil, eventName, callback)
end

-- 取消订阅package层的事件
function ModuleEventBase:unsubscibe_package_event(eventName)
    local callback = self._packageModuleEventDatas[eventName]
    if callback then
        PackageModuleEvent:unsubscibe_module_event(nil, nil, eventName, callback)
        self._packageModuleEventDatas[eventName] = nil
    end
end

-- 发送package消息
function ModuleEventBase:dispatch_package_event(eventName, eventData)
    PackageModuleEvent:dispatch_module_event(nil, nil, eventName, eventData)
end


-- =======================================================================================================================================


function ModuleEventBase:get_module_event(moduleName, create)
    local data = self._moduleEventDatas[moduleName]     -- 两层结构 moduleName  eventName
    if not data and create then
        data = {}
        self._moduleEventDatas[moduleName] = data
    end
    return data
end

-- 订阅package内的module层的事件，用来处理模块之间的交互
function ModuleEventBase:subscibe_module_event(moduleName, eventName, callback)
    local data = self:get_module_event(moduleName, true)
    data[eventName] = callback
    -- print_table(self._moduleEventDatas)
    PackageModuleEvent:subscibe_module_event(self.packageName, moduleName, eventName, callback)
end

-- 取消订阅package内的module层的事件
function ModuleEventBase:unsubscibe_module_event(moduleName, eventName)
    local data = self:get_module_event(moduleName, false)
    if data then
        local callback = data[eventName]
        if callback then
            PackageModuleEvent:unsubscibe_module_event(self.packageName, moduleName, eventName, callback)
            data[eventName] = nil
        end
    end
end

-- 发送module消息
function ModuleEventBase:dispatch_module_event(moduleName, eventName, eventData)
    PackageModuleEvent:dispatch_module_event(self.packageName, moduleName, eventName, eventData)
end

function ModuleEventBase:clear_all_package_module_event()
    if self._packageModuleEventDatas then
        for eveneName, callback in pairs(self._packageModuleEventDatas) do
            if callback then
                PackageModuleEvent:unsubscibe_module_event(nil, nil, eveneName, callback)
            end
        end
        self._packageModuleEventDatas = nil
    end


    if self._moduleEventDatas then
        --        print_table(self._moduleEventDatas, "clear_all_package_module_event")
        for moduleName, data in pairs(self._moduleEventDatas) do
            for eventName, callback in pairs(data) do
                if callback then
                    PackageModuleEvent:unsubscibe_module_event(self.packageName, moduleName, eventName, callback)
                end
            end
        end
        self._moduleEventDatas = nil1
    end
end

-- =======================================================================================================================================


function ModuleEventBase:base_destroy()
    MVVMBase.base_destroy(self)

    ModuleEventBase.clear_all_package_module_event(self)
    self._is_destroyed = true
end

return ModuleEventBase