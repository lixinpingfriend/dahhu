
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MatchAwardsModule = class("Public.matchAwardsModule", ModuleBase)
local MatchingManager = require("package.public.matching_manager")
-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function MatchAwardsModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "matchawards_view", nil, ...)

    local onAppFocusCallback = function(eventHead, state)
        if self.view then
            self.view:hideBtn(true)
        end
    end

    self:subscibe_app_focus_event(onAppFocusCallback)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MatchAwardsModule:on_module_inited()

end

-- 绑定module层的交互事件
function MatchAwardsModule:on_module_event_bind()
end

-- 绑定loginModel层事件，模块内交互
function MatchAwardsModule:on_model_event_bind()


end
--data.matchId
--data.rank
--data.circle circle
function MatchAwardsModule:on_show(data)
    self.view:hide()
    MatchingManager:getmatchbyid(data.matchId, function(retData)
        local info = {
            time = "",
            name = retData.matchName,
            awardstr = ""
        }
        if retData.startTime and type(retData.startTime) == "string" then
            info.time = retData.startTime
        end
        local myAwards = {}
        for i = 1, #retData.awards do
            if tonumber(retData.awards[i].rank) == tonumber(data.rank) then
                --myAwards = retData.data.awards[i]
                table.insert(myAwards, retData.awards[i])
                info.awardstr = MatchingManager:goodsName(retData.awards[i].awardType, retData.awards[i].awardNum,
                        retData.awards[i].itemName, retData.awards[i].awardOther)
            end
        end
        info.award = myAwards
        info.rank = data.rank;
        if #info.award > 0 then
            -- 更新比赛结果弹窗视图
            self.view:updateResultTipsView(info);
        else
            --print_table(data,"==========")
            self.view:MatchFail(data)
        end
        self.view:show(true)
    end, function()
        --local info = {}
        --info.rank = data.rank
        --info.time = os.date("%Y/%m/%d", os.time())
        --info.name = ""
        --info.awardstr = ""
        --self.view:updateResultTipsView(info);
        self.view:MatchFail(data)
    end);


end

function MatchAwardsModule:on_click(obj, arg)
    print("点击", obj.name, obj.transform.parent.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "BtnReturn" then
        self:return_hall()
    elseif obj.name == "BtnClose" then
        --self.view:MatchFailClose(function()
        --    self:return_hall()
        --end)
        self:return_hall()
    elseif obj.name == "BtnShare" then
        self.view:hideBtn(false)
        ModuleCache.ShareManager().shareImage(true);
    end
end

function MatchAwardsModule:return_hall()
    ModuleCache.ModuleManager.hide_module("public", "matchawards")
    ModuleCache.ModuleManager.hide_module("public", "matchonlinerank")
    self:dispatch_package_event('Event_GoldMatching_Quit')
    self:dispatch_package_event("Event_GoldJump_error")
end

return MatchAwardsModule



