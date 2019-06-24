
local Class = require("lib.middleclass")
-- ==========================================================================
local Queue = Class('queue')

function Queue:initialize(...)
    self.queueTable = { };
end
 
-- 将对象插入队列队尾
function Queue:enqueue(element)

    local size = self:getSize();
    self.queueTable[size + 1] = element;
end
 
-- 移除并返回位于队列开始处的对象
function Queue:dequeue()

    local size = self:getSize();
    if self:isEmpty() then
        return;
    end

    return table.remove(self.queueTable, 1);
end
 
-- 返回位于队列开始处的对象但不将其移除
function Queue:peek()

    local size = self:getSize();
    if self:isEmpty() then
        return;
    end
    return self.queueTable[1];
end
 
-- 是否为空队列
function Queue:isEmpty()

    local size = self:getSize();
    if size == 0 then
        return true;
    end
    return false;
end
 
-- 获取队列元素数量
function Queue:getSize()

    return #self.queueTable or 0;
end

-- 获取队列表对象
function Queue:getQueueTable()

    return self.queueTable;
end
 
-- 清空队列
function Queue:clear()

    self.queueTable = nil;
    self.queueTable = { };
end

return Queue;