
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class ChessMuseumView : View
local ChessMuseumView = Class('chessMuseumView', View)

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
local MaxGridLayoutGroupRoomScrollViewContentRowWidth = 1220

function ChessMuseumView:initialize(...)
    -- 初始View
    View.initialize(self, ...)
    View.set_1080p(self)

    self:on_initialize_ui()
end

function ChessMuseumView:on_initialize_ui()
    self.AccNumTex = GetComponentWithPath(self.root, "Top/Child/AccBtn/Text", ComponentTypeName.Text)

    self.buttonSetting = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonSetting", ComponentTypeName.Button)
    self.buttonInfo = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonInfo", ComponentTypeName.Button)

    self.membersNewMsgObj = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonPlayer/NewMsg", ComponentTypeName.Transform).gameObject
    self.membersNewMsgTex = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonPlayer/NewMsg/Text", ComponentTypeName.Text)
    --self.activeNewMsgObj = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonActive/huodong_01/Canvas/dian", ComponentTypeName.Transform).gameObject
    self.fellowshipNewMsgObj = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonFellowShip/SpriteRed", ComponentTypeName.Transform).gameObject

    self.textChessName = GetComponentWithPath(self.root, "TopRight/Child/TopBar/chessName", ComponentTypeName.Text)
    self.museumNum = GetComponentWithPath(self.root, "TopRight/Child/TopBar/museumNum", ComponentTypeName.Text)
    self.museumImg = GetComponentWithPath(self.root, "TopRight/Child/TopBar/museumImg/Avatar/Image", ComponentTypeName.Image)

    self.addCompartmentBtn = GetComponentWithPath(self.root, "TopRight/Child/other/addCompartmentBtn", ComponentTypeName.Transform).gameObject

    self.compartmentWanfaNameTex = GetComponentWithPath(self.root, "TopRight/Child/other/changeCompartmentBtn/Text", ComponentTypeName.Text)
    self.changeBoxUpBtn = GetComponentWithPath(self.root, "TopRight/Child/other/changeCompartmentBtn/changeCompartmentBtn_up", ComponentTypeName.Button)
    self.changeBoxDownBtn = GetComponentWithPath(self.root, "TopRight/Child/other/changeCompartmentBtn/changeCompartmentBtn_down", ComponentTypeName.Button)

    self.copyItem = {}   --type 1 ：亲友圈列表    2 ：包间     3:包间房间列表      4:置顶消息      5：聊天消息  6：包间详情
    self.copyItem[1] = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/museumItem", ComponentTypeName.Transform).gameObject
    self.copyItem[2] = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/boxItem", ComponentTypeName.Transform).gameObject
    self._transformBoxItemHeight = self.copyItem[2].transform.rect.height



    self.copyItem[3] = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/CopyItem", ComponentTypeName.Transform).gameObject
    --self.copyItem[4] = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/Msg", ComponentTypeName.Transform).gameObject
    self.copyItem[5] = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/Msg", ComponentTypeName.Transform).gameObject
    --包间详情item
    self.copyItem[6] = GetComponentWithPath(self.root, "Right/Child/ChangeboxPanel/animObj/ItemPrefabHolder/CopyItem", ComponentTypeName.Transform).gameObject

    self.copyParent = {}    --type 1 ：亲友圈列表    2 ：包间     3:包间房间列表       4:置顶消息      5：聊天消息
    self.copyParent[1] = GetComponentWithPath(self.root, "TopRight/Child/museumListPanel/ListScrollView_museumList/Viewport/Content", ComponentTypeName.RectTransform)
    self.copyParent[2] = GetComponentWithPath(self.root, "TopRight/Child/boxScrollView/Viewport/Content", ComponentTypeName.RectTransform)
    self.copyParent[3] = nil--GetComponentWithPath(self.root, "TopRight/Child/ListScrollView/Viewport/Content_extend", ComponentTypeName.RectTransform)
    --self.copyParent[4] = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ListScrollView_topMsg/Viewport/Content", ComponentTypeName.RectTransform)
    self.copyParent[5] = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ListScrollView_chatMsg/Viewport/Content", ComponentTypeName.RectTransform)
    --包间详情parent
    self.copyParent[6] = GetComponentWithPath(self.root, "Right/Child/ChangeboxPanel/animObj/ListScrollView/Viewport/Content", ComponentTypeName.Transform)
    self.addboxBtnObj = GetComponentWithPath(self.root, "Right/Child/ChangeboxPanel/animObj/ListScrollView/Viewport/Content/CreateboxBtn", ComponentTypeName.Transform)

    self.defaultHeadSpr = GetComponentWithPath(self.root, "Center/Child/defaultlHead", ComponentTypeName.Image).sprite
    self.defaultHeadSpr_extend = GetComponentWithPath(self.root, "Center/Child/defaultlHead (1)", ComponentTypeName.Image).sprite
    self.defaultHeadSpr_notCheck = GetComponentWithPath(self.root, "Center/Child/defaultlHead (2)", ComponentTypeName.Image).sprite

    self.contents = {}

    self.roomList_scrollRect = GetComponentWithPath(self.root, "TopRight/Child/ListScrollView", ComponentTypeName.ScrollRect)
    self.roomList_rectTransform = GetComponentWithPath(self.root, "TopRight/Child/ListScrollView", ComponentTypeName.RectTransform)
    self.roomList_gridLayoutGroup = GetComponentWithPath(self.root, "TopRight/Child/ListScrollView/Viewport/Content", ComponentTypeName.GridLayoutGroup)

    self.chatMsg_scr = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ListScrollView_chatMsg", ComponentTypeName.RectTransform)
    self.chatMsgScrollRect = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ListScrollView_chatMsg", ComponentTypeName.ScrollRect)
    self.chatMsgCsf = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ListScrollView_chatMsg/Viewport/Content", ComponentTypeName.ContentSizeFitter)
    self.chatMsgVlg = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ListScrollView_chatMsg/Viewport/Content", ComponentTypeName.VerticalLayoutGroup)


    self.input = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ChatBar/InputField", ComponentTypeName.InputField)
    self.chatBarStateSwither = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ChatBar", "UIStateSwitcher")
    self.changeVoiceToggle = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ChatBar/changeVoice", ComponentTypeName.Toggle)
    self.emoticonToggle = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel/ChatBar/emoticonBtn", ComponentTypeName.Toggle)

    self.facePanel = GetComponentWithPath(self.root, "Bottom/Child/PanelFace", ComponentTypeName.Transform).gameObject

    self.originalImgObj = GetComponentWithPath(self.root, "Bottom/OriginalImg", ComponentTypeName.Transform).gameObject
    self.originalImg = GetComponentWithPath(self.root, "Bottom/OriginalImg/RawImage", ComponentTypeName.RawImage)
    self.originalImgRectTran = GetComponentWithPath(self.root, "Bottom/OriginalImg/RawImage", ComponentTypeName.RectTransform)

    self.adjustVule = 0--self.rootRectTran.sizeDelta.x - 1920

    self.ChangeboxPanel = GetComponentWithPath(self.root, "Right/Child/ChangeboxPanel", ComponentTypeName.Transform).gameObject

    self.boxScrollView = GetComponentWithPath(self.root, "TopRight/Child/boxScrollView", ComponentTypeName.ScrollRect)

    self.anchor = {}
    self.anchor.left = GetComponentWithPath(self.root, "Anchor/Left", ComponentTypeName.Transform)
    self.anchor.right = GetComponentWithPath(self.root, "Anchor/Right", ComponentTypeName.Transform)
    self.anchor.top = GetComponentWithPath(self.root, "Anchor/Top", ComponentTypeName.Transform)
    self.anchor.bottom = GetComponentWithPath(self.root, "Anchor/Bottom", ComponentTypeName.Transform)

    self.boxPanelCanvas = GetComponentWithPath(self.root, "Right/Child/hideboxPanelBtn", "UnityEngine.CanvasGroup");
    self.scrollRectBoxScrollContentRect = GetComponentWithPath(self.root, "TopRight/Child/boxScrollView", ComponentTypeName.ScrollRect);
    self.gridLayoutGrouproomScrollViewContentColumn = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/roomScrollViewContentGLG_Column", ComponentTypeName.GridLayoutGroup);
    self.gridLayoutGrouproomScrollViewContentRow = GetComponentWithPath(self.root, "TopRight/Child/ItemPrefabHolder/roomScrollViewContentGLG_Row", ComponentTypeName.GridLayoutGroup);

    self. transformBoxScrollContentRect = GetComponentWithPath(self.root, "TopRight/Child/boxScrollView/Viewport/Content", ComponentTypeName.Transform);
    self._transformBoxScrollContentRectHeight = self.transformBoxScrollContentRect.rect.height
    self._transformBoxScrollContentRectWidth = self.transformBoxScrollContentRect.rect.width

    self.museumListPanel = GetComponentWithPath(self.root, "TopRight/Child/museumListPanel", ComponentTypeName.Transform).gameObject
    self.museumListShouHuiIcon1 = GetComponentWithPath(self.root, "TopRight/Child/showMuseumListBtn", ComponentTypeName.Transform).gameObject
    self.museumListShouHuiIcon2 = GetComponentWithPath(self.root, "TopRight/Child/museumListPanel/bg/on_offBtn/icon (1)", ComponentTypeName.Transform).gameObject


    self.statisticsButton = GetComponentWithPath(self.root, "TopRight/Child/other/StatisticsButton", ComponentTypeName.Transform).gameObject

    self.dontClickObj =  GetComponentWithPath(self.root, "Right/dontClick", ComponentTypeName.Transform).gameObject

    self.noDataHideObjs = {}
    self.noDataHideObjs[1] = GetComponentWithPath(self.root, "BottomRight", ComponentTypeName.Transform).gameObject
    self.noDataHideObjs[2] = GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform).gameObject
    self.noDataHideObjs[3] = GetComponentWithPath(self.root, "Bottom", ComponentTypeName.Transform).gameObject
    self.noDataHideObjs[4] = GetComponentWithPath(self.root, "Right", ComponentTypeName.Transform).gameObject
    self.noDataHideObjs[5] = GetComponentWithPath(self.root, "TopRight/Child/TopBar", ComponentTypeName.Transform).gameObject
    self.noDataHideObjs[6] = GetComponentWithPath(self.root, "TopRight/Child/MsgPanel", ComponentTypeName.Transform).gameObject
    self.noDataHideObjs[7] = GetComponentWithPath(self.root, "TopRight/Child/boxScrollView", ComponentTypeName.Transform).gameObject
    self.noDataHideObjs[8] = GetComponentWithPath(self.root, "TopRight/Child/other", ComponentTypeName.Transform).gameObject

    self.noDataShowObj = GetComponentWithPath(self.root, "Center/DontMuseumObj", ComponentTypeName.Transform).gameObject

    self.returnRoomObj = GetComponentWithPath(self.root, "TopRight/Child/other/returnRooomBtn", ComponentTypeName.Transform).gameObject
    self.museumListGuide = GetComponentWithPath(self.root, "TopRight/Child/OpenMuseumListGuide", ComponentTypeName.Transform).gameObject

    self.fellowShipObj = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonFellowShip", ComponentTypeName.Transform).gameObject
    self.fellowShipImg = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonFellowShip/Image", ComponentTypeName.Transform).gameObject
    self.fellowShipImg2 = GetComponentWithPath(self.root, "TopRight/Child/TopBar/Group/ButtonFellowShip/Image (1)", ComponentTypeName.Transform).gameObject

    self:fixed_tran_size(GetComponentWithPath(self.root, "TopRight", ComponentTypeName.Transform),0.94)
    self:fixed_tran_size(GetComponentWithPath(self.root, "Top", ComponentTypeName.Transform),0.94)
    self:fixed_tran_size(GetComponentWithPath(self.root, "Right/Child/ChangeboxPanel", ComponentTypeName.Transform),0.94)
    self:fixed_tran_size(GetComponentWithPath(self.root, "Bottom", ComponentTypeName.Transform),0.94)
