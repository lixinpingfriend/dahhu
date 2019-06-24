local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableYingKouMaJiangView_3d:Table3dCommonView
local TableYingKouMaJiangView_3d = class('tableYingKouMaJiangView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local selectCardXOffset = 80
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
local Vector3 = Vector3
local Color = Color

--- 初始化ui
function TableYingKouMaJiangView_3d:init_ui()
    Base.init_ui(self)
    self.actionLiang = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_Liang", ComponentTypeName.Transform).gameObject
end

--- 显示亮
function TableYingKouMaJiangView_3d:show_liang(show)
    self.actionLiang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 开始刷新gameState
function TableYingKouMaJiangView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    local showLiang = false
    for i=1,#gameState.ExtraDatas do
        local extraData = gameState.ExtraDatas[i]
        if 2 == extraData.ExtraID or 3 == extraData.ExtraID then
            showLiang = true
            break
        end
    end
    self:show_liang(showLiang)
end

function TableYingKouMaJiangView_3d:process_round_info_display(gameState)
    if not gameState then
        self.jushu.text = ""
        return  
    end
    local totalRoundCount = self.curTableData.RoundCount
        or self.curTableData.ruleJsonInfo.roundCount or self.curTableData.videoData.roundcount
    local roundCountText = "第"..tostring(gameState.QuanData.currentQuan).."/"..totalRoundCount.."圈"
    self.jushu.text = roundCountText    
    return true
end

function TableYingKouMaJiangView_3d:update_seat_pointer()
    local masterLocalSeat = 0
    if self.gameState then
        for i=1,#self.gameState.ExtraDatas do
            local extraData = self.gameState.ExtraDatas[i]
            if 1 == extraData.ExtraID then
                    masterLocalSeat = self:server_to_local_seat(extraData.Data[1])
                break
            end
        end
    end
    self.Mj3dCenterCom:initWindTag(masterLocalSeat)
end

function TableYingKouMaJiangView_3d:show_liang_grid(liangTypeTable)
    local selectCardPanel = self.selectCardPanel
    local xAddOffset = 0
    for i=1,#liangTypeTable do
        local liangType = liangTypeTable[i]
        if 1 == liangType then
            local target = TableUtil.poor("3_SelectCard", selectCardPanel,Vector3.New(-188,0, 0),self.poorObjs,self.clones)
            local childs = TableUtil.get_all_child(target)
            local paiTable = {32,33,34}
            for k=1,#childs do
                local pai = paiTable[k]
                ---@type Mj2D
                local mj = Mj2D:new(pai, nil, {gameObject = childs[k], spriteHolder = self.frontSpriteH})
                mj:set_color(Color.white)
                mj:set_skin(self.mjColorSet, self.mjScaleSet)
                MjManager.insert(mj, MjManager.mjType.custom)
            end
            target.name = "Liang_ZFB"
            xAddOffset = xAddOffset - selectCardXOffset * 1 - 20
        elseif 2 == liangType then
            local target = TableUtil.poor("4_SelectCard", selectCardPanel, Vector3.New(-496,0, 0),self.poorObjs,self.clones)
            local childs = TableUtil.get_all_child(target)
            local paiTable = {28,29,30,31}
            for k=1,#childs do
                local pai = paiTable[k]
                ---@type Mj2D
                local mj = Mj2D:new(pai, nil, {gameObject = childs[k], spriteHolder = self.frontSpriteH})
                mj:set_color(Color.white)
                mj:set_skin(self.mjColorSet, self.mjScaleSet)
                MjManager.insert(mj, MjManager.mjType.custom)
            end
            target.name = "Liang_DNXB"
            xAddOffset = xAddOffset - selectCardXOffset * 1 - 20
        end
    end
    selectCardPanel:SetActive(true)
end

--- 是否是癞子
function TableYingKouMaJiangView_3d:is_laizi(pai)
    local isLaiZi = false
    if pai == 0 then
        return isLaiZi
    end
    if self.gameState.LaiZi == pai then
        isLaiZi = true
    end
    for i=1,#self.gameState.LaiZis do
        local laiZi = self.gameState.LaiZis[i]
        if laiZi == pai then
            isLaiZi = true
        end
    end
    return isLaiZi
end

---癞子
function TableYingKouMaJiangView_3d:game_state_lai_zi(show)

    local isBaHun = self.ruleJsonInfo.HunType == 2

    self.laiZiMJ:SetActive(show)
    if isBaHun then
        self.WeiZhang:SetActive(show)
    else
        self.WeiZhang:SetActive(false)
    end
    if(not show) then
        return
    end

    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.LaiZis[1], nil, {gameObject = self.laiZiMJ, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.laiZiText.text = self.ConfigData.laiziTagTitle or "宝牌"

    if isBaHun then
        ---@type Mj2D
        local mj2 = Mj2D:new(self.gameState.LaiZis[2], nil, {gameObject = self.WeiZhang, spriteHolder = self.frontSpriteH})
        mj2:set_skin(self.mjColorSet, self.mjScaleSet)
        MjManager.insert(mj2, MjManager.mjType.custom)
        self.weiZhangText.text = self.ConfigData.laiziTagTitle or "宝牌"    
    end

    self.baoPai:SetActive(true)
end

function TableYingKouMaJiangView_3d:game_state_wei_zhang(show)

end

return TableYingKouMaJiangView_3d