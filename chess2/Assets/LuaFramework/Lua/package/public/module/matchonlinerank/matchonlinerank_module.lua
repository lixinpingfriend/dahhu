
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MatchOnlineRankModule = class("Public.MatchOnlineRankModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function MatchOnlineRankModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "matchonlinerank_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MatchOnlineRankModule:on_module_inited()

end

-- 绑定module层的交互事件
function MatchOnlineRankModule:on_module_event_bind()
end

-- 绑定loginModel层事件，模块内交互
function MatchOnlineRankModule:on_model_event_bind()


end

function MatchOnlineRankModule:on_show(data)
    self.view:initRank(data, self.modelData.roleData.userID)
    local mineInfo
    for i = 1, #data do
        local id = data[i].playerId or data[i].UserID
        if tonumber(id) == tonumber(self.modelData.roleData.userID) then
            print("我的排名")
            mineInfo = data[i]
        end
    end
    print_table(mineInfo,"我的排名数据")
    self.view:initMine(mineInfo)
end

function MatchOnlineRankModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "SpriteMask" or obj.name == "SpriteBg1" then
        --ModuleCache.ModuleManager.hide_module("public", "matchrank")
        --return
        self.view:moveRank(false)
    end
end

return MatchOnlineRankModule



