



local Mj3dPool = require("package.majiang3d.module.table3d.Mj3dPool")
local Mj3d = require("package.majiang3d.module.table3d.Mj3d")
local Color = Color
local ModuleCache = ModuleCache

---@class Table3DHelper
local table3d_helper = {}

---def layer ---
table3d_helper.layer_3dObj = 8  ---3D对象层
table3d_helper.layer_3dHandmj = 9 ---手牌层
table3d_helper.layer_3dBg = 10 ---3D背景层，牌桌背后的背景
table3d_helper.layer_3dMj = 11 ---3D麻将层，如果没有特殊需求，3d麻将默认在这一层
table3d_helper.layer_3dTable = 12 ---3D桌子层
table3d_helper.layer_3dMjOther= 13 ---其他3D麻将层，为了单独处理一部分麻将的光照而设置的层，现阶段所有玩家的弃张，下张，花牌，都在这一层
table3d_helper.layer_3dMjDisOnScreeen = 14 ---麻将在屏幕上展示的层
-----------end

function table3d_helper:Init(module)
    self.module = module
end

---清空Mj3d的Tablec
function table3d_helper:clearMj3dTabel(Mj3dTabel)
    for i=1,#Mj3dTabel do
        local mj3d = Mj3dTabel[i]
        self:clearMj3d(mj3d)
    end
    table.clear(Mj3dTabel)
end
---清理一个3D麻将对象
function table3d_helper:clearMj3d(mj3d)
    if mj3d then
        Mj3dPool:Push(mj3d)
    end
end
---清空 Mj3dKan 的 Tabel
function table3d_helper:clearKanTable(mj3dKans)
    for i=1,#mj3dKans do
        local mj3dKan = mj3dKans[i]
        mj3dKan:destroy()
    end
    table.clear(mj3dKans)
end

function table3d_helper:getModule()
    return self.module
end

function table3d_helper:getModel()
    return self.module.model
end

return table3d_helper