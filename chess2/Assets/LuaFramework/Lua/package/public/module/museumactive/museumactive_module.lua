local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumActiveModule = class("museumActiveModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local GameManager = ModuleCache.GameManager

function MuseumActiveModule:initialize(...)
    -- 开始初始化                view        model           模块数据
    ModuleBase.initialize(self, "museumactive_view", nil, ...)

    self:initUIListener(self.view.everyDayObj)
    self:initUIListener(self.view.totalObj)
    self:initUIListener(self.view.inviteObj)
    self.view.titleToggles[2].onValueChanged:AddListener(function(bool)
        if bool then
            self.view:reset(1)
            self:getParlorActivityList()
        end
    end)
end

-- 绑定module层的交互事件
function MuseumActiveModule:on_module_event_bind()
    self:subscibe_module_event("jPush_manager", "jPush_parlor_activity_pay", function(eventHead, eventData)
        print("#####推送通知museumactive####", eventData.type, eventData.data)
        if eventData.type == "parlor_activity_pay" then
            --付费成功推送通知
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(eventData.message or "活动创建成功!")
            self.view.titleToggles[2].isOn = false
            self.view.titleToggles[2].isOn = true

            --elseif eventData.type == "return_activity_amount" then
            --	--删除活动退款推送
            --	ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(eventData.data, function()
            --
            --	end )

        end
    end)
end

function MuseumActiveModule:initUIListener(tableObj)
    tableObj.startTime_dropdown.onValueChanged:AddListener(function(idx)
        if idx == 0 then
            tableObj.endTime_dropdown.options:Clear()
        else
            self.view:updateEndTimeData(tableObj)
            tableObj.startTime_dropdown.captionText.text = tableObj.startTime_dropdown.captionText.text .. " 00:00:00"
        end

        tableObj.endTime_dropdown.value = 0
        if tableObj.activeTime_text ~= nil then
            self.view:updateConfirmInfo(tableObj)
        end 
    end)

    tableObj.endTime_dropdown.onValueChanged:AddListener(function(idx)

        if tableObj.startTime_dropdown.value == 0 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先选择活动开始时间")
            return
        end

        tableObj.endTime_dropdown.captionText.text = tableObj.endTime_dropdown.captionText.text .. " 23:59:59"
        if tableObj.activeTime_text ~= nil then
            self.view:updateConfirmInfo(tableObj)
        end 
    end)

    if tableObj.rewardVule_input ~= nil then
        tableObj.rewardVule_input.onEndEdit:AddListener(function(str)
            if str == "." or str == "" then
                str = "0.00"
            end
            if tonumber(str) > 100 then
                str = 100
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("单个奖励不能超过100元")
            end
            tableObj.rewardVule_input.text = string.format("%0.2f", str)

            self.view:updateConfirmInfo(tableObj)
        end)
    end 

    if tableObj.rewardNum_input ~= nil then
        tableObj.rewardNum_input.onValueChanged:AddListener(function(string)
            self.view:updateConfirmInfo(tableObj)
        end)
    end 

    if tableObj.targetCount_input ~= nil then 
        tableObj.targetCount_input[1].onEndEdit:AddListener(function(string)
            if string == "0" or string == "" then
                tableObj.targetCount_input[1].text = 30
            end
        end)
    end 

end

function MuseumActiveModule:on_show(museumData)
    self.museumData = museumData

    if self.museumData.playerRole == "OWNER" or  self.museumData.playerRole == "ADMIN" then
        self.view.stateSwitcher:SwitchState("Owner")
        self.view.titleToggles[1].isOn = false
        self.view.titleToggles[1].isOn = true

        self.view.inviteTagObj:SetActive( not self.museumData.masterParlorId)
    else
        self.view.stateSwitcher:SwitchState("Other")
        self.view.titleToggles[2].isOn = false
        self.view.titleToggles[2].isOn = true
    end
end

function MuseumActiveModule:on_hide()

end

function MuseumActiveModule:on_destroy()

end

function MuseumActiveModule:on_click(obj, arg)
    print_debug(obj.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ImageBack" then
        ModuleCache.ModuleManager.hide_module("public", "museumactive")

    elseif obj.name == "everdayCreate" then
        self:addParlorActivity(1)
    elseif obj.name == "totalCreate" then
        self:addParlorActivity(0)
    elseif obj.name == "inviteCreate" then
        self:addInviteAvtivity()
    elseif obj.name == "loadButton" then
        self:getParlorActivityList(true)

    elseif obj.name == "deleteButton" then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确认删除此活动吗？删除活动后剩余的奖励将会返回到创建者的红包内。"), function()
            local array = string.split(obj.gameObject.transform.parent.name, "_")
            local data = self.view.activeListData[tonumber(array[2])]

            self:delAndReturnParlorActivityAmount(data.activityId)
        end, nil)

    elseif obj.name == "checkButton" then
        ModuleCache.ModuleManager.show_module("public", "museumactiverecord", self.museumData)

    elseif obj.name == "InvitInfoButton" then
        local array = string.split(obj.gameObject.transform.parent.name, "_")
        local data = self.view.activeListData[tonumber(array[2])]

        self:getActivityParlorInviteInfo(data.activityId)
    elseif obj.name == "CloseInviteInfoBtn" then
        self.view.inviteInfoObj:SetActive(false)

    elseif obj.name == "InvitButton" then
        self:inviteWeChatFriend()
    elseif obj.name == "boxBtn_1" or obj.name == "boxBtn_2" or obj.name == "boxBtn_3" then
        local array = string.split(obj.gameObject.transform.parent.parent.name, "_")
        local data = self.view.activeListData[tonumber(array[2])]

        local boxNameList = string.split(obj.name, "_")
        local boxIdx = tonumber(boxNameList[2])
        if # data.inviteInfoList >= boxIdx then
            self.view:refreshRewardBoxInfo(data,obj.transform,boxIdx)
        else
            if boxIdx == 2 then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("未开启第二阶段的邀请活动。")
            elseif boxIdx == 3 then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("未开启第三阶段的邀请活动。")
            end

        end

    elseif obj.name == "EnterBtn" then
        self.view.awardTipsObj:SetActive(false)
    end
end

function MuseumActiveModule:inviteWeChatFriend()
    self.shareData = { }
    self.shareData.userID = self.modelData.roleData.userID
    self.shareData.roomType = 0
    self.shareData.type = 2
    self.shareData.parlorId = self.museumData.orginalParlorNum
    self.shareData.realParlorId = self.museumData.orginalParlorId
    self.shareData.roomId = self.museumData.orginalParlorNum

    self.shareData.parlorBoxId = self.museumData.curBoxData.boxId
    self.shareData.launchRoundStatus = self.museumData.launchRoundStatus

    --TODO XLQ 亲友圈房间信息界面分享不需要显示几缺几
    --self.shareData.totalPlayer = self.data.museumData.playerCount
    --self.shareData.curPlayer = #self.data.data.players
    --self.shareData.totalGames = self.data.museumData.roundCount
    --self.shareData.comeIn = false   --等袁浩跟他们确认

    local playRule = TableUtil.convert_rule(self.museumData.curBoxData.playRule)

    local gameName = ""
    if playRule.gameName and playRule.gameName ~= "" then
        gameName = playRule.gameName
    else--有得rule里没有 playRule.gameName
        local wanfaType = Config.GetWanfaIdx(playRule.GameType)
        gameName = Config.get_create_name(wanfaType)
    end

    self.shareData.gameName_full = gameName
    --print("-------------self.shareData.gameName_full:",self.shareData.gameName_full)

    ModuleCache.ShareManager().shareAppDownload(self.shareData, false)
end

function MuseumActiveModule:delAndReturnParlorActivityAmount(activityId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/delAndReturnParlorActivityAmount?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            activityId = activityId,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self:getParlorActivityList()
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end)
end

function MuseumActiveModule:getParlorActivityList(isloadMore)
    local curPageNum = 1
    if self.DataTab and self.DataTab.page then
        curPageNum = self.DataTab.page
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/getParlorActivityList?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            parlorId = self.museumData.id,
            pageNum = curPageNum,
            pageSize = 10
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            if isloadMore and self.DataTab then
                for i = 1, #retData.data.list do
                    table.insert(self.DataTab.list, #self.DataTab.list + 1, retData.data.list[i])
                end
            else
                self.DataTab = retData.data
            end

            self.view:initLoopScrollViewList(self.DataTab, self.museumData)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        --if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
        --    if wwwErrorData.www.text then
        --        local retData = wwwErrorData.www.text
        --        retData = ModuleCache.Json.decode(retData)
        --        if retData.errMsg then
        --            retData = ModuleCache.Json.decode(retData.errMsg)
        --            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
        --        end
        --    end
        --end
    end)
end

--邀请好友活动创建
function MuseumActiveModule:addInviteAvtivity()
    if self.view.inviteObj.infoByIndex == nil then return end
    if self.view.inviteObj.startTime_dropdown.value == 0 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请选择活动开始时间。")
        return
    elseif self.view.inviteObj.endTime_dropdown.value == 0 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请选择活动结束时间。")
        return
    end
    local contrast = {}
    local contrastData = {}
    for i = 1, 3 do
        local contrast = self.view.inviteObj.infoByIndex[i]
        contrastData[i] = {
            InviteCount = contrast.InviteCount.text == "" and 0 or tonumber(contrast.InviteCount.text),
            AchieveInning = contrast.AchieveInning.text == "" and 0 or tonumber(contrast.AchieveInning.text),
            AchieveMoney = contrast.AchieveMoney.text == "" and 0 or tonumber(contrast.AchieveMoney.text),
            AchieveCount = contrast.AchieveCount.text == "" and 0 or tonumber(contrast.AchieveCount.text),
        }
    end

    for i = 3, 1, -1 do
        if contrastData[i].InviteCount== 0 and contrastData[i].AchieveInning == 0 and  contrastData[i].AchieveMoney == 0
            and  contrastData[i].AchieveCount == 0 then
                table.remove(contrastData, i)
        end 
    end

    local tempDatas =  {
        uid = self.modelData.roleData.userID,
        parlorId = self.museumData.id,
        beginTime = self.view.inviteObj.startTimeData[self.view.inviteObj.startTime_dropdown.value] *1000,
        endTime = self.view.inviteObj.endTimeData[self.view.inviteObj.endTime_dropdown.value]*1000,
    }
    if #contrastData <= 0 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("第一阶段数据不能为空")
        return
    end 
    for i = 1, #contrastData do
        if i == 1 then
            if contrastData[i].InviteCount == 0 or contrastData[i].AchieveInning == 0 or contrastData[i].AchieveMoney == 0 or contrastData[i].AchieveCount == 0 then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("第一阶段数据不能为空")
                return
            end
            tempDatas.firstInviteNum = contrastData[i].InviteCount
            tempDatas.firstRoundNum = contrastData[i].AchieveInning
            tempDatas.firstAmount = contrastData[i].AchieveMoney *100
            tempDatas.firstAwardNum = contrastData[i].AchieveCount
        else

            if (contrastData[i].InviteCount <= contrast.InviteCount)  then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("累计邀请人数必须大于前一阶段的人数")
                return
            end
            if (contrastData[i].AchieveInning <= contrast.AchieveInning) then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("每人完成局数必须大于前一阶段的局数")
                return
            end

            if (contrastData[i].AchieveMoney <=0)  then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入奖励金额")
                return
            end
            if (contrastData[i].AchieveCount <=0) then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入奖励数量")
                return
            end

            if i == 2 then
                tempDatas.secondInviteNum = contrastData[i].InviteCount
                tempDatas.secondRoundNum = contrastData[i].AchieveInning
                tempDatas.secondAmount = contrastData[i].AchieveMoney*100
                tempDatas.secondAwardNum = contrastData[i].AchieveCount
            elseif i == 3 then
                tempDatas.thirdInviteNum = contrastData[i].InviteCount
                tempDatas.thirdRoundNum = contrastData[i].AchieveInning
                tempDatas.thirdAmount = contrastData[i].AchieveMoney*100
                tempDatas.thirdAwardNum = contrastData[i].AchieveCount
            end 
        end
        contrast = contrastData[i]
    end

    local _cost = 0
    for _, value in pairs(contrastData) do
        _cost = _cost + value.AchieveMoney * value.AchieveCount
    end
    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确定花费%0.2f元创建活动吗？未发完的奖励将会退回到您的红包内。", _cost), function()

        local requestData = {
            baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/addParlorInviteActivity?",
            showModuleNetprompt = true,
            isPost = true,
            params = tempDatas,
            }
        self:http_get(requestData, function(wwwData)
            local retData = wwwData.www.text
            retData = ModuleCache.Json.decode(retData)
            if (retData.success) then
                ModuleCache.PayManager().getPayTypeByMoney(_cost *100, retData.data.activityId) --
            end
        end, function(wwwErrorData)
            print(wwwErrorData.error)
            --if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            --    if wwwErrorData.www.text then
            --        local retData = wwwErrorData.www.text
            --        retData = ModuleCache.Json.decode(retData)
            --        if retData.errMsg then
            --            retData = ModuleCache.Json.decode(retData.errMsg)
            --            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
            --        end
            --    end
            --end
        end)
    end, nil)
