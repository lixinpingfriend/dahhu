
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local BaseView = require('package.public.module.chessmuseum.chessmuseum_base_view')
-- ==========================================================================

---@class chessMuseumView3D : View
local ChessMuseumView3D = Class('chessMuseumView3D', BaseView)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local ComponentUtil = ModuleCache.ComponentManager
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
local CSmartTimer = ModuleCache.SmartTimer.instance
local CustomImageManager = ModuleCache.CustomImageManager
local Application = UnityEngine.Application
local Vector2 = Vector2

-- 智能判断是否能摆下4列，以后改变了布局大小需要手动技术房间列表最大列数的显示
local MaxGridLayoutGroupRoomScrollViewContentRowWidth = 1700--1443
function ChessMuseumView3D:initialize(...)
    -- 初始View
    --View.initialize(self, "public/module/chessmuseum/public_chessmuseum.prefab", "Public_ChessMuseum", 0)
    View.initialize(self, "public/module/chessmuseum/public_chessmuseum_3d.prefab", "Public_ChessMuseum_3D", 0)
    View.set_1080p(self)
	self:on_initialize_ui()

    self.museumListShowPosX = 589.3
    if ModuleCache.AppData.isFullScreen == true then
        self.museumListShowPosX = 678
    end
    --聊天缩小消息item
    self.copyItem[7] = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/Msg_mini", ComponentTypeName.Transform).gameObject
    -- 聊天缩小消息parent
    self.copyParent[7] = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel_mini/ListScrollView_chatMsg/Viewport/Content", ComponentTypeName.Transform)
    self.miniChatMsgScrollRect = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel_mini/ListScrollView_chatMsg", ComponentTypeName.ScrollRect)

    self.boxScrollViewRectTran = GetComponentWithPath(self.root, "TopRight/Child/boxScrollView", ComponentTypeName.RectTransform)
    self.museumListShow = PlayerPrefsManager.GetInt("museumListOpenState", 0) == 1   -- 1 展开  0 收回
    self:museumListState(self.museumListShow)
    self.museumListShouHuiIcon1:SetActive(not self.museumListShow)
    self.museumListShouHuiIcon2:SetActive(  self.museumListShow)

    self.msgPanelObj = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel",  ComponentTypeName.Transform).gameObject
    self.msgPanelObj_mini = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel_mini",  ComponentTypeName.Transform).gameObject
    self.noMsgObj_mini = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel_mini/noMsgObj",  ComponentTypeName.Transform).gameObject

    if PlayerPrefsManager.GetInt("museumChatState", 1) == 1 then
        self:ChatWindowState(false)
    else
        self:ChatWindowState(true)
    end
end

function ChessMuseumView3D:museumListState(show)
    self.museumListShow = show
    self.museumListShouHuiIcon1:SetActive(not show)
    self.museumListShouHuiIcon2:SetActive(  show)
    if show then
        self.museumListPanel.transform.localPosition = Vector3.New(self.anchor.left.localPosition.x +self.museumListShowPosX, self.museumListPanel.transform.localPosition.y, 0)
        PlayerPrefsManager.SetInt("museumListOpenState", 1)  -- 1 展开  0 收回
    else
        self.museumListPanel.transform.localPosition = Vector3.New(self.anchor.left.localPosition.x -3.3, self.museumListPanel.transform.localPosition.y, 0)
        PlayerPrefsManager.SetInt("museumListOpenState", 0)  -- 1 展开  0 收回
    end
end


