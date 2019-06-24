local ModuleBase = require("core.mvvm.module_base")
local SingResultBase = require("package.huzi.module.table.XXZP.XXZP_singleresult")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")
local SoundManager = require("package.huzi.module.tablebase.sound_manager")
local ModuleCache = ModuleCache

local SingleResultModule = Class("SingleResult", SingResultBase)
local coroutine = require("coroutine")


function SingleResultModule:getstrByWanFa()
	if TableManager:cur_game_is_gold_room_type() then
		return ""
	end
	local ruleInfo = TableUtilPaoHuZi.convert_rule(self.curTableData.Rule)
	local str = "15胡起胡,满" .. ruleInfo.roundCount .. "胡息结算   "

	if ruleInfo.FengDing then
		str = str .. " 封顶" .. ruleInfo.FengDing .. "胡息   "
	end

	if ruleInfo.DaTuo == 0 then
		str = str .. "不打坨   "
	elseif ruleInfo.DaTuo == 1 then
		str = str .. "打坨   "
	end

	if ruleInfo.JiePaoFengDing == 0 and AppData.Game_Name == "LDZP" then
		str = str .. "接炮不封顶   "
	elseif ruleInfo.JiePaoFengDing == 100 and AppData.Game_Name == "LDZP" then
		str = str .. "接炮100封顶   "
	end

	if ruleInfo.DiFen then
		str = str .. "底分" .. ruleInfo.DiFen / 1000 .. "   "
	end

	if ruleInfo.SeatRule == 1 then
		str = str .. "不换位   "
	elseif ruleInfo.SeatRule == 2 then
		str = str .. "每局换位   "
	end

	if ruleInfo.PayType ~= nil then
		if ruleInfo.PayType == 0 then
			str = str .. "房主支付 "
		end

		if ruleInfo.PayType == 1 then
			str = str .. "AA支付 "
		end

		if ruleInfo.PayType == 2 then
			str = str .. "大赢家支付 "
		end
	end

	return str
end



return SingleResultModule
