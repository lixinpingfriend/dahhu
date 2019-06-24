local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class AgentMyWillView
local AgentMyWillView = Class('AgentMyWillView', View)
local ModuleCache = ModuleCache
local ViewUtil = ModuleCache.ViewUtil;
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponent = ModuleCache.ComponentManager.GetComponent
local FindGameObject = ModuleCache.ComponentManager.FindGameObject
local ComponentUtil = ModuleCache.ComponentUtil

function AgentMyWillView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/agentmywill/public_agentmywill.prefab", "Public_AgentMyWill", 1)
    -- 初始View
    View.set_1080p(self)

    self.invitePlayerImage = GetComponentWithPath(self.root,"Center/InvitePlayer/QR",ComponentTypeName.Image)
    self.invitePlayerFBtn = GetComponentWithPath(self.root,"Center/InvitePlayer/ShareFriendBtn",ComponentTypeName.Transform).gameObject
    self.invitePlayerFCBtn = GetComponentWithPath(self.root,"Center/InvitePlayer/ShareFriendCircleBtn",ComponentTypeName.Transform).gameObject

    self.invitePromoterImage = GetComponentWithPath(self.root,"Center/InvitePromoter/QR",ComponentTypeName.Image)
    self.invitePromoterFBtn = GetComponentWithPath(self.root,"Center/InvitePromoter/ShareFriendBtn",ComponentTypeName.Transform).gameObject
    self.invitePromoterFCBtn = GetComponentWithPath(self.root,"Center/InvitePromoter/ShareFriendCircleBtn",ComponentTypeName.Transform).gameObject

    self.shareCanvasGB = UnityEngine.GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/CanvasShareOnly")
end


function AgentMyWillView:initInvitePlayerShare(shareData)
    if shareData == nil then return end
    if self.InvitePlayerSharePrefab == nil then
        self.InvitePlayerSharePrefab = ViewUtil.InitGameObject("public/module/agentmywill/inviteplayershare.prefab", "InvitePlayerShare", self.shareCanvasGB);
        self.spriteQRCode = GetComponentWithPath(self.InvitePlayerSharePrefab, "QR", ComponentTypeName.Image);
        self.spriteShareTop = GetComponentWithPath(self.InvitePlayerSharePrefab, "BgTop", ComponentTypeName.RawImage)
        self.spriteShareBottom = GetComponentWithPath(self.InvitePlayerSharePrefab, "BgBottom", ComponentTypeName.RawImage);
        self.number = GetComponentWithPath(self.InvitePlayerSharePrefab, "Number", ComponentTypeName.Text);
    else
        self.InvitePlayerSharePrefab:SetActive(true);
    end
    self.spriteQRCode.sprite = shareData.QR
    self.spriteShareTop.texture  = shareData.top
    self.spriteShareBottom.texture  = shareData.bottom
    self.number.text = shareData.Number == nil and "" or shareData.Number
end




return AgentMyWillView