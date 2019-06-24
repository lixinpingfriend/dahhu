
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumMembersInfoView = Class('museumMembersInfoView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentManager
local Manager = require("manager.function_manager")
local CSmartTimer = ModuleCache.SmartTimer.instance

function MuseumMembersInfoView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museummembers/public_museummembersinfo.prefab", "Public_MuseumMembersInfo", 1)
    View.set_1080p(self)
    self.tabImg = GetComponentWithPath(self.root, "Center/Mask/tabImg", ComponentTypeName.Image)
    self.tabSprHolder = GetComponentWithPath(self.root, "Center/Mask/tabImg", "SpriteHolder")
    self.headImg = GetComponentWithPath(self.root, "Center/Mask/Head", ComponentTypeName.Image)
    self.nickText = GetComponentWithPath(self.root, "Center/nick", ComponentTypeName.Text)
    self.idText = GetComponentWithPath(self.root, "Center/id", ComponentTypeName.Text)
    self.TextInviteName = GetComponentWithPath(self.root, "Center/TextInviteName", ComponentTypeName.Text)
    self.setButton = GetComponentWithPath(self.root, "Center/setButton", ComponentTypeName.Button)
    self.buttonText = GetComponentWithPath(self.root, "Center/setButton/Text", ComponentTypeName.Text)

    self.adminObj = GetComponentWithPath(self.root, "Center/Mask/adminImg", ComponentTypeName.Transform).gameObject

    self.tabToggles = {}
    for i =1, 10 do
        self.tabToggles[i] = GetComponentWithPath(self.root, "Center/rightPanel/Toggle_"..(i-1), ComponentTypeName.Toggle)
    end
    self.fengTingStr = {}
    self.fengTingStr[1] = GetComponentWithPath(self.root, "Center/rightPanel/Toggle_4/Label", ComponentTypeName.Text)
    self.fengTingStr[2] = GetComponentWithPath(self.root, "Center/rightPanel/Toggle_4/LabelCheckmark", ComponentTypeName.Text)

    self.nameInput = GetComponentWithPath(self.root, "Center/nameInput", ComponentTypeName.InputField)
    self.parlorNum = GetComponentWithPath(self.root, "Center/parlorNum", ComponentTypeName.Text)

    self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")

    self.changeParlorDropdown = GetComponentWithPath(self.root, "Center/ChangeParlorDropdown", ComponentTypeName.Dropdown)

    self.historyPanel = GetComponentWithPath(self.root, "historyDataPanel", ComponentTypeName.Transform).gameObject
    self.headImg_history = GetComponentWithPath(self.historyPanel, "Center/Item1/Mask/Head", ComponentTypeName.Image)
    self.nickText_history = GetComponentWithPath(self.historyPanel, "Center/Item1/name", ComponentTypeName.Text)

    self.headImg_cur = GetComponentWithPath(self.historyPanel, "Center/Item2/Mask/Head", ComponentTypeName.Image)
    self.nickText_cur = GetComponentWithPath(self.historyPanel, "Center/Item2/name", ComponentTypeName.Text)
end

function MuseumMembersInfoView:refresh_view(data)
    if data.sealOff == 2 then
        data.groupNum =4
    end
    self:setTabImg(data.groupNum)

    self.headImg.sprite = data.headImg

    if data.isRedName then
        self.nickText.text = string.format("<color=red>%s</color>", data.name)
        self.idText.text = string.format("<color=red>%s</color>", data.uid)
    else
        self.nickText.text = data.name
        self.idText.text = data.uid
    end
    self.nameInput.text = data.comments

    self.TextInviteName.gameObject:SetActive(data.sourceUserName and type(data.sourceUserName) ~= "userdata" and data.sourceUserName ~= "")
    if data.sourceUserName and type(data.sourceUserName) ~= "userdata" and data.sourceUserName ~= "" then --
        self.TextInviteName.text = string.format("<color=#18A832FF>%s</color>邀请进亲友圈",data.sourceUserName)
    end

    self.adminObj:SetActive(data.parlorUserType == 1)

    --parlorUserType (integer, optional): 0圈主 1管理员 2圈友 ,
    if data.parlorUserType == 2 then
        self.buttonText.text = "设为管理员"
    elseif data.parlorUserType == 1 then
        self.buttonText.text = "撤销管理员"
    end

    if type(data.currentParlorNum) ~= "userdata"  then
        if data.allParlorId ~= tostring(data.currentParlorId ) then
            local array = string.split(data.allParlorNum, ",")
            self.changeParlorDropdown.options:Clear()
            for i =1,#array do
                local optionData = UnityEngine.UI.Dropdown.OptionData("亲友圈：0"..array[i])
                self.changeParlorDropdown.options:Add(optionData)
            end
        end

        self.parlorNum.text ="亲友圈：0"..data.currentParlorNum
        self.changeParlorDropdown.interactable = data.allParlorId ~= tostring(data.currentParlorId )
        --Manager.SetButtonEnable( self.changeParlorDropdown,data.allParlorId ~= tostring(data.currentParlorId ),true,false)
    end

    Manager.SetButtonEnable( self.setButton,data.playerRole == "OWNER",true,false)

    if data.sealOff ~= 2 or data.realityTime  <= 0 then   --0 正常  1 永久封停  2 限时封停
        self.fengTingStr[1].text = "封停"
        self.fengTingStr[2].text = "封停"
    else
        self.tabToggles[5].isOn = true
        if self.fengTingTimeId then
            CSmartTimer:Kill(self.fengTingTimeId)
        end
        self.fengTingTimeId = self:subscibe_time_event(data.realityTime, false, 0):OnUpdate(function(t)
            t = t.surplusTimeRound
            self.fengTingStr[1].text = string.format("封停(%s分%s秒)", math.modf(t/60),math.fmod(t,60))
            self.fengTingStr[2].text = string.format("封停(%s分%s秒)", math.modf(t/60),math.fmod(t,60))--os.date("%M",t),  os.date("%S",t))
        end):OnComplete(function(t)
            self.fengTingStr[1].text = "封停"
            self.fengTingStr[2].text = "封停"
            self.tabToggles[1].isOn = true
        end).id
    end

end


--idx  0 正常     1 A组    2 B组    3 C组    4 封停  5 D组  6 E     7 F     8 G     9 H
function MuseumMembersInfoView:setTabImg(idx)
    self.tabImg.gameObject:SetActive(idx ~= 0)
    if idx ~= 0 then
        self.tabImg.sprite = self.tabSprHolder:FindSpriteByName(idx.."")
    end


    self.tabToggles[idx+1].isOn = true

    if self.fengTingTimeId then
        CSmartTimer:Kill(self.fengTingTimeId)
        self.fengTingStr[1].text = "封停"
        self.fengTingStr[2].text = "封停"
    end
end



return MuseumMembersInfoView