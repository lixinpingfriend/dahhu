
local class = require("lib.middleclass")
local PlayerBase = require('package.huzi.module.tablebase.tablebase_player')
local QZZPTablePlayer = class("QZZPTablePlayer", PlayerBase)

local TableBase_Card = require("package.huzi.module.tablebase.tablebase_card")

QZZPTablePlayer.actionOverride = {}
QZZPTablePlayer.actionOverride[HuziAction.Chi] = 4
QZZPTablePlayer.actionOverride[HuziAction.Peng] = 4
QZZPTablePlayer.actionOverride[HuziAction.KaiZhao] = 4
QZZPTablePlayer.actionOverride[HuziAction.PingHu] = 4
QZZPTablePlayer.actionOverride[HuziAction.ZiMo] = 4
QZZPTablePlayer.actionOverride[HuziAction.TianHu] = 4
QZZPTablePlayer.actionOverride[HuziAction.DiHu] = 4
QZZPTablePlayer.actionOverride[HuziAction.JiePao] = 4
QZZPTablePlayer.actionOverride[HuziAction.DianPao] = 4



QZZPTablePlayer.soundPath = "dyzp"

--额外的扩展
function QZZPTablePlayer:InitEx()
    self:AddGameStateEvent(HuziAction.FanJiang, handler(self,self.GameEvent_FanJiang))
	
	self:InitFanJiangEx()
end

function QZZPTablePlayer:Reset()
	PlayerBase.Reset(self)
	self.FanJiang.root:SetActive(false)
end

--初始化
function QZZPTablePlayer:InitFanJiangEx()
	self.FanJiang = {}
	self.ExRoot = nil
	local tranParent = self.objRoot.transform.parent.parent
	--加载一次 多个Player公用
	if self.view.InitedFangJiangEx == nil then
		local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle("huzi/module/table/subgameex/huziex_dyzp.prefab");
		local asset = bundle:GetAsset("HuZiEx_DYZP", false)
		self.ExRoot = ModuleCache.ComponentUtil.InstantiateLocal(asset, tranParent.gameObject)
		self.ExRoot.name = "HuZiEx_DYZP"
		local rectTran = self.ExRoot:GetComponent("RectTransform")
		rectTran.anchoredPosition = Vector2(0,-93)
		self.view.InitedFangJiangEx = true
	end
	self.FanJiang.root = tranParent:Find("HuZiEx_DYZP").gameObject
	self.FanJiang.root:SetActive(false)
	self.FanJiang.ani = self.FanJiang.root.transform:Find("Animator").gameObject
	self.FanJiang.card = TableBase_Card:new()
	local objCard = self.FanJiang.root.transform:Find("Image").gameObject
	local tranStart = self.FanJiang.root.transform:Find("startPos").gameObject
	self.FanJiang.card:Init(objCard, Huzi_Card_Type.Xia)
	self.FanJiang.endPos = objCard.transform.position
	self.FanJiang.startPos = tranStart.transform.position
end

function QZZPTablePlayer:GameEvent_FanJiang()
	self.FanJiang.root:SetActive(true)
	self.FanJiang.ani:SetActive(false)
	self.FanJiang.ani:SetActive(true)
	self.FanJiang.card:Show(false)
	coroutine.wait(1.3)
	self.FanJiang.card:SetData(self.module.Msg_Table_GameStateNTF.jiang_pai)
	self.FanJiang.card:Show(true)
	self.FanJiang.card.root.transform.position = self.FanJiang.startPos
	local sequence = self:CreateSequence()
	sequence:Join(self.FanJiang.card.root.transform:DOMove(self.FanJiang.endPos, 0.7))
end

function QZZPTablePlayer:Set_Jiang()
	if self.module.Msg_Table_GameStateNTF.result ~= 0 then
		self.FanJiang.root:SetActive(false)
		return
	end
	self.FanJiang.card:SetData(self.module.Msg_Table_GameStateNTF.jiang_pai)
	self.FanJiang.card:Show(true)
	self.FanJiang.root:SetActive(true)
	self.FanJiang.ani:SetActive(false)
end

function QZZPTablePlayer:update_score(score)
	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	if ruleInfo.Ratio and score then
		score = score * ruleInfo.Ratio
	end
	PlayerBase.update_score(self, score)
end

return QZZPTablePlayer