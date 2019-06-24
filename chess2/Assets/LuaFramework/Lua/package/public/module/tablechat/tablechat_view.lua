
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================
local giftConfig = require('package.public.module.table_gift.gift_config')

local TableChatView = Class('tableChatView', View)

local ModuleCache = ModuleCache

local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentUtil

local controllWidth = 432
local vChildWidth = 34
local CSmartTimer = ModuleCache.SmartTimer.instance

function TableChatView:initialize(...)
    self.curTableData = TableManager.curTableData
    self.config = Config
    -- 初始View
    View.initialize(self, "public/module/tablechat/public_tablechat.prefab", "Public_TableChat", 1)
    View.set_1080p(self);

    self._uiSwitcher = GetComponentWithPath(self.root, "Right/Child", "UIStateSwitcher")
    self.buttonClose = GetComponentWithPath(self.root, "Right/Child/Background/ButtonClose", ComponentTypeName.Button)
    self.textScroll = GetComponentWithPath(self.root, "Right/Child/RectTop", ComponentTypeName.ScrollRect)
    self.textItem = GetComponentWithPath(self.root, "Right/Child/ButtonChatTextItem", ComponentTypeName.Button)
    self.textLayout = GetComponentWithPath(self.root, "Right/Child/RectTop/Layout", ComponentTypeName.GridLayoutGroup)
    self.toggles = {}
    self.toggles[1] = GetComponentWithPath(self.root, "Right/Child/Toggles/ToggleFace", ComponentTypeName.Toggle)
    self.toggles[2] = GetComponentWithPath(self.root, "Right/Child/Toggles/ToggleShortMes", ComponentTypeName.Toggle)
    self.toggles[3] = GetComponentWithPath(self.root, "Right/Child/Toggles/ToggleMes", ComponentTypeName.Toggle)
    self.panel = GetComponentWithPath(self.root, "Right/Child/Panels", ComponentTypeName.Transform).gameObject
    self.panels = TableUtil.get_all_child(self.panel)
    self.faseItem = GetComponentWithPath(self.root, "Right/Child/Panels/PanelFace/Scroll View/Viewport/Content/FaceItem", ComponentTypeName.Transform).gameObject
    self.msgItem = GetComponentWithPath(self.root, "Right/Child/Panels/PanelMsg/Scroll View/Viewport/Content/MsgItem", ComponentTypeName.Transform).gameObject
    self.shortMsgItem = GetComponentWithPath(self.root, "Right/Child/Panels/PanelShortMsg/Scroll View/Viewport/Content/ShortMsgItem", ComponentTypeName.Transform).gameObject
    self.msgScrollRect = GetComponentWithPath(self.root, "Right/Child/Panels/PanelMsg/Scroll View", ComponentTypeName.ScrollRect)
    self.MsgText = GetComponentWithPath(self.root, "Right/Child/InputField", ComponentTypeName.InputField)
    self.widthText = GetComponentWithPath(self.root, "Right/Child/WidthText", ComponentTypeName.Text)
    ModuleCache.ComponentUtil.SafeSetActive(self.faseItem, false) 
    ModuleCache.ComponentUtil.SafeSetActive(self.msgItem, false) 
    ModuleCache.ComponentUtil.SafeSetActive(self.shortMsgItem, false) 
    self:refresh_toggles()
    
    self:refresh_faces()
    self:init_interactive_face()
    self:show_text_chat_panel(true)
end

