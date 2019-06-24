
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

-- 
local GoldEntranceModel = Class("goldEntranceModel", Model)

function GoldEntranceModel:initialize(...)
    Model.initialize(self, ...)
end

return GoldEntranceModel