end

function ChessMuseumView:setNoDataState(isShow)
    self.noDataShowObj:SetActive(not isShow)
    if not isShow then
        self.museumListGuide:SetActive(false)
    end

    for i = 1, #self.noDataHideObjs do
        self.noDataHideObjs[i]:SetActive(isShow)
    end

    if isShow then
        local style = PlayerPrefsManager.GetInt("MuseumUs3D",-1) --  -1 玩家没有设置样式 ， 1 2d ， 2 3d
        if style == -1 then
            style = require("package.public.model.model_data").roleData.parlorStyleType
        end

        self.noDataHideObjs[6]:SetActive(PlayerPrefsManager.GetInt("museumChatState", 1) == 1 or style == 1 )
    end
end

function ChessMuseumView:setMsgPanel()
    local setMsgPos = function()
        --Yield(0)
        --WaitForSeconds(0.05)
        WaitForEndOfFrame()

        self.contents_chatMsg = TableUtil.get_all_child(self.copyParent[5].gameObject)
        for i = 1, #self.contents_chatMsg do
            if self.contents_chatMsg[i].gameObject.activeSelf then
                local array = string.split(self.contents_chatMsg[i].gameObject.name, "_")
                local idx = tonumber(array[2])
                local showTimeTexHeight = 82

                local curData = self:get_chat_msg_data(idx)
                local nextData = self:get_chat_msg_data(idx + 1)
                if curData and tonumber(curData.msgType) == 2 and nextData and nextData.showTimeTex and tonumber(nextData.msgType) == 2 then
                    showTimeTexHeight = showTimeTexHeight + 30
                end

                if nextData and nextData.showTimeTex then
                    showTimeTexHeight = showTimeTexHeight + 50
                end

                if  curData and tonumber(curData.msgType) == 5 then --战绩消息
                    showTimeTexHeight = showTimeTexHeight + 260
                end


                local msgRectTran = GetComponentWithPath(self.contents_chatMsg[i].gameObject, "msgTex", ComponentTypeName.RectTransform)
                if curData and tonumber(curData.msgType) == 1 and not msgRectTran.gameObject.activeSelf then
                    msgRectTran = GetComponentWithPath(self.contents_chatMsg[i].gameObject, "msgTex_zj", ComponentTypeName.RectTransform)
                end

                local itemRectTran = ModuleCache.ComponentManager.GetComponent(self.contents_chatMsg[i].gameObject, ComponentTypeName.RectTransform)
                --local msgContenSF = ModuleCache.ComponentManager.GetComponent(msgRectTran.gameObject, ComponentTypeName.ContentSizeFitter)
                --msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
                --
                --msgContenSF:SetLayoutHorizontal()--强制计算一下msgRectTran.sizeDelta
                if curData and tonumber(curData.msgType) == 4 then
                    if not curData.isSelfSend then
                        showTimeTexHeight = showTimeTexHeight + 20
                    end

                    if curData.w and curData.h then
                        if curData.w > curData.h then
                            showTimeTexHeight = showTimeTexHeight + 50
                        else
                            showTimeTexHeight = showTimeTexHeight + 100
                        end
                    end
                end


                local setPosEnd = function()
                    --Yield(0)
                    WaitForEndOfFrame()
                    if not self.isDestroy then
                        if itemRectTran and itemRectTran.sizeDelta then
                            itemRectTran.sizeDelta = Vector2.New(itemRectTran.sizeDelta.x, msgRectTran.sizeDelta.y + showTimeTexHeight)
                        end


                    end
                end

                self:start_unity_coroutine(setPosEnd)
            end
        end

        --WaitForSeconds(1)
        WaitForEndOfFrame()
        self.chatMsgVlg.enabled = false
        self.chatMsgVlg.enabled = true
        self.chatMsgCsf.enabled = false
        self.chatMsgCsf.enabled = true


        WaitForEndOfFrame()
        self.chatMsgScrollRect.verticalNormalizedPosition = 0
        print("=============消息拉到底部=============")
    end

    self:start_unity_coroutine(setMsgPos)
