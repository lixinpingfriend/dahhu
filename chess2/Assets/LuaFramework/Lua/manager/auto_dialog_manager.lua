local Queue = require("lib.Queue");

local AutoDialogManager = { };

local dialogQueue = Queue:new();
local Vector3 = Vector3


local MatchingManager = require("package.public.matching_manager")

function AutoDialogManager.ResetQueue()
    ----- 七日奖励
    --dialogQueue:enqueue("sevenDayAward");
    ---- 转盘
    --dialogQueue:enqueue("turnTable");

    dialogQueue:clear();

    -- 广告
    dialogQueue:enqueue("curgamead");
    -- 限时免费
    dialogQueue:enqueue("curgamefree");
    -- 活动
    dialogQueue:enqueue("activity");
end

-- 打开优先级高的弹框(四处需要添加此方法:1.协议超时.2.返回协议没数据.3关闭界面.4.没有达到自动弹框条件(七日奖励:没有可领取奖励 转盘:没有免费转盘 活动:没有红点))
function AutoDialogManager.openPriorityDialog()
    local selfs = AutoDialogManager
    if not selfs.FirstLoad then
        selfs.FirstLoad = true
        selfs.tf = {}
        local t = dialogQueue:getQueueTable()
        for k,v in pairs(t) do
            local module = ModuleCache.ModuleManager.show_public_module(v, "Auto");
            selfs.tf[v] = v  --必须要存名字，不能直接缓存模块，如果缓存了模块

            -- 这里不能用 show 或者 hide.  因为 show或者hide 再模块里自己会用到
            module:get_view().root.transform.localPosition = Vector3.New(0, 10000, 0)
        end
    end

    local moduleName = dialogQueue:dequeue();
    print("打开模块",moduleName)

    if moduleName then
        local module = ModuleCache.ModuleManager.get_module("public", moduleName)
        if module then
            module:get_view().root.transform.localPosition = Vector3.New(0, 0, 0)
        end
        selfs.tf[moduleName] = nil
    end
    --local len = dialogQueue:getSize()
    --if len == 0 then
    --    MatchingManager:jump_jiujijin()
    --end
end

function AutoDialogManager.getPrioritySize()
    return  dialogQueue:getSize()
end

return AutoDialogManager;