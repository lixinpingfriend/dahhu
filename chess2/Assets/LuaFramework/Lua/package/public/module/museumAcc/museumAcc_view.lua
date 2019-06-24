
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumAccView = Class('museumAccView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil

function MuseumAccView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museumacc/public_museumacc.prefab", "Public_MuseumAcc", 1)
    View.set_1080p(self)

    self.powerNumTex = GetComponentWithPath(self.root, "Center/power/Text", ComponentTypeName.Text)
    self.cashNumTex = GetComponentWithPath(self.root, "Center/cash/Text", ComponentTypeName.Text)

    self.inputField_power = GetComponentWithPath(self.root, "Center/InputField_power", ComponentTypeName.InputField)
    self.inputField_cash = GetComponentWithPath(self.root, "Center/InputField_cash", ComponentTypeName.InputField)

    self.myPowerNumTex = GetComponentWithPath(self.root, "Center/BottomBar/powerBtn/Text", ComponentTypeName.Text)
    self.myCashNumTex = GetComponentWithPath(self.root, "Center/BottomBar/cashBtn/Text", ComponentTypeName.Text)

    self.imageGameIcon = GetComponentWithPath(self.root,"Center/BottomBar/Info/ImageGameIcon",ComponentTypeName.Image)
    self.textGameName = GetComponentWithPath(self.root,"Center/BottomBar/Info/TextGameName",ComponentTypeName.Text)

    self.agentBuyBtn = GetComponentWithPath(self.root,"Center/cash/buyBtn_agent",ComponentTypeName.Transform).gameObject
end

function MuseumAccView:update_game_name_info()
    local playMode = ModuleCache.PlayModeUtil.getConfigByAppAndGameName(ModuleCache.AppData.get_real_app_and_game_name())
    self.textGameName.text = playMode.name
    self.imageGameIcon.sprite =   ModuleCache.PlayModeUtil.getHeadIconRes(playMode)
    self.imageGameIcon:SetNativeSize()
end

function MuseumAccView:update_museum_coins(museumData)


    self.powerNumTex.text ="亲友圈体力:".. Util.filterPlayerGoldNum(tonumber(museumData.curBoxData.costData.coins))

   local playMode = ModuleCache.PlayModeUtil.getConfigByAppAndGameName(museumData.curBoxData.gameId)
    self.cashNumTex.text = playMode.name .."钻石:".. Util.filterPlayerGoldNum(tonumber(museumData.curBoxData.costData.cards))

    self.inputField_power.text = ""
    self.inputField_cash.text = ""
    self.agentBuyBtn:SetActive(self.modelData.roleData.isAgent and tostring(museumData.agentsId) == tostring(self.modelData.roleData.userID))
end

function MuseumAccView:update_my_coins(data)
    self.myPowerNumTex.text = Util.filterPlayerGoldNum(tonumber(data.coins))
    self.myCashNumTex.text = Util.filterPlayerGoldNum(tonumber(data.cards))
end

return MuseumAccView