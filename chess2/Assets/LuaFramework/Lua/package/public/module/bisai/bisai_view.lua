
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local BiSaiView = Class('biSaiView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local CSmartTimer = ModuleCache.SmartTimer.instance
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local MatchingManager = require("package.public.matching_manager")
local ModuleEventBase = require('core.mvvm.module_event_base')

function BiSaiView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/bisai/public_windowbisai.prefab", "Public_WindowBiSai", 1, nil, 3)
    View.set_1080p(self)
    self.gameModule = ModuleCache.ComponentManager.GetComponent(self.root, "GameModule")
    self.itemList = {}
    self.rewardItemList = {}
    self.timeEvent = {}
    --self.goodsSpriteHolder = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center", "SpriteHolder");
    self.rankSpriteHolder = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "SignUp/Right", "SpriteHolder");

    self.goldNum = GetComponentWithPath(self.root, "Top/Currency/Gold/TextNum", ComponentTypeName.Text)
    self.diamondNum = GetComponentWithPath(self.root, "Top/Currency/Gem/TextNum", ComponentTypeName.Text)
    self.item = GetComponentWithPath(self.root, "Center/ScrollView/Viewport/Content/item", ComponentTypeName.Transform).gameObject

    self.signup = GetComponentWithPath(self.root, "SignUp", ComponentTypeName.Transform).gameObject
    --self.signupMeng = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "MengBan", "UnityEngine.CanvasGroup");
    --self.signupMeng.transform.gameObject:SetActive(false)
    --报名界面
    self.signTitleText = GetComponentWithPath(self.root, "SignUp/Background/Title/Text", ComponentTypeName.Text)
    self.signMatchTypeText = GetComponentWithPath(self.root, "SignUp/Right/Info/MatchType", ComponentTypeName.Text)
    self.signSignNumText = GetComponentWithPath(self.root, "SignUp/Right/Info/SignNum", ComponentTypeName.Text)
    self.signRankAwardText = {}
    self.signRankAwardImg = {}
    for i = 1, 3 do
        self.signRankAwardText[i] = GetComponentWithPath(self.root, "SignUp/Left/Rank3/" .. i .. "/Num", ComponentTypeName.Text)
        self.signRankAwardImg[i] = GetComponentWithPath(self.root, "SignUp/Left/Rank3/" .. i .. "/Icon", ComponentTypeName.Image)
    end
    self.uiStateSignTips = GetComponentWithPath(self.root, "SignUp/Right/Time", "UIStateSwitcher")
    self.uiStateSignButton = GetComponentWithPath(self.root, "SignUp/Right/Button", "UIStateSwitcher")
    self.uiStateSignFee = GetComponentWithPath(self.root, "SignUp/Right/Price", "UIStateSwitcher")
    self.signTimeHourText = GetComponentWithPath(self.root, "SignUp/Right/Time/Tips2/Time/H/Text", ComponentTypeName.Text)
    self.signTimeMinText = GetComponentWithPath(self.root, "SignUp/Right/Time/Tips2/Time/M/Text", ComponentTypeName.Text)
    self.signFeeNumText = GetComponentWithPath(self.root, "SignUp/Right/Price/Fee/Num", ComponentTypeName.Text)
    self.signFeeIconImg = GetComponentWithPath(self.root, "SignUp/Right/Price/Fee/Icon", ComponentTypeName.Image)
    self.signupCanvas = GetComponentWithPath(self.root, "SignUp", "UnityEngine.Canvas")
    self.signItem = GetComponentWithPath(self.root, "SignUp/Left/ScrollView/Viewport/Content/item", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(self.signItem, false)
    ComponentUtil.SafeSetActive(self.item, false)
    self.tag = {}
    for i = 1, 4 do
        self.tag[i] = GetComponentWithPath(self.root, "Bottom/" .. i .. "/Choose", ComponentTypeName.Transform).gameObject
    end
end

function BiSaiView:refreshPlayerInfo(roleData)
    if ((not roleData) or (not roleData.cards)) then
        return
    end
    self.diamondNum.text = Util.filterPlayerGoldNum(tonumber(roleData.cards))
    if roleData.gold then
        self.goldNum.text = Util.filterPlayerGoldNum(roleData.gold)
    else
        self.goldNum.text = "0"
    end
end

function BiSaiView:tagDeal(id)
    for i = 1, 4 do
        if i == id then
            self.tag[i]:SetActive(true)
        else
            self.tag[i]:SetActive(false)
        end
    end
end

function BiSaiView:viewList(data)
    self.gameModule:SetLayers()
    if not data or type(data) ~= "table" then
        return
    end
    for i = 1, #data do
        local info = data[i]
        local target
        if not self.itemList[i] then
            target = self:clone(i .. "", self.item, self.item.transform.parent)
            self.itemList[i] = target
        else
            target = self.itemList[i]

        end
        target:SetActive(false)
        target:SetActive(true)
        local matchIconImg = GetComponentWithPath(target, "Icon", ComponentTypeName.Image)
        MatchingManager:startDownLoadHeadIcon(matchIconImg, info.matchImg, true)

        local matchNameText = GetComponentWithPath(target, "Name", ComponentTypeName.Text)
        matchNameText.text = info.matchName
        local uiStateSubscript = GetComponentWithPath(target, "Subscript", "UIStateSwitcher")
        if info.matchRule == 1 then
            --积分赛
            uiStateSubscript:SwitchState("jifen")
        else
            --淘汰赛
            uiStateSubscript:SwitchState("taotai")
        end
        local uiStateMatchType = GetComponentWithPath(target, "DescText", "UIStateSwitcher")
        if tonumber(info.matchStartModel) == 1 then
            --人满开赛
            uiStateMatchType:SwitchState("person")
        else
            --限时开赛
            local matchTimeText = GetComponentWithPath(target, "DescText/Time", ComponentTypeName.Text)
            matchTimeText.text = info.startTime .. " 开赛"
            uiStateMatchType:SwitchState("time")
            if info.startTimeSecond and type(info.startTimeSecond) == "string" then
                self:daojishi(target, nil, nil, info.startTimeSecond, info.serviceTimeSecond)
            end
        end
        local uiStateMatchStatus = GetComponentWithPath(target, "MatchStatus", "UIStateSwitcher")
        if info.stageStatus == 2 then
            --比赛中
            uiStateMatchStatus:SwitchState("matching")
        elseif info.isUserEntry then
            --已报名
            uiStateMatchStatus:SwitchState("signed")
            local personnum = GetComponentWithPath(target, "MatchStatus/Signed/Person/Num", ComponentTypeName.Text)
            if tonumber(info.matchStartModel) == 1 then
                personnum.text = info.currentEntryNum .. "/" .. info.minUserNum
            else
                personnum.text = info.currentEntryNum .. ""
            end
        else
            --没报名
            uiStateMatchStatus:SwitchState("none")
            local personnum = GetComponentWithPath(target, "MatchStatus/None/Person/Num", ComponentTypeName.Text)
            if tonumber(info.matchStartModel) == 1 then
                personnum.text = info.currentEntryNum .. "/" .. info.minUserNum
            else
                personnum.text = info.currentEntryNum .. ""
            end
            local uiStateMatchPrice = GetComponentWithPath(target, "MatchStatus/None/Price", "UIStateSwitcher")
            if #info.entryConditions == 0 then
                --免费
                uiStateMatchPrice:SwitchState("free")
            else
                uiStateMatchPrice:SwitchState("fee")
                local num = GetComponentWithPath(target, "MatchStatus/None/Price/Fee/Num", ComponentTypeName.Text)
                local icon = GetComponentWithPath(target, "MatchStatus/None/Price/Fee/Num/Icon", ComponentTypeName.Image)
                --icon.transform.localPosition = Vector3.New(0, -1, 0)
                MatchingManager:goodsNameAndIcon(info.entryConditions[1].entryFeeType, icon, num, info.entryConditions[1].entryFeeNum, info.entryConditions[1].entryItemName, info.entryConditions[1].entryItemIcon)
                --print("num宽度：", num.preferredWidth)
                --icon.transform.localPosition = Vector3.New(76 - num.preferredWidth, 0, 0)  --13 ,-8
            end
        end
    end
    if #self.itemList > #data then
        for i = #data + 1, #self.itemList do
            self.itemList[i]:SetActive(false)
        end
    end
end

function BiSaiView:refreshSignupNum(num)
    if num and self.curMatchInfo then
        if tonumber(self.curMatchInfo.matchStartModel) == 1 then
            self.signSignNumText.text = "<color=#E54616FF>" .. num .. "</color>/" .. self.curMatchInfo.minUserNum
        else
            self.signSignNumText.text = "<color=#E54616FF>" .. num .. "</color>"
        end
    end
end

function BiSaiView:daojishi(obj, hText, mText, time, servertime)
    if not servertime then
        servertime = os.time()
    end
    local surTime = time - servertime
    --print("倒计时时间", surTime, time, servertime)
    if surTime > 0 then

        if hText then
            local h = math.floor(surTime / 3600)
            if h > 0 then
                local m = math.ceil((surTime - h * 3600) / 60)
                hText.text = self:paraseNumber(h)
                mText.text = self:paraseNumber(m)
            else
                local m = math.floor((surTime - h * 3600) / 60)
                local s = math.ceil(surTime % 60)
                hText.text = self:paraseNumber(m)
                mText.text = self:paraseNumber(s)
            end
        end

        if self.timeEvent[obj] then
            CSmartTimer:Kill(self.timeEvent[obj].id)
        end
        self.timeEvent[obj] = self:subscibe_time_event(surTime, false, 1):SetIntervalTime(1,
                function(t)
                    if t.surplusTime > 0 and hText then
                        local h = math.floor(t.surplusTime / 3600)
                        local s = math.ceil(t.surplusTime % 60)
                        if h > 0 then
                            local m = math.ceil((t.surplusTime - h * 3600) / 60)
                            hText.text = self:paraseNumber(h)
                            mText.text = self:paraseNumber(m)
                        else
                            local m = math.floor((t.surplusTime - h * 3600) / 60)
                            hText.text = self:paraseNumber(m)
                            mText.text = self:paraseNumber(s)
                        end
                    end
                end
        )                         :OnComplete(function(t)
            if hText then
                hText.text = "00"
                mText.text = "00"
            end
            print("倒计时时间刷新比赛列表")
            ModuleEventBase.dispatch_package_event(self, 'Event_Refresh_Matching', obj ~= self.signup)
        end)
    else
        if hText then
            hText.text = "00"
            mText.text = "00"
        end

        ModuleEventBase.dispatch_package_event(self, 'Event_Refresh_Matching', obj ~= self.signup)
    end
end

function BiSaiView:paraseNumber(num)
    if num < 10 then
        return "0" .. num
    else
        return num .. ""
    end
end

function BiSaiView:match_info_change(id, data, matchdata)
    if self.itemList[id] then
        local obj = self.itemList[id]
        local personNumText = GetComponentWithPath(obj, "Num/Text", ComponentTypeName.Text)
        if tonumber(matchdata.matchStartModel) == 1 then
            local numText = GetComponentWithPath(obj, "Tips/Tips1/Num", ComponentTypeName.Text)
            numText.text = "人数" .. data.currentEntryNum .. "/" .. matchdata.minUserNum
        end
        if matchdata.stageStatus == 1 then
            personNumText.text = "报名人数 " .. data.currentEntryNum
        elseif matchdata.stageStatus == 6 then
            personNumText.text = "报名人数 " .. data.currentEntryNum
        elseif matchdata.stageStatus == 8 then
            if matchdata.isPreEntry then
                personNumText.text = "预约人数 " .. data.preEntryNum
            else
                personNumText.text = "报名人数 " .. data.currentEntryNum
            end
        end
        self:refreshSignupNum(data.currentEntryNum)
    end
end

function BiSaiView:baoming(info)
    self.curMatchInfo = info
    self.signTitleText.text = info.matchName
    self.uiStateSignTips:SwitchState(info.matchStartModel .. "")
    --print("===============,", info.matchStartModel, info.startTimeSecond, info.serviceTimeSecond)
    if tonumber(info.matchStartModel) == 2 then
        self:daojishi(self.signup, self.signTimeHourText, self.signTimeMinText, info.startTimeSecond, info.serviceTimeSecond)
    end
    if info.matchRule == 1 then
        self.signMatchTypeText.text = "积分制"
    else
        self.signMatchTypeText.text = "淘汰制"
    end
    self:refreshSignupNum(info.currentEntryNum)
    if #info.entryConditions == 0 then
        --免费
        self.uiStateSignFee:SwitchState("free")
    else
        self.uiStateSignFee:SwitchState("fee")
        MatchingManager:goodsNameAndIcon(info.entryConditions[1].entryFeeType, self.signFeeIconImg, self.signFeeNumText, info.entryConditions[1].entryFeeNum, info.entryConditions[1].entryItemName, info.entryConditions[1].entryItemIcon)
    end
    if info.stageStatus == 2 then
        self.uiStateSignButton:SwitchState("3")
    else
        if info.isUserEntry then
            self.uiStateSignButton:SwitchState("1")
        else
            self.uiStateSignButton:SwitchState("2")
        end
    end

    for i = 1, #info.awards do
        local awards = info.awards[i]
        if i <= 3 then
            MatchingManager:goodsNameAndIcon(awards.awardType, self.signRankAwardImg[i], self.signRankAwardText[i], awards.awardNum, awards.itemName, awards.itemIcon, awards.awardOther, awards.awardOtherImg)
            self.signRankAwardImg[i].gameObject : SetActive(true)
            self.signRankAwardText[i].gameObject:SetActive(true)
        else
            local item
            if not self.rewardItemList[awards.rank - 3] then
                item = self:clone(awards.awardId, self.signItem, self.signItem.transform.parent)
                self.rewardItemList[awards.rank - 3] = item
            else
                item = self.rewardItemList[awards.rank - 3]
            end
            local rankText = GetComponentWithPath(item, "Rank", ComponentTypeName.Text)
            local feeText = GetComponentWithPath(item, "Fee/Num", ComponentTypeName.Text)
            local iconImg = GetComponentWithPath(item, "Fee/Icon", ComponentTypeName.Image)
            rankText.text = "第" .. awards.rank .. "名："
            MatchingManager:goodsNameAndIcon(awards.awardType, iconImg, feeText, awards.awardNum, awards.itemName, awards.itemIcon, awards.awardOther, awards.awardOtherImg)
            ComponentUtil.SafeSetActive(item, true)
        end
    end
    if #info.awards < 3 then
        for i = #info.awards + 1, 3 do
            self.signRankAwardImg[i] .gameObject: SetActive(false)
            self.signRankAwardText[i].gameObject:SetActive(false)
        end
    end
    if #self.rewardItemList > 0 and #info.awards > 3 and #self.rewardItemList > #info.awards - 3 then
        for i = #info.awards - 2, #self.rewardItemList do
            self.rewardItemList[i]:SetActive(false)
        end
    else
        if #self.rewardItemList > 0 and #info.awards <= 3 then
            for i = 1, #self.rewardItemList do
                self.rewardItemList[i]:SetActive(false)
            end
        end
    end
end

function BiSaiView:baoming_success()
    self.uiStateSignButton:SwitchState("1")
end

function BiSaiView:match_start()
    self.uiStateSignButton:SwitchState("2")
end

function BiSaiView:tuisai_success()
    self.uiStateSignButton:SwitchState("2")
end

function BiSaiView:signUpView(view, anim)
    ComponentUtil.SafeSetActive(self.signup, view)
    self.signupCanvas.sortingOrder = self.canvas.sortingOrder + 5
    --ComponentUtil.SafeSetActive(self.signup, view)
end
function BiSaiView:maxRank(rank)
    if rank > 0 and rank < 4 then
        --self.rankImg.sprite = self.rankSpriteHolder:FindSpriteByName(rank .. "")
    end
end

function BiSaiView:clone(name, obj, parent)
    local target = ComponentUtil.InstantiateLocal(obj, Vector3.zero)
    if not parent then
        parent = obj.transform.parent
    end
    target.transform:SetParent(parent.transform)
    target.transform.localScale = Vector3.one
    target.transform.localPosition = Vector3.one
    target.name = tostring(name)
    ComponentUtil.SafeSetActive(target, true)
    return target
end
function BiSaiView:redTips(data)
    self.mailRed = GetComponentWithPath(self.root, "Top/BtnMail/Red", ComponentTypeName.Transform).gameObject
    self.mailRed:SetActive(data.tips)
end

return BiSaiView