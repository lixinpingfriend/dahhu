---
--- Created by dengcheng.
--- DateTime: 2018/11/14 上午10:28
---
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class AgentView
local AgentView = Class('agentView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponent = ModuleCache.ComponentManager.GetComponent
local FindGameObject = ModuleCache.ComponentManager.FindGameObject
local ComponentUtil = ModuleCache.ComponentUtil

function AgentView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/agent/public_agent.prefab", "Public_Agent", 0)
    -- 初始View
    View.set_1080p(self)
    self.agentObj = FindGameObject(self.root, "info")
    self.uiSwitcher = GetComponent(self.agentObj,"UIStateSwitcher")
    --右上角切换玩法
    self.switchGameObj = GetComponentWithPath(self.root, "TopRight/Switch", ComponentTypeName.RectTransform).gameObject
    self.textSwitchGameName =  GetComponentWithPath(self.root, "TopRight/Switch/Text", ComponentTypeName.Text)
    --常见问题
    self.commonProblem = FindGameObject(self.agentObj, "CommonProblem")
    --钻石充值下的toggle
    self.rechargeSwitcher = GetComponentWithPath(self.agentObj,"Center/recharge","UIStateSwitcher")
    self.chargeToggles = {}
    self.chargeToggleSwitchers = {}
    self.chargeTogglesObj = FindGameObject(self.agentObj,"Center/recharge/toggles")
    local chargeToggles = TableUtil.get_all_child(self.chargeTogglesObj)
    for k, v in ipairs(chargeToggles) do
        self.chargeToggles[k] = GetComponent(v, ComponentTypeName.Toggle)
        self.chargeToggleSwitchers[k] = GetComponent(v, "UIStateSwitcher")
    end
    self.rechargeNormal = FindGameObject(self.agentObj, "Center/recharge/normal")
    self.giveSwitcher = GetComponent(self.rechargeNormal,"UIStateSwitcher") --赠送状态控制
    self.gameUserRemain = GetComponentWithPath(self.agentObj,"Center/recharge/normal/gameUserRemain",ComponentTypeName.Text)
    self.agentRemain = GetComponentWithPath(self.agentObj,"Center/recharge/normal/agentRemain",ComponentTypeName.Text)
    --self.btnRechargeRecord = GetComponentWithPath(self.rechargeNormal,"ButtonRechargeRecord",ComponentTypeName.Button)
    --①充值到账户
    self.rechargeItem = FindGameObject(self.agentObj, "Center/recharge/gameUser/item")
    self.accountItemParent = FindGameObject(self.agentObj, "Center/recharge/gameUser/accountScroll/Viewport/Content").transform
    --③充值到亲友圈
    self.palorItem = GetComponentWithPath(self.agentObj, "Center/recharge/guild/guildItem",ComponentTypeName.RectTransform).gameObject
    self.palorItemParent = GetComponentWithPath(self.agentObj, "Center/recharge/guild/guildShow/guildScroll/Viewport/Content",ComponentTypeName.RectTransform).transform
    self.palorProductParent = GetComponentWithPath(self.agentObj, "Center/recharge/guild/guildShow/guildItemScroll/Viewport/Content",ComponentTypeName.RectTransform).transform
    self.emptyPalor = GetComponentWithPath(self.agentObj, "Center/recharge/guild/emptyPalor",ComponentTypeName.RectTransform).gameObject
    --赠送钻石
    self.inputGiveID = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveNum/InputGiveID",ComponentTypeName.InputField)
    self.inputGiveNum = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveNum/InputGiveNum",ComponentTypeName.InputField)
    self.num_giveUser = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveNum/giveUser",ComponentTypeName.RectTransform).gameObject
    self.num_agentRemain = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveNum/agentRemain",ComponentTypeName.Text)
    --赠送商品
    self.pro_inputGiveID = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveProduct/InputGiveID",ComponentTypeName.InputField)
    self.pro_giveUser = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveProduct/giveUser",ComponentTypeName.RectTransform).gameObject
    self.itemPrice = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveProduct/giveProduct/price",ComponentTypeName.Text)
    self.itemName = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveProduct/giveProduct/title/itemName",ComponentTypeName.Text)
    self.itemNum = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveProduct/giveProduct/num",ComponentTypeName.Text)
    self.gameName = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveProduct/giveProduct/title/gameName",ComponentTypeName.Text)
    self.gameIcon = GetComponentWithPath(self.agentObj,"Center/recharge/normal/giveProduct/giveProduct/title/titleIcon",ComponentTypeName.Image)
    --记录
    self.recordToggles = {}
    self.recordToggleSwitchers = {}
    local togglesParent = GetComponentWithPath(self.root,"record/record/toggles",ComponentTypeName.RectTransform)
    local recordToggleObjs = TableUtil.get_all_child(togglesParent)
    for k,v in ipairs(recordToggleObjs) do
        self.recordToggles[k] = GetComponent(v, ComponentTypeName.Toggle)
        self.recordToggleSwitchers[k] = GetComponent(v, "UIStateSwitcher")
    end
    self.recordParent = GetComponentWithPath(self.root,"record/record/recordScroll/Viewport/Content",ComponentTypeName.RectTransform).transform
    self.recordItem = GetComponentWithPath(self.root,"record/record/item",ComponentTypeName.RectTransform).gameObject
    self.pageNum = GetComponentWithPath(self.root,"record/record/page/Text",ComponentTypeName.Text)
    self.previousPage = GetComponentWithPath(self.root,"record/record/page/previousPage",ComponentTypeName.Button).gameObject
    self.nextPage = GetComponentWithPath(self.root,"record/record/page/nextPage",ComponentTypeName.Button).gameObject
    self.previousGrayPage = GetComponentWithPath(self.root,"record/record/page/previousGrayPage",ComponentTypeName.Button).gameObject
    self.nextGrayPage = GetComponentWithPath(self.root,"record/record/page/nextGrayPage",ComponentTypeName.Button).gameObject

    ComponentUtil.SafeSetActive(self.rechargeItem, false)
    ComponentUtil.SafeSetActive(self.palorItem, false)
    ComponentUtil.SafeSetActive(self.commonProblem, false)
    ComponentUtil.SafeSetActive(self.recordItem, false)

end

function AgentView:showView()
    self:switchUiState("normal")
    self:switchRechargeState("game")
    self:switchGiveState("none")
end

function AgentView:switchUiState(stateName)
    self.uiSwitcherStateName = stateName
    self.uiSwitcher:SwitchState(stateName)
end
function AgentView:switchRechargeState(stateName)
    self.rechargeSwitcherStateName = stateName
    self.rechargeSwitcher:SwitchState(stateName)
end
function AgentView:switchGiveState(stateName)
    self.giveSwitcherStateName = stateName
    self.giveSwitcher:SwitchState(stateName)
end

function AgentView:on_view_init()
end

function AgentView:showSwitch(show)
    ComponentUtil.SafeSetActive(self.switchGameObj, show)
end

function AgentView:getAccountStatus()
    self.gameUserRemain.text = Util.filterPlayerGoldNum(self.modelData.agentData.userRemainCoin)
    self.agentRemain.text = Util.filterPlayerGoldNum(self.modelData.agentData.agentRemainCoin)
    self.num_agentRemain.text = Util.filterPlayerGoldNum(self.modelData.agentData.agentRemainCoin) --赠送钻石界面的显示余额
end

--显示商品列表
function AgentView:showItmes(itemDatas,rechargeType)
    self.itemDatas = itemDatas
    local objs = nil
    if rechargeType == 3  then
        objs = TableUtil.get_all_child(self.palorProductParent) --充值到亲友圈时,商品排布位置不同
    else
        objs = TableUtil.get_all_child(self.accountItemParent)
    end
    for i = 1, #objs do
        ComponentUtil.SafeSetActive(objs[i], false)
    end
    for i = 1, #itemDatas do
        local obj = nil
        --local item = {}
        if (i <= #objs) then
            obj = objs[i]
        else
            if rechargeType == 3 then
                obj = TableUtil.clone(self.rechargeItem,self.palorProductParent.gameObject,Vector3.zero)
            else
                obj = TableUtil.clone(self.rechargeItem, self.accountItemParent.gameObject, Vector3.zero)
            end
        end
        obj.name = i .. "" --后面根据名字来取数据
        ComponentUtil.SafeSetActive(obj, true)
        --item.gameObject = obj
        --item.data = self.products[i]
        self:setProductData(obj, itemDatas[i],rechargeType)
    end
end
--显示单个商品信息
function AgentView:setProductData(item,itemData,rechargeType)
    local itemName = GetComponentWithPath(item,"title/itemName",ComponentTypeName.Text)
    local gameName = GetComponentWithPath(item,"title/gameName",ComponentTypeName.Text)
    local gameIcon = GetComponentWithPath(item,"title/titleIcon",ComponentTypeName.Image)
    local itemPrice = GetComponentWithPath(item,"price",ComponentTypeName.Text)
    local itemNum = GetComponentWithPath(item,"num",ComponentTypeName.Text)
    local itemGiveNum = GetComponentWithPath(item,"zengsong",ComponentTypeName.Text)
    local itemGiveBg = GetComponentWithPath(item,"zengsongBg",ComponentTypeName.Image)
    local userButton = GetComponentWithPath(item,"userButton",ComponentTypeName.RectTransform).gameObject
    local palorButton = GetComponentWithPath(item,"palorButton",ComponentTypeName.RectTransform).gameObject
    local tehuiObj = GetComponentWithPath(item,"title/tehuiIcon",ComponentTypeName.RectTransform).gameObject
    ---@type UnityEngine.UI.Text
    local tehuiText = GetComponentWithPath(item,"title/tehuiIcon/Text",ComponentTypeName.Text)
    itemName.text = itemData.productName
    itemPrice.text = "¥ "..itemData.salePrice
    itemNum.text = tostring(itemData.num)
    itemGiveNum.text = "再送"..itemData.giveNum.."钻石"  --TO DO 根据货币类型显示
    itemGiveNum.enabled = itemData.giveNum > 0
    itemGiveBg.enabled = itemData.giveNum > 0
    if itemData.saleTag == ModuleCache.Json.null then
        itemData.saleTag = ""
    end
    tehuiText.text = itemData.saleTag
    ComponentUtil.SafeSetActive(tehuiObj, itemData.saleTag ~= "")
    ComponentUtil.SafeSetActive(userButton, rechargeType == 2)
    ComponentUtil.SafeSetActive(palorButton, rechargeType ~= 2)
    local playMode = ModuleCache.PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
    gameName.text = playMode.name
    gameIcon.sprite = ModuleCache.PlayModeUtil.getHeadIconRes(playMode)
    --gameIcon:SetNativeSize()
    --限时显示
    if (itemData.isLimitTime) then
        --是否限时
        local curTime = os.time()
        local endTime = self:getDateByString(itemData.activityEndTime)
        if endTime then
            local sec = tonumber(endTime) - tonumber(curTime)
            if (sec > 0) then
                self:subscibe_time_event(sec, false, 1):OnUpdate(function(t)
                    t = t.surplusTimeRound
                    itemName.text = self:getTimeString(t)
                end):OnComplete(function(...)
                    ModuleCache.ModuleManager.get_module("public", "shop"):get_shop_server_data()
                end)
            end
        end
    end
end
function AgentView:getDateByString(dateStr)
    if (#dateStr < 16) then
        return nil
    end
    local Y = string.sub(dateStr, 1, 4)
    local M = string.sub(dateStr, 6, 7)
    local D = string.sub(dateStr, 9, 10)
    local H = string.sub(dateStr, 12, 13)
    local MM = string.sub(dateStr, 15, 16)
    local dateTime = os.time { year = Y, month = M, day = D, hour = H, min = MM, sec = 0 }
    return dateTime
end
-- 将秒数时间转换为 00:00:00
function AgentView:getTimeString(second)
    local day = math.floor(second / 86400)
    local hour = math.fmod(math.floor(second / 3600), 24)
    local min = math.fmod(math.floor(second / 60), 60)
    local sec = math.fmod(second, 60)
    if (#tostring(hour) == 1) then
        hour = "0" .. hour
    end
    if (#tostring(min) == 1) then
        min = "0" .. min
    end
    if (#tostring(sec) == 1) then
        sec = "0" .. sec
    end
    local str = hour .. ":" .. min .. ":" .. sec
    if day > 0 then
        str = day .. "天 " .. hour .. ":" .. min .. ":" .. sec
    end

    --if self.curPage == 6 then
    str = "限时" .. str
    --end

    return str
end

function AgentView:getData(name)
    return self.itemDatas[tonumber(name)],self.guildId
end

--显示亲友圈列表
function AgentView:showParlorList(dataList,selectParlorId)
    self.palorList = dataList
    local objs = TableUtil.get_all_child(self.palorItemParent)
    for i = 1, #objs do
        self:removePalorListener(objs[i])
        ComponentUtil.SafeSetActive(objs[i], false)
    end
    if dataList == ModuleCache.Json.null or #dataList <= 0 then
        ComponentUtil.SafeSetActive(self.emptyPalor, true)
        return
    else
        ComponentUtil.SafeSetActive(self.emptyPalor, false)
    end
    local selectIndex = 1
    if selectParlorId then
        for i = 1, #dataList do
            if dataList[i].parlorId == selectParlorId then
                selectIndex = i
                break
            end
        end
    end
    for i = 1, #dataList do
        local obj = nil
        --local item = {}
        if (i <= #objs) then
            obj = objs[i]
        else
            obj = TableUtil.clone(self.palorItem, self.palorItemParent.gameObject, Vector3.zero)
        end
        obj.name = i .. "" --后面根据名字来取数据
        ComponentUtil.SafeSetActive(obj, true)
        --item.gameObject = obj
        --item.data = self.products[i]
        self:setPalorData(obj, dataList[i],i == selectIndex)
    end
end

function AgentView:setPalorData(obj,data,showChoose)
    local itemName = GetComponentWithPath(obj,"guildName",ComponentTypeName.Text)
    local itemID = GetComponentWithPath(obj,"guildID",ComponentTypeName.Text)
    local itemDes = GetComponentWithPath(obj,"guildRule",ComponentTypeName.Text)
    local itemChoose = GetComponent(obj,ComponentTypeName.Toggle)
    itemChoose.isOn = false
    itemID.text = string.format("圈号:0%s(%s人)", data.parlorNum, data.playerNum)
    itemName.text = data.parlorName
    local gameList = ""
    for i = 1, #data.boxGameNameList do
        gameList = gameList..data.boxGameNameList[i].gameName
        if i < #data.boxGameNameList then
            gameList = gameList..","
        end
    end
    itemDes.text = gameList
    local onChoose = function(choose)
        if not choose then return end
        self.guildId = data.id
    end
    itemChoose.onValueChanged:RemoveAllListeners()
    itemChoose.onValueChanged:AddListener(onChoose)
    if itemChoose.isOn and showChoose then
        onChoose(true) --如果第一个已经是isOn,手动调一个onChoose
    end
    itemChoose.isOn = showChoose
end
function AgentView:removePalorListener(obj)
    local itemChoose = GetComponent(obj,ComponentTypeName.Toggle)
    itemChoose.onValueChanged:RemoveAllListeners()
end
--显示赠送钻石界面
function AgentView:showGiveNum(show)
    --ComponentUtil.SafeSetActive(self.giveNumObj, show)
    print("showGiveNum")
    self:switchGiveState(show and "giveNum" or "none")
    ComponentUtil.SafeSetActive(self.num_giveUser, false)
end
--显示赠送商品界面
function AgentView:showGiveProduct(show,productData)
    self:switchGiveState(show and "givePro" or "none")
    ComponentUtil.SafeSetActive(self.pro_giveUser, false)
    if show and productData then
        self.itemName.text = productData.productName
        self.itemPrice.text = "¥ "..productData.salePrice
        self.itemNum.text = tostring(productData.num)
        local playMode = ModuleCache.PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
        self.gameName.text = playMode.name
        self.gameIcon.sprite = ModuleCache.PlayModeUtil.getHeadIconRes(playMode)
    end
end
--显示查询结果
function AgentView:showCheckResult(data)
    local giveUserObj = nil
    if self.giveSwitcherStateName == "giveNum" then
        ComponentUtil.SafeSetActive(self.num_giveUser,true)
        giveUserObj = self.num_giveUser
    elseif self.giveSwitcherStateName == "givePro" then
        ComponentUtil.SafeSetActive(self.pro_giveUser,true)
        giveUserObj = self.pro_giveUser
    end
    local userName = GetComponentWithPath(giveUserObj,"userName",ComponentTypeName.Text)
    local userID = GetComponentWithPath(giveUserObj,"userID",ComponentTypeName.Text)
    local userIcon = GetComponentWithPath(giveUserObj,"userIcon",ComponentTypeName.Image)
    userName.text = data.playerNickName
    userID.text = data.playerId
    if userIcon then
        self:startDownLoadHeadIcon(userIcon, data.playerHeadImg, function (sprite )
            userIcon.sprite = sprite
        end)
    end
end

--显示充值记录
function AgentView:showRechargeRecord(data)
    local dataList = data.list
    self.recordDatas = dataList
    local objs = TableUtil.get_all_child(self.recordParent)
    for i = 1, #objs do
        --self:removePalorListener(objs[i])
        ComponentUtil.SafeSetActive(objs[i], false)
    end
    for i = 1, #dataList do
        local obj = nil
        --local item = {}
        if (i <= #objs) then
            obj = objs[i]
        else
            obj = TableUtil.clone(self.recordItem, self.recordParent.gameObject, Vector3.zero)
        end
        obj.name = i .. "" --后面根据名字来取数据
        ComponentUtil.SafeSetActive(obj, true)
        --item.gameObject = obj
        --item.data = self.products[i]
        self:setRecordData(obj, dataList[i],false)
    end
    self:showPageData(data)
end
--显示赠送记录
function AgentView:showGiveRecord(data)
    local dataList = data.list
    self.recordDatas = dataList
    local objs = TableUtil.get_all_child(self.recordParent)
    for i = 1, #objs do
        --self:removePalorListener(objs[i])
        ComponentUtil.SafeSetActive(objs[i], false)
    end
    for i = 1, #dataList do
        local obj = nil
        --local item = {}
        if (i <= #objs) then
            obj = objs[i]
        else
            obj = TableUtil.clone(self.recordItem, self.recordParent.gameObject, Vector3.zero)
        end
        obj.name = i .. "" --后面根据名字来取数据
        ComponentUtil.SafeSetActive(obj, true)
        --item.gameObject = obj
        --item.data = self.products[i]
        self:setRecordData(obj, dataList[i],true)
    end
    self:showPageData(data)
end

function AgentView:showPageData(data)
    if data.totalPage > 0 then
        self.pageNum.text = "第"..data.page.."/"..data.totalPage.."页"
    else
        self.pageNum.text = "第1/1页"
    end
    local showPrevious = data.page > 1
    local showNext = (data.totalPage > 1 and data.page < data.totalPage)
    ComponentUtil.SafeSetActive(self.previousPage, showPrevious)
    ComponentUtil.SafeSetActive(self.previousGrayPage, not showPrevious)
    ComponentUtil.SafeSetActive(self.nextPage, showNext)
    ComponentUtil.SafeSetActive(self.nextGrayPage, not showNext)
end

function AgentView:setRecordData(obj,data,isGiveRecord)
    local game = GetComponentWithPath(obj,"game",ComponentTypeName.Text)
    local time = GetComponentWithPath(obj,"time",ComponentTypeName.Text)
    local num = GetComponentWithPath(obj,"num",ComponentTypeName.Text)
    local price = GetComponentWithPath(obj,"price",ComponentTypeName.Text)
    local target = GetComponentWithPath(obj,"targetAgent/target",ComponentTypeName.Text)
    local targetUser = FindGameObject(obj,"targetUser")
    local targetAgent = FindGameObject(obj,"targetAgent")
    local buyAgain = FindGameObject(obj,"buyAgain")
    local giveAgain = FindGameObject(obj,"giveAgain")
    local isUser = false
    local playMode = ModuleCache.PlayModeUtil.getConfigByAppAndGameName(data.gameId)
    game.text = playMode and playMode.name or data.gameId
    local receiverType = isGiveRecord and data.receiverTargetType or data.receiverType
    if receiverType  == 1 then
        target.text = "推广员"
    elseif receiverType  == 2 then
        isUser = true
        --target.text = "玩家"
    elseif receiverType  == 3 then
        target.text = "亲友圈"
    end
    ComponentUtil.SafeSetActive(buyAgain,not isGiveRecord)
    ComponentUtil.SafeSetActive(giveAgain,isGiveRecord and receiverType  ~= 1) --赠送给代理不显示
    local userIcon
    if isGiveRecord then
        num.text = tostring(data.coins)--tostring(data.giveNum)
        time.text = data.createTime
        ComponentUtil.SafeSetActive(targetUser,isUser)
        ComponentUtil.SafeSetActive(targetAgent,not isUser)
        price.text = (data.description == ModuleCache.Json.null and "") or data.description  --..data.operatorName --赠送记录下显示备注
    else
        num.text = tostring(data.productNum)
        price.text = tostring(data.amount)
        time.text = data.rechargeTime
        ComponentUtil.SafeSetActive(targetUser,isUser)
        ComponentUtil.SafeSetActive(targetAgent,not isUser)
    end
    if isUser then
        local userId = GetComponentWithPath(targetUser,"id",ComponentTypeName.Text)
        local userName = GetComponentWithPath(targetUser,"name",ComponentTypeName.Text)
        userIcon = GetComponentWithPath(targetUser,"icon",ComponentTypeName.Image)
        userId.text = tostring(data.receiverId)
        userName.text = data.receiverName
    else
        local userId = GetComponentWithPath(targetAgent,"id",ComponentTypeName.Text)
        if data.receiverName ~= ModuleCache.Json.null then
            userId.text = string.format("0%s", data.receiverName)
        else
            userId.text = tostring(data.receiverId)
        end
    end
    if userIcon then
        self:startDownLoadHeadIcon(userIcon, data.receiverHeadimg, function (sprite )
            userIcon.sprite = sprite
        end)
    end
end
function AgentView:getRecordData(name)
    return self.recordDatas[tonumber(name)]
end

-- 刷新与玩法相关的显示
function AgentView:setGameName()
    --local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.getCurGameId())
    local playMode = ModuleCache.PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)
    self.textSwitchGameName.text = playMode.name
end

return AgentView