
local Class = require("lib.middleclass")
local Model = require("core.mvvm.model_base")
-- ==========================================================================

-- 
local JoinRoomModel = Class("joinRoomModel", Model)

function JoinRoomModel:initialize(...)
    Model.initialize(self, ...)
    self.sendMsgNetClientName = "gameServer"

    --[[Model.subscibe_msg_event(self, {    --登录回调
        msgName = "Msg_Table_Login",
        callback = function(msgName, msgBuffer)
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)          
                Model.dispatch_event(self, "Event_Table_Login", retData)
        end
    })

    Model.subscibe_msg_event(self, {    --登录回调
        msgName = "Msg_Table_Enter_Room",
        callback = function(msgName, msgBuffer)
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                
                Model.dispatch_event(self, "Event_Table_Enter_Room", retData)         
                print("Msg_Table_Enter_Room")                      
        end
    })

    Model.subscibe_msg_event(self, {   
        msgName = "Msg_Table_Synchronize_Notify",
        callback = function(msgName, msgBuffer)
                local retData, error = Model.unpack_msg(self, msgName, msgBuffer.dataBuffer)                      
                Model.dispatch_event(self, "Event_Table_Synchronize_Notify", retData)                                                
        end
    })]]
end



return JoinRoomModel