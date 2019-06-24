




local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")
local GameObject = UnityEngine.GameObject
local Vector3 = Vector3
---@class Mj3dKan
local Mj3dKan = {}

local commonSpaceing = 2.63  ---普通麻将间隔
local downAddSpaceing = 0.37 ---横向摆放的麻将增加的间距
local downYPos = 1.84 ---横向摆放的麻将Y局部坐标

function Mj3dKan:Create(KAN,parent,formState)
    local mj3dkan = {}
    setmetatable(mj3dkan, { __index = Mj3dKan })
    mj3dkan.kan = KAN;
    mj3dkan.gameObject = GameObject.New()
    mj3dkan.gameObject.transform.parent = parent
    mj3dkan.gameObject.transform.localScale = Vector3.one
    mj3dkan.gameObject.transform.localPosition = Vector3.zero
    mj3dkan.gameObject.transform.localEulerAngles =  Vector3.zero
    mj3dkan.Mj3ds = {}  ---坎中的麻将，Mj3d类型

    for i=1,#KAN.Pai do
        local pai = KAN.Pai[i]
        if 0 == pai then
            pai = -1
        end
        local mj3d =  Mj3d:Create(pai,mj3dkan.gameObject.transform)
        mj3d:setLayer(13)
        --[[if(Mj3dHelper:getModule().view:is_laizi(mj3d:Pai())) then

        end--]]
        local tagType = Mj3dHelper:getModule().view:get_down_tag_type(mj3d:Pai())
        local texture = nil
        local sprite = Mj3dHelper:getModule().view.tagSpriteH:FindSpriteByName(tostring(tagType))
        if sprite then
            texture = sprite.texture
        end
        mj3d:setTag(texture)
        table.insert(mj3dkan.Mj3ds,mj3d)
    end
    mj3dkan.xSpaceing = 9
    if #KAN.Pai < 3 then
        mj3dkan.xSpaceing = mj3dkan.xSpaceing - (3-#KAN.Pai) * commonSpaceing
    end
    mj3dkan.formState = formState  ---坎的来源状态   1 自己, 2下家，3对家，4 上家

    if 1 == formState then
        mj3dkan.gameObject.name = "自己"
    elseif 2 == formState then
        mj3dkan.gameObject.name = "下家"
    elseif 3 == formState then
        mj3dkan.gameObject.name = "对家"
    elseif 4 == formState then
        mj3dkan.gameObject.name = "上家"
    end

    mj3dkan.isChi = mj3dkan:checkIsChi()
    mj3dkan.isGang = mj3dkan:checkIsGang()
    mj3dkan.isPeng = mj3dkan:checkIsPeng()
    mj3dkan:proceeDisType()
    return mj3dkan
end

Mj3dKan.kanTypeEnum = 
{
    none = 0,
    chi = 1,
    peng = 2,
    gang = 3,
    angang = 4,
    jiegang = 5,
    bugang = 6,
}

Mj3dKan.kanType = Mj3dKan.kanTypeEnum.none

---处理坎的显示类型
function Mj3dKan:proceeDisType()
    if self.isGang then
        local hasValueCount = 0
        for i=1,#self.kan.Pai do
            if 0 ~= self.kan.Pai[i] then
                hasValueCount = hasValueCount + 1
            end
        end
        local isAnGang =  hasValueCount == 1  ---是否是暗杠
        if isAnGang then
            self:processAnGang() --处理暗杠
            self.gameObject.name = self.gameObject.name.."_暗杠"
            self.kanType = Mj3dKan.kanTypeEnum.angang
        else
            local isJieGang = self.kan.DianGang ~= -1 and self.kan.DianGang ~= -2
            local isBuGang = self.kan.DianGang == -1
            if isJieGang then
                self:processJieGang()--处理接杠
                self.gameObject.name = self.gameObject.name.."_接杠"
                self.kanType = Mj3dKan.kanTypeEnum.jiegang
            elseif isBuGang then
                self:processBuGang()--处理补杠
                self.gameObject.name = self.gameObject.name.."_补杠"
                self.kanType = Mj3dKan.kanTypeEnum.bugang
            else
                self:processCommon() --普通布局
                self.gameObject.name = self.gameObject.name.."_杠"
                self.kanType = Mj3dKan.kanTypeEnum.gang
            end
        end
    elseif self.isChi then
        self:processChi() --处理吃
        self.gameObject.name = self.gameObject.name.."_吃"
        self.kanType = Mj3dKan.kanTypeEnum.chi
    elseif self.isPeng then
        self:processPeng() --处理碰
        self.gameObject.name = self.gameObject.name.."_碰"
        self.kanType = Mj3dKan.kanTypeEnum.peng
    else
        self:processCommon() --普通布局
        self.gameObject.name = self.gameObject.name.."_就是下张"
        self.kanType = Mj3dKan.kanTypeEnum.none
    end
end

---检测是否为吃
function Mj3dKan:checkIsChi()
    local Pais = self.kan.Pai
    if #Pais ~= 3 then
        return false
    end
    for i=1,#Pais do
        local pai = Pais[i]
        for j=1,#Pais do
            if i ~= j and pai == Pais[j] then
                return false
            end
        end
    end
    return true
end
---检测是否为碰
function Mj3dKan:checkIsPeng()
    local Pais = self.kan.Pai
    if #Pais ~= 3 then
        return false
    end
    if Pais[1] ~= Pais[2] or Pais[1] ~= Pais[3] or Pais[2] ~= Pais[3] then
        return false
    end
    return true
end
---检测是否为杠
function Mj3dKan:checkIsGang()
    local Pais = self.kan.Pai
    if #Pais ~= 4 then
        return false
    end
    return true
end

---处理砍的普通布局
function Mj3dKan:processCommon()
    local xOffset = 0
    local spaceing = commonSpaceing
    for i=1,#self.Mj3ds do
        local mj3d = self.Mj3ds[i]
        mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
        xOffset = xOffset + spaceing
        mj3d:setShadowState(Mj3d.shadowState.down)
    end
end
---处理暗杠布局
function Mj3dKan:processAnGang()
    local xOffset = 0
    local spaceing = commonSpaceing
    local secondPos = nil
    for i=1,#self.Mj3ds do
        local mj3d = self.Mj3ds[i]
        mj3d:setShadowState(Mj3d.shadowState.down)
        mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
        if 2 == i then
            secondPos = mj3d.gameObject.transform.localPosition
        end
        if secondPos and 4 == i then
            secondPos.y = secondPos.y + downYPos
            mj3d.gameObject.transform.localPosition = secondPos
            mj3d:setShadowState(Mj3d.shadowState.none)

        end
        xOffset = xOffset + spaceing
    end
end
---处理接杠的布局
function Mj3dKan:processJieGang()
    local needProcessIndex = 1
    if 2 == self.formState then
        needProcessIndex = 3 --处理下家
    elseif 3 == self.formState then
        needProcessIndex = 4 --处理对家
    elseif 4 == self.formState then
        needProcessIndex = 1 --处理上家
    end
    local xOffset = 0
    local spaceing = commonSpaceing
    local downSpaceing = downAddSpaceing
    local secondPos = nil
    for i=1,#self.Mj3ds do
        local mj3d = self.Mj3ds[i]
        mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
        mj3d:setShadowState(Mj3d.shadowState.down)
        if 2 == i then
            secondPos = mj3d.gameObject.transform.localPosition
        end
        if secondPos and 4 == i then
            secondPos.y = secondPos.y + downYPos
            mj3d.gameObject.transform.localPosition = secondPos
            mj3d:setShadowState(Mj3d.shadowState.none)
        end

        xOffset = xOffset + spaceing
        if i == needProcessIndex then
            mj3d:setMj3dDefState(4)
            mj3d:resetDefState()
        end
        --[[if i == needProcessIndex then
            mj3d.gameObject.transform.localEulerAngles = Vector3.New(0,90,0) ---牌横放
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset + downSpaceing,0,downYPos)
            xOffset = xOffset + spaceing + downSpaceing * 2
        else
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
            xOffset = xOffset + spaceing
        end--]]
    end
