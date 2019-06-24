local class = require("lib.middleclass")
local ViewBase = require("core.mvvm.view_base")
local RedpacketView = class("Public.Redpacket", ViewBase)
local Manager = require("package.public.module.function_manager")
local ModuleCache = ModuleCache
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ViewUtil = ModuleCache.ViewUtil;
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName

function RedpacketView:initialize(...)
    self.viewIsStatic = true
    
end

function RedpacketView:on_dynamic_init()
    ViewBase.initialize(self, "public/module/redpacket/public_windowredpacket.prefab", "Public_WindowRedPacket", 0)
    --self:set_1080p()
    self:get_table_btn_anim_view()
    self:get_hall_btn_anim_view()
    self:get_main_view()
    self:get_popup_view()
    self:get_tips_view()

    self.anim_hongbaoyu = Manager.FindObject(self.root, "Anim_HongBaoYu")
    self.anim_huode = Manager.FindObject(self.root, "Anim_HongBao_HuoDe")

    self.share_camera = Manager.FindObject(nil, "GameRoot/Game/UIRoot/CameraShareOnly")
    self.share_object = Manager.FindObject(nil, "GameRoot/Game/UIRoot/UIWindowParent/CanvasShareOnly")

    self.screen = Manager.GetRect(self.root).sizeDelta

    self:get_sprite_table()

    -- 分享弹窗界面
    self.shareBox = GetComponentWithSimple(self.root, "Share", ComponentTypeName.RectTransform).gameObject;
    -- 分享遮罩按钮
    self.buttonShareMask = GetComponentWithSimple(self.root, "ButtonShareMask", ComponentTypeName.Button);
    -- 分享朋友圈按钮
    self.buttonShare = GetComponentWithSimple(self.root, "ButtonShare", ComponentTypeName.Button);

    -- 截屏画布实体
    self.shareCanvasGB = UnityEngine.GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/CanvasShareOnly");

    -- 抢红包画布
    self.qianghongbaoCanvas = GetComponentWithSimple(self.root, "ButtonRobRedpacket", ComponentTypeName.Canvas);
    -- 收到红包画布
    self.shoudaoCanvas = GetComponentWithPath(self.root, "Tips", ComponentTypeName.Canvas);
    -- 未收到红包画布
    self.weishoudaoCanvas = GetComponentWithPath(self.root, "RobRedpacketFailTips", ComponentTypeName.Canvas);
    -- 红雨包粒子画布
    self.hongbaoyuParticleCanvas = GetComponentWithSimple(self.root, "Particle System", "UnityEngine.Renderer");
    self.hongbaoyuParticleCanvas.sortingLayerName = "UILow";
    -- 抢红包标签
    self.qianghongbaoLabel = GetComponentWithSimple(self.root, "Btn_Text", ComponentTypeName.Text);

    -- 红包空记录实体
    self.labelRedEmptyRecordGO = GetComponentWithSimple(self.root, "LabelRedEmptyRecord", ComponentTypeName.Text).gameObject;
    -- 红包记录item
    self.itemRedRecord = GetComponentWithSimple(self.root, "itemRedRecord", ComponentTypeName.Transform).gameObject;

    -- 空退款记录实体
    self.labelRefundEmptyRecordGO = GetComponentWithSimple(self.root, "LabelRefundEmptyRecord", ComponentTypeName.Text).gameObject;
    -- 退款记录item
    self.itemRefundRecord = GetComponentWithSimple(self.root, "itemRefundRecord", ComponentTypeName.Transform).gameObject;

    -- 延迟一帧更改红包雨粒子特效渲染深度值
    local callback = function()

        WaitForEndOfFrame();
        self:setSortOrder();
    end
    self:start_unity_coroutine(callback);

    --领取成功Tips
    self.getMoneyTips = GetComponentWithPath(self.root, "GetMoneyTips", ComponentTypeName.Transform).gameObject
    self.getMoneyEnterBtn = GetComponentWithPath(self.root, "GetMoneyTips/EnterBtn", ComponentTypeName.Transform).gameObject
    -- 显示授权界面
    self.authorization = GetComponentWithPath(self.root, "Authorization", ComponentTypeName.Transform).gameObject
    self.authorizationImage = GetComponentWithPath(self.root, "Authorization/UrlImage", ComponentTypeName.Image)
    self.authorizationShareBtn = GetComponentWithPath(self.root, "Authorization/ShareBtn", ComponentTypeName.Transform).gameObject
    self.authorizationCloseBtn = GetComponentWithPath(self.root, "Authorization/CloseBtn", ComponentTypeName.Transform).gameObject
