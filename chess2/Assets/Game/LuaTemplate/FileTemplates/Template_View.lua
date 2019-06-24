





local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local ViewBase = require('core.mvvm.view_base')
local {moduleName} = class('{moduleName}', ViewBase)


function {moduleName}:initialize(...)
    ViewBase.initialize(self, "AssetBundle路径", "Prefab名字", 0)
end


return  {moduleName}