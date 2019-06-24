Huzi_Card_Type = {
    Chu = 1,
    Qi = 2,
    Xia = 3,
    Hand = 4,
}

Huzi_Card_SpriteName = {}
Huzi_Card_SpriteName[Huzi_Card_Type.Chu] = "c"
Huzi_Card_SpriteName[Huzi_Card_Type.Qi] = "q"
Huzi_Card_SpriteName[Huzi_Card_Type.Xia] = "q"
Huzi_Card_SpriteName[Huzi_Card_Type.Hand] = "h"

local Manager = require("package.public.module.function_manager")
local AssetBundleManager = ModuleCache.AssetBundleManager
local class       = require("lib.middleclass")
local TableBase_Card = class('TableBase_Card')

function TableBase_Card:Init(objRoot, cardType)
    self.root = objRoot
	self.image = Manager.GetImage(objRoot, "Image")
	if self.image == nil then
		self.image = objRoot:GetComponent("Image")
	end
    self.color_type = 1                     --牌颜色类型 3种类型显示  
    self.nCardNum = 0                       --默认是牌背
    self.card_type = cardType               
end

function TableBase_Card:SetData(nCardNum, bGray)
    self.nCardNum = nCardNum
    self.color_type = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
    local bundlePath = "huzi/module/table/huzi_tablecards/type".. self.color_type ..".atlas"
    local assetName = Huzi_Card_SpriteName[self.card_type] .. nCardNum
	self.image.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
end

function TableBase_Card:SetGray(bGray)
    if bGray ~= nil and bGray then	--变灰
		self.image.color = Color(0.6,0.6,0.6, 1)
	else
		self.image.color = Color(1,1,1, 1)
	end
end

function TableBase_Card:Show(bShow)
    if self.root ~= nil then
        self.root:SetActive(bShow)
    end
end

function TableBase_Card:AddTingCount(nCount)
	local txt = Manager.GetText(self.root, "Image/imgCount/txtCount")
	if txt == nil then
		return
	end
	txt.text = nCount .. ""
end


return TableBase_Card