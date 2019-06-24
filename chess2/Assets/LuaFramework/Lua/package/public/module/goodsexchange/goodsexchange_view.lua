local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')

local GoodsExchangeView = Class('GoodsExchangeView', View)
local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName

function GoodsExchangeView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/goodsexchange/public_goodsexchange.prefab", "Public_GoodsExchange", 1)
    self:set_1080p()
    self.nameInPut = GetComponentWithPath(self.root,"ExchangeInfoDialog/Center/InputName", ComponentTypeName.InputField)
    self.phoneInPut = GetComponentWithPath(self.root,"ExchangeInfoDialog/Center/InputPhone", ComponentTypeName.InputField)
    self.dizhiIput = GetComponentWithPath(self.root,"ExchangeInfoDialog/Center/InputDizhi", ComponentTypeName.InputField)
    self.keyIput = GetComponentWithPath(self.root,"ExchangeInfoDialog/Center/InputKey", ComponentTypeName.InputField)

    self.buttonGet = GetComponentWithPath(self.root,"ExchangeInfoDialog/Center/GetKey", ComponentTypeName.Button)
    self.buttonGrey = GetComponentWithPath(self.root,"ExchangeInfoDialog/Center/GetKeyGray", ComponentTypeName.Transform)
    self.textGet = GetComponentWithPath(self.root,"ExchangeInfoDialog/Center/GetKeyGray/Text", ComponentTypeName.Text)
end

---设置文本信息
function GoodsExchangeView:initShow()
    self.nameInPut.text = ""
    self.phoneInPut.text = ""
    self.dizhiIput.text = ""
    self.keyIput.text = ""
end

function GoodsExchangeView:getVerifyCode()
    self.buttonGet.gameObject:SetActive(false)
    self.buttonGrey.gameObject:SetActive(true)
    self.phoneInPut.interactable = false
    self:subscibe_time_event(60, false, 1):OnUpdate(
    function( t )
        self.textGet.text = string.format("%d秒后获取", t.surplusTimeRound)
    end
    ):OnComplete(function( t )
        self.buttonGrey.gameObject:SetActive(false)
        self.buttonGet.gameObject:SetActive(true)
        self.phoneInPut.interactable = true
    end)
end 



return GoodsExchangeView