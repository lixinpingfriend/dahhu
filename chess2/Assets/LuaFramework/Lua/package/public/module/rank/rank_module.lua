
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
-- ========================== 默认依赖 =======================================
local RankModule = class("rankModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function RankModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "rank_view", "rank_model", ...)

end

function RankModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    -- 返回按钮
    if obj == self.view.buttonBack.gameObject or obj == self.view.buttonMask.gameObject then
        ModuleCache.DOTweenAnimationTool().DOPlayBackwards(self.view.friendRoot);
        local onComplete = function()
            ModuleCache.UnityEngine.Application.targetFrameRate = 30
            ModuleCache.ModuleManager.hide_module("public", "rank");
        end
        ModuleCache.DOTweenAnimationTool().AddOnRewindListener(self.view.friendRoot, onComplete);
    end
end

function RankModule:on_show(data)
    ModuleCache.UnityEngine.Application.targetFrameRate = 60
    self.view:hide();

    -- 请求获取好友排行协议
    self.model:getFriendRank();
end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function RankModule:on_model_event_bind()

    local onRankInit = function(eventHead, eventData)

        self.view:show();
        -- 初始化
        self.view:init(eventData, self);

        local coroutine = function()
            WaitForEndOfFrame();

            ModuleCache.DOTweenAnimationTool().DOPlayForwards(self.view.friendRoot);
        end
        self:start_unity_coroutine(coroutine);
    end
    -- 监听获取好友排行榜初始化事件
    self:subscibe_model_event("Event_HistoryList_GetRankInit", onRankInit);

end

return RankModule;
