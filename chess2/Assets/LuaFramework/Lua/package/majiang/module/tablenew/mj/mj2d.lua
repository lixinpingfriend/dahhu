




local Pool = require("package.majiang.module.tablenew.pool")
local ModuleCache = ModuleCache
local Color = Color
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
local GameObject = UnityEngine.GameObject

---@class Mj2D
local Mj2D = {}

--- 获取克隆的名字
function Mj2D:get_clone_name(name)
    return name
end

--- 创建
function Mj2D:new(pai, parent, valTable)
    valTable = valTable or {}
    local mj = {}
    setmetatable(mj, { __index = Mj2D })
    mj.pai = tonumber(pai)
    if(valTable.gameObject) then
        mj.gameObject = valTable.gameObject
    else
        mj.gameObject = Pool:pop(valTable.cloneName or mj:get_clone_name(pai), parent, valTable.index)
    end
    mj.gameObject:SetActive(true)
    mj.transform = mj.gameObject.transform
    if(valTable.spriteHolder) then
        mj.spriteHolder = valTable.spriteHolder
    end
    if(valTable.tagSpriteHolder) then
        mj.tagSpriteHolder = valTable.tagSpriteHolder
    end
    return mj
end

---设置坐标
function Mj2D:set_local_pos(pos)
    self.transform.localPosition = pos
end

---设置大小
function Mj2D:set_local_scale(scale)
    self.transform.localScale = scale
end

---设置欧拉角
function Mj2D:set_local_euler_angle(eulerAngle)
    self.transform.localEulerAngles = eulerAngle
end

---设置麻将的右上角标记
function Mj2D:set_tag(tagVal, gameObject)
    gameObject = gameObject or self.gameObject
    local tag = GetComponentWithPath(gameObject, "Tag", ComponentTypeName.Transform)
    if(tag) then
        local tagImage = GetComponentWithPath(gameObject, "Tag", ComponentTypeName.Image)
        tag.gameObject:SetActive(true)
        local sprite = self.tagSpriteHolder:FindSpriteByName(tostring(tagVal))
        tagImage.sprite = sprite
        tagImage.gameObject:SetActive(nil ~= sprite)
    end
end

---隐藏tag
function Mj2D:hide_tag(gameObject)
    gameObject = gameObject or self.gameObject
    local tag = GetComponentWithPath(gameObject, "Tag", ComponentTypeName.Transform)
    if(tag) then
        tag.gameObject:SetActive(false)
    end
end

--- 设置牌(公用spriteHolder)
function Mj2D:set_pai(skinObj, style)
    local gameObject = skinObj or self.gameObject
    local pai = self.pai
    local paiImage = GetComponentWithPath(gameObject, "Image", ComponentTypeName.Image)
    if(pai <= 34) then
        if(style and style ~= 0) then
            pai = 100 * style + pai
        end
    end
    if (paiImage) then
        paiImage.sprite = self.spriteHolder:FindSpriteByName(pai .. "")
    end
end

--- 设置牌(自己有spriteHolder)
function Mj2D:set_pai_owner()
    local pai = self.pai
    local paiImage = GetComponentWithPath(self.gameObject, "Image", ComponentTypeName.Image)
    local paiSpriteHolder = GetComponentWithPath(self.gameObject, "Image", "SpriteHolder")
    if (paiImage) then
        paiImage.sprite = paiSpriteHolder:FindSpriteByName(pai .. "")
    end
end

--- 设置牌底
function Mj2D:set_bg_color(bgColor, skinObj)
    local gameObject = skinObj or self.gameObject
    local pai = self.pai
    if(pai ~= 0) then
        pai = 1
    else
        pai = 2
    end
    if(self.state == 1) then
        pai = 1
    end
    local image = GetComponentWithPath(gameObject, "Image", ComponentTypeName.Image)
    if(image) then
        local imageObj = image.gameObject
        imageObj:SetActive(pai == 1)
    end
    local paiImage = GetComponentWithPath(gameObject, "Bg", ComponentTypeName.Image)
    local paiSpriteHolder = GetComponentWithPath(gameObject, "Bg", "SpriteHolder")
    if(bgColor and bgColor ~= 0) then
        pai = 100 * bgColor + pai
    end
    if (paiImage and paiSpriteHolder) then
        paiImage.sprite = paiSpriteHolder:FindSpriteByName(pai .. "")
    end
    local paiImage1 = GetComponentWithPath(gameObject, "BgFront", ComponentTypeName.Image)
    local paiSpriteHolder1 = GetComponentWithPath(gameObject, "BgFront", "SpriteHolder")
    if (paiImage1 and paiSpriteHolder1) then
        paiImage1.sprite = paiSpriteHolder1:FindSpriteByName(pai .. "")
    end
    local owerImage = ModuleCache.ComponentManager.GetComponent(gameObject, ComponentTypeName.Image)
    local owerSpriteHolder = ModuleCache.ComponentManager.GetComponent(gameObject, "SpriteHolder")
    if(owerImage and owerSpriteHolder) then
        owerImage.sprite = owerSpriteHolder:FindSpriteByName(pai .. "")
    end