end
---处理补杠的布局
function Mj3dKan:processBuGang()
    local needProcessIndex = 1
    if 2 == self.formState then
        needProcessIndex = 3 --处理下家
    elseif 3 == self.formState then
        needProcessIndex = 4 --处理对家
    elseif 4 == self.formState then
        needProcessIndex = 1 --处理上家
    end
    local xOffset = 0
    local spaceing = commonSpaceing
    local downSpaceing = downAddSpaceing
    local secondPos = nil
    for i=1,#self.Mj3ds do
        local mj3d = self.Mj3ds[i]
        mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
        mj3d:setShadowState(Mj3d.shadowState.down)
        if 2 == i then
            secondPos = mj3d.gameObject.transform.localPosition
        end
        if secondPos and 4 == i then
            secondPos.y = secondPos.y + downYPos
            mj3d.gameObject.transform.localPosition = secondPos
            mj3d:setShadowState(Mj3d.shadowState.none)
        end

        xOffset = xOffset + spaceing
        if i == needProcessIndex  then
            mj3d:setMj3dDefState(4)
            mj3d:resetDefState()
        end
        --[[if i == needProcessIndex  then
            mj3d.gameObject.transform.localEulerAngles = Vector3.New(0,90,0) ---牌横放
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset + downSpaceing,0,downYPos)
        elseif i == needProcessIndex + 1  then
            mj3d.gameObject.transform.localEulerAngles = Vector3.New(0,90,0)
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset + downSpaceing,0,downYPos + commonSpaceing)
            xOffset = xOffset + spaceing + downSpaceing * 2
        else
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
            xOffset = xOffset + spaceing
        end--]]
    end
