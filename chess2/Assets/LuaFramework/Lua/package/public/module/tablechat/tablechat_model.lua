
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

-- 
local TabelChatModel = Class("tableChatModel", Model)

function TabelChatModel:initialize(...)
    Model.initialize(self, ...)

end

return TabelChatModel