end

function RedpacketView:setSortOrder()
    if not self.isDestroy then
        self.hongbaoyuParticleCanvas.sortingOrder = self.canvas.sortingOrder + 1;
        self.qianghongbaoCanvas.sortingOrder = self.canvas.sortingOrder + 2;
        self.shoudaoCanvas.sortingOrder = self.canvas.sortingOrder + 3;
        self.weishoudaoCanvas.sortingOrder = self.canvas.sortingOrder + 3;
    end
end

function RedpacketView:get_table_btn_anim_view()
    self.table_btn_anim = Manager.GetButton(self.root, "BtnAnimTable")
    self.table_btn_name = Manager.GetText(self.root, "BtnAnimTable/Name")
end

function RedpacketView:get_hall_btn_anim_view()
    self.hall_btn_anim = Manager.GetButton(self.root, "BtnAnimHall")
    self.hall_btn_name = Manager.GetText(self.root, "BtnAnimHall/Name")
end

function RedpacketView:get_main_view()
    self.main_view = {
        root = Manager.FindObject(self.root,"Main"),
        top = self:get_main_top_view(),
        center = self:get_main_center_view(),
        bottom = self:get_main_bottom_view(),
    }
end

function RedpacketView:get_main_top_view()
    if not self.main_top_view then
        self.main_top_view = {
            root = Manager.FindObject(self.root,"Main/Top"),
            caishen = Manager.FindObject(self.root,"Main/Top/CaiShen"),
            title = Manager.FindObject(self.root,"Main/Top/Title"),
            logo = Manager.GetRawImage(self.root,"Main/Top/Logo"),
            name = Manager.GetText(self.root,"Main/Top/Name"),
            close = Manager.GetButton(self.root,"Main/Top/BtnClose"),
        }
    end

    return self.main_top_view
end

function RedpacketView:get_main_center_view()
    if not self.main_center_view then
        self.main_center_view = {
            root = Manager.FindObject(self.root,"Main/Center"),
            left = Manager.GetToggle(self.root,"Main/Center/Left"),
            left_text = Manager.FindObject(self.root,"Main/Center/Left/Disabled/Text"),
            center = Manager.GetToggle(self.root,"Main/Center/Center"),
            center_text = Manager.FindObject(self.root,"Main/Center/Center/Disabled/Text"),
            right = Manager.GetToggle(self.root,"Main/Center/Right"),
            right_text = Manager.FindObject(self.root,"Main/Center/Right/Disabled/Text"),
        }
    end

    return self.main_center_view
end

function RedpacketView:get_main_bottom_view()
    if not self.main_bottom_view then
        self.main_bottom_view = {
            root = Manager.FindObject(self.root,"Main/Bottom")
        }
        self.main_bottom_view.left = { }
        self.main_bottom_view.left.root = Manager.FindObject(self.root, "Main/Bottom/Left")
        self.main_bottom_view.left.total = self:get_bottom_left_single(self.main_bottom_view.left.root, "Total")
        self.main_bottom_view.left.received = self:get_bottom_left_single(self.main_bottom_view.left.root, "Received")
        self.main_bottom_view.left.unclaimed = self:get_bottom_left_single(self.main_bottom_view.left.root, "Unclaimed")
        self.main_bottom_view.left.unclaimed.btn_get = Manager.GetButton(self.main_bottom_view.left.unclaimed.root, "BtnGet")
        self.main_bottom_view.left.tips = Manager.FindObject(self.main_bottom_view.left.root, "Tips")

        self.main_bottom_view.center = self:get_bottom_center_view()

        self.main_bottom_view.right = self:get_bottom_right_view()
    end

    return self.main_bottom_view
end

