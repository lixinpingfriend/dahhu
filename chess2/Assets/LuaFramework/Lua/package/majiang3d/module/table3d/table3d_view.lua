



local class = require("lib.middleclass")
local ViewBaseBase = require('package.majiang.module.tablebase.tablebase_view')
local ViewBase = require('package.majiang.module.tablenew.table_view') ---继承于2D麻将桌面
--- @class Table3dView:TableMJView
local Table3dView = class('table3dView', ViewBase)
local TableManager = TableManager
local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName

function Table3dView:on_initialize(prefabPath, prefabName, layer)
    self.is3DTable = true
    ViewBaseBase.initialize(self, "majiang3d/module/table3d/mj_table3d.prefab", "MJ_Table3D", layer, true)
end

function Table3dView:init_ui()
    ViewBase.init_ui(self)
end

function Table3dView:get_selected_3d_layout_sprite()
    if not self.select3dLayoutDisPic then
        local parent = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform).gameObject
        local s1 = "majiang/module/table/3dlayoutselectpic.prefab"
        local s2 = "3dLayoutSelectPic"
        self.select3dLayoutDisPic = ModuleCache.ViewUtil.InitGameObject(s1, s2,parent)
        self.selected3dLayout1Sprite = GetComponentWithPath(self.select3dLayoutDisPic, "1", ComponentTypeName.Image).sprite
        self.selected3dLayout2Sprite = GetComponentWithPath(self.select3dLayoutDisPic, "2", ComponentTypeName.Image).sprite
    end
    return self.selected3dLayout1Sprite,self.selected3dLayout2Sprite
end

function Table3dView:get_table_3d_style_sprite()
    if not self.table3dStyleDisPic then
        local parent = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform).gameObject
        local s1 = "majiang/module/table/3dstyleselectpic.prefab"
        local s2 = "3dStyleSelectPic"
        self.table3dStyleDisPic = ModuleCache.ViewUtil.InitGameObject(s1, s2,parent)
        self.table3dStyleDisSprite1 = GetComponentWithPath(self.table3dStyleDisPic, "1", ComponentTypeName.Image).sprite
        self.table3dStyleDisSprite2 = GetComponentWithPath(self.table3dStyleDisPic, "2", ComponentTypeName.Image).sprite
    end
    return self.table3dStyleDisSprite1,self.table3dStyleDisSprite2
end

function Table3dView:init_play_mode()
    if(TableManager:cur_game_is_gold_room_type()) then
        self.roomType = require('package.majiang3d.module.table3d.roomtype.table3d_type_gold'):new(self)
        ---模式 正常 回放
        if(not self.curTableData.isPlayBack) then
            ---@type TableCustom
            self.playType = require('package.majiang.module.tablenew.playtype.table_custom'):new(self)
        else
            self.playType = require('package.majiang.module.tablenew.playtype.table_playback'):new(self)
        end
    else
        ViewBase.init_play_mode(self)
    end
end

--- 牌局中报听处理
function Table3dView:mid_ting_handle(isGray)
    if(not self.isMidTing and not isGray) then
        return
    end
    ---@type SeatHolder3D
    local seatHolder = self.seatHolderArray[1]
    local handMj = seatHolder.mj3dHodler.HandMj
    for i = 1, #handMj do
        ---@type Mj3d
        local mj3d = handMj[i]
        local pai = mj3d:Pai()
        local gray = isGray and not self:show_mid_ting_pai(pai)
        if gray then
            mj3d:setColliderState(false)
            mj3d:setMj3dDefState(mj3d.mj3dState.gray)
            mj3d:setMj3dState(mj3d.mj3dState.gray)
        else
            mj3d:setColliderState(not mj3d.shouZhangData.Gray)
            mj3d:setMj3dDefState(mj3d.shouZhangData.Gray and mj3d.mj3dState.gray or mj3d.mj3dState.normal)
            mj3d:resetDefState()
        end
    end
    self.isMidTing = isGray
end

---屏蔽2D麻将得打色逻辑
function Table3dView:play_dice(endCall,dice1,dice2)
    if(endCall) then
        endCall()
    end
end

return Table3dView
