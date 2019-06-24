local Mj3dPool = require("package.majiang3d.module.table3d.Mj3dPool")

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local DOTween = DG.Tweening.DOTween
local Color = Color
local Vector3 = Vector3
local GameObject = UnityEngine.GameObject

---@type Table3DDef
local table3dDef = require("package.majiang3d.module.table3d.table3d_def")
local Vector2 = Vector2
require("UnityEngine.Collider")
require("UnityEngine.BoxCollider")
require("UnityEngine.MeshRenderer")
require("UnityEngine.Material")

--- @class Mj3d
local Mj3d = {}


----------------------Static-----------------------------
local activedMj3ds = {}

Mj3d.defLayer = 11

function Mj3d:Init()
    activedMj3ds = {}
end

---操作所有激活的mj3d对象
function Mj3d:OptActiedMj3ds(optCallBack)
    for i=1,#activedMj3ds do
        if optCallBack then
            optCallBack(activedMj3ds[i])
        end
    end
end



---麻将皮肤类型
local skinStyle = {1,2,3}
---当前麻将皮肤类型
local mj3dSkinStyle = 1
---切换所有麻将的皮肤
function Mj3d:switchAllMj3dSkinStyle(type)
    mj3dSkinStyle = type
    Mj3d:OptActiedMj3ds(function (mj3d)
        mj3d:setSkinStyle(mj3dSkinStyle)
    end)
end
---皮肤材质缓存
Mj3d.skinMats = {}
---预加载对应类型的3D麻将皮肤资源
function Mj3d:preLoadSkinAssets(type)
    local rootPath = "majiang3d/module/table3d/mj3dskin"
    local path = string.lower(rootPath.."/mat_style_"..tostring(type))
    local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle(path);
end

---创建一个Mj3d对象
function Mj3d:Create(pai,parent)
    ---@type Mj3d
    local mj3d = {}
    setmetatable(mj3d, { __index = Mj3d })
    mj3d.pai = pai
    local go = Mj3dPool:Get(pai,parent) ---实例化MJ gameobject
    mj3d.gameObject = go
    mj3d.transform =  go.transform
    mj3d.goInstanceId = mj3d.gameObject:GetInstanceID()

    mj3d.collider = GetComponentWithPath(mj3d.gameObject,"","UnityEngine.BoxCollider")

    mj3d.meshRootObj = GetComponentWithPath(mj3d.gameObject,"majian",ComponentTypeName.Transform).gameObject

    mj3d.meshObj = GetComponentWithPath(mj3d.meshRootObj,"majian_n",ComponentTypeName.Transform).gameObject
    local meshTransform = GetComponentWithPath(mj3d.meshObj,"Mesh",ComponentTypeName.Transform)
    if meshTransform then
        mj3d.majiangMesh = meshTransform.gameObject
    end
    if mj3d.majiangMesh then
        mj3d.majiangMeshRenderer = GetComponentWithPath(mj3d.majiangMesh,"","UnityEngine.Renderer");
    end

    mj3d.tagMeshObj =  GetComponentWithPath(mj3d.meshRootObj,"tag",ComponentTypeName.Transform).gameObject
    mj3d.tagMeshRender = GetComponentWithPath(mj3d.tagMeshObj,"","UnityEngine.MeshRenderer")
    mj3d.tagMat = mj3d.tagMeshRender.material

    mj3d:AppendSomeThing(function (effectObj)
        mj3d.tingArrowObj = effectObj
    end ,"TingArrow",false)

    mj3d:AppendSomeThing(function (effectObj)
        mj3d.kuangEffectObj = effectObj
    end ,"paikuan",false)

    mj3d:AppendSomeThing(function (effectObj)
        mj3d.arrowObj = effectObj
    end ,"Arrow",false)

    mj3d:AppendSomeThing(function (effectObj)
        mj3d.TingDaObj = effectObj
    end ,"tingdaTag",false)

    mj3d:AppendSomeThing(function (effectObj)
        mj3d.TingDuoObj = effectObj
    end ,"tingduoTag",false)


    mj3d:AppendSomeThing(function (effectObj)
        mj3d.shadowObj = effectObj
        if mj3d.shadowObj  then
            mj3d.shadowSuObj = GetComponentWithPath(mj3d.shadowObj,"shadow_su",ComponentTypeName.Transform).gameObject
            mj3d.shadowTangObj = GetComponentWithPath(mj3d.shadowObj,"shadow_tang",ComponentTypeName.Transform).gameObject        
        end
    end ,"shadow",false)

    ComponentUtil.SafeSetActive(mj3d.gameObject, true)


    mj3d:setColliderState(true)
    mj3d:setTag(nil)

    mj3d:setSkinStyle(mj3dSkinStyle)
    mj3d:setMj3dDefState(Mj3d.mj3dState.normal)
    mj3d:setMj3dState(Mj3d.mj3dState.normal)   ---状态初始化必须在皮肤初始化之后

    mj3d:setMj3Active(true)
    mj3d:resetLocalTransState()
    mj3d:setArrowState(false)
    mj3d:setKuangEffectState(false)
    mj3d:setShowZhangData(nil)
    mj3d:setTingArrowState(false)
    mj3d:setTingDaTagState(false)
    mj3d:setTingDuoTagState(false)
    mj3d:setShadowState(Mj3d.shadowState.none)

    table.insert(activedMj3ds,mj3d)
    return mj3d
