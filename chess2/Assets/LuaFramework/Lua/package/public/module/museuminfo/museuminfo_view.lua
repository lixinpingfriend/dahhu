
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumInfoView = Class('museumInfoView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local PlayModeUtil = ModuleCache.PlayModeUtil
local Manager = require("manager.function_manager")

function MuseumInfoView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museuminfo/public_museuminfo.prefab", "Public_MuseumInfo", 1)
    View.set_1080p(self)
    self.UIStateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    self.imageHead = GetComponentWithPath(self.root, "Top/CustomSetting/InfoBg/Mask/Head", ComponentTypeName.Image)
    self.textPowerNum = GetComponentWithPath(self.root, "Top/Child/RoomCard/TextNum", ComponentTypeName.Text)
    self.inputFieldNum = GetComponentWithPath(self.root, "Top/CustomSetting/InfoBg/Mask/Image/Name", ComponentTypeName.Text)--GetComponentWithPath(self.root, "Top/CustomSetting/InfoBg/InputFieldNum", ComponentTypeName.InputField)

    self.inputFieldMember = GetComponentWithPath(self.root, "Top/CustomSetting/InfoBg/InputFieldMember", ComponentTypeName.InputField)
    self.inputFieldMemberBtn = GetComponentWithPath(self.inputFieldMember.gameObject, "ButtonAdd", ComponentTypeName.Button)

    self.inputFieldName = GetComponentWithPath(self.root, "Top/CustomSetting/InfoBg/InputFieldName", ComponentTypeName.InputField)
    self.inputFieldNameBtn = GetComponentWithPath(self.inputFieldName.gameObject, "ButtonEditor", ComponentTypeName.Button)

    self.inputFieldID = GetComponentWithPath(self.root, "Top/CustomSetting/InfoBg/InputFieldID", ComponentTypeName.InputField)
    self.inputFieldIDBtn = GetComponentWithPath(self.inputFieldID.gameObject, "ButtonEditor_ID", ComponentTypeName.Button)

    self.inputFieldWXNum = GetComponentWithPath(self.root, "Top/CustomSetting/InfoBg/InputFieldWXNum", ComponentTypeName.InputField)
    self.inputFieldWXNumBtn = GetComponentWithPath(self.inputFieldWXNum.gameObject, "ButtonAdd_WXNum", ComponentTypeName.Button)

    self.custormSettings = {}
    self.custormSettings[1] = GetComponentWithPath(self.root, "Top/CustomSetting", ComponentTypeName.Transform).gameObject
    self.custormSettings[2] = GetComponentWithPath(self.root, "Bottom/Child/CustomSetting", ComponentTypeName.Transform).gameObject
    self.settingToggles = {}
    self.settingToggles[1] = GetComponentWithPath(self.root, "Top/Child/Master/1", ComponentTypeName.Toggle)
    self.settingToggles[2] = GetComponentWithPath(self.root, "Top/Child/Master/2", ComponentTypeName.Toggle)

    self.newTopToggles = {}
    self.newTopToggles[1] = GetComponentWithPath(self.root, "Top/Child/Owner/1", ComponentTypeName.Toggle)
    self.newTopToggles[2] = GetComponentWithPath(self.root, "Top/Child/Owner/2", ComponentTypeName.Toggle)

    self.powerCostToggles = { }
    self.powerCostToggles[1] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/PowerCost/1", ComponentTypeName.Toggle)
    self.powerCostToggles[2] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/PowerCost/2", ComponentTypeName.Toggle)

    self.showQRCodeToggles = { }
    self.showQRCodeToggles[1] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/showQRCode/1", ComponentTypeName.Toggle)
    self.showQRCodeToggles[2] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/showQRCode/2", ComponentTypeName.Toggle)

    self.PauseEnterToggles = { }
    self.PauseEnterToggles[1] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/PauseEnter/1", ComponentTypeName.Toggle)
    self.PauseEnterToggles[2] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/PauseEnter/2", ComponentTypeName.Toggle)


    self.NewRoomToggles = { }
    self.NewRoomToggles[1] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/NewRoom/1", ComponentTypeName.Toggle)
    self.NewRoomToggles[2] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/NewRoom/2", ComponentTypeName.Toggle)

    self.ScoreboardToggles = { }
    self.ScoreboardToggles[1] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/Scoreboard/1", ComponentTypeName.Toggle)
    self.ScoreboardToggles[2] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/Scoreboard/2", ComponentTypeName.Toggle)

    self.ChatAuthToggles = { }
    self.ChatAuthToggles[1] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/ChatAuth/1", ComponentTypeName.Toggle)
    self.ChatAuthToggles[2] = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/ChatAuth/2", ComponentTypeName.Toggle)

    --设置2d/3d
    self.ShowStyleToggles = { }
    self.ShowStyleToggles[1] = GetComponentWithPath(self.root, "Top/GeXingSetting/ShowStyle/1", ComponentTypeName.Toggle)
    self.ShowStyleToggles[2] = GetComponentWithPath(self.root, "Top/GeXingSetting/ShowStyle/2", ComponentTypeName.Toggle)

    --允许互动表情
    self.InteractiveExpressionToggle = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/InteractiveExpression/1", ComponentTypeName.Toggle)
    --允许牌局中解散房间
    self.DissolveRoomToggle = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/DissolveRoom/1", ComponentTypeName.Toggle)
    --允许牌局中解散房间时间
    self.DissolveRoomDropdown = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/DissolveRoom/Dropdown", ComponentTypeName.Dropdown)
    --防作弊
    self.PreventionCheatToggle = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/PreventionCheat/1", ComponentTypeName.Toggle)

    --离线封停
    self.OffLineFengTingToggle = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/OffLineFengTing/1", ComponentTypeName.Toggle)
    --余额充值
    self.BalanceRechargeToggle = GetComponentWithPath(self.root, "Top/CustomSetting/Scroll View/Viewport/Content/BalanceRecharge/1", ComponentTypeName.Toggle)

    self.ownRoomObj = GetComponentWithPath(self.root, "Top/Child/OwnRoomCard", ComponentTypeName.Transform).gameObject
    self.powerText = GetComponentWithPath(self.root, "Top/Child/OwnRoomCard/text", ComponentTypeName.Text)
    self.moreShow = GetComponentWithPath(self.root, "Top/Child/OwnRoomCard/bgShop/moreShow", ComponentTypeName.Transform).gameObject
	self.roomCard = GetComponentWithPath(self.root, "Top/Child/OwnRoomCard/bgShop/moreShow/text", ComponentTypeName.Text)
	
	self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
	self:fixed_tran_size(GetComponentWithPath(self.root, "Bottom", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
end

function MuseumInfoView:refresh_view(data) --data.playerRole OWNER-圈主,MEMBER-成员,VISITOR-游客,APPLYING-审核中,ADMIN-管理员
    --self.inputFieldNum.interactable = false
    self.inputFieldMember.interactable = false
    self.inputFieldName.interactable = (data.playerRole == "OWNER" or data.playerRole == "ADMIN" )
    self.inputFieldID.interactable = (data.playerRole == "OWNER")
    self.inputFieldWXNum.interactable = (data.playerRole == "OWNER" or data.playerRole == "ADMIN")

    if(data.playerRole == "OWNER") then
        self.UIStateSwitcher:SwitchState("Owner")
        self.newTopToggles[1].isOn = true
        self.newTopToggles[2].isOn = false
        Manager.SetButtonEnable(self.inputFieldIDBtn,true,false,true)
    elseif(data.playerRole == "MEMBER") then
        self.UIStateSwitcher:SwitchState("Member")
    --elseif(data.playerRole == "VISITOR" or data.playerRole == "APPLYING") then
    --    self.UIStateSwitcher:SwitchState("Visitor")
    elseif(data.playerRole == "ADMIN") then --管理员
        --ButtonEditor_ID
        self.UIStateSwitcher:SwitchState("Admin")
        self.newTopToggles[1].isOn = true
        self.newTopToggles[2].isOn = false
        Manager.SetButtonEnable(self.inputFieldIDBtn,false,true,false)
    end
    self:refresh_master_panel(data)

    if not data.masterParlorId then
        self.inputFieldNum.text ="0".. data.orginalParlorNum .. ""

        Manager.SetButtonEnable(self.inputFieldNameBtn,true,false,false)
        Manager.SetButtonEnable(self.inputFieldMemberBtn,true,false,false)
        Manager.SetButtonEnable(self.inputFieldWXNumBtn,true,false,false)

    else--联谊圈的设置界面
        self.inputFieldNum.text ="联谊中"

        self.inputFieldMember.interactable = false
        self.inputFieldName.interactable = false
        self.inputFieldID.interactable =false
        self.inputFieldWXNum.interactable = false
        Manager.SetButtonEnable(self.inputFieldNameBtn,false,true,false)
        Manager.SetButtonEnable(self.inputFieldMemberBtn,false,true,false)
        Manager.SetButtonEnable(self.inputFieldIDBtn,false,true,false)
        Manager.SetButtonEnable(self.inputFieldWXNumBtn,false,true,false)

    end


    self.inputFieldMember.text = data.memberCount .. ""
    self.inputFieldName.text = data.parlorName
    self.inputFieldID.text = data.ownerUid ..""
    self.inputFieldWXNum.text = data.wechatNumber .. ""

    self:image_load_sprite(self.imageHead, data.parlorLogo)
    self:set_image_fill(self.imageHead,204)
end

function MuseumInfoView:refresh_master_panel(data)
    --if(self.settingToggles[1].isOn) then
    --    self.settingToggleBg.localPosition = Vector3.New(63, self.settingToggleBg.localPosition.y, self.settingToggleBg.localPosition.z)
    --else
    --    self.settingToggleBg.localPosition = Vector3.New(-85, self.settingToggleBg.localPosition.y, self.settingToggleBg.localPosition.z)
    --end
    for i=1,#self.custormSettings do
        ComponentUtil.SafeSetActive(self.custormSettings[i], not data.isRuleOption and(self.settingToggles[1].isOn or (data.playerRole ~= "OWNER" and data.playerRole ~= "ADMIN") ) )
    end
    if( data.isRuleOption and self.settingToggles[2].isOn and (data.playerRole == "OWNER" or data.playerRole == "ADMIN")) then
        --if self.inputFieldName.text ~=""then
        --    self.inputFieldName.text = "  "
        --    self.sendData.museumData.parlorName = string.match(self.inputFieldName.text,"%s*(.-)%s*$")
        --end
        --
        --if self.inputFieldWXNum.text ~=""then
        --    self.inputFieldWXNum.text = "  "
        --    self.sendData.museumData.wechatNumber = string.match( self.inputFieldWXNum.text,"%s*(.-)%s*$")
        --end
        self.sendData.museumData.parlorName = string.match(self.inputFieldName.text,"%s*(.-)%s*$")
        self.sendData.museumData.wechatNumber = string.match( self.inputFieldWXNum.text,"%s*(.-)%s*$")
        if self.sendData.createAppGameName then
            ModuleCache.GameManager.change_game_by_gameName(self.sendData.createAppGameName, true)
        end
        ModuleCache.ModuleManager.show_module("public", "rulesetting", self.sendData)
    else
        ModuleCache.ModuleManager.hide_module("public", "rulesetting")
    end
end

function MuseumInfoView:update_user_data(data)
    self.textPowerNum.text = data.coins .. ""
end

return MuseumInfoView