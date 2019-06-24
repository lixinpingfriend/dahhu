
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local HowToPlayView = Class('howToPlayView', View)

local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentManager
local ComponentTypeName = ModuleCache.ComponentTypeName
local tagOffset = 84


function HowToPlayView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/howtoplay/public_windowhowtoplay.prefab", "Public_WindowHowToPlay", 1)
    View.set_1080p(self)
    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    

    self.buttonClose = GetComponentWithPath(self.root, "TopLeft/Child/ImageBack", ComponentTypeName.Button)

    self.cloneParent = GetComponentWithPath(self.root, "Clone", ComponentTypeName.Transform).gameObject
    self.tagParent = GetComponentWithPath(self.root, "Top/TagBtns/Scroll View/Viewport/Content", ComponentTypeName.RectTransform)  
    self.copyTagBtn = GetComponentWithPath(self.root, "Top/TagBtns/Scroll View/Viewport/Content/CopyBtn", ComponentTypeName.Transform).gameObject

    self.tagBtnBeginPos = self.copyTagBtn.transform.localPosition
    TableUtil.move_clone(self.copyTagBtn, self.cloneParent)
    self.clones = TableUtil.get_all_child(self.cloneParent)
    self.howToPlayText = GetComponentWithPath(self.root, "Top/Panels/Panel/HowToPlayText", ComponentTypeName.Text)
    self.uiStateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
end


function HowToPlayView:on_view_init()
    
end

function HowToPlayView:show_create(wanfaType, clickIndex)
    if(not clickIndex) then
        self.uiStateSwitcher:SwitchState("Normal")
    else
        self.uiStateSwitcher:SwitchState("CreateRoom")
    end
    self.Config = ModuleCache.PlayModeUtil.getGameRuleConfig()--require(string.format("package.public.config.%s.config_%s",AppData.App_Name,AppData.Game_Name))
    self.tagBtnToggles = {}
    self.checkmarks = {}
    TableUtil.hide_childs(self.tagParent.gameObject)
    local dataList = Config.get_list()
    local index = 1
    for i=1,#dataList do
        if(not clickIndex or (i == clickIndex)) then
            local tagItem = TableUtil.get_or_clone(i, "CopyBtn", self.tagParent.gameObject, self.tagBtnBeginPos - Vector3.New(0, tagOffset *(index - 1), 0), self.poorObjs, self.clones)
            local toggle = ModuleCache.ComponentManager.GetComponent(tagItem, ComponentTypeName.Toggle)
            local checkmark = GetComponentWithPath(tagItem, "Checkmark", ComponentTypeName.Transform).gameObject
            local title1 = GetComponentWithPath(tagItem, "Checkmark/Label", ComponentTypeName.Text)
            local title2 = GetComponentWithPath(tagItem, "Background/Label", ComponentTypeName.Text)
            title1.text = dataList[i].name
            title2.text = dataList[i].name
            table.insert(self.tagBtnToggles, toggle)
            table.insert(self.checkmarks, checkmark)
            index = index + 1
        end
    end
    self.tagParent.sizeDelta = Vector2.New(self.tagParent.sizeDelta.x, tagOffset*#dataList)
    self.howToPlayText.text = self.Config.HowToPlayTexts[wanfaType]
end

return HowToPlayView