local ViewBase = require("core.mvvm.view_base")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")

local SingleResultView = Class("SingleResult", ViewBase)

local AssetBundleName = "huzi/module/result/huzi_singleresult.prefab"
local AssetName = "HuZi_SingleResult"
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

function SingleResultView:initialize(...)
	ViewBase.initialize(self, AssetBundleName, AssetName, 1)
	
	self.bg = Manager.FindObject(self.root, "Bg")
	self.PlayerNum = self.PlayerNum or TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule).PlayerNum
	self.titleImg = Manager.GetImage(self.root, "Title")
	self.titleSpriteHolder = Manager.GetComponent(self.titleImg.gameObject, "SpriteHolder")
	
	self.HuangZhuang = Manager.FindObject(self.root, "HuangZhuang")
	
	self.leftObj = Manager.FindObject(self.root, "Bg/Left")
	self.paoImg = Manager.GetImage(self.leftObj, "Line1/Pao/Image")
	self.paoSpriteHolder = Manager.GetComponent(self.paoImg.gameObject, "SpriteHolder")
	self.hufa = Manager.GetText(self.leftObj, "Line1/HuFa/Text")
    self.xiazhangParent = Manager.FindObject(self.leftObj, "Line2")
    self.WanFaShow = Manager.GetText(self.leftObj, "WanFaShow")
	self.xiazhangSample = Manager.FindObject(self.xiazhangParent, "0")
	Manager.SetActive(self.xiazhangSample, false)
	self.objDiPai = Manager.FindObject(self.leftObj, "Line3")
	self.dipaiParent = Manager.FindObject(self.leftObj, "Line3/Layout")
	self.dipaiSample = Manager.FindObject(self.dipaiParent, "0")
	Manager.SetActive(self.dipaiSample, false)
	
	self.rightObj = Manager.FindObject(self.root, "Bg/Right")
	self.winImg = Manager.GetImage(self.rightObj, "Line1/Image")
	self.winSpriteHolder = Manager.GetComponent(self.winImg.gameObject, "SpriteHolder")
	self.winScore = Manager.GetText(self.rightObj, "Line1/Text")
	self.winScoreRed = Manager.GetComponentWithPath(self.rightObj, "Line1/ScoreRed", "TextWrap")
	self.winScoreGreen = Manager.GetComponentWithPath(self.rightObj, "Line1/ScoreGreen", "TextWrap")
	self.suanfenParent = Manager.FindObject(self.rightObj, "Line2/Grid")
	self.suanfenParent1 = Manager.FindObject(self.rightObj, "Line4/Grid")
	self.suanfenSample = Manager.FindObject(self.suanfenParent, "0")
	self.suanfenSample1 = Manager.FindObject(self.suanfenParent1, "0")
	self.WangPaiTemp = Manager.FindObject(self.rightObj, "temp/WangPai")
	self.XingTemp = Manager.FindObject(self.rightObj, "temp/Xing")
	Manager.SetActive(self.suanfenSample, false)

	self.imgWin = Manager.FindObject(self.root, "Bg/ShuYing/Win")
	self.imgLose = Manager.FindObject(self.root, "Bg/ShuYing/Lose")
	self.imgHuangZhuang = Manager.FindObject(self.root, "Bg/ShuYing/huangzhuang")
	
	self.objBottom  = Manager.FindObject(self.root, "Bottom")
	self.btnShow = Manager.GetButton(self.root, "Bottom/Show")
	self.btnHide = Manager.GetButton(self.root, "Bottom/Hide")
	Manager.SetActive(self.btnHide.gameObject, false)
	self.btnNext = Manager.GetButton(self.root, "Bottom/Next")
	self.TextDaoJiShi = Manager.GetText(self.root, "Bottom/Next/TextDaoJiShi")
	self.btnTotal = Manager.GetButton(self.root, "Bottom/Total")
	self.btnBack = Manager.GetButton(self.root, "Bottom/Back")
	self.btnHuanZhuo = Manager.GetButton(self.root, "TopButton/changeTableBtn")
	self.btnJinBiClose = Manager.GetButton(self.root, "TopButton/closeBtn")
	self.btnShare = Manager.GetButton(self.root, "Bottom/Share")

    self.personInfosGo = Manager.FindObject(self.rightObj, "Line3")
	self.personInfos = {}
    for i = 1, self.PlayerNum do
        self.personInfos[i] = {}
		local go = Manager.FindObject(self.personInfosGo, tostring(i))
		go.gameObject:SetActive(true)
        self.personInfos[i].Go = go
        self.personInfos[i].Image = Manager.GetImage(go, "Avatar/Image")
		self.personInfos[i].ScoreLose = Manager.GetComponentWithPath(go, "Score", "TextWrap")
		self.personInfos[i].ScoreWin = Manager.GetComponentWithPath(go, "Score1", "TextWrap")
		self.personInfos[i].Name = Manager.GetText(go, "Name")
		self.personInfos[i].Lv = Manager.FindObject(go, "Lv")
		self.personInfos[i].JinBi = Manager.GetText(go, "IconJinBi/JinBi")
		self.personInfos[i].IconJinBi = Manager.FindObject(go, "IconJinBi")
		self.personInfos[i].ShuGuang = Manager.FindObject(go, "ShuGuang")
		self.personInfos[i].ShuGuang.gameObject:SetActive(false)

		self.personInfos[i].Pao = Manager.FindObject(go, "Pao")
		self.personInfos[i].Hu = Manager.FindObject(go, "Hu")
		self.personInfos[i].Xing = Manager.FindObject(go, "Xing")
		

		if TableManager:cur_game_is_gold_room_type() then
			self.personInfos[i].ScoreLose.gameObject.transform.localScale = Vector3.New(0,0,0)
			self.personInfos[i].ScoreWin.gameObject.transform.localScale = Vector3.New(0,0,0)
		else
			self.personInfos[i].IconJinBi.gameObject.transform.localScale = Vector3.New(0,0,0)

		end
    end

    self.Zong = Manager.FindObject(self.leftObj, "Line1/Zong")
	self.ZongScore = Manager.GetText(self.leftObj, "Line1/Zong/Score")
	self.ZongScoreT = Manager.GetComponentWithPath(self.Zong, "Score1", "TextWrap")

	self.HuangZhuang.gameObject:SetActive(false)

    if AppData.Game_Name == "GLZP" then
        --self.WanFaShow.gameObject:SetActive(true)
        self.paoImg.gameObject:SetActive(false)
        self.hufa.gameObject:SetActive(false)
    else
        --self.WanFaShow.gameObject:SetActive(false)
        self.paoImg.gameObject:SetActive(false)
        self.hufa.gameObject:SetActive(true)
        self.Zong.gameObject:SetActive(false)
	end

	if self.btnExit then
		local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
		if ruleInfo.baseScore then
			self.btnExit.gameObject.transform.localScale = Vector3.New(1, 1, 1)
		else
			self.btnExit.gameObject.transform.localScale = Vector3.New(0, 0, 1)
		end
	else



		self.btnExit = UnityEngine.GameObject.New()

		self.btnExit.transform.parent = self.root.transform
		
	end
end

return SingleResultView 