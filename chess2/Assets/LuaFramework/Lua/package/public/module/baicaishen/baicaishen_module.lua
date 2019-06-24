




local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local BaiCaiShenModule = class("baicaishenModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function BaiCaiShenModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "baicaishen_view", "baicaishen_model", ...)

end

function BaiCaiShenModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

end

---示例，召唤财神正确姿势
--[[
		local playerid = TableManager.curTableData.modelData.roleData.userID
		ModuleCache.ModuleManager.show_module("public", "baicaishen",playerid)
--]]

function BaiCaiShenModule:on_show(playerid)

    if self.lastTime and UnityEngine.Time.time - self.lastTime <= 5 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("财神太忙，请稍后再拜！")
        return
    end
    self.lastTime = UnityEngine.Time.time

    self.model:getActive(playerid,function (err,AppActivity)
        if err then
            print("获取拜财神活动异常："..err)
            return
        end
        print("获取拜财神活动返回")
        print_table(AppActivity)
        local activityId = 0
        for i=1,#AppActivity do
            local Activity = AppActivity[i]
            if Activity and  Activity.activityId then
                activityId = Activity.activityId
                break
            end
        end
        self.model:getAwards(playerid,activityId,function (err,AppAwards)
            if err then
                print("获取拜财神奖励异常："..err)
                return
            end
            print("获取拜财神奖励返回")
            print_table(AppAwards)
            for i=1,#AppAwards do
                local award = AppAwards[i]
                if award and award.effect then
                    self.view:ShowEffect(award.effect)
                    if award.amount and award.amount > 0 then
                        local text = "获得"..award.amount.."钻石奖励"
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(text)
                    end
                    break
                end
            end
        end)
    end)

end

function BaiCaiShenModule:on_hide(data)

end

-- 绑定model层事件，模块内交互    model层初始化结束后自动调用
function BaiCaiShenModule:on_model_event_bind()


end

return BaiCaiShenModule