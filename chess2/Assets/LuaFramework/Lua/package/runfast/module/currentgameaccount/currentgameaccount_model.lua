
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================
local CurrentGameAccountModel = Class("CurrentGameAccountModel", Model)

function CurrentGameAccountModel:initialize(...)
    Model.initialize(self, ...)
end

return CurrentGameAccountModel