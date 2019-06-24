
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class ShareView
local ShareView = Class('shareView', View)

local ModuleCache = ModuleCache
local ViewUtil = ModuleCache.ViewUtil;
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function ShareView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/share/public_windowshare.prefab", "Public_WindowShare", 1)
    self:set_1080p()
    self.buttonClose = GetComponentWithPath(self.root, "Center/Child/Bg/closeBtn", ComponentTypeName.Button)
    self.buttonTimeLine = GetComponentWithPath(self.root, "Center/Child/Buttons/timeLineBtn", ComponentTypeName.Button)
    self.buttonChat = GetComponentWithPath(self.root, "Center/Child/Buttons/chatBtn", ComponentTypeName.Button)

    -- 奖励图标
    self.spriteReward = GetComponentWithPath(self.root, "Center/Child/Buttons/timeLineBtn/SpriteReward", ComponentTypeName.Image);
    -- 奖励描述
    --self.labelReward = GetComponentWithPath(self.root, "Center/Child/LabelReward", ComponentTypeName.Text);

    -- 截屏画布实体
    self.shareCanvasGB = UnityEngine.GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/CanvasShareOnly");

    self.inputFieid = GetComponentWithPath(self.root, "Center/Child/inputBar/InputFieldSearch", ComponentTypeName.InputField)

    self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")


    self.Center = GetComponentWithPath(self.root, "Center", ComponentTypeName.Transform).gameObject
    self.CenterNew = GetComponentWithPath(self.root, "CenterNew", ComponentTypeName.Transform).gameObject

    self.Operate = GetComponentWithPath(self.root, "CenterNew/Child/Operate", ComponentTypeName.Transform)
    self.SpriteHolderGoodsGo = GetComponentWithPath(self.root, "CenterNew/Child/SpriteHolderGoods", ComponentTypeName.Transform).gameObject

    self.FenXiang = GetComponentWithPath(self.root, "CenterNew/Child/FenXiang", ComponentTypeName.Button).gameObject

    self.CountAll = GetComponentWithPath(self.root, "CenterNew/Child/CountAll", "TextWrap")

    self.OperateTable = {}

    for i=1,5 do
        self.OperateTable[i] = {}
        self.OperateTable[i].go = self.Operate:GetChild(i - 1).gameObject
        local go = self.OperateTable[i].go
        self.OperateTable[i].Icon = GetComponentWithPath(go, "Icon", ComponentTypeName.Image)
        self.OperateTable[i].BtnLingQu = GetComponentWithPath(go, "BtnLingQu", ComponentTypeName.Button)
        self.OperateTable[i].BtnLingQuReal = GetComponentWithPath(go, "BtnLingQuReal", ComponentTypeName.Button)
        self.OperateTable[i].BtnLingQu1 = GetComponentWithPath(go, "BtnLingQu1", ComponentTypeName.Button)
        self.OperateTable[i].Title = GetComponentWithPath(go, "Title", ComponentTypeName.Text)
        self.OperateTable[i].Count = GetComponentWithPath(go, "Count/Count", ComponentTypeName.Text)
        self.OperateTable[i].CountGo = GetComponentWithPath(go, "Count", ComponentTypeName.Transform).gameObject
    end

    self.SpriteHolderGoods = self.SpriteHolderGoodsGo:GetComponent("SpriteHolder")

    --self.Test =  ModuleCache.ComponentManager.Find(self.root, "Center/Test")
    --if self.Test then
    --    self.Test:SetActive(ModuleCache.GameManager.developmentMode)
    --end
end


function ShareView:on_view_init()

end

-- 更新分享图片视图
function ShareView:updateShareImage(data, spriteShareImage, spriteShareBg)

    if self.shareImagePrefab == nil then
        -- 实例化分享图片预置
        self.shareImagePrefab = ViewUtil.InitGameObject("public/module/shareimage/shareimage.prefab", "ShareImage", self.shareCanvasGB);
        -- 二维码图片
        self.spriteQRCode = GetComponentWithPath(self.shareImagePrefab, "SpriteQRCode", ComponentTypeName.Image);
        -- 分享背景图片
        self.spriteShareBg = GetComponentWithPath(self.shareImagePrefab, "SpriteBg", ComponentTypeName.Image);
        -- 游戏名标签
        self.labelGameName = GetComponentWithPath(self.shareImagePrefab, "LabelGameName", ComponentTypeName.Text);
        -- 微信号标签
        self.labelWechatNumber = GetComponentWithPath(self.shareImagePrefab, "LabelWechatNumber", ComponentTypeName.Text);

        self.goIcon = ModuleCache.ComponentManager.Find(self.shareImagePrefab, "SpriteIcon");
        self.imageIcon = GetComponentWithPath(self.shareImagePrefab, "SpriteIcon", ComponentTypeName.Image);
        self.goIconGuiLin = ModuleCache.ComponentManager.Find(self.shareImagePrefab, "GuiLin");
    else
        self.shareImagePrefab:SetActive(true);
    end
    if ModuleCache.GameManager.channel == "HAOCAI" then
        local logSprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle("public/module/shareimage/public_shareimage.atlas", "AppIcon_HAOCAI")
        self.imageIcon.sprite = logSprite
    else
        local logSprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle("public/module/shareimage/public_shareimage.atlas", "AppIcon")
        self.imageIcon.sprite = logSprite
    end

    self.goIcon:SetActive(not (ModuleCache.AppData.Game_Name == "GLZP"))
    self.goIconGuiLin:SetActive(ModuleCache.AppData.Game_Name == "GLZP")

    self.spriteQRCode.sprite = spriteShareImage;
    if spriteShareBg ~= nil then
        self.spriteShareBg.sprite = spriteShareBg;
    end
    self.labelGameName.text = data.gameName;
    self.labelWechatNumber.text = "联系客服:" .. data.custosmerService;
