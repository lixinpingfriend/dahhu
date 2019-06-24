
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableMatchView = Class('tableMatchView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local curTableData

function TableMatchView:initialize(...)
    curTableData = TableManager.curTableData
    -- 初始View
    View.initialize(self, "majiang/module/tablematch/henanmj_table_match.prefab", "HeNanMJ_Table_Match", 1)

    self.tuoGuanBar = GetComponentWithPath(self.root, "Bottom/Child/tuoGuan Bar", ComponentTypeName.Transform).gameObject
    self.cancelBtnImg = GetComponentWithPath(self.root, "Bottom/Child/tuoGuan Bar/cancelTuoGuanBtn", ComponentTypeName.Image)
    self.cancelBtnImg2 = GetComponentWithPath(self.root, "Bottom/Child/tuoGuan Bar/cancelTuoGuanBtn/Image", ComponentTypeName.Image)

    self.matePlayerObj = GetComponentWithPath(self.root, "Center/MatePlayerTex", ComponentTypeName.Transform).gameObject

    self.cancelBtn = GetComponentWithPath(self.root, "Bottom/Child/tuoGuan Bar/cancelTuoGuanBtn", ComponentTypeName.Button)
    self.fullCancelBtn = GetComponentWithPath(self.root, "Bottom/Child/tuoGuan Bar/FullCancelBtn", ComponentTypeName.Button)

    self.graymaterial = self.cancelBtnImg.material
    self.cancelBtnImg.material = nil
    self.cancelBtnImg2.material = nil

     
    self:DepositState(0)
end

-- state 牌局托管状态 (0:未托管 1:正在托管但可取消 2:正在托管且不能取消)
function TableMatchView:DepositState(state)
    self.tuoGuanBar:SetActive( state ~= 0)
    self.cancelBtn.interactable = state ~= 2
    self.fullCancelBtn.interactable = state ~= 2

    if state == 0 then
        
    elseif state == 1 then
        self.cancelBtnImg.material = nil
        self.cancelBtnImg2.material = nil
    else
        self.cancelBtnImg.material = self.graymaterial
        self.cancelBtnImg2.material = self.graymaterial
    end

end

return TableMatchView