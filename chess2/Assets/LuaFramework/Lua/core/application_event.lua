




local APP_FOCUS_EVENT_NAME = "on_app_focus_event"

ApplicationEvent = {}
local ApplicationEvent = ApplicationEvent
ApplicationEvent._appFocusDispatcher = require("lib.event_dispatcher")()
---@type ModuleCache
local _ModuleCache

--场景切换通知
function ApplicationEvent.on_level_was_loaded(level)
--    print("123123")
--    collectgarbage("collect")
--    Time.timeSinceLevelLoad = 0
end

function ApplicationEvent.on_app_focus(state)
    ApplicationEvent._appFocusDispatcher:emit(APP_FOCUS_EVENT_NAME, state)
    if not _ModuleCache then
        _ModuleCache = ModuleCache
    else
        if _ModuleCache then
            _ModuleCache.LogManager.custom_Log("on_app_focus：" .. tostring(state))
        end
    end

end

-- 订阅model层的事件，比如收到服务回包后回调给module层做逻辑处理

function ApplicationEvent.subscibe_app_focus_event(callback)
    ApplicationEvent._appFocusDispatcher:on(APP_FOCUS_EVENT_NAME, callback)
end

-- 取消订阅model层的事件
function ApplicationEvent.unsubscibe_app_focus_event(callback)
    ApplicationEvent._appFocusDispatcher:removeEventListener(APP_FOCUS_EVENT_NAME, callback)
end

function ApplicationEvent.remove_all_app_focus_event()
    ApplicationEvent._appFocusDispatcher:removeAllListeners()
end

function OnApplicationQuit()
    ModuleCache.net.NetClientManager.disconnect_all_client()
    print("OnApplicationQuit")
end
