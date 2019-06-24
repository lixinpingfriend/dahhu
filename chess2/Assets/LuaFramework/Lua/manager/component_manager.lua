



local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithPath = ComponentUtil.GetComponentWithPath
local Find = ComponentUtil.Find
local GetComponent = ComponentUtil.GetComponent
local GetClassType = ComponentUtil.GetClassType
---@class ComponentManager
local ComponentManager = {}

ComponentManager._cacheClassType = {}

function ComponentManager._getClassType(classname)
    local classType = ComponentManager._cacheClassType[classname]
    if not classType then
        classType = GetClassType(classname)
        ComponentManager._cacheClassType[classname] = classType
    end
    return classType
end

function ComponentManager.GetComponentWithPath(obj, path, classname)
    local findObj = Find(obj, path)
    if findObj then
        return GetComponent(findObj, ComponentManager._getClassType(classname))
    end
    return nil
end

function ComponentManager.FindGameObject(obj, path)
    return Find(obj, path)
end


function ComponentManager.Find(obj, path)
    return Find(obj, path)
end

function ComponentManager.GetComponent(obj, classname)
    return GetComponent(obj, ComponentManager._getClassType(classname))
end

function ComponentManager.AddComponent(obj, classname)
    return ComponentUtil.AddComponent(obj, ComponentManager._getClassType(classname))
end

function ComponentManager.SafeSetActive(go, active)
    ComponentUtil.SafeSetActive(go, active)
end


return ComponentManager