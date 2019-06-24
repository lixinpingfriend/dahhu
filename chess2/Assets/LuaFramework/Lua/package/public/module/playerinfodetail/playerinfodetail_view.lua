
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class PlayerInfoDetailView : View
local PlayerInfoDetailView = Class('playerInfoDetailView', View)
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local Application = UnityEngine.Application
local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithSimple = ModuleCache.ComponentUtil.GetComponentWithSimple
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local cjson = require("cjson");

function PlayerInfoDetailView:initialize()
    -- 初始View
    View.initialize(self, "public/module/playerinfodetail/public_playerinfodetail.prefab", "Public_PlayerInfoDetail", 1)
    View.set_1080p(self)

    self.spriteHolder = GetComponentWithSimple(self.root, "SpriteHolder", "SpriteHolder");

    -- 复制按钮
    self.buttonCopy = GetComponentWithSimple(self.root, "ButtonCopy", ComponentTypeName.Button);



    ---- 编辑按钮
    --self.buttonEdit = GetComponentWithSimple(self.root, "ButtonEdit", ComponentTypeName.Button);
    --local onButtonEdit = function()
    --    -- 点击编辑按钮
    --    self:onClickEditButton();
    --end
    --self.buttonEdit.onClick:AddListener(onButtonEdit);
    ---- 保存按钮
    --self.buttonSave = GetComponentWithSimple(self.root, "ButtonSave", ComponentTypeName.Button);
    --local onButtonSave = function()
    --    -- 点击保存按钮
    --    self:onClickSaveButton();
    --end
    --self.buttonSave.onClick:AddListener(onButtonSave);
    -- 性别图标
    self.spriteMale = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/PlayerInfo/Avatar/SpriteMale", ComponentTypeName.Image);
    -- 头像图标
    self.spriteAvatar = ModuleCache.ComponentManager.GetComponentWithPath(self.root, "Center/PlayerInfo/Avatar/Mask/SpriteAvatar", ComponentTypeName.Image);
    -- 玩家名字标签
    self.labelName = GetComponentWithSimple(self.root, "LabelName", ComponentTypeName.Text);
    -- 玩家id标签
    self.labelID = GetComponentWithSimple(self.root, "LabelID", ComponentTypeName.Text);
    self.labelPhone = GetComponentWithPath(self.root, "Center/PlayerInfo/LabelPhone", ComponentTypeName.Text);
    self.labelIP = GetComponentWithPath(self.root, "Center/PlayerInfo/LabelIP", ComponentTypeName.Text);
    self.labelLocation = GetComponentWithPath(self.root, "Center/PlayerInfo/LabelLocation", ComponentTypeName.Text);

    self.goBindingPhone = ModuleCache.ComponentManager.Find(self.root, "Center/PlayerInfo/ButtonBindingPhone");
    self.goReBindingPhone = ModuleCache.ComponentManager.Find(self.root, "Center/PlayerInfo/ButtonReBindingPhone");
    -- 签名输入框
    self.inputSign = GetComponentWithSimple(self.root, "InputSign", ComponentTypeName.InputField);
    self.SignTextCount = GetComponentWithSimple(self.root, "SignTextCount", ComponentTypeName.Text)
    -- 功能按钮父物体
    self.buttonsParent = GetComponentWithSimple(self.root, "ButtonsGO", ComponentTypeName.Transform).gameObject;

    self.copyItem = GetComponentWithPath(self.root, "Center/PlayerInfo/ItemPrefabHolder/CopyItem", ComponentTypeName.Transform).gameObject
    self.copyParent = GetComponentWithPath(self.root, "Center/PlayerInfo/Scroll View/Viewport/Content", ComponentTypeName.RectTransform)
    self.openPickObj = GetComponentWithPath(self.root, "Center/PlayerInfo/Scroll View/Viewport/Content/openPickBtn", ComponentTypeName.Transform)

    self.originalImgObj = GetComponentWithPath(self.root, "OriginalImg", ComponentTypeName.Transform).gameObject
    self.originalImg = GetComponentWithPath(self.root, "OriginalImg/Scroll View/Viewport/Content/RawImage", ComponentTypeName.RawImage)
    self.originalImgRectTran = GetComponentWithPath(self.root, "OriginalImg/Scroll View/Viewport/Content/RawImage", ComponentTypeName.RectTransform)
    self.originalImgGridLayoutGroup = GetComponentWithPath(self.root, "OriginalImg/Scroll View/Viewport/Content", ComponentTypeName.GridLayoutGroup)
end

function PlayerInfoDetailView:init(showType, userInfo, module)

    self.showType = showType;
    if self.showType == 1 then
        self.inputSign.interactable = true;
        self.buttonsParent:SetActive(true);
    elseif self.showType == 2 then
        self.buttonsParent:SetActive(false);
        self.inputSign.interactable = false;
    end
    -- 用户信息
    self.userInfo = userInfo;
    self.model = module.model;

    -- 更新玩家信息视图
    self:updatePlayerInfoView();

end

-- 更新玩家信息视图
function PlayerInfoDetailView:updatePlayerInfoView()

    -- 玩家名字
    self.labelName.text = self.userInfo.uiContractionsNickname
    -- 玩家id
    self.labelID.text = self.userInfo.uiUserId

    local onPlayerAvatar = function(sprite)
        -- 玩家头像
        self.spriteAvatar.sprite = sprite;
    end
    self:image_load_sprite(nil, self.userInfo.headImg, onPlayerAvatar);

    -- 男
    if self.userInfo.gender == 1 then
        self.spriteMale.sprite = self.spriteHolder:FindSpriteByName("male");
        -- 女
    elseif self.userInfo.gender == 2 then
        self.spriteMale.sprite = self.spriteHolder:FindSpriteByName("female");
    end
    if tostring(self.userInfo.userId) ~= tostring(self.modelData.roleData.userID) then
        self.labelPhone.text = "手机号：***********"
        self.labelIP.text = "IP：" .. self:compressIp(self.userInfo.ip);
        self.labelLocation.text = "***************"
        self.goBindingPhone:SetActive(false)
        self.goReBindingPhone:SetActive(false)
    else
        if type(self.userInfo.ip) ~= "userdata" then
            self.labelIP.text = "IP：" .. self.userInfo.ip;
        end

        if not self.userInfo.mobile or self.userInfo.mobile == "" then
            self.labelPhone.text = "手机号：暂未绑定手机号"
            self.goBindingPhone:SetActive(true)
            self.goReBindingPhone:SetActive(false)
        else
            self.labelPhone.text = "手机号：" .. self.userInfo.mobile
            self.goBindingPhone:SetActive(false)
            self.goReBindingPhone:SetActive(true)
        end
        self:begin_location(function(data)
            if data.address then
                self.labelLocation.text = self:format_location_address(data.address)
            end
        end)
    end

    -- 签名数据不为空,更新签名数据
    if self.userInfo.signature ~= "" then
        self.inputSign.text = self.userInfo.signature;
    end
end

function PlayerInfoDetailView:format_location_address(address)
    local str = address
    local startPos, endPos = string.find(address, '市')
    if (endPos and endPos > 1) then
        str = string.sub(address, 1, endPos)
    end
    return str
end

function PlayerInfoDetailView:compressIp(str)
    if str == ModuleCache.Json.null then
        return ""
    end

    local ipstrs = string.split(str,"%.")
    if type(ipstrs) == "table" and #ipstrs == 4 then
        ipstrs[4] = "*"
        ipstrs[3] = "*"
        local ipstr = ""
        for i = 1,4 do
            if ipstr == ""then
                ipstr = ipstrs[i]
            else
                ipstr = ipstr .. "." .. ipstrs[i]
            end

        end
        return ipstr
    else
        return str
    end

end


---- 点击编辑按钮
--function PlayerInfoDetailView:onClickEditButton()
--
--    --  self.inputSign.interactable = true;
--end
--
---- 点击保存按钮
--function PlayerInfoDetailView:onClickSaveButton()
--
--    print("签名==", self.inputSign.text);
--    -- 去空格
--    local sign = Util.trim(self.inputSign.text);
--    -- 请求保存签名协议
--    self.model:saveSign(sign);
--end


--初始化亲友圈列表
function PlayerInfoDetailView:initLoopScrollViewList(dataList)
    self.dataList = dataList

    if not dataList then
        return
    end

    self:reset()

    if(#dataList > 0) then
        for i=1,#dataList do
            self:fillItem(self:get_item(dataList[i], i))
        end
    end

    self.openPickObj:SetAsLastSibling()
    self.openPickObj.gameObject:SetActive(tostring(self.userInfo.userId) == tostring(self.modelData.roleData.userID) and #dataList<5  )

end

function PlayerInfoDetailView:fillItem(item)
    local data = item.data
    item.imageHead =  GetComponentWithPath(item.gameObject,"Mask/SpriteAvatar", ComponentTypeName.RawImage)
    local deleteBtnObj = GetComponentWithPath(item.gameObject,"deleteBtn", ComponentTypeName.Transform).gameObject
    local itemBtn = ModuleCache.ComponentManager.GetComponent(item.gameObject,ComponentTypeName.Button)

    if(data) then
        deleteBtnObj:SetActive(tostring(data.userId) == tostring(self.modelData.roleData.userID))
        itemBtn.interactable = tostring(data.userId) == tostring(self.modelData.roleData.userID)

        local arr2 = string.split(data.imgUrl, "/")
        data.savePath  = Application.persistentDataPath .. "/image/" .. arr2[#arr2]

        ModuleCache.TextureCacheManager._get_texture_with_www(data.imgUrl, 10,function(err, sprite)
            if (err) then

            else
                if sprite ~= nil then

                    local _texture = ModuleCache.TextureCacheManager._get_local_chat_texture(data.savePath)
                    item.imageHead.texture =  _texture
                end
            end
        end, data.savePath)
    end
end

function PlayerInfoDetailView:get_item(data, i)
    local obj = nil
    local item = {}
    if i<=#self.contents and self.contents[i].name ~= "openPickBtn" then
        obj = self.contents[i]
    else
        obj = TableUtil.clone(self.copyItem,self.copyParent.gameObject,Vector3.zero)
    end
    obj.name = "item_" .. i
    ComponentUtil.SafeSetActive(obj, true)
    item.gameObject = obj
    item.data = data
    return item
end

function PlayerInfoDetailView:reset()
    self.contents = TableUtil.get_all_child(self.copyParent.gameObject)
    for i=1,#self.contents do
        --if self.contents[i].name ~= "openPickBtn" then
            ComponentUtil.SafeSetActive(self.contents[i], false)
        --end
    end
end

return PlayerInfoDetailView