function RedpacketView:get_bottom_left_single(view, str)
    return {
        root = Manager.FindObject(view,str),
        name = Manager.GetText(view,str .. "/Name"),
        redbag =
        {
            root = Manager.FindObject(view,str .. "/Content/Money"),
            text = Manager.GetText(view,str .. "/Content/Money/Text"),
        },
        diamond =
        {
            root = Manager.FindObject(view,str .. "/Content/Diamond"),
            text = Manager.GetText(view,str .. "/Content/Diamond/Text"),
        },
        vitality =
        {
            root = Manager.FindObject(view,str .. "/Content/Energy"),
            text = Manager.GetText(view,str .. "/Content/Energy/Text"),
        },
        redPacket =--红包券
        {
            root = Manager.FindObject(view,str .. "/Content/RedTicket"),
            text = Manager.GetText(view,str .. "/Content/RedTicket/Text"),
        },
    }

end

function RedpacketView:get_bottom_center_view(view)
    if not self.bottom_center_view then
        self.bottom_center_view = {
            root = Manager.FindObject(self.root,"Main/Bottom/Center"),
            content = Manager.GetRect(self.root,"Main/Bottom/Center/Content"),
            base = Manager.GetText(self.root,"Main/Bottom/Center/Content/Text"),
            tips = Manager.FindObject(self.root,"Main/Bottom/Center/Tips"),
        }

    end

    return self.bottom_center_view
end

function RedpacketView:get_bottom_right_view()
    if not self.bottom_right_view then
        self.bottom_right_view = {
            root = Manager.FindObject(self.root,"Main/Bottom/Right"),
            content = Manager.GetRect(self.root,"Main/Bottom/Right/Content"),
            base = Manager.GetText(self.root,"Main/Bottom/Right/Content/Text"),
            tips = Manager.FindObject(self.root,"Main/Bottom/Right/Tips"),
        }
    end

    return self.bottom_right_view
end

function RedpacketView:copy_record()
    local go = Manager.CopyObject(self.main_view.bottom.right.base.gameObject)

    local view = { }
    view.obj = go
    view.text = Manager.GetText(go)
    view.rect = Manager.GetRect(go)

    return view
end

function RedpacketView:get_popup_view()
    self.popup_view = {
        root = Manager.FindObject(self.root,"Popup"),
        btn_mask = Manager.GetButton(self.root,"Popup/BtnMask"),
        text = Manager.GetText(self.root,"Popup/Text"),
        tips = Manager.GetText(self.root,"Popup/Tips"),
        cdkey = Manager.GetText(self.root,"Popup/CDKey"),
        btn_copy = Manager.GetButton(self.root,"Popup/BtnCopy"),
        btn_sure = Manager.GetButton(self.root,"Popup/BtnSure"),
    }
end

function RedpacketView:get_tips_view()
    self.tips_view = {
        root = Manager.FindObject(self.root,"Tips"),
        logo = Manager.GetRawImage(self.root,"Tips/Logo"),
        name = Manager.GetText(self.root,"Tips/Name"),
        title = Manager.FindObject(self.root,"Tips/Title"),
        icon = Manager.GetImage(self.root,"Tips/Count/Icon"),
        count = Manager.GetText(self.root,"Tips/Count"),
        text = Manager.GetText(self.root,"Tips/Text"),
        btn_sure = Manager.GetButton(self.root,"Tips/BtnTipsSure")
    }
end

function RedpacketView:get_sprite_table()
    self.sprites = Manager.GetComponent(self.root, "SpriteHolder")
end

