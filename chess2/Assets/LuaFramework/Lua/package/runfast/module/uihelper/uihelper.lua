
local Class = require("lib.middleclass")
-- ==========================================================================
local UIHelper = Class('UIHelper')
local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
--local UIHelper = require("package/biji/module/uihelper/uihelper")


------用于列表实例化:itemPrefab模板,parent父节点,index下标,row一行的列数,offestX偏移X,offestY偏移Y
function UIHelper:Instantiate(itemPrefab,parent,index,row,offestX,offestY)
    ModuleCache.ComponentUtil.SafeSetActive(itemPrefab, false)
    if(row <= 0) then
        row = 1
    end
    index = index - 1 

    local newGo = ModuleCache.ComponentUtil.InstantiateLocal(itemPrefab, parent)
    newGo.name = "Prefab"..tostring(index + 1)

    local x
    if(row > 1) then
        x = (index % row) * offestX
    else 
        x = 0
    end

    local y = math.floor(index / row) * offestY
    newGo.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(x,y,0)
    ModuleCache.ComponentUtil.SafeSetActive(newGo, false)
    return newGo
end

------用于列表实例化:itemPrefab模板,parent父节点,index下标,row一行的列数,offestX偏移X,offestY偏移Y,slotTable把实例化的对象放到槽里面
function UIHelper:InstantiateSlotList(itemPrefab,parent,index,row,offestX,offestY,slotTable)
    ModuleCache.ComponentUtil.SafeSetActive(itemPrefab, false)
    if(row <= 0) then
        row = 1
    end

    index = index - 1 
    local newGo = ModuleCache.ComponentUtil.InstantiateLocal(itemPrefab, parent)
    newGo.name = "Prefab"..tostring(index + 1)

    local x
    if(row > 1) then
        x = (index % row) * offestX
    else 
        x = 0
    end
    local y = math.floor(index / row) * offestY
    newGo.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(x,y,0)
    ModuleCache.ComponentUtil.SafeSetActive(newGo, false)
    table.insert(slotTable,newGo)
end

------计算胜率,winCount赢的次数,lostCount输的次数,decimalPointCount保留几位小数点
function UIHelper:GetWinPercent(winCount,lostCount,decimalPointCount)
    if(winCount == nil) then
        winCount = 0
    end

    if(lostCount == nil) then
		lostCount = 0
	end

    local totalCount = winCount + lostCount
    if(totalCount == 0) then
        return "0%"
    end

    if(decimalPointCount == nil) then
        return tostring(math.floor(winCount/totalCount*100)).."%"
    end

    local str = "%0."..decimalPointCount.."f"
    return string.format(str,(winCount / totalCount) * 100).."%"
end

function UIHelper:GetWinPercent2(winCount,totalCount,decimalPointCount)
    if(winCount == nil) then
        winCount = 0
    end

    if(totalCount == nil or totalCount == 0) then
        return "0%"
    end

    if(decimalPointCount == nil) then
        return tostring(math.floor(winCount/totalCount*100)).."%"
    end

    local str = "%0."..decimalPointCount.."f"
    return string.format(str,(winCount / totalCount) * 100).."%"
end




return UIHelper