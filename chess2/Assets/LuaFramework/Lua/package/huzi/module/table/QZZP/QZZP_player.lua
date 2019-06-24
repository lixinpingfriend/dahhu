
local class = require("lib.middleclass")
local PlayerBase = require('package.huzi.module.tablebase.tablebase_player')
local QZZPTablePlayer = class("QZZPTablePlayer", PlayerBase)

local SoundManager = require("package.huzi.module.tablebase.sound_manager")
local Manager = require("package.public.module.function_manager")
local TableBase_Card = require("package.huzi.module.tablebase.tablebase_card")
local Sequence = DG.Tweening.DOTween.Sequence
local Tween = DG.Tweening

QZZPTablePlayer.actionOverride = {}
QZZPTablePlayer.actionOverride[HuziAction.WeiOrSao] = 2
QZZPTablePlayer.actionOverride[HuziAction.KaiZhao] = 3
QZZPTablePlayer.actionOverride[HuziAction.Ti] = 2
QZZPTablePlayer.actionOverride[HuziAction.GuoSao] = 3
QZZPTablePlayer.actionOverride[HuziAction.BiPai] = 2

QZZPTablePlayer.soundPath = "qzzp"

--额外的扩展
function QZZPTablePlayer:InitEx()
    self:AddGameStateEvent(HuziAction.WangChuang, handler(self,self.GameEvent_WangChuang))
    self:AddGameStateEvent(HuziAction.WangDiao, handler(self,self.GameEvent_WangDiao))
    self:AddGameStateEvent(HuziAction.WangZha, handler(self,self.GameEvent_WangZha))
	
	self:InitHuAniEx()
end

--初始化
function QZZPTablePlayer:InitHuAniEx()
	self.HuAniEx = {}
	self.ExRoot = nil
	local tranParent = self.objRoot.transform.parent.parent
	--加载一次 多个Player公用
	if self.view.InitedHuAniEx == nil then
		local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle("huzi/module/table/subgameex/huziex_qzzp.prefab");
		local asset = bundle:GetAsset("HuZiEx_QZZP", false)
		self.ExRoot = ModuleCache.ComponentUtil.InstantiateLocal(asset, tranParent.gameObject)
		self.ExRoot.name = "HuZiEx_QZZP"
		self.view.InitedHuAniEx = true
	end
	self.HuAniEx.root = tranParent:Find("HuZiEx_QZZP/WangPai/grid" .. self.PlayerIndex).gameObject
	
	self.HuAniEx.root:SetActive(false)
	self.HuAniEx.startPos = self.HuAniEx.root.transform.localPosition

	for i=1,4 do
		self.HuAniEx[i] = TableBase_Card:new()
		local obj = self.HuAniEx.root.transform:Find("" .. i).gameObject
		self.HuAniEx[i]:Init(obj, Huzi_Card_Type.Chu)    
		self.HuAniEx[i].eff1 = obj.transform:Find("1").gameObject
		self.HuAniEx[i].eff2 = obj.transform:Find("2").gameObject
	end
end

--王闯 王炸 王钓 公用动画
--num 为显示的王牌数量
function QZZPTablePlayer:PlayWangHuAni(num, bHuangZhuang)
	--显示固定数量的王
	for i=1,4 do
		self.HuAniEx[i]:Show(false)
	end
	local color_type = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
	for i=1,num do
		self.HuAniEx[i]:SetData(21)	--王牌固定值21
		self.HuAniEx[i]:Show(true)
		self.HuAniEx[i].eff1:SetActive(color_type ~= 3)		--1和2都是方角 
		self.HuAniEx[i].eff2:SetActive(color_type == 3)		--3是圆角
	end

	--移动牌和放大牌的动画
	self.HuAniEx.root.transform.localPosition = self.HuAniEx.startPos
    self.HuAniEx.root.transform.localScale = Vector3.zero
    self.HuAniEx.root:SetActive(true)
	SoundManager:play_nameroot('chipeng')
	if bHuangZhuang == nil or bHuangZhuang == false then		--不是黄庄 则播放动画
		self:play_action_sound(self.curActionID)
		self:show_chutx(self.curActionID, self.actionOverride[self.curActionID])
	end
	
    --移动和缩小
    local sequence = Sequence()
    --移动
    local nOperaCount = self:GetOperaComCount()
    --移动牌到下张4和5中间位置处
    local posFront = self.card.xia[4].root.transform.position
    local posLast  = self.card.xia[5].root.transform.position
    local tarPos = (posFront + posLast) / 2 --目标点为两个坐标中间
	
	sequence:Join(self.HuAniEx.root.transform:DOMove(tarPos, 0.5))
	sequence:Join(self.HuAniEx.root.transform:DOScale(1, 0.2)):SetEase(Tween.Ease.InQuad)
	sequence:Insert(5, self.HuAniEx.root.transform:DOScale(1, 0.01)):SetEase(Tween.Ease.InQuad):OnComplete(function()
		if bHuangZhuang == nil or bHuangZhuang == false then		--不是黄庄 则隐藏 黄庄则常显示
			self.HuAniEx.root:SetActive(false)
			self.HuAniEx.root.transform.localPosition = self.HuAniEx.startPos
		end
	end)
end

function QZZPTablePlayer:Reset()
	PlayerBase.Reset(self)
	self.HuAniEx.root:SetActive(false)
	self.HuAniEx.root.transform.localPosition = self.HuAniEx.startPos
end

function QZZPTablePlayer:GameEvent_WangDiao()
	self:PlayWangHuAni(1)
end

function QZZPTablePlayer:GameEvent_WangChuang()
	self:PlayWangHuAni(2)
end

function QZZPTablePlayer:GameEvent_WangZha()
	self:PlayWangHuAni(3)
end

return QZZPTablePlayer