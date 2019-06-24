
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class AgentWithdrawCashView
local AgentWithdrawCashView = Class('agentWithdrawCashView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local ViewUtil = ModuleCache.ViewUtil

function AgentWithdrawCashView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/agentwithdrawcash/public_agentwithdrawcash.prefab", "Public_AgentWithdrawCash", 1)
    View.set_1080p(self)

    self.withdrawTypeStateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    self.cashNumTex_wechat = GetComponentWithPath(self.root,"Center/WeChatPancel/Authorized/cashNum",ComponentTypeName.Text)
    self.cashNumTex_card = GetComponentWithPath(self.root,"Center/BankCardPancel/cashNum",ComponentTypeName.Text)

    self.cardTex = GetComponentWithPath(self.root,"Center/BankCardPancel/bankCard/Text",ComponentTypeName.Text)
    self.bankCardStateSwitcher = GetComponentWithPath(self.root,"Center/BankCardPancel/bankCard","UIStateSwitcher")

    self.unauthorized = GetComponentWithPath(self.root,"Center/WeChatPancel/Unauthorized",ComponentTypeName.RectTransform).gameObject
    self.wcImage = GetComponentWithPath(self.root,"Center/WeChatPancel/Unauthorized/Image",ComponentTypeName.Image)
    self.authorized = GetComponentWithPath(self.root,"Center/WeChatPancel/Authorized",ComponentTypeName.RectTransform).gameObject

    self.wcInput = GetComponentWithPath(self.root,"Center/WeChatPancel/Authorized/weChatInput",ComponentTypeName.InputField)
    self.wctMaxCashTex = GetComponentWithPath(self.root,"Center/WeChatPancel/Authorized/weChatInput/weChatMaxCashBtn/Text",ComponentTypeName.Text)
    self.wcChargeTex = GetComponentWithPath(self.root,"Center/WeChatPancel/Authorized/Text (2)/chargeTex",ComponentTypeName.Text)
    self.wcSurplusNumTex = GetComponentWithPath(self.root,"Center/WeChatPancel/Authorized/surplusNum",ComponentTypeName.Text)


    self.bcInput = GetComponentWithPath(self.root,"Center/BankCardPancel/CardInput",ComponentTypeName.InputField)
    self.bctMaxCashTex = GetComponentWithPath(self.root,"Center/BankCardPancel/CardInput/CardMaxCashBtn/Text",ComponentTypeName.Text)
    self.bcChargeTex = GetComponentWithPath(self.root,"Center/BankCardPancel/Text (2)/chargeTex",ComponentTypeName.Text)
    self.bcSurplusNumTex = GetComponentWithPath(self.root,"Center/BankCardPancel/surplusNum",ComponentTypeName.Text)

    self.shareCanvasGB = UnityEngine.GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/CanvasShareOnly")

    self.helpPanel = GetComponentWithPath(self.root,"Center/helpPanel",ComponentTypeName.RectTransform).gameObject

    self.toggleWc = GetComponentWithPath(self.root,"Center/ToggleGroup/Toggle",ComponentTypeName.Toggle)
    self.toggleBk = GetComponentWithPath(self.root,"Center/ToggleGroup/Toggle (1)",ComponentTypeName.Toggle)
    self.onclickWeChat = GetComponentWithPath(self.root,"Center/ToggleGroup/Toggle/onclickWeChat",ComponentTypeName.Transform).gameObject
    self.onclickBank = GetComponentWithPath(self.root,"Center/ToggleGroup/Toggle (1)/onclickBank",ComponentTypeName.Transform).gameObject
end

function AgentWithdrawCashView:showCard(cardData)
    return string.format("%s (%s %s)",  cardData.bankAccountName ,cardData.bankName, string.sub(cardData.bankCardNo, #cardData.bankCardNo -4,#cardData.bankCardNo)      )
    --local name = string.rep("*",#cardData.bankAccountName / 3 -1).. string.sub(cardData.bankAccountName, #cardData.bankAccountName-2,#cardData.bankAccountName)
    --return string.format("%s (%s %s)",  name ,cardData.bankName, string.sub(cardData.bankCardNo, #cardData.bankCardNo -4,#cardData.bankCardNo)      )
end

function AgentWithdrawCashView:initView(data)
    self.withdrawTypeStateSwitcher:SwitchState(data.extractType)
    self.toggleWc.isOn =  data.extractType == "1,2" or  data.extractType == "1"
    self.toggleBk.isOn =  data.extractType == "2"

    self.toggleWc.interactable = data.extractType == "1,2"
    self.toggleBk.interactable = data.extractType == "1,2"

    self.onclickWeChat:SetActive(data.extractType == "2")
    self.onclickBank:SetActive(data.extractType == "1")

    self.wcSurplusNumTex.gameObject:SetActive(data.agentsExemptFeeLimit > 0  )
    self.wcChargeTex.transform.parent.gameObject:SetActive(not (data.agentsExemptFeeLimit > 0 ))
    self.bcSurplusNumTex.gameObject:SetActive(data.agentsExemptFeeLimit > 0 )
    self.bcChargeTex.transform.parent.gameObject:SetActive(not (data.agentsExemptFeeLimit > 0 ))

    self.wcInput.placeholder.text = string.format("请输入提现金额(%.2f-%.2f)",data.redpackMinExtractAmount /100,data.redpackMaxExtractAmount/100 )
    self.bcInput.placeholder.text = string.format("请输入提现金额(%.2f-%.2f)",data.transitMinExtractAmount  /100,data.transitMaxExtractAmount /100 )

    if data.agentsExemptFeeLimit > 0  then
        self.wcSurplusNumTex.text =string.format("本次提现免手续费，本月剩余<color=#dd590fff>%s/%s</color>笔", data.agentsExemptFeeLimit, data.exemptFeeLimit)
        self.bcSurplusNumTex.text =string.format("本次提现免手续费，本月剩余<color=#dd590fff>%s/%s</color>笔", data.agentsExemptFeeLimit, data.exemptFeeLimit)
    else
        self.wcChargeTex.text = string.format("%.2f元", data.agentsFeeAmount /100)
        self.bcChargeTex.text = string.format("%.2f元", data.agentsFeeAmount /100)
    end

    if data.redpackMaxExtractAmount/100 >= tonumber(data.commissionAmount) then
        self.wctMaxCashTex.text ="全部金额"
    else
        self.wctMaxCashTex.text ="最大金额"
    end

    if data.transitMaxExtractAmount/100  >= tonumber(data.commissionAmount) then
        self.bctMaxCashTex.text ="全部金额"
    else
        self.bctMaxCashTex.text ="最大金额"
    end
end

function AgentWithdrawCashView:showWcImage(data)
    local geted = data.geted
    ComponentUtil.SafeSetActive(self.unauthorized, not geted)
    ComponentUtil.SafeSetActive(self.authorized, geted)
    if not geted then
        local url = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getQrCode?url=" ..Util.encodeURL(data.result)
        self:image_load_sprite(nil, url, function (texture)
            if texture ~= nil then
                self.wcImage.sprite = texture
                self:refreshShareImage(texture)
            end
        end)
    end
end

function AgentWithdrawCashView:refreshShareImage(texture)
    if self.InvitePlayerSharePrefab == nil then
        self.InvitePlayerSharePrefab = ViewUtil.InitGameObject("public/module/agentwithdrawcash/drawcashshare.prefab", "drawCashShare", self.shareCanvasGB);
        self.spriteQRCode = GetComponentWithPath(self.InvitePlayerSharePrefab, "QR", ComponentTypeName.Image);
        --self.number = GetComponentWithPath(self.InvitePlayerSharePrefab, "Number", ComponentTypeName.Text);
    else
        self.InvitePlayerSharePrefab:SetActive(true);
    end
    self.spriteQRCode.sprite = texture
    --self.number.text = shareData.Number == nil and "" or shareData.Number
end

return AgentWithdrawCashView