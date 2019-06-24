
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local GiveGoodsView = Class('giveGoodsView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

function GiveGoodsView:initialize(...)
	-- 初始View
	View.initialize(self, "public/module/givegoods/public_givegoods.prefab", "Public_GiveGoods", 1)

    self.buttonClose = GetComponentWithPath(self.root,"BaseBackground/closeBtn",ComponentTypeName.Button)
    -- Input
    self.inputFeild  = GetComponentWithPath(self.root,"Center/Input/InputAccount",ComponentTypeName.InputField)
    self.inputText   = GetComponentWithPath(self.root,"Center/Input/InputAccount/Text",ComponentTypeName.Text)
    self.btnCheck    = GetComponentWithPath(self.root,"Center/Input/ButtonCheck",ComponentTypeName.Button)

    -- Player
    self.playerPanel = GetComponentWithPath(self.root, "Center/PlayerInfo", ComponentTypeName.Transform).gameObject
    self.txtName     = GetComponentWithPath(self.root, "Center/PlayerInfo/Name", ComponentTypeName.Text)
    self.headIcon    = GetComponentWithPath(self.root, "Center/PlayerInfo/Avatar/Avatar/Image", ComponentTypeName.Image)
    self.txtId       = GetComponentWithPath(self.root, "Center/PlayerInfo/ID", ComponentTypeName.Text)
    self.iconMen     = GetComponentWithPath(self.root, "Center/PlayerInfo/men", ComponentTypeName.Transform).gameObject
    self.iconWomen   = GetComponentWithPath(self.root, "Center/PlayerInfo/women", ComponentTypeName.Transform).gameObject

    -- bottom(give cost)
    self.txtGiveNum  = GetComponentWithPath(self.root, "Center/Bottom/NumGive", ComponentTypeName.Text)
    self.txtGiveCost = GetComponentWithPath(self.root, "Center/Bottom/NumCost", ComponentTypeName.Text)
    self.btnGive     = GetComponentWithPath(self.root,"Center/Bottom/ButtonGive",ComponentTypeName.Button)

    self.uiState = GetComponentWithPath(self.root, "Center", "UIStateSwitcher")
	
end

function GiveGoodsView:on_view_init()
	
end

-- data:商品信息
function GiveGoodsView:refresh_view(data)
    self.uiState:SwitchState("Diammond")
    if(data.curPage == 2) then
        self.uiState:SwitchState("Tili")
    end
    self.playerPanel:SetActive(false)
    self.inputFeild.text = ""
    local goodsName = "x"..string.gsub(data.goodsData.productName, "体力", "")
    self.txtGiveNum.text = goodsName
    self.txtGiveCost.text = "￥"..data.goodsData.productPrice
end

function GiveGoodsView:showPlayer(data)
    if(data == nil) then return nil end
    self.txtName.text = data.nickname
    self.txtId.text   = 'ID:'..data.userId
    local isWomen     = data.gender == 2
    self.iconMen:SetActive(not isWomen)
    self.iconWomen:SetActive(isWomen)
    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(data.headImg, function(err, sprite)
        if(err) then
            --print('down load '.. data.headImg .. 'failed:')
        else
            self.headIcon.sprite = sprite
            self.playerPanel:SetActive(true)
        end
    end)    
end

return GiveGoodsView 