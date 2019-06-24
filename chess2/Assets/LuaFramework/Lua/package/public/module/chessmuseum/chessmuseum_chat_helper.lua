



local class = require("lib.middleclass")
local ChatHelper = class("ChatHelper")
local list = require("list")
local ModuleCache = ModuleCache
local Time = UnityEngine.Time
local Application = UnityEngine.Application
local SoundManager = ModuleCache.SoundManager
local GameSDKInterface = ModuleCache.GameSDKInterface
local voicePath = Application.persistentDataPath .. "/voice"
local CSmartTimer = ModuleCache.SmartTimer.instance

local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local chatMgr = ModuleCache.JMsgManager
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
local CustomImageManager = ModuleCache.CustomImageManager

function ChatHelper:initialize(module)
    self.module = module
    self.modelData = module.modelData


    CustomImageManager.set_event_listener(function(fileid)
        self.module.view.input.text = fileid
        --print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@上次图片成功，发送消息",fileid)
        self:send_msg_fun(4)
    end,function(filePath)

    end)


    self.table_voice_module = ModuleCache.ModuleManager.show_module('public','table_voice')
    self.table_voice_module.forbid_auto_play = true
    self.module:subscibe_package_event("Event_TableVoice_StartPlayVoice", function(eventHead, eventData)
        if self.module.playVoiceAnim then
            self.module.playVoiceAnim(true)
        end
    end)
    self.module:subscibe_package_event("Event_TableVoice_StopPlayVoice", function(eventHead, eventData)
        if self.module.playVoiceAnim then
            self.module.playVoiceAnim(false)
        end
    end)
    self.module:subscibe_package_event("Event_TableVoice_SendVoice", function(eventHead, eventData)
        print("@@@@@@@@@eventData:",eventData)
        self.module.view.input.text = eventData
        self.pressTime = self.table_voice_module:get_record_time()
        if(self.pressTime < 1)then
            self.pressTime = 1
        else
            self.pressTime = string.format('%0.0f', self.pressTime)
        end
        self:send_msg_fun(2)
    end)

end

--msgType	1 文字	2 语音	3 表情   4 图片
function ChatHelper:send_msg_fun(msgType)
    if not self.module.selectDetailData then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈数据获取异常")
        return
    end

    if self.module.selectDetailData.sendMsgType == 1 and self.module.selectDetailData.playerRole == "MEMBER" then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("仅管理员可以发消息")
        self.module.view.input.text = ""
        return
    end
    if self.module.view.input.text and self.module.view.input.text ~= "" then
        --ModuleCache.ModuleManager.show_public_module("netprompt")

        if self.module.topMsgState == true then
            --send top msg
            if PlayerPrefsManager.GetInt("DontShowPrompt", 0) == 0 then
                ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("发送置顶消息需要花费%s体力/钻石，是否继续？",self.modelData.topMessageCost), function()
                    self:send_top_msg(self.module.view.input.text,msgType)
                    if self.module.alertDialog_toggle_inOn then
                        PlayerPrefsManager.SetInt("DontShowPrompt" ,1)
                        PlayerPrefsManager.Save()
                    end

                    self.module.topMsgState = false
                    self.module.view.openTopMsg.isOn = false
                end,function()
                    self.module.topMsgState = false
                    self.module.view.openTopMsg.isOn = false
                end,nil,true,"以后不再提示",false )
            else
                self:send_top_msg(self.module.view.input.text,msgType)
                self.module.topMsgState = false
                self.module.view.openTopMsg.isOn = false
            end

        else
            self:send_chat_msg(self.module.view.input.text, msgType)
        end

    end

    --self.module.view:setMsgPanel()
end

--===================================================================================================

--发送普通消息
function ChatHelper:send_chat_msg(content,msgType)
    local arr = string.split(content, "———————")
    if #arr > 1 then -- 聊天过滤显示新春活动提示
        content = arr[1]
    end


    if not Util.checkNameUnlawful(content) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您输入的内容非法，请重新输入")
        return
    end

    local timestamp = os.time()
    if(self.modelData.getTimeStamp)then
        timestamp = self.modelData.getTimeStamp()
    end
    chatMgr.sendGroupTextMsg(content, msgType,(self.pressTime or 0), self.modelData.roleData,function(data)
        if data.result == "0" or data.result == 0 then
            if self.module.view then
                self.module.view.input.text = ""
                if self.chatDataList == nil then
                    self.chatDataList = {}
                end

                if tonumber(data.groupId) == tonumber(chatMgr.loginData.curGroupId) then
                    data.isNewMsg = true
                    table.insert(self.chatDataList, data)
                end
                self.module.view:initLoopScrollViewList_chatMsg(self.chatDataList)
            end
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.desc)
        end
    end, timestamp)