end

---------------------End----------------------------------

---设置麻将皮肤
function Mj3d:setSkinStyle(type)
    local majiangName = table3dDef:getMj3dPrefabName(self:Pai())
    local rootPath = "majiang3d/module/table3d/mj3dskin"
    if not self.majiangMesh then  ---加载麻将模型
        local nodeName = "majian_n"
        local path = string.lower(rootPath.."/mj3d")
        local name = majiangName.."_"..nodeName
        local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle(path);
        local asset = bundle:GetAsset(name, false)
        local root = GetComponentWithPath(self.gameObject,"majian/"..nodeName,ComponentTypeName.Transform).gameObject
        local obj = ModuleCache.ComponentUtil.InstantiateLocal(asset,root)
        obj.layer = self.gameObject.layer
        obj.name = "Mesh"
        self.majiangMesh = obj
        self.majiangMeshRenderer = GetComponentWithPath(self.majiangMesh,"","UnityEngine.Renderer");
    end
    local styleMats = Mj3d.skinMats[type]
    if not styleMats or #styleMats <= 0 then ---加载对应的皮肤材质
        local mats = {}
        local path = string.lower(rootPath.."/mat_style_"..tostring(type))
        local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle(path);
        local normalStateMat = bundle:GetAsset("3dmj_mat", false)
        local hlightStateMat = bundle:GetAsset("3dmj_h_mat", false)
        local outlineStateMat = bundle:GetAsset("3dmj_outline_mat", false)
        local grayStateMat = bundle:GetAsset("3dmj_gray_mat", false)
        local yellowStateMat = bundle:GetAsset("3dmj_y_mat", false)
        table.insert(mats,normalStateMat)
        table.insert(mats,hlightStateMat)
        table.insert(mats,outlineStateMat)
        table.insert(mats,grayStateMat)
        table.insert(mats,yellowStateMat)
        Mj3d.skinMats[type] = mats
    end
    self.curStyleMats = Mj3d.skinMats[type]
    self.majiangMeshRenderer.material = self.curStyleMats[self.curMj3dState or 1]
end

---设置麻将手张数据
function Mj3d:setShowZhangData(shouzhang)
    self.shouZhangData = shouzhang
end

function Mj3d:getShouZhangData()
    return self.shouZhangData
end

---设置麻将的层级
---layer 定义
---8 3dobj
---9 3dhandmj
---10 3dbg
---11 3dmj
---12 3dtable
---13 3dmjother
---14 3dmjdisonscreen
function Mj3d:setLayer(layer)
    if not self.gameObject then
        return
    end
    self.gameObject.layer = layer

    self.meshObj.layer = layer
    self.majiangMesh.layer = layer

    if self.kuangEffectObj then
        self.kuangEffectObj.layer = layer
    end

    self.tagMeshObj.layer = layer
    if self.arrowObj then
        self.arrowObj.layer = layer
    end
    if self.TingDaObj then
        self.TingDaObj.layer = layer
    end
    if self.TingDuoObj then
        self.TingDuoObj.layer = layer
    end
    if self.tingArrowObj then
        self.tingArrowObj.layer = layer
    end
end

---获取麻将的牌面值
function Mj3d:Pai()
    return self.pai
end
---设置麻将的碰撞状态
function Mj3d:setColliderState(state)
    if not self.gameObject then
        return
    end
    self.collider.enabled = state
