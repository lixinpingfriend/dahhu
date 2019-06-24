
    local Class = require("lib.middleclass")
    local View = require('core.mvvm.view_base')
    -- ==========================================================================

    local MuseumActiveView = Class('museumActiveView', View)

    local ModuleCache = ModuleCache

    local ComponentTypeName = ModuleCache.ComponentTypeName
    local ComponentUtil = ModuleCache.ComponentUtil

    local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
    local numStr = {"一","二","三"}
    local awardType = {[2] = "钻石", [3] ="体力", [4] ="元红包", [5] ="cdkey", [6] ="铜钱",
        [7] ="元宝", [8] ="抽奖券",[9] ="金币",  [10] ="道具", [11] ="实物", [12] ="特权商品购买", [14] ="红包劵"}

    function MuseumActiveView:initialize(...)
        -- 初始View
        View.initialize(self, "public/module/museumactive/public_museumactive.prefab", "Public_MuseumActive", 1)
        View.set_1080p(self)
        self.stateSwitcher =  ModuleCache.ComponentManager.GetComponent(self.root,"UIStateSwitcher")


        self.copyItem= {}
        self.copyItem[1] = GetComponentWithPath(self.root, "Top/ItemPrefabHolder/Item", ComponentTypeName.Transform).gameObject
        self.copyItem[2] = GetComponentWithPath(self.root, "Top/ItemPrefabHolder/NameItem", ComponentTypeName.Transform).gameObject
        self.copyParent= {}
        self.copyParent[1] =  GetComponentWithPath(self.root, "Top/Panels/Actived/ScrollRect/Viewport/Content", ComponentTypeName.Transform).gameObject
        self.copyParent[2] =  GetComponentWithPath(self.root, "InviteInfo/ScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject

        self.loadButton = GetComponentWithPath(self.root, "Top/Panels/Actived/ScrollRect/Viewport/Content/loadButton", ComponentTypeName.Transform).gameObject
        self.notDataObj = GetComponentWithPath(self.root, "Top/Panels/Actived/notDataText", ComponentTypeName.Transform).gameObject
        self.topTexObj =  GetComponentWithPath(self.root, "Top/Panels/Actived/Text (1)", ComponentTypeName.Transform).gameObject

        self.titleToggles ={
            GetComponentWithPath(self.root, "Top/Child/Master/1", ComponentTypeName.Toggle),
            GetComponentWithPath(self.root, "Top/Child/Master/2", ComponentTypeName.Toggle),
        }

        self.everyDayObj = {
            startTime_dropdown = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/startTime/Dropdown", ComponentTypeName.Dropdown),
            endTime_dropdown = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/endTime/Dropdown", ComponentTypeName.Dropdown),
            rewardVule_input = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/activeReward/InputField", ComponentTypeName.InputField),
            rewardNum_input = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/rewardNum/InputField", ComponentTypeName.InputField),

            targetType_toggle = {
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/activeTarget/1", ComponentTypeName.Toggle),
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/activeTarget/2", ComponentTypeName.Toggle),
            },
            targetCount_input = {
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/activeTarget/1/InputField", ComponentTypeName.InputField),
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/activeTarget/2/InputField", ComponentTypeName.InputField),
            },

            activeTime_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/confirmInfo/bg/Text1/Text", ComponentTypeName.Text),
            rewardValue_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/confirmInfo/bg/Text2/Text", ComponentTypeName.Text),
            rewardNum_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/confirmInfo/bg/Text3/Text", ComponentTypeName.Text),
            rewardTotalValue_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/everyday/confirmInfo/bg/Text4/Text", ComponentTypeName.Text),
        }
        self.everyDayObj.startTime_dropdown.enabled = true
        self.everyDayObj.endTime_dropdown.enabled = true

        self.totalObj = {
            startTime_dropdown = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/startTime/Dropdown", ComponentTypeName.Dropdown),
            endTime_dropdown = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/endTime/Dropdown", ComponentTypeName.Dropdown),
            rewardVule_input = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/activeReward/InputField", ComponentTypeName.InputField),
            rewardNum_input = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/rewardNum/InputField", ComponentTypeName.InputField),

            targetType_toggle = {
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/activeTarget/1", ComponentTypeName.Toggle),
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/activeTarget/2", ComponentTypeName.Toggle),
            },
            targetCount_input = {
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/activeTarget/1/InputField", ComponentTypeName.InputField),
                GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/activeTarget/2/InputField", ComponentTypeName.InputField),
            },

            activeTime_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/confirmInfo/bg/Text1/Text", ComponentTypeName.Text),
            rewardValue_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/confirmInfo/bg/Text2/Text", ComponentTypeName.Text),
            rewardNum_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/confirmInfo/bg/Text3/Text", ComponentTypeName.Text),
            rewardTotalValue_text = GetComponentWithPath(self.root, "Top/Panels/CreateActive/total/confirmInfo/bg/Text4/Text", ComponentTypeName.Text),
        }
        self.totalObj.startTime_dropdown.enabled = true
        self.totalObj.endTime_dropdown.enabled = true


        self.inviteTagObj = GetComponentWithPath(self.root, "Top/TagBtns/Scroll View/Viewport/Content/CopyBtn (2)", ComponentTypeName.Transform).gameObject
        self.inviteObj = {
            startTime_dropdown = GetComponentWithPath(self.root, "Top/Panels/CreateActive/invite/startTime/Dropdown", ComponentTypeName.Dropdown),
            endTime_dropdown = GetComponentWithPath(self.root, "Top/Panels/CreateActive/invite/endTime/Dropdown", ComponentTypeName.Dropdown),
            infoByIndex = {}
        }
        for i = 1, 3 do
            local inviteCount = GetComponentWithPath(self.root, "Top/Panels/CreateActive/invite/ScrollView/Viewport/Content/" ..i .. "/InviteCount/InputField", ComponentTypeName.InputField)
            local achieveInning = GetComponentWithPath(self.root, "Top/Panels/CreateActive/invite/ScrollView/Viewport/Content/" ..i.. "/AchieveInning/InputField", ComponentTypeName.InputField)
            local achieveMoney = GetComponentWithPath(self.root, "Top/Panels/CreateActive/invite/ScrollView/Viewport/Content/" .. i .."/AchieveMoney/InputField", ComponentTypeName.InputField)
            local achieveCount = GetComponentWithPath(self.root, "Top/Panels/CreateActive/invite/ScrollView/Viewport/Content/" .. i .."/AchieveCount/InputField", ComponentTypeName.InputField)
            self.inviteObj.infoByIndex[i] = {InviteCount = inviteCount,  AchieveInning = achieveInning, AchieveMoney = achieveMoney, AchieveCount = achieveCount }
        end
        self.inviteObj.startTime_dropdown.enabled = true
        self.inviteObj.endTime_dropdown.enabled = true

        --邀请详情
        self.inviteInfoObj = ModuleCache.ComponentManager.FindGameObject(self.root, "InviteInfo")
        self.inviteInfoTile = GetComponentWithPath(self.root, "InviteInfo/InviteCount", ComponentTypeName.Text)
        self.notDataObj_invite = GetComponentWithPath(self.root, "InviteInfo/notDataObj", ComponentTypeName.Transform).gameObject

        self.awardTipsObj = GetComponentWithPath(self.root, "Top/AwardTips", ComponentTypeName.Transform).gameObject
        self.awardTipsRectTran = GetComponentWithPath(self.root, "Top/AwardTips", ComponentTypeName.RectTransform)
        self.inviteNumTex = GetComponentWithPath(self.awardTipsObj, "Title (1)", ComponentTypeName.Text)
        self.doneRoundTex = GetComponentWithPath(self.awardTipsObj, "Title (2)", ComponentTypeName.Text)
        self.AwardNumTex = GetComponentWithPath(self.awardTipsObj, "Title (3)", ComponentTypeName.Text)
        self.awardNameTex = GetComponentWithPath(self.awardTipsObj, "Title (4)", ComponentTypeName.Text)
        self.totalAwardTex = GetComponentWithPath(self.awardTipsObj, "Title (5)", ComponentTypeName.Text)
        self.shengYuTex = GetComponentWithPath(self.awardTipsObj, "Title (6)", ComponentTypeName.Text)
        self.doneIconObj = GetComponentWithPath(self.awardTipsObj, "Image", ComponentTypeName.Transform).gameObject
        self.notDoneIconObj = GetComponentWithPath(self.awardTipsObj, "Image (1)", ComponentTypeName.Transform).gameObject
        self.notRewardIconObj = GetComponentWithPath(self.awardTipsObj, "Image (2)", ComponentTypeName.Transform).gameObject

        self.contents = {}
        self:initStartTimeData(self.everyDayObj)
        self:initStartTimeData(self.totalObj)
        self:initStartTimeData(self.inviteObj)
        self:updateConfirmInfo( self.everyDayObj)
		self:updateConfirmInfo( self.totalObj)
		
		self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
    end

    function MuseumActiveView:initStartTimeData(tableObj)
        local curTime = os.time()

        --开始时间
        tableObj.startTime_dropdown.options:Clear()
        tableObj.startTimeData = {}

        tableObj.startTimeData[0] = 0
        local optionData = UnityEngine.UI.Dropdown.OptionData("请选择活动开始时间")
        tableObj.startTime_dropdown.options:Add(optionData)

        for i = 2, 16 do
            tableObj.startTimeData[i-1] = curTime + 60*60*24 *(i -1)
            local title = os.date("%Y-%m-%d", tableObj.startTimeData[i-1])

            local optionData = UnityEngine.UI.Dropdown.OptionData(title)
            tableObj.startTime_dropdown.options:Add(optionData)
        end

        tableObj.startTime_dropdown.captionText.text = "请选择活动开始时间"
        tableObj.endTime_dropdown.captionText.text = "请选择活动结束时间"
    end

    function MuseumActiveView:updateEndTimeData(tableObj)
        tableObj.initEndTimeDone = true
        local curTime = tableObj.startTimeData[tableObj.startTime_dropdown.value]

        --结束时间
        tableObj.endTime_dropdown.options:Clear()
        tableObj.endTimeData = {}

        tableObj.endTimeData[0] = 0
        local optionData = UnityEngine.UI.Dropdown.OptionData("请选择活动结束时间")
        tableObj.endTime_dropdown.options:Add(optionData)

        for i = 2, 16 do
            tableObj.endTimeData[i-1] = curTime + 60*60*24 * (i -2)
            local title = os.date("%Y-%m-%d", tableObj.endTimeData[i-1])

            local optionData = UnityEngine.UI.Dropdown.OptionData(title)
            tableObj.endTime_dropdown.options:Add(optionData)
        end
    end

    function MuseumActiveView:updateConfirmInfo(tableObj)
        -- 活动持续时间
        tableObj.activeTime = 0
        tableObj.beginTime = 0
        tableObj.endTime = 0
        local endIdx = tableObj.endTime_dropdown.value
        local startIdx = tableObj.startTime_dropdown.value

        if startIdx ~= 0 then
            tableObj.beginTime = tableObj.startTimeData[startIdx] *1000
        end

        if tableObj.endTimeData and endIdx ~= 0 and startIdx ~= 0 and  tableObj.endTimeData[endIdx] >= tableObj.startTimeData[startIdx] then

            tableObj.endTime = tableObj.endTimeData[endIdx] *1000

            tableObj.activeTime = tonumber(os.date("%d",tableObj.endTimeData[endIdx] - tableObj.startTimeData[startIdx]))

            tableObj.activeTime_text.text = tableObj.activeTime .."天"
        else
            tableObj.activeTime_text.text ="等待填写"
        end

        --单个任务奖励
        tableObj.rewardVule = 0
        if tableObj.rewardVule_input.text ~= "" then
            tableObj.rewardVule = tonumber(tableObj.rewardVule_input.text)
            tableObj.rewardValue_text.text = string.format("%0.2f元", tableObj.rewardVule_input.text)
        else
            tableObj.rewardValue_text.text = "等待填写"
        end

        --每天奖励个数
        tableObj.rewardNum = 0
        if tableObj.rewardNum_input.text ~= "" then
            tableObj.rewardNum = tonumber(tableObj.rewardNum_input.text)
            tableObj.rewardNum_text.text = string.format("%s个", tableObj.rewardNum_input.text)
        else
            tableObj.rewardNum_text.text = "等待填写"
        end

        -- 每日活动 总共金额需要x天数    累计任务不需要X天数
        if tableObj == self.totalObj and tableObj.rewardVule ~= 0 and tableObj.rewardNum ~= 0  then
            tableObj.rewardTotalValue_text.text = string.format("%0.2f元", tableObj.rewardVule * tableObj.rewardNum)
        elseif tableObj.rewardVule ~= 0 and tableObj.rewardNum ~= 0 and tableObj.activeTime ~= 0 then
            tableObj.rewardTotalValue_text.text = string.format("%0.2f元", tableObj.rewardVule * tableObj.rewardNum * tableObj.activeTime)
        else
            tableObj.rewardTotalValue_text.text = "等待填写"
        end

    end


    function MuseumActiveView:refreshRewardBoxInfo(data,boxTran,boxIdx)
        local boxAwardData = data.inviteInfoList[boxIdx]
        --if boxIdx <3 then
        --    self.awardTipsRectTran.position = Vector3.New(boxTran.position.x, self.awardTipsRectTran.position.y, self.awardTipsRectTran.position.z)
        --else
        --    self.awardTipsRectTran.position = Vector3.New(boxTran.position.x-0.3, self.awardTipsRectTran.position.y, self.awardTipsRectTran.position.z)
        --end


        self.awardNameTex.text = string.format("第%s阶段:",numStr[boxIdx])
        self.totalAwardTex.text = "总共奖励数量：" ..boxAwardData.totalAwardNum
        self.shengYuTex.text = "剩余奖励数量：".. boxAwardData.awardNum

        self.awardTipsObj:SetActive(true)
        self.inviteNumTex.text = string.format("需要邀请人数：%s人",boxAwardData.inviteNum)
        self.doneRoundTex.text = string.format("每人完成局数：%s局",boxAwardData.roundNum)
        self.AwardNumTex.text = string.format("达成奖励金额：%s元",boxAwardData.amountStr)
        self.doneIconObj:SetActive(boxAwardData.isReceive == 1)  --isReceive  1领取 2未达成 3过期
        self.notDoneIconObj:SetActive(boxAwardData.isReceive == 2)
        self.notRewardIconObj:SetActive(boxAwardData.isReceive == 3)
    end

    function MuseumActiveView:initLoopScrollViewList(data,museumData)
        self.museumData = museumData
        self.activeListData = data.list
        self:reset(1)

        self.notDataObj:SetActive(#data.list== 0)
        self.topTexObj:SetActive(#data.list >  0)

        if(#data.list > 0) then
            for i=1,#data.list do
                self:fillItem(self:get_item(data.list[i], i,1))
            end
        end

        self.loadButton:SetActive(data.page < data.totalPage)
        self.loadButton.transform:SetAsLastSibling()
    end

    function MuseumActiveView:initLoopScrollViewList_inviteInfo(list)
        self.inviteInfoTile.text = string.format("累计邀请人数:%s人",#list)

        self.notDataObj_invite:SetActive(#list == 0)
        self.inviteInfoTile.gameObject:SetActive(#list >0 )
        self:reset(2)
        if(#list > 0) then
            for i=1,#list do
                self:fillItem_inviteInfo(self:get_item(list[i], i,2))
            end
        end
    end

    function MuseumActiveView:fillItem(item)
        local data = item.data
        local boxIconSprHolder = ModuleCache.ComponentManager.GetComponent(item.gameObject,"SpriteHolder")

        local typeIcon= GetComponentWithPath(item.gameObject,"icon",ComponentTypeName.Image)
        local typeIconSprHolder = GetComponentWithPath(item.gameObject,"icon","SpriteHolder")
        local contentTex = GetComponentWithPath(item.gameObject,"contentTex",ComponentTypeName.Text)

        local endIconObj = GetComponentWithPath(item.gameObject, "endIcon", ComponentTypeName.Transform).gameObject
        local timeTex = GetComponentWithPath(item.gameObject,"TimeTex",ComponentTypeName.Text)

        local Scrollbar = GetComponentWithPath(item.gameObject, "Scrollbar", ComponentTypeName.Scrollbar)
        local proggressTex = GetComponentWithPath(item.gameObject,"Scrollbar/Text",ComponentTypeName.Text)
        local rewardInfoTex = GetComponentWithPath(item.gameObject,"rewardInfoTex",ComponentTypeName.Text)

        local notRewardIconObj = GetComponentWithPath(item.gameObject, "notRewardIcon", ComponentTypeName.Transform).gameObject
        local notRewardTexObj = GetComponentWithPath(item.gameObject, "notRewardTex", ComponentTypeName.Transform).gameObject

        local getDoneIconObj = GetComponentWithPath(item.gameObject, "getDoneIcon", ComponentTypeName.Transform).gameObject
        local deleteButton = GetComponentWithPath(item.gameObject, "deleteButton", ComponentTypeName.Transform).gameObject
        local InvitInfoButton = GetComponentWithPath(item.gameObject, "InvitInfoButton", ComponentTypeName.Transform).gameObject
        local InvitButton = GetComponentWithPath(item.gameObject, "InvitButton", ComponentTypeName.Transform).gameObject
        local boxIconList = {}
        for i = 1, 3 do
            boxIconList[i] = GetComponentWithPath(item.gameObject, "Scrollbar/boxBtn_"..i, ComponentTypeName.Image)
        end

        notRewardTexObj:SetActive(false)

        if(data) then
            for i = 1, 3 do
                boxIconList[i].gameObject:SetActive(data.code == "parlor_invite")
            end

            local restNum  = data.receiveLimit - data.currentNum
            if data.hasEnd then
                restNum = 0
            end

            if data.code == "parlor" then
                typeIcon.sprite = typeIconSprHolder:FindSpriteByName(tostring(data.receiveReset))


                if data.receiveReset == 0 then --receiveReset   0是累计 1是每日
                    if data.targetType and type(data.targetType) ~= "userdata" and  data.targetType ==  102 then --targetType  100局数任务 102大赢家次数
                        contentTex.text = string.format("在本亲友圈累计完成大赢家%s次，即可获得%s%s",data.targetNum,data.appAwards[1].amountShow,awardType[data.appAwards[1].amountType])
                    else
                        contentTex.text = string.format("在本亲友圈累计完成大局数%s局，即可获得%s%s",data.targetNum,data.appAwards[1].amountShow,awardType[data.appAwards[1].amountType])
                    end


                    rewardInfoTex.text = string.format("总共奖励数量:%s  剩余奖励数量:%s",data.receiveLimit, restNum)

                    if data.parlorId == -1 and data.dailyHasNum and data.dailyLimitNum then

                        notRewardTexObj:SetActive(data.dailyHasNum >= data.dailyLimitNum)
                    end
                else
                    if data.targetType and type(data.targetType) ~= "userdata" and  data.targetType ==  102 then --targetType  100局数任务 102大赢家次数
                        contentTex.text = string.format("在本亲友圈每天完成大赢家%s次，即可获得%s%s",data.targetNum,data.appAwards[1].amountShow,awardType[data.appAwards[1].amountType])
                    else
                        contentTex.text = string.format("在本亲友圈每天完成大局数%s局，即可获得%s%s",data.targetNum,data.appAwards[1].amountShow,awardType[data.appAwards[1].amountType])
                    end

                    rewardInfoTex.text = string.format("每日奖励数量:%s  今日剩余数量:%s",data.receiveLimit, restNum)
                end

                if data.currentTargetNum > data.targetNum then
                    data.currentTargetNum = data.targetNum
                end

                Scrollbar.size = data.currentTargetNum/data.targetNum
                if data.targetType and type(data.targetType) ~= "userdata" and  data.targetType ==  102 then
                    proggressTex.text = data.currentTargetNum .."/".. data.targetNum .."(次)"
                else
                    proggressTex.text = data.currentTargetNum .."/".. data.targetNum .."(大局)"
                end

                notRewardIconObj:SetActive(data.receiveLimit <= data.currentNum )
            elseif data.code == "parlor_invite" then -- 邀请活动



                typeIcon.sprite = typeIconSprHolder:FindSpriteByName("2")
                for i = 1, 3 do
                    if i > data.totalStep then--未开启
                        boxIconList[i].sprite = boxIconSprHolder:FindSpriteByName("3")
                    elseif i <= data.stepNum then--完成打开宝箱
                        boxIconList[i].sprite = boxIconSprHolder:FindSpriteByName("2")
                    else--未完成宝箱
                        boxIconList[i].sprite = boxIconSprHolder:FindSpriteByName("1")
                    end
                end

                contentTex.text = string.format("第%s阶段：邀请%s人完成大局数%s局，即可获得%s%s",numStr[data.currentStep],data.currentStepInviteNum,data.currentStepRoundNum, data.appAwards[1].amountShow,awardType[data.appAwards[1].amountType])

                rewardInfoTex.text = string.format("总共奖励数量:%s  剩余奖励数量:%s",data.receiveLimit, restNum)

                Scrollbar.size =(data.stepNum)*0.33
                notRewardIconObj:SetActive(data.receiveLimit <= data.currentNum and data.stepNum == data.totalStep )
            end




            timeTex.text = string.format("%s至%s",data.beginTime,data.endTime )
            --timeTex.text = string.format("活动时间:%s至%s", os.date("%m/%d  %H:%M:%S", data.beginTime/1000),os.date("%m/%d  %H:%M:%S", data.endTime/1000) )




            endIconObj:SetActive(data.hasEnd)

            getDoneIconObj:SetActive(data.isReceive == 1 )
            deleteButton:SetActive(data.parlorId ~= -1 and (self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN"  ))

            InvitInfoButton:SetActive( data.code == "parlor_invite" )
            InvitButton:SetActive( data.code == "parlor_invite" )
            proggressTex.gameObject:SetActive( data.code == "parlor" )
        end
    end

    function MuseumActiveView:fillItem_inviteInfo(item)
        local data = item.data
        local headIcon= GetComponentWithPath(item.gameObject,"Image",ComponentTypeName.Image)
        local Name = GetComponentWithPath(item.gameObject,"Name",ComponentTypeName.Text)
        local Count = GetComponentWithPath(item.gameObject,"Count",ComponentTypeName.Text)

        if(data) then
            self:image_load_sprite(headIcon, data.headImg)
            Name.text = data.nickname
            Count.text = data.roundNum
        end
    end

    function MuseumActiveView:get_item(data, i,type)
        local obj = nil
        local item = {}
        if(i<=#self.contents[type] and self.contents[type][i] ~= self.loadButton ) then
            obj = self.contents[type][i]
        else
            obj = TableUtil.clone(self.copyItem[type],self.copyParent[type],Vector3.zero)
        end
        obj.name = "item_" .. i
        obj.gameObject:SetActive(true)
        item.gameObject = obj
        item.data = data
        return item
    end

    function MuseumActiveView:reset(type)
        self.contents[type] = TableUtil.get_all_child(self.copyParent[type])
        for j=1,#self.contents[type] do
            ComponentUtil.SafeSetActive(self.contents[type][j], false)
        end

    end

    return MuseumActiveView