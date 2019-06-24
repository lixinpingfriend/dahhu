
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MuseumMembersView = Class('museumMembersView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentManager

function MuseumMembersView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/museummembers/public_museummembers.prefab", "Public_MuseumMembers", 1)
    View.set_1080p(self)

    self.panels = {}
    self.copyItems = {}
    self.parents ={}
    self.contentSizeFitters = {}
    self.settingToggles = {}
    self.notDataText = {}
    for i =1, 3 do
        self.panels[i] = GetComponentWithPath(self.root, "Panel"..i, ComponentTypeName.Transform).gameObject
        self.notDataText[i] = GetComponentWithPath(self.panels[i], "Text", ComponentTypeName.Transform).gameObject
        self.parents[i] = GetComponentWithPath(self.panels[i], "Scroll View/Viewport/Content", ComponentTypeName.Transform).gameObject
        self.copyItems[i] = GetComponentWithPath(self.root, "CopyItem"..i, ComponentTypeName.Transform).gameObject
        self.contentSizeFitters[i] = GetComponentWithPath(self.panels[i], "Scroll View/Viewport/Content", "UnityEngine.UI.ContentSizeFitter")
        self.settingToggles[i] = GetComponentWithPath(self.root, "Bg/Select/"..i, ComponentTypeName.Toggle)
    end

    self.stateSwitcher = ComponentUtil.GetComponent(self.root, "UIStateSwitcher")
    self.contents = {}

    self.dropDown = GetComponentWithPath(self.root, "Panel1/TopBar/Dropdown", ComponentTypeName.Dropdown)
    self.inputField = GetComponentWithPath(self.root, "Panel1/TopBar/InputField", ComponentTypeName.InputField)
end

function MuseumMembersView:refresh_view()
    for i =1, 3 do --TODO XLQ 修复 Toggle 处于未激活状态时设置 isOn 无效   引起的bug
        ComponentUtil.SafeSetActive(self.panels[i], self.settingToggles[i].isOn and self.settingToggles[i].gameObject.activeSelf)
    end
end

function MuseumMembersView:initLoopScrollViewList(data, memberType,panelIdx, isReduce,isFellowShipOpen)    --panelIdx 1:成员  2：审核  3：消息
    self.panelIdx = panelIdx
    self.memberType = memberType

    --self.memberType = memberType
    self:reset()

    self.dropDown.options:Clear()


    if  self.memberType == "OWNER" or self.memberType == "ADMIN" then
        local optionData = UnityEngine.UI.Dropdown.OptionData("显示所有成员")
        self.dropDown.options:Add(optionData)
        optionData = UnityEngine.UI.Dropdown.OptionData("仅显示管理者")
        self.dropDown.options:Add(optionData)
        optionData = UnityEngine.UI.Dropdown.OptionData("已分组成员")
        self.dropDown.options:Add(optionData)
        optionData = UnityEngine.UI.Dropdown.OptionData("已封停成员")
        self.dropDown.options:Add(optionData)

    else
        local optionData = UnityEngine.UI.Dropdown.OptionData("显示所有成员")
        self.dropDown.options:Add(optionData)
        optionData = UnityEngine.UI.Dropdown.OptionData("仅显示管理者")
        self.dropDown.options:Add(optionData)
    end

    if isReduce ~= nil then
        self.isReduce = isReduce
    end

    if panelIdx == 1 then
        self.membersData = data
        local dataList = data.members
        if(#dataList == 0) then
            if((memberType == "OWNER" or memberType == "ADMIN") and not isFellowShipOpen) then -- playerRole == "ADMIN"
                self:fillItem(self:get_item(nil, 1), 0)
            end
        else
            if((memberType == "OWNER" or memberType == "ADMIN") and not isFellowShipOpen) then
                self:fillItem(self:get_item(nil, 1), 0)
                self:fillItem(self:get_item(nil, 2), 1)
            end
            self.dataList = dataList
            for i=1,#dataList do
                if(memberType == "OWNER" or memberType == "ADMIN") then
                    self:fillItem(self:get_item(dataList[i], i + 2))
                else
                    self:fillItem(self:get_item(dataList[i], i))
                end
            end

            if data.currentPage < data.totalPage then
                if(memberType == "OWNER" or memberType == "ADMIN") then
                    self:fillItem(self:get_item(nil, #dataList +1 + 2),3)
                else
                    self:fillItem(self:get_item(nil, #dataList +1),3)
                end
            end
        end
        self.notDataText[panelIdx]:SetActive(#dataList == 0)
    elseif panelIdx == 2 then
        self.checkList = data
        for i=1,#data do
            self:fillItem1(self:get_item(data[i], i), memberType == "OWNER" or memberType == "ADMIN")
        end
        self.notDataText[panelIdx]:SetActive(#data == 0)
    elseif panelIdx == 3 then

        for i=1,#data do
            self:fillItem2(self:get_item(data[i], i))
        end
        self.notDataText[panelIdx]:SetActive(#data == 0)
    end



    self.contentSizeFitters[panelIdx].enabled = false
    self.contentSizeFitters[panelIdx].enabled = true
end


function MuseumMembersView:get_item(data, i)
    local obj = nil
    local item = {}
    if(i<=#self.contents[self.panelIdx]) then
        obj = self.contents[self.panelIdx][i]
    else
        obj = TableUtil.clone(self.copyItems[self.panelIdx],self.parents[self.panelIdx],Vector3.zero)
    end
    obj.name = "item_" .. i 
    ComponentUtil.SafeSetActive(obj, true)  
    item.gameObject = obj
    item.data = data
    return item
end

function MuseumMembersView:reset()

    for i = 1,#self.notDataText do
        self.notDataText[i]:SetActive(false)
    end


    self.contents[self.panelIdx] = TableUtil.get_all_child(self.parents[self.panelIdx])
    for i=1,#self.contents[self.panelIdx] do
        ComponentUtil.SafeSetActive(self.contents[self.panelIdx][i], false)
    end
end

function MuseumMembersView:fillItem2(item)
    local data = item.data
    local imageHead = GetComponentWithPath(item.gameObject, "Mask/ImageHead", ComponentTypeName.Image)
    local infoTex = GetComponentWithPath(item.gameObject, "infoTex", ComponentTypeName.Text)
    local timeTex = GetComponentWithPath(item.gameObject, "timeTex", ComponentTypeName.Text)
    if(data) then
        self:image_load_sprite(imageHead, data.headImg)
        timeTex.text = data.createTime

        --operate (integer, optional): 操作类型1添加 2删除
        --operateCase (integer, optional): 操作情况 添加： XXX通过免审核链接加入了亲友圈。2，XXX的申请已被圈主同意，加入了亲友圈。
        --3，XXX被圈主通过游戏ID添加到了亲友圈。删除：1，XXX主动退出了亲友圈。2，XXX被圈主移出了亲友圈。3，XXX由于更换圈主，自动移出了亲友圈。 ,
        if data.operate == 1 then
            if data.operateCase == 1 then
                infoTex.text = string.format("<color=#98951EFF>%s</color>通过免审核链接<color=#20902FFF>加入</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            elseif data.operateCase == 2 then
                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>的申请已被圈主同意，<color=#20902FFF>加入</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>的申请已被<color=#A34FD8FF>%s</color>同意，<color=#20902FFF>加入</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end

            elseif data.operateCase == 3 then
                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被圈主通过游戏ID<color=#20902FFF>添加</color>到了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被<color=#A34FD8FF>%s</color>通过游戏ID<color=#20902FFF>添加</color>到了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end
            elseif data.operateCase == 4 then
                infoTex.text = string.format("<color=#98951EFF>%s</color>被圈主<color=#20902FFF>设置</color>成为管理员。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            end
        elseif data.operate == 2 then
            if data.operateCase == 1 then
                infoTex.text = string.format("<color=#98951EFF>%s</color>主动<color=#B62C2CFF>退出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            elseif data.operateCase == 2 then
                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被圈主<color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>被<color=#A34FD8FF>%s</color><color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end

            elseif data.operateCase == 3 then

                if not data.operateNickname or data.operateNickname == ""then
                    infoTex.text = string.format("<color=#98951EFF>%s</color>由于更换圈主，自动<color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
                else
                    infoTex.text = string.format("<color=#98951EFF>%s</color>由于更换<color=#A34FD8FF>%s</color>，自动<color=#B62C2CFF>移出</color>了亲友圈。",Util.filterPlayerName(data.nickname, 10, data.isRedName),Util.filterPlayerName(data.operateNickname, 10))
                end
            elseif data.operateCase == 4 then
                infoTex.text = string.format("<color=#98951EFF>%s</color>已经被圈主<color=#20902FFF>取消</color>管理员。",Util.filterPlayerName(data.nickname, 10, data.isRedName))
            end
        end

    end
end

function MuseumMembersView:fillItem1(item, isOwer)
    local data = item.data
    local imageHead = GetComponentWithPath(item.gameObject, "Mask/Image/ImageHead", ComponentTypeName.Image)
    local nickName = GetComponentWithPath(item.gameObject, "TextName", ComponentTypeName.Text)
    local textId = GetComponentWithPath(item.gameObject, "TextID", ComponentTypeName.Text)
    local TextInviteName = GetComponentWithPath(item.gameObject, "TextInviteName", ComponentTypeName.Text)
    local enable = GetComponentWithPath(item.gameObject, "Enable", ComponentTypeName.Transform).gameObject
    local disable = GetComponentWithPath(item.gameObject, "Disable", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(enable, isOwer)
    ComponentUtil.SafeSetActive(disable, not isOwer)
    if(data) then
        nickName.text = Util.filterPlayerName(data.name, 10, data.isRedName)
        self:image_load_sprite(imageHead, data.headImg)
        if data.isRedName then
            textId.text = string.format("<color=red>ID:%s</color>", data.uid)
        else
            textId.text = "ID:" .. data.uid
        end

        TextInviteName.gameObject:SetActive(data.sourceUserName and type(data.sourceUserName) ~= "userdata" and data.sourceUserName ~= "")
        if data.sourceUserName and type(data.sourceUserName) ~= "userdata" and data.sourceUserName ~= "" then --
            TextInviteName.text = string.format("<color=#18A832FF>%s</color>邀请进亲友圈",data.sourceUserName)
        end
    end
end

-- showType 0 : +   1: - 或者 返回   3: 加载更多
function MuseumMembersView:fillItem(item, showType)
    local data = item.data
    local imageHead = GetComponentWithPath(item.gameObject, "Mask/Image/ImageHead", ComponentTypeName.Image)
    local nickName = GetComponentWithPath(item.gameObject, "Mask/Image/ImageHead/Image/Name", ComponentTypeName.Text)
    local tagImg = GetComponentWithPath(item.gameObject, "Tag", ComponentTypeName.Image)
    local tagSprHolder = GetComponentWithPath(item.gameObject, "Tag", "SpriteHolder")

    local stateusTagImg = GetComponentWithPath(item.gameObject, "StateusTag", ComponentTypeName.Image)
    local stateusTagSprHolder = GetComponentWithPath(item.gameObject, "StateusTag", "SpriteHolder")
    stateusTagImg.gameObject:SetActive(false)

    local objReduce = GetComponentWithPath(item.gameObject, "ImageReduce", ComponentTypeName.Transform).gameObject
    local buttonAdd = GetComponentWithPath(item.gameObject, "Mask/Image/ButtonAdd", ComponentTypeName.Button)
    local buttonReduce = GetComponentWithPath(item.gameObject, "Mask/Image/ButtonReduce", ComponentTypeName.Button)
    local buttonBack = GetComponentWithPath(item.gameObject, "Mask/Image/ButtonBack", ComponentTypeName.Button)
    local buttonLoad = GetComponentWithPath(item.gameObject, "Mask/Image/loadButton", ComponentTypeName.Button)

    ComponentUtil.SafeSetActive(buttonAdd.gameObject, false)
    ComponentUtil.SafeSetActive(buttonReduce.gameObject, false)
    ComponentUtil.SafeSetActive(buttonBack.gameObject, false)
    ComponentUtil.SafeSetActive(imageHead.gameObject, false)
    ComponentUtil.SafeSetActive(buttonAdd.gameObject, showType == 0)
    ComponentUtil.SafeSetActive(buttonReduce.gameObject, showType == 1 and not self.isReduce)
    ComponentUtil.SafeSetActive(buttonBack.gameObject, showType == 1 and self.isReduce)
    ComponentUtil.SafeSetActive(buttonLoad.gameObject, showType == 3 ) --加载更多

    ComponentUtil.SafeSetActive(imageHead.gameObject, not showType)
    ComponentUtil.SafeSetActive(objReduce, self.isReduce and not showType)
    ComponentUtil.SafeSetActive(tagImg.gameObject, false)

    if(data) then
        if data.comments and data.comments ~="" then
            nickName.text = Util.filterPlayerName(data.comments, 10, data.isRedName)
        else
            nickName.text = Util.filterPlayerName(data.name, 10, data.isRedName)
        end

        self:image_load_sprite(imageHead, data.headImg)

        ComponentUtil.SafeSetActive(tagImg.gameObject, data.parlorUserType < 2)
        if data.parlorUserType < 2 then
            tagImg.sprite = tagSprHolder:FindSpriteByName(data.parlorUserType) --parlorUserType (integer, optional): 0圈主 1管理员 2圈友 ,
        end


        if data.groupNum then --0 正常     1 A组    2 B组    3 C组    4 封顶
            if data.sealOff == 2 then
                data.groupNum = 4
            end
            stateusTagImg.gameObject:SetActive(data.groupNum ~= 0 and (self.memberType == "OWNER" or self.memberType == "ADMIN") )

            stateusTagImg.sprite = stateusTagSprHolder:FindSpriteByName(data.groupNum) --
        end
    end

end

return MuseumMembersView