end
---设置麻将的右上角标记
function Mj3d:setTag(texture)
    if not self.gameObject then
        return
    end
    self.tagIsHasTex = (nil ~= texture)
    if texture then
        self.tagMeshObj:SetActive(true)
        self.tagMat.mainTexture = texture
    else
        self.tagMeshObj:SetActive(false)
    end
end
---设置角标状态，如果没有角标则无法这是为激活状态
function Mj3d:setTagState(state)
    if not self.gameObject then
        return
    end
    if not self.tagIsHasTex then
        state = false
    end
    self.tagMeshObj:SetActive(state)
end

---播放麻将倒下的动画
function Mj3d:doDown()
    if not self.gameObject then
        return
    end
end

function Mj3d:setMj3Active(isActive)
    if not self.gameObject then
        return
    end
    self.gameObject:SetActive(isActive)
end

---@class mj3dStates
Mj3d.mj3dState =
{
    hide = 0,
    normal = 1,
    hlight = 2,
    outline = 3,
    gray = 4,
    yellow = 5,
}
---设置麻将状态，0 隐藏 ，1 普通， 2 高亮 , 3 描边 , 4 变暗 , 5 变黄
function Mj3d:setMj3dState(state)
    if not self.gameObject then
        return
    end
    self.curMj3dState = state
    ComponentUtil.SafeSetActive(self.tagMeshObj,(0 ~=  self.curMj3dState) and self.tagIsHasTex)
    ComponentUtil.SafeSetActive(self.meshObj,0 ~=  self.curMj3dState)
    self.majiangMeshRenderer.material = self.curStyleMats[self.curMj3dState]
end
---设置麻将的默认状态
function Mj3d:setMj3dDefState(state)
    self.defState = state
end
---重置麻将为默认状态
function Mj3d:resetDefState()
    self:setMj3dState(self.defState)
end

---为3D麻将附加特效
function Mj3d:AppendSomeThing(callBack,effectName,tryCreate)
    if not Mj3d.effectHolder then
        Mj3d.mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")
    end
    local obj = nil
    local goT = GetComponentWithPath(self.gameObject,effectName,ComponentTypeName.Transform)
    if goT then
        obj = goT.gameObject
    end
    if obj == nil and tryCreate then
        local holder = Mj3d.mj3dHelper:getModule().view.effectHodlerTrans.gameObject
        local effectTemplate = GetComponentWithPath(holder,effectName, ComponentTypeName.Transform).gameObject
        obj = GameObject.Instantiate(effectTemplate)
        obj.transform.parent = self.gameObject.transform
        obj.transform.localPosition = Vector3.zero
        obj.transform.localScale = effectTemplate.transform.localScale
        obj.name = effectName
    end
    if obj then
        obj.layer = self.gameObject.layer
        obj:SetActive(false)
    end
    if callBack then
        callBack(obj)
    end
end

---@class shadowStateEnum
Mj3d.shadowState = 
{
    ---没有影子
    none = 0,
    ---横躺时的影子
    down = 1,
    ---竖立时的影子
    standing = 2,
}

function Mj3d:setShadowState(shadowState)
    if not self.gameObject then
        return
    end
    if (not self.shadowObj) and (shadowState ~= Mj3d.shadowState.none) then
        self:AppendSomeThing(function (effectObj)
            self.shadowObj = effectObj
            self.shadowSuObj = GetComponentWithPath(self.shadowObj,"shadow_su",ComponentTypeName.Transform).gameObject
            self.shadowTangObj = GetComponentWithPath(self.shadowObj,"shadow_tang",ComponentTypeName.Transform).gameObject
        end ,"Shadow",true)
    end
    if self.shadowObj then
        self.shadowObj:SetActive(shadowState ~= Mj3d.shadowState.none)
        if shadowState == Mj3d.shadowState.down then
            self.shadowSuObj:SetActive(false)
            self.shadowTangObj:SetActive(true)
            self.shadowObj.transform.localPosition = Vector3(0,-1,0)
            self.shadowObj.transform.localEulerAngles = Vector3.zero
            self.shadowObj.transform.localScale = Vector3(0.8,0.8,0.8)
        elseif shadowState == Mj3d.shadowState.standing then
            self.shadowSuObj:SetActive(true)
            self.shadowTangObj:SetActive(false)
            self.shadowObj.transform.localPosition = Vector3(0,0,-1.8)
            self.shadowObj.transform.localEulerAngles = Vector3(0,-90,-90)
            self.shadowObj.transform.localScale = Vector3(1,1,1)
        end
    end