end

-- 更新奖励视图
function ShareView:updateRewardView(activityList, code)

    -- 通过code获取活动数据
    local activity = self:getActivityByCode(activityList, code);

    -- 空数据,奖励图标不显示
    if activity == nil then

        activity = { };
        activity.isReceive = 1;
    end

    local isReceive = activity.isReceive;
    -- 是否显示奖励图标
    local isShowReward = false;
    -- 0未领取 1=已领取
    if isReceive == 0 then

        isShowReward = true;
    elseif isReceive == 1 then
        isShowReward = false;
    end

    self.spriteReward.gameObject:SetActive(isShowReward);
    --self.labelReward.gameObject:SetActive(isShowReward);

    -- 已领取奖励,不需要绘制数据
    if isShowReward == false then
        return;
    end

    -- 数量下限
    local downAmount = nil;
    -- 数量上限
    local upAmount = nil;
    for key, award in ipairs(activity.appAwards) do

        -- 钻石
        if award.amountType == 2 then
            -- 数量下限
            downAmount = award.downAmount;
            -- 数量上限
            upAmount = award.upAmount;
        end
    end

    -- 领取次数
    local getRewardCount = activity.userLimit;

    if downAmount ~= nil and upAmount ~= nil and getRewardCount ~= nil then
        --self.labelReward.text = string.format("分享朋友圈奖<color=#AA391FFF>%d-%d</color>钻石,每天可领<color=#AA391FFF>%d</color>次噢", downAmount, upAmount, getRewardCount);
    end
end

-- 通过code获取活动数据
function ShareView:getActivityByCode(activityList, code)

    local activity;

    for key, activityTemp in ipairs(activityList) do

        if activityTemp.code == code then

            activity = activityTemp;
            return activity;
        end
    end

    return activity;
end

function ShareView:ButtonShareText_Alipay()
    local data = {}
    data.shareApp = "Alipay"
    data.text = "文字测试"
    data.sceneType = "0"
    ModuleCache.GameSDKInterface:ShareText(ModuleCache.Json.encode(data))
end

function ShareView:ButtonShareImage_Alipay()
    local data = {}
    data.shareApp = "Alipay"
    data.path = ModuleCache.UnityEngine.Application.persistentDataPath .. "/screenShot/screenShot.jpg"
    data.sceneType = "0"
    ModuleCache.GameSDKInterface:ShareImage(ModuleCache.Json.encode(data))
end

function ShareView:ButtonShareUrlImage_Alipay()
    local data = {}
    data.shareApp = "Alipay"
    data.sceneType = "0"
    data.imageUrl = "https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg"
    ModuleCache.GameSDKInterface:ShareImage(ModuleCache.Json.encode(data))
end

function ShareView:ButtonShareUrl_Alipay()
    local data = {}
    data.shareApp = "Alipay"
    data.title = "测试测试"
    data.desc = "哈哈"
    data.sceneType = "0"
    data.thumbUrl = "https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg"
    data.wepageUrl = "https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg"
    ModuleCache.GameSDKInterface:ShareUrl(ModuleCache.Json.encode(data))
end

function ShareView:ButtonShareUrlThumbData_Alipay()
    local data = {}
    data.shareApp = "Alipay"
    data.title = "测试测试"
    data.desc = "哈哈"
    data.sceneType = "0"
    data.path = ModuleCache.UnityEngine.Application.persistentDataPath .. "/screenShot/screenShot.jpg"
    data.wepageUrl = "https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg"
    ModuleCache.GameSDKInterface:ShareUrl(ModuleCache.Json.encode(data))
end

function ShareView:ButtonShareText_XianLiao()
    local data = {}
    data.shareApp = "XianLiao"
    data.text = "测试测试"
    --data.imageUrl = "https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg"
    ModuleCache.GameSDKInterface:ShareText(ModuleCache.Json.encode(data))
end

function ShareView:ButtonShareImage_XianLiao()
    local data = {}
    data.shareApp = "XianLiao"
    data.text = "测试测试"
    data.path = ModuleCache.UnityEngine.Application.persistentDataPath .. "/screenShot/screenShot.jpg"
    ModuleCache.GameSDKInterface:ShareImage(ModuleCache.Json.encode(data))
end

--Android不支持
function ShareView:ButtonShareUrlImage_XianLiao()
    if ModuleCache.GameManager.runtimePlatform == "Android" then
        ModuleCache.ModuleManager.show_public_module_textprompt():show_center_tips("此接口Android不支持")
        return
    end
    local data = {}
    data.shareApp = "XianLiao"
    data.text = "测试测试"
    data.imageUrl = "https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg"
    ModuleCache.GameSDKInterface:ShareImage(ModuleCache.Json.encode(data))
end

function ShareView:ButtonShareGame_XianLiao()
    local data = {}
    data.shareApp = "XianLiao"
    data.roomToken = "3123123123123123"
    data.roomId = "123123"
    data.title = "麻将"
    data.text = "安庆麻将"
    data.desc = "描述"
    data.androidDownloadUrl = "http://www.sincebest.com/app/dhqpyx"
    data.iOSDownloadUrl = "http://www.sincebest.com/app/dhqpyx"
    if ModuleCache.GameManager.runtimePlatform == "Android" then
        data.path = ModuleCache.UnityEngine.Application.persistentDataPath .. "/screenShot/screenShot.jpg"
    else
        data.imageUrl = "https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg"
    end
    ModuleCache.GameSDKInterface:ShareUrl(ModuleCache.Json.encode(data))
end


return ShareView
