





local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

---@class AlertDialogModule
---@field alertdialogView AlertDialogView
---@field view AlertDialogView
local AlertDialogModule = class("Hall.AlertDialog", ModuleBase)

local ModuleCache = ModuleCache

-- 回调处理，据说这种方式性能更高些，luajit能进一步优化
local _buttonCallback = { }

function AlertDialogModule:initialize(...)
    -- 开始初始化
    ModuleBase.initialize(self, "alertdialog_view", nil, ...)
end


function AlertDialogModule:show_custom(intentData)
    if(intentData.resetRootScale and type(intentData.resetRootScale) == 'number')then
        self.view:set_root_scale(intentData.resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texStyle")

    if intentData.text then
        self.alertdialogView.textTipInfo.text = intentData.text
    end

    if intentData.title then
        self.alertdialogView.textTitle.text = intentData.textTitle
    end

    if intentData.confirmCallBack then
        _buttonCallback["ButtonConfirm"] = intentData.confirmCallBack
    end

    if intentData.cancelCallback then
        _buttonCallback["ButtonCancel"] = intentData.cancelCallback
    end

    self._clickConfirmNotHideView = intentData.clickConfirmNotHideView
end

--- 显示中间按钮
function AlertDialogModule:show_center_button(text, callback, clickButtonConfirmCenterNotHideView, resetRootScale, confirmCenterText)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texStyle")

    self.alertdialogView.textTipInfo.text = text
    self.alertdialogView.textTitleObj.gameObject:SetActive(false)
    self._clickButtonConfirmCenterNotHideView = clickButtonConfirmCenterNotHideView
    _buttonCallback["ButtonConfirmCenter"] = callback
    self.alertdialogView.buttonConfirmCenter:SetActive(true)
    if confirmCenterText then
        self.alertdialogView.textConfirmCenter.text = confirmCenterText
    else
        self.alertdialogView.textConfirmCenter.text = "确 认"
    end
    self.alertdialogView.buttonConfirm:SetActive(false)
    self.alertdialogView.buttonCancel:SetActive(false)
    self.alertdialogView.buttonReceiveCenter:SetActive(false)
    self.alertdialogView.confirmTextBtn:SetActive(false)
    self.alertdialogView.cancelTextBtn:SetActive(false)
    self:need_open_buttonbgClose()
end


--- 默认显示两个按钮，坐标为取消，右边为确定   小弹窗
function AlertDialogModule:show_common_mini(text, confirmCallBack, cancelCallback, clickButtonConfirmNotHideView,showToggle,toggleTex,toggle_inOn ,resetRootScale)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texStyleMini")

    self.alertdialogView.textTipInfo.text = text
    _buttonCallback["ButtonCancel"] = cancelCallback
    _buttonCallback["ButtonConfirm"] = confirmCallBack
    self.alertdialogView.textTitleObj.gameObject:SetActive(false)
    self.alertdialogView.buttonConfirmCenter:SetActive(false)
    self._clickButtonConfirmNotHideView = clickButtonConfirmNotHideView
    self._clickButtonCancelNotHideView = nil
    self.alertdialogView.buttonConfirm:SetActive(true)
    self.alertdialogView.buttonCancel:SetActive(true)
    self.alertdialogView.textButtonConfirm.text = "确 认"
    self.alertdialogView.textButtonCancel.text = "取 消"

    self.view.toggle.gameObject:SetActive(showToggle)
    if showToggle then
        self.view.toggleTex.text = toggleTex
        self.view.toggle.isOn = toggle_inOn

        self.view.toggle.onValueChanged:AddListener(function(isCheck)
            self:dispatch_package_event("alertDialog_toggle_inOn", self.view.toggle.isOn)
        end)

    end

    self.alertdialogView.buttonReceiveCenter:SetActive(false)
    self.alertdialogView.confirmTextBtn:SetActive(false)
    self.alertdialogView.cancelTextBtn:SetActive(false)
    self:need_open_buttonbgClose()
end

--- 默认显示两个按钮，坐标为取消，右边为确定
function AlertDialogModule:show_common(text, confirmCallBack, cancelCallback, clickButtonConfirmNotHideView,showToggle,toggleTex,toggle_inOn ,resetRootScale)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texStyle")

    self.alertdialogView.textTipInfo.text = text
    _buttonCallback["ButtonCancel"] = cancelCallback
    _buttonCallback["ButtonConfirm"] = confirmCallBack
    self.alertdialogView.textTitleObj.gameObject:SetActive(false)
    self.alertdialogView.buttonConfirmCenter:SetActive(false)
    self._clickButtonConfirmNotHideView = clickButtonConfirmNotHideView
    self._clickButtonCancelNotHideView = nil
    self.alertdialogView.buttonConfirm:SetActive(true)
    self.alertdialogView.buttonCancel:SetActive(true)
    self.alertdialogView.textButtonConfirm.text = "确 认"
    self.alertdialogView.textButtonCancel.text = "取 消"

    self.view.toggle.gameObject:SetActive(showToggle)
    if showToggle then
        self.view.toggleTex.text = toggleTex
        self.view.toggle.isOn = toggle_inOn

        self.view.toggle.onValueChanged:AddListener(function(isCheck)
            self:dispatch_package_event("alertDialog_toggle_inOn", self.view.toggle.isOn)
        end)

    end

    self.alertdialogView.buttonReceiveCenter:SetActive(false)
    self.alertdialogView.confirmTextBtn:SetActive(false)
    self.alertdialogView.cancelTextBtn:SetActive(false)
    self:need_open_buttonbgClose()
end

function AlertDialogModule:show_common_image_tex(data, confirmCallBack, cancelCallback, clickButtonConfirmNotHideView,showToggle,toggleTex, resetRootScale)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texImageStyle")

    self.view.textTipInfo1.text = data.topTex
    self.view.textTipInfo2.text = data.rightTex1
    self.view.textTipInfo3.text = data.rightTex2

    self:image_load_sprite(self.view.imge, data.headImg)

    _buttonCallback["ButtonCancel"] = cancelCallback
    _buttonCallback["ButtonConfirm"] = confirmCallBack
    self.alertdialogView.textTitleObj.gameObject:SetActive(false)
    self.alertdialogView.buttonConfirmCenter:SetActive(false)
    self._clickButtonConfirmNotHideView = clickButtonConfirmNotHideView
    self.alertdialogView.buttonConfirm:SetActive(true)
    self.alertdialogView.buttonCancel:SetActive(true)
    self.alertdialogView.textButtonConfirm.text = "确 认"
    self.alertdialogView.textButtonCancel.text = "取 消"

    self.view.toggle.gameObject:SetActive(showToggle)
    if showToggle then
        self.view.toggleTex.text = toggleTex
    end

    self.alertdialogView.buttonReceiveCenter:SetActive(false)
    self.alertdialogView.confirmTextBtn:SetActive(false)
    self.alertdialogView.cancelTextBtn:SetActive(false)
    self:need_open_buttonbgClose()
    if data.confirmText then
        self.view:ViewTextBtn(data.confirmText,data.cancelText)
        _buttonCallback["ButtonCancelText"] = cancelCallback
        _buttonCallback["ButtonConfirmText"] = confirmCallBack
    end
end

--- 默认显示两个按钮，坐标为取消，右边为确定
function AlertDialogModule:show_confirm_cancel(text, confirmCallBack, cancelCallback, clickButtonConfirmNotHideView, resetRootScale, confirmButtonText, cancelButtonText, clickButtonCancelNotHideView)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texStyle")

    self.alertdialogView.textTipInfo.text = text
    _buttonCallback["ButtonCancel"] = cancelCallback
    _buttonCallback["ButtonConfirm"] = confirmCallBack
    self._clickButtonConfirmNotHideView = clickButtonConfirmNotHideView
    self._clickButtonCancelNotHideView = clickButtonCancelNotHideView
    self.alertdialogView.textTitleObj.gameObject:SetActive(false)
    self.alertdialogView.buttonConfirmCenter:SetActive(false)
    self.alertdialogView.buttonConfirm:SetActive(true)
    self.alertdialogView.buttonCancel:SetActive(true)
    self.alertdialogView.confirmTextBtn:SetActive(false)
    self.alertdialogView.cancelTextBtn:SetActive(false)
    self.alertdialogView.buttonReceiveCenter:SetActive(false)
    self.alertdialogView.confirmTextBtn:SetActive(false)
    self.alertdialogView.cancelTextBtn:SetActive(false)
    self.alertdialogView.textButtonConfirm.text = confirmButtonText and confirmButtonText or "确 认"
    self.alertdialogView.textButtonCancel.text = cancelButtonText and cancelButtonText or "取 消"
    self:need_open_buttonbgClose()
end

--- 默认显示两个按钮，坐标为取消，右边为确定
function AlertDialogModule:show_other_confirm_cancel(text, confirmCallBack, cancelCallback, clickButtonConfirmNotHideView,confirmText,cancelText, resetRootScale)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texStyle")

    self.alertdialogView.textTipInfo.text = text
    _buttonCallback["ButtonCancelText"] = cancelCallback
    _buttonCallback["ButtonConfirmText"] = confirmCallBack
    self._clickButtonConfirmNotHideView = clickButtonConfirmNotHideView
    self._clickButtonCancelNotHideView = nil
    self.alertdialogView.textTitleObj.gameObject:SetActive(false)
    self.alertdialogView.buttonConfirmCenter:SetActive(false)
    self.alertdialogView.buttonConfirm:SetActive(true)
    self.alertdialogView.buttonCancel:SetActive(true)
    self.alertdialogView.textButtonConfirm.text = "确 认"
    self.alertdialogView.textButtonCancel.text = "取 消"
    self.alertdialogView.buttonReceiveCenter:SetActive(false)
    self.view:ViewTextBtn(confirmText,cancelText)
    self:need_open_buttonbgClose()
end

--- 默认显示两个按钮，坐标为取消，右边为确定
function AlertDialogModule:show_confirm_cancel_titile(title, text, confirmCallBack, cancelCallback, clickButtonConfirmNotHideView, resetRootScale)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self:show_confirm_cancel(text,confirmCallBack, cancelCallback, clickButtonConfirmNotHideView)

    self.alertdialogView.textTitle.text = title
    self.alertdialogView.textTitleObj.gameObject:SetActive(true)
    self:need_open_buttonbgClose()
end

-- 显示中间按钮,按钮名字为领取
function AlertDialogModule:show_receive(text, callback, resetRootScale)
    if(resetRootScale and type(resetRootScale) == 'number')then
        self.view:set_root_scale(resetRootScale)
    else
        self.view:set_root_scale(1)
    end
    self.view.stateSwitcher:SwitchState("texStyle")

    self.alertdialogView.textTipInfo.text = text
    self.alertdialogView.textTitleObj.gameObject:SetActive(false)
    _buttonCallback["ButtonReceiveCenter"] = callback
    self.alertdialogView.buttonReceiveCenter:SetActive(true)
    self.alertdialogView.buttonConfirm:SetActive(false)
    self.alertdialogView.buttonCancel:SetActive(false)
    self.alertdialogView.confirmTextBtn:SetActive(false)
    self.alertdialogView.cancelTextBtn:SetActive(false)
    self:need_open_buttonbgClose()
end

function AlertDialogModule:need_open_buttonbgClose()
    if ModuleCache.GameManager.webViewIsShow then
        self.view.buttonBgClose.enabled = true
    else
        self.view.buttonBgClose.enabled = false
    end
end

function AlertDialogModule:on_click(obj, arg)
    if self._clickButtonConfirmNotHideView and obj.name == "ButtonConfirm" then

    elseif self._clickButtonConfirmCenterNotHideView and obj.name == "ButtonConfirmCenter" then

    elseif self._clickButtonCancelNotHideView and obj.name == "ButtonCancel" then

    else
        self.alertdialogView:hide()
    end

    local callback = _buttonCallback[obj.name]
    if _buttonCallback[obj.name] then
        callback()
    end
end

return AlertDialogModule