end

function Mj3d:setArrowState(state)
    if not self.gameObject then
        return
    end
    if (not self.arrowObj) and (state == true) then
        self:AppendSomeThing(function (effectObj)
            self.arrowObj = effectObj
        end ,"Arrow",true)
    end
    if self.arrowObj then
        self.arrowObj:SetActive(state)
    end
end

function Mj3d:setTingArrowState(state)
    if not self.gameObject then
        return
    end
    if (not self.tingArrowObj) and (state == true) then
        self:AppendSomeThing(function (effectObj)
            self.tingArrowObj = effectObj
            self.tingArrowObj.transform.localPosition = Vector3(0,4.5,2.4)
            self.tingArrowObj.transform.localEulerAngles = Vector3(0,0,-180)
        end ,"TingArrow",true)
    end
    if self.tingArrowObj then
        self.tingArrowObj:SetActive(state)
    end
end

function Mj3d:setKuangEffectState(state)
    if not self.gameObject then
        return
    end
    if (not self.kuangEffectObj) and (state == true) then
        self:AppendSomeThing(function (effectObj)
            self.kuangEffectObj = effectObj
            self.kuangEffectObj.transform.localEulerAngles = Vector3(23,0,0)
        end ,"paikuan",true)
    end
    if self.kuangEffectObj then
        self.kuangEffectObj:SetActive(state)
    end
end

---设置听牌多标志状态
function Mj3d:setTingDuoTagState(state)
    if not self.gameObject then
        return
    end
    if (not self.TingDuoObj) and (state == true) then
        self:AppendSomeThing(function (effectObj)
            self.TingDuoObj = effectObj
            self.TingDuoObj.transform.localPosition = Vector3(0,4.5,2.4)
            self.TingDuoObj.transform.localEulerAngles = Vector3(0,0,-180)
        end ,"tingduoTag",true)
    end
    if self.TingDuoObj then
        self.TingDuoObj:SetActive(state)
    end
end
---设置听牌大标志状态
function Mj3d:setTingDaTagState(state)
    if not self.gameObject then
        return
    end
    if (not self.TingDaObj) and (state == true) then
        self:AppendSomeThing(function (effectObj)
            self.TingDaObj = effectObj
            self.TingDaObj.transform.localPosition = Vector3(0,4.5,2.4)
            self.TingDaObj.transform.localEulerAngles = Vector3(0,0,-180)
        end ,"tingdaTag",true)
    end
    if self.TingDaObj then
        self.TingDaObj:SetActive(state)
    end
end


---重置mj3d对象,不要调用，不要调用，不要调用，请使用table3d_helper中的清理麻将函数
---@private
function Mj3d:reset()
    for i=1,#activedMj3ds do
        if activedMj3ds[i] == self then
            table.remove(activedMj3ds,i)
            break
        end
    end

    self:setLayer(11)
    self:resetLocalTransState()
    self:setArrowState(false)
    self:setTag(nil)
    self:setShadowState(Mj3d.shadowState.none)

    self.pai = nil
    self.gameObject = nil
    self.transform = nil
    self.goInstanceId = nil
    self.collider = nil

    self.meshRootObj = nil
    self.meshObj = nil
    self.majiangMesh = nil
    self.majiangMeshRenderer = nil

    self.tagMeshObj = nil
    self.tagMeshRender = nil
    self.tagMat = nil

    self.kuangEffectObj = nil
    self.TingDuoObj = nil
    self.TingDaObj = nil

    self.arrowObj = nil
    self.tingArrowObj = nil
    
    self.shadowObj = nil
    self.shadowSuObj = nil
    self.shadowTangObj = nil
end

function Mj3d:resetLocalTransState()
    if not self.gameObject then
        return
    end
    self.gameObject.transform.localScale = Vector3(0.96,1,1)
    self.gameObject.transform.localPosition = Vector3.zero
    self.gameObject.transform.localEulerAngles =  Vector3.zero
    self.meshObj.transform.localPosition = Vector3.zero
    self.meshRootObj.transform.localEulerAngles = Vector3.zero
    self.meshRootObj.transform.localPosition = Vector3.zero
end


return Mj3d