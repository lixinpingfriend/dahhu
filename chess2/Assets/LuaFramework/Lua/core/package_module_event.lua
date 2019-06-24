






local EventDispatcher = require("lib.event_dispatcher")

local PackageEvent = {
    _packageModuleDispatchers = {}    -- 三层：package、module、EventDispatcher类
}


-- ==================================package.module之间的交互=====================================

--- 获取event事件
-- @param createData 当没找到的时候，是否创建dispatcher
function PackageEvent:get_event_subscibe_data(package, module, createData)
    local packageName = package or "package"
    local packageData = self._packageModuleDispatchers[packageName]
    if not packageData and createData then
        packageData = {}
        self._packageModuleDispatchers[packageName] = packageData
    end
    local dispatcher
    if packageData then
        module = module or "package"
        dispatcher = packageData[module]
        if not dispatcher and createData then
            dispatcher = EventDispatcher()
            packageData[module] = dispatcher
        end
    end

    return dispatcher
end


function PackageEvent:subscibe_module_event(package, module, eventName, callback)
    local dispatcher = self:get_event_subscibe_data(package, module, true)

    if dispatcher then
        dispatcher:on(eventName, callback)
        -- debug
        -- dispatcher:printListeners()
    end
--    print_table(self._packageModuleDispatchers, "PackageEvent:subscibe_module_event")
end

function PackageEvent:unsubscibe_module_event(package, module, eventName, callback)
--    print_table(self._packageModuleDispatchers)
    local dispatcher = self:get_event_subscibe_data(package, module, false)
--    print(package, module, eventName, callback)
    if dispatcher then
        dispatcher:removeEventListener(eventName, callback)
        -- debug
        -- dispatcher:printListeners()
    end
--    print_table(self._packageModuleDispatchers)
end

function PackageEvent:dispatch_module_event(package, module, eventName, eventData)
    local dispatcher = self:get_event_subscibe_data(package, module, false)
    if dispatcher then
        dispatcher:emit(eventName, eventData)
    end
end

function PackageEvent:clear_subscibe_module_event(package, module)
    local packageData = self._packageModuleDispatchers[package]
    if packageData then
        self._packageModuleDispatchers[module] = nil
    end
end

return PackageEvent