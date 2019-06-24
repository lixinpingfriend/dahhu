




local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
local class = require("lib.middleclass")
---@class Mj2DHeap
local Mj2DHeap = class('mj2dHeap')

--- 创建
function Mj2DHeap:initialize(view, heapType)
    self.heapType = heapType
    self.view = view
end

--- 堆里所有的麻将
function Mj2DHeap:list()
    return MjManager.get_mjs(self.heapType)
end

--- 添加一个麻将
function Mj2DHeap:add_mj(params)

end

--- 设置麻将相关
function Mj2DHeap:set_mj(params)
    
end

--- 根据准备出的牌做相关处理
function Mj2DHeap:handle_mjs_ready_out(pai)
    local list = self:list()
    for i = 1, #list do
        local mj = list[i]
        if(pai ~= 0 and mj.pai == pai) then
            mj:show_tag_ready_out(true)
        else
            mj:show_tag_ready_out(false)
        end
    end
end

--- 清除
function Mj2DHeap:clear()
    local list = self:list()
    for i = 1, #list do
        ---@type Mj2D
        local mj = list[i]
        mj:clear()
    end
end

return Mj2DHeap