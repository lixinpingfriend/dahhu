




local ViewBase = require("package.huzi.module.singleresult.singleresultBase_view")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")

local SingleResultView = Class("SingleResult", ViewBase)

local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")
local TableBase_Card = require("package.huzi.module.tablebase.tablebase_card")

function SingleResultView:initialize(...)
	ViewBase.initialize(self, ...)
	self:OtherInit()
end

function SingleResultView:OtherInit( )
	if not self.InitedHuAniEx then
		local bundle = ModuleCache.AssetBundleManager:LoadAssetBundle("huzi/module/result/dyzp_singleresuleex.prefab");
		local asset = bundle:GetAsset("DYZP_SingleResuleEx", false)
		self.ExRoot = ModuleCache.ComponentUtil.InstantiateLocal(asset, self.root.gameObject)
		self.ExRoot.name = "DYZP_SingleResuleEx"
		self.InitedHuAniEx = true
	end
	
	self.objJiang = Manager.FindObject(self.ExRoot, "Jiang")		--将牌Obj
	self.cardJiang = TableBase_Card:new()
	self.cardJiang:Init(self.objJiang, Huzi_Card_Type.Qi)
	self.txtDYWanfa1 = Manager.GetText(self.ExRoot, "WanFa1")
	self.txtDYWanfa2 = Manager.GetText(self.ExRoot, "WanFa2")
	self.objDYDiPai = Manager.FindObject(self.ExRoot, "Line3")
	self.gridDYDiPai = Manager.FindObject(self.objDYDiPai, "Layout")
	self.itemDYDiPai = Manager.FindObject(self.gridDYDiPai, "0")

	self.DYScore = {}
	self.objDYScore = Manager.FindObject(self.ExRoot, "Score")
	for i=1,3 do
		self.DYScore[i] = {}
		self.DYScore[i].lose = Manager.GetComponentWithPath(self.ExRoot, "Score/"..i.."/Pos/lose", "TextWrap")
		self.DYScore[i].win = Manager.GetComponentWithPath(self.ExRoot, "Score/"..i.."/Pos/win", "TextWrap")
	end
end




return SingleResultView 