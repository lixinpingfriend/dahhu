
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local LuckyBoxView = Class('luckyBoxView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ModuleEventBase = require('core.mvvm.module_event_base')
local CSmartTimer = ModuleCache.SmartTimer.instance

function LuckyBoxView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/luckybox/public_windowluckybox.prefab", "Public_WindowLuckyBox", 1, nil, 2)
    View.set_1080p(self)
    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    self.uiState = GetComponentWithPath(self.root, "Center", "UIStateSwitcher")
    self.openTrans = GetComponentWithPath(self.root, "Center/Open", ComponentTypeName.Transform)
    self.descText = GetComponentWithPath(self.root, "Center/Open/Backgroud/Award/Desc", ComponentTypeName.Text)
    self.numText = GetComponentWithPath(self.root, "Center/Close/Image/Image/Num", ComponentTypeName.Text)
    self.numText1 = GetComponentWithPath(self.root, "Center/Open/Backgroud/Award/Item/Num", ComponentTypeName.Text)
    self.nowSaleText = GetComponentWithPath(self.root, "Center/Open/Backgroud/Price/2/Text", ComponentTypeName.Text)
    self.preSaleText = GetComponentWithPath(self.root, "Center/Open/Backgroud/Price/1/Text", ComponentTypeName.Text)
    self.timeText = GetComponentWithPath(self.root, "Center/Open/Backgroud/Time/Text", ComponentTypeName.Text)
    self.centerCavans = GetComponentWithPath(self.root, "Center/Close/Image/Image", "UnityEngine.Canvas")
    self.centerCavans2 = GetComponentWithPath(self.root, "Center/Open/Backgroud", "UnityEngine.Canvas")
    self.centerCavans.sortingOrder = self.canvas.sortingOrder + 12
    self.centerCavans2.sortingOrder = self.canvas.sortingOrder + 12
end

function LuckyBoxView:boxOpenView(data)
    local num = data.productGiveNum + data.productNum
    self.descText.text = "恭喜抽中<size=68>" .. num .. "</size>金币"
    self.numText1.text = num .. ""
    self.nowSaleText.text = "现价" .. data.productSalePriceStr .. "元"
    self.preSaleText.text = "原价" .. data.productPriceStr .. "元"
    self:daojishi(data.exprice)
end

function LuckyBoxView:boxCloseView(data)
    self.numText.text = data.remainderCount
end

function LuckyBoxView:daojishi(surTime)
    local th = math.floor(surTime / 3600)
    local tm = math.floor((surTime - th * 3600) / 60)
    local ts = math.ceil(surTime % 60)
    self.timeText.text = self:numStr(th) .. ":" .. self:numStr(tm) .. ":" .. self:numStr(ts)
    --self.houerText.text = th
    --self.minuteText.text = tm
    --self.secondText.text = ts
    print("倒计时时间：", surTime)
    if surTime > 0 then
        if self.tid then
            CSmartTimer:Kill(self.tid)
        end
        self.tid = self:subscibe_time_event(surTime, false, 1):SetIntervalTime(1,
                function(t)
                    local h = math.floor(t.surplusTime / 3600)
                    local m = math.floor((t.surplusTime - h * 3600) / 60)
                    local s = math.ceil(t.surplusTime % 60)
                    --self.houerText.text = h
                    --self.minuteText.text = m
                    --self.secondText.text = s
                    self.timeText.text = self:numStr(h) .. ":" .. self:numStr(m) .. ":" .. self:numStr(s)
                end
        )                         :OnComplete(function(t)
            self.timeText.text = "00:00:00"
        end).id
    end
end

function LuckyBoxView:boxOpen(open, anim)
    if open then
        self.uiState:SwitchState("open")
        --if anim then
        --    self:do_scale(self.openTrans, nil, 1)
        --end
    else
        self.uiState:SwitchState("close")
    end

end

function LuckyBoxView:numStr(num)
    if num == 0 then
        return "00"
    elseif num < 10 then
        return "0" .. num
    else
        return num
    end
end

return LuckyBoxView