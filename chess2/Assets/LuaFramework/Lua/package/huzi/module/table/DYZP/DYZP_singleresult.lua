local SingResultBase = require("package.huzi.module.singleresult.singleresultBase_module")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")
local SoundManager = require("package.huzi.module.tablebase.sound_manager")
local ModuleCache = ModuleCache
local packageHead       = "package.huzi.module."
local SingleResultModule = Class("SingleResult", SingResultBase)
local coroutine = require("coroutine")
SingleResultModule.viewPath = packageHead .. "table.DYZP.DYZP_single_view"

function SingleResultModule:InitOther()
	local rTran = self.view.suanfenParent.transform.parent:GetComponent("RectTransform")
	local pos = rTran.anchoredPosition
	pos.x = -817
	rTran.anchoredPosition = pos
end

function SingleResultModule:set_hufa(data)
	local obj = Manager.FindObject(self.view.rightObj, "Line2/Grid/0/Score")
	obj:SetActive(false)
	SingResultBase.set_hufa(self,data)
	self:set_DYZPhufa(data)
end

--
function SingleResultModule:set_DYZPhufa(data)
	local str1 = ""
    local str2 = ""
	for i = 1, #data do
		if data[i].display_position == 3 then
			str1 = str1 .. data[i].name .. "\n"
		end
		if data[i].display_position == 2 then
			str2 = str2 .. data[i].name .. ":" .. tostring(data[i].fen) .. "\n"
		end
	end
	self.view.txtDYWanfa1.text = str1
    self.view.txtDYWanfa2.text = str2
end

function SingleResultModule:on_show(tableModule)
	SingResultBase.on_show(self,tableModule)
	local data = tableModule.Msg_Table_GameStateNTF
	self.view.cardJiang:SetData(data.jiang_pai)			--设置将牌
	if not TableManager:cur_game_is_gold_room_type() then
		self:show_table(true)
	else 
		self:show_table(false)
	end
end

function SingleResultModule:set_dipai(data, ma_pai)
	SingResultBase.set_dipai(self, data, ma_pai)
	self:set_DYZPdipai(data, ma_pai)
	self:set_DYZPScore()
end

--- 设置底牌
function SingleResultModule:set_DYZPdipai(data, ma_pai)
    Manager.DestroyChildren(self.view.gridDYDiPai, self.view.itemDYDiPai)
    for i = 1, #ma_pai do
        if ma_pai[i].no_display ~= true then
            local obj = Manager.CopyObject(self.view.itemDYDiPai)
            local text = Manager.GetText(obj, "Score")
            text.text = ma_pai[i].count
            Util.SetHuziCard(obj, ma_pai[i].pai, DataPaoHuZi.ZP_ZPPaiLei, Huzi_Card_Type.Qi)
            local image = obj.transform:Find("Image"):GetComponent("Image")
            image.color = Color.New(0 / 255, 253 / 255, 23 / 255, 1)
            Manager.SetActive(obj, true)
        end
    end

    for i = 1, #data do
        TableUtilPaoHuZi.print("-----", data[i])
        local obj = Manager.CopyObject(self.view.itemDYDiPai)
        local text = Manager.GetText(obj, "Score")
        text.text = ""
        Util.SetHuziCard(obj, data[i], DataPaoHuZi.ZP_ZPPaiLei, Huzi_Card_Type.Qi)
        Manager.SetActive(obj, true)
    end
end

function SingleResultModule:set_DYZPScore(data)
	local data = self.data
	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	for i=1, self.tableModule.PlayerNum do
		local localSeatID = self.tableModule:get_local_seat(i - 1)
		if self.tableModule.PlayerNum == 2 and localSeatID == 2 then
			localSeatID = 3
		end
		local nScore = data.player[i].round_score

		--大冶字牌有倍率 和湘乡字牌倍率还不一样
		if ruleInfo.Ratio then
			nScore = nScore * ruleInfo.Ratio
		end
		
		local strScore = ""
		local txtScore
		if nScore > 0 then
			strScore = "+" .. tostring(nScore)
			txtScore = self.view.DYScore[localSeatID].win
		else 
			strScore = tostring(nScore)
			txtScore = self.view.DYScore[localSeatID].lose
		end
		
		txtScore.text = strScore
		txtScore.gameObject:SetActive(true)
	end
end

function SingleResultModule:show_table(show)
	local bCoin = TableManager:cur_game_is_gold_room_type()
	SingResultBase.show_table(self, show)
	local bHuangZhuang = self:is_HuangZhuang()
	self.view.objJiang:SetActive(not show)
	self.view.txtDYWanfa1.gameObject:SetActive(show and not bHuangZhuang)
	self.view.txtDYWanfa2.gameObject:SetActive(show and not bHuangZhuang)
	self.view.objDYDiPai:SetActive(show and not bHuangZhuang and false)			--这里做成了公用 先把大冶的隐藏 用公用的
	self.view.objDYScore:SetActive(show and not bHuangZhuang and not bCoin)
	self.view.HuangZhuang:SetActive(show and bHuangZhuang)
	self.view.btnHide.gameObject:SetActive(show and not bHuangZhuang)
	
end


return SingleResultModule
