




local MsgReceiver = {}

function MsgReceiver:new(tag)

    if not tag then
        print("error: can not new msgreceiver without tag")
        return nil
    end

    local self = {}

    setmetatable( self , {__index = MsgReceiver})

    self.recvTag = tag
    self.eventList = {}
    self.offlineList = {}

    return self
end


function MsgReceiver:addEventListener(func, tag, isOffline)
    --print("##############=",tag,func,self.recvTag )
    if not tag then tag = self.recvTag end
    if tag == self.recvTag then
        local index = 1
        local list = self.eventList
        if isOffline then list = self.offlineList end
        for index = 1, #list do
            if list[index] and list[index] == func then
                return
            end
        end
        list[index] = func
    end
end

function MsgReceiver:removeEventListener(func, tag, isOffline)
    if not tag then tag = self.recvTag end
    if tag == self.recvTag then
        local list = self.eventList
        if isOffline then list = self.offlineList end
        for index = 1, #list do
            if list[index] and list[index] == func then
                list[index] = nil
                return
            end
        end
    end
end

function MsgReceiver:removeAllListener(tag)
    if not tag then tag = self.recvTag end
    if tag == self.recvTag then
        self.eventList = {}
        self.offlineList = {}
    end
end

function MsgReceiver:doAction(data, tag, isOffline)

    if not tag then tag = self.recvTag end
    if tag == self.recvTag then
        print("do action tag = "..tag)
        local list = self.eventList
        if isOffline then list = self.offlineList end
        print_table(list)
        for index = 1, #list do
            if list[index] then
                list[index](data)
            end
        end
    end
end

return MsgReceiver