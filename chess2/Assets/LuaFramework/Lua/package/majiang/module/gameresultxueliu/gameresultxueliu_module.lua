local class = require("lib.middleclass")
---@type GameResultModuleBase
local Base = require('package.majiang.module.gameresultbase.gameresultbase_module')
---@class GameResultXueLiuModule:GameResultModuleBase
local GameResultXueLiuModule = class('gameResultXueLiuModule', Base)

function GameResultXueLiuModule:initialize(...)
    Base.initialize(self,"gameresultxueliu_view",nil,...)
end

function GameResultXueLiuModule:on_close()
    
end

return GameResultXueLiuModule