





local ParamBase = {}

function ParamBase:new()

    local self = {}

    setmetatable( self , {__index = ParamBase})
    self.imUser      = ""
    self.headImg     = ""
    self.gender      = ""
    self.nickname    = ""
    self.userId      = ""
    self.content     = ""
    self.isOnwer     = ""
    self.identifier  = ""
    self.platform    = ""
    self.messageCreateSeconds        = ""
    self.groupId     = ""
    self.username    = ""
    self.msgType     = ""
    self.voiceLength = ""
    self.id          =""
    return self
end
return ParamBase