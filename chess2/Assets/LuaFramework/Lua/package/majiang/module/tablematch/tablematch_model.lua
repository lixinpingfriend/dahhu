

local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

-- 
local ModelBase = require('package.majiang.module.tablebase.tablebase_model')
local TableMatchModel = Class("tablematchModel", Model)

function TableMatchModel:initialize(...)
    Model.initialize(self, ...)
end

--type 1 托管   2 取消托管
function TableMatchModel:request_cancel_intrust(type)
	local msgId, request = self.netMsgApi.create_request_data("Msg_Table_Intrust")
    request.type = type
    ModelBase.send_msg(self, msgId, request, "gameServer", self.SeqNo)
    print("-------------------------------cancel tuo guang---------",request.type)
end 

return TableMatchModel