local bigChatBoxScrollWide = -673.8
local miniChatBoxScrollWide = -362
function ChessMuseumView3D:ChatWindowState(isMini)
    self.msgPanelObj:SetActive(not isMini)
    self.msgPanelObj_mini:SetActive(isMini)

    if isMini then
        PlayerPrefsManager.SetInt("museumChatState", 0)  -- 1 展开  0 收回

        ModuleCache.TalkingDataMgr().setEvent("Museum_Chat_Type_Mini", {data = 1})
        self.boxScrollViewRectTran.sizeDelta = Vector2.New(miniChatBoxScrollWide, self.boxScrollViewRectTran.sizeDelta.y)
        --self.boxScrollViewRectTran:SetInsetAndSizeFromParentEdge(UnityEngine.RectTransform.Edge.Left, 673.8, 1000)
        --self.boxScrollViewRectTran:SetSizeWithCurrentAnchors(UnityEngine.RectTransform.Axis.Horizontal, 1000);

        self.miniChatMsgScrollRect.verticalNormalizedPosition = 0

        -- 3d界面 只有一个包间的 在宽屏手机上 在聊天框缩小时显示4列
        if self.boxListData and #self.boxListData == 1 then
            if self.transformBoxScrollContentRect.rect.width > MaxGridLayoutGroupRoomScrollViewContentRowWidth then
                self.boxListData[1].item.gridLayoutGroupRoomScrollViewContent.constraintCount = 4
            end
        end

    else
        PlayerPrefsManager.SetInt("museumChatState", 1)  -- 1 展开  0 收回

        ModuleCache.TalkingDataMgr().setEvent("Museum_Chat_Type_big", {data = 1})
        self.boxScrollViewRectTran.sizeDelta = Vector2.New(bigChatBoxScrollWide, self.boxScrollViewRectTran.sizeDelta.y)
        --self.boxScrollViewRectTran:SetInsetAndSizeFromParentEdge(UnityEngine.RectTransform.Edge.Left, 358.8, 1000)

        -- 3d界面 只有一个包间的  在聊天框正常时显示3列
        if self.boxListData and #self.boxListData == 1 then
            self.boxListData[1].item.gridLayoutGroupRoomScrollViewContent.constraintCount = 3
        end

        self:reset(5)--聊天窗口
        self:reset(7)-- 缩略聊天窗口
        self:initLoopScrollViewList_chatMsg(nil,nil,true)
    end

end

local chatUseSimulationData = false
local msgStr = " [{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"大师法务风娃娃儿发大水发文阿道夫俺的沙发啊阿斯蒂芬\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":false,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":false,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1}]"

