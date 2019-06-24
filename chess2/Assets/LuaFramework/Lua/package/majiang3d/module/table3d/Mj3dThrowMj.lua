



local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper")

local GameObject = UnityEngine.GameObject
local Vector3 = Vector3

---@class Mj3dThrowMj
local Mj3dThrowMj = {}

function Mj3dThrowMj:Create(transform)
    local mj3dThrowMj = {}
    setmetatable(mj3dThrowMj, { __index = Mj3dThrowMj })
    mj3dThrowMj.gameObject = transform.gameObject
    mj3dThrowMj.Mjs = {}

    mj3dThrowMj.HSpaceing = 2.63  ---普通麻将横向间隔
    mj3dThrowMj.VSpaceing = -3.55  ---普通麻将纵向间隔
    mj3dThrowMj.UpSpaceing = 1.85  ---普通麻将向上的间隔

    return mj3dThrowMj
end

---刷新弃牌
--[[function Mj3dThrowMj:refreshThrowMj(QiZhang,RowMaxCount)
    Mj3dHelper:clearMj3dTabel(self.Mjs)
    for i=1,#QiZhang do
        local pai = QiZhang[i]
        self:AddThrowMj(pai)
    end
    self:processLayout(RowMaxCount)
end--]]
---添加弃张
function Mj3dThrowMj:AddThrowMj(pai,showPointer)
    if 0 == pai then
        pai = -1
    end
    local mj3d = Mj3d:Create(pai,self.gameObject.transform)
    mj3d:setLayer(13)
    ---处理弃张中的赖子
    --[[if(Mj3dHelper:getModule().view:is_laizi(mj3d:Pai())) then
        local tagType = Mj3dHelper:getModule().view:get_out_tag_type(mj3d:Pai())
        local texture = self.view.tagSpriteH:FindSpriteByName(tostring(tagType)).texture
        mj3d:setTag(texture)
    end--]]

    local tagType = Mj3dHelper:getModule().view:get_out_tag_type(mj3d:Pai())
    local sprite = Mj3dHelper:getModule().view.tagSpriteH:FindSpriteByName(tostring(tagType))
    local texture = nil
    if sprite then
        texture = sprite.texture
    end
    mj3d:setTag(texture)

    table.insert(self.Mjs,mj3d)
    mj3d:setArrowState(showPointer)
    mj3d:setShadowState(Mj3d.shadowState.down)
    return mj3d
end
---处理弃张的布局
function Mj3dThrowMj:processLayout(RowMaxCount,ColMaxCount)
    ColMaxCount = ColMaxCount or 0
    local rowCount = 0
    local lineCount = 0
    local layCount = 0
    for i=1,#self.Mjs do
        local mj3d = self.Mjs[i]
        if rowCount >= RowMaxCount then
            lineCount = lineCount + 1
            rowCount = 0
        end
        if 0 ~= ColMaxCount and lineCount >= ColMaxCount then
            layCount = layCount + 1
            lineCount = 0
        end
        mj3d.gameObject.transform.localPosition = Vector3.New(rowCount * self.HSpaceing,layCount * self.UpSpaceing,lineCount * self.VSpaceing)
        rowCount = rowCount + 1
    end
end

---获取下一个弃张所在的局部坐标
function Mj3dThrowMj:getNextLocalPos(RowMaxCount,ColMaxCount)
    ColMaxCount = ColMaxCount or 0
    local rowCount = 0
    local lineCount = 0
    local layCount = 0
    local nextCount = #self.Mjs + 1
    local nextLocalPos = nil
    for i=1,nextCount do
        if rowCount >= RowMaxCount then
            if 0 ~= ColMaxCount and lineCount >= ColMaxCount then
                layCount = layCount + 1
                lineCount = 0
            end
            lineCount = lineCount + 1
            rowCount = 0
        end
        nextLocalPos = Vector3.New(rowCount * self.HSpaceing,layCount * self.UpSpaceing,lineCount * self.VSpaceing)
        rowCount = rowCount + 1
    end
    return nextLocalPos
end
---获取最后一张弃牌
function Mj3dThrowMj:getLastMj3d()
    return self.Mjs[#self.Mjs]
end
---从弃张中指定删除某个mj3d
function Mj3dThrowMj:deleteMj3d(mj3d)
    for i=1,#self.Mjs do
        if self.Mjs[i] == mj3d then
            Mj3dHelper:clearMj3d(mj3d)
            table.remove(self.Mjs,i)
            break
        end
    end
end
---清空弃张
function Mj3dThrowMj:clear()
    Mj3dHelper:clearMj3dTabel(self.Mjs)
end

return Mj3dThrowMj