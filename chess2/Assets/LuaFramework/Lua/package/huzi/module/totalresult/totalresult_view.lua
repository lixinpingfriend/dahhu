






local ViewBase = require("core.mvvm.view_base")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")

local TotalResultView = Class("TotalResultView", ViewBase)

local AssetBundleName = "huzi/module/totalgameresult/huzi_totalresult.prefab"
local AssetName = "HuZi_TotalResult"
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

local PlayerPrefsManager = ModuleCache.PlayerPrefsManager

function TotalResultView:initialize(...)
    ViewBase.initialize(self, AssetBundleName, AssetName, 1)
    self.PlayerNum = self.PlayerNum or TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule).PlayerNum


    
    self.roomID = Manager.GetText(self.root, "Top/txt/RoomNum")
    self.wanfa = Manager.GetText(self.root, "Top/txt/GameName")
    self.round = Manager.GetText(self.root, "Top/txt/Round")
    self.startTime = Manager.GetText(self.root, "Top/txt/StartTime")
    self.endTime = Manager.GetText(self.root, "Top/txt/EndTime")
    self.textQuanHao = Manager.GetText(self.root, "Top/txt/QuanNum")

    self.playersHolder = Manager.FindObject(self.root, "Center/Grid")
    self.btnShare = Manager.GetButton(self.root, "Bottom/Child/BtnShare")
    self.btnBack = Manager.GetButton(self.root, "Bottom/Child/BtnReturnHall")

    self.shareTypeToggle =
        ModuleCache.ComponentManager.GetComponentWithPath(
        self.root,
        "Bottom/Child/ShareTypeToggle",
        ComponentTypeName.Toggle
	)
	
	self.shareTypeToggle.onValueChanged:AddListener(function(isCheck)
		if isCheck then
			PlayerPrefsManager.SetInt("shareTypeToggle" ,1)
		else
			PlayerPrefsManager.SetInt("shareTypeToggle",0)
		end
	end	)

    if not ModuleCache.ShareManager().can_share_text_to_wechat() then
        self.shareTypeToggle.gameObject:SetActive(false)
        PlayerPrefsManager.SetInt("shareTypeToggle" ,0)
    end

    self:Init_shareTypeToggle()

	self.ButtonNext = Manager.GetButton(self.root, "Bottom/Child/BtnReStart")
	self.ButtonNext.gameObject:SetActive(false)

	self.item = Manager.FindObject(self.root, "Center/Grid/temp")

    Manager.SetActive(self.item, false)
end

function TotalResultView:Init_shareTypeToggle()

    if PlayerPrefsManager.GetInt("shareTypeToggle".. AppData.Game_Name, 0) == 1 then
        self.shareTypeToggle.isOn = true
    else
        self.shareTypeToggle.isOn = false
    end

    if PlayerPrefsManager.GetInt("shareTypeToggle".. AppData.Game_Name, 0) == 0 then
        PlayerPrefsManager.SetInt("shareTypeToggle" .. AppData.Game_Name, 2)
    end

    self.shareTypeToggle.onValueChanged:AddListener(
        function(isCheck)
            if isCheck then
                PlayerPrefsManager.SetInt("shareTypeToggle" .. AppData.Game_Name, 1)
            else
                PlayerPrefsManager.SetInt("shareTypeToggle" .. AppData.Game_Name, 2)
            end
        end
    )
end

return TotalResultView
