




local Mj3dCenterCom = {}

local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
local UpdateBeat = UpdateBeat
local Time = Time

function Mj3dCenterCom:Init(view,parent)
    ---@type Table3dCommonView
    self.view = view
    self.rootTrans = parent

    self.windTagRoot = GetComponentWithPath(self.rootTrans.gameObject,"dongxinanbei", ComponentTypeName.Transform).gameObject
    self.disableObj = GetComponentWithPath(self.windTagRoot,"disable", ComponentTypeName.Transform).gameObject
    self.dicePlane = GetComponentWithPath(self.windTagRoot,"DicePlane", ComponentTypeName.Transform).gameObject

    self.tagHolder2 = GetComponentWithPath(self.rootTrans.gameObject,"dongxinanbei/Player_2",ComponentTypeName.Transform).gameObject
    self.tagHolder2:SetActive(false)
    self.tagHolder3 = GetComponentWithPath(self.rootTrans.gameObject,"dongxinanbei/Player_3",ComponentTypeName.Transform).gameObject
    self.tagHolder3:SetActive(false)
    self.tagHolder4 = GetComponentWithPath(self.rootTrans.gameObject,"dongxinanbei/Player_4",ComponentTypeName.Transform).gameObject
    self.tagHolder4:SetActive(false)

    local totalPlayerCount = self.view.totalSeat
    local curTagHolder = GetComponentWithPath(self.rootTrans.gameObject,"dongxinanbei/Player_"..totalPlayerCount,ComponentTypeName.Transform).gameObject
    curTagHolder:SetActive(true)
    self.windTags = {}
    for i=1,4 do
        local windTag = {}
        windTag.obj = GetComponentWithPath(curTagHolder,tostring(i), ComponentTypeName.Transform).gameObject
        windTag.liang = GetComponentWithPath(windTag.obj,"liang", ComponentTypeName.Transform).gameObject
        windTag.an = GetComponentWithPath(windTag.obj,"an", ComponentTypeName.Transform).gameObject
        windTag.liangAnimator = GetComponentWithPath(windTag.obj,"liang","UnityEngine.Animator")
        windTag.localSeat = 0
        self.windTags[#self.windTags + 1] = windTag
    end

    self.hideTagObj = GetComponentWithPath(self.windTagRoot,"HideTag",  ComponentTypeName.Transform).gameObject
    self.timingSprite = GetComponentWithPath(self.rootTrans.gameObject, "TimingSprite", "SpriteHolder")
    self.TmingObj = GetComponentWithPath(self.rootTrans.gameObject, "TimingObj",  ComponentTypeName.Transform).gameObject

    self.tenNumbers =
    TableUtil.get_all_child(GetComponentWithPath(self.TmingObj,"1",ComponentTypeName.Transform).gameObject)
    self.unitNumbers =
    TableUtil.get_all_child(GetComponentWithPath(self.TmingObj,"2",ComponentTypeName.Transform).gameObject)

    self.diceObj = GetComponentWithPath(self.rootTrans.gameObject, "DiceObj",  ComponentTypeName.Transform).gameObject
    self.dice1Obj =  GetComponentWithPath(self.diceObj, "tuozi/Cube_1",  ComponentTypeName.Transform).gameObject
    self.dice2Obj =  GetComponentWithPath(self.diceObj, "tuozi/Cube_2",  ComponentTypeName.Transform).gameObject
    self.diceAnimator = GetComponentWithPath(self.diceObj, "tuozi", "UnityEngine.Animator")


    self.dice1s = {}
    for i=1,6 do
        local obj = self.dice1Obj.transform:Find(tostring(i)).gameObject
        self.dice1s[#self.dice1s + 1] = obj
    end
    self.dice2s = {}
    for i=1,6 do
        local obj = self.dice2Obj.transform:Find(tostring(i)).gameObject
        self.dice2s[#self.dice2s + 1] = obj
    end

    self:switchDisableTagType(self.disableStyle.waitAni)
end

---播放打色动效
function Mj3dCenterCom:playDiceAni(dice1,dice2,callBack)
    for i=1,#self.dice1s do
        self.dice1s[i]:SetActive(false)
    end
    for i=1,#self.dice2s do
        self.dice2s[i]:SetActive(false)
    end
    local dice1Obj = self.dice1s[dice1]
    local dice2Obj = self.dice2s[dice2]
    if dice1Obj then
        dice1Obj:SetActive(true)
    end
    if dice2Obj then
        dice2Obj:SetActive(true)
    end
    self.diceObj:SetActive(true)
    self.hideTagObj:SetActive(false)
    self.diceAnimator:Play("tuozinew",-1,0)
    self.TmingObj:SetActive(false)
    self.view:play_voice("common/touzi")
    self.view:subscibe_time_event(2.5, false, 0):OnComplete(function()
        self.TmingObj:SetActive(true)
        self.diceObj:SetActive(false)
        self.hideTagObj:SetActive(true)
        if callBack then
            callBack()
        end
    end)
end

---初始化标记
function Mj3dCenterCom:initWindTag(masterLocalSeat)
    local firstIndex = masterLocalSeat or self.view:server_to_local_seat(0)
    if 1 == firstIndex then
        self.windTagRoot.transform.localEulerAngles = Vector3(0,0,0)
    elseif 2 == firstIndex then
        self.windTagRoot.transform.localEulerAngles = Vector3(0,-90,0)
    elseif 3 == firstIndex then
        self.windTagRoot.transform.localEulerAngles = Vector3(0,-180,0)
    elseif 4 == firstIndex then
        self.windTagRoot.transform.localEulerAngles = Vector3(0,-270,0)
    end
    for i=1,4 do
        local windTag = self.windTags[i]
        windTag.localSeat = firstIndex
        firstIndex = firstIndex + 1
        if firstIndex > 4 then
            firstIndex = 1
        end
    end
end

---刷新标记状态
function Mj3dCenterCom:refreshWindTagState(masterLocalSeat)
    for i = 1,#self.windTags do
        local windTag = self.windTags[i]
        if windTag.localSeat == masterLocalSeat then
            windTag.liang:SetActive(true)
            windTag.liangAnimator.enabled = true
            windTag.liangAnimator:Play("liang",0,0)
            windTag.an:SetActive(true)
        else
            windTag.liang:SetActive(false)
            windTag.an:SetActive(true)
        end
    end
end

---设置标记开启隐藏状态
function Mj3dCenterCom:setTagActive(state)
    self.disableObj:SetActive(not state)
    for i=1,4 do
        local windTag = self.windTags[i]
        windTag.obj:SetActive(state)
    end
    if not state then
        self:switchDisableTagType(self.curDisableStyle)
    else
        self:stopWaitAni()
    end
end

---设置倒计时文字
function Mj3dCenterCom:setTimingText(tenValue,unitValue)
    tenValue = tenValue or -1
    unitValue = unitValue or -1
    for i=0,#self.tenNumbers - 1 do
        self.tenNumbers[i + 1]:SetActive(i == tenValue)
    end
    for i=0,#self.unitNumbers - 1 do
        self.unitNumbers[i + 1]:SetActive(i == unitValue)
    end
end

---@class disableStyle
Mj3dCenterCom.disableStyle =
{
    normal = 1, ---普通模式
    gold = 2, ---金币场模式
    waitAni = 3,
}
---设置标记隐藏状态样式
function Mj3dCenterCom:switchDisableTagType(disableStyle)
    self.curDisableStyle = disableStyle
    self:stopWaitAni()
    local styleObj = nil
    if self.disableStyle.normal == self.curDisableStyle then
        styleObj = GetComponentWithPath(self.windTagRoot,"disable", ComponentTypeName.Transform).gameObject
    elseif self.disableStyle.gold == self.curDisableStyle then
        styleObj = GetComponentWithPath(self.windTagRoot,"disable_gold", ComponentTypeName.Transform).gameObject
    elseif self.disableStyle.waitAni == self.curDisableStyle then
        self:playWaitAni()
        self.disableObj:SetActive(false)
        styleObj = self.disableObj
    end
    styleObj:SetActive(self.disableObj.activeSelf)
    if self.disableObj ~= styleObj then
        self.disableObj:SetActive(false)
    end
    self.disableObj = styleObj
end

function Mj3dCenterCom:playWaitAni()
    self:stopWaitAni()
    for i=1,4 do
        local windTag = self.windTags[i]
        windTag.obj:SetActive(true)
        windTag.liang:SetActive(true)
        windTag.an:SetActive(true)
        windTag.liangAnimator.enabled = true
        windTag.liangAnimator:Play("liang",0,0)
    end
    self.dicePlane:SetActive(false)
end

function Mj3dCenterCom:stopWaitAni()
    for i=1,4 do
        local windTag = self.windTags[i]
        windTag.liangAnimator:Play("liang",0,0)
        windTag.liangAnimator:Update(0)
        --windTag.liangAnimator.enabled = false
    end
    self.dicePlane:SetActive(false)
end


return Mj3dCenterCom