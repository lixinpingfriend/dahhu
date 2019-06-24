




local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class ReliefView : View
local ReliefView = Class('reliefView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

function ReliefView:initialize(...)
    -- 初始View 
    View.initialize(self, "public/module/relief/public_windowrelief.prefab", "Public_WindowRelief", 1,nil,1)
    self:set_1080p()
    ---@type UnityEngine.UI.Text
    self.reliefNum = GetComponentWithPath(self.root, "Center/Left/Item/Text", ComponentTypeName.Text)
    ---@type UnityEngine.UI.Text
    self.reliefTip = GetComponentWithPath(self.root, "Center/Left/Info", ComponentTypeName.Text)
    ---@type UnityEngine.UI.Text
    self.reliefLeftTime = GetComponentWithPath(self.root, "Center/Left/lefttime", ComponentTypeName.Text)
    ---@type UnityEngine.UI.Button
    self.btnGet = GetComponentWithPath(self.root, "Center/Left/BtnGet", ComponentTypeName.Button)
    ---@type UnityEngine.UI.Text
    self.buyNumL = GetComponentWithPath(self.root, "Center/Right/Item1/Text", ComponentTypeName.Text)
    ---@type UnityEngine.UI.Text
    self.buyNumR = GetComponentWithPath(self.root, "Center/Right/Item2/Text", ComponentTypeName.Text)
    ---@type UnityEngine.UI.Text
    self.buyTip1 = GetComponentWithPath(self.root, "Center/Right/Info", ComponentTypeName.Text)
    self.buyTip2 = GetComponentWithPath(self.root, "Center/Right/Info2", ComponentTypeName.Text)
    self.buyTip3 = GetComponentWithPath(self.root, "Center/Right/Info3", ComponentTypeName.Text)
    ---@type UnityEngine.UI.Text
    self.buyLeftTime = GetComponentWithPath(self.root, "Center/Right/lefttime", ComponentTypeName.Text)
    ---@type UnityEngine.UI.Button
    self.btnBuy = GetComponentWithPath(self.root, "Center/Right/BtnBuy", ComponentTypeName.Button)
end

---@param data BankruptcyInfo
function ReliefView:setDaylyRelief(data)
    if data then
        local leftTime = data.receiveCount - data.receiveNum
        self.reliefNum.text = "x" .. data.amount
        self.reliefTip.text = "金币<" .. data.conditionAmount .. "可领取"
        self.reliefLeftTime.text = "今日剩余次数 " .. leftTime .. " 次"
        self.btnGet.interactable = leftTime > 0
    end
end

---@param data ShopProducts
function ReliefView:setDaylyBuy(data)
    if data then
        self.buyNumL.text = "x" .. data.num
        self.buyNumR.text = "x" .. data.giveNum
        self.buyTip1.text = "比商城优惠\n<color=ffffff><size=84>" .. data.saleTag .. "</size><size=68>折</size></color>"
        self.buyTip2.text = "<size=92>" .. tonumber(data.salePrice) .. "</size>元"
        self.buyTip3.text = (data.num + data.giveNum) .. "\n金币"
        --"比商城优惠<size=48>"..data.saleTag.."</size>折 共计"..(data.num + data.giveNum).."金币仅需"..data.salePrice.."元"
        self.buyLeftTime.text = "今日剩余次数 " .. data.remainderNum .. " 次"
        self.btnBuy.interactable = data.remainderNum > 0
    end
end

---@param lable UnityEngine.UI.Text
function ReliefView:setLeftCount(lable, count)
    lable.text = "今日剩余次数 " .. count " 次"
end

return ReliefView