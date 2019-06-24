
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local RoomSettingView = Class('roomSettingView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponent = ModuleCache.ComponentManager.GetComponent
local ComponentUtil = ModuleCache.ComponentUtil
local PlayerPrefs = UnityEngine.PlayerPrefs

function RoomSettingView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/roomsetting/public_windowroomsetting.prefab", "Public_WindowRoomSetting", 1)

    self._parent = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform)

    self.curTableData = TableManager.curTableData

    self.buttonClose         = GetComponentWithPath(self.root, "BaseBackground/closeBtn", ComponentTypeName.Button)
    self.buttonDissolveRoom  = GetComponentWithPath(self.root, "Center/ButtonDissolveRoom", ComponentTypeName.Button)
    self.buttonExitRoom      = GetComponentWithPath(self.root, "Center/Buttons/ButtonExitRoom", ComponentTypeName.Button)
    self.toggleYuYin         = GetComponentWithPath(self.root, "Center/Sound/ToggleYuYin", ComponentTypeName.Toggle)

    self.toggleZhenDong      = GetComponentWithPath(self.root, "Center/Game/Grid/ToggleZhenDong", ComponentTypeName.Toggle)
    self.toggleGuoHu         = GetComponentWithPath(self.root, "Center/Game/Grid/ToggleGuoHu", ComponentTypeName.Toggle)
    self.toggleRecomOut      = GetComponentWithPath(self.root, "Center/Game/Grid/ToggleRecomOut", ComponentTypeName.Toggle)
    self.toggleBriefResult      = GetComponentWithPath(self.root, "Center/Game/Grid/ToggleBriefResult", ComponentTypeName.Toggle)
    self.toggleOneClickOutMj      = GetComponentWithPath(self.root, "Center/Game/Grid/ToggleOneClickOutMj", ComponentTypeName.Toggle)
    self.toggleFast          = GetComponentWithPath(self.root, "Center/Game/Grid/ToggleFast", ComponentTypeName.Toggle)

    self.toggleMusic         = GetComponentWithPath(self.root, "Center/Sound/ToggleMusic", ComponentTypeName.Toggle)
    self.toggleSound         = GetComponentWithPath(self.root, "Center/Sound/ToggleSound", ComponentTypeName.Toggle)
    self.textAppLv           = GetComponentWithPath(self.root, "Center/AppLv", ComponentTypeName.Text)
    self.textResLv           = GetComponentWithPath(self.root, "Center/ResLv", ComponentTypeName.Text)
    self.packageResLv        = GetComponentWithPath(self.root, "Center/PackageLv", ComponentTypeName.Text)


    self.ButtonBg1            = GetComponentWithPath(self.root, "Center/Background/ButtonBg1", ComponentTypeName.Transform).gameObject
    self.ButtonBg2            = GetComponentWithPath(self.root, "Center/Background/ButtonBg2", ComponentTypeName.Transform).gameObject
    self.ButtonBg3            = GetComponentWithPath(self.root, "Center/Background/ButtonBg3", ComponentTypeName.Transform).gameObject
    self.ImageBg1            = GetComponentWithPath(self.root, "Center/Background/ButtonBg1/bg", ComponentTypeName.Image)
    self.ImageBg2            = GetComponentWithPath(self.root, "Center/Background/ButtonBg2/bg", ComponentTypeName.Image)
    self.ImageBg3            = GetComponentWithPath(self.root, "Center/Background/ButtonBg3/bg", ComponentTypeName.Image)
    self.goBgSelect1         = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/ButtonBg1/ImageSelect")
    self.goBgSelect2         = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/ButtonBg2/ImageSelect")
    self.goBgSelect3         = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/ButtonBg3/ImageSelect")
    self.goGameSetting       = GetComponentWithPath(self.root, "Center/Game", ComponentTypeName.Transform).gameObject

    ---2D ,3D 麻将切换相关——————Begin
    self.goSelect2d         = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/Button2d/ImageSelect")
    self.goSelect3d         = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/Button3d/ImageSelect")
    self.Image2d            = GetComponentWithPath(self.root, "Center/Background/Button2d/bg", ComponentTypeName.Image)
    self.Image3d            = GetComponentWithPath(self.root, "Center/Background/Button3d/bg", ComponentTypeName.Image)
    self.Button2d           = GetComponentWithPath(self.root, "Center/Background/Button2d", ComponentTypeName.Transform).gameObject
    self.Button3d           = GetComponentWithPath(self.root, "Center/Background/Button3d", ComponentTypeName.Transform).gameObject
    -------------------------------End


    ---3D 麻将切换布局相关------------Begin
    self.goSelect3dLayout1    = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/Button3dLayout1/ImageSelect")
    self.goSelect3dLayout2    = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/Button3dLayout2/ImageSelect")
    self.Image3dLayout1       = GetComponentWithPath(self.root, "Center/Background/Button3dLayout1/bg", ComponentTypeName.Image)
    self.Image3dLayout2       = GetComponentWithPath(self.root, "Center/Background/Button3dLayout2/bg", ComponentTypeName.Image)
    self.Button3dLayout1    = GetComponentWithPath(self.root, "Center/Background/Button3dLayout1", ComponentTypeName.Transform).gameObject
    self.Button3dLayout2    = GetComponentWithPath(self.root, "Center/Background/Button3dLayout2", ComponentTypeName.Transform).gameObject
    ----------------------------------End


    ---3D 麻将切换牌桌风格相关------------Begin
    self.goSelect3dStyle1    = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/Button3dStyle1/ImageSelect")
    self.goSelect3dStyle2    = ModuleCache.ComponentUtil.Find(self.root, "Center/Background/Button3dStyle2/ImageSelect")
    self.Image3dStyle1       = GetComponentWithPath(self.root, "Center/Background/Button3dStyle1/bg", ComponentTypeName.Image)
    self.Image3dStyle2       = GetComponentWithPath(self.root, "Center/Background/Button3dStyle2/bg", ComponentTypeName.Image)
    self.Button3dStyle1    = GetComponentWithPath(self.root, "Center/Background/Button3dStyle1", ComponentTypeName.Transform).gameObject
    self.Button3dStyle2    = GetComponentWithPath(self.root, "Center/Background/Button3dStyle2", ComponentTypeName.Transform).gameObject
    ----------------------------------End


    self.goSoundSetting      = GetComponentWithPath(self.root, "Center/Sound", ComponentTypeName.Transform).gameObject
    self.goBackgroundSetting = GetComponentWithPath(self.root, "Center/Background", ComponentTypeName.Transform).gameObject

    self.labelMajiang        = GetComponentWithPath(self.root, "Center/Buttons/Panel/MaJiangSetting/Checkmark", ComponentTypeName.Transform).gameObject
    self.labelBackground     = GetComponentWithPath(self.root, "Center/Buttons/Panel/BackgroundSetting/Checkmark", ComponentTypeName.Transform).gameObject
    self.labelMusic          = GetComponentWithPath(self.root, "Center/Buttons/Panel/MusicSetting/Checkmark", ComponentTypeName.Transform).gameObject
    self.labelGame           = GetComponentWithPath(self.root, "Center/Buttons/Panel/GameSetting/Checkmark", ComponentTypeName.Transform).gameObject
    self.labelZiPai           = GetComponentWithPath(self.root, "Center/Buttons/Panel/ZiPaiSetting/Checkmark", ComponentTypeName.Transform).gameObject
    self.sliderMusic         = GetComponentWithPath(self.root, "Center/Sound/ToggleMusic/Slider", ComponentTypeName.Slider)
    self.sliderSound         = GetComponentWithPath(self.root, "Center/Sound/ToggleSound/Slider", ComponentTypeName.Slider)
    self.sliderYuYin         = GetComponentWithPath(self.root, "Center/Sound/ToggleYuYin/Slider", ComponentTypeName.Slider)
    self.labelRunfast        = GetComponentWithPath(self.root, "Center/Buttons/Panel/RunfastSetting/Checkmark", ComponentTypeName.Transform).gameObject
    self.labelCommonPoker        = GetComponentWithPath(self.root, "Center/Buttons/Panel/CommonPokerSetting/Checkmark", ComponentTypeName.Transform).gameObject

    ---普通话，方言切换相关------------Begin
    self.goLocationSetting = GetComponentWithPath(self.goSoundSetting, "LocationSetting", ComponentTypeName.Transform).gameObject
    self.commonCheckMark = GetComponentWithPath(self.goLocationSetting, "Common/Toggle/Checkmark", ComponentTypeName.Transform).gameObject
    self.locationCheckMark = GetComponentWithPath(self.goLocationSetting, "Location/Toggle/Checkmark", ComponentTypeName.Transform).gameObject
    ----------------------------------End

    ---推荐出牌相关------------------Begin
    self.goRecommendOutPaiSetting = GetComponentWithPath(self.goGameSetting, "Grid/ToggleRecomOut", ComponentTypeName.Transform).gameObject
    self.RecommendOkCheckMark = GetComponentWithPath(self.goRecommendOutPaiSetting, "select", ComponentTypeName.Transform).gameObject
    self.RecommendNoCheckMark = GetComponentWithPath(self.goRecommendOutPaiSetting, "unselect", ComponentTypeName.Transform).gameObject
    ---------------------------------End

    ---简略小结算相关---------------Begin
    self.goBriefResulSetting = GetComponentWithPath(self.goGameSetting, "Grid/ToggleBriefResult", ComponentTypeName.Transform).gameObject
    self.BriefResulOkCheckMark = GetComponentWithPath(self.goBriefResulSetting, "select", ComponentTypeName.Transform).gameObject
    self.BriefResulNoCheckMark = GetComponentWithPath(self.goBriefResulSetting, "unselect", ComponentTypeName.Transform).gameObject
    ----------------------------------End

    ---麻将单击出牌相关---------------Begin
    self.goOneClickOutMjSetting = GetComponentWithPath(self.goGameSetting, "Grid/ToggleOneClickOutMj", ComponentTypeName.Transform).gameObject
    self.OneClickOutMjOkCheckMark = GetComponentWithPath(self.goOneClickOutMjSetting, "select", ComponentTypeName.Transform).gameObject
    self.OneClickOutMjNoCheckMark = GetComponentWithPath(self.goOneClickOutMjSetting, "unselect", ComponentTypeName.Transform).gameObject
    ----------------------------------End

    ----通用扑克切换牌面
    self.goCommonPokerFaceSetting = GetComponentWithPath(self.root, "Center/CommonPokerFaceSetting", ComponentTypeName.Transform).gameObject
    self.toggle_commonPokerFace = GetComponentWithPath(self.goCommonPokerFaceSetting, "Size/ToggleGroup/Toggle1", ComponentTypeName.Toggle)
	--self:refreshVolumes()
	
	---花牌单击出牌相关---------------Begin
	self.goHuaPaiChuTypeRoot = GetComponentWithPath(self.root, "Center/Game/ToggleGroupHuaPaiChuType", ComponentTypeName.Transform).gameObject	--花牌出牌类型
	self.huazhipai_toggle_chuType = {}
	self.huazhipai_toggle_chuType[1] = GetComponentWithPath(self.goHuaPaiChuTypeRoot, "Toggle1", ComponentTypeName.Toggle)	--花牌出牌类型 --滑动
	self.huazhipai_toggle_chuType[2] = GetComponentWithPath(self.goHuaPaiChuTypeRoot, "Toggle2", ComponentTypeName.Toggle)	--花牌出牌类型 --单击
	self.huazhipai_toggle_chuType[3] = GetComponentWithPath(self.goHuaPaiChuTypeRoot, "Toggle3", ComponentTypeName.Toggle)	--花牌出牌类型 --双击
	----------------------------------End

	---胡子相关----------------------Begin
	self.goHuziKanPosRoot = GetComponentWithPath(self.root, "Center/Game/ToggleGroupHuziKanPos", ComponentTypeName.Transform).gameObject	--花牌出牌类型
	self.huzi_toggle_KanPos = {}
	self.huzi_toggle_KanPos[1] = GetComponentWithPath(self.goHuziKanPosRoot, "Toggle1", ComponentTypeName.Toggle)	--huzi坎位置 左侧
	self.huzi_toggle_KanPos[2] = GetComponentWithPath(self.goHuziKanPosRoot, "Toggle2", ComponentTypeName.Toggle)	--huzi坎位置 中间
	----------------------------------End

    self.toggleHandPoker1Row = GetComponentWithPath(self.root, "Center/Game/ToggleGroupHandPokerRowCount/Toggle1Row", ComponentTypeName.Toggle)
    self.toggleHandPoker2Row = GetComponentWithPath(self.root, "Center/Game/ToggleGroupHandPokerRowCount/Toggle2Row", ComponentTypeName.Toggle)

    self.TableBgSelect = GetComponentWithPath(self.root,"Center/TableBgSelect", ComponentTypeName.Transform).gameObject
    self.Btn3D = GetComponentWithPath(self.root,"Center/TableBgSelect/2D3DRoot/Btn3D", ComponentTypeName.Button)
    self.Btn3D_SelectGo = GetComponentWithPath(self.root,"Center/TableBgSelect/2D3DRoot/Btn3D/Image/Select", ComponentTypeName.Transform).gameObject
    self.Btn3D_ViewImage = GetComponentWithPath(self.root,"Center/TableBgSelect/2D3DRoot/Btn3D/View", ComponentTypeName.Image)

    self.Btn2D = GetComponentWithPath(self.root,"Center/TableBgSelect/2D3DRoot/Btn2D", ComponentTypeName.Button)
    self.Btn2D_SelectGo = GetComponentWithPath(self.root,"Center/TableBgSelect/2D3DRoot/Btn2D/Image/Select", ComponentTypeName.Transform).gameObject
    self.Btn2D_ViewImage = GetComponentWithPath(self.root,"Center/TableBgSelect/2D3DRoot/Btn2D/View", ComponentTypeName.Image)

    self.TableBgSelectSlotList = {}
    for i = 1, 3 do
        local locPath = "Center/TableBgSelect/TableBgRoot/List/" .. i
        local SlotGo = GetComponentWithPath(self.root,locPath, ComponentTypeName.Transform).gameObject
        SlotGo:SetActive(false)
        self.TableBgSelectSlotList[i] = SlotGo
    end