-- 更新分享图片视图
function RedpacketView:updateShareImage(data, spriteShareImage, spriteShareBg)

    if self.shareImagePrefab == nil then
        -- 实例化分享图片预置
        self.shareImagePrefab = ViewUtil.InitGameObject("public/module/shareimage/shareimage_redpacket.prefab", "ShareImage_RedPacket", self.shareCanvasGB);
        -- 二维码图片
        self.spriteQRCode = GetComponentWithPath(self.shareImagePrefab, "SpriteQRCode", ComponentTypeName.Image);
        -- 分享背景图片
        self.spriteShareBg = GetComponentWithPath(self.shareImagePrefab, "SpriteBg", ComponentTypeName.Image);
        -- 游戏名标签
        self.labelGameName = GetComponentWithPath(self.shareImagePrefab, "LabelGameName", ComponentTypeName.Text);
        -- 微信号标签
        self.labelWechatNumber = GetComponentWithPath(self.shareImagePrefab, "LabelWechatNumber", ComponentTypeName.Text);
    else
        self.shareImagePrefab:SetActive(true);
    end

    self.spriteQRCode.sprite = spriteShareImage;
    if spriteShareBg ~= nil then
        self.spriteShareBg.sprite = spriteShareBg;
    end
    self.labelGameName.text = data.gameName;
    self.labelWechatNumber.text = "联系客服:" .. data.custosmerService;
end

-- 更新红包记录视图
function RedpacketView:updateRedRecordView(recordList)
    -- 重复利用itemRight模板
    local childCount = self.itemRedRecord.transform.parent.childCount;
    for i = 0, childCount - 1 do
        self.itemRedRecord.transform.parent:GetChild(i).gameObject:SetActive(false);
    end
    -- 空数据,显示空数据弹框
    if recordList == nil or #recordList == 0 then
        self.labelRedEmptyRecordGO:SetActive(true);
        return
    else
        self.labelRedEmptyRecordGO:SetActive(false);
    end
    for key, record in ipairs(recordList) do
        -- 重复利用itemRight模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemRedRecord.gameObject, self.itemRedRecord.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemRedRecord.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 活动名称标签
        local labelTitle = GetComponentWithSimple(itemClone, "LabelTitle", ComponentTypeName.Text);
        -- 活动时间标签
        local labelTime = GetComponentWithSimple(itemClone, "LabelTime", ComponentTypeName.Text);
        -- 活动描述标签
        local labelDetail = GetComponentWithSimple(itemClone, "LabelDetail", ComponentTypeName.Text);

        --活动名称
        labelTitle.text=record.activityName;
        --活动时间
        labelTime.text=record.createTime;
        --活动描述

        --用来处理处理api服务器会把空值赋值成null的情况
        labelDetail.text= string.tostring(record.showStr);
    end
end

-- 更新退款记录视图
function RedpacketView:updateRefundRecordView(recordList)
    -- 重复利用itemRight模板
    local childCount = self.itemRefundRecord.transform.parent.childCount;
    for i = 0, childCount - 1 do
        self.itemRefundRecord.transform.parent:GetChild(i).gameObject:SetActive(false);
    end
    -- 空数据,显示空数据弹框
    if recordList == nil or #recordList == 0 then
        self.labelRefundEmptyRecordGO:SetActive(true);
        return
    else
        self.labelRefundEmptyRecordGO:SetActive(false);
    end
    for key, record in ipairs(recordList) do
        -- 重复利用itemRight模板
        local itemClone = nil;
        if key > childCount - 1 then
            itemClone = self:clone(self.itemRefundRecord.gameObject, self.itemRefundRecord.transform.parent.gameObject, Vector3.zero);
            itemClone.name = itemClone.name .. key;
        else
            itemClone = self.itemRefundRecord.transform.parent:GetChild(key).gameObject;
            itemClone:SetActive(true);
        end

        -- 活动名称标签
        local labelTitle = GetComponentWithSimple(itemClone, "LabelTitle", ComponentTypeName.Text);
        -- 活动时间标签
        local labelTime = GetComponentWithSimple(itemClone, "LabelTime", ComponentTypeName.Text);
        -- 活动描述标签
        local labelDetail = GetComponentWithSimple(itemClone, "LabelDetail", ComponentTypeName.Text);

        --活动名称
        labelTitle.text=record.eventTypeStr;
        --活动时间
        labelTime.text=record.createTime;
        --活动描述
        labelDetail.text= string.tostring(record.showStr);
    end
end

-- 克隆
function RedpacketView:clone(obj, parent, pos)
    local target = ComponentUtil.InstantiateLocal(obj, parent, pos);
    target.name = obj.name;
    ComponentUtil.SafeSetActive(target, true);
    return target;
end

return RedpacketView
