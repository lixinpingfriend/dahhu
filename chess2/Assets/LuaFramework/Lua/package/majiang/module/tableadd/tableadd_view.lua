
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableAddView = Class('tableaddView', View)

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponent = ModuleCache.ComponentManager.GetComponent
local GameSDKInterface = ModuleCache.GameSDKInterface
local curTableData

function TableAddView:initialize(...)
    curTableData = TableManager.curTableData
    self.mySeat = curTableData.SeatID

    View.initialize(self, "majiang/module/tableadd/henanmj_tableadd.prefab", "HeNanMJ_TableAdd", 0)

    self.Top = GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform).gameObject
    self.Left = GetComponentWithPath(self.root, "Left", ComponentTypeName.Transform).gameObject
    self.Right = GetComponentWithPath(self.root, "Right", ComponentTypeName.Transform).gameObject
    self.Bottom = GetComponentWithPath(self.root, "Bottom", ComponentTypeName.Transform).gameObject

    --阜南麻將 定缺
    -- self.DQBg = {}
    -- self.DQBg[1] = GetComponentWithPath(self.Top, "Child/DingQueBg", ComponentTypeName.Transform).gameObject
    -- self.DQBg[2] = GetComponentWithPath(self.Left, "Child/DingQueBg", ComponentTypeName.Transform).gameObject
    -- self.DQBg[3] = GetComponentWithPath(self.Right, "Child/DingQueBg", ComponentTypeName.Transform).gameObject

    self.DQTopBg = GetComponentWithPath(self.Top, "Child/DingQueBg", ComponentTypeName.Transform).gameObject
    self.DQ = GetComponentWithPath(self.Bottom, "Child/DingQue", ComponentTypeName.Transform).gameObject
    self.DQTips = GetComponentWithPath(self.DQ, "Tips", ComponentTypeName.Transform).gameObject
    self.DQGridGroup = GetComponentWithPath(self.DQ, "GridGroup", ComponentTypeName.Transform).gameObject
    self.DQWanBtn = GetComponentWithPath(self.DQGridGroup, "Button_Wan", ComponentTypeName.Button)
    self.DQWanBtnTX = GetComponentWithPath(self.DQGridGroup, "Button_Wan/WanTX", ComponentTypeName.Transform).gameObject
    self.DQTiaoBtn = GetComponentWithPath(self.DQGridGroup, "Button_Tiao", ComponentTypeName.Button)
    self.DQTiaoBtnTX = GetComponentWithPath(self.DQGridGroup, "Button_Tiao/TiaoTX", ComponentTypeName.Transform).gameObject
    self.DQTongBtn = GetComponentWithPath(self.DQGridGroup, "Button_Tong", ComponentTypeName.Button)
    self.DQTongBtnTX = GetComponentWithPath(self.DQGridGroup, "Button_Tong/TongTX", ComponentTypeName.Transform).gameObject
end

--显示报缺界面
function TableAddView:ShowBaoQueView()
    print("curTableData.totalSeat is "..curTableData.totalSeat)
    if curTableData.totalSeat == 3 then
        ComponentUtil.SafeSetActive(self.DQTopBg, false)
    end
    -- 判断自己有没有报缺
    if curTableData.gameState.ShiFouBaoQue then
        local type = self:CountMJ(curTableData.gameState.Player)
        if (type == 1) then
            ComponentUtil.SafeSetActive(self.DQTiaoBtnTX, true) -- 条特效
        elseif (type == 2) then
            ComponentUtil.SafeSetActive(self.DQWanBtnTX, true) -- 万特效
        else
            ComponentUtil.SafeSetActive(self.DQTongBtnTX, true) -- 筒特效
        end
    else
        ComponentUtil.SafeSetActive(self.DQ, false)
    end
end

--统计手里万条筒的数量
function TableAddView:CountMJ(playData)
    local pai = {}
    pai.tiao = 0    --条
    pai.wan = 0     --万
    pai.tong = 0    --筒
    pai.type = 0    --类型 1，条 2，万 3，筒
    pai.min = 0     --最多的个数

    local shouzhang = playData[self.mySeat+1].ShouZhang
    print_table(shouzhang)

    for i=1, #shouzhang do
        if (1 <= shouzhang[i].Pai and shouzhang[i].Pai <= 9) then
            pai.tiao = pai.tiao + 1
        elseif (10 <= shouzhang[i].Pai and shouzhang[i].Pai <= 18) then
            pai.wan = pai.wan + 1
        elseif  (19 <= shouzhang[i].Pai and shouzhang[i].Pai <= 27) then
            pai.tong = pai.tong + 1
        end
    end

    if (pai.tiao > pai.wan) then
        pai.min = pai.wan
    else 
        pai.min = pai.tiao
    end
    if (pai.min > pai.tong) then
        pai.min = pai.tong
    end

    if (pai.min == pai.tiao) then
        pai.type = 1
    elseif (pai.min == pai.wan) then
        pai.type = 2
    elseif (pai.min == pai.tong) then
        pai.type = 3
    end

    return pai.type
end

--隐藏报缺界面
function TableAddView:HideBaoQueView()
    ComponentUtil.SafeSetActive(self.DQ, true)

    ComponentUtil.SafeSetActive(self.DQTiaoBtnTX, false)
    ComponentUtil.SafeSetActive(self.DQWanBtnTX, false)
    ComponentUtil.SafeSetActive(self.DQTongBtnTX, false)
end

return TableAddView




