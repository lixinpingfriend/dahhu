
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

--
local MatchRecordModel = Class("matchRecordModel", Model)

function MatchRecordModel:initialize(...)
    Model.initialize(self, ...)
end

return MatchRecordModel