end

function Mj2D:set_def_color(color)
    self.defColor = color
end

--- 设置整个麻将的颜色
function Mj2D:set_color(color, gameObject)
    gameObject = gameObject or self.gameObject
    local childs = TableUtil.get_all_child(gameObject)
    for i = 1, #childs do
        local image = ModuleCache.ComponentManager.GetComponent(childs[i], ComponentTypeName.Image)
        if (image) then
            local c = Color.New(color.r, color.g, color.b, image.color.a) --- 保存原来的透明度
            image.color = c
        end
    end
end

--- 设置麻将整个皮肤
function Mj2D:set_skin(bgColor, style, skinObj)
    self:set_bg_color(bgColor, skinObj)
    self:set_pai(skinObj, style)
end

--- 设置麻将状态 1 正常 2 亮倒 3 盖倒
function Mj2D:set_state(state)
    self.state = state
    local skinObj
    local downObj = GetComponentWithPath(self.gameObject, "Down", ComponentTypeName.Transform).gameObject
    local upObj = GetComponentWithPath(self.gameObject, "Up", ComponentTypeName.Transform).gameObject
    downObj:SetActive(false)
    upObj:SetActive(false)
    if(state == 1) then
        upObj:SetActive(true)
        skinObj = upObj
    elseif(state == 2) then
        downObj:SetActive(true)
        skinObj = downObj
    elseif(state == 3) then
        downObj:SetActive(true)
        skinObj = downObj
    end
    return skinObj
end

--- 设置癞子
function Mj2D:set_lai_zi(gray, tagVal, gameObject, notYellow)
    gameObject = gameObject or self.gameObject
    if(not notYellow) then
        if(gray) then
            self:set_color(Color.New(130/255,130/255,0/255,1), gameObject)
        else
            self:set_color(Color.yellow, gameObject)
        end
    else
        if(gray) then
            self:set_color(Color.gray, gameObject)
        else
            self:set_color(Color.white, gameObject)
        end
    end
    self:set_tag(tagVal, gameObject)
end

--- 设置小红点
function Mj2D:set_red_point(show, gameObject)
    gameObject = gameObject or self.gameObject
    local redPoint = GetComponentWithPath(gameObject, "RedPoint", ComponentTypeName.Transform)
    if(redPoint) then
        self.redPoint = redPoint
        redPoint.gameObject:SetActive(show)
    end
end

--- 设置无效状态
function Mj2D:set_disable(disable)
    self.disable = disable
end

--- 清除
function Mj2D:clear()
    self:show_pointer(false)
    self:set_color(Color.white)
    self.gameObject:SetActive(false)
end

--- 显示小箭头
function Mj2D:show_pointer(show, gameObject)
    gameObject = gameObject or self.gameObject
    local movePointer = GetComponentWithPath(gameObject, "MovePointer", ComponentTypeName.Transform)
    if(movePointer) then
        movePointer.gameObject:SetActive(show)
    end
end

--- 激活状态
function Mj2D:enable()
    return not self.disable
end

--- 根据即将出的牌显示标记
function Mj2D:show_tag_ready_out(show)
    if show then
        self:set_color(Color(255/255,143/255,0/255))
    else
        self:set_color(self.defColor and self.defColor or Color.white)
    end
    --[[local luoDiZhangEffect = GetComponentWithPath(self.gameObject, "LuoDiZhangEffect", ComponentTypeName.Transform)
    if(luoDiZhangEffect) then
        luoDiZhangEffect.gameObject:SetActive(show)
    end--]]
end

Mj2D.topIconType =
{
    none = 0,  ---无
    ting = 1,   ---听牌箭头
    tingDuo = 2, ---听牌最多箭头
    tingDa = 3, ---听牌番数最大箭头
}
---设置麻将顶部图标，现结算只有自己的手牌有这个功能
function Mj2D:set_top_icon(topIconType,topIconAtlas)
    if not self.topIcon then
        self.topIcon = GetComponentWithPath(self.gameObject, "TopIcon", ComponentTypeName.Image)
    end
    if not self.topIcon then
        return
    end
    if topIconType == Mj2D.topIconType.none then
        self.topIcon.gameObject:SetActive(false)
        return
    end
    self.topIcon.gameObject:SetActive(true)
    self.topIcon.sprite = topIconAtlas:FindSpriteByName(tostring(topIconType))
    self.topIcon:SetNativeSize()
end

return Mj2D
