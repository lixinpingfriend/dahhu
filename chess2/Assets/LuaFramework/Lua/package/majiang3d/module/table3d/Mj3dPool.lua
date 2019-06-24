



local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local AssetBundleManager = ModuleCache.AssetBundleManager
local GameObject = UnityEngine.GameObject
local Vector3 = Vector3
local GetComponent = ComponentUtil.GetComponent

local table3dDef = require("package.majiang3d.module.table3d.table3d_def")
---@class Mj3dPool
local Mj3dPool = {}

---麻将池在场景中缓存麻将GameObject的节点
function Mj3dPool:Init(rootTransform,mjHodlerTrans,mjType)
    self.poolRoot = rootTransform
    self.hodlerTrans = mjHodlerTrans
end

---获取麻将的3d GameObject
---mj 麻将的值
function Mj3dPool:Get(pai,parent)
    local mjGo = nil
    local resName = table3dDef:getMj3dPrefabName(pai)
    if not resName or "" == resName then
        return mjGo
    end
    for i=0,self.poolRoot.childCount -1 do
        local child = self.poolRoot:GetChild(i)
        if child.name == resName then
            mjGo = child.gameObject
            break
        end
    end
    if not mjGo then
        local majiangTemplate = self.hodlerTrans:Find(resName).gameObject
        mjGo = GameObject.Instantiate(majiangTemplate)
    end
    mjGo.name = resName
    mjGo.transform.parent = parent
    self:refreshName()
    return mjGo
end

---将一个麻将还回池中
--- Mj3d  ,Mj3d 对象
function Mj3dPool:Push(mj3d)
    if not mj3d or not mj3d.gameObject then
        return
    end
    local mjGo = mj3d.gameObject
    mjGo.transform.parent = self.poolRoot
    mjGo.name =  table3dDef:getMj3dPrefabName(mj3d:Pai())
    ComponentUtil.SafeSetActive(mjGo, false)
    mj3d:reset()
    self:refreshName()
end

---清空当前所有缓存的麻将GameObject
function Mj3dPool:clearCache()
    for i=0,self.poolRoot.childCount - 1 do
        GameObject.Destroy(self.poolRoot:GetChild(i).gameObject)
        i = i - 1
    end
end

---设置麻将类型，在每次设置类型后会清空之前类型麻将的缓存
function Mj3dPool:setMjType(type)
    self:clearCache()
end

function Mj3dPool:refreshName()
    self.poolRoot.gameObject.name = "Mj3dPoolRoot_"..tostring(self.poolRoot.childCount)
end

return Mj3dPool