end

function MuseumActiveModule:addParlorActivity(activeType)
    --activeType	 1 : 每日任务		0：累计任务



    local tableObj = self.view.everyDayObj
    if activeType == 0 then
        tableObj = self.view.totalObj
    end

    if tableObj.beginTime == 0 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请选择活动开始时间。")
        return
    elseif tableObj.endTime == 0 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请选择活动结束时间。")
        return
    elseif tableObj.rewardVule == 0 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请填入完成任务后的红包奖励金额。")
        return
    elseif tableObj.rewardNum == 0 then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请填入任务发放奖励的数量。")
        return
    end

    local cost = tableObj.rewardVule * tableObj.rewardNum * tableObj.activeTime
    if tableObj == self.view.totalObj then
        cost = tableObj.rewardVule * tableObj.rewardNum
    end

    local targetType = 100
    local targetNum = tonumber(tableObj.targetCount_input[1].text)
    if tableObj.targetType_toggle[2].isOn then
        targetType = 102
        targetNum = tonumber(tableObj.targetCount_input[2].text)
    end

    ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确定花费%0.2f元创建活动吗？未发完的奖励将会退回到您的红包内。", cost), function()
        local requestData = {
            baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "activity/addParlorActivity?",
            showModuleNetprompt = true,
            params = {
                uid = self.modelData.roleData.userID,
                parlorId = self.museumData.id,
                beginTime = tableObj.beginTime,
                endTime = tableObj.endTime,
                targetNum = targetNum, --任务目标数量
                amount = tableObj.rewardVule * 100, --string.format("%0.2f", ) , -- 单个任务奖励金额 元(保留两位小数)
                awardNum = tableObj.rewardNum, -- 每天发放红包个数
                receiveReset = activeType,
                targetType = targetType, --任务目标类型  100 ：桌数， 102 ：大赢家次数
            }
        }
        self:http_get(requestData, function(wwwData)
            local retData = wwwData.www.text
            retData = ModuleCache.Json.decode(retData)
            if (retData.success) then
                local _cost = tableObj.rewardVule * tableObj.rewardNum * tableObj.activeTime
                if tableObj == self.view.totalObj then
                    _cost = tableObj.rewardVule * tableObj.rewardNum
                end
                ModuleCache.PayManager().getPayTypeByMoney(_cost * 100, retData.data.activityId)
            end
        end, function(wwwErrorData)
            print(wwwErrorData.error)
            if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
                if wwwErrorData.www.text then
                    local retData = wwwErrorData.www.text
                    retData = ModuleCache.Json.decode(retData)
                    if retData.errMsg then
                        retData = ModuleCache.Json.decode(retData.errMsg)
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                    end
                end
            end
        end)
    end, nil)
end

function MuseumActiveModule:getActivityParlorInviteInfo(activityId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/getActivityParlorInviteInfo?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            parlorId = self.museumData.id,
            activityId = activityId,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.view.inviteInfoObj:SetActive(true)
            self.view:initLoopScrollViewList_inviteInfo(retData.data)
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end


return MuseumActiveModule


