
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
---@class TablePopQingYangView
local TablePopQingYangView = Class('tablePopQingYangView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function TablePopQingYangView:initialize(...)
    -- 初始View
    View.initialize(self, "majiang/module/tablepopqingyang/henanmj_tablepopqingyang.prefab", "HeNanMJ_TablePopQingYang", 1)

    self.paoPanel = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Pao", ComponentTypeName.Transform).gameObject
    self.xiaPanel = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Xia", ComponentTypeName.Transform).gameObject


    self.pao0Btn = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Pao/0", ComponentTypeName.Transform).gameObject
    self.pao1Btn = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Pao/1", ComponentTypeName.Transform).gameObject
    self.pao1BtnText = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Pao/1/Text", ComponentTypeName.Text)
    self.pao2Btn = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Pao/2", ComponentTypeName.Transform).gameObject

    self.xia0Btn = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Xia/0", ComponentTypeName.Transform).gameObject
    self.xia1Btn = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Xia/1", ComponentTypeName.Transform).gameObject
    self.xia2Btn = GetComponentWithPath(self.root, "Bottom/Child/QingYang/Xia/2", ComponentTypeName.Transform).gameObject
end

function TablePopQingYangView:get_send_data()

end

return TablePopQingYangView