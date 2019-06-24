
local NetErrorConfig = {}

NetErrorConfig[-103] = {"已在其他房间", true}
NetErrorConfig[-104] = {"房间不存在", true}
NetErrorConfig[-105] = {"房间已解散", true}
NetErrorConfig[-106] = {"已加入了其他房间", true}
NetErrorConfig[-107] = {"没有回放数据", true}
NetErrorConfig[-108] = {"玩家id不对", false}
NetErrorConfig[-109] = {"房卡不够", true}
NetErrorConfig[-110] = {"玩家id不正确", true}
NetErrorConfig[-111] = {"房间id不正确", true}
NetErrorConfig[-112] = {"消息id错误", true}
NetErrorConfig[-1] = {"", false}

return NetErrorConfig
