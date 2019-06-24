




local Vector3 = Vector3
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local TableUtil = TableUtil
---@class Pool
local Pool = {}

--- 初始化缓存池
function Pool:new(poolObj)
    self.root = poolObj
end

--- 获取物体
function Pool:pop(name, parent, index)
    name = tostring(name)
    local obj
    if(index) then
        local childs = TableUtil.get_all_child(parent, name)
        if(index <= #childs) then
            obj = childs[index]
        end
    end
    if(not obj) then
        local clones = TableUtil.get_all_child(self.root)
        for i = 1, #clones do
            if(name == clones[i].name) then
                obj = TableUtil.clone(clones[i], parent, Vector3.zero)
                break
            end
        end
    end
    obj:SetActive(true)
    return obj
end

--- 回到缓存池
function Pool:push(obj, poolName)
    obj.transform.parent = self.root.transform
    if(poolName) then
        obj.name = poolName
    end
    obj:SetActive(false)
end

return Pool