end

--发送置顶消息
function ChatHelper:send_top_msg(content,msgType)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/addTopMessage?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.modelData.roleData.userID,
            parlorId = self.module.selectDetailData.id,
            content = content,
            msgType = msgType,
            voiceLength = string.format("%0.0f", tonumber(self.pressTime) or 0)
        }
    }
    --print_table(requestData.params, "--------------addTopMessage----------------")
    self.module:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.module.view.input.text = ""

            --获取置顶消息
            self:get_top_msg()
        else

        end
    end ,function(wwwErrorData)
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

function ChatHelper:get_top_msg()
    --self.module.view:reset(4)
    --self.module.view:setMsgPanel()
    --
    --local requestData = {
    --    baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorTopMessage?",
    --    --showModuleNetprompt = true,
    --    params =
    --    {
    --        uid = self.modelData.roleData.userID,
    --        parlorId = self.module.selectDetailData.id,
    --    }
    --}
    --self.module:http_get(requestData, function(wwwData)
    --    local retData = wwwData.www.text
    --    retData = ModuleCache.Json.decode(retData)
    --    if (retData.success) then
    --        self.module.view:initLoopScrollViewList_chatMsg(retData.data,true)
    --    else
    --
    --    end
    --end , function(wwwErrorData)
    --    print(wwwErrorData.error)
    --    if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
    --        if wwwErrorData.www.text then
    --            local retData = wwwErrorData.www.text
    --            retData = ModuleCache.Json.decode(retData)
    --            if retData.errMsg then
    --                retData = ModuleCache.Json.decode(retData.errMsg)
    --                if retData.code ~= "PARLOR_USER_NOT_FOUND" then
    --                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
    --                end
    --            end
    --        end
    --    end
    --end )
end

function ChatHelper:delete_top_msg(data)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/delTopMessage?",
        showModuleNetprompt = true,
        params =
        {
            uid = self.modelData.roleData.userID,
            parlorId = self.module.selectDetailData.id,
            messageId = data.id
        }
    }
    self.module:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            --获取置顶消息
            self:get_top_msg()
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

function ChatHelper:get_user_name()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "im/getImUser?",
        showModuleNetprompt = true,
        params = {
            bundleID = Util.identifier,
            uid = self.modelData.roleData.userID,
        },
        hideTips500Error = true
    }
    self.module:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)

        if retData.ret == 0 and type(retData.data) ~= "userdata" then
            local imPassword = self.modelData.roleData.unionId
            if retData.data.imPassword then
                imPassword  = ModuleCache.SecurityUtil.DESDecode(retData.data.imPassword, AppData.DESKey)
            end
            self.requireLoginNum = 0
            self.lastParmorId = self.module.selectDetailData.id
            self.func = function()
                chatMgr.login(retData.data.imUserName,imPassword, function(data)
                    self.requireLoginNum = self.requireLoginNum +1
                    if (data.result == "0" or data.result == 0) and self.lastParmorId == self.module.selectDetailData.id then
                        chatMgr.setLoginData(retData.data.imUserName, imPassword)
                        --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("登录成功！")
                        self:get_group_id()
                    else
                        --ModuleCache.Log.report_exception("亲友圈极光im登入失败"..self.requireLoginNum,
                        --string.format("userId:%s, imUserName:%s, unionId:%s, data.desc:%s",self.modelData.roleData.userID,retData.data.imUserName,self.modelData.roleData.unionId,data.desc), "")
                        if self.requireLoginNum <= 3 and self.lastParmorId == self.module.selectDetailData.id then
                            self.func()
                        end
                    end
                end)
            end

            self.func()
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

function ChatHelper:get_group_id()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "im/getImGroup?",
        showModuleNetprompt = false,
        params = {
            parlorId = self.module.selectDetailData.id,
            uid = self.modelData.roleData.userID,
        }
    }
    self.module:http_get(requestData, function(wwwData)
        local retData = ModuleCache.Json.decode(wwwData.www.text)
        if retData.ret == 0 then
            self.imChatRoom = retData.data.groupId
            chatMgr.setCurChatRoom(self.imChatRoom,self.module.selectDetailData)
            self:getInitChatData(self.module.selectDetailData.id)
        end
    end, function(errorData)
        print(errorData.error)
    end)
end

