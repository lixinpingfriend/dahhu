
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MatchOnlineRankView = Class('MatchOnlineRankView', View)
local Sequence = DG.Tweening.DOTween.Sequence
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local Vector3 = Vector3
local MatchingManager = require("package.public.matching_manager")
function MatchOnlineRankView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/matchonlinerank/public_windowmatchonlinerank.prefab", "Public_WindowMatchOnlineRank", 1)

    View.set_1080p(self)
    self.item = GetComponentWithPath(self.root, "Root/Center/ScrollView/Viewport/Content/item", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(self.item, false)
    self.rankSpriteHolder = GetComponentWithPath(self.root, "SpriteHolder", "SpriteHolder");
    self.rankItem = {}
    self.playerInfo = {}
    self.mineObj = GetComponentWithPath(self.root, "Root/Center/Mine", ComponentTypeName.Transform).gameObject
    self.rank = GetComponentWithPath(self.root, "Root", ComponentTypeName.Transform)
    self.rank.localPosition = Vector3.New(-2000, 0, 0)
    self.leftPoint = GetComponentWithPath(self.root, "leftPoint", ComponentTypeName.Transform)
    self.mask =GetComponentWithPath(self.root, "SpriteMask", ComponentTypeName.Transform).gameObject
end

function MatchOnlineRankView:initRank(info)
    local minNum = 50
    local maxNum = 100
    local num = #info
    if #info > minNum then
        num = minNum
    end
    for i = 1, num do
        self:copy_item(info[i],i)
    end


    self:moveRank(true)

    num = #info
    if #info > maxNum then
        num = maxNum
    end
    if #info > minNum then
        local layout = function()
            WaitForEndOfFrame()
            for i = minNum + 1, num do
                self:copy_item(info[i],i)
            end
        end
        StartCoroutine(layout)
    end

    if #self.rankItem > #info then
        for i = #info + 1, #self.rankItem do
            self.rankItem[i]:SetActive(false)
        end
    end
end

function MatchOnlineRankView:copy_item(info,index)
    local obj
    if self.rankItem[index] then
        obj = self.rankItem[index]
    else
        obj = self:clone(self.item,index .. "")
        table.insert(self.rankItem, obj)
    end
    self:itemView(obj, info)
    ComponentUtil.SafeSetActive(obj, true)
end


function MatchOnlineRankView:moveRank(open)
    self.mask:SetActive(open)
    local x = self.leftPoint.localPosition.x + 360
    if not open then
        x = -2000
    end
    self:show()
    self:do_positionX(self.rank,0.6,x,function()
        if not open then
            self.rank.gameObject:SetActive(false)
            ModuleCache.ModuleManager.hide_module("public", "matchonlinerank")
        else
            --self:show()
            self.rank.gameObject:SetActive(true)
        end
    end)
end

function MatchOnlineRankView:initMine(mineInfo)
    if mineInfo then
        self:itemView(self.mineObj, mineInfo)
    end
end

function MatchOnlineRankView:itemView(obj, info)
    local nameText = GetComponentWithPath(obj, "LabelPlayerName", ComponentTypeName.Text)
    local scoreText = GetComponentWithPath(obj, "Score", ComponentTypeName.Text)
    local avatarImg = GetComponentWithPath(obj, "Avater/SpritePlayerIcon", ComponentTypeName.Image)
    local uistateRank = GetComponentWithPath(obj, "Rank", "UIStateSwitcher")
    local rank = info.rank or info.Rank
    local score = info.score or info.Score
    local userid = info.UserID or info.playerId
    scoreText.text = score
    if rank <= 3 then
        uistateRank:SwitchState("top3")
        local rankImg = GetComponentWithPath(obj, "Rank/Top3/SpriteRankIcon", ComponentTypeName.Image)
        rankImg.sprite = self.rankSpriteHolder:FindSpriteByName("rank" .. rank)
    else
        uistateRank:SwitchState("other")
        local rankText = GetComponentWithPath(obj, "Rank/Other/LabelRank", ComponentTypeName.Text)
        rankText.text = rank
    end
    if self.playerInfo[userid] then
        local playerData = self.playerInfo[userid]
        nameText.text = playerData.nickname
        MatchingManager:startDownLoadHeadIcon(avatarImg, playerData.headImg)
    else
        self:get_userinfo(userid, function(playerData)
            self.playerInfo[userid] = playerData
            nameText.text = playerData.nickname
            MatchingManager:startDownLoadHeadIcon(avatarImg, playerData.headImg)
        end)
    end
end

function MatchOnlineRankView:clone( obj,name, parent)
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

function MatchOnlineRankView:get_userinfo(playerId, callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = playerId,
        },
        cacheDataKey = "user/info?uid=" .. playerId
    }

    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            --OK
            callback(retData.data)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then
            --OK
            callback(retData.data)
        end
    end)

end



return MatchOnlineRankView