end



function RoomSettingView:refreshView(intentData)
    self.intentData = intentData
    self.majiangPackageName = intentData.majiangPackageName

    if self.curTableData and (self.curTableData.ruleJsonInfo or self.curTableData.Rule) then
        self.curTableData.ruleJsonInfo = self.curTableData.ruleJsonInfo or ModuleCache.Json.decode(self.curTableData.Rule)
        if(self.curTableData and self.curTableData.ruleJsonInfo) then
        local config = ModuleCache.PlayModeUtil.get_playmodel_data(self.curTableData.ruleJsonInfo.GameType)
        local defaultScale = 0
        local defaultColor = 0
        local defaultBg = 1
        if(config and config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        if(strs[1]) then
        defaultScale = tonumber(strs[1])
        end
        if(strs[2]) then
        defaultColor = tonumber(strs[2])
        end
        if(strs[3]) then
        defaultBg = tonumber(strs[3])
        end
        end
        self.mjScaleSet = PlayerPrefs.GetInt(string.format("%s_MJScale",self.curTableData.ruleJsonInfo.GameType), defaultScale)
        self.mjColorSet = PlayerPrefs.GetInt(string.format("%s_MJColor",self.curTableData.ruleJsonInfo.GameType), defaultColor)
        self.mj3dSkinType = PlayerPrefs.GetInt(string.format("%s_Mj3d_Skin",self.curTableData.ruleJsonInfo.GameType),1)
        self.bgSetKey = string.format("%s_MJBackground",self.curTableData.ruleJsonInfo.GameType)
        self.mjBgSet = PlayerPrefs.GetInt(self.bgSetKey, defaultBg)

        ---2d,3d麻将切换相关 ----- Begin -----------------------
        if  self.intentData.is3D == 1 then ---开放了2D和3D切换
            local gameType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
            if self.curTableData and self.curTableData.ruleJsonInfo then
                gameType = self.curTableData.ruleJsonInfo.GameType
            end
            self.mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",gameType)
            local GameID = AppData.get_app_and_game_name()
            self.default2dOr3d = intentData.def3dOr2d
            if intentData.mj2dOr3dSetKey then
                self.mj2dOr3dSetKey = intentData.mj2dOr3dSetKey
            end
            self.mj2dOr3d = PlayerPrefs.GetInt(self.mj2dOr3dSetKey,self.default2dOr3d)
        else  --- 不能切换到3D  ，使用新麻将框架的2D麻将，或者使用了老框架的2D麻将
            self.default2dOr3d = 0
            self.mj2dOr3d = 0
        end
        -------------------------End----------------------------
        end
    end


    --self:refreshVolumes()

    if intentData.tableBackgroundSprite then
        self.ImageBg1.transform.parent.gameObject:SetActive(true)
        self.ImageBg1.sprite = intentData.tableBackgroundSprite
    else
        self.ImageBg1.transform.parent.gameObject:SetActive(false)
    end

    if intentData.tableBackgroundSprite2 then
        self.ImageBg2.transform.parent.gameObject:SetActive(true)
        self.ImageBg2.sprite = intentData.tableBackgroundSprite2
    else
        self.ImageBg2.transform.parent.gameObject:SetActive(false)
    end

    if intentData.tableBackgroundSprite3 then
        self.ImageBg3.transform.parent.gameObject:SetActive(true)
        self.ImageBg3.sprite = intentData.tableBackgroundSprite3
    else
        self.ImageBg3.transform.parent.gameObject:SetActive(false)
    end

    if intentData.tableBackground2d then
        self.Image2d.transform.parent.gameObject:SetActive(true)
        self.Image2d.sprite = intentData.tableBackground2d
    else
        self.Image2d.transform.parent.gameObject:SetActive(false)
    end
    if intentData.tableBackground3d then
        self.Image3d.transform.parent.gameObject:SetActive(true)
        self.Image3d.sprite = intentData.tableBackground3d
    else
        self.Image3d.transform.parent.gameObject:SetActive(false)
    end

    if intentData.selected3dLayoutSprite1 then
        self.Image3dLayout1.transform.parent.gameObject:SetActive(true)
        self.Image3dLayout1.sprite = intentData.selected3dLayoutSprite1
    else
        self.Image3dLayout1.transform.parent.gameObject:SetActive(false)
    end
    if intentData.selected3dLayoutSprite2 then
        self.Image3dLayout2.transform.parent.gameObject:SetActive(true)
        self.Image3dLayout2.sprite = intentData.selected3dLayoutSprite2
    else
        self.Image3dLayout2.transform.parent.gameObject:SetActive(false)
    end

    if intentData.table3dStyleDisSprite1 then
        self.Image3dStyle1.transform.parent.gameObject:SetActive(true)
        self.Image3dStyle1.sprite = intentData.table3dStyleDisSprite1
    else
        self.Image3dStyle1.transform.parent.gameObject:SetActive(false)
    end
    if intentData.table3dStyleDisSprite2 then
        self.Image3dStyle2.transform.parent.gameObject:SetActive(true)
        self.Image3dStyle2.sprite = intentData.table3dStyleDisSprite2
    else
        self.Image3dStyle2.transform.parent.gameObject:SetActive(false)
    end

    ModuleCache.ComponentUtil.SafeSetActive(self.toggleHandPoker1Row.transform.parent.gameObject, intentData.showHandPokerRowCountToggle or false)
    if(intentData.showHandPokerRowCountToggle)then
        self.toggleHandPoker1Row.isOn = intentData.handPokerRowCount == 1
        self.toggleHandPoker2Row.isOn = intentData.handPokerRowCount ~= 1
    end

    self.toggleGuoHu.gameObject:SetActive(intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_MJ")
    --self.toggleFast.gameObject:SetActive(intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_MJ")
    local switcher = GetComponentWithPath(self.root, "Center/Buttons/Panel", "UIStateSwitcher")
    local othersActive = self:GetOtherWindowActiveState();

    if intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_PHZ" then
        if not self.zipaiInit then
            local zipai =  ModuleCache.ViewUtil.InitViewGameObject("paohuzi/module/setting/zipai.prefab", "ZiPai", 1); --同步加载
            zipai.name = "ZiPai"
            zipai.transform.parent =self._parent

            self.goZiPai       = GetComponentWithPath(self.root, "Center/ZiPai", ComponentTypeName.Transform).gameObject
            self.togleZiPaiMen = {}
            self.togleZiPaiMen[1] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle1", ComponentTypeName.Toggle)
            self.togleZiPaiMen[2] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle2", ComponentTypeName.Toggle)
            self.togleZiPaiMen[3] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle3", ComponentTypeName.Toggle)
            self.goZiPai_ZheDang       = GetComponentWithPath(self.root, "Center/ZiPai/ZheDang", ComponentTypeName.Button)

            self.zipaiInit = true
        end
		switcher:SwitchState("ZiPai");
	elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_HuZi" then
		if not self.huziInit then
			local zipai =  ModuleCache.ViewUtil.InitViewGameObject("huzi/module/setting/zipai.prefab", "ZiPai", 1); --同步加载
			zipai.name = "ZiPai"
			zipai.transform.parent =self._parent

			self.goZiPai       = GetComponentWithPath(self.root, "Center/ZiPai", ComponentTypeName.Transform).gameObject
			self.togleZiPaiMen = {}
			self.togleZiPaiMen[1] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle1", ComponentTypeName.Toggle)
			self.togleZiPaiMen[2] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle2", ComponentTypeName.Toggle)
			self.togleZiPaiMen[3] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle3", ComponentTypeName.Toggle)
			self.goZiPai_ZheDang       = GetComponentWithPath(self.root, "Center/ZiPai/ZheDang", ComponentTypeName.Button)

			self.goHuziKanPosRoot:SetActive(true)
			self.huziInit = true
		end
		switcher:SwitchState("ZiPai");
	elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_HuaZhiPai" then
		if not self.huazhipaiInit then
			local zipai =  ModuleCache.ViewUtil.InitViewGameObject("huazhipai/module/setting/zipai.prefab", "ZiPai", 1); --同步加载
			zipai.name = "ZiPai"
			zipai.transform.parent =self._parent
			self.goZiPai       = GetComponentWithPath(self.root, "Center/ZiPai", ComponentTypeName.Transform).gameObject
			self.togleZiPaiMen = {}
			self.togleZiPaiMen[1] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle1", ComponentTypeName.Toggle)
			self.togleZiPaiMen[2] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle2", ComponentTypeName.Toggle)
			--self.togleZiPaiMen[3] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle3", ComponentTypeName.Toggle)
			self.goHuaPai_ZheDang       = GetComponentWithPath(self.root, "Center/ZiPai/ZheDang", ComponentTypeName.Button)
			self.goHuaPaiChuTypeRoot:SetActive(true)
			self.huazhipaiInit = true
		end
		switcher:SwitchState("ZiPai");
	elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_HuaZhiPai_SWJ" then		
		if not self.huazhipaiInit then
			local zipai =  ModuleCache.ViewUtil.InitViewGameObject("huazhipai/module/setting/zipai_swj.prefab", "ZiPai_SWJ", 1); --同步加载
			zipai.name = "ZiPai"
			zipai.transform.parent =self._parent
			self.goZiPai       = GetComponentWithPath(self.root, "Center/ZiPai", ComponentTypeName.Transform).gameObject
			self.togleZiPaiMen = {}
			self.togleZiPaiMen[1] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle1", ComponentTypeName.Toggle)
			self.goHuaPaiChuTypeRoot:SetActive(true)
			self.huazhipaiInit = true
		end
		switcher:SwitchState("ZiPai");
    elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_MJ" then
        if not self.majiangInit then
            local packageName = self.majiangPackageName or 'majiang'
            local majong =  ModuleCache.ViewUtil.InitViewGameObject( packageName .. "/module/setting/majong.prefab", "MaJong", 1); --同步加载
            majong.name = "MaJong"
            majong.transform.parent = self._parent

            self.goMajongSetting     = GetComponentWithPath(self.root, "Center/MaJong", ComponentTypeName.Transform).gameObject

            self.greenPanel          = GetComponentWithPath(self.root, "Center/MaJong/Size/MaJongShow/Green", ComponentTypeName.Transform).gameObject
            self.yellowPanel         = GetComponentWithPath(self.root, "Center/MaJong/Size/MaJongShow/Yellow", ComponentTypeName.Transform).gameObject
            self.type3TextPanel          = GetComponentWithPath(self.root, "Center/MaJong/Size/MaJongShow/Type3", ComponentTypeName.Transform).gameObject

            self.smallPanel          = GetComponentWithPath(self.root, "Center/MaJong/Color/MajongShow/Small", ComponentTypeName.Transform).gameObject
            self.bigPanel            = GetComponentWithPath(self.root, "Center/MaJong/Color/MajongShow/Big", ComponentTypeName.Transform).gameObject
            self.type3ColorPanel     = GetComponentWithPath(self.root, "Center/MaJong/Color/MajongShow/Type3", ComponentTypeName.Transform).gameObject

            self.togleMajongTextBig  = GetComponentWithPath(self.root, "Center/MaJong/Size/ToggleGroup/ToggleBig", ComponentTypeName.Toggle)
            self.togleMajongTextSmall= GetComponentWithPath(self.root, "Center/MaJong/Size/ToggleGroup/ToggleSmall", ComponentTypeName.Toggle)
            self.togleMajongTextType3 = GetComponentWithPath(self.root, "Center/MaJong/Size/ToggleGroup/ToggleType3", ComponentTypeName.Toggle)

            self.togleMajongGreen    = GetComponentWithPath(self.root, "Center/MaJong/Color/ToggleGroup/ToggleGreen", ComponentTypeName.Toggle)
            self.togleMajongYellow   = GetComponentWithPath(self.root, "Center/MaJong/Color/ToggleGroup/ToggleYellow", ComponentTypeName.Toggle)
            self.togleMajongType3 = GetComponentWithPath(self.root, "Center/MaJong/Color/ToggleGroup/ToggleType3", ComponentTypeName.Toggle)

            self.mj3dSkin = GetComponentWithPath(self.root, "Center/MaJong/3dSkin", ComponentTypeName.Transform).gameObject
            self.sizeObj = GetComponentWithPath(self.root, "Center/MaJong/Size", ComponentTypeName.Transform).gameObject
            self.colorObj = GetComponentWithPath(self.root, "Center/MaJong/Color", ComponentTypeName.Transform).gameObject

            self.mj3dSkinType1 = GetComponentWithPath(self.root, "Center/MaJong/3dSkin/ToggleGroup/ToggleType1", ComponentTypeName.Toggle)
            self.mj3dSkinType2 = GetComponentWithPath(self.root, "Center/MaJong/3dSkin/ToggleGroup/ToggleType2", ComponentTypeName.Toggle)
            self.mj3dSkinType3 = GetComponentWithPath(self.root, "Center/MaJong/3dSkin/ToggleGroup/ToggleType3", ComponentTypeName.Toggle)

            if self.mj2dOr3d == 1 then
                self.mj3dSkin:SetActive(true)
                self.sizeObj:SetActive(false)
                self.colorObj:SetActive(false)
            else
                self.mj3dSkin:SetActive(false)
                self.sizeObj:SetActive(true)
                self.colorObj:SetActive(true)
            end

            --self.mj2dOr3d
            self.majiangInit = true
        end

        switcher:SwitchState("Majong");
        self:ShowWindow(2)
        self:SetLabel(2)
    elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_RUNFAST" then
		if not self.RunfastInit then
			local strSettingPath = "runfast/module/roomsetting/runfastpokersetting.prefab"
			if intentData.wanfa and intentData.wanfa == "dali" then
				strSettingPath = "quickrun/module/roomsetting/runfastpokersetting.prefab"
			end
            local Runfast =  ModuleCache.ViewUtil.InitViewGameObject(strSettingPath, "RunfastPokerSetting", 1); --同步加载
            Runfast.name = "Runfast"
            Runfast.transform.parent = self._parent
            self.GoRunfast = GetComponentWithPath(self.root, "Center/"..Runfast.name, ComponentTypeName.Transform).gameObject
            self.togleCount_Runfast = 2
            self.togleRunfastArr = {}
            for i = 1, self.togleCount_Runfast do
                self.togleRunfastArr[i] = GetComponentWithPath(self.root, "Center/"..Runfast.name.."/Size/ToggleGroup/Toggle"..i, ComponentTypeName.Toggle)
            end
            self.RunfastInit = true
        end
        switcher:SwitchState("RUNFAST")
        self:ShowWindow(6)
        self:SetLabel(6)
    elseif(intentData.openCommonPokerFaceChange)then
        switcher:SwitchState("CommonPoker")
        self:SetLabel(7)
        self:ShowWindow(7)
        self:RefreshCommonPokerFaceSettingPanel()
    end

    if(not othersActive) then
        if( intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_MJ") then
            if not self.majiangInit then
                local packageName = self.majiangPackageName or 'majiang'
                local majong =  ModuleCache.ViewUtil.InitViewGameObject(packageName .. "/module/setting/majong.prefab", "MaJong", 1); --同步加载
                majong.name = "MaJong"
                majong.transform.parent = self._parent

                self.goMajongSetting     = GetComponentWithPath(self.root, "Center/MaJong", ComponentTypeName.Transform).gameObject

                self.greenPanel          = GetComponentWithPath(self.root, "Center/MaJong/Size/MaJongShow/Green", ComponentTypeName.Transform).gameObject
                self.yellowPanel         = GetComponentWithPath(self.root, "Center/MaJong/Size/MaJongShow/Yellow", ComponentTypeName.Transform).gameObject
                self.type3TextPanel          = GetComponentWithPath(self.root, "Center/MaJong/Size/MaJongShow/Type3", ComponentTypeName.Transform).gameObject

                self.smallPanel          = GetComponentWithPath(self.root, "Center/MaJong/Color/MajongShow/Small", ComponentTypeName.Transform).gameObject
                self.bigPanel            = GetComponentWithPath(self.root, "Center/MaJong/Color/MajongShow/Big", ComponentTypeName.Transform).gameObject
                self.type3ColorPanel       = GetComponentWithPath(self.root, "Center/MaJong/Color/MajongShow/Type3", ComponentTypeName.Transform).gameObject

                self.togleMajongTextBig  = GetComponentWithPath(self.root, "Center/MaJong/Size/ToggleGroup/ToggleBig", ComponentTypeName.Toggle)
                self.togleMajongTextSmall= GetComponentWithPath(self.root, "Center/MaJong/Size/ToggleGroup/ToggleSmall", ComponentTypeName.Toggle)
                self.togleMajongTextType3 = GetComponentWithPath(self.root, "Center/MaJong/Size/ToggleGroup/ToggleType3", ComponentTypeName.Toggle)

                self.togleMajongGreen    = GetComponentWithPath(self.root, "Center/MaJong/Color/ToggleGroup/ToggleGreen", ComponentTypeName.Toggle)
                self.togleMajongYellow   = GetComponentWithPath(self.root, "Center/MaJong/Color/ToggleGroup/ToggleYellow", ComponentTypeName.Toggle)
                self.togleMajongType3 = GetComponentWithPath(self.root, "Center/MaJong/Color/ToggleGroup/ToggleType3", ComponentTypeName.Toggle)

                self.mj3dSkin = GetComponentWithPath(self.root, "Center/MaJong/3dSkin", ComponentTypeName.Transform).gameObject
                self.sizeObj = GetComponentWithPath(self.root, "Center/MaJong/Size", ComponentTypeName.Transform).gameObject
                self.colorObj = GetComponentWithPath(self.root, "Center/MaJong/Color", ComponentTypeName.Transform).gameObject

                self.mj3dSkinType1 = GetComponentWithPath(self.root, "Center/MaJong/3dSkin/ToggleGroup/ToggleType1", ComponentTypeName.Toggle)
                self.mj3dSkinType2 = GetComponentWithPath(self.root, "Center/MaJong/3dSkin/ToggleGroup/ToggleType2", ComponentTypeName.Toggle)

                if self.mj2dOr3d == 1 then
                    self.mj3dSkin:SetActive(true)
                    self.sizeObj:SetActive(false)
                    self.colorObj:SetActive(false)
                else
                    self.mj3dSkin:SetActive(false)
                    self.sizeObj:SetActive(true)
                    self.colorObj:SetActive(true)
                end

                self.majiangInit = true
            end

            switcher:SwitchState("Majong");
            self:ShowWindow(1)
            self:SetLabel(1)
        elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_PHZ" then
            if not self.zipaiInit then
                local zipai =  ModuleCache.ViewUtil.InitViewGameObject("paohuzi/module/setting/zipai.prefab", "ZiPai", 1); --同步加载
                zipai.name = "ZiPai"
                zipai.transform.parent =self._parent

                self.goZiPai       = GetComponentWithPath(self.root, "Center/ZiPai", ComponentTypeName.Transform).gameObject
                self.togleZiPaiMen = {}
                self.togleZiPaiMen[1] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle1", ComponentTypeName.Toggle)
                self.togleZiPaiMen[2] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle2", ComponentTypeName.Toggle)
                self.togleZiPaiMen[3] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle3", ComponentTypeName.Toggle)
                self.goZiPai_ZheDang       = GetComponentWithPath(self.root, "Center/ZiPai/ZheDang", ComponentTypeName.Button)

                self.zipaiInit = true
            end

			switcher:SwitchState("ZiPai");
		elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_HuZi" then		--别删 不然会进入else入口
		elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_HuaZhiPai" then		--别删 不然会进入else入口
		elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_HuaZhiPai_SWJ" then		--别删 不然会进入else入口
        elseif intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_RUNFAST" then
            if not self.RunfastInit then
                local strSettingPath = "runfast/module/roomsetting/runfastpokersetting.prefab"
				if intentData.wanfa and intentData.wanfa == "dali" then
					strSettingPath = "quickrun/module/roomsetting/runfastpokersetting.prefab"
				end
				local Runfast =  ModuleCache.ViewUtil.InitViewGameObject(strSettingPath, "RunfastPokerSetting", 1); --同步加载
                Runfast.name = "Runfast"
                Runfast.transform.parent = self._parent
                self.GoRunfast = GetComponentWithPath(self.root, "Center/"..Runfast.name, ComponentTypeName.Transform).gameObject
                self.togleCount_Runfast = 2
                self.togleRunfastArr = {}
                for i = 1, self.togleCount_Runfast do
                    self.togleRunfastArr[i] = GetComponentWithPath(self.root, "Center/"..Runfast.name.."/Size/ToggleGroup/Toggle"..i, ComponentTypeName.Toggle)
                end
                self.RunfastInit = true
            end
            switcher:SwitchState("RUNFAST")
            self:ShowWindow(6)
            self:SetLabel(6)
        elseif(intentData.openCommonPokerFaceChange)then
            switcher:SwitchState("CommonPoker")
            self:SetLabel(7)
            self:ShowWindow(7)
            self:RefreshCommonPokerFaceSettingPanel()
        elseif intentData.GameName == "HuaPai" then
           
            if not self.zipaiInit then
                local zipai =  ModuleCache.ViewUtil.InitViewGameObject("huapai/module/setting/zipai.prefab", "ZiPai", 1); --同步加载
                zipai.name = "ZiPai"
                zipai.transform.parent =self._parent
    
                self.goZiPai       = GetComponentWithPath(self.root, "Center/ZiPai", ComponentTypeName.Transform).gameObject
                self.togleZiPaiMen = {}
                self.togleZiPaiMen[1] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle1", ComponentTypeName.Toggle)
                self.togleZiPaiMen[2] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle2", ComponentTypeName.Toggle)
                self.togleZiPaiMen[3] = GetComponentWithPath(self.root, "Center/ZiPai/Size/ToggleGroup/Toggle3", ComponentTypeName.Toggle)
                self.goZiPai_ZheDang       = GetComponentWithPath(self.root, "Center/ZiPai/ZheDang", ComponentTypeName.Button)
    
                self.zipaiInit = true
            end
    
            switcher:SwitchState("ZiPai");
        else
            switcher:SwitchState("Poker");
            self:SetLabel(2)
        end
    end

    ModuleCache.ComponentUtil.SafeSetActive(self.buttonExitRoom.gameObject, intentData.canExitRoom)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonDissolveRoom.gameObject, intentData.canDissolveRoom)
    local tableBg = self.mjBgSet or PlayerPrefs.GetInt(intentData.tableBackgroundSpriteSetName, 1)

    if self.intentData.is3D == 1 then
        local GameID = AppData.get_app_and_game_name()
        local def3dOr2d = intentData.def3dOr2d
        local gameType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
        if self.curTableData and self.curTableData.ruleJsonInfo then
            gameType = self.curTableData.ruleJsonInfo.GameType
        end
        self.mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",gameType)
        if intentData.mj2dOr3dSetKey then
            self.mj2dOr3dSetKey = intentData.mj2dOr3dSetKey
        end
        self.mj2dOr3d = PlayerPrefs.GetInt(self.mj2dOr3dSetKey, def3dOr2d)
    else
        self.mj2dOr3d = 0
    end

    self:refresh_bg(intentData.CurUseBgId or tableBg)

    self:refresh_mj_3d_or_2d(self.mj2dOr3d)


    local key = string.format("%s_Mj3dLayoutSetting",ModuleCache.GameManager.curGameId)
    local layoutType = PlayerPrefs.GetInt(key,self:check3dLayout(self:getDefTableLayoutType()))
    layoutType = self:check3dLayout(layoutType)
    self:refresh_mj_3d_layout((1 ~= self.mj2dOr3d) and 0 or layoutType)


    local key = string.format("%s_Mj3dStyleSetting",ModuleCache.GameManager.curGameId)
    local tableStyle = PlayerPrefs.GetInt(key,self:check3dTableStyle(self:getDefTableStyleType()))
    tableStyle = self:check3dTableStyle(tableStyle)
    self:refresh_mj_3d_table_style((1 ~= self.mj2dOr3d) and 0 or tableStyle)

    self:refresh_zipai()
	self:refresh_huapai()
    self:refreshVolumes()
end

function RoomSettingView:GetOtherWindowActiveState()
    if(self.goGameSetting.activeSelf) then
        return true;
    elseif(self.goSoundSetting.activeSelf) then
        return true;
    elseif(self.goBackgroundSetting.activeSelf) then
        return true;
    elseif(self.TableBgSelect.activeSelf) then
        return true;
    end
    return false;
end

function RoomSettingView:refresh_bg(tableBg,is3D)
    ComponentUtil.SafeSetActive(self.goBgSelect1, tableBg == 1)
    ComponentUtil.SafeSetActive(self.goBgSelect2, tableBg == 2)
    ComponentUtil.SafeSetActive(self.goBgSelect3, tableBg == 3)
end

function RoomSettingView:refresh_mj_3d_or_2d(is3D)
    if 0 == is3D then
        local pos = self.ButtonBg1.transform.localPosition
        pos.y = 12
        self.ButtonBg1.transform.localPosition = pos
        pos = self.ButtonBg2.transform.localPosition
        pos.y = 12
        self.ButtonBg2.transform.localPosition = pos
        pos = self.ButtonBg3.transform.localPosition
        pos.y = 12
        self.ButtonBg3.transform.localPosition = pos
    end
    if self.intentData.table3dStyles then
        is3D = 0  ---现在的需求，当有牌桌风格切换配置时关闭设置界面2D，3D切换的Toggle
    end
    ComponentUtil.SafeSetActive(self.Button2d, is3D ~= 0)
    ComponentUtil.SafeSetActive(self.Button3d, is3D ~= 0)
    ComponentUtil.SafeSetActive(self.goSelect3d, is3D == 1)
    ComponentUtil.SafeSetActive(self.goSelect2d, is3D == 2)
end

-----------------Begin 3D 麻将布局切换相关------------------------------------------------------------------------------
function RoomSettingView:check3dLayout(layoutType)
    local layout3dTypes = self.intentData.layout3dTypes
    if not layout3dTypes or #layout3dTypes == 0 then
        layoutType = 1
    elseif #layout3dTypes == 1 then
        layoutType = layout3dTypes[1]
    else
        local isHas = false
        for i=1,#layout3dTypes do
            if layoutType == layout3dTypes[i] then
                isHas = true
                break
            end
        end
        if not isHas then
            layoutType = layout3dTypes[1]
        end
    end
    return layoutType
end
---获取3D麻将默认设置
function RoomSettingView:getDefTableLayoutType()
    if self.intentData.layout3dTypes
            and #self.intentData.layout3dTypes > 0 then
        return self.intentData.layout3dTypes[1]
    end
    return 1
end
function RoomSettingView:refresh_mj_3d_layout(layoutType)
    if not self.intentData.layout3dTypes or #self.intentData.layout3dTypes <= 1 then
        layoutType = 0
    end
    ComponentUtil.SafeSetActive(self.Button3dLayout1, layoutType ~= 0)
    ComponentUtil.SafeSetActive(self.Button3dLayout2, layoutType ~= 0)
    ComponentUtil.SafeSetActive(self.goSelect3dLayout1, layoutType == 1)
    ComponentUtil.SafeSetActive(self.goSelect3dLayout2, layoutType == 2)
end
--------------------End 3D 麻将布局切换相关------------------------------------------------------


-----------------Begin 3D 麻将牌桌风格切换相关--------------------------------------------------------------------------
function RoomSettingView:check3dTableStyle(tableStyle)
    local table3dStyles = self.intentData.table3dStyles
    if not table3dStyles or #table3dStyles == 0 then
        tableStyle = 1
    elseif #table3dStyles == 1 then
        tableStyle = table3dStyles[1]
    else
        local isHas = false
        for i=1,#table3dStyles do
            if tableStyle == table3dStyles[i] then
                isHas = true
                break
            end
        end
        if not isHas then
            tableStyle = table3dStyles[1]
        end
    end
    return tableStyle
end
---获取3D麻将默认设置
function RoomSettingView:getDefTableStyleType()
    if self.intentData.table3dStyles
            and #self.intentData.table3dStyles > 0 then
        return self.intentData.table3dStyles[1]
    end
    return 1
end
function RoomSettingView:refresh_mj_3d_table_style(tableStyle)
    if not self.intentData.table3dStyles or #self.intentData.table3dStyles <= 1 then
        tableStyle = 0
    end
    ComponentUtil.SafeSetActive(self.Button3dStyle1, tableStyle ~= 0)
    ComponentUtil.SafeSetActive(self.Button3dStyle2, tableStyle ~= 0)
    ComponentUtil.SafeSetActive(self.goSelect3dStyle1, tableStyle == 1)
    ComponentUtil.SafeSetActive(self.goSelect3dStyle2, tableStyle == 2)
end
-----------------End 3D 麻将牌桌风格切换相关----------------------------------------------------------------------------


function RoomSettingView:refresh_zipai()
	if self.intentData.tableBackgroundSpriteSetName ~= "RoomSetting_TableBackground_Name_PHZ" and 
	   self.intentData.tableBackgroundSpriteSetName ~= "RoomSetting_TableBackground_Name_HuZi" then
        return
    end

    local zipai = PlayerPrefs.GetInt('ZP_ZPPaiLei' .. AppData.Game_Name, 1)

    for i=1,#self.togleZiPaiMen do
        self.togleZiPaiMen[i].isOn = false
    end
    self.togleZiPaiMen[zipai].isOn = true

	--胡子 手牌有位置
	if self.intentData.tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_HuZi" then
		local posKan = PlayerPrefs.GetInt('ZP_ZPKanPos' .. AppData.Game_Name, 1)
		for i=1,#self.huzi_toggle_KanPos do
			self.huzi_toggle_KanPos[i].isOn = false
		end
		self.huzi_toggle_KanPos[posKan].isOn = true
	end
end

function RoomSettingView:refresh_huapai()
	if self.intentData.tableBackgroundSpriteSetName ~= "RoomSetting_TableBackground_Name_HuaZhiPai" then
        return
    end

	--牌面类型
    for i=1,#self.togleZiPaiMen do
        self.togleZiPaiMen[i].isOn = false
	end
	local paiType = PlayerPrefs.GetInt('HP_HPPaiLei' .. AppData.Game_Name, 1)
    self.togleZiPaiMen[paiType].isOn = true

	--出牌类型
	for i=1,#self.huazhipai_toggle_chuType do
        self.huazhipai_toggle_chuType[i].isOn = false
	end
	local chuType = PlayerPrefs.GetInt('HP_HuaPaiChuType' .. AppData.Game_Name, 1)
    self.huazhipai_toggle_chuType[chuType].isOn = true
end

function RoomSettingView:refreshVolumes()
    self:refresh_music_volume()
    self:refresh_sound_volume()
    self:refresh_location_settting()
    self:refresh_recommend_out_pai_setting()
    self:refresh_brief_resul_setting()
    self:refresh_one_click_out_mj_setting()
    self:refresh_Majong()
    self:refresh_YuYin()
    self:refresh_ZhenDong()
    self:refresh_guo_hu()
    self:refresh_fast()
    self:refreshAppdata()
end

function RoomSettingView:refresh_Majong()
    if(not self.curTableData or self.intentData.tableBackgroundSpriteSetName ~= "RoomSetting_TableBackground_Name_MJ") then
        return
    end

    self:SetMajongColor(self.mjColorSet)
    self:SetMajongTextSize(self.mjScaleSet)

    self.togleMajongGreen.isOn = self.mjColorSet == 0;
    self.togleMajongYellow.isOn = self.mjColorSet == 1;
    self.togleMajongType3.isOn =  self.mjColorSet == 2;

    self.togleMajongTextBig.isOn = self.mjScaleSet == 0;
    self.togleMajongTextSmall.isOn = self.mjScaleSet == 1;
    self.togleMajongTextType3.isOn = self.mjScaleSet == 2;

    self.mj3dSkinType1.isOn = self.mj3dSkinType == 1;
    self.mj3dSkinType2.isOn = self.mj3dSkinType == 2;
    self.mj3dSkinType3.isOn = self.mj3dSkinType == 3;

end

function RoomSettingView:refresh_fast()
    local openFast = (PlayerPrefs.GetInt("openFast", 1) == 1)
    local select = GetComponentWithPath(self.toggleFast.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleFast.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleFast.isOn = not openFast
    ComponentUtil.SafeSetActive(select, not openFast)
    ComponentUtil.SafeSetActive(unselect, openFast)
end

function RoomSettingView:refresh_guo_hu()
    local openGuoHu = (PlayerPrefs.GetInt("openGuoHu", self.intentData.defGuoHu or 1) == 1)
    local select = GetComponentWithPath(self.toggleGuoHu.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleGuoHu.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    --self.toggleGuoHu.isOn = not openGuoHu
    ComponentUtil.SafeSetActive(select, not openGuoHu)
    ComponentUtil.SafeSetActive(unselect, openGuoHu)
end

function RoomSettingView:refresh_YuYin()
    local value = ModuleCache.SoundManager.get_record_voice_volume()
    local select = GetComponentWithPath(self.toggleYuYin.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleYuYin.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleYuYin.isOn = (value <= 0)
    ComponentUtil.SafeSetActive(select, value <= 0)
    ComponentUtil.SafeSetActive(unselect, value > 0)
    self.sliderYuYin.value = value
end

function RoomSettingView:refresh_ZhenDong()
    local openShake = (PlayerPrefs.GetInt("openShake", 1) == 1)
    local select = GetComponentWithPath(self.toggleZhenDong.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleZhenDong.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleZhenDong.isOn = not openShake
    ComponentUtil.SafeSetActive(select, not openShake)
    ComponentUtil.SafeSetActive(unselect, openShake)
end

function RoomSettingView:refresh_music_volume()
    local value = ModuleCache.SoundManager.get_music_volume()
    local select = GetComponentWithPath(self.toggleMusic.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleMusic.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleMusic.isOn = (value <= 0)
    ComponentUtil.SafeSetActive(select, value <= 0)
    ComponentUtil.SafeSetActive(unselect, value > 0)
    self.sliderMusic.value = value;
end

---刷新方言设置相关设置
function RoomSettingView:refresh_location_settting()
    local isOpen = self.intentData.isOpenLocationSetting
    local defSetting = self.intentData.defLocationSetting  or 0
    if isOpen then
        self.goLocationSetting:SetActive(true)
        local key = string.format("%s_LocationSetting",ModuleCache.GameManager.curGameId)
        local curLocationSetting = PlayerPrefs.GetInt(key,defSetting)
        if 0 ==  curLocationSetting then
            self.commonCheckMark:SetActive(true)
            self.locationCheckMark:SetActive(false)
        elseif 1 == curLocationSetting then
            self.commonCheckMark:SetActive(false)
            self.locationCheckMark:SetActive(true)
        end
    else
        self.goLocationSetting:SetActive(false)
    end
end

---刷新推荐出牌相关控件状态
function RoomSettingView:refresh_recommend_out_pai_setting()
    local isOpen = self.intentData.IsOpenRecommendOutPaiSetting
    local defSetting = self.intentData.defRecommendOutPaiSetting  or 0
    if isOpen then
        self.goRecommendOutPaiSetting:SetActive(true)
        local key = string.format("%s_IsRecommendOutPai",ModuleCache.GameManager.curGameId)
        local curRecommendOutPaiSetting = PlayerPrefs.GetInt(key,defSetting)
        if 0 ==  curRecommendOutPaiSetting then
            self.RecommendNoCheckMark:SetActive(true)
            self.RecommendOkCheckMark:SetActive(false)
        elseif 1 == curRecommendOutPaiSetting then
            self.RecommendNoCheckMark:SetActive(false)
            self.RecommendOkCheckMark:SetActive(true)
        end
    else
        self.goRecommendOutPaiSetting:SetActive(false)
    end
end

---刷新简略小结算相关
function  RoomSettingView:refresh_brief_resul_setting()
    local isOpen = self.intentData.useBriefOneGameResult
    if isOpen then
        self.goBriefResulSetting:SetActive(true)
        local key = string.format("%s_useBriefOneGameResult",ModuleCache.GameManager.curGameId)
        local useBriefOneGameResultSetting = PlayerPrefs.GetInt(key,1)
        if 1 ==  useBriefOneGameResultSetting then
            self.BriefResulOkCheckMark:SetActive(true)
            self.BriefResulNoCheckMark:SetActive(false)
        elseif 0 == useBriefOneGameResultSetting then
            self.BriefResulOkCheckMark:SetActive(false)
            self.BriefResulNoCheckMark:SetActive(true)
        end
    else
        self.goBriefResulSetting:SetActive(false)
    end
end

---刷新单击麻将出牌相关
function  RoomSettingView:refresh_one_click_out_mj_setting()
    local isOpen = self.intentData.useOneClickOutMj
    if isOpen then
        self.goOneClickOutMjSetting:SetActive(true)
        local key = string.format("%s_useOneClickOutMj",ModuleCache.GameManager.curGameId)
        local useOneClickOutMjSetting = PlayerPrefs.GetInt(key,0)
        if 1 ==  useOneClickOutMjSetting then
            self.OneClickOutMjOkCheckMark:SetActive(true)
            self.OneClickOutMjNoCheckMark:SetActive(false)
        elseif 0 == useOneClickOutMjSetting then
            self.OneClickOutMjOkCheckMark:SetActive(false)
            self.OneClickOutMjNoCheckMark:SetActive(true)
        end
    else
        self.goOneClickOutMjSetting:SetActive(false)
    end
end

function RoomSettingView:refresh_sound_volume()
    local value = ModuleCache.SoundManager.get_sound_volume()
    local select = GetComponentWithPath(self.toggleSound.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleSound.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleSound.isOn = (value <= 0)
    ComponentUtil.SafeSetActive(select, value <= 0)
    ComponentUtil.SafeSetActive(unselect, value > 0)
    self.sliderSound.value = value;
end

function RoomSettingView:refreshAppdata()
    self.textAppLv.text = "App版本号: "..ModuleCache.GameManager.appVersion
    self.textResLv.text = "Res版本号: "..(ModuleCache.GameManager.appAssetVersion or "0")
    self.packageResLv.text = "Package版本号: "..(ModuleCache.GameManager.get_cur_package_version() or "0")
end

function RoomSettingView:HideAllWindows()
    if self.goMajongSetting then
        self.goMajongSetting:SetActive(false);
    end

    self.goSoundSetting:SetActive(false)
    self.goGameSetting:SetActive(false)
    self.goBackgroundSetting:SetActive(false)
    self:SetActive_TableBgSelect(false)
    if self.goZiPai then
        self.goZiPai:SetActive(false)
    end
    if(self.GoRunfast) then
        self.GoRunfast:SetActive(false)
    end
    if(self.goCommonPokerFaceSetting) then
        self.goCommonPokerFaceSetting:SetActive(false)
    end
end

function RoomSettingView:ShowWindow(index)
    self:HideAllWindows();
    if(index == 1) then
        if self.goMajongSetting then
            self.goMajongSetting:SetActive(true);
        end
    elseif(index == 2) then
        self.goBackgroundSetting:SetActive(true)
        self:RefreshTableBgSelect()
    elseif(index == 3) then
        self.goSoundSetting:SetActive(true)
        self:InitSoundSilders();
    elseif(index == 4) then
        self.goGameSetting:SetActive(true)
    elseif(index == 5) then
        if self.goZiPai then
            self.goZiPai:SetActive(true)
        end
    elseif(index == 6) then
        if(self.GoRunfast) then
            self.GoRunfast:SetActive(true)
        end
    elseif(index == 7) then
        if(self.goCommonPokerFaceSetting) then
            self.goCommonPokerFaceSetting:SetActive(true)
        end
    end
    print(" index : "..tostring(index))
end

function RoomSettingView:InitSoundSilders()
    local soundValue = ModuleCache.SoundManager.get_sound_volume();
    local musicValue = ModuleCache.SoundManager.get_music_volume();
    self.sliderMusic.value = musicValue;
    self.sliderSound.value = soundValue;
end

function RoomSettingView:ResetAllLabels()
    self.labelMajiang:SetActive(false);
    self.labelBackground:SetActive(false);
    self.labelMusic:SetActive(false);
    self.labelGame:SetActive(false);
    if self.labelZiPai then
        self.labelZiPai:SetActive(false);
    end
    self.labelRunfast:SetActive(false);
    self.labelCommonPoker:SetActive(false);
end

function RoomSettingView:SetLabel(index)
    self:ResetAllLabels();
    if(index == 1) then
        self.labelMajiang:SetActive(true);
    elseif(index == 2) then
        self.labelBackground:SetActive(true);
    elseif(index == 3) then
        self.labelMusic:SetActive(true);
    elseif(index == 4) then
        self.labelGame:SetActive(true);
    elseif(index == 5) then
        self.labelZiPai:SetActive(true);
    elseif(index == 6) then
        self.labelRunfast:SetActive(true);
    elseif(index == 7) then
        self.labelCommonPoker:SetActive(true);
    end
end

function RoomSettingView:SetMajongColor(colorIndex) -- 0为绿色 1为黄色 --2为Type3
    if(colorIndex == 0) then
        self.greenPanel:SetActive(true)
        self.yellowPanel:SetActive(false)
        self.type3TextPanel:SetActive(false)
    elseif(colorIndex == 1) then
        self.greenPanel:SetActive(false)
        self.yellowPanel:SetActive(true)
        self.type3TextPanel:SetActive(false)
    elseif(colorIndex == 2) then
        self.greenPanel:SetActive(false)
        self.yellowPanel:SetActive(false)
        self.type3TextPanel:SetActive(true)
    end
end

function RoomSettingView:SetMajongTextSize(sizeIndex) --0为大，1为小 2为Type3
    if(sizeIndex == 1) then
        self.smallPanel:SetActive(true)
        self.bigPanel:SetActive(false)
        self.type3ColorPanel:SetActive(false)
    elseif(sizeIndex == 0) then
        self.smallPanel:SetActive(false)
        self.bigPanel:SetActive(true)
        self.type3ColorPanel:SetActive(false)
    elseif (sizeIndex == 2) then
        self.smallPanel:SetActive(false)
        self.bigPanel:SetActive(false)
        self.type3ColorPanel:SetActive(true)
    end
end

function RoomSettingView:SetRunfastInitToggle(StyleType)
    local togleRunfastArr = self.togleRunfastArr
    for i = 1, #togleRunfastArr do
        local togle = togleRunfastArr[i]
        togle.isOn = (i == StyleType)
    end
end

function RoomSettingView:RefreshCommonPokerFaceSettingPanel(toggle)
    local intentData = self.intentData
    if(intentData.openCommonPokerFaceChange)then
        local commonPokerSettingData = intentData.commonPokerSettingData
        local lastAssetHolder = commonPokerSettingData.lastAssetHolder
        if(not self.commponPokerSettingHolderList)then
            self.commponPokerSettingHolderList = {}
            local codeList = commonPokerSettingData.pokerCodeList
            local get_sprite_by_code_fun = commonPokerSettingData.get_sprite_by_code_fun
            local on_change_poker_face = commonPokerSettingData.on_change_poker_face
            local pokerDataList = commonPokerSettingData.pokerDataList
            for i = 1, #pokerDataList do
                local pokerData = pokerDataList[i]
                local holder = {}
                holder.on_change_poker_face = on_change_poker_face
                holder.assetHolder = pokerData.assetHolder
                ComponentUtil.SafeSetActive(self.toggle_commonPokerFace.gameObject, false)
                local go = ModuleCache.ComponentUtil.InstantiateLocal(self.toggle_commonPokerFace.gameObject, self.toggle_commonPokerFace.transform.parent.gameObject)
                ComponentUtil.SafeSetActive(go, true)
                holder.root = go
                holder.toggle = go:GetComponent(ComponentTypeName.Toggle)
                local goPoker = GetComponentWithPath(go, "Pokers/Poker", ComponentTypeName.Transform).gameObject
                ComponentUtil.SafeSetActive(goPoker, false)
                for j = 1, #codeList do
                    local tmpGoPoker = ModuleCache.ComponentUtil.InstantiateLocal(goPoker, goPoker.transform.parent.gameObject)
                    ComponentUtil.SafeSetActive(tmpGoPoker, true)
                    local image = GetComponentWithPath(tmpGoPoker, "Image", ComponentTypeName.Image)
                    image.sprite = get_sprite_by_code_fun(codeList[j], holder.assetHolder)
                end
                table.insert(self.commponPokerSettingHolderList, holder)
            end
        end
        for i = 1, #self.commponPokerSettingHolderList do
            local holder = self.commponPokerSettingHolderList[i]
            if(not toggle and lastAssetHolder and lastAssetHolder == holder.assetHolder)then
                toggle = holder.toggle
            end
            holder.toggle.isOn = holder.toggle == toggle
        end
        if(not toggle)then
            local holder = self.commponPokerSettingHolderList[1]
            if(holder)then
                holder.toggle.isOn = true
            end
        end
    end
end



function RoomSettingView:RefreshTableBgSelect()
    if(self.intentData.IsOpenTableBgSelect) then
        self:SetActive_TableBgSelect(true)
        self.Btn2D_ViewImage.sprite = self.intentData.TableBgSelect_2DViewSprite
        self.Btn3D_ViewImage.sprite = self.intentData.TableBgSelect_3DViewSprite
        local tableBackgroundSpriteSetName = self.intentData.tableBackgroundSpriteSetName
        if(tableBackgroundSpriteSetName == "RoomSetting_TableBackground_Name_RUNFAST") then
            local ChangJingKey = self:GetChangJingKey(tableBackgroundSpriteSetName)
            local ZhuoBuKey = self:GetZhuoBuKey(tableBackgroundSpriteSetName)
            local CurUseChangJingIndex = UnityEngine.PlayerPrefs.GetInt(ChangJingKey)
            local CurUseZhuoBuIndex = UnityEngine.PlayerPrefs.GetInt(ZhuoBuKey)
            --print("===CurUseChangJingIndex="..CurUseChangJingIndex," CurUseZhuoBuIndex="..CurUseZhuoBuIndex)

            self.Btn2D_SelectGo.gameObject:SetActive(CurUseChangJingIndex == 2)
            self.Btn3D_SelectGo.gameObject:SetActive(CurUseChangJingIndex == 3)

            local SpriteList
            if(CurUseChangJingIndex == 2) then
                SpriteList = self.intentData.TableBgSelect_2DSpriteList
            elseif(CurUseChangJingIndex == 3) then
                SpriteList = self.intentData.TableBgSelect_3DSpriteList
            end

            if(SpriteList and #SpriteList > 0) then
                local SlotList = self.TableBgSelectSlotList
                for i = 1, #SlotList do
                    local Slot = SlotList[i]
                    if(i <= #SpriteList) then
                        local Sprite = SpriteList[i]
                        Slot.gameObject:SetActive(true)
                        local ZhuoBuImage = GetComponentWithPath(Slot,"mask/ZhuoBuImage", ComponentTypeName.Image)
                        ZhuoBuImage.sprite = Sprite
                        local Selected = GetComponentWithPath(Slot,"mask/ZhuoBuImage/Selected", ComponentTypeName.Transform).gameObject
                        Selected.gameObject:SetActive(false)
                        if(i == CurUseZhuoBuIndex) then
                            Selected.gameObject:SetActive(true)
                        end
                    else
                        Slot.gameObject:SetActive(false)
                    end
                end
            end
        end
    else
        self:SetActive_TableBgSelect(false)
    end
end


function RoomSettingView:SetActive_TableBgSelect(IsActive)
    self.TableBgSelect.gameObject:SetActive(IsActive)
end

function RoomSettingView:GetChangJingKey(Name)
    Name = Name or self.intentData.tableBackgroundSpriteSetName
    return Name .. "_ChangJingId"
end

function RoomSettingView:GetZhuoBuKey(Name)
    Name = Name or self.intentData.tableBackgroundSpriteSetName
    return Name .. "_ZhuoBuId"
end

function RoomSettingView:GetChangJingId(Key)
    Key = Key or self:GetChangJingKey()
    return UnityEngine.PlayerPrefs.GetInt(Key)
end

function RoomSettingView:GetZhuoBuId(Key)
    Key = Key or self:GetZhuoBuKey()
    return UnityEngine.PlayerPrefs.GetInt(Key)
end


function RoomSettingView:TableBgSelect_ChangJing(ChangJingIndex)
    --index: 2代表2D,3代表3D
    local CurUseChangJingIndex = self:GetChangJingId()
    local CurUseZhuoBuIndex = self:GetZhuoBuId()

    self.Btn2D_SelectGo.gameObject:SetActive(CurUseChangJingIndex == 2)
    self.Btn3D_SelectGo.gameObject:SetActive(CurUseChangJingIndex == 3)

    local SpriteList
    if(CurUseChangJingIndex == 2) then
        SpriteList = self.intentData.TableBgSelect_2DSpriteList
    elseif(CurUseChangJingIndex == 3) then
        SpriteList = self.intentData.TableBgSelect_3DSpriteList
    end

    if(SpriteList and #SpriteList > 0) then
        local SlotList = self.TableBgSelectSlotList
        for i = 1, #SlotList do
            local Slot = SlotList[i]
            if(i <= #SpriteList) then
                local Sprite = SpriteList[i]
                Slot.gameObject:SetActive(true)
                local ZhuoBuImage = GetComponentWithPath(Slot,"mask/ZhuoBuImage", ComponentTypeName.Image)
                ZhuoBuImage.sprite = Sprite
                local Selected = GetComponentWithPath(Slot,"mask/ZhuoBuImage/Selected", ComponentTypeName.Transform).gameObject
                Selected.gameObject:SetActive(false)
                if(i == CurUseZhuoBuIndex) then
                    Selected.gameObject:SetActive(true)
                end
            else
                Slot.gameObject:SetActive(false)
            end
        end
    end
end

function RoomSettingView:TableBgSelect_ZhuoBu(ZhuoBuIndex)
    print("====选择桌布=",ZhuoBuIndex)
    UnityEngine.PlayerPrefs.SetInt(self:GetZhuoBuKey(), ZhuoBuIndex)
    self:RefreshTableBgSelect()
end

return RoomSettingView