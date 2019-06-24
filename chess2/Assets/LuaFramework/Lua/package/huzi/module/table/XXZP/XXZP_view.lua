local class = require("lib.middleclass")
local ViewBase = require('package.huzi.module.tablebase.tablebase_view')
local TableView = class("huzi.TableView", ViewBase)
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")
local Manager = require("package.public.module.function_manager")
local SoundManager = require("package.huzi.module.tablebase.sound_manager")


TableView.bgName = {}
TableView.bgName[1] = "5"
TableView.bgName[2] = "1"
TableView.bgName[3] = "2"

TableView.nDefaultKanPos = 2
TableView.nZiPaiPaiLei = 2
TableView.nDefaultSortType = 2		--默认对子排序

function TableView:InitEx()
	local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle("huzi/module/table/subgameex/huziex_xxzp.prefab");
	local asset = bundle:GetAsset("HuZiEx_XXZP", false)
	self.exNode = {}
	self.exNode.root = ModuleCache.ComponentUtil.InstantiateLocal(asset, self.root.gameObject)
	self.exNode.root.name = "HuZiEx_XXZP"
	self.exNode.root:SetActive(false)
	local rectTran = self.exNode.root:GetComponent("RectTransform")
	rectTran.anchoredPosition = Vector2(0, -50)
	self.exNode.btnDaTuo = Manager.GetButton(self.exNode.root, "ButtonDaTuo")
	self.exNode.btnBuDaTuo = Manager.GetButton(self.exNode.root, "ButtonBuDaTuo")

	self.exNode.btnDaTuo.onClick:AddListener(handler(self,self.DaTuo))
	self.exNode.btnBuDaTuo.onClick:AddListener(handler(self,self.BuDaTuo))
end

function TableView:refresh_user_state(data)
	--不在游戏中 则把头像等放到中间
	ViewBase.refresh_user_state(self,data)
	if self.model.Msg_Table_GameStateNTFNew == nil and self.module:is_in_game() and self.model.Msg_Table_UserStateNTF_Self.PiaoNum == -1 then
		local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
		if ruleInfo.DaTuoSanFan ~= nil then
			self.exNode.root:SetActive(true)
			--隐藏准备和踢人按钮
			for i=1,self.PlayerNum do
				local localSeatID = self.module:get_local_seat(i-1)
				self.playersView[localSeatID]:show_ready(false)
				self.playersView[localSeatID]:show_kick(false)
			end
		end
	end
	for i=1,self.PlayerNum do
		local localSeatID = self.module:get_local_seat(i-1)
		self.playersView[localSeatID]:SetDaTuo(data.State[i].PiaoNum > 0)
	end
end

function TableView:BuDaTuo()
	SoundManager:play_name("datuono", true)
	self.exNode.root.gameObject:SetActive(false)
	self.model:request_Msg_ACTION_PIAO(0)
end

function TableView:DaTuo()
	SoundManager:play_name("datuo", true)
    self.exNode.root.gameObject:SetActive(false)
	self.model:request_Msg_ACTION_PIAO(1)	
end

function  TableView:set_wanfa()
	local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
	self.txtWanFa.text = "湘乡告胡子"
end

--- 刷新局数
function TableView:refresh_round(round)
	ViewBase.refresh_round(self, round)

	if self.model.Msg_Table_GameStateNTFNew then
		self.txtJushu.text = string.format("        第%d局", self.model.Msg_Table_GameStateNTFNew.RealyRound)
	else
		self.txtJushu.text = "       第1局"
	end
	if self.modelData.tableCommonData.tableType == 1 then
        self.txtJushu.text = "  " 
        if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
            self.txtJushu.text = "  底分" .. self.model.Msg_Table_UserStateNTF.BaseCoinScore
        end
        return
    end
end

function TableView:set_wanfa()
	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	self.txtWanFa.text = "       15胡起胡 ".. ruleInfo.roundCount.."胡结算 "
	if TableManager:cur_game_is_gold_room_type() then
		self.txtWanFa.text = "       15胡起胡 "
	end
	if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
        self.txtWanFa.text = self.txtWanFa.text .. ' 底注:' .. self.model.Msg_Table_UserStateNTF.BaseCoinScore
    end
end

function TableView:onClick_BtnTopLevel()
	
	if self.module:is_in_game() then
		self.module:dispatch_module_event("dissolveroom", "Event_DissolvedRoom", 1)
	elseif self.model.Msg_Table_GameStateNTF == nil then
		self.module:request_exit_room()
	else
		if self.model.Msg_Table_GameStateNTF.result == 2 then
			self.module:request_exit_room()
		else
			self.module:dispatch_module_event("dissolveroom", "Event_DissolvedRoom", 1)
		end
	end
end

return TableView