---
--- Created by dengcheng.
--- DateTime: 2018/11/12 下午5:11
---
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class AgentRegisterView
local AgentRegisterView = Class('agentView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local FindGameObject = ModuleCache.ComponentManager.FindGameObject
local CSmartTimer = ModuleCache.SmartTimer.instance

function AgentRegisterView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/agentregister/public_agentregister.prefab", "Public_AgentRegister", 0)
    -- 初始View
    View.set_1080p(self)

    self.registerObj = FindGameObject(self.root, "info")
    --申请
    self.req = FindGameObject(self.root, "info/Center/req")
    self.inputPhone = GetComponentWithPath(self.req, "InputPhone", ComponentTypeName.InputField)
    self.inputName = GetComponentWithPath(self.req, "InputName", ComponentTypeName.InputField)
    self.inputVerifyCode = GetComponentWithPath(self.req, "InputVerifyCode", ComponentTypeName.InputField)
    self.inputInviteCode = GetComponentWithPath(self.req, "InputInviteCode", ComponentTypeName.InputField)
    self.inputDefaultCode = GetComponentWithPath(self.req, "InputInviteCode/Placeholder", ComponentTypeName.Text)
    self.btnReq = GetComponentWithPath(self.req, "ButtonReq", ComponentTypeName.Button)
    self.btnVerify = GetComponentWithPath(self.req, "ButtonVerify", ComponentTypeName.Button)
    self.toggleAgree = GetComponentWithPath(self.req, "ToggleAgree", ComponentTypeName.Toggle)

    self.btnVerifyGray = GetComponentWithPath(self.req, "ButtonVerifyGray", ComponentTypeName.Button)
    self.textGet = GetComponentWithPath(self.req, "ButtonVerifyGray/Text", ComponentTypeName.Text)
    --正在审核
    self.status = FindGameObject(self.root, "info/Center/status")
    self.bingInviteCode = GetComponentWithPath(self.status, "InputInviteCode/Placeholder", ComponentTypeName.Text)
    self.bingName = GetComponentWithPath(self.status, "InputName/Placeholder", ComponentTypeName.Text)
    self.bingMobile = GetComponentWithPath(self.status, "InputPhone/Placeholder", ComponentTypeName.Text)
    self.btnWait = GetComponentWithPath(self.status, "ButtonWait", ComponentTypeName.Button)
    --协议
    self.agentAgree = FindGameObject(self.root, "agreement")

    self.agentagreement = GetComponentWithPath(self.agentAgree,"Panel/Text",ComponentTypeName.Text) --UnityEngine.UI.Text
    ModuleCache.ComponentUtil.SafeSetActive(self.req,false)
    ModuleCache.ComponentUtil.SafeSetActive(self.status,false)
    ModuleCache.ComponentUtil.SafeSetActive(self.agentAgree,false)

    if ModuleCache.GameManager.channel == "HAOCAI" then
        self.agentAgreeScrollRect = GetComponentWithPath(self.root, "agreement", ComponentTypeName.ScrollRect)
        self.agentagreement.gameObject:SetActive(false)
        self.agentagreementHaoCai = GetComponentWithPath(self.agentAgree,"Panel/Text_HAOCAI",ComponentTypeName.RectTransform) --UnityEngine.UI.Text
        self.agentagreementHaoCai.gameObject:SetActive(true)
        self.agentAgreeScrollRect.content = self.agentagreementHaoCai
	end
	
	self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)
end

function AgentRegisterView:on_view_init()
end
--获取申请状态
function AgentRegisterView:getBindStatus(data)
    if data.hasAutdit then --正在审核
        log_debug("getBindStatus to 正在审核界面")
        ModuleCache.ComponentUtil.SafeSetActive(self.req,false)
        ModuleCache.ComponentUtil.SafeSetActive(self.status,true)
        ModuleCache.ComponentUtil.SafeSetActive(self.agentAgree,false)
        self.bingInviteCode.text = data.agentsAuditVo.inviteCode
        self.bingName.text = data.agentsAuditVo.name
        self.bingMobile.text = data.agentsAuditVo.mobile
    else

        if data.hasAgents then --已经成为代理
            --TO DO 跳转代理推广界面
            ModuleCache.ModuleManager.destroy_module("public","agentregister")
            ModuleCache.ModuleManager.show_public_module("agentback")
        else --开始申请
            --log_debug("getBindStatus to 申请界面")
            ModuleCache.ComponentUtil.SafeSetActive(self.req,true)
            ModuleCache.ComponentUtil.SafeSetActive(self.status,false)
            ModuleCache.ComponentUtil.SafeSetActive(self.agentAgree,false)
            if data.defaultInviteCode ~= "" then
                self.inputInviteCode.text = data.defaultInviteCode
                self.inputDefaultCode.text = data.defaultInviteCode
            end
            --print("data.greyInviteCode"..(data.greyInviteCode and "true" or "false"))
            self.inputInviteCode.interactable = not data.greyInviteCode
            if data.defaultMobile ~= "" then
                self.inputPhone.text = data.defaultMobile
            end

        end
    end
end

function AgentRegisterView:get_btn_deal(canclick)
    self.btnVerify.gameObject:SetActive(false)
    self.btnVerifyGray.gameObject:SetActive(true)
    self.inputPhone.interactable = false
    self.btnVerifyTimeEventId = self:subscibe_time_event(60, false, 1):OnUpdate(
    function( t )
        self.textGet.text = string.format("%d秒后获取", t.surplusTimeRound)
    end
    ):OnComplete(function( t )
        self.btnVerify.gameObject:SetActive(true)
        self.btnVerifyGray.gameObject:SetActive(false)
        self.inputVerifyCode.interactable = true
    end).id
end

function AgentRegisterView:resetView()
    self.inputInviteCode.text = ""
    self.inputDefaultCode.text = "请输入邀请码"
    self.inputName.text = ""
    self.inputPhone.text = ""
    self.inputVerifyCode.text = ""
    self.inputPhone.interactable = true
    self.btnVerify.gameObject:SetActive(true)
    self.btnVerifyGray.gameObject:SetActive(false)
    if self.btnVerifyTimeEventId then
        CSmartTimer:Kill(self.btnVerifyTimeEventId)
        self.btnVerifyTimeEventId = nil
    end
end

return AgentRegisterView