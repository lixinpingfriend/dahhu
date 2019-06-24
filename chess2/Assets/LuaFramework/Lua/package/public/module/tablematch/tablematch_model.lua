
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

--
local TableMatchModel = Class("tableMatchModel", Model)

function TableMatchModel:initialize(...)
    Model.initialize(self, ...)
end

return TableMatchModel