function ChatHelper:getInitChatData(mParlorId)
    chatMgr.getGroupTalk(function(messages)

        self.chatDataList = {}
        local temp
        for i=1,#messages do
            if type(messages[i]) == "table" then
                messages[i].isNewMsg = true
                if tonumber(messages[i].groupId) == tonumber(chatMgr.loginData.curGroupId) then
                    table.insert(self.chatDataList, messages[i])
                end

            else
                temp = ModuleCache.Json.decode(messages[i])
                if temp then
                    temp.isNewMsg = true
                    if tonumber(temp.groupId) == tonumber(chatMgr.loginData.curGroupId) then
                        table.insert(self.chatDataList, temp)
                    end
                end
            end
        end
        print("------- get group talk ----------")
        print_table(self.chatDataList)
        if ModuleCache.ModuleManager.module_is_active("public", "chessmuseum") and self.module.view then

            self.module.view:reset(5)
            self.module.view:reset(7)
            self.module.view:initLoopScrollViewList_chatMsg(self.chatDataList)
        end
    end)

end


----------------------------表情聊天---------------------------------------------
function ChatHelper:Init_faces()
    if self.initFaces then
        return
    end

    local faseItem = GetComponentWithPath(self.module.view.root, "Bottom/Child/PanelFace/Scroll View/Viewport/Content/FaceItem", ComponentTypeName.Transform).gameObject
    local spriteHolder = GetComponentWithPath(self.module.view.root, "Bottom/Child/PanelFace", "SpriteHolder")
    for i=1,20 do
        local item = ModuleCache.ComponentUtil.InstantiateLocal(faseItem, faseItem.transform.parent.gameObject)
        item.name = i
        item:SetActive(true)
        local image = GetComponentWithPath(item, "faceImg", ComponentTypeName.Image)

        if(spriteHolder) then
            image.sprite = spriteHolder:FindSpriteByName((i - 1) .. "")
        end
    end

    self.initFaces = true
end
----------------------------表情聊天---------------------------------------------end



----------------------------文字聊天---------------------------------------------
--初始化表情面板
function ChatHelper:Init_wordMsg()
    self.chatMgr = chatMgr

    self.recvTextMsg = function(data)
        if self.chatDataList == nil then
            self.chatDataList = {}
        end
        if chatMgr.loginData.curGroupId and tonumber(data.groupId) == tonumber(chatMgr.loginData.curGroupId) then
            data.isNewMsg = true
            table.insert(self.chatDataList, data)
        end

        print_table(data,"########收到消息#########")
        self.module.view:initLoopScrollViewList_chatMsg(self.chatDataList)
    end

    chatMgr.addEventListener(self.recvTextMsg,chatMgr.msgTag.groupTag)

    self.onRecvOfflineMsg = function()
        if chatMgr.isLogin and self.module.selectDetailData and self.module.selectDetailData.id  and self.imChatRoom then
            print("------------- offline action start-------------")
            self:getInitChatData()
            print("------------- offline action end-------------")
        end
    end

    chatMgr.addEventListener(self.onRecvOfflineMsg,chatMgr.msgTag.groupTag,true)
end
----------------------------文字聊天------------------------------------------end


------------------------------------------ 语音聊天------------------------------


function ChatHelper:press_up_voice(obj, arg)
    local data = {
        obj = obj,
        arg = arg,
    }
    self.module:dispatch_package_event('Event_TableVoice_OnPressUpMic', data)
end

function ChatHelper:on_drag_voice(obj, arg)
    local data = {
        obj = obj,
        arg = arg,
    }
    self.module:dispatch_package_event('Event_TableVoice_OnDragMic', data)
end

function ChatHelper:press_voice(obj, arg)
    local data = {
        obj = obj,
        arg = arg,
    }
    self.module:dispatch_package_event('Event_TableVoice_OnPressMic', data)
end

--取消播放
function ChatHelper:on_click_voice_bubble_cancel()
    if self.data then
        self.module:dispatch_package_event("Event_TableVoice_VoiceCancel", self.data)
    end
end

function ChatHelper:on_click_voice_bubble(fildid)
    self: on_click_voice_bubble_cancel()

    self.data = {
        fileid = fildid
    }
    self.module:dispatch_package_event("Event_TableVoice_VoiceComing", self.data)
end

function ChatHelper:PauseMusic()
    SoundManager.audioMusic.mute = true
end

function ChatHelper:UnPauseMusic()
    SoundManager.audioMusic.mute = false
end

function ChatHelper:on_destroy()
    if(self.table_voice_module)then
        ModuleCache.ModuleManager.destroy_module('public','table_voice')
    end
end
------------------------------------------ 语音聊天------------------------------end


return ChatHelper