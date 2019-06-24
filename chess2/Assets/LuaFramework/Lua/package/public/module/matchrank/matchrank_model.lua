
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

--
local MatchRankModel = Class("matchRankModel", Model)

function MatchRankModel:initialize(...)
    Model.initialize(self, ...)
end

return MatchRankModel