end


local chatUseSimulationData = false
local msgStr = " [{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"大师法务风娃娃儿发大水发文阿道夫俺的沙发啊阿斯蒂芬\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":false,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":false,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1},{\"imUser\":\"user_test_629_user\",\"nickname\":\"629\",\"voiceLength\":0,\"headImg\":\"http://sincebest-bull-test.oss-cn-hangzhou.aliyuncs.com/20180723_26acd87984464097a4e1ecd2d232f7ca.png\",\"isRedName\":true,\"platform\":\"Android\",\"isSelfSend\":true,\"isOnwer\":true,\"messageCreateSeconds\":1548727918,\"success\":\"true\",\"isNewMsg\":true,\"result\":\"0\",\"identifier\":\"com.sincebestgames.dahuqipaiyouxi\",\"idx\":1,\"id\":\"6292019-01-29 10:11:58\",\"desc\":\"\",\"content\":\"到付款啦\",\"gender\":2,\"groupId\":31065744,\"userId\":629,\"username\":\"\",\"showTimeTex\":true,\"msgType\":1}]"

--初始化聊天消息列表
function ChessMuseumView:initLoopScrollViewList_chatMsg(chatData, topMsg,forceRefresh)
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

    local panelIdx = 5
    self.chatMsgList = chatData

    if not chatData or (chatData and #chatData < 1)  or not self.museumData then
        self:reset(panelIdx)
        --self:setMsgPanel()
        --print("----------$$$$$$$$$$$$$$$$$$$$$$$----",panelIdx, topMsg)
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

    --self:reset(panelIdx)

    if (#self.chatData > 0) then
        for i = 1, #self.chatData do
            if self.museumData and ( i == 1 or (i % 20 == 0) or (self.chatData[i].messageCreateSeconds - PlayerPrefsManager.GetInt("ShowTimeTex" .. self.museumData.id, 0) >= 300) ) then
                --messageCreateSeconds 时间戳 （秒）  距上条显示时间 差5分钟 显示时间
                self.chatData[i].showTimeTex = true
                PlayerPrefsManager.SetInt("ShowTimeTex" .. self.museumData.id, self.chatData[i].messageCreateSeconds)
            end

            if self.chatData[i].isNewMsg or forceRefresh then
                self.chatData[i].isNewMsg = false
                self:fillItem_chatMsg(self:get_item(self.chatData[i], i, panelIdx), topMsg)
                print("~~~~~~~msg~~~~~~",i)
            end

        end

        self:setMsgPanel()
    end

end

    --初始化亲友圈列表
    function ChessMuseumView:initLoopScrollViewList(dataList, isSearch)
        self:reset(1)
        if not dataList then
            return
        end

        local tempList = {}
        for i=1,#dataList do
            if not dataList[i].isShowRecommend then
                table.insert(tempList,dataList[i])
            end
        end
        dataList = tempList

        self.toggles = {}
        self.dataList = dataList
        self.AccNumTex.transform.parent.gameObject:SetActive(#dataList ~= 0)
        if(#dataList > 0) then
            for i=1,#dataList do
                dataList[i].item = self:get_item(dataList[i], i,1)
                self:fillItem_museumList(dataList[i].item)
            end
        end

        self.input.text = ""
        self.chatBarStateSwither:SwitchState("words+")
    end

    --初始化房间列表
    function ChessMuseumView:initLoopScrollViewList_roomList(data, disposeRoomList)
        if TableManager:try_get_cur_runing_table_module() then
            self.returnRoomObj:SetActive(true)
        else
            self.returnRoomObj:SetActive(false)
        end

        if not self.copyParent[101] then
            return
        end

        local dataList = data.list

        self.roomListData = dataList

        if (#dataList > 0) then
            local temp = nil
            for i = 1, #dataList do
                self.copyParent[ 100 + i ]:GetComponent("RectTransform").anchoredPosition = Vector2.New(0, 0)

                self:reset(100 + i)
                temp = dataList[i]
                if disposeRoomList then
                    disposeRoomList(temp, temp.roomList)
                end

                table.sort(temp.roomList, function(a,b)
                    local r
                    if a.curRound >0  or b.curRound >0 then -- 有开局情况下 局数大的显示再后面
                        r = a.curRound < b.curRound
                    else
                        if a.roleFull == b.roleFull then
                            r = a.roomType > b.roomType
                        else
                            r = a.roleFull > b.roleFull
                        end
                    end

                    return r
                end)

                for j = 1, #temp.roomList do
                    -- 包厢数据
                    temp.roomList[j].boxData = temp
                    self:fillItem_roomList(self:get_item(temp.roomList[j], j, 3, 100 + i))
                end
            end
        end
    end

    --初始化包间列表
    function ChessMuseumView:initboxList(data)
        self:reset(2)
        self.boxToggles = {}
        self.updateBoxName = data.updateBoxName
        self.changeBox = data.changeBox
        data = data.data
        self.boxListData = data

        local dataLenght = #data
        if dataLenght < 1 then
            return
        end

        if (dataLenght > 0) then
            for i = 1, dataLenght do
                data[i].item = self:get_item(data[i], i, 2)
                self:fillItem_boxList(data[i].item, i, dataLenght)
                --self:fillItem_boxListInfo(self:get_item(data[i], i, 6))
            end
        end
        self.addboxBtnObj:SetAsLastSibling()
    end

    --初始话包间列表
    function ChessMuseumView:initboxListInfo(data)
        data = data or self.boxListData
        self:reset(6)
        self.addboxBtnObj.gameObject:SetActive(self.museumData and (self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN"))

        if (#data > 0) then
            for i = 1, #data do
                self:fillItem_boxListInfo(self:get_item(data[i], i, 6))
            end
        end
        self.addboxBtnObj:SetAsLastSibling()
    end

    --获取房间数据
    function ChessMuseumView:get_room_data(boxIdx, roomIdx)

        return self.roomListData[boxIdx].roomList[roomIdx]
    end


    --获取聊天消息数据
    function ChessMuseumView:get_chat_msg_data(idx)

        return self.chatMsgList[idx]
    end

    function ChessMuseumView:get_item(data, i, type, custType)
        --type 1 ：亲友圈列表    2 ：包间     3:包间房间列表      4:置顶消息      5：聊天消息  6：包间详情
        local obj = nil
        local item = {}
        custType = custType or type

        if (i <= #self.contents[custType] and self.contents[custType][i].name ~= "CreateboxBtn") then
            obj = self.contents[custType][i]
        else
            obj = TableUtil.clone(self.copyItem[type], self.copyParent[custType].gameObject, Vector3.zero)
        end
        obj.name = "item_" .. i
        ComponentUtil.SafeSetActive(obj, true)
        item.gameObject = obj
        data.idx = i
        item.data = data
        return item
    end

    function ChessMuseumView:reset(type)
        --type 1 ：亲友圈列表    2 ：包间     3:包间房间列表      4:置顶消息      5：聊天消息  6：包间详情 7:小聊天窗口
        --print_debug("reset:" .. type)
        if not self.copyParent[type] then
            return
        end

        self.contents[type] = TableUtil.get_all_child(self.copyParent[type].gameObject)
        for i = 1, #self.contents[type] do
            if self.contents[type][i] and self.contents[type][i].name ~= "CreateboxBtn" then
                ComponentUtil.SafeSetActive(self.contents[type][i], false)
            end
        end
    end

    function ChessMuseumView:fillItem_chatMsg(item, topMsg)
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

        data.isSelfSend = tostring(data.userId) == tostring(self.modelData.roleData.userId) -- math.random()< 0.5

        local voicePop_self = GetComponentWithPath(item.gameObject, "msgTex/voicePop/self", ComponentTypeName.Transform).gameObject
        local voicePop_other = GetComponentWithPath(item.gameObject, "msgTex/voicePop/other", ComponentTypeName.Transform).gameObject

        voicePop_self:SetActive(data.isSelfSend)
        voicePop_other:SetActive(not data.isSelfSend)

        local voiceLeng = nil
        if data.isSelfSend then
            voiceLeng = GetComponentWithPath(item.gameObject, "msgTex/voicePop/self/voiceLength_self", ComponentTypeName.Text)
        else
            voiceLeng = GetComponentWithPath(item.gameObject, "msgTex/voicePop/other/voiceLength_other", ComponentTypeName.Text)
            --if data.isRedName then
            --    nickTex.text = string.format("<color=red>%s</color>", data.nickname)
            --else
            nickTex.text = data.nickname
            --end
        end

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

        timeArr = string.split(msgTex.text, "———————")
        if #timeArr > 1 then-- 聊天过滤显示新春活动提示
            msgTex.text = timeArr[1]
        end

        msgTex_zj.gameObject:SetActive(false)
        ----战绩消息
        if #timeArr == 2 then
            local arr = string.split(msgTex.text, "【")
            if #arr >= 3 then
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
            if msgTex.preferredWidth < 330 then
                msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
            else
                msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.Unconstrained
                msgRectTran.sizeDelta = Vector2.New(417, msgRectTran.sizeDelta.y)
            end
        else
            msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
        end

    end

    function ChessMuseumView:fillItem_museumList(item, isEmpty)
        local itemObj = {}
        local data = item.data
        item.itemObj = itemObj

        local imageHead = GetComponentWithPath(item.gameObject, "museumImg/Avatar/Image", ComponentTypeName.Image)

        itemObj.tag = GetComponentWithPath(item.gameObject, "selectTag", ComponentTypeName.Transform).gameObject
        itemObj.textNum = GetComponentWithPath(item.gameObject, "Text", ComponentTypeName.Text)
        itemObj.textName = GetComponentWithPath(item.gameObject, "Text (1)", ComponentTypeName.Text)
        itemObj.textnickname = GetComponentWithPath(item.gameObject, "Text (2)", ComponentTypeName.Text)
        itemObj.toggle = ModuleCache.ComponentManager.GetComponent(item.gameObject, ComponentTypeName.Toggle)

        if(data) then
            table.insert(self.toggles, itemObj)
            if(data.parlorNum) then
                itemObj.textNum.text ="圈号:0".. data.parlorNum.. "("..data.playerNum.."人)"
            end

            if(data.parlorName) then
                itemObj.textName.text = "圈名:"..Util.filterPlayerName(data.parlorName, 12)
            end

            if(data.nickname) then
                itemObj.textnickname.text ="圈主:".. Util.filterPlayerName(data.nickname, 12)
            end

            if(data.parlorLogo) then
                data.imageHead = data.parlorLogo
            else
                data.imageHead = data.headImg
            end
            self:image_load_sprite(imageHead, data.imageHead)

            self:set_image_fill(imageHead,182)
        end
    end

    -- 包间的房间列表
    function ChessMuseumView:fillItem_roomList(item)
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
            item.readyTex = GetComponentWithPath(item.gameObject, "Text1", ComponentTypeName.Text)
            item.startTex = GetComponentWithPath(item.gameObject, "Text2", ComponentTypeName.Text)

            item.inRoomIcon = GetComponentWithPath(item.gameObject, "inRoomIcon", ComponentTypeName.Transform).gameObject
            item.outRoomIcon = GetComponentWithPath(item.gameObject, "outRoomIcon", ComponentTypeName.Transform).gameObject

            item.headImgs = {}
            for i = 1, 9 do
                item.headImgs[i] = GetComponentWithPath(item.gameObject, "players/player (" .. i .. ")/HeadBG/Head (1)", ComponentTypeName.Image)
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

        for i = 1, 9 do
            if item.headImgs[i] then
                item.headImgs[i].sprite = self.defaultHeadSpr
            end
        end

        if item.readyTex then
            --好奇怪这里不可能会为空  怎么会报错 然道是item.gameObject为nil?
            item.readyTex.gameObject:SetActive(not data.curRound or data.curRound == 0)
        end

        item.startTex.gameObject:SetActive(data.curRound and data.curRound > 0)
        if data.curRound and data.curRound > 0 then
            item.startTex.text = data.curRound .. "/" .. data.roundCount
        else
            local package = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
            if package == "sstx" then -- 宿松同心 没有局数 （1000分）
                if (data.roomType == 1) then
                    item.readyTex.text = "自由开房"
                else
                    item.readyTex.text = "快速组局"
                end
            else
                if (data.roomType == 1) then
                    item.readyTex.text = "自由开房(" .. data.roundCount .. ju .. ")"
                else
                    item.readyTex.text = "快速组局(" .. data.roundCount .. ju .. ")"
                end
            end
        end

        if startNow and data.curRound > 0 then
            item.stateSwitcher:SwitchState(tostring(#data.players))
        else
            item.stateSwitcher:SwitchState(tostring(data.playerCount))
        end



        for i = 1, #data.players do
            self:image_load_sprite(item.headImgs[i], data.players[i].headImg,nil,nil,
            self.museumData.preventionCheat == 1 and self.museumData.playerRole ~= "OWNER" and self.museumData.playerRole ~= "ADMIN",self.defaultHeadSpr_notCheck)
        end

    end

    function ChessMuseumView:boxPanelMove(view)
        ModuleCache.GameManager.set_application_target_frame_rate(60)
        if view then
            self.ChangeboxPanel.transform.localPosition = self.anchor.right.localPosition
            self.ChangeboxPanel:SetActive(true)
            self.boxPanelCanvas.gameObject:SetActive(true)
            self:do_positionX(self.ChangeboxPanel.transform, nil, 0)
            self:do_fade(self.boxPanelCanvas, nil, 0.75)
        else
            self:do_positionX(self.ChangeboxPanel.transform, nil, self.anchor.right.localPosition.x, function()
                self.ChangeboxPanel:SetActive(false)
                self.boxPanelCanvas.gameObject:SetActive(false)
            end)
            self:do_fade(self.boxPanelCanvas)
        end
        self:subscibe_time_event_on(1, function (t)
            ModuleCache.GameManager.set_application_target_frame_rate(30)
        end)
    end



    ---fillItem_boxList 亲友圈大厅包间列表
    ---@param item table
    ---@param index number
    ---@param dataListLength number 包间数据的长度
    function ChessMuseumView:fillItem_boxList(item, index, dataListLength)
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
                if self._transformBoxScrollContentRectWidth > MaxGridLayoutGroupRoomScrollViewContentRowWidth then
                    item.gridLayoutGroupRoomScrollViewContent.constraintCount = 4
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
            item.wanfaText.text =  data.idx .. "楼 " .. data.wanfaName--#self.boxListData - data.idx + 1 .. "楼 " .. playMode.name
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

    function ChessMuseumView:get_grid_layout_group_filed()
        tolua.loadassembly('UnityEngine.UI')
        local t = typeof('UnityEngine.UI.GridLayoutGroup.Constraint')
        print(t)
        local field = tolua.getfield(t, 'FixedColumnCount')
        self._constraint_FixedColumnCount = field:Get(nil)

        field = tolua.getfield(t, 'FixedRowCount')
        self._constraint_FixedRowCount = field:Get(nil)
    end

    --亲友圈大厅包间详情列表
    local payTypeStrs = { "亲友圈支付", "大赢家支付", "房费均摊" }
    local boxIdxTab = { "①", "②", "③", "④", "⑤" }
    function ChessMuseumView:fillItem_boxListInfo(item)
        local data = item.data

        if not item._inited then
            item.toggle = ModuleCache.ComponentManager.GetComponent(item.gameObject, ComponentTypeName.Toggle)
            item.wanfaIcon = GetComponentWithPath(item.gameObject, "wanfaIcon", ComponentTypeName.Image)
            item.baseDescText = GetComponentWithPath(item.gameObject, "baseDesc", ComponentTypeName.Text)
            item.infoDescText = GetComponentWithPath(item.gameObject, "infoDesc", ComponentTypeName.Text)
            item.boxNameInput = GetComponentWithPath(item.gameObject, "boxNameInput", ComponentTypeName.InputField)
            item.boxNameInputImage = GetComponentWithPath(item.gameObject, "boxNameInput", ComponentTypeName.Image)
            item.boxNameInput.onEndEdit:RemoveAllListeners()
            item.boxNameInput.onEndEdit:AddListener(function(str)
                if self.updateBoxName then
                    self.updateBoxName(data, item.boxNameInput)
                end
                local layout = function()
                    WaitForEndOfFrame()
                    if item.boxNameInput.interactable then
                        item.boxNameInput.interactable = false
                        item.boxNameInputImage.raycastTarget = false
                    end
                end
                self:start_unity_coroutine(layout)
            end)

            item.modifyNameBtn = GetComponentWithPath(item.gameObject, "boxNameInput/editboxNameBtn", ComponentTypeName.Button)
            item.modifyNameBtn.onClick:RemoveAllListeners()
            item.modifyNameBtn.onClick:AddListener(function()
                if item.boxNameInput.interactable == false then
                    item.boxNameInput.interactable = true
                    item.boxNameInputImage.raycastTarget = true

                    item.boxNameInput:ActivateInputField()
                end
            end);

            item.boxDeleteBtnObj = GetComponentWithPath(item.gameObject, "boxDeleteBtn", ComponentTypeName.Transform).gameObject
            item.boxSetBtnObj = GetComponentWithPath(item.gameObject, "boxSetBtn", ComponentTypeName.Transform).gameObject
            item.boxIdx1 = GetComponentWithPath(item.gameObject, "toggleBg1/Text", ComponentTypeName.Text)
            item.boxIdx2 = GetComponentWithPath(item.gameObject, "toggleBg2/Text", ComponentTypeName.Text)

            item._inited = true
        end

        if data then
            --print(data.idx,"~~~~~~~~~~~~~~",data.playRule)
            if data.playRule ~= "" then
                local wanfaName = ""
                local ruleName = ""
                local renshu = 4

                wanfaName, ruleName, renshu = TableUtil.get_rule_name(data.playRule, true, data.gameId)

                --字牌公告规则特殊处理
                if (AppData.Game_Name == 'XXZP' or AppData.Game_Name == 'LDZP') then
                    ruleName = TableUtil.get_rule_name_paohuzi(data.playRule)
                end

                item.infoDescText.text = ruleName
                data.wanfaName = wanfaName

                local ruleInfo = ModuleCache.Json.decode(data.playRule)
                local gameType = ruleInfo.GameType or ruleInfo.gameType or ruleInfo.game_type or ruleInfo.bankerType or 3
                local playMode = ModuleCache.PlayModeUtil.getConfigByAppGameNameAndWanfaType(data.gameId, gameType)


                if playMode then
                    item.wanfaIcon.sprite = ModuleCache.PlayModeUtil.getHeadIconRes(playMode)
                    item.wanfaIcon:SetNativeSize()
                else
                    --TODO：纸牌类的玩法getConfigByAppGameNameAndWanfaType找到的都是空的
                    local playMode = ModuleCache.PlayModeUtil.getConfigByAppAndGameName(data.gameId)
                    item.wanfaIcon.sprite = ModuleCache.PlayModeUtil.getHeadIconRes(playMode)
                    item.wanfaIcon:SetNativeSize()

                end

            else
                local playMode = ModuleCache.PlayModeUtil.getConfigByAppAndGameName(data.gameId)
                item.wanfaIcon.sprite = ModuleCache.PlayModeUtil.getHeadIconRes(playMode)
                item.wanfaIcon:SetNativeSize()
                data.wanfaName = playMode.name
                item.infoDescText.text = data.playRuleName
            end

            item.baseDescText.text = data.wanfaName .. " " .. data.roundCount .. "局 " .. payTypeStrs[data.payType]

            item.boxNameInput.interactable = false
            if data.boxName and data.boxName ~= "" then
                item.boxNameInput.text = data.boxName --Util.filterPlayerName(data.boxName, 19)
            else
                item.boxNameInput.text = "尚未设置楼层名称"
            end

            item.boxIdx1.text = boxIdxTab[data.idx]--boxIdxTab[#self.boxListData - data.idx + 1]
            item.boxIdx2.text = boxIdxTab[data.idx]--boxIdxTab[#self.boxListData - data.idx + 1]

            item.toggle.isOn = PlayerPrefsManager.GetInt("SelectBoxIdx", 1) == data.idx
            item.boxDeleteBtnObj:SetActive(self.museumData and self.museumData.playerRole == "OWNER" )
            item.boxSetBtnObj:SetActive(self.museumData and (self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN"))

            item.modifyNameBtn.gameObject:SetActive(self.museumData and (self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN"))

        end
    end

    local noSelectColor = Color.New(158/255, 125/255, 92/255, 1)
    local selectColor =Color.New(105/255, 77/255, 14/255, 1)
    function ChessMuseumView:select_item(index, callback)
        if (not self.dataList or #self.dataList == 0) then
            if (callback) then
                callback(nil)
            end
            return
        end

        if self.selectIndex and self.selectIndex <= #self.dataList then
            self.dataList[self.selectIndex ].item.itemObj.textNum.color = noSelectColor
            self.dataList[self.selectIndex ].item.itemObj.textName.color = noSelectColor
            self.dataList[self.selectIndex ].item.itemObj.textnickname.color = noSelectColor
        end


        self.dontClickObj:SetActive(true)

        if (index > #self.dataList) then
            index = 1
        end
        self.selectIndex = index
        self.dataList[self.selectIndex ].item.itemObj.textNum.color = selectColor
        self.dataList[self.selectIndex ].item.itemObj.textName.color = selectColor
        self.dataList[self.selectIndex ].item.itemObj.textnickname.color = selectColor

        local data = self.dataList[index]
        print_table( self.toggles[index],"~~~========~~~"..index)
        self.toggles[index].toggle.isOn = false
        self.toggles[index].toggle.isOn = true
        print("########## self.toggles[index].toggle.isOn=", self.toggles[index].toggle.isOn)
        PlayerPrefsManager.SetInt("museumIndex", data.parlorId)
        PlayerPrefsManager.Save()
        -- print("---------------save------------ self.view.selectIndex:", self.selectIndex,PlayerPrefsManager.GetInt("museumIndex", 1))

        if (callback) then
            callback(data)
        end
    end

    function ChessMuseumView:get_detail(data)
        self.museumData = data
        --print_table(data,"###########")

        self.textChessName.text = Util.filterPlayerName(data.parlorName_orginal, 17)

        self.museumNum.text = string.format("圈号:0%s(%s人)", data.orginalParlorNum, data.memberCount_orginal)
        if data.parlorLogo_orginal and type(data.parlorLogo_orginal) ~= "userdata" then
            self:image_load_sprite(self.museumImg, data.parlorLogo_orginal)
        end

        --self.activeNewMsgObj:SetActive(self.museumData.activityHighlight and tonumber(self.museumData.activityHighlight) == 1)
        self.fellowshipNewMsgObj:SetActive(self.museumData.fellowInviteAuditing)

        --ComponentUtil.SafeSetActive(self.buttonSetting.gameObject, false)
        --ComponentUtil.SafeSetActive(self.buttonInfo.gameObject, false)
        --ComponentUtil.SafeSetActive(self.buttonSetting.gameObject, data.playerRole == "OWNER" or data.playerRole == "ADMIN")
        --ComponentUtil.SafeSetActive(self.buttonInfo.gameObject, data.playerRole ~= "OWNER" and data.playerRole ~= "ADMIN")
        ComponentUtil.SafeSetActive(self.addCompartmentBtn, data.playerRole == "OWNER" or data.playerRole == "ADMIN")
        ComponentUtil.SafeSetActive( self.statisticsButton, data.playerRole == "OWNER" or data.playerRole == "ADMIN")
        ComponentUtil.SafeSetActive( self.fellowShipObj, data.playerRole == "OWNER" or data.fellowshipType  ~= 0) -- fellowshipType  0 普通圈
        ComponentUtil.SafeSetActive( self.fellowShipImg, data.fellowshipType  == 0)
        ComponentUtil.SafeSetActive( self.fellowShipImg2, data.fellowshipType  ~= 0)
    end

    return ChessMuseumView