end
---处理碰的布局
function Mj3dKan:processPeng()
    local needProcessIndex = 1
    if 2 == self.formState then
        needProcessIndex = 3 --处理下家
    elseif 3 == self.formState then
        needProcessIndex = 2 --处理对家
    elseif 4 == self.formState then
        needProcessIndex = 1 --处理上家
    end
    local xOffset = 0
    local spaceing = commonSpaceing
    local downSpaceing = downAddSpaceing
    for i=1,#self.Mj3ds do
        local mj3d = self.Mj3ds[i]
        mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
        mj3d:setShadowState(Mj3d.shadowState.down)
        xOffset = xOffset + spaceing
        if i == needProcessIndex and 0 < mj3d:Pai() then
            mj3d:setMj3dDefState(4)
            mj3d:resetDefState()
        end
        --[[if i == needProcessIndex then
            mj3d.gameObject.transform.localEulerAngles = Vector3.New(0,90,0) ---牌横放
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset + downSpaceing,0,downYPos)
            xOffset = xOffset + spaceing + downSpaceing * 2
        else
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
            xOffset = xOffset + spaceing
        end--]]
    end
end
---处理吃的布局
function Mj3dKan:processChi()
    local spaceing = commonSpaceing
    local downSpaceing = downAddSpaceing
    local JinZhang  = self.kan.JinZhang
    --[[local xOffset = spaceing + downSpaceing
    if -1 == JinZhang then
        xOffset = 0
    end--]]
    local xOffset = 0
    for i=1,#self.Mj3ds do
        local mj3d = self.Mj3ds[i]
        mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
        mj3d:setShadowState(Mj3d.shadowState.down)
        xOffset = xOffset + spaceing
        if i == JinZhang + 1 then
            mj3d:setMj3dDefState(4)
            mj3d:resetDefState()
        end
        --[[if i == JinZhang + 1 then
            mj3d.gameObject.transform.localEulerAngles = Vector3.New(0,90,0) ---牌横放
            mj3d.gameObject.transform.localPosition = Vector3.New(0,0,downYPos)
        else
            mj3d.gameObject.transform.localPosition = Vector3.New(xOffset,0,0)
            xOffset = xOffset + spaceing
        end--]]
    end
end

function Mj3dKan:playAddKanAni()
    local trans = self.gameObject.transform
    local endPos = trans.position
    trans.localPosition = trans.localPosition + Vector3.New(6,0,0)
    Mj3dHelper:getModule():setTargetFrame(60)
    self.addAniTweener = trans:DOMove(endPos,0.5):SetEase(DG.Tweening.Ease.OutSine):OnComplete(function()
        Mj3dHelper:getModule():setTargetFrame()
    end)
end

---获取坎的数据
function Mj3dKan:Kan()
    return self.kan
end
---销毁坎对象
function Mj3dKan:destroy()
    Mj3dHelper:clearMj3dTabel(self.Mj3ds)
    if self.addAniTweener then
        DG.Tweening.DOTween.Kill(self.addAniTweener.id)
    end
    self.addAniTweener = nil
    GameObject.Destroy(self.gameObject)
end

return Mj3dKan