function TableChatView:init_interactive_face()
    local spriteHolder = GetComponentWithPath(self.root, "holder", 'SpriteHolder')
    self.goInteractiveFacePanel = GetComponentWithPath(self.root, "Right/Child/PanelInteractiveFace", ComponentTypeName.Transform).gameObject
    self.goInteractiveFaceItemPrefab = GetComponentWithPath(self.goInteractiveFacePanel, "Scroll View/Viewport/Content/FaceItem", ComponentTypeName.Transform).gameObject

    local configTable = giftConfig.get_gift_config()
    self.interactiveFace_button_configs = {
        configTable['chat_coffee'],
        --configTable['chat_naneki_neko'],
        configTable['chat_wash_hands'],
        configTable['chat_panda'],
        configTable['chat_god_of_wealth'],
    }
    self.interactiveFaceHolderList = {}
    for i = 1, #self.interactiveFace_button_configs do
        local config = self.interactiveFace_button_configs[i]
        local holder = {}
        holder.data = config
        holder.root = ComponentUtil.InstantiateLocal(self.goInteractiveFaceItemPrefab, self.goInteractiveFaceItemPrefab.transform.parent.gameObject)
        holder.image = GetComponentWithPath(holder.root, "Image", ComponentTypeName.Image)
        holder.image.sprite = spriteHolder:FindSpriteByName(config.spriteName)
        ModuleCache.ComponentUtil.SafeSetActive(holder.root, true)
        table.insert(self.interactiveFaceHolderList, holder)
    end
end

function TableChatView:refresh_toggles()
    for i=1,#self.toggles do
        if self.goInteractiveFacePanel then
            self.goInteractiveFacePanel:SetActive(self.toggles[1].isOn)
        end
        ModuleCache.ComponentUtil.SafeSetActive(self.panels[i], self.toggles[i].isOn) 
    end
end

function TableChatView:refresh_faces()
    self.chatFaceObjs = {}
    for i=1,20 do
        local item = ModuleCache.ComponentUtil.InstantiateLocal(self.faseItem, self.faseItem.transform.parent.gameObject)  
        item.name = self.faseItem.name        
        item:SetActive(true)
        local image = GetComponentWithPath(item, "Image", ComponentTypeName.Image)
        local spriteHolder = GetComponentWithPath(item, "Image", "SpriteHolder")
        if(spriteHolder) then
            image.sprite = spriteHolder:FindSpriteByName((i - 1) .. "")
        end
        image:SetNativeSize()
        table.insert(self.chatFaceObjs, image.gameObject)
    end
end

function TableChatView:refresh_short_msgs()
    if(self.chatTextObjs)then
        for k,v in pairs(self.chatTextObjs) do
            UnityEngine.GameObject.Destroy(v.gameObject)
        end
    end
    self.chatTextObjs = {}
    for k,v in pairs(self.chatShotTextList or self.config.chatShotTextList) do
        local item = ModuleCache.ComponentUtil.InstantiateLocal(self.shortMsgItem, self.shortMsgItem.transform.parent.gameObject)  
        item.name = k
        item:SetActive(true)
        local text = ModuleCache.ComponentManager.GetComponentWithPath(item, "Text", ComponentTypeName.Text)
        text.text = v
        table.insert(self.chatTextObjs, item)
    end
end

