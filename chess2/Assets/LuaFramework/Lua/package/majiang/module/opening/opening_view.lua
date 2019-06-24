
local Class = require("lib.middleclass")
---@type View
local Base = require('core.mvvm.view_base')
---@class OpeningView : View
local OpeningView = Class('OpeningView', Base)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local PlayModeUtil = ModuleCache.PlayModeUtil
local Vector3 = Vector3
local TableUtil = TableUtil
local Util = Util


function OpeningView:initialize(...)
    -- 初始View
    Base.initialize(self, "majiang/module/opening/majiang_windowopening.prefab", "MaJiang_WindowOpening", 1)

    self.seatInfoTemplate = GetComponentWithPath(self.root,"Holder/SeatInfo",ComponentTypeName.Transform).gameObject
    self.seatBgAtlas = GetComponentWithPath(self.root,"Holder/SeatBgAtlas","SpriteHolder")

    self.centerParentGo = GetComponentWithPath(self.root,"Center", ComponentTypeName.Transform).gameObject
    self.displayObjs = 
    {
        {
            root = GetComponentWithPath(self.root,"Center/2", ComponentTypeName.Transform).gameObject,
            seatPoints =
            {
                GetComponentWithPath(self.root,"Center/2/1", ComponentTypeName.Transform).gameObject,
                GetComponentWithPath(self.root,"Center/2/2", ComponentTypeName.Transform).gameObject,
            },
        },
        {
            root = GetComponentWithPath(self.root,"Center/3", ComponentTypeName.Transform).gameObject,
            seatPoints =
            {
                GetComponentWithPath(self.root,"Center/3/1", ComponentTypeName.Transform).gameObject,
                GetComponentWithPath(self.root,"Center/3/2", ComponentTypeName.Transform).gameObject,
                GetComponentWithPath(self.root,"Center/3/3", ComponentTypeName.Transform).gameObject,
            },
        },
        {
            root = GetComponentWithPath(self.root,"Center/4", ComponentTypeName.Transform).gameObject,
            seatPoints =
            {
                GetComponentWithPath(self.root,"Center/4/1", ComponentTypeName.Transform).gameObject,
                GetComponentWithPath(self.root,"Center/4/2", ComponentTypeName.Transform).gameObject,
                GetComponentWithPath(self.root,"Center/4/3", ComponentTypeName.Transform).gameObject,
                GetComponentWithPath(self.root,"Center/4/4", ComponentTypeName.Transform).gameObject,
            }, 
        },
    }
    local gameRoot = UnityEngine.GameObject.Find("GameRoot")
    self.rooTCanvas = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UIWindowParent/Canvas", ComponentTypeName.RectTransform)
end

function OpeningView:only_show_background()

end

function OpeningView:init_player_infos(playerCount)
    self.playerCount = playerCount
    for i=1,#self.displayObjs do
        self.displayObjs[i].root:SetActive(false)
    end
    if self.seatHolders then
        for i=1,#self.seatHolders do 
            local seatHolder = self.seatHolders[i]
            UnityEngine.GameObject.Destroy(seatHolder.root)
            seatHolder.root = nil
        end
        self.seatHolders = nil
    end
    self.seatHolders = {}
    self.displayObj = self.displayObjs[playerCount - 1]
    local screenScale =  self.rooTCanvas.sizeDelta.y / 720
    --self.displayObj.root.transform.localScale = self.displayObj.root.transform.localScale *  screenScale
    self.centerParentGo.transform.localScale = self.centerParentGo.transform.localScale *  screenScale
    self.displayAnimator = GetComponentWithPath(self.displayObj.root,"","UnityEngine.Animator")
    for i=1,#self.displayObj.seatPoints do
        local point = self.displayObj.seatPoints[i]
        local gameObject = ComponentUtil.InstantiateLocal(self.seatInfoTemplate,point)
        gameObject.transform.localScale = Vector3.one
        gameObject.transform.anchoredPosition = Vector3.zero
        local seatHolder = {}
        seatHolder.root = gameObject
        seatHolder.bgImage = GetComponentWithPath(gameObject,"Bg", ComponentTypeName.Image)
        seatHolder.bgImage.sprite = self.seatBgAtlas:FindSpriteByName(tostring(i))
        seatHolder.headImage = GetComponentWithPath(gameObject,"HeadMask/HeadImage", ComponentTypeName.Image)
        seatHolder.nameText = GetComponentWithPath(gameObject,"NameText", ComponentTypeName.Text)
        seatHolder.goldText = GetComponentWithPath(gameObject,"GoldText", ComponentTypeName.Text)
        table.insert(self.seatHolders,seatHolder)
    end
end

function OpeningView:refresh_all_player_info(players)
    local templist = {}
    for i=1,#players do 
        table.insert(templist,players[i])
    end
    for i=1,#templist do
        local player = templist[i]
        self:refresh_player_info(i,player)
    end
end

function OpeningView:refresh_player_info(index,player)
    local seatHolder = self.seatHolders[index]

    TableUtil.get_player_info(player.UserID,nil,function(playerInfo)
        seatHolder.headImage.sprite = playerInfo.headImage
    end,
    function(playerInfo)
        seatHolder.nameText.text = Util.filterPlayerName(playerInfo.playerName, 10)
        seatHolder.goldText.text = Util.filterPlayerGoldNum(playerInfo.gold)
    end)
    --[[self:get_userinfo(player.UserID,function(err,playerInfo)
        if err  or (not playerInfo) then
            return
        end
        seatHolder.nameText.text = Util.filterPlayerName(playerInfo.nickname, 10)
        seatHolder.goldText.text = Util.filterPlayerGoldNum(playerInfo.gold)
        TableUtil.start_download_head_icon(playerInfo,function()
        end)
        ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(playerInfo.headImg, function(err, sprite)
            if (err) then
                
            else
                seatHolder.headImage.sprite = sprite
            end
        end )
    end)--]]
end

function OpeningView:play_opening_ani_Begin_Step(callBack)
    self:subscibe_time_event(0.5, false, 1):OnComplete(function(t)
        ModuleCache.SoundManager.play_sound("majiang", "majiang/sound/common/duijukaishi.bytes","duijukaishi")
        self.displayObj.root:SetActive(true)
        self.displayAnimator.enabled = true
        self:subscibe_time_event(1.05 * 0.35, false, 1):OnComplete(function(t)
            self:pause_opening_ani()
            if callBack then
                callBack()  
            end
        end) 
    end)
end

function OpeningView:play_opening_ani_End_Step(callBack)
    self.displayObj.root:SetActive(true)
    self:subscibe_time_event(0.5, false, 1):OnComplete(function(t)
        self.displayAnimator.enabled = true
        self.displayAnimator:Play("Effect_kaiju_"..self.playerCount,-1,0.35)
        self:subscibe_time_event(1.05 * 0.65, false, 1):OnComplete(function(t)
            self:subscibe_time_event(0.25, false, 1):OnComplete(function(t)
                ModuleCache.ModuleManager.destroy_module("majiang","opening")
            end) 
            self:pause_opening_ani()
            if callBack then
                callBack() 
            end
        end) 
    end) 
end

function OpeningView:pause_opening_ani()
    self.displayAnimator.enabled = false
end

function OpeningView:get_userinfo(playerId, callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = playerId,
        },
        cacheDataKey = "user/info?uid=" .. playerId,
        cacheDataImmediatelyCallback = true,
    }

    Util.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then
            --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end)

end

return OpeningView