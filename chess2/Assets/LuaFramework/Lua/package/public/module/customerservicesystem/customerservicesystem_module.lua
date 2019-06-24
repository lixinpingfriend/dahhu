
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

---@class CustomerServiceSystemModule : ModuleBase
---@field view CustomerServiceSystemView
local CustomerServiceSystemModule = class("customerServiceSystemModule", ModuleBase)



-- 常用模块引用
local ModuleCache = ModuleCache
local chatMgr = ModuleCache.JMsgManager
local NetClientManager = ModuleCache.net.NetClientManager
local Application = UnityEngine.Application
local CustomImageManager = ModuleCache.CustomImageManager
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
local CSmartTimer = ModuleCache.SmartTimer.instance
local SoundManager = ModuleCache.SoundManager


--get_data_list（） -》 isCreateConversation（）
--已经有会话       获取im昵称密码 并登入im getImAdminUser()  以及getCustomById 获取客服呢称
--还没有会话      getProblemType()   -》getImAdminUser()  im登入成功显示界面     选择问题类型后   -》getCustomConvertion()
function CustomerServiceSystemModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "customerservicesystem_view", nil, ...)

    self.table_voice_module = ModuleCache.ModuleManager.show_module('public','table_voice')
    self.table_voice_module.forbid_auto_play = true
    self:subscibe_package_event("Event_TableVoice_StartPlayVoice", function(eventHead, eventData)
        self.playVoiceAnim(true)
    end)
    self:subscibe_package_event("Event_TableVoice_StopPlayVoice", function(eventHead, eventData)
        self.playVoiceAnim(false)
    end)
    --self:subscibe_package_event("Event_TableVoice_SendVoice", function(eventHead, eventData)
    --    --self.view.input.text = eventData
    --    --self.pressTime = self.table_voice_module:get_record_time()
    --    --if(self.pressTime < 1)then
    --    --    self.pressTime = 1
    --    --else
    --    --    self.pressTime = string.format('%0.0f', self.pressTime)
    --    --end
    --    --self:send_msg_fun(2)
    --
    --    self:sendChat(3, eventData)--chatType消息类型 (1-文本 2-图片 3-语音)
    --
    --    --local data = ModuleCache.Json.decode(eventData)
    --    --print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@上次语音成功，发送消息",data.key,data.len)
    --    --self:sendChat(3, "http://game.oss.sincebest.com/".. data.key, data.len)--chatType消息类型 (1-文本 2-图片 3-语音)
    --end)

    --self.chatDataList = {}
    self.isBiaojiData = {}

    self.recvTextMsg = function(data)
        if self.chatDataList.list == nil then
            self.chatDataList.list = {}
        end
        if data.type ~= 200 then
            table.insert(self.chatDataList.list, {
                content = ModuleCache.Json.encode(data),
                chatId = data.chatId,
                tags = {},
                isNewMsg = true,
            } )
        else
            if self.isBiaojiData == nil then
                self.isBiaojiData = {}
            end

            table.insert(self.isBiaojiData, data)
        end


        print_table(data,"###data#####收到消息#########")
        self.view.needSetVerticalNormalizedPosition = 0
        self.view:initLoopScrollViewList_chatMsg(self.chatDataList,self.curChatData,self.isBiaojiData)
    end

    chatMgr.addSingleEvent(self.recvTextMsg,chatMgr.msgTag.singleTag)


    --self.onRecvOfflineMsg = function(data)
    --    if data.conversationId == self.curChatData.conversationId then
    --        if self.chatDataList.list == nil then
    --            self.chatDataList.list = {}
    --        end
    --        table.insert(self.chatDataList.list, data)
    --
    --        print_table(data,"########收到消息离线消息#########")
    --self.view.needSetVerticalNormalizedPosition = 0
    --        self.view:initLoopScrollViewList_chatMsg(self.chatDataList,self.curChatData)
    --    end
    --end
    --
    --chatMgr.addEventListener(self.onRecvOfflineMsg,chatMgr.msgTag.singleTag,true)

    CustomImageManager.set_event_listener(function(fileid)
        print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@上次图片成功，发送消息",fileid)

        self:sendChat(2,"http://game.oss.sincebest.com/" ..fileid)
    end,function(filePath)

    end)

    self.view.chatMsgScrollRect.onValueChanged:AddListener(function(vector2)

        --print("加载更多聊天历史记录：",self.view.chatMsgScrollRect.verticalNormalizedPosition)

        if  self.chatDataList.page <  self.chatDataList.totalPage and not self.isLoading then
            if self.view.chatMsgScrollRect.verticalNormalizedPosition >= 1.005 then
                self.isLoading = true
                self.view.chatMsgScrollRect.verticalNormalizedPosition = 1
                if self.resetsLoading then
                    CSmartTimer:Kill(self.resetsLoading)
                end

                self.resetsLoading = self:subscibe_time_event(1, false, 0):OnComplete(function(t)
                    self.isLoading = nil
                end).id

                self:get_data_list(true)
                self.view:get_chat_msg_data(1).item.loadMoreObj:SetActive(false)
            elseif self.view.chatMsgScrollRect.verticalNormalizedPosition >= 0.9 then
                self.view:get_chat_msg_data(1).item.loadMoreObj:SetActive(true)
            end
        end
    end)

    self.view.changeVoiceToggle.onValueChanged:AddListener(function(isCheck)
        if self.view.changeVoiceToggle.isOn then
            self.view.chatBarStateSwither:SwitchState("voice")
        else
            self.view.chatBarStateSwither:SwitchState("words")
        end
    end )

end

function CustomerServiceSystemModule:on_show(intentData)
    self.view:hide()
    self.view:reset()
    self.startTime = os.date("%Y-%m-%d %H:%M:%S", os.time() - 48*60*60)
    self.endTime = os.date("%Y-%m-%d %H:%M:%S", os.time())

    if intentData == "getImAdminUser" then

    else
        if not self.modelData.roleData.userID then
            self.userId = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "")
        else
            self.userId = self.modelData.roleData.userID
        end
    end

    if self.userId == "" or self.userId == "0" then
        self:getImAdminUser()
    else
        self:get_general_data(self.userId, function (userdata)
            self.headSprite = userdata.headSprite
            self:get_data_list()
        end)
    end

end

function CustomerServiceSystemModule:on_update()
    if ModuleCache.GameManager.customOsType == 1 and ModuleCache.UnityEngine.Input.GetKeyDown(ModuleCache.UnityEngine.KeyCode.Escape) and self:view_is_active()  then
        if self.view.unreadChatIds ~= "" then
            self:readByChatId()
        end

        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")

        
        --    ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        --    self:closeConvertion()
        --end, function()
        --    ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        --end, true, "确认结束", "仅返回")
    end
end


function CustomerServiceSystemModule:on_destroy()
    --UnityEngine.Screen.autorotateToPortrait = false
    --UnityEngine.Screen.autorotateToPortraitUpsideDown = false

    chatMgr.clean()
    if(self.table_voice_module)then
        ModuleCache.ModuleManager.destroy_module('public','table_voice')
    end
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function CustomerServiceSystemModule:on_module_inited()

end

-- 绑定module层的交互事件
function CustomerServiceSystemModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function CustomerServiceSystemModule:on_model_event_bind()


end

function CustomerServiceSystemModule:get_index_by_parlorId(parlorId)
    for i, v in ipairs(self.museumData) do
        if v.parlorId == parlorId then
            return i
        end
    end
    return 1
end

function CustomerServiceSystemModule:on_press(obj, arg)
    if obj.name == "ButtonMic" then
        local data = {
            obj = obj,
            arg = arg,
        }
        self:dispatch_package_event('Event_TableVoice_OnPressMic', data)
    end
end

function CustomerServiceSystemModule:on_press_up(obj, arg)
    if(obj and obj.name == "ButtonMic") then
        local data = {
            obj = obj,
            arg = arg,
            suffix = ".mp3"
        }
        self:dispatch_package_event('Event_TableVoice_OnPressUpMic', data)
    end

end

function CustomerServiceSystemModule:on_drag(obj, arg)
    if(obj and obj.name == "ButtonMic") then
        local data = {
            obj = obj,
            arg = arg,
        }
        self:dispatch_package_event('Event_TableVoice_OnDragMic', data)
    end
end

function CustomerServiceSystemModule:on_click_voice_bubble(fildid)
    local data = {
        fileid = fildid
    }
    self:dispatch_package_event("Event_TableVoice_VoiceComing", data)
end

function CustomerServiceSystemModule:PauseMusic()
    SoundManager.audioMusic.mute = true
end

function CustomerServiceSystemModule:UnPauseMusic()
    SoundManager.audioMusic.mute = false
end

function CustomerServiceSystemModule:isReady()
    return not self.selectProblemType and (not self.curChatData or not self.curChatData.isCreate )
end

function CustomerServiceSystemModule:on_click(obj, arg)

    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "closeBtn" then
        if self.view.unreadChatIds ~= "" then
            self:readByChatId()
        end

        if PlayerPrefsManager.GetInt("CustomerServiceSystemBack", 0) == 1 then
            ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")

        else
            if ModuleCache.ModuleManager.module_is_active("public", "hall") then
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("返回大厅后再次接到消息客服图标上会出现有小红点", function()
                    PlayerPrefsManager.SetInt("CustomerServiceSystemBack" ,1)
                    ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
                end)
            else
                ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
            end
        end

    elseif obj.name == "endChatBtn" then
        if self.view.unreadChatIds ~= "" then
            self:readByChatId()
        end
        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        
        --    ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        --    self:closeConvertion()
        --end, function()
        --    ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        --end, true, "确认结束", "仅返回")
    elseif obj.name == "sendBtn" then
        if self:isReady() then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先选择问题范围")
            return
        end

        if not self.curChatData or self.curChatData.conversationId < 1 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先选择问题是否已解决")
            return
        end

        if self.view.chatInput.text and self.view.chatInput.text ~= "" then
            self:sendChat(1, self.view.chatInput.text)--chatType消息类型 (1-文本 2-图片 3-语音)
        end

    elseif obj.name == "expressionBtn" then
        if self:isReady() then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先选择问题范围")
            return
        end

        if not self.curChatData or self.curChatData.conversationId < 1 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先选择问题是否已解决")
            return
        end

        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("即将上线")

    elseif obj.name == "ImgButton" then
        if self:isReady() then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先选择问题范围")
            return
        end

        if not self.curChatData or self.curChatData.conversationId < 1 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先选择问题是否已解决")
            return
        end

        if ModuleCache.GameManager.runtimePlatform == "OSXEditor" or ModuleCache.GameManager.runtimePlatform == "WindowsEditor" then
            local data
            if math.random()< 0.3 then
                data =ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/h.png")
            elseif math.random()< 0.6 then
                data =ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/w.png")
            else
                data =ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/xiaotu.png")
            end

            ModuleCache.CustomImageManager.upload_image_file(data)
        else
            local Json = {
                maxWidth = 1280,
                maxHeight = 720,
                compressQuality = 60
            }
            ModuleCache.SDKInterface():open_pick(ModuleCache.GameUtil.table_encode_to_json(Json))
        end
    elseif(obj.name == "Image_msg") then
        local array = string.split(obj.transform.parent.gameObject.name, "_")
        local idx = tonumber(array[2])
        self.selectData = self.view:get_chat_msg_data(idx)
        self.selectDataContent =ModuleCache.Json.decode(self.selectData.content)


        local rawImg = ModuleCache.ComponentManager.GetComponent(obj.gameObject, ModuleCache.ComponentTypeName.RawImage)

        self.view.originalImg.texture = rawImg.texture

        self.view.saveImgBtn:SetActive(true)
        self.view.originalImg.gameObject:SetActive(true)
        self.view.img.gameObject:SetActive(false)
        self.view.originalImgObj:SetActive(true)
        if self.view.originalImg.texture then
            self.view.originalImgRectTran.sizeDelta = ModuleCache.TextureCacheManager.GetTexture2dSize(self.view.originalImg.texture)
        end
        --self.view.originalImgRectTran.sizeDelta = Vector2.New(rawImg.texture.width,rawImg.texture.height) --ModuleCache.CustomerUtil.GetTexture2d_w_h(rawImg.texure)
        self.view.originalImgGridLayoutGroup.cellSize = ModuleCache.TextureCacheManager.GetTexture2dSize(self.view.originalImg.texture)
    elseif(obj.name == "Head") then

        local headImg = ModuleCache.ComponentManager.GetComponent(obj.gameObject, ModuleCache.ComponentTypeName.Image)

        self.view.img.sprite = headImg.sprite

        self.view.saveImgBtn:SetActive(false)
        self.view.originalImg.gameObject:SetActive(false)
        self.view.img.gameObject:SetActive(true)
        self.view.originalImgObj:SetActive(true)
        self.view.img:SetNativeSize()
        self.view.originalImgGridLayoutGroup.cellSize = Vector2.New(self.view.img.preferredWidth, self.view.img.preferredHeight)

    elseif(obj.name == "OriginalImg") then
        self.view.originalImgObj:SetActive(false)

    elseif(obj.name == "saveImgBtn") then

        if ModuleCache.SDKInterface():saveImageToGallery(self.selectData.savePath,"Game",self.selectDataContent.conversationId.."_"..self.selectDataContent.chatId..".jpg") then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("保存成功")
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("保存失败")
        end

    elseif string.find(obj.name, "selectProblem") then--聊天泡泡
        local array = string.split(obj.name, "_")
        local idx = tonumber(array[2])
        self.selectProblemType =  self.view.selectProblemDataType[idx].type

        self:getCustomProblem(self.selectProblemType)

    elseif string.find(obj.name, "commonProblem") then
        local array = string.split(obj.name, "_")
        local idx = tonumber(array[2])
        local commonProblem =  self.view.commonProblemData[idx]

        self:getCustomProblem(commonProblem.problemType,commonProblem.id)

    elseif obj.name == "yes" then
        
        --    ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        --    self:closeConvertion()
        --end, function()
        --    ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        --end, true, "确认结束", "仅返回")

        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("确认退出当前会话", function()
            if self.view.commonProblemData.isAnswer then-- 是否是答案数据  只有是答案时 发送是否解决问题结果
                self:setSolveProblem(self.view.commonProblemData[1].id, true)
            end
            ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        end)

    elseif obj.name == "no" then
        --TODO 没解决问题后调用
        self:getCustomConvertion()

        if self.view.commonProblemData.isAnswer then -- 是否是答案数据  只有是答案时 发送是否解决问题结果
            self:setSolveProblem(self.view.commonProblemData[1].id,false)
        end

    elseif obj.name == "msgTex" or obj.name == "msgTex_zj" then--聊天泡泡
        local array = string.split(obj.transform.parent.gameObject.name, "_")
        local idx = tonumber(array[2])

        local msgData = self.view:get_chat_msg_data(idx)

        print_table(msgData,"^^^^^^^^^^^^^^^^")

        if msgData then
            --type消息类型 (1-文本 2-图片 3-语音)
            --fromType         发送者类型  1-玩家 2-客服
            local data = ModuleCache.Json.decode(msgData.content)

            if tonumber(data.type) ~= 2 and tonumber(data.type) ~= 3 then
                ModuleCache.GameSDKInterface:CopyToClipboard(data.data)
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("文字消息复制成功")
            elseif tonumber(data.type) == 3 then
                --下载语音播放
                self:on_click_voice_bubble(data.data)
                --self:on_click_voice_bubble("voice/".. string.split(data.data, "/voice/")[2])
                if self.playVoiceAnim then
                    self.playVoiceAnim(false)
                end

                self.playVoiceAnim = function(isPlay)
                    if data.fromType == 1 then
                        ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject,"voicePop/voiceIcon_self/imageAnimation", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(isPlay)
                        ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject,"voicePop/voiceIcon_self", ModuleCache.ComponentTypeName.Image).enabled = not isPlay
                    else
                        ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject,"voicePop/voiceIcon_other/imageAnimation", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(isPlay)
                        ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject,"voicePop/voiceIcon_other", ModuleCache.ComponentTypeName.Image).enabled = not isPlay
                    end
                end

                PlayerPrefsManager.SetInt(data.chatId, 1)
                PlayerPrefsManager.Save()

                if data.fromType == 1  then
                    ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject,"voicePop/self/voiceLength_self/Image", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(false)
                else
                    ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject,"voicePop/other/voiceLength_other/Image", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(false)
                end

            end
        end
    end
end

-- 获取im登入数据 并登入im 显示界面
function CustomerServiceSystemModule:getImAdminUser()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "im/getImAdminUser?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            bundleId = Util.identifier
        }
    }

    if self.userId == "" or self.userId == "0" then
        requestData.params.uid = nil
        requestData.params.deviceId = ModuleCache.SDKInterface().get_idfa()
    end


    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            local imPassword = self.modelData.roleData.unionId
            if retData.data.imPassword then
                imPassword  = ModuleCache.SecurityUtil.DESDecode(retData.data.imPassword, AppData.DESKey)
            end
            if requestData.params.deviceId then
                self.userId = retData.data.gameUserId
                ModuleCache.JpushManager().init(retData.data.gameUserId)
                ModuleCache.ModuleManager.show_module("public", "customerservicesystem", "getImAdminUser")
            else
                chatMgr.login(retData.data.imUserName,imPassword, function(data)
                    print_table(data)
                    if data.result == "0" or data.result == 0 then
                        --self:getCustomConvertion()
                        self.view:show(true) --显示界面
                        --UnityEngine.Screen.autorotateToPortrait = true
                        --UnityEngine.Screen.autorotateToPortraitUpsideDown = true

                        --修复由于设置消息到底部时界面没显示 是失效的问题
                        --self.view.chatMsgScrollRect.verticalNormalizedPosition =  self.view.needSetVerticalNormalizedPosition or 0
                        self.view:setMsgPanel()

                        chatMgr.setLoginData(retData.data.imUserName, imPassword)
                        --chatMgr.setCurChatRoom(self.conversationId)
                    else
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.desc)
                        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
                    end
                end)
            end
        else
            ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
    end )
end

-- 选择问题 请求创建会话
function CustomerServiceSystemModule:getCustomConvertion()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/getCustomConvertion?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            bundleId = Util.identifier,
            problemType = self.selectProblemType
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            self.view.selectTypeParent:SetActive(false)
            self.view.commonProblemParent:SetActive(false)

            self.curChatData = retData.data
            self:getCustomById()
        else
            self.selectProblemType =  nil
        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        self.selectProblemType =  nil
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end

    end )
end

function CustomerServiceSystemModule:getCustomById()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/getCustomById?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            customId = self.curChatData.customId
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        --if (retData.success) then
            self.curChatData.csData = retData.data
        --end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end )
end

function CustomerServiceSystemModule:closeConvertion()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/closeConvertion?",
        --showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            conversationId = self.curChatData.conversationId
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if retData.data then

            end
        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        --if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
        --    if wwwErrorData.www.text then
        --        local retData = wwwErrorData.www.text
        --        retData = ModuleCache.Json.decode(retData)
        --        if retData.errMsg then
        --            retData = ModuleCache.Json.decode(retData.errMsg)
        --            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
        --        end
        --    end
        --end
    end )
end

--chatType消息类型 (1-文本 2-图片 3-语音)
function CustomerServiceSystemModule:sendChat(chatType,content,len)
    if not Util.checkNameUnlawful(content) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您输入的内容非法，请重新输入")
        return
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/sendChat?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            conversationId = self.curChatData.conversationId,
            chatType = chatType,--消息类型(1-文本 2-图片 3-语音)
            data = content,
            len = len
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        --if (retData.success) then
            if retData.data then
                if chatType == 1 then
                    self.view.chatInput.text = ""
                end

                if ModuleCache.GameManager.runtimePlatform == "OSXEditor" or ModuleCache.GameManager.runtimePlatform == "WindowsEditor" then
                    if self.chatDataList.list == nil then
                        self.chatDataList.list = {}
                    end

                    local fromType= 1
                    if math.random()< 0.5 then
                        fromType= 2
                    end

                    table.insert(self.chatDataList.list,  {content = ModuleCache.Json.encode({
                        chatId = retData.data,
                        type = chatType,
                        data = content,
                        conversationId = self.curChatData.conversationId,
                        fromType = fromType

                    }),chatId = retData.data,tags = {},isNewMsg = true })
                    self.view.needSetVerticalNormalizedPosition = 0
                    self.view:initLoopScrollViewList_chatMsg(self.chatDataList,self.curChatData)
                end
            end
        --end
    end , function(wwwErrorData)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end )
end


--1 获取历史记录
function CustomerServiceSystemModule:get_data_list(isloadMore)
    isloadMore = isloadMore or false
    print("***************",isloadMore,self.chatDataList)
    if self.chatDataList ~= nil and not isloadMore then
        self.view:initLoopScrollViewList_chatMsg(self.chatDataList,self.curChatData,self.isBiaojiData)
        return
    end

    local page = 1
    if self.chatDataList and self.chatDataList.page and isloadMore then
        page = self.chatDataList.page + 1
    end


    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/queryChatHistoryPage?",
        showModuleNetprompt = true,
        params = {
            uid = self.userId,
            pageSize = 20,
            pageNum = page,
            --startTime = self.startTime,
            --endTime = self.endTime

        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        --if(retData.success) then
            self.retData = retData.data

            --self.view.chatMsgScrollRect.verticalNormalizedPosition = 1

            if isloadMore and self.chatDataList then
                self.chatDataList.page = retData.data.page
                self.chatDataList.totalPage = retData.data.totalPage

                for i =1, #retData.data.list do
                    retData.data.list[i].isNewMsg = true
                    table.insert(self.chatDataList.list,#self.chatDataList.list +1, retData.data.list[i])
                end

                self.view.needSetVerticalNormalizedPosition = ( (#self.chatDataList.list - #retData.data.list) / #self.chatDataList.list)
            else
                for i =1, #retData.data.list do
                    retData.data.list[i].isNewMsg = true
                end
                self.chatDataList =  retData.data
            end

            self.chatDataList.headSprite = self.headSprite
            self.view:initLoopScrollViewList_chatMsg(self.chatDataList,self.curChatData,self.isBiaojiData)

            self:isCreateConversation()
        --end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
    end)
end

--2 查询是否已经创建会话
function CustomerServiceSystemModule:isCreateConversation()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/isCreateConversation?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            bundleId = Util.identifier,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if retData.data.isCreate then  --已经创建会话
                self:getImAdminUser()  -- 获取im登入数据 并登入im、 显示界面

                self.curChatData = retData.data
                self:getCustomById() -- 获取客服昵称

            else --没有创建会话
                self:getProblemType() -- 获取咨询问题 -》 选择问题 -》创建会话
            end
        else
            ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
    end )
end


--3  没有会话情况下  请求咨询问题数据
function CustomerServiceSystemModule:getProblemType()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/getProblemType?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            self.view:initSelectTypeView(retData.data) -- 显示咨询问题类型
            self:getImAdminUser() -- 获取im登入数据 并登入im 显示界面
        else
            ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
    end )
end

function CustomerServiceSystemModule:setSolveProblem(id,isSolve)
    local url ="custom/problem/addInvalidNum?"
    if isSolve then
        url ="custom/problem/addEffectiveNum?"
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. url,
        --showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            id = id
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then

        else

        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
    end )
end

--4  没有会话情况下  请求常见问题数据
function CustomerServiceSystemModule:getCustomProblem(problemType,parentId)
    if type(parentId) == "userdata" then
        parentId = nil
    end
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/problem/getCustomProblem?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            problemType = problemType,
            parentId = parentId
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            self.view:initCommonProblemView(retData.data) -- 显示咨询问题类型

            if # retData.data < 1 then
                --TODO XLQ:点击问题类型后 如果没有常见问题数据 直接创建会话
                self:getCustomConvertion()
            end
        else
            ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
            if wwwErrorData.www.text then
                local retData = wwwErrorData.www.text
                retData = ModuleCache.Json.decode(retData)
                if retData.errMsg then
                    retData = ModuleCache.Json.decode(retData.errMsg)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
                end
            end
        end
        ModuleCache.ModuleManager.destroy_module("public", "customerservicesystem")
    end )
end

function CustomerServiceSystemModule:readByChatId()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "custom/readByChatId?",
        --showModuleNetprompt = true,
        params =
        {
            uid = self.userId,
            chatIds = self.view.unreadChatIds
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        print_table(retData);
        if (retData.success) then
            if retData.data then

            end
        end
    end , function(wwwErrorData)
        print(wwwErrorData.error)
        --if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
        --    if wwwErrorData.www.text then
        --        local retData = wwwErrorData.www.text
        --        retData = ModuleCache.Json.decode(retData)
        --        if retData.errMsg then
        --            retData = ModuleCache.Json.decode(retData.errMsg)
        --            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
        --        end
        --    end
        --end
    end )
end


return CustomerServiceSystemModule



