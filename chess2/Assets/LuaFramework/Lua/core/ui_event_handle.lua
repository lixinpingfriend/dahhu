




local UGUIEvent = UGUIExtend.GameUGUIEventDispatcher
local ModuleManager = require('core.module_manager')

--local InputEvent = {}
local function on_press(package, moduleName, sender, arg)
    ---@type ModuleBase
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_press", sender, arg)
    end
end

local function on_press_up(package, moduleName, sender, arg)
    ---@type ModuleBase
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_press_up", sender, arg)
    end
end

local function on_click(package, moduleName, sender, arg)
    ---@type ModuleBase
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_click", sender, arg)
    end
end

local function on_drag(package, moduleName, sender, arg)
    ---@type ModuleBase
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_drag", sender, arg)
    end
end

local function on_begin_drag(package, moduleName, sender, arg)
    ---@type ModuleBase
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_begin_drag", sender, arg)
    end
end

local function on_end_drag(package, moduleName, sender, arg)
    ---@type ModuleBase
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_end_drag", sender, arg)
    end
end

local function on_drop(package, moduleName, sender, arg)
    ---@type ModuleBase
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_drop", sender, arg)
    end
end

local function on_customer(package, moduleName, sender, arg)
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_customer", sender, arg)
    end
end

local function on_select(package, moduleName, sender, arg)
    local module = ModuleManager.get_module(package, moduleName)
    if sender ~= nil and module and (not module.isDestroy) then
        module:on_ui_event("on_select", sender, arg)
    end
end

local function on_cancel(package, moduleName, sender, arg)
    local module = ModuleManager.get_module(package, moduleName)
    if module then
        module:on_ui_event("on_cancel", sender, arg)
    end
end

local function on_app_pause(package, moduleName, sender, arg)
    local module = ModuleManager.get_module(package, moduleName)
    if module then
        module:on_ui_event("on_app_pause", sender, arg)
    end
end

local function on_app_focus(package, moduleName, sender, arg)
    local module = ModuleManager.get_module(package, moduleName)
    if module then
        module:on_ui_event("on_app_focus", sender, arg)
    end
end

UGUIEvent.onSelectFn = on_select
UGUIEvent.onCancelFn = on_cancel
UGUIEvent.onCustomerFn = on_customer
UGUIEvent.onPressFn = on_press
UGUIEvent.onClickFn = on_click
UGUIEvent.onDragFn = on_drag
UGUIEvent.onBeginDragFn = on_begin_drag
UGUIEvent.onEndDragFn = on_end_drag
UGUIEvent.onDropFn = on_drop
UGUIEvent.onPressUpFn = on_press_up

--Plua.onAppFocusFn = on_app_focus
--Plua.onAppPauseFn = on_app_pause --游戏暂停