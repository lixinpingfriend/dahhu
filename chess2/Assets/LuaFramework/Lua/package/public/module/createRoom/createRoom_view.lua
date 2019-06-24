
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local CreateRoomView = Class('createRoomView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local Manager = require("package.public.module.function_manager")

function CreateRoomView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/createroom/public_windowcreateroom.prefab", "Public_WindowCreateRoom", 1)
    View.set_1080p(self)
    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

   -- self.buttonRecharge = GetComponentWithPath(self.root, "TopRight/Child/Tips/OwnRoomCard/ButtonAdd", ComponentTypeName.Button)
    -- self.ownRoomObj = GetComponentWithPath(self.root, "TopRight/Child/Tips/OwnRoomCard", ComponentTypeName.Transform).gameObject
    -- self.roomCard = GetComponentWithPath(self.root, "TopRight/Child/Tips/OwnRoomCard/text", ComponentTypeName.Text)
    self.coinName = GetComponentWithPath(self.root, "TopRight/Child/Tips/OwnRoomCard/bgShop/moreShow/TextName", ComponentTypeName.Text)
    self.buttonCreateRoom = GetComponentWithPath(self.root,"Top/Child/Title/ImageButton1",ComponentTypeName.Image);
    self.buttonIntroduction = GetComponentWithPath(self.root,"Top/Child/Title/ImageButton2",ComponentTypeName.Image);
    self.buttonSelection = GetComponentWithPath(self.root,"Top/Child/Title/Background",ComponentTypeName.Image);
  
    --self.ownRoomObj = GetComponentWithPath(self.root, "TopRight/Child/Tips/OwnRoomCard", ComponentTypeName.Transform).gameObject
    self.powerText = GetComponentWithPath(self.root, "TopRight/powerBtn/Text", ComponentTypeName.Text)
    ---@type UnityEngine.GameObject
    --self.moreShow = GetComponentWithPath(self.root, "TopRight/Child/Tips/OwnRoomCard/bgShop/moreShow", ComponentTypeName.Transform).gameObject
    self.roomCard = GetComponentWithPath(self.root, "TopRight/cashBtn/Text", ComponentTypeName.Text)

    if ModuleCache.GameManager.isTestUser then
        -- 是否开启服务器灰度测试
        self.toggleGameServerGradationTest = GetComponentWithPath(self.root, "TopLeft/Child/ToggleGameServerGradationTest", ComponentTypeName.Toggle)
        self.toggleGameServerGradationTest.gameObject:SetActive(true)
        self.toggleGameServerGradationTest.isOn = ModuleCache.GameManager.openGameServerGradationTest
        self.toggleGameServerGradationTest.onValueChanged:AddListener(function(state)
            ModuleCache.GameManager.openGameServerGradationTest = state
            self.toggleGameServerGradationTest.isOn = ModuleCache.GameManager.openGameServerGradationTest
        end)
    end

    if ModuleCache.GameManager.iosAppStoreIsCheck then
        self.ownRoomObj = GetComponentWithPath(self.root, "TopRight/cashBtn", ComponentTypeName.Transform).gameObject
        self.ownRoomObj:SetActive(false)
	end
	
	self:fixed_tran_size(Manager.FindObject(self.root, "Top"))
	self:fixed_tran_size(Manager.FindObject(self.root, "TopLeft"), ViewBaseData.TopScreenAdaptParam)
	self:fixed_tran_size(Manager.FindObject(self.root, "TopRight"), ViewBaseData.TopScreenAdaptParam)
end

function CreateRoomView:refreshCoinName( )
    self.coinName.text = "专属"
end

return CreateRoomView