--初始化聊天消息列表
function ChessMuseumView3D:initLoopScrollViewList_chatMsg(chatData, topMsg,forceRefresh)
    if chatUseSimulationData then
        self:reset(5)
        chatData =ModuleCache.Json.decode(msgStr)
    end

    chatData = chatData or self.chatMsgList

    local tempData = {}
    if (chatData and #chatData > 0) then
        for i = 1, #chatData do
            if os.time() - chatData[i].messageCreateSeconds <= 86400 then
                -- 86400 = 24 *60*60   24小时
                table.insert(tempData, chatData[i])
            end
        end

        chatData = tempData
    end

    self.chatMsgList = chatData
    self.noMsgObj_mini:SetActive(not chatData or (chatData and #chatData < 1))
    if not chatData or (chatData and #chatData < 1)  or not self.museumData then
        self:reset(5)--聊天窗口
        self:reset(7)-- 缩略聊天窗口
        return
    end

    local showChatData = {}

    local len = #chatData
    if len > 50 then
        -- 策划说超过50条不显示啦 喜大普奔
        local sublen = len - 50
        for i = 1, 50 do
            showChatData[i] = chatData[i + sublen]
        end
    else
        showChatData = chatData
    end
    self.chatData = showChatData

    if (#self.chatData > 0) then
        for i = 1, #self.chatData do
            if ( i == 1 or (i % 20 == 0) or (self.chatData[i].messageCreateSeconds - PlayerPrefsManager.GetInt("ShowTimeTex" .. self.museumData.id, 0) >= 300) ) then
                --messageCreateSeconds 时间戳 （秒）  距上条显示时间 差5分钟 显示时间
                self.chatData[i].showTimeTex = true
                PlayerPrefsManager.SetInt("ShowTimeTex" .. self.museumData.id, self.chatData[i].messageCreateSeconds)
            end

            if self.chatData[i].isNewMsg or forceRefresh then
                self.chatData[i].isNewMsg = false
                self:fillItem_chatMsg(self:get_item(self.chatData[i], i, 5), topMsg)
                self:fillItem_chatMsg_mini(self:get_item(self.chatData[i], i, 7), topMsg)
            end

        end

        self:setMsgPanel()

        local setPosEnd = function()
            --Yield(0)
            --WaitForEndOfFrame()
            WaitForSeconds(0.3)
            if not self.isDestroy then
                self.miniChatMsgScrollRect.verticalNormalizedPosition = 0
            end
        end

        self:start_unity_coroutine(setPosEnd)

    end

end

local msgTypeStr = {"【文字消息】","【语音消息】","【表情消息】","【图片消息】","【战绩消息】"}
function ChessMuseumView3D:fillItem_chatMsg_mini(item, topMsg)
    local data = item.data
    local msgTex = GetComponentWithPath(item.gameObject, "msgTex", ComponentTypeName.Text)
    local isSelfSend = tostring(data.userId) == tostring(self.modelData.roleData.userId)
    local msgType =tonumber(data.msgType)  or 1
    if msgType == 1 then
        msgTypeStr[1] = data.content
    end


    if isSelfSend then
        msgTex.text = string.format("<color=#D04949FF>%s:</color> <color=#CCCCCCFF>%s</color>", Util.filterPlayerName(data.nickname, 8), Util.filterPlayerName(msgTypeStr[msgType],15))
    else
        msgTex.text = string.format("<color=#3CC345FF>%s:</color> <color=#CCCCCCFF>%s</color>", Util.filterPlayerName(data.nickname, 8), Util.filterPlayerName(msgTypeStr[msgType],15))
    end
end

---fillItem_boxList 亲友圈大厅包间列表
---@param item table
---@param index number
---@param dataListLength number 包间数据的长度
function ChessMuseumView3D:fillItem_boxList(item, index, dataListLength)
    local data = item.data

    if not item._inited then
        item.toggle = ModuleCache.ComponentManager.GetComponent(item.gameObject, ComponentTypeName.Toggle)
        item.toggle.onValueChanged:RemoveAllListeners()
        item.toggle.onValueChanged:AddListener(function(isCheck)
            if isCheck and self.changeBox then
                self.changeBox(item.data.idx)
            end
        end)

        item.rect = ModuleCache.ComponentManager.GetComponent(item.gameObject, ComponentTypeName.RectTransform)
        item.rectSizeDeltaY = item.rect.sizeDelta.y
        item.wanfaText = GetComponentWithPath(item.gameObject, "wanfa/Text", ComponentTypeName.Text)
        item.louCengText = GetComponentWithPath(item.gameObject, "wanfa/Text (1)", ComponentTypeName.Text)
        item.modifyNameBtn = GetComponentWithPath(item.gameObject, "boxNameInput/modifyNameButton", ComponentTypeName.Button)
        item.modifyNameBtn.gameObject:SetActive(self.museumData and (self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN"))

        item.modifyNameBtn.onClick:RemoveAllListeners()
        item.modifyNameBtn.onClick:AddListener(function()
            if item.boxNameInput.interactable == false then
                item.boxNameInput.interactable = true
                item.boxNameInput:ActivateInputField()
            end
        end);
        item.boxNameInput = GetComponentWithPath(item.gameObject, "boxNameInput", ComponentTypeName.InputField)
        item.boxNameInput.onEndEdit:RemoveAllListeners()
        item.boxNameInput.onEndEdit:AddListener(function(str)
            if self.updateBoxName then
                self.updateBoxName(data, item.boxNameInput)
            end

            local layout = function()
                WaitForEndOfFrame()
                if item.boxNameInput.interactable then
                    item.boxNameInput.interactable = false    --不能在回调中直接设置false，否则会报错
                end
            end
            self:start_unity_coroutine(layout)
        end)
        item.freeCreateBtn = GetComponentWithPath(item.gameObject, "FreeCreateBtn", ComponentTypeName.Transform).gameObject
        item.freeCreateTex = GetComponentWithPath(item.gameObject, "FreeCreateBtn/Text", ComponentTypeName.Text)
        item.scrollRectRoomScrollView =  GetComponentWithPath(item.gameObject, "roomScrollView", ComponentTypeName.ScrollRect)
        item.transformRoomScrollViewContent = GetComponentWithPath(item.gameObject, "roomScrollView/Viewport/Content", ComponentTypeName.Transform)
        item.gridLayoutGroupRoomScrollViewContent = GetComponentWithPath(item.gameObject, "roomScrollView/Viewport/Content", ComponentTypeName.GridLayoutGroup);
        item._inited = true
    end


    local viewType = 2
    if dataListLength == 1 then
        viewType = 1
        self.boxScrollView.enabled = false
    else
        self.boxScrollView.enabled = true
    end

    if viewType ~= item._viewType then
        item.scrollRectRoomScrollView.horizontal = not (viewType == 1)
        item.scrollRectRoomScrollView.vertical = viewType == 1

        --如果只有一个包间那么房间列表需要铺满
        --self.transformBoxScrollContentRect.rect.height 这个值在切来切去的时候是会变的，需要记录下来
        if viewType == 1 then
            item.rect.sizeDelta = Vector2.New(self._transformBoxScrollContentRectWidth, self._transformBoxScrollContentRectHeight)
            item.gridLayoutGroupRoomScrollViewContent.constraint = self.gridLayoutGrouproomScrollViewContentColumn.constraint
            item.gridLayoutGroupRoomScrollViewContent.constraintCount = 3
            --宽屏手机 3d桌面也显示不下四个
            if self.transformBoxScrollContentRect.rect.width > MaxGridLayoutGroupRoomScrollViewContentRowWidth then
                item.gridLayoutGroupRoomScrollViewContent.constraintCount = 4
                --item.gridLayoutGroupRoomScrollViewContent.spacing = Vector2.New(-58,10.7)
            end
            item.toggle.graphic.gameObject:SetActive(false)
        else
            item.rect.sizeDelta = Vector2.New(self._transformBoxScrollContentRectWidth, self._transformBoxItemHeight)
            item.gridLayoutGroupRoomScrollViewContent.constraint = self.gridLayoutGrouproomScrollViewContentRow.constraint
            item.gridLayoutGroupRoomScrollViewContent.constraintCount = 1
            item.toggle.graphic.gameObject:SetActive(true)
        end
    end
    item._viewType = viewType

    self.boxToggles[data.idx] = item.toggle
    self.copyParent[100 + data.idx] = item.transformRoomScrollViewContent

    if data then
        local _, wanfaName = Config.GetWanfaIdxByRule(data.playRule, data.gameId)
        data.wanfaName = tostring(wanfaName)
        item.louCengText.text = data.idx .. "楼 "
        item.wanfaText.text = data.wanfaName--#self.boxListData - data.idx + 1 .. "楼 " .. playMode.name
        if data.gameId == "" then

        end

        item.boxNameInput.interactable = false
        if data.boxName and data.boxName ~= "" then
            item.boxNameInput.text = data.boxName-- Util.filterPlayerName(data.boxName, 19)
        else
            item.boxNameInput.text = "尚未设置楼层名称"
        end
        item.toggle.isOn = PlayerPrefsManager.GetInt("SelectBoxIdx", 1) == data.idx

        item.freeCreateBtn:SetActive(data.freeRoom)
        if not self.museumData.openRoomType or self.museumData.openRoomType == 1 then
            item.freeCreateTex.text = "自由开房"
        else
            item.freeCreateTex.text = "新开一桌"
        end

    end
end

function ChessMuseumView3D:fillItem_chatMsg(item, topMsg)
    --msgType	1 文字	2 语音	3 表情   4 图片
    local data = item.data

    local stateSwitcher = ModuleCache.ComponentManager.GetComponent(item.gameObject, "UIStateSwitcher")
    local msgSpriteHolderImg = GetComponentWithPath(item.gameObject, "msgTex", ComponentTypeName.Image)
    if not msgSpriteHolderImg then
        return
    end
    local msgTex_zj = GetComponentWithPath(item.gameObject, "msgTex_zj", ComponentTypeName.Transform)

    local msgSpriteHolder = ModuleCache.ComponentManager.GetComponent(msgSpriteHolderImg.gameObject, "SpriteHolder")
    local imageHead = GetComponentWithPath(item.gameObject, "player/Mask/Head", ComponentTypeName.Image)
    local msgTex = GetComponentWithPath(msgSpriteHolderImg.gameObject, "Text", ComponentTypeName.Text)
    local voicePop = GetComponentWithPath(msgSpriteHolderImg.gameObject, "voicePop", ComponentTypeName.Text)
    local timeTex = GetComponentWithPath(item.gameObject, "time", ComponentTypeName.Text)
    local nickTex = GetComponentWithPath(item.gameObject, "player/nick", ComponentTypeName.Text)

    local faceItemImg = GetComponentWithPath(item.gameObject, "FaceItem", ComponentTypeName.Image)
    item.textureMsg = GetComponentWithPath(item.gameObject, "Image_msg", ComponentTypeName.RawImage)
    item.textureMsgTran = ModuleCache.ComponentManager.GetComponent(item.textureMsg.gameObject, ComponentTypeName.RectTransform)
    item.texture_download = GetComponentWithPath(item.textureMsg.gameObject, "ImageDelay", ComponentTypeName.Transform).gameObject

    local msgContenSF = ModuleCache.ComponentManager.GetComponent(msgSpriteHolderImg.gameObject, ComponentTypeName.ContentSizeFitter)
    msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize

    local msgRectTran = GetComponentWithPath(item.gameObject, "msgTex", ComponentTypeName.RectTransform)
    if data and tonumber(data.msgType) == 1 and not msgRectTran.gameObject.activeSelf then
        msgRectTran = GetComponentWithPath(item.gameObject, "msgTex_zj", ComponentTypeName.RectTransform)
    end

    if not data then
        msgTex.text = "该对话已过期！"
        return
    end

    data.isSelfSend = tostring(data.userId) == tostring(self.modelData.roleData.userId) -- math.random()< 0.5--

    local voicePop_self = GetComponentWithPath(item.gameObject, "msgTex/voicePop/self", ComponentTypeName.Transform).gameObject
    local voicePop_other = GetComponentWithPath(item.gameObject, "msgTex/voicePop/other", ComponentTypeName.Transform).gameObject

    voicePop_self:SetActive(data.isSelfSend)
    voicePop_other:SetActive(not data.isSelfSend)

    local voiceLeng = nil
    if data.isSelfSend then
        voiceLeng = GetComponentWithPath(item.gameObject, "msgTex/voicePop/self/voiceLength_self", ComponentTypeName.Text)
    else
        voiceLeng = GetComponentWithPath(item.gameObject, "msgTex/voicePop/other/voiceLength_other", ComponentTypeName.Text)
    end
    --if data.isRedName then
    --    nickTex.text = string.format("<color=red>%s</color>", data.nickname)
    --else
        nickTex.text = data.nickname
    --end

    local voiceReadState = GetComponentWithPath(voiceLeng.gameObject, "Image", ComponentTypeName.Transform).gameObject
    local msgTexRectTran = GetComponentWithPath(item.gameObject, "msgTex", ComponentTypeName.RectTransform)

    data.id = data.id or data.userId .. os.date("%Y-%m-%d %H:%M:%S")    --消息id
    voiceReadState:SetActive(PlayerPrefsManager.GetInt(data.id, 0) == 0 and not data.isSelfSend)

    timeTex.gameObject:SetActive(data.showTimeTex == true)
    if data.showTimeTex then
        timeTex.text = os.date("%Y-%m-%d %H:%M:%S", data.messageCreateSeconds)
    end

    data.msgType = data.msgType or 1
    msgTex.gameObject:SetActive(tonumber(data.msgType) == 1)
    voicePop.gameObject:SetActive(tonumber(data.msgType) == 2)

    voiceLeng.text = (data.voiceLength or 0) .. "\""
    if data.voiceLength then
        voicePop.text = string.rep(" ", math.min(5 + data.voiceLength, 25))
    end

    if data.isSelfSend then
        msgSpriteHolderImg.sprite = msgSpriteHolder:FindSpriteByName("self")
        msgTexRectTran.pivot = Vector2.New(1, 1)
        item.textureMsgTran.pivot = Vector2.New(1, 1)

        stateSwitcher:SwitchState("self")
        --msgRectTran.anchoredPosition = Vector2.New(240, msgRectTran.anchoredPosition.y)
    else
        msgSpriteHolderImg.sprite = msgSpriteHolder:FindSpriteByName("other")
        msgTexRectTran.pivot = Vector2.New(0, 1)
        item.textureMsgTran.pivot = Vector2.New(0, 1)

        stateSwitcher:SwitchState("other")
        --msgRectTran.anchoredPosition = Vector2.New(-237.2, msgRectTran.anchoredPosition.y)
    end

    msgSpriteHolderImg.gameObject:SetActive(tonumber(data.msgType) < 3)
    faceItemImg.gameObject:SetActive(tonumber(data.msgType) == 3)
    if tonumber(data.msgType) == 3 then
        --faceItemImg.sprite = faceItemSpriteHolder:FindSpriteByName(tonumber(data.content)-1)
        for i = 1, 20 do
            local goEmoji = GetComponentWithPath(faceItemImg.gameObject, "" .. (i - 1), ComponentTypeName.Transform).gameObject
            if (goEmoji) then
                ModuleCache.ComponentUtil.SafeSetActive(goEmoji, i == tonumber(data.content))
            end
        end
    end

    local roleData = {}
    roleData.userId = data.userId
    roleData.nickname = data.nickname
    roleData.gender = data.gender
    roleData.headImg = data.headImg

    self:get_general_data(data.userId, function (userdata)
        imageHead.sprite = userdata.headSprite
    end)

    local timeArr = nil

    local t1, t2 = string.find(data.content, "查看详情：")
    if t1 and t1 == 1 then
        -- 战绩的查看查看详情 移动 顶部
        timeArr = string.split(data.content, "圈号")
        if #timeArr < 2 then
            timeArr = string.split(data.content, "房号")

            msgTex.text = "房号" .. timeArr[2]
        else
            msgTex.text = "圈号" .. timeArr[2]
        end


    else
        -- 兼容老版本 的战绩   查看详情 在 底部
        timeArr = string.split(data.content, "\n查看详情：")
        if #timeArr < 2 then
            timeArr = string.split(data.content, "查看详情：")
        end

        msgTex.text = timeArr[1]-- data.content
    end

    msgTex_zj.gameObject:SetActive(false)
    ----战绩消息
    if #timeArr == 2 then
        local arr = string.split(msgTex.text, "【")
        if #arr >= 3 then
            data.msgType = 5 --战绩消息
            GetComponentWithPath(item.gameObject, "msgTex", ComponentTypeName.Image).gameObject:SetActive(false)

            msgSpriteHolderImg = GetComponentWithPath(item.gameObject, "msgTex_zj", ComponentTypeName.Image)
            msgTexRectTran = GetComponentWithPath(item.gameObject, "msgTex_zj", ComponentTypeName.RectTransform)

            local texTop = GetComponentWithPath(item.gameObject, "msgTex_zj/Text", ComponentTypeName.Text)
            local texLeft = GetComponentWithPath(item.gameObject, "msgTex_zj/Text/Text_name", ComponentTypeName.Text)
            local texRight = GetComponentWithPath(item.gameObject, "msgTex_zj/Text/Text_score", ComponentTypeName.Text)

            msgTex_zj.gameObject:SetActive(true)

            if data.isSelfSend then
                msgSpriteHolderImg.sprite = msgSpriteHolder:FindSpriteByName("self")
                msgTexRectTran.pivot = Vector2.New(1, 1)
            else
                msgSpriteHolderImg.sprite = msgSpriteHolder:FindSpriteByName("other")
                msgTexRectTran.pivot = Vector2.New(0, 1)
            end

            local leftStr = ""
            local rightStr = ""
            for i = 2, #arr do
                local temp = string.split(arr[i], "】")
                local tempS = ""
                if temp[2] and temp[2] ~= "" then
                    tempS = string.match(temp[2], "%s*(.-)%s*$")
                end
                if i < #arr then

                    if not tonumber(tempS) then
                        leftStr = leftStr .. "【" .. string.match(temp[1], "%s*(.-)%s*$") .. "】" .. "\n -----------\n"
                        rightStr = rightStr .. tempS .. "\n-------\n"
                    elseif (tonumber(tempS) and i == 2) then
                        leftStr = leftStr .. " -----------\n【" .. string.match(temp[1], "%s*(.-)%s*$") .. "】" .. "\n"
                        rightStr = rightStr .. "-------\n" .. tempS .. "\n"
                    else
                        leftStr = leftStr .. "【" .. string.match(temp[1], "%s*(.-)%s*$") .. "】" .. "\n"
                        rightStr = rightStr .. tempS .. "\n"
                    end


                else
                    leftStr = leftStr .. "【" .. string.match(temp[1], "%s*(.-)%s*$") .. "】"
                    rightStr = rightStr .. tempS
                end


            end

            --从ios贴出来的换行符变成了空格   亲友圈75450 房号513982 结束时间：05/29 16:29 【答你所愿1】 -6 【Y】 -4 【Y】 10 查看详情：http:// bt.sincebest.com/es/c43c508086958e2c
            local topArr = string.split(arr[1], "结束时间：")
            if #topArr == 2 then
                texTop.text = string.match(topArr[1], "%s*(.-)%s*$") .. "\n" .. "结束时间：" .. topArr[2]
            end

            local topArr2 = string.split(texTop.text, "房号")
            if #topArr2 == 2 then
                texTop.text = "房号" .. topArr2[2]
            end

            local temp = string.split(texTop.text, "\n开始时间：")
            if #temp < 2 then
                temp = string.split(texTop.text, "开始时间：")
            end
            if #temp == 2 then
                local temp2 = string.split(texTop.text, "\n结束时间：")-- 从ios贴出来的换行符变成了空格
                if #temp2 < 2 then
                    temp2 = string.split(texTop.text, "结束时间：")
                end
                texTop.text = temp[1] .. "\n结束时间：" .. temp2[2]
            end

            texLeft.text = leftStr
            texRight.text = rightStr
        end
    end

    item.textureMsg.gameObject:SetActive(tonumber(data.msgType) == 4)
    if tonumber(data.msgType) == 4 then
        item.texture_download:SetActive(true)
        item.textureMsg.texture = nil
        local arr = string.split(data.content, "_")
        if #arr > 2 then
            data.w = tonumber(arr[2])
            data.h = tonumber(arr[3])
            if data.w > data.h then
                item.textureMsgTran.sizeDelta = Vector2.New(math.min(data.w, 175), math.min(data.h, 100))
            else
                item.textureMsgTran.sizeDelta = Vector2.New(math.min(data.w, 80), math.min(data.h, 150))
            end
            data.resetImgSize = true
        end

        CustomImageManager.download_image_file(data.content, Application.persistentDataPath .. "/" .. data.content .. ".jpg", function(imagePath)
            -- 读取显示照片
            if self.isDestroy then
                return
            end

            item.texture_download:SetActive(false)
            print(data.resetImgSize, "@@@@@@@@@@@@@@@收到照片消息", imagePath)

            local _texture = ModuleCache.TextureCacheManager._get_local_chat_texture(imagePath)
            if not data.resetImgSize then

                local v2 = ModuleCache.TextureCacheManager.GetTexture2dSize(_texture)
                data.w = v2.x
                data.h = v2.y
                if v2.x > v2.y then
                    item.textureMsgTran.sizeDelta = Vector2.New(math.min(v2.x, 175), math.min(v2.y, 100))
                else
                    item.textureMsgTran.sizeDelta = Vector2.New(math.min(v2.x, 80), math.min(v2.y, 150))
                end
            end

            item.textureMsg.texture = _texture

        end)
    end

    --local msgContenSF = ModuleCache.ComponentManager.GetComponent(msgRectTran.gameObject, ComponentTypeName.ContentSizeFitter)
    --msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
    --print(msgTex.preferredWidth,"~~1~~~msgTex.text:",msgTex.text)
    --msgContenSF:SetLayoutHorizontal()--强制计算一下msgRectTran.sizeDelta
    if tonumber(data.msgType) ~= 2 then
        if msgTex.preferredWidth < 313 then
            msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
        else
            msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.Unconstrained
            msgRectTran.sizeDelta = Vector2.New(400, msgRectTran.sizeDelta.y)
        end
    else
        msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
    end

end

-- 包间的房间列表
function ChessMuseumView3D:fillItem_roomList(item)
    local data = item.data

    local ju = "局"
    --快速组局服务器已经不会再发规则字段
    local playRuleString = data.playRule
    if data.playRule and type(data.playRule) == "userdata" then
        playRuleString = data.boxData.playRule
    end

    local startNow = false
    if playRuleString ~= "" then
        local rule = ModuleCache.Json.decode(playRuleString)
        if rule.roundCount and rule.roundCount >= 100 then
            ju = "胡"
        end

        startNow = rule.StartNow or false
    end

    if not item._inited then
        item.stateSwitcher = ModuleCache.ComponentManager.GetComponent(item.gameObject, "UIStateSwitcher")
        item.tableSprHolder = ModuleCache.ComponentManager.GetComponent(item.gameObject,"SpriteHolder")
        item.tableImg = GetComponentWithPath(item.gameObject, "tableImg", ComponentTypeName.Image)

        item.readyTex = GetComponentWithPath(item.gameObject, "Text1", ComponentTypeName.Text)
        item.startTex = GetComponentWithPath(item.gameObject, "Text2", ComponentTypeName.Text)

        item.inRoomIcon = GetComponentWithPath(item.gameObject, "inRoomIcon", ComponentTypeName.Transform).gameObject
        item.outRoomIcon = GetComponentWithPath(item.gameObject, "outRoomIcon", ComponentTypeName.Transform).gameObject

        item.headImgs = {}
        item.PlayerObjs = {}
        item.nickTexs = {}
        for i = 1, 6 do
            item.PlayerObjs[i] = GetComponentWithPath(item.gameObject, "players/player (" .. i .. ")", ComponentTypeName.Transform).gameObject
            item.headImgs[i] = GetComponentWithPath(item.gameObject, "players/player (" .. i .. ")/HeadBG/Head (1)", ComponentTypeName.Image)
            item.nickTexs[i] = GetComponentWithPath(item.gameObject, "players/player (" .. i .. ")/nick/Text", ComponentTypeName.Text)

            item.PlayerObjs[i]:SetActive(false)
        end
        item._inited = true
    end

    --牌桌返回后在房间上显示图标-------------------

    if TableManager:try_get_cur_runing_table_module() then
        local roomData =TableManager:try_cur_runing_table_data()
        if tostring(roomData.BoxID) == tostring(data.boxData.boxId) and tostring(roomData.RoomID) == tostring(data.roomId) then
            item.inRoomIcon:SetActive(true)
            item.outRoomIcon:SetActive(true)
        else
            item.inRoomIcon:SetActive(false)
            item.outRoomIcon:SetActive(false)
        end
    else
        item.inRoomIcon:SetActive(false)
        item.outRoomIcon:SetActive(false)
    end
    --------------------------------------------

    for i = 1, 6 do
        if item.headImgs[i] then
            item.headImgs[i].sprite = self.defaultHeadSpr
        end
    end

    if item.readyTex then
        --好奇怪这里不可能会为空  怎么会报错 然道是item.gameObject为nil?
        item.readyTex.gameObject:SetActive(not data.curRound or data.curRound == 0)
    end

    item.startTex.gameObject:SetActive(true)
    if data.curRound and data.curRound > 0 then
        item.startTex.text = data.curRound .. "/" .. data.roundCount
    else
        local package = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
        if package == "sstx" then -- 宿松同心 没有局数 （1000分）
            --if (data.roomType == 1) then
            --    item.readyTex.text = "自由开房"
            --else
            --    item.readyTex.text = "快速组局"
            --end
            item.startTex.gameObject:SetActive(false)
        else
            --if (data.roomType == 1) then
            --    item.readyTex.text = "自由开房(" .. data.roundCount .. ju .. ")"
            --else
            --    item.readyTex.text = "快速组局(" .. data.roundCount .. ju .. ")"
            --end
            item.startTex.text = data.roundCount .. ju
        end
    end

    --local package = ModuleCache.PlayModeUtil.getInfoByGameId(data.boxData.gameId).package
    --if package == "" then
    --四人桌还是六人桌 的玩家头像位置
    if data.boxData.playerCount > 4 then
        item.stateSwitcher:SwitchState("max6")
    else
        item.stateSwitcher:SwitchState("max4")
    end

    for i = 1, #data.players do
        item.PlayerObjs[i]:SetActive(true)
        item.nickTexs[i].text =  data.players[i].playerName
        self:image_load_sprite(item.headImgs[i], data.players[i].headImg,nil,nil,
        self.museumData.preventionCheat == 1 and self.museumData.playerRole ~= "OWNER" and self.museumData.playerRole ~= "ADMIN",self.defaultHeadSpr_notCheck)
    end

    local style = "mj"
    if AppData.isPokerGameByGameId(data.boxData.gameId)   or AppData.isZiPaiGame(data.boxData.gameId) or AppData.isHuaPaiGame(data.boxData.gameId) then
        style = "pk"
    end

    --显示桌子样式
    if startNow and data.curRound > 0 then
        item.tableImg.sprite = item.tableSprHolder:FindSpriteByName(#data.players ..style)
    else
        item.tableImg.sprite = item.tableSprHolder:FindSpriteByName(data.playerCount ..style)
    end

end

function ChessMuseumView3D:museumPanelMove()
    self.museumListShow = not self.museumListShow
    if  self.museumListShow then
        PlayerPrefsManager.SetInt("museumListOpenState", 1)  -- 1 展开  0 收回
    else
        PlayerPrefsManager.SetInt("museumListOpenState", 0)
    end

    ModuleCache.GameManager.set_application_target_frame_rate(60)

    if  self.museumListShow then
        --self.museumListPanel.transform.localPosition = Vector3.New(self.anchor.left.localPosition.x +593.8, -1062.4, 0)
        self.museumListShouHuiIcon1:SetActive(not self.museumListShow)
        self.museumListShouHuiIcon2:SetActive(  self.museumListShow)
        self:do_positionX(self.museumListPanel.transform, nil, self.anchor.left.localPosition.x +self.museumListShowPosX,function()

        end )--*0.384)

    else
        self:do_positionX(self.museumListPanel.transform, nil,self.anchor.left.localPosition.x-3.3, function()
            self.museumListShouHuiIcon1:SetActive(not self.museumListShow)
            self.museumListShouHuiIcon2:SetActive(  self.museumListShow)
        end)
    end
    self:subscibe_time_event_on(1, function (t)
        ModuleCache.GameManager.set_application_target_frame_rate(30)
    end)
end

return ChessMuseumView3D