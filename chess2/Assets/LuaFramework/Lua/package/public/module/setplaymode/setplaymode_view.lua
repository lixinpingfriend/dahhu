
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local SetPlayModeView = Class('setPlayModeView', View)

local ModuleCache = ModuleCache
local TableUtil = TableUtil

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function SetPlayModeView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/setplaymode/public_windowsetplaymode.prefab", "Public_WindowSetPlayMode", 1)
    View.set_1080p(self)

    self.dic = {}
    self.dic["江苏省"]      = "苏"
    self.dic["安徽省"]       = "皖"
    self.dic["河南省"]       = "豫"
    self.dic["湖南省"]       = "湘"
    self.dic["湖北省"]       = "鄂"
    self.dic["广东省"]       = "粤"
    self.dic["广西省"]       = "桂"
    self.dic["贵州省"]       = "贵"
    self.dic["云南省"]       = "云"
    self.dic["陕西省"]       = "陕"
    self.dic["新疆省"]       = "新"
    self.dic["北京市"]       = "京"
    self.dic["天津市"]       = "津"
    self.dic["上海市"]       = "沪"
    self.dic["重庆市"]       = "渝"
    self.dic["河北省"]       = "冀"
    self.dic["山西省"]       = "晋"
    self.dic["辽宁省"]       = "辽"
    self.dic["吉林省"]       = "吉"
    self.dic["黑龙江省"]     = "黑"
    self.dic["浙江省"]       = "浙"
    self.dic["福建省"]       = "闽"
    self.dic["江西省"]       = "赣"
    self.dic["山东省"]       = "鲁"
    self.dic["四川省"]       = "川"
    self.dic["甘肃省"]       = "甘"
    self.dic["青海省"]       = "青"
    self.dic["西藏省"]       = "藏"
    self.dic["内蒙古省"]     = "蒙"
    self.dic["宁夏省"]       = "宁"
    self.dic["香港"]         = "港"
    self.dic["澳门"]         = "澳"


    self.uiState   = GetComponentWithPath(self.root, "Big", "UIStateSwitcher")
    self.bigPanel  = GetComponentWithPath(self.root, "Big", ComponentTypeName.Transform).gameObject
    self.smallPanel  = GetComponentWithPath(self.root, "Small", ComponentTypeName.Transform).gameObject

    self.normolTitle = GetComponentWithPath(self.bigPanel, "Title/Normol", ComponentTypeName.Transform).gameObject

    self.normolPanel = GetComponentWithPath(self.bigPanel, "Normol", ComponentTypeName.Transform).gameObject


    self.btnSug = GetComponentWithPath(self.root, "Big/Title/Normol/Button1", ComponentTypeName.Button)
    self.btnMore = GetComponentWithPath(self.root, "Big/Title/Normol/Button2", ComponentTypeName.Button)
    self.img1 = GetComponentWithPath(self.root, "Big/Title/Normol/Button1/Image", ComponentTypeName.Transform).gameObject
    self.img2 = GetComponentWithPath(self.root, "Big/Title/Normol/Button2/Image", ComponentTypeName.Transform).gameObject

	self:fixed_tran_size(GetComponentWithPath(self.root, "Big/Background", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)

end

function SetPlayModeView:on_view_init() 
end




function SetPlayModeView:initLeftScrollViewList(locationList)
    -- print("Init------------------------")
    -- self.btnBack.gameObject:SetActive(ModuleCache.GameManager.curGameId ~= 0)


    self.showIndex = 2
    local usePanel = self.normolPanel
    self.usePanel = usePanel
    if(not ModuleCache.GameManager.iosAppStoreIsCheck) then
        ModuleCache.ComponentUtil.SafeSetActive(self.normolPanel, true)
        ModuleCache.ComponentUtil.SafeSetActive(self.img1, false)
        ModuleCache.ComponentUtil.SafeSetActive(self.img2, true)
        self.uiState:SwitchState("Big")
    else
        usePanel = self.smallPanel
        self.uiState:SwitchState("Small")
    end

    self.btnBack   = GetComponentWithPath(self.bigPanel, "Background/TopLeft/ImageClose", ComponentTypeName.Button)
    self.provinceBtn = GetComponentWithPath(self.bigPanel, "Background/TopRight/provinceBtn", ComponentTypeName.Transform).gameObject

    ModuleCache.ComponentUtil.SafeSetActive(self.provinceBtn, ModuleCache.GameManager.channel == "Official")

    --not ModuleCache.ModuleManager.module_is_active("public",'setprovince'))

    --左侧ListView
    self.scrollL   = GetComponentWithPath(usePanel, "Center/leftScrollView", ComponentTypeName.ScrollRect)
    self.contentL  = GetComponentWithPath(usePanel, "Center/leftScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.cloneObjL = GetComponentWithPath(usePanel, "Center/ItemPrefabHolder/LocationItem", ComponentTypeName.Transform).gameObject

    --右侧ListView
    self.scrollR   = GetComponentWithPath(usePanel, "Center/rightScrollView", ComponentTypeName.ScrollRect)
    self.contentR  = GetComponentWithPath(usePanel, "Center/rightScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.cloneObjR = GetComponentWithPath(usePanel, "Center/ItemPrefabHolder/PlayModeItem", ComponentTypeName.Transform).gameObject


    self.locationList = locationList
    self.contentsL = TableUtil.get_all_child(self.contentL)
    self:reset(self.contentsL)
    local curPlayModeList = nil
    if(ModuleCache.GameManager.getCurGameId() ~= 0) then
        curPlayModeList = ModuleCache.PlayModeUtil.getListByGameId(ModuleCache.GameManager.getCurGameId(), locationList)
        if(not curPlayModeList)then
            ModuleCache.GameManager.curGameId = 0
        end
    end

    for i=1,#locationList do
        if(self.locationList[i].isOpen) then
            local obj = nil
            local item = {}
            if(i<=#self.contentsL) then
                obj = self.contentsL[i]
            else
                obj = TableUtil.clone(self.cloneObjL,self.contentL,Vector3.zero)
            end
            obj.name = "toggle"..i
            ModuleCache.ComponentUtil.SafeSetActive(obj, true)  
            local toggle = ModuleCache.ComponentManager.GetComponent(obj.gameObject, ModuleCache.ComponentTypeName.Toggle)
            toggle.isOn = false
            if(ModuleCache.GameManager.getCurGameId() ~= 0) then
                toggle.isOn = self.locationList[i].name == curPlayModeList.name
            end

            if(ModuleCache.GameManager.getCurGameId() == 0 and i == 1)then
                toggle.isOn = true
            end
            item.gameObject = obj
            item.data = locationList[i] 
            self:fillItemL(item, i)
            if(toggle.isOn) then
            self:initRightScrollViewList(i) 
            end
        end
    end
    

    --local sizeScrollL = ModuleCache.ComponentManager.GetComponent(self.scrollL.gameObject, ComponentTypeName.RectTransform).rect
    --local contentHeight = #locationList * 44
    --if(#locationList % 2 ~= 0) then
    --   contentHeight = (#locationList+1) * 44
    --end
    -- print("sizeScrollL.height = "..sizeScrollL.height)
    -- print("contentHeight = "..contentHeight)
    --self.scrollL.vertical = contentHeight >= sizeScrollL.height
    
end

function SetPlayModeView:initRightScrollViewList(index)  
    self.curPlayModeList = self.locationList[index].playModeList
    local contentsR = TableUtil.get_all_child(self.contentR)
    self:reset(contentsR)
    for i=1,#self.curPlayModeList do
        if(self.curPlayModeList[i].isOpen) then
        local obj = nil
        local item = {}
        if(i<=#contentsR) then
            obj = contentsR[i]
        else
            obj = TableUtil.clone(self.cloneObjR,self.contentR,Vector3.zero)
        end
        obj.name = "btnPlayMode"..i
        item.gameObject = obj
        item.data = self.curPlayModeList[i] 
        self:fillItemR(item, i)
        ModuleCache.ComponentUtil.SafeSetActive(obj, true)  
        end
    end
    --[[
    local sizeScrollR = ModuleCache.ComponentManager.GetComponent(self.scrollR.gameObject, ComponentTypeName.RectTransform).rect
    local contentHeight = #self.curPlayModeList * 100
    if(#self.curPlayModeList % 2 ~= 0) then
        contentHeight = (#self.curPlayModeList+1) * 100
    end
    contentHeight = contentHeight + 34  -- top 20 padding
    self.scrollR.vertical = contentHeight >= sizeScrollR.height
    self.contentR.transform.localPosition = Vector3.New(0,0,0)]]
end

function SetPlayModeView:setBtnTag(obj,tag)
    local hotTip = GetComponentWithPath(obj.gameObject, "HotTip", ComponentTypeName.Transform).gameObject
    local suggestTip = GetComponentWithPath(obj.gameObject, "SuggestTip", ComponentTypeName.Transform).gameObject
    local testTip = GetComponentWithPath(obj.gameObject, "TestTip", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(hotTip, tag == 1)
    ModuleCache.ComponentUtil.SafeSetActive(suggestTip, tag == 2)
    ModuleCache.ComponentUtil.SafeSetActive(testTip, tag == 3)
end

function SetPlayModeView:reset(contents)
    for i=1,#contents do
        ModuleCache.ComponentUtil.SafeSetActive(contents[i], false)
    end
end

function SetPlayModeView:fillItemL(item)
    local data          = item.data
    local titleUnSelect = GetComponentWithPath(item.gameObject, "Background/Label", ComponentTypeName.Text)
    local titleSelect   = GetComponentWithPath(item.gameObject, "Checkmark/Label", ComponentTypeName.Text)

    titleSelect.text    = item.data.name
    titleUnSelect.text  = item.data.name
end

function SetPlayModeView:fillItemR(item)
    local data          = item.data
    local title         = GetComponentWithPath(item.gameObject, "Background/Label", ComponentTypeName.Text)
    local titleSelect   = GetComponentWithPath(item.gameObject, "Checkmark/Label", ComponentTypeName.Text)
    local toggle        = ModuleCache.ComponentManager.GetComponent(item.gameObject, ModuleCache.ComponentTypeName.Toggle)
    toggle.isOn         = (self.showId == data.gameId)
    -- local spHolder   = GetComponentWithPath(item.gameObject, "Icon", "SpriteHolder")
    local img           = GetComponentWithPath(item.gameObject, "Icon", ComponentTypeName.Image)
    local anim          = GetComponentWithPath(item.gameObject, "Icon", "UnityEngine.Animator")
    local imgTrans      = GetComponentWithPath(item.gameObject, "Icon", ComponentTypeName.RectTransform)
    img.sprite          = ModuleCache.PlayModeUtil.getIconRes(item.data,self.provinceId) -- spHolder:FindSpriteByName(item.data.img)
    title.text          = item.data.name
    titleSelect.text    = item.data.name
    imgTrans.anchoredPosition = Vector2.New(imgTrans.anchoredPosition.x, 5, 0)  --动画会让y变化,这里还原
    anim.enabled        = toggle.isOn

    self:setBtnTag(item.gameObject,data.tag)
end

function SetPlayModeView:getPlayMode(index)
    return self.curPlayModeList[index]
end


function SetPlayModeView:setPlayModeIsOnById(gameId,isOn,obj)
    local index = 0
    for i = 1,#self.curPlayModeList do
        if(self.curPlayModeList[i].gameId == gameId) then
            index = i
            break
        end
    end
    if(index ~= 0)then
        local item = GetComponentWithPath(self.contentR.gameObject,"btnPlayMode"..index,ModuleCache.ComponentTypeName.Toggle)
        item.isOn = isOn
    else
        self:unSelectPlayMode(obj)
    end
end

function SetPlayModeView:unSelectPlayMode(obj)
    local item = ModuleCache.ComponentManager.GetComponent(obj.gameObject, ModuleCache.ComponentTypeName.Toggle)
    if item then
        ModuleCache.ComponentUtil.SafeSetActive(obj, false)
        item.isOn = false
        ModuleCache.ComponentUtil.SafeSetActive(obj, true)
    end
end

function SetPlayModeView:startDownLoadBgImg(url)
    print("url = "..url)
    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(url, function(err, sprite)
        if (err) then
            print('error down load ' .. url .. 'failed:' .. err.error)
            if string.find(err.error, 'Network Timeout') and string.find(url, 'http') == 1 then
                if (self) then
                    -- self:image_load_sprite(targetImage, url, callback)
                end
            end
        else
            if (not self.isDestroy) then
                self.backgroud.sprite = sprite
            end
        end
    end , nil, false)
end

function SetPlayModeView:getNearestScrollViewPos(offsetIndex, offset)
    offsetIndex = offsetIndex or 0
    offset = offset or 0
    local curPos = self.adContentInfo.scrollRectAdContent.horizontalNormalizedPosition
    local minOffset = 1
    local targetPosX = curPos
    local targetIndex = 1
    local len = #self.adContentInfo.gameObjectAds
    for i = 1, len do
        local pos =(i - 1) /(len - 1)
        local tmpOffset = math.abs(curPos - pos)
        if (minOffset > tmpOffset) then
            minOffset = tmpOffset
            targetPosX = math.min(math.max((i - 1 + offsetIndex + offset) /(len - 1), 0), 1)
            targetIndex = math.min(math.max(i + offsetIndex + offset, 1), len)
        end
    end
    return targetPosX, targetIndex, curPos
end

function SetPlayModeView:set_sugScroll_center()
    ModuleCache.ComponentUtil.SafeSetActive(self.adContentInfo.root, false)
    self.firstScroll.transform.localPosition = Vector3.New(-625,self.firstScroll.transform.localPosition.y,0)
end

function SetPlayModeView:set_sugScroll_right()
    self.firstScroll.transform.localPosition = Vector3.New(-430,self.firstScroll.transform.localPosition.y,0)
    ModuleCache.ComponentUtil.SafeSetActive(self.adContentInfo.root, true)
end

function SetPlayModeView:setShow(isbool)
    ModuleCache.ComponentUtil.SafeSetActive(self.root, isbool)
end

return SetPlayModeView