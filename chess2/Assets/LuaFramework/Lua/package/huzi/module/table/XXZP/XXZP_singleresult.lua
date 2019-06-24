local ModuleBase = require("core.mvvm.module_base")
local SingResultBase = require("package.huzi.module.singleresult.singleresultBase_module")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")
local SoundManager = require("package.huzi.module.tablebase.sound_manager")
local ModuleCache = ModuleCache

local SingleResultModule = Class("SingleResult", SingResultBase)
local coroutine = require("coroutine")

function SingleResultModule:InitOther(  )
	local rTran = self.view.suanfenParent.transform.parent:GetComponent("RectTransform")
	local pos = rTran.anchoredPosition
	pos.x = -817
	rTran.anchoredPosition = pos

	local rTran = self.view.suanfenParent1.transform.parent:GetComponent("RectTransform")
	pos = rTran.anchoredPosition
	pos.y = 107
	rTran.anchoredPosition = pos
end

--- 显示黄庄
function SingleResultModule:show_huangzhuang()
	self.view.imgLose.gameObject:SetActive(false)
	self.view.imgHuangZhuang.gameObject:SetActive(true)
end

function SingleResultModule:set_hufa(data, huxi)
	local obj = Manager.FindObject(self.view.rightObj, "Line2/Grid/0/Score")
	obj:SetActive(false)
	SingResultBase.set_hufa(self,data, huxi)
end

return SingleResultModule
