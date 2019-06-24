
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MatchRankModule = class("Public.MatchRankModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function MatchRankModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "matchrank_view", "matchrank_model", ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MatchRankModule:on_module_inited()

end

-- 绑定module层的交互事件
function MatchRankModule:on_module_event_bind()
    self:subscibe_package_event('Event_GoldMatching_Quit', function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_module("public", "matchrank")
    end)
    self:subscibe_package_event('Event_GoldJump_error', function(eventHead, eventData)
        ModuleCache.ModuleManager.hide_module("public", "matchrank")
    end)
end

-- 绑定loginModel层事件，模块内交互
function MatchRankModule:on_model_event_bind()


end

function MatchRankModule:on_show(data)
    self:getmatchbyid(data)
end

function MatchRankModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnClose" then
        ModuleCache.ModuleManager.hide_module("public", "matchrank")
        return

    end
end

function MatchRankModule:getmatchbyid(id)
    local addStr = "match/getById?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            matchId = id
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.view:initRank( retData.data)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end )
end

return MatchRankModule



