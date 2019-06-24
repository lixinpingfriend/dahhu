
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

-- 
local ClassName = Class("ModelName", Model)

function ClassName:initialize(...)
    Model.initialize(self, ...)
end

return ClassName