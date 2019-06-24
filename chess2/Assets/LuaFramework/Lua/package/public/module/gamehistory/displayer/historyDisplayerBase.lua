local Class = require("lib.middleclass")
---@class HistoryDisplayerBase
local HistoryDisplayerBase = Class('historyDisplayerBase')

local ModuleCache = ModuleCache
local GameObject = UnityEngine.GameObject
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local Vector3 = Vector3
local PlayModeUtil = ModuleCache.PlayModeUtil
local json = require "cjson"
local TableUtil = TableUtil


HistoryDisplayerBase.itemTemplateName = ""

function HistoryDisplayerBase:init(view)
    self.view = view
end

function HistoryDisplayerBase:get_history_item()
    if not self.itemCaches then
        self.itemCaches = {}
    end
    local historyItem = nil
    for i=1,#self.itemCaches do
        local itemCache = self.itemCaches[i]
        if not itemCache.gameObject.activeSelf then
            historyItem = itemCache
            break
        end
    end
    if not historyItem then
        historyItem = {}
        if not self.historyItemTemplate then
            self.historyItemTemplate = GetComponentWithPath(self.view.root,"Holder/"..self.itemTemplateName,ComponentTypeName.Transform).gameObject
        end
        local itemObj = ComponentUtil.InstantiateLocal(self.historyItemTemplate,self.view.historyItemGridParent)
        itemObj.transform.localScale = Vector3.one
        itemObj.transform.localPosition = Vector3.zero
        historyItem = self:init_history_item(itemObj)
        historyItem.displayer = self
        table.insert(self.itemCaches,historyItem)
    end
	historyItem.gameObject:SetActive(true)
    return historyItem
end

function HistoryDisplayerBase:init_history_item(gameObject)
    
end

function HistoryDisplayerBase:clear_history_item(historyItem)

end

function HistoryDisplayerBase:fill_history_item_info(historyItem,historyData,museumData,config)
    historyItem.historyData = historyData
end

return HistoryDisplayerBase                        