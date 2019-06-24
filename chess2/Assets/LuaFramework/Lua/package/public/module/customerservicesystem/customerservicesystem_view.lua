
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class CustomerServiceSystemView

local CustomerServiceSystemView = Class('customerServiceSystemView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local ComponentUtil = ModuleCache.ComponentManager
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local CustomImageManager = ModuleCache.CustomImageManager
local CSmartTimer = ModuleCache.SmartTimer.instance
local Application = UnityEngine.Application

function CustomerServiceSystemView:initialize(...)
    -- 初始View
    if ModuleCache.ModuleManager.module_is_active("public", "login") then
        View.initialize(self, "public/module/customerservicesystem/public_windowcustomerservicesystem.prefab", "Public_WindowCustomerServiceSystem", 3)
    else
        View.initialize(self, "public/module/customerservicesystem/public_windowcustomerservicesystem.prefab", "Public_WindowCustomerServiceSystem", 1)
    end

    View.set_1080p(self)

    self.chatInput = GetComponentWithPath(self.root, "Bottom/Child/InputField", ComponentTypeName.InputField)

    self.copyItem = GetComponentWithPath(self.root, "ItemPrefabHolder/Msg", ComponentTypeName.Transform).gameObject
    self.copyParent = GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content", ComponentTypeName.RectTransform)
    self.defaultHead = GetComponentWithPath( self.copyItem,"player/Mask/Head",ComponentTypeName.Image).sprite

    --self.originalImgObj =  GetComponentWithPath(self.root, "Bottom/OriginalImg", ComponentTypeName.Transform).gameObject
    --self.originalImg = GetComponentWithPath(self.root, "Bottom/OriginalImg/RawImage", ComponentTypeName.RawImage)
    --self.img = GetComponentWithPath(self.root, "Bottom/OriginalImg/Image", ComponentTypeName.Image)
    --self.originalImgRectTran = GetComponentWithPath(self.root, "Bottom/OriginalImg/RawImage", ComponentTypeName.RectTransform)

    self.originalImgObj =  GetComponentWithPath(self.root, "Bottom/OriginalImg", ComponentTypeName.Transform).gameObject
    self.originalImgGridLayoutGroup = GetComponentWithPath(self.root, "Bottom/OriginalImg/Scroll View/Viewport/Content", ComponentTypeName.GridLayoutGroup)
    self.originalImg = GetComponentWithPath(self.root, "Bottom/OriginalImg/Scroll View/Viewport/Content/RawImage", ComponentTypeName.RawImage)
    self.img = GetComponentWithPath(self.root, "Bottom/OriginalImg/Scroll View/Viewport/Content/Image", ComponentTypeName.Image)
    self.originalImgRectTran = GetComponentWithPath(self.root, "Bottom/OriginalImg/Scroll View/Viewport/Content/RawImage", ComponentTypeName.RectTransform)
    self.saveImgBtn = GetComponentWithPath(self.root, "Bottom/OriginalImg/saveImgBtn", ComponentTypeName.Transform).gameObject


    self.chatMsgScrollRect = GetComponentWithPath(self.root, "Center/ListScrollView", ComponentTypeName.ScrollRect)
    self.chatMsgCsf = GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content", ComponentTypeName.ContentSizeFitter)
    self.chatMsgVlg = GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content", ComponentTypeName.VerticalLayoutGroup)

    self.chatBarStateSwither = ComponentUtil.GetComponent(self.root, "UIStateSwitcher")
    self.changeVoiceToggle = GetComponentWithPath(self.root, "Bottom/Child/changeVoice", ComponentTypeName.Toggle)

    self.selectTypeItem =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblemType/Item", ComponentTypeName.Transform).gameObject
    self.selectTypeParent =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblemType", ComponentTypeName.Transform).gameObject

    self.commonProblemItem =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblem/Item", ComponentTypeName.Transform).gameObject
    self.commonProblemParent =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblem", ComponentTypeName.Transform).gameObject

    self.commonProblemTitle =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblem/title", ComponentTypeName.Transform).gameObject
    self.commonProblemAnswer =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblem/answerText", ComponentTypeName.Text)
    self.bottomBar1 =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblem/bottomBar1", ComponentTypeName.Transform).gameObject
    self.bottomBar2 =  GetComponentWithPath(self.root, "Center/ListScrollView/Viewport/Content/SelectProblem/bottomBar2", ComponentTypeName.Transform).gameObject

    GetComponentWithPath(self.root, "Bottom/OriginalImg/saveImgBtn", ComponentTypeName.RectTransform).gameObject:SetActive(ModuleCache.GameManager.runtimePlatform ~= "IPhonePlayer")

    self.needSetVerticalNormalizedPosition = 0

    GetComponentWithPath(self.root, "Background/TextTitle",ComponentTypeName.Text).text = "客服"
end

-- 显示选择问题类型
function CustomerServiceSystemView:initSelectTypeView(list)
    self.selectProblemDataType = list
    local num = 0
    for k,v in  ipairs(list) do
        num = num+1
        local item =  TableUtil.clone(self.selectTypeItem,self.selectTypeParent,Vector3.zero)
        item.name = "selectProblem_" .. v.sort
        ComponentUtil.SafeSetActive(item, true)

        GetComponentWithPath( item,"Label",ComponentTypeName.Text).text = string.format("问题%s、%s",num,v.problemDesc)
    end

    self.selectTypeParent:SetActive(num >0)
    self.selectTypeParent.transform:SetAsLastSibling()
    self.chatMsgScrollRect.verticalNormalizedPosition = 0
end

-- 显示选择常见问题 或者答案
function CustomerServiceSystemView:initCommonProblemView(list)
    local temps = TableUtil.get_all_child(self.commonProblemParent.gameObject)
    for i=1,#temps do
        if string.find(temps[i].name, "commonProblem_") then
            UnityEngine.GameObject.Destroy(temps[i])
        end

    end

    self.commonProblemData = list
    local isAnswer = false
    if #list > 0 and list[1].type == 2 then--类型(1-问题 2-答案)
        isAnswer = true
        self.commonProblemData.isAnswer = true
    end

    self.commonProblemTitle:SetActive(not isAnswer)
    self.commonProblemAnswer.gameObject:SetActive(isAnswer)
    self.bottomBar1:SetActive(not isAnswer)
    self.bottomBar2:SetActive(isAnswer)


    local num = 0
    local answerStr = ""
    for k,v in  ipairs(list) do
        num = num+1
        if(v.type == 1 ) then
            local item =  TableUtil.clone(self.commonProblemItem,self.commonProblemParent,Vector3.zero)
            item.name = "commonProblem_" .. v.sort
            ComponentUtil.SafeSetActive(item, true)

            GetComponentWithPath( item,"xiahuaxian/Text",ComponentTypeName.Text).text = string.format("%s、%s",num,v.content)
        else
            answerStr = answerStr ..v.content.."\n"
        end

    end
    self.commonProblemAnswer.text = answerStr

    self.commonProblemParent:SetActive(num >0)
    self.commonProblemParent.transform:SetAsLastSibling()

    GetComponentWithPath( self.commonProblemParent,"bottomBar1",ComponentTypeName.Transform) :SetAsLastSibling()
    GetComponentWithPath( self.commonProblemParent,"bottomBar2",ComponentTypeName.Transform) :SetAsLastSibling()

    self:setMsgPanel()

end


function CustomerServiceSystemView:setMsgPanel()
    local setMsgPos = function()
        --Yield(0)
        WaitForSeconds(0.1)
        --WaitForEndOfFrame()
        self.contents_chatMsg= TableUtil.get_all_child(self.copyParent.gameObject)
        for i=1,#self.contents_chatMsg do
            if self.contents_chatMsg[i].gameObject.activeSelf and self.contents_chatMsg[i].gameObject.name ~= "SelectProblemType" and self.contents_chatMsg[i].gameObject.name ~= "SelectProblem" then
                local array = string.split(self.contents_chatMsg[i].gameObject.name, "_")
                local idx = tonumber(array[2])
                local showTimeTexHeight = 90

                local curData = self:get_chat_msg_data(idx)
                local nextData = self:get_chat_msg_data(idx+ 1)

                if curData and curData.isBiaoJi then
                    showTimeTexHeight = showTimeTexHeight+ 30
                end

                local msgRectTran = GetComponentWithPath(self.contents_chatMsg[i].gameObject, "msgTex", ComponentTypeName.RectTransform)
                local itemRectTran = ModuleCache.ComponentManager.GetComponent(self.contents_chatMsg[i].gameObject,ComponentTypeName.RectTransform)
                --local msgContenSF =  ModuleCache.ComponentManager.GetComponent(msgRectTran.gameObject, ComponentTypeName.ContentSizeFitter)
                --msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize

                --print(ModuleCache.Json.decode(curData.content).data,"~~~~~~~~~1~~~~~~~~~~msgRectTran:",msgRectTran.sizeDelta.x,msgRectTran.sizeDelta.y)
                --msgContenSF:SetLayoutHorizontal()--强制计算一下msgRectTran.sizeDelta
                --print(ModuleCache.Json.decode(curData.content).data,"~~~~~~~~~~2~~~~~~~~~msgRectTran:",msgRectTran.sizeDelta.x,msgRectTran.sizeDelta.y)
                if curData and tonumber(ModuleCache.Json.decode(curData.content).type ) == 2 then
                    if curData.w and curData.h then
                        if curData.w > curData.h then
                            showTimeTexHeight = showTimeTexHeight+ 110
                        else
                            showTimeTexHeight = showTimeTexHeight+ 210
                        end
                    end
                end

                --if msgRectTran.sizeDelta.x < 795 then
                --    msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
                --else
                --    msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.Unconstrained
                --    msgRectTran.sizeDelta = Vector2.New(795,  msgRectTran.sizeDelta.y)
                --end

                local setPosEnd = function()
                    --Yield(0)
                    --WaitForSeconds(1)
                    WaitForEndOfFrame()
                    if not self.isDestroy then
                        if itemRectTran and itemRectTran.sizeDelta then
                            itemRectTran.sizeDelta = Vector2.New(itemRectTran.sizeDelta.x, msgRectTran.sizeDelta.y+showTimeTexHeight)
                        end
                    end
                end

                self:start_unity_coroutine(setPosEnd)
            end
        end

        local setPosEnd = function()
            Yield(0)
            --Yield(0)
            --Yield(0)
            --WaitForEndOfFrame()
            --WaitForSeconds(0.3)
            if not self.isDestroy then
                self.chatMsgVlg:SetLayoutVertical()
                self.chatMsgCsf.enabled = false
                self.chatMsgCsf.enabled = true
                --WaitForEndOfFrame()
                Yield(0)
                print("****消息显示位置******* self.needSetVerticalNormalizedPosition:", self.needSetVerticalNormalizedPosition)
                self.chatMsgScrollRect.verticalNormalizedPosition =  self.needSetVerticalNormalizedPosition or 0
            end
        end

        self:start_unity_coroutine(setPosEnd)--设置显示最新消息（拉到最底部）
    end

    self:start_unity_coroutine(setMsgPos)
end

--获取聊天消息数据
function CustomerServiceSystemView:get_chat_msg_data(idx)

    return self.chatData.list[idx]
end


--type消息类型 (1-文本 2-图片 3-语音)
--fromType         发送者类型  1-玩家 2-客服
function CustomerServiceSystemView:fillItem_chatMsg(item)
    local itemData = item.data
    local data = ModuleCache.Json.decode(item.data.content)

    local stateSwitcher =  ModuleCache.ComponentManager.GetComponent(item.gameObject,"UIStateSwitcher")

    local msgTex = GetComponentWithPath(item.gameObject, "msgTex/Text", ComponentTypeName.Text)
    local startChatText        = GetComponentWithPath(item.gameObject, "startChatText", ComponentTypeName.Text)
    local endChatText        = GetComponentWithPath(item.gameObject, "endChatText", ComponentTypeName.Text)

    local playerRectTran = GetComponentWithPath(item.gameObject, "player", ComponentTypeName.RectTransform)
    local nickTex = GetComponentWithPath(item.gameObject, "player/nick", ComponentTypeName.Text)
    local imageHead = GetComponentWithPath(item.gameObject, "player/Mask/Head", ComponentTypeName.Image)
    local timeTex_self = GetComponentWithPath(item.gameObject, "player/time_self", ComponentTypeName.Text)
    local timeTex_other = GetComponentWithPath(item.gameObject, "player/time_other", ComponentTypeName.Text)


    local msgSpriteHolderImg        = GetComponentWithPath(item.gameObject, "msgTex", ComponentTypeName.Image)
    local msgSpriteHolder = ModuleCache.ComponentManager.GetComponent(msgSpriteHolderImg.gameObject,  "SpriteHolder")

    local msgContenSF = ModuleCache.ComponentManager.GetComponent(msgSpriteHolderImg.gameObject, ComponentTypeName.ContentSizeFitter)
    msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize

    local msgTexRectTran = GetComponentWithPath(item.gameObject, "msgTex", ComponentTypeName.RectTransform)

    item.textureMsg = GetComponentWithPath(item.gameObject, "Image_msg", ComponentTypeName.RawImage)
    item.textureMsgTran = ModuleCache.ComponentManager.GetComponent(item.textureMsg.gameObject,ComponentTypeName.RectTransform)
    item.texture_download = GetComponentWithPath(item.textureMsg.gameObject,"ImageDelay",ComponentTypeName.Transform).gameObject

    item.loadMoreObj = GetComponentWithPath(item.gameObject,"loadMoreObj",ComponentTypeName.Transform).gameObject

    GetComponentWithPath(item.gameObject, "msgTex/Text", ComponentTypeName.Transform).gameObject:SetActive(data.type ~= 2 and data.type ~= 3)
    GetComponentWithPath(item.gameObject, "msgTex/voicePop", ComponentTypeName.Transform).gameObject:SetActive(data.type == 3)

    timeTex_self.gameObject:SetActive(data.fromType == 1)
    timeTex_other.gameObject:SetActive(data.fromType == 2)
    if data.createTime then
        timeTex_self.text = data.createTime
        timeTex_other.text = data.createTime
    elseif itemData.createTime then
        timeTex_self.text = itemData.createTime
        timeTex_other.text = itemData.createTime
    end

    --104-客户会话结束   纯文本
    --105 - 会话超时警告
    --106 - 会话超时结束问候语
    if data.type == 104 or data.type == 105 or data.type == 106  then
        data.type = 103
        data.fromType = 2
    end

    if data.fromType == 1 then --fromType         发送者类型  1-玩家 2-客服
        playerRectTran.anchoredPosition = Vector2.New(1457, playerRectTran.anchoredPosition.y)

        msgTexRectTran.pivot = Vector2.New(1, 1)
        item.textureMsgTran.pivot = Vector2.New(1,1)

        stateSwitcher:SwitchState("self")
        msgSpriteHolderImg.sprite = msgSpriteHolder:FindSpriteByName("self")

        if self.chatData.headSprite then
            imageHead.sprite = self.chatData.headSprite
        end

    else
        playerRectTran.anchoredPosition = Vector2.New(-222, playerRectTran.anchoredPosition.y)
        imageHead.sprite = self.defaultHead

        if data.type == 101 then--101-等待信息
            stateSwitcher:SwitchState("system")

        elseif data.type == 103 then--103-会话结束
            stateSwitcher:SwitchState("system")


        elseif data.type == 200 then--标记信息

        else
            msgTexRectTran.pivot = Vector2.New(0,1)
            item.textureMsgTran.pivot = Vector2.New(0,1)

            stateSwitcher:SwitchState("other")
            msgSpriteHolderImg.sprite = msgSpriteHolder:FindSpriteByName("other")

            if self.curCustomServiceData and self.curCustomServiceData.csData then   --极光im消息
                nickTex.text = Util.filterPlayerName(self.curCustomServiceData.csData.nickName,6)
                TableUtil.only_download_head_icon(imageHead, self.curCustomServiceData.csData.headImg)
            else--历史消息
                if itemData.customUser and itemData.customUser.nickName then
                    nickTex.text =  Util.filterPlayerName(itemData.customUser.nickName,6)
                    TableUtil.only_download_head_icon(imageHead, itemData.customUser.headImg)
                else
                    nickTex.text =  ""
                end
            end


        end
    end

    msgTexRectTran.gameObject:SetActive((tonumber(data.type) == 1) or (tonumber(data.type) == 102) or (tonumber(data.type) == 3))
    item.textureMsg.gameObject:SetActive(tonumber(data.type) == 2)

    if data.type == 1 or  data.type == 102 then --1-文本消息    102-会话开始
        msgTex.text = data.data

    elseif data.type == 101 then
        startChatText.gameObject:SetActive(true)

        local msg = ModuleCache.Json.decode(data.data)
        startChatText.text = string.format(msg.message,msg.waitNum)

    elseif data.type == 103 then
        endChatText.gameObject:SetActive(true)
        endChatText.text = data.data

    elseif data.type == 2 then
        item.texture_download:SetActive(true)
        if data.fromType == 1 then
            item.textureMsgTran.anchoredPosition = Vector2.New(1577, item.textureMsgTran.anchoredPosition.y)
        else
            item.textureMsgTran.anchoredPosition = Vector2.New(78, item.textureMsgTran.anchoredPosition.y)
        end


        item.textureMsg.texture = nil
        local arr = string.split(data.data, "_")

        if # arr > 2 then
            itemData.w = tonumber(arr[2])
            itemData.h = tonumber(arr[3])
            if itemData.w  >  itemData.h then
                item.textureMsgTran.sizeDelta = Vector2.New(math.min( itemData.w,350), math.min( itemData.h,200))
            else
                item.textureMsgTran.sizeDelta = Vector2.New(math.min( itemData.w,160), math.min( itemData.h,300))
            end
            data.resetImgSize = true
        end

        local downloadDone = function (imagePath)
            -- 读取显示照片
            item.texture_download:SetActive(false)

            local _texture = ModuleCache.TextureCacheManager._get_local_chat_texture(imagePath)
            if not data.resetImgSize then

                local v2 = ModuleCache.TextureCacheManager.GetTexture2dSize(_texture)
                itemData.w = v2.x
                itemData.h = v2.y
                if v2.x  > v2.y then
                    item.textureMsgTran.sizeDelta = Vector2.New(math.min(v2.x,350), math.min(v2.y,200))
                else
                    item.textureMsgTran.sizeDelta = Vector2.New(math.min(v2.x,160), math.min(v2.y,300))
                end
            end

            item.textureMsg.texture =  _texture
        end


        local savePath = nil

        if data.fromType == 1 then
            local arr2 = string.split(data.data, "/image/")
            if # arr2 >= 2 then
                savePath = Application.persistentDataPath .. "/image/"..arr2[2]
            end

            itemData.savePath = savePath
            CustomImageManager.download_image_file(data.data, savePath, function(imagePath)
                if self.isDestroy then
                    return
                end

                downloadDone(savePath)
            end)
        else

            local arr2 = string.split(data.data, "/")
            savePath = Application.persistentDataPath .. "/image/" .. arr2[#arr2]

            itemData.savePath = savePath
            ModuleCache.TextureCacheManager._get_texture_with_www(data.data, 10,function(err, sprite)
                if (err) then

                else
                    if sprite ~= nil then
                        downloadDone(savePath)
                    end
                end
            end,savePath)
        end

    elseif data.type ~= 3 then -- 适配没定义的类型  收到没定义的类型时 以客服文本显示
        msgTex.text = data.data
        msgTexRectTran.gameObject:SetActive(true)
        item.textureMsg.gameObject:SetActive(false)
    end

    --历史消息的 标记违规  处理
    if itemData.tags and # itemData.tags > 0 then
        itemData.isBiaoJi = true

        local biaojiIconObj = nil
        local biaojiTex = nil
        local xiahuaxianRt = nil
        if data.type == 1 then
            biaojiIconObj = GetComponentWithPath(item.gameObject, "msgTex/Text/Image", ComponentTypeName.Transform).gameObject
            biaojiTex = GetComponentWithPath(item.gameObject, "msgTex/Text/xiahuaxian/Text", ComponentTypeName.Text)
            xiahuaxianRt = GetComponentWithPath(item.gameObject, "msgTex/Text/xiahuaxian", ComponentTypeName.RectTransform)

            xiahuaxianRt.anchoredPosition = Vector2.New(26.8, xiahuaxianRt.anchoredPosition.y)
        else
            biaojiIconObj = GetComponentWithPath(item.gameObject, "Image_msg/Image", ComponentTypeName.Transform).gameObject
            biaojiTex = GetComponentWithPath(item.gameObject, "Image_msg/xiahuaxian/Text", ComponentTypeName.Text)
            --xiahuaxianRt = GetComponentWithPath(item.gameObject, "Image_msg/xiahuaxian", ComponentTypeName.RectTransform)
        end

        biaojiIconObj:SetActive(true)
        biaojiTex.transform.parent.gameObject:SetActive(true)
        biaojiTex.text = itemData.tags[1].message

    end

    if msgTex.preferredWidth < 708 then
        msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize
    else
        msgContenSF.horizontalFit = UnityEngine.UI.ContentSizeFitter.FitMode.Unconstrained
        msgTexRectTran.sizeDelta = Vector2.New(795, msgTexRectTran.sizeDelta.y)
    end

    if data.fromType == 1 then
        msgTexRectTran.anchoredPosition = Vector2.New(1227,  msgTexRectTran.anchoredPosition.y)
    end

end

--初始化聊天消息列表
function CustomerServiceSystemView:initLoopScrollViewList_chatMsg(chatData,curCustomServiceData,isBiaojiData)
    --self:reset()
    self.unreadChatIds = ""

    self.isBiaojiData = isBiaojiData or {}
    self.curCustomServiceData = curCustomServiceData
    if not chatData  or (#chatData.list < 1 ) then
        return
    end

    table.sort(chatData.list,function(a,b) return (a.chatId < b.chatId) end)

    self.chatData = chatData

    if(#self.chatData.list > 0) then
        --for i=#self.chatData.list,1,-1 do
        for i=1,#self.chatData.list do
            if not self.chatData.list[i].canRead  then
                --table.insert( self.unreadChatIds, self.chatData.list[i].chatId)
                if self.unreadChatIds == "" then
                    self.unreadChatIds = self.chatData.list[i].chatId..""
                else
                    self.unreadChatIds = self.unreadChatIds ..",".. self.chatData.list[i].chatId
                end

            end

            if self.chatData.list[i].isNewMsg then
                self.chatData.list[i].isNewMsg = false
                self.chatData.list[i].item = self:get_item(self.chatData.list[i], i)
                self:fillItem_chatMsg(self.chatData.list[i].item)
            end
        end

        self.selectTypeParent.transform:SetAsLastSibling()
        self.commonProblemParent.transform:SetAsLastSibling()
        self:setMsgPanel()
    end

    if(#self.isBiaojiData > 0) then
        for j = 1,#self.isBiaojiData do
            local msg = ModuleCache.Json.decode(self.isBiaojiData[j].data)

            for key,value in pairs(self.chatData.list) do
                if value.chatId == msg.chatId then
                    value.isBiaoJi = true

                    local biaojiIconObj = nil
                    local biaojiTex = nil
                    local xiahuaxianRt = nil
                    if value.type == 1 then
                        biaojiIconObj = GetComponentWithPath(value.item.gameObject, "msgTex/Text/Image", ComponentTypeName.Transform).gameObject
                        biaojiTex = GetComponentWithPath(value.item.gameObject, "msgTex/Text/xiahuaxian/Text", ComponentTypeName.Text)
                        xiahuaxianRt = GetComponentWithPath(value.item.gameObject, "msgTex/Text/xiahuaxian", ComponentTypeName.RectTransform)

                        xiahuaxianRt.anchoredPosition = Vector2.New(26.8, xiahuaxianRt.anchoredPosition.y)
                    else
                        biaojiIconObj = GetComponentWithPath(value.item.gameObject, "Image_msg/Image", ComponentTypeName.Transform).gameObject
                        biaojiTex = GetComponentWithPath(value.item.gameObject, "Image_msg/xiahuaxian/Text", ComponentTypeName.Text)
                        --xiahuaxianRt = GetComponentWithPath(value.item.gameObject, "Image_msg/xiahuaxian", ComponentTypeName.RectTransform)
                    end

                    biaojiIconObj:SetActive(true)
                    biaojiTex.transform.parent.gameObject:SetActive(true)
                    biaojiTex.text = msg.message
                end
            end
        end
        self:setMsgPanel()
    end

end


function CustomerServiceSystemView:get_item(data, i)
    local obj = nil
    local item = {}
    if(i<=#self.contents and self.contents[i].name ~= "SelectProblemType" and self.contents[i].name ~= "SelectProblem") then
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

function CustomerServiceSystemView:reset()
    self.contents = TableUtil.get_all_child(self.copyParent.gameObject)
    for i=1,#self.contents do
        ComponentUtil.SafeSetActive(self.contents[i], false)
    end
end



return CustomerServiceSystemView