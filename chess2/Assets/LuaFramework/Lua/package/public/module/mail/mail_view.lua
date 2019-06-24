local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local MailView = Class('MailView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
--local GridEx = require('package.public.module.gridex.grid_ex')
function MailView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/mail/public_windowmail.prefab", "Public_WindowMail", 1, nil, 1)
    View.set_1080p(self)
    --Top
    --self.closeBtn = GetComponentWithPath(self.root, "Top/BtnClose", ComponentTypeName.Transform).gameObject
    self.textGemNum = GetComponentWithPath(self.root, "Top/Coins/Gem/TextNum", ComponentTypeName.Text)
    self.textGoldNum = GetComponentWithPath(self.root, "Top/Coins/Gold/TextNum", ComponentTypeName.Text)
    ----MailInfo
    self.mailInfo = GetComponentWithPath(self.root, "MailInfo", ComponentTypeName.Transform).gameObject
    self.mailName = GetComponentWithPath(self.mailInfo, "MailName", ComponentTypeName.Text)
    self.mailTime = GetComponentWithPath(self.mailInfo, "MailTime", ComponentTypeName.Text)
    self.mailContent = GetComponentWithPath(self.mailInfo, "Content", ComponentTypeName.Text)
    self.mailGetBtn = GetComponentWithPath(self.mailInfo, "Award/GetBtn", ComponentTypeName.Button)
    self.mailAwardspriteAtlas = GetComponentWithPath(self.mailInfo, "Award", "SpriteHolder")
    self.awardIcon1 = GetComponentWithPath(self.mailInfo, "Award/AwardIcon1", ComponentTypeName.Image)
    self.awardIconCount1 = GetComponentWithPath(self.mailInfo, "Award/AwardIcon1/Count", ComponentTypeName.Text)
    self.awardIcon2 = GetComponentWithPath(self.mailInfo, "Award/AwardIcon2", ComponentTypeName.Image)
    self.awardIconCount2 = GetComponentWithPath(self.mailInfo, "Award/AwardIcon2/Count", ComponentTypeName.Text)
    --
    self.getAllBtn = GetComponentWithPath(self.root, "GetAllBtn", ComponentTypeName.Transform).gameObject
    --self.detBtn = GetComponentWithPath(self.root, "DetBtn", ComponentTypeName.Transform).gameObject
    --self.tips = GetComponentWithPath(self.root, "Center/Tips", ComponentTypeName.Transform).gameObject
    --
    --self:init_mail_item()

	self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),ViewBaseData.TopScreenAdaptParam)


    self.itemContent = GetComponentWithPath(self.root, "ItemList", ComponentTypeName.Transform).gameObject
    self.mainContent = GetComponentWithPath(self.root, "MailInfo", ComponentTypeName.Transform).gameObject
    self.noneTips = GetComponentWithPath(self.root, "NoneTips", ComponentTypeName.Transform).gameObject
    self.itemObj = GetComponentWithPath(self.root, "ItemList/ItemScrollView/Content/Item", ComponentTypeName.Transform).gameObject
    self.itemObj:SetActive(false)
    self.itemContent:SetActive(false)
    self.mainContent:SetActive(false)
    self.getAllBtn:SetActive(false)
    --self.detBtn:SetActive(false)
    self.itemList = {}
end

function MailView:init_mail_view(data, index)

    for i = 1, #self.itemList do
        self.itemList[i].obj:SetActive(false)
    end
    self:init_mail_item(data)
    if #data > 0 then
        self:item_choose(index)
    end
    self.itemContent:SetActive(data and #data > 0)
    self.mainContent:SetActive(data and #data > 0)
    self.noneTips:SetActive(not data or #data == 0)
    self.getAllBtn:SetActive(data and #data > 0)
    --self.detBtn:SetActive(data and #data > 0)
end

function MailView:init_mail_item(data)
    for i = 1, #data do
        local info = data[i]
        local obj
        if self.itemList[i] then
            obj = self.itemList[i].obj
            obj:SetActive(true)
            self.itemList[i].info = info
        else
            obj = ModuleCache.ComponentUtil.InstantiateLocal(self.itemObj)
            obj.transform:SetParent(self.itemObj.transform.parent, false);
            obj:SetActive(true)
            local choose = GetComponentWithPath(obj, "Di/Kuang", ComponentTypeName.Transform).gameObject
            local btn = ModuleCache.ComponentManager.GetComponent(obj, ComponentTypeName.Button)
            choose:SetActive(false)
            local item = {}
            item.obj = obj
            item.choose = choose
            item.info = info
            item.btn = btn
            table.insert(self.itemList, item)
        end
        obj.name = i
        --btn.onClick:AddListener(function()
        --    self:item_choose(i)
        --end)
        local titleText = GetComponentWithPath(obj, "Title", ComponentTypeName.Text)
        local timeText = GetComponentWithPath(obj, "Time", ComponentTypeName.Text)
        local senderText = GetComponentWithPath(obj, "Sender", ComponentTypeName.Text)
        local awardIcon = GetComponentWithPath(obj, "Award", ComponentTypeName.Transform).gameObject
        local readText = GetComponentWithPath(obj, "IsRead", ComponentTypeName.Text)
        titleText.text = Util.filterPlayerName(info.title, 20)
        timeText.text = info.createShowTime
        senderText.text = "发件人：系统"
        awardIcon:SetActive(false)
        if #info.attachs > 0 then
            if info.attachStatus == 1 then
                awardIcon:SetActive(true)
            end
        end
        if info.status == 1 then
            readText.text = "<color=#815f48>未读</color>"
        else
            readText.text = "<color=#d84325>已读</color>"
        end
    end

end

function MailView:item_choose(index)
    if not index then
        index = 1
    end
    for i = 1, #self.itemList do
        self.itemList[i].choose:SetActive(i == index)
        --self.itemList[i].btn.enabled = i ~= index
    end
    self:MailInfo(self.itemList[index].info)
end

function MailView:refreshPlayerInfo(roleData)
    if ((not roleData) or (not roleData.cards)) then
        return
    end
    self.textGoldNum.text = Util.filterPlayerGoldNum(roleData.gold)
    self.textGemNum.text = Util.filterPlayerGoldNum(tonumber(roleData.cards) + tonumber(roleData.coins))
end


--打开邮件显示详情
function MailView:MailInfo(mailData)
    self.mailInfo:SetActive(true)
    self.mailName.text = Util.filterPlayerName(mailData.title, 30)
    self.mailTime.text = mailData.createTime
    self.mailAwardspriteAtlas.gameObject:SetActive(false)
    --最多两种物品 多了不显示了
    if #mailData.attachs > 0 then
        local gameName = ""
        if mailData.attachs[1].gameId ~= ModuleCache.Json.null then
            gameName = ModuleCache.PlayModeUtil.getPlayNameByAppAndGameName(mailData.attachs[1].gameId)
        end 
        
        self.awardIconCount1.text = "x" .. (mailData.attachs[1].num == ModuleCache.Json.null and 0 or Util.filterPlayerGoldNum(mailData.attachs[1].num)) .. "  " .. gameName
        self.awardIcon1.sprite = self.mailAwardspriteAtlas:FindSpriteByName(mailData.attachs[1].type)
        self.awardIcon1:SetNativeSize()
        if mailData.attachs[2] ~= nil then
            gameName = ""
            if mailData.attachs[2].gameId ~= ModuleCache.Json.null then
                gameName = ModuleCache.PlayModeUtil.getPlayNameByAppAndGameName(mailData.attachs[2].gameId)
            end 
            self.awardIcon2.sprite = self.mailAwardspriteAtlas:FindSpriteByName(mailData.attachs[2].type)
            self.awardIconCount2.text = "x" .. (mailData.attachs[2].num == ModuleCache.Json.null and 0 or Util.filterPlayerGoldNum(mailData.attachs[2].num)).. "  " .. gameName
            self.awardIcon2:SetNativeSize()
            self.awardIcon2.gameObject:SetActive(true)
        else
            self.awardIcon2.gameObject:SetActive(false)
        end

        if mailData.attachStatus == 1 then
            self.mailAwardspriteAtlas.gameObject:SetActive(true)
        end
    end
    self.mailContent.text = mailData.msg
end

return MailView