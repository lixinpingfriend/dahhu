
local class = require("lib.middleclass")
local ViewBase = require('core.mvvm.view_base')
-- ==========================================================================

---@class AlertDialogView
local AlertDialogView = class('alertdialogView', ViewBase)

local ModuleCache = ModuleCache

function AlertDialogView:initialize(...)
    -- 初始View
    ViewBase.initialize(self, "public/module/public/public_windowalertdialog.prefab", "Public_WindowAlertDialog", 2)
    ViewBase.set_1080p(self)
    self._lastScale = self.root.transform.localScale
    self.textTitleObj = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Image", ModuleCache.ComponentTypeName.Transform).gameObject
    self.textTitle = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Image/TextTitle", ModuleCache.ComponentTypeName.Text)
    self.textTipInfo = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/TextTipInfo", ModuleCache.ComponentTypeName.Text)
    self.textConfirm = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonConfirmText/Text", ModuleCache.ComponentTypeName.Text)
    self.textCancel = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonCancelText/Text", ModuleCache.ComponentTypeName.Text)
    self.buttonCancel = ModuleCache.ComponentManager.Find(self.root, "Center/ButtonCancel")
    self.textButtonCancel = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonCancel/Text", ModuleCache.ComponentTypeName.Text)
    self.buttonConfirm = ModuleCache.ComponentManager.Find(self.root, "Center/ButtonConfirm")
    self.textButtonConfirm = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonConfirm/Text", ModuleCache.ComponentTypeName.Text)
    self.buttonConfirmCenter = ModuleCache.ComponentManager.Find(self.root, "Center/ButtonConfirmCenter")
    self.textConfirmCenter = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonConfirmCenter/Text", ModuleCache.ComponentTypeName.Text)
    self.buttonReceiveCenter= ModuleCache.ComponentManager.Find(self.root, "Center/ButtonReceiveCenter")

    self.buttonBgClose = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Background/BgClose", ModuleCache.ComponentTypeName.Button)

    self.toggle = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Toggle", ModuleCache.ComponentTypeName.Toggle)
    self.toggleTex = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Toggle/Label", ModuleCache.ComponentTypeName.Text)

    self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    self.textTipInfo1 = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/TextTipInfo (1)", ModuleCache.ComponentTypeName.Text)
    self.textTipInfo2 = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/TextTipInfo (2)", ModuleCache.ComponentTypeName.Text)
    self.textTipInfo3 = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/TextTipInfo (3)", ModuleCache.ComponentTypeName.Text)
    self.imge = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/Mask/Head", ModuleCache.ComponentTypeName.Image)
    self.confirmImgBtn = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonConfirm", ModuleCache.ComponentTypeName.Transform).gameObject
    self.cancelImgBtn = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonCancel", ModuleCache.ComponentTypeName.Transform).gameObject
    self.confirmTextBtn = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonConfirmText", ModuleCache.ComponentTypeName.Transform).gameObject
    self.cancelTextBtn = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/ButtonCancelText", ModuleCache.ComponentTypeName.Transform).gameObject
end


function AlertDialogView:ViewTextBtn(confirmText,cancelText)
    if confirmText then
        self.confirmImgBtn:SetActive(false)
        self.cancelImgBtn:SetActive(false)
        self.confirmTextBtn:SetActive(true)
        self.cancelTextBtn:SetActive(true)
    else
        self.confirmImgBtn:SetActive(true)
        self.cancelImgBtn:SetActive(true)
        self.confirmTextBtn:SetActive(false)
        self.cancelTextBtn:SetActive(false)
    end

    self.textConfirm.text = confirmText
    self.textCancel.text = cancelText
end

function AlertDialogView:set_root_scale(factor)
    self.root.transform.localScale = self._lastScale * factor
end

return AlertDialogView