



local class = require("lib.middleclass")
local ModelBase = require('package.majiang.module.tablenew.table_model')
---@class Table3DModel:TableMJModel
local Table3dModel = class('tableModel', ModelBase)  ---注意啦!!这地方类名必须叫 tableModel

function Table3dModel:initialize(...)
    ModelBase.initialize(self, ...)
end

return Table3dModel