function TableChatView:refresh_chat_msgs(chatMsgs)
    self:refresh_short_msgs()
    
    local chatChilds = TableUtil.get_all_child(self.msgItem.transform.parent.gameObject)
    for i=1,#chatChilds do
        chatChilds[i]:SetActive(false)
    end
    for i=1,#chatMsgs do
        local chatMsg = chatMsgs[i]
        local item = nil
        if(i <= #chatChilds) then
            item = chatChilds[i]
        else
            item = ModuleCache.ComponentUtil.InstantiateLocal(self.msgItem, self.msgItem.transform.parent.gameObject) 
        end
        item.name = i       
        item:SetActive(true)
        local chatTextItem = {}
        local left = GetComponentWithPath(item, "Left", ComponentTypeName.Transform).gameObject
        local right = GetComponentWithPath(item, "Right", ComponentTypeName.Transform).gameObject
        left:SetActive(not chatMsg.isMe)
        right:SetActive(chatMsg.isMe)
        if(chatMsg.isMe) then
            chatTextItem.gameObject = right
        else
            chatTextItem.gameObject = left
        end
        chatTextItem.textName = GetComponentWithPath(chatTextItem.gameObject, "Name", ComponentTypeName.Text)
        chatTextItem.imageHead = GetComponentWithPath(chatTextItem.gameObject, "ImageHead", ComponentTypeName.Image)
         chatTextItem.textContent = GetComponentWithPath(chatTextItem.gameObject, "VChild/TextBg/Text", ComponentTypeName.Text)
        chatTextItem.vChildRect = GetComponentWithPath(chatTextItem.gameObject, "VChild", ComponentTypeName.RectTransform)
        chatTextItem.contentRect = GetComponentWithPath(chatTextItem.gameObject, "VChild/TextBg/Text", ComponentTypeName.RectTransform)

         chatTextItem.voiceBtn = GetComponentWithPath(chatTextItem.gameObject, "VChild/VoiceBg/voiceBtn", ComponentTypeName.Button)
        chatTextItem.voiceBtnAnimation = GetComponentWithPath(chatTextItem.gameObject, "VChild/VoiceBg/voiceBtn", "UIImageAnimation")

        chatTextItem.textContent.transform.parent.gameObject:SetActive(not (chatMsg.chatType == 0) )
        chatTextItem.voiceBtn.transform.parent.gameObject:SetActive(chatMsg.chatType == 0 )
        if chatMsg.chatType == 0 then
            
        else

            chatTextItem.textContent.text = TableUtil.cut_text(self.widthText,chatMsg.content or chatMsg.words,controllWidth)
        end

        
        if(chatMsg.isMe) then
            chatTextItem.vChildRect.sizeDelta = Vector2.New(vChildWidth + (controllWidth - chatTextItem.textContent.preferredWidth), chatTextItem.vChildRect.sizeDelta.y)
        end
        self:get_player_info(chatTextItem, chatMsg)
    end
    self:subscibe_time_event(0.1, false, 0):OnComplete(function(t)
        self.msgScrollRect.verticalNormalizedPosition = 0
    end)
end

--- 刷新跑胡子聊天消息
function TableChatView:refresh_phz_chat_msgs(chatMsgs)
    self:refresh_short_msgs()

    local chatChilds = TableUtil.get_all_child(self.msgItem.transform.parent.gameObject)
    for i=1,#chatChilds do
        chatChilds[i]:SetActive(false)
    end
    for i=1,#chatMsgs do
        local chatMsg = chatMsgs[i]
        local item = nil
        if(i <= #chatChilds) then
            item = chatChilds[i]
        else
            item = ModuleCache.ComponentUtil.InstantiateLocal(self.msgItem, self.msgItem.transform.parent.gameObject)
        end
        item.name = i
        item:SetActive(true)
        local chatTextItem = {}
        local left = GetComponentWithPath(item, "Left", ComponentTypeName.Transform).gameObject
        local right = GetComponentWithPath(item, "Right", ComponentTypeName.Transform).gameObject
        left:SetActive(not chatMsg.isMe)
        right:SetActive(chatMsg.isMe)
        if(chatMsg.isMe) then
            chatTextItem.gameObject = right
        else
            chatTextItem.gameObject = left
        end
        chatTextItem.textName = GetComponentWithPath(chatTextItem.gameObject, "Name", ComponentTypeName.Text)
        chatTextItem.imageHead = GetComponentWithPath(chatTextItem.gameObject, "ImageHead", ComponentTypeName.Image)
        chatTextItem.textContent = GetComponentWithPath(chatTextItem.gameObject, "VChild/TextBg/Text", ComponentTypeName.Text)
        chatTextItem.vChildRect = GetComponentWithPath(chatTextItem.gameObject, "VChild", ComponentTypeName.RectTransform)
        chatTextItem.contentRect = GetComponentWithPath(chatTextItem.gameObject, "VChild/TextBg/Text", ComponentTypeName.RectTransform)

        chatTextItem.voiceBtn = GetComponentWithPath(chatTextItem.gameObject, "VChild/VoiceBg/voiceBtn", ComponentTypeName.Button)
        chatTextItem.voiceBtnAnimation = GetComponentWithPath(chatTextItem.gameObject, "VChild/VoiceBg/voiceBtn", "UIImageAnimation")

        chatTextItem.textContent.transform.parent.gameObject:SetActive(not (chatMsg.chatType == 0) )
        chatTextItem.voiceBtn.transform.parent.gameObject:SetActive(chatMsg.chatType == 0 )
        if chatMsg.chatType == 0 then

        else

            chatTextItem.textContent.text = TableUtil.cut_text(self.widthText,chatMsg.content or chatMsg.words,controllWidth)
        end


        if(chatMsg.isMe) then
            chatTextItem.vChildRect.sizeDelta = Vector2.New(vChildWidth + (controllWidth - chatTextItem.textContent.preferredWidth), chatTextItem.vChildRect.sizeDelta.y)
        end

        local phzTableData = TableManager.phzTableData
        if chatMsg.userId and chatMsg.SeatID then
            if not self.phzPlayersInfo then
                self.phzPlayersInfo = {}
            end
            local player = self.phzPlayersInfo[tostring(chatMsg.userId)]
            if player then
                chatTextItem.textName.text = Util.filterPlayerName(player.playerName, 10)
                if(player.spriteHeadImage)then
                    chatTextItem.imageHead.sprite = player.spriteHeadImage
                end
            else
                self.phzPlayersInfo[tostring(chatMsg.userId)] = {}
                TableUtil.download_seat_detail_info(chatMsg.userId, function(playerInfo)
                    chatTextItem.imageHead.sprite = playerInfo.headImage
                    self.phzPlayersInfo[tostring(chatMsg.userId)].spriteHeadImage = playerInfo.headImage
                end, function(playerInfo)
                    chatTextItem.textName.text = Util.filterPlayerName(playerInfo.playerName, 10)
                    self.phzPlayersInfo[tostring(chatMsg.userId)].playerName = playerInfo.playerName
                end)
            end
        end
    end
    self:subscibe_time_event(0.1, false, 0):OnComplete(function(t)
        self.msgScrollRect.verticalNormalizedPosition = 0
    end)
end

function TableChatView:get_player_info(chatTextItem, chatMsg)
    local curTableData = self.curTableData
    if not curTableData.seatHolderArray then
        return
    end
	for i=1,#curTableData.seatHolderArray do
		local seatHolder = curTableData.seatHolderArray[i]
        local uid = chatMsg.userId or seatHolder.playerId
		if(seatHolder and seatHolder.SeatID == chatMsg.SeatID and uid) then
            if(seatHolder.playerInfo and seatHolder.playerInfo.playerName and seatHolder.playerInfo.spriteHeadImage)then
                local playerInfo = seatHolder.playerInfo
                chatTextItem.textName.text = Util.filterPlayerName(playerInfo.playerName, 10)
                chatTextItem.imageHead.sprite = playerInfo.spriteHeadImage
            elseif(chatMsg.playerInfo) then
                chatTextItem.textName.text = Util.filterPlayerName(chatMsg.playerInfo.playerName, 10)
                chatTextItem.imageHead.sprite = chatMsg.playerInfo.spriteHeadImage
            else
                TableUtil.download_seat_detail_info(uid,function(playerInfo)
                    chatTextItem.imageHead.sprite = playerInfo.headImage
                end, function(playerInfo)
                    chatTextItem.textName.text = Util.filterPlayerName(playerInfo.playerName, 10)
                    if(playerInfo.spriteHeadImage)then
                        chatTextItem.imageHead.sprite = playerInfo.spriteHeadImage
                    end
                end)
            end
        else
		end
	end
end

function TableChatView:show_text_chat_panel(show)
    if(show)then
        self._uiSwitcher:SwitchState("Normal")
    else
        self._uiSwitcher:SwitchState("Hide_TextChat")
    end

end

return TableChatView