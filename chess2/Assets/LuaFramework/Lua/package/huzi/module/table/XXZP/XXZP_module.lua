local class = require("lib.middleclass")
local packageHead = "package.huzi.module."
local ModuleBase = require(packageHead .. "tablebase.tablebase_module")
local TableModule = class("huzi.TableModule", ModuleBase)

TableModule.SortCardHelperPath = "package.huzi.module.table.XXZP.XXZP_SortCardHelper"

function TableModule:initialize(...)
    local viewPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_view"
    local modelPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_model"
    ModuleBase.initialize(self, viewPath, modelPath, ...)
end

function TableModule:reset(data)
	ModuleBase.reset(self,data)
	self.bNotDangDiShouHui = false
end

function TableModule:ChangeRuleName(str)
	local ruleInfo = ModuleCache.Json.decode(TableManager.phzTableData.Rule)
	local curTableData = self.view.TableData
	str = self:GetPayStr() .. str
	str = string.gsub(str, "0胡息 ", "0胡息封顶 ")
	local strDiFen = ""
	if ruleInfo.DiFen == 100 then
		str = string.gsub(str, "0.1 ", "")
		strDiFen = "底芬0.1 "
	elseif ruleInfo.DiFen == 200 then
		str = string.gsub(str, "0.2 ", "")
		strDiFen = "底芬0.2 "
	elseif ruleInfo.DiFen == 300 then
		str = string.gsub(str, "0.3 ", "")
		strDiFen = "底芬0.3 "
	elseif ruleInfo.DiFen == 500 then
		str = string.gsub(str, "0.5 ", "")
		strDiFen = "底芬0.5 "
	elseif ruleInfo.DiFen == 1000 then
		str = string.gsub(str, "0.1 ", "")	--另一个BUG导致的
		strDiFen = "底芬1 "
	end
	
	str = string.gsub(str, "不打坨 ", "")
	str = string.gsub(str, "坨对坨3番 ", "")
	str = string.gsub(str, "坨对坨4番 ", "")
	if ruleInfo.DaTuo == 0 then
		strDiFen = strDiFen .. "不打坨 "
	else
		if ruleInfo.DaTuoSanFan then
			strDiFen = strDiFen .. "坨对坨3番 "
		else
			strDiFen = strDiFen .. "坨对坨4番 "
		end
	end
	
	strDiFen = strDiFen ..  "15胡起胡," .. curTableData.RoundCount .. "胡息结算 "
	
	str = string.gsub(str, "支付 ", "支付 " .. strDiFen)

	return str
end

return TableModule
