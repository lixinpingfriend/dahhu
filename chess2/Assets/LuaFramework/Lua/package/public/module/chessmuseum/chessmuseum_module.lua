





local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local ChatHelper = require("package/public/module/chessmuseum/chessmuseum_chat_helper")
local Jpush_manager = require("manager.jpush_manager")

---@class ChessMuseumModule : Module
---@field view ChessMuseumView
local ChessMuseumModule = class("chessMuseumModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local GameManager = ModuleCache.GameManager
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
local CSmartTimer = ModuleCache.SmartTimer.instance
local Time = UnityEngine.Time
local AppData = AppData

local onAppFocusCallback

local Application = UnityEngine.Application

function ChessMuseumModule:initialize(...)
    local style = PlayerPrefsManager.GetInt("MuseumUs3D",-1) --  -1 玩家没有设置样式 ， 1： 2d ， 2： 3d
    if style == -1 then
        style = require("package.public.model.model_data").roleData.parlorStyleType
    end

    if style ==2 then
        ModuleBase.initialize(self, "chessmuseum_3d_view", nil, ...)

    else
        ModuleBase.initialize(self, "chessmuseum_2d_view", nil, ...)
    end

    self.ChatHelper = ChatHelper:new(self)

    self.view.input.onValueChanged:AddListener(function(isCheck)
        if (self:is_join()) then
            if self.view.changeVoiceToggle.isOn then
                self.view.chatBarStateSwither:SwitchState("voice")
            else
                if self.view.input.text and self.view.input.text ~= "" then
                    self.view.chatBarStateSwither:SwitchState("wordsSend")
                else
                    self.view.chatBarStateSwither:SwitchState("words+")
                end
            end
        end

    end)

    self.view.input.onEndEdit:AddListener(function(isCheck)
        if (self:is_join()) then
            if self.view.changeVoiceToggle.isOn then
                self.view.chatBarStateSwither:SwitchState("voice")
            else
                if self.view.input.text and self.view.input.text ~= "" then
                    self.view.chatBarStateSwither:SwitchState("wordsSend")
                else
                    self.view.chatBarStateSwither:SwitchState("words+")
                end
            end
        end

    end)

    self.view.changeVoiceToggle.onValueChanged:AddListener(function(isCheck)
        if (self:is_join()) then
            if self.view.changeVoiceToggle.isOn then
                self.view.chatBarStateSwither:SwitchState("voice")
            else
                if self.view.input.text and self.view.input.text ~= "" then
                    self.view.chatBarStateSwither:SwitchState("wordsSend")
                else
                    self.view.chatBarStateSwither:SwitchState("words+")
                end
            end
        end

    end)

    self.view.emoticonToggle.onValueChanged:AddListener(function(isCheck)
        if (self:is_join()) then
            self.ChatHelper:Init_faces()
            self.view.facePanel:SetActive(isCheck)
        end

    end)
end

function ChessMuseumModule:on_hide(data)
    self.ChatHelper.chatMgr.clean()
    self.modelData.joinRoomMuseum = false
end

function ChessMuseumModule:on_destroy()
    self.ChatHelper.chatMgr.clean()
    self.modelData.joinRoomMuseum = false

    --self.ChatHelper.chatMgr.removeEventListener(self.ChatHelper.recvTextMsg, self.ChatHelper.chatMgr.msgTag.groupTag)
    --self.ChatHelper.chatMgr.removeEventListener(self.ChatHelper.onRecvOfflineMsg,self.ChatHelper.chatMgr.msgTag.groupTag,true)
    print("---------------------进入牌桌删除亲友圈大厅-----------------------------", self.ChatHelper.initFaces)
    self.ChatHelper.initFaces = nil
    self.ChatHelper:on_destroy()
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function ChessMuseumModule:on_module_inited()
    onAppFocusCallback = function(eventHead, eventData)
        if not self.view:is_active() then
            return
        end
        print("onAppFocusCallback : " .. tostring(eventData))
        if eventData then
            if self.ChatHelper.chatMgr.isLogin and self.selectDetailData and self.selectDetailData.id and self.ChatHelper.imChatRoom then
                self.ChatHelper:getInitChatData()
            end
        end
    end

    self:subscibe_app_focus_event(onAppFocusCallback)
end


-- 绑定module层的交互事件
function ChessMuseumModule:on_module_event_bind()
    --整个牌友圈数据刷新
	self:subscibe_module_event("chessmuseum", "Event_Update_Notice", function(eventHead, eventData)
		self:get_data_list(self.view.selectIndex)
		ModuleCache.ModuleManager.hide_module("public", "museuminfo")
		ModuleCache.ModuleManager.destroy_module("public", "rulesetting")
	end)

    --改变包间数据，不需要更新整个亲友圈
    self:subscibe_module_event("chessmuseum", "Event_Update_Box_Notice", function(eventHead, eventData)
        self.view:select_item(self.view.selectIndex,function(data)
            if(data) then
                self.selectData = data
                self:get_detail(data)
            end
        end)

        if self.selectDetailData then
            self:getParlorBoxListByParlorId(false,true)
        end

        ModuleCache.ModuleManager.hide_module("public", "museuminfo")
        ModuleCache.ModuleManager.destroy_module("public", "rulesetting")
    end)

	self:subscibe_module_event("chessmuseum", "Event_Update_OneChessMuseum", function(eventHead, eventData)
		self.view:select_item(self.view.selectIndex,function(data)
			if(data) then
				self.selectData = data
				self:get_detail(data)
			end
		end)
	end)

	self:subscibe_module_event("match","Update_CurParlor_Detail",function( eventHead, eventData )
		self:get_data_list(self.view.selectIndex, function( )
			self:dispatch_module_event("match","Event_Updata_Parlor_Detail",self.selectDetailData)
		end)

	end)

	self:subscibe_module_event("rulesetting", "Update_Power", function(eventHead, eventData)
        if self.selectDetailData then
            self.selectDetailData.diamondCostVitality=eventData;
        end
	end )

	self:subscibe_module_event("museumroominfo_to_chessmuseum", "Event_Update_roomList", function(eventHead, eventData)
		self:getRoomList(eventData)
	end )

	self:subscibe_module_event("joinroom_to_chessmuseum","Update_User_Parlor_List",function( eventHead, eventData )
        self.canHideMuseumManagerList = false
		self:get_data_list(self.view.selectIndex)
	end)

	self:subscibe_package_event("alertDialog_toggle_inOn",function( eventHead, eventData )
		self.alertDialog_toggle_inOn = eventData
	end)

	self:subscibe_module_event("jPush_manager","jPush_recv_msg",function( eventHead, eventData )
		print_table(eventData, "-------------------jPush_recv_msg----"..eventData.type)
        if not eventData.message or eventData.message == "" then
            return
        end

        --local roomInfo = ModuleCache.Json.decode(eventData.message)
        --
        --if eventData.type == "parlor_top_message_change" then
        --    --获取置顶消息
        --    self.ChatHelper:get_top_msg()
        --elseif eventData.type == "parlor_room_change_add" then
        --    --self.roomDataTab.roomTab[eventData.data.roomId] = eventData.data
        --
        --    if # self.roomDataTab.list == 1 and (tonumber(self.roomDataTab.list[1].roomId) <100000 or tonumber(self.roomDataTab.list[1].roomId) > 9999999) then
        --        table.remove(self.roomDataTab.list,1)
        --    end
        --    self.roomDataTab.list[#self.roomDataTab.list+1] = roomInfo
        --
        --    self:RefreshRoomShow()
        --elseif eventData.type == "parlor_room_change_update" then
        --    --self.roomDataTab.roomTab[eventData.data.roomId] = eventData.data
        --
        --    for i = 1,#self.roomDataTab.list do
        --        local data = self.roomDataTab.list[i]
        --        if tonumber(data.roomId) == tonumber(roomInfo.roomId) then
        --            self.roomDataTab.list[i] = roomInfo
        --            break
        --        end
        --    end
        --
        --    self:RefreshRoomShow()
        --elseif eventData.type == "parlor_room_change_delete" then
        --    --self.roomDataTab.roomTab[eventData.data.roomId] = nil
        --
        --    for i = 1,#self.roomDataTab.list do
        --        local data = self.roomDataTab.list[i]
        --        if tonumber(data.roomId) == tonumber(roomInfo.roomId) then
        --            table.remove(self.roomDataTab.list,i)
        --            break
        --        end
        --    end
        --
        --    self:RefreshRoomShow()


        if eventData.type == "parlor_fellowship_exit" then
            print(eventData.message == tostring(self.selectDetailData.orginalParlorId),"@@@@@@@终于收到推送了@@@@@@@@@@@@@",eventData.message,self.selectDetailData.orginalParlorId)
            if eventData.message == tostring(self.selectDetailData.orginalParlorId) then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈已解除联谊状态")
                self:destoryChessmuseum()
            end

        elseif eventData.type == "parlor_fellowship_diss" then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈已解除联谊状态")
            self:destoryChessmuseum()
        elseif eventData.type == "parlor_fellowship_invite" then --
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈联谊成功")
            self:get_data_list(self.view.selectIndex)

            if ModuleCache.ModuleManager.get_module("public","museumactive") then
                ModuleCache.ModuleManager.destroy_module("public", "museumactive")
            end
        end
	end)
end

function ChessMuseumModule:destoryChessmuseum()
    PlayerPrefsManager.SetInt("showMuseum", 0)
    ModuleCache.GameManager.set_application_target_frame_rate(30)
    PlayerPrefsManager.Save()

    self:dispatch_package_event("Event_Show_Hall_Anim")
    ModuleCache.ModuleManager.destroy_module("public", "chessmuseum")
    ModuleCache.GameManager.change_game_by_gameName(AppData.App_Name_Temp .. "_" .. AppData.Game_Name_Temp)
end


function ChessMuseumModule:RefreshRoomShow()
    if not self.roomDataTab then
        --请求显示房间列表
        self:getRoomList(self.selectDetailData.parlorNum)
        return
    end

    ----TODO: 龙涛 这里为什么不用一个逻辑呢    没有房间推送，没维护这个逻辑
    self.view:initLoopScrollViewList_roomList(self.roomDataTab, function(data, roomList)
        self:disposeRoomList(data, roomList)
    end)

    --self:disposeRoomList(self.roomDataTab.list)
    --print_table(self.roomDataTab, "----------initLoopScrollViewList_roomList-----------------".. #self.roomDataTab)
    --self.view:initLoopScrollViewList_roomList(self.roomDataTab)
end

-- 绑定loginModel层事件，模块内交互
function ChessMuseumModule:on_model_event_bind()

end

function ChessMuseumModule:on_show(data)
    self.data = data
    ModuleCache.GameManager.set_application_target_frame_rate(45)
	self.view:hide()
	self.getDataCount = 0
	self.modelData.joinRoomMuseum = true
	--self.museumData = data.museumData
	self.roomDataTab = nil

	AppData.App_Name_Temp = AppData.App_Name
	AppData.Game_Name_Temp = AppData.Game_Name
	ModuleCache.PlayModeUtil.config_temp = ModuleCache.PlayModeUtil.config

	--self.view.selectIndex = self:get_index_by_parlorId( PlayerPrefsManager.GetInt("museumIndex", 1) )
	-- print("---------------get------------ self.view.selectIndex:", self.view.selectIndex,PlayerPrefsManager.GetInt("museumIndex", 1))

	self:get_data_list(nil, nil, true)

	self.view.parlorWeiXin = self.modelData.parlorWeiXin or ""
	PlayerPrefsManager.SetInt("showMuseum", 1)
	PlayerPrefsManager.Save()


	self.ChatHelper:Init_wordMsg()

	self:get_parlor_cost()
	self.lastUpdateBeatTime =  Time.realtimeSinceStartup

    -- 1 展开  0 收回
    self.view.museumListGuide:SetActive(
        PlayerPrefsManager.GetInt("museumListOpenState", 0) == 0 and PlayerPrefsManager.GetInt("museumListGuide", 0) == 0
    )
    PlayerPrefsManager.SetInt("museumListGuide", 1)
end

function ChessMuseumModule:on_update_per_second()
    if self:view_is_active() then
        --定时刷新房间列表
        if self.modelData and self.modelData.roomRequest == 1 and self.modelData.roomRequestTime > 0 then
            if self.selectDetailData then
                if not self.lastUpdateBeatTime or self.lastUpdateBeatTime + self.modelData.roomRequestTime <= Time.realtimeSinceStartup then
                    self.lastUpdateBeatTime = Time.realtimeSinceStartup
                    self:getRoomList(self.selectDetailData.parlorNum, false, false)--请求刷新房间列表
                end
            end

        end


        --亲友圈列表为空的情况下 10s刷新一次亲友圈列表
        if  self.museumData and #self.museumData  == 0 then
            if not self.lastUpdateParlorListTime or self.lastUpdateParlorListTime + 10 <= Time.realtimeSinceStartup then
                self.lastUpdateParlorListTime = Time.realtimeSinceStartup
                self:get_data_list(nil,nil,nil,false)
            end
        end

    end

end

function ChessMuseumModule:get_index_by_parlorId(parlorId)
    for i, v in ipairs(self.museumData) do
        if v.parlorId == parlorId then
            return i
        end
    end
    return 1
end

function ChessMuseumModule:on_press(obj, arg)
    if obj.name == "ButtonMic" then
        self.ChatHelper:press_voice(obj, arg)
    end
end

function ChessMuseumModule:on_press_up(obj, arg)
    if (obj and obj.name == "ButtonMic") then
        self.ChatHelper:press_up_voice(obj, arg)
    end

end

--function ChessMuseumModule:on_drag(obj, arg)
--	if(obj and obj.name == "ButtonMic") then
--		self.ChatHelper:on_drag_voice( obj, arg)
--	end
--end

function ChessMuseumModule:on_begin_drag(obj, arg)
    if string.find(obj.name, "item") then
        if (arg.delta.x < 5 or arg.delta.x > -5) and (arg.delta.y > 6 or arg.delta.y < -6) then
            self.onbegin = true
            self.view.boxScrollView:OnBeginDrag(arg)
        else
            self.onbegin = false
        end
    end

end

function ChessMuseumModule:on_drag(obj, arg)
    if string.find(obj.name, "item") then
        if  self.onbegin then
            self.view.boxScrollView:OnDrag(arg)
        end
    end
end

function ChessMuseumModule:on_end_drag(obj, arg)
    if string.find(obj.name, "item") then
        if self.onbegin then
            self.view.boxScrollView:OnEndDrag(arg)
        end
    end

end

function ChessMuseumModule:on_click(obj, arg)
    print("--------------click obj:", obj.name)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj.name == "ImageClose" then
        self:destoryChessmuseum()
    elseif (obj.name == "AddItem") then
        ModuleCache.ModuleManager.show_module("public", "joinroom", { mode = 2 })
    elseif (obj.name == "clickMuseumObj") then
        local parentName = obj.transform.parent.gameObject.name
        if (string.sub(parentName, 1, 4) == "item") then
            local array = string.split(parentName, "_")
            self.view:select_item(tonumber(array[2]), function(data)
                if (data) then
                    self.selectData = data
                    self:get_detail(data)
                end
            end)
        end

    elseif (obj.name == "ButtonActive") then
        if (self:is_join()) then
            ModuleCache.ModuleManager.show_module("public", "museumactive", self.selectDetailData)
            --self.view.activeNewMsgObj:SetActive(false)
        end

    elseif (obj.name == "ButtonPlayer") then
        if (self:is_join()) then
            self.selectDetailData.ApprovalMemberCount = self.ApprovalMemberCount or 0
            ModuleCache.ModuleManager.show_module("public", "museummembers", self.selectDetailData)
        end
    elseif (obj.name == "ButtonSetting") then
        if (self:is_join()) then
            self:getParlorBoxListByParlorId(false,true,function(success)
                if success then
                    ModuleCache.ModuleManager.show_module("public", "museuminfo", { museumData = self.selectDetailData })
                else
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("数据获取失败")
                end

            end )
        end
    --elseif (obj.name == "ButtonInfo") then
    --    if (self:is_join()) then
    --        ModuleCache.ModuleManager.show_module("public", "museuminfo", self.selectDetailData)
    --    end

    elseif (obj.name == "ButtonFightLog") then
        if (self:is_join()) then
            if self.playMode then
                ModuleCache.PackageManager.update_package_version(self.playMode.package, function()
                    self:getHistoryList()
                end)
            else
                self:getHistoryList()
            end
        end

    elseif (obj.name == "FreeCreateBtn") then
        if (self:is_join()) then
            local array = string.split(obj.transform.parent.gameObject.name, "_")
            --self.view:boxPanelMove(false)
            self:ChangeBoxUI(array[2])

            if self.selectDetailData.launchRoundStatus and self.selectDetailData.launchRoundStatus == 2 then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈已暂停组局，请联系管理员！")
                return
            end

            -- 自由开房
            if not self.selectDetailData.openRoomType or self.selectDetailData.openRoomType == 1 then
                local sendData = {
                    clickType = 1,
                    showType = 2,
                    museumData = self.selectDetailData,
                    boxData = self.boxDataList[tonumber(array[2])]
                }

                ModuleCache.ModuleManager.show_module("public", "createroom", sendData)

            else--新开一桌

                local playRule = TableUtil.convert_rule(self.selectDetailData.curBoxData.playRule)
                local gameName = ""

                if playRule.gameName and playRule.gameName ~= "" then
                    gameName = playRule.gameName
                else
                    --有得rule里没有 playRule.gameName
                    local wanfaType = Config.GetWanfaIdx(playRule.GameType)
                    gameName = Config.get_create_name(wanfaType)
                end

                self.modelData.tableCommonData.tableType = 0
                self:join_room(self.selectDetailData.parlorNum, self.selectDetailData.curBoxData.boxId, gameName, playRule, self.selectDetailData.curBoxData.gameId,nil,true)--默认房间


            end

        end
    elseif (obj.name == "clickRoomObj") then
        if self.selectDetailData.launchRoundStatus and self.selectDetailData.launchRoundStatus == 2 then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈已暂停组局，请联系管理员！")
            return
        end
        self:process_join_room(obj)
    elseif (obj.name == "ButtonRanking") then
        --TODO 排行榜
        if (self:is_join()) then
            ModuleCache.ModuleManager.show_module("public", "museumranking", {museumData = self.selectDetailData, boxList = self.boxDataList})
        end

    elseif obj.name == "loadButton" then
        self.roomDataTab.currentPage = self.roomDataTab.currentPage + 1
        self:getRoomList(self.selectDetailData.parlorNum, true)
    elseif obj.name == "sendBtn" then
        if (self:is_join()) then
            self.ChatHelper:send_msg_fun(1)
        end

    elseif obj.name == "msgTex" or obj.name == "msgTex_zj" then
        --聊天泡泡
        if (self:is_join()) then
            local array = string.split(obj.transform.parent.gameObject.name, "_")
            local idx = tonumber(array[2])

            local msgData = self.view:get_chat_msg_data(idx)

            if msgData then
                print(msgData.msgType, "---------msgData.msgType-----------msgData.content:", msgData.content)

                if tonumber(msgData.msgType) == 1 then
                    ModuleCache.GameSDKInterface:CopyToClipboard(msgData.content)
                    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("文字消息复制成功")
                elseif tonumber(msgData.msgType) == 2 then
                    if self.playVoiceAnim then
                        self.playVoiceAnim(false)
                    end
                    
                    self.playVoiceAnim = function(isPlay)
                        ModuleCache.ComponentManager.GetComponent(obj.gameObject, ModuleCache.ComponentTypeName.Button).interactable = not isPlay
                        if tostring(msgData.userId) == tostring(self.modelData.roleData.userId) then
                            ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, "voicePop/voiceIcon_self/imageAnimation", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(isPlay)
                            ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, "voicePop/voiceIcon_self", ModuleCache.ComponentTypeName.Image).enabled = not isPlay
                        else
                            ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, "voicePop/voiceIcon_other/imageAnimation", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(isPlay)
                            ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, "voicePop/voiceIcon_other", ModuleCache.ComponentTypeName.Image).enabled = not isPlay
                        end
                    end
                    --下载语音播放
                    self.ChatHelper:on_click_voice_bubble(msgData.content)

                    PlayerPrefsManager.SetInt(msgData.id, 1)
                    PlayerPrefsManager.Save()

                    if tostring(msgData.userId) == tostring(self.modelData.roleData.userId) then
                        ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, "voicePop/self/voiceLength_self/Image", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(false)
                    else
                        ModuleCache.ComponentManager.GetComponentWithPath(obj.gameObject, "voicePop/other/voiceLength_other/Image", ModuleCache.ComponentTypeName.Transform).gameObject:SetActive(false)
                    end

                end
            end
        end
    elseif obj.name == "Head" then
        --聊天泡泡
        if (self:is_join()) then
            local array = string.split(obj.transform.parent.parent.parent.gameObject.name, "_")
            local idx = tonumber(array[2])
            local msgData = self.view:get_chat_msg_data(idx)

            ModuleCache.GameSDKInterface:CopyToClipboard(msgData.nickname)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已复制玩家昵称。")

        end
    elseif (obj.name == "faceImg") then
        if (self:is_join()) then
            self.view.emoticonToggle.isOn = false
            self.view.input.text = obj.transform.parent.gameObject.name
            self.ChatHelper:send_msg_fun(3)
        end

    elseif (obj.name == "otherBtn") then
        if (self:is_join()) then
            --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("敬请期待！")

            if ModuleCache.GameManager.runtimePlatform == "OSXEditor" or ModuleCache.GameManager.runtimePlatform == "WindowsEditor" then
                local data
                if math.random() < 0.3 then
                    data = ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/h.png")
                elseif math.random() < 0.6 then
                    data = ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/w.png")
                else
                    data = ModuleCache.FileUtility.ReadAllBytes(Application.dataPath .. "/Resources/xiaotu.png")
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
        end
    elseif (obj.name == "Image_msg") then
        if (self:is_join()) then
            local rawImg = ModuleCache.ComponentManager.GetComponent(obj.gameObject, ModuleCache.ComponentTypeName.RawImage)

            self.view.originalImg.texture = rawImg.texture

            self.view.originalImgObj:SetActive(true)
            self.view.originalImgRectTran.sizeDelta = ModuleCache.TextureCacheManager.GetTexture2dSize(self.view.originalImg.texture)--ModuleCache.CustomerUtil.GetTexture2dSize(self.view.originalImg.texture)
            --self.view.originalImgRectTran.sizeDelta = Vector2.New(rawImg.texture.width,rawImg.texture.height) --ModuleCache.CustomerUtil.GetTexture2d_w_h(rawImg.texure)

            local array = string.split(obj.transform.parent.gameObject.name, "_")
            local idx = tonumber(array[2])

            self.curOpenImgData = self.view:get_chat_msg_data(idx)
        end
    elseif (obj.name == "OriginalImg") then
        if (self:is_join()) then
            self.view.originalImgObj:SetActive(false)
        end
    elseif (obj.name == "shareImgBtn") then
        if (self:is_join()) then

            if self.curOpenImgData then
                local arr = string.split(self.curOpenImgData.content, "_")
                local key = self.curOpenImgData.content
                if #arr == 3 then
                    key = arr[1]
                end

                print("*******************", key, ModuleCache.CustomImageManager.CachesTexture[key])

                ModuleCache.WechatManager.share_image(0, "大胡亲友圈", ModuleCache.CustomImageManager.CachesTexture[key])
            end

        end
    elseif (obj.name == "AccBtn") then
        if (self:is_join()) then
            ModuleCache.ModuleManager.show_module("public", "museumacc", self.selectDetailData)
        end
    --elseif (obj.name == "ButtonChangeMuseum") then
    --    ModuleCache.ModuleManager.show_module("public", "museummanagerlist", { dataList = self.museumData, callBack = function(museumList,idx)
    --        self.canHideMuseumManagerList = true
    --        self.view.dataList = museumList
    --        self:by_idx_open_museum(idx)
    --    end })

    elseif (obj.name == "changeCompartmentBtn" or obj.name == "BoxInfoButton") then
        if (self:is_join()) then
            self.view:initboxListInfo()
            self.view:boxPanelMove(true)
            --self.view.ChangeboxPanel:SetActive(true)
            --@TODO:这里为什们要请求一次数据，造成打开这个界面好卡
            --self:getParlorBoxListByParlorId(PlayerPrefsManager.GetInt("SelectBoxIdx", 1))
        end

    elseif (obj.name == "hideboxPanelBtn") then
        if (self:is_join()) then
            --self.view.ChangeboxPanel:SetActive(false)
            self.view:boxPanelMove(false)
        end


    elseif (obj.name == "boxSetBtn") then
        if (self:is_join()) then
            local array = string.split(obj.transform.parent.gameObject.name, "_")
            local boxIdx = tonumber(array[2])
            self:ChangeBoxUI(boxIdx)
            ModuleCache.ComponentManager.GetComponent(obj.transform.parent.gameObject, ModuleCache.ComponentTypeName.Toggle).isOn = false
            ModuleCache.ComponentManager.GetComponent(obj.transform.parent.gameObject, ModuleCache.ComponentTypeName.Toggle).isOn = true
            ModuleCache.ModuleManager.show_module("public", "museuminfo", { museumData = self.selectDetailData,  isRuleOption = true})
        end

    elseif (obj.name == "boxDeleteBtn") then --删除包间按钮
        if (self:is_join()) then
            local array = string.split(obj.transform.parent.gameObject.name, "_")
            local boxIdx = tonumber(array[2])

            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您确认删除此楼层吗？删除后该楼层剩余的钻石会转移到圈主账户上。", function()
                self:delBoxById(self.boxDataList[boxIdx].boxId)
            end, nil)

        end

    elseif (obj.name == "CreateboxBtn" or obj.name == "addCompartmentBtn") then
        self:add_box()
    elseif (obj.name == "clickboxItem") then
        if (self:is_join()) then
            local array = string.split(obj.transform.parent.gameObject.name, "_")
            --self.view:boxPanelMove(false)
            --self.view.ChangeboxPanel:SetActive(false)
            self:ChangeBoxUI(array[2])
            ModuleCache.ComponentManager.GetComponent(obj.transform.parent.gameObject, ModuleCache.ComponentTypeName.Toggle).isOn = true
        end


    elseif (obj == self.view.changeBoxUpBtn.gameObject) then
        if (self:is_join()) then
            local tempIdx = PlayerPrefsManager.GetInt("SelectBoxIdx", 1) - 1
            self:ChangeBoxUI(tempIdx)
        end

    elseif (obj == self.view.changeBoxDownBtn.gameObject) then

        if (self:is_join()) then
            local tempIdx = PlayerPrefsManager.GetInt("SelectBoxIdx", 1) + 1
            self:ChangeBoxUI(tempIdx)
        end

    elseif obj.name == "CreateMuseumBtn" then
        self.modelData.joinRoomMuseum = true
        ModuleCache.ModuleManager.show_module("public", "joinroom",{mode =2})
    elseif obj.name == "JoinMuseumBtn" then
        self.modelData.joinRoomMuseum = true
        ModuleCache.ModuleManager.show_module("public", "joinroom",{mode =8})

    elseif obj.name == "on_offBtn" or obj.name =="showMuseumListBtn" then
        self.view:museumPanelMove()
        self.view.museumListGuide:SetActive(false)
    elseif obj.name == "StatisticsButton" then --统计按钮
       self:getDataUrl()

    elseif obj.name == "openChatBtn" then
        if (self:is_join()) then
            self.view:ChatWindowState(false)
        end

    elseif obj.name == "miniChatBtn" then
        if (self:is_join()) then
            self.view:ChatWindowState(true)
        end
    elseif obj.name == "returnRooomBtn" then
        if (self:is_join()) then
            TableManager:try_back_to_runing_table()
        end
    elseif obj.name == "CloseGuideBtn" then
        if (self:is_join()) then
            self.view.museumListGuide:SetActive(false)
        end
    elseif obj.name == "ButtonFellowShip" then
        if self.selectDetailData.playerRole ~= "OWNER" and self.selectDetailData.playerRole ~= "ADMIN" then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈正在联谊中，详情请询问管理员。")
        else
            self.view.fellowshipNewMsgObj:SetActive(false)
            ModuleCache.ModuleManager.show_module("public", "museumfellowship",self.selectDetailData)
        end
    end
end

function ChessMuseumModule:process_join_room(obj)
    if (self:is_join()) then
        local array = string.split(obj.transform.parent.parent.parent.parent.parent.gameObject.name, "_")
        local boxIdx = tonumber(array[2])
        self:ChangeBoxUI(boxIdx)

        local array2 = string.split(obj.transform.parent.gameObject.name, "_")
        local roomIdx = tonumber(array2[2])
        local roomData = self.view:get_room_data(boxIdx, roomIdx)

        if self.selectDetailData.playerRole ~= "OWNER" and self.selectDetailData.playerRole ~= "ADMIN" and roomData.roomType == 2 then
            if roomData.roleFull == 0 then
                -- 房间人满了
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("房间已满")
            else
                local playRuleString = roomData.playRule
                if roomData.playRule and type(roomData.playRule) == "userdata" then
                    playRuleString = roomData.boxData.playRule
                end
                local playRule = TableUtil.convert_rule(playRuleString)
                local gameName = ""
                self:getRoomList(self.selectDetailData.parlorNum, false, false)

                if playRule.gameName and playRule.gameName ~= "" then
                    gameName = playRule.gameName
                else
                    --有得rule里没有 playRule.gameName
                    local wanfaType = Config.GetWanfaIdx(playRule.GameType)
                    gameName = Config.get_create_name(wanfaType)
                end

                self.modelData.tableCommonData.tableType = 0
                if (roomData.roomType == 1) then
                    self:join_room(roomData.roomId, roomData.boxId, nil, playRule, roomData.boxData.gameId)
                else
                    if tonumber(roomData.roomId) < 100000 or tonumber(roomData.roomId) > 9999999 then -- "> 9999999" 是联谊虚拟圈
                        --客户端显示的假房间 显示的是馆号
                        self:join_room(self.selectDetailData.parlorNum, roomData.boxId, gameName, playRule, roomData.boxData.gameId)
                    else
                        self:join_room(roomData.roomId, roomData.boxId, nil, playRule, roomData.boxData.gameId)
                    end
                end

                print("--------self.selectDetailData.parlorNum:", self.selectDetailData.parlorNum, gameName)
            end
        else
            ModuleCache.ModuleManager.show_module("public", "museumroominfo", {
                data = roomData,
                museumData = self.selectDetailData,
                callback = function()
                    local playRule = TableUtil.convert_rule(roomData.boxData.playRule)
                    local gameName = ""
                    self:getRoomList(self.selectDetailData.parlorNum, false, false)

                    if playRule.gameName and playRule.gameName ~= "" then
                        gameName = playRule.gameName
                    else
                        --有得rule里没有 playRule.gameName
                        local wanfaType = Config.GetWanfaIdx(playRule.GameType)
                        gameName = Config.get_create_name(wanfaType)
                    end

                    self.modelData.tableCommonData.tableType = 0
                    if (roomData.roomType == 1) then
                        self:join_room(roomData.roomId, roomData.boxId, nil, playRule, roomData.boxData.gameId)
                    else
                        if tonumber(roomData.roomId) < 100000 or tonumber(roomData.roomId) > 9999999 then -- "> 9999999" 是联谊虚拟圈
                            --客户端显示的假房间 显示的是馆号
                            self:join_room(self.selectDetailData.parlorNum, roomData.boxId, gameName, playRule, roomData.boxData.gameId)--默认房间
                        else
                            self:join_room(roomData.roomId, roomData.boxId, nil, playRule, roomData.boxData.gameId)
                        end
                    end

                    print("--------self.selectDetailData.parlorNum:", self.selectDetailData.parlorNum, gameName)
                end
            })
        end
    end
end



function ChessMuseumModule:add_box()
    if (self:is_join()) then
        if #self.boxDataList < 1 then
            ModuleCache.ModuleManager.show_module("public", "museuminfo", { museumData = self.selectDetailData, createBox = true,boxNum = #self.boxDataList,isRuleOption = true })
        elseif #self.boxDataList < 5 then
            local text = "您确认要新增楼层吗？每个亲友圈最多可有5个楼层"
            ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(text, function()
                ModuleCache.ModuleManager.show_module("public", "museuminfo", { museumData = self.selectDetailData, createBox = true,isRuleOption = true })
            end, nil)
        else
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("每个亲友圈最多可创建5个楼层")
        end

    end
end

--通过切换包间Toggle.isOn 来切换包间
function ChessMuseumModule:ChangeBoxUI(idx)
    if not self.view.boxToggles[tonumber(idx)].isOn then
        -- 通过大厅改变大厅的toggle.isOn来实现切换
        self.view.boxToggles[tonumber(idx)].isOn = true
    end
end

--切换包间
function ChessMuseumModule:change_box(idx)

    idx = idx or PlayerPrefsManager.GetInt("SelectBoxIdx", 1)
    if #self.boxDataList < 1 then
        return
    end

    if idx < 1 or idx > #self.boxDataList then
        idx = 1
    end
    self:ChangeBoxUI(idx)
    self.view.changeBoxDownBtn.interactable = idx < #self.boxDataList
    self.view.changeBoxUpBtn.interactable = idx > 1


    --TODO XLQ 切换包间把包间数据更新到亲友圈详情数据里
    self.selectDetailData.curBoxData = self.boxDataList[idx]
    self.selectDetailData.playRule = self.selectDetailData.curBoxData.playRule
    self.selectDetailData.payNum = self.selectDetailData.curBoxData.payNum
    self.selectDetailData.payType = self.selectDetailData.curBoxData.payType
    self.selectDetailData.roundCount = self.selectDetailData.curBoxData.roundCount
    self.selectDetailData.playerCount = self.selectDetailData.curBoxData.playerCount
    --self.selectDetailData.gameId = self.selectDetailData.curBoxData.gameId

    self:getParlorAccount(self.selectDetailData.curBoxData.gameId)

    print_table(self.selectDetailData, "~~~~~~切换包间idx:" .. idx)
    local arr = string.split(self.selectDetailData.curBoxData.gameId, "_")
    if #arr > 1 then
        AppData.App_Name = arr[1]
        AppData.Game_Name = arr[2]
        ModuleCache.GameManager.change_game_by_gameName(self.selectDetailData.curBoxData.gameId, true)
        --ModuleCache.GameManager.select_province_name_not_record(AppData.App_Name)
        --local getConfig = ModuleCache.PlayModeUtil.getProvinceByAppName(AppData.App_Name)
        --ModuleCache.PlayModeUtil.config = require(getConfig.modName)
        self.playMode = ModuleCache.PlayModeUtil.getInfoByGameName(AppData.Game_Name)
        local _, wanfaName = Config.GetWanfaIdxByRule(self.selectDetailData.playRule, self.selectDetailData.curBoxData.gameId)
        self.selectDetailData.curBoxData.wanfaName = tostring(wanfaName)
    end

    self.selectDetailData.curBoxData.idx = idx

    self.view.compartmentWanfaNameTex.text = idx  .. "楼"--#self.boxDataList - idx + 1 .. "楼"

    PlayerPrefsManager.SetInt("SelectBoxIdx", idx)
    PlayerPrefsManager.Save()
    if idx == 1 then
        self.view.boxScrollView.verticalNormalizedPosition = 1
    else
        self.view.boxScrollView.verticalNormalizedPosition = 1 - idx / #self.boxDataList
    end


    if self.selectDetailData.curBoxData.playRule == "" and self.selectDetailData.playerRole == "OWNER" then
        ModuleCache.ModuleManager.show_module("public", "museuminfo", { museumData = self.selectDetailData,isRuleOption = true })

    end
    --print_traceback("~~~~~~~~~~~~~~~"..idx,self.view.boxScrollView.verticalNormalizedPosition)
end

function ChessMuseumModule:by_idx_open_museum(idx)
    idx = idx or 1
    self.view:select_item(tonumber(idx), function(data)
        if (data) then
            self.selectData = data
            self:get_detail(data)
        end
    end)
end

--function ChessMuseumModule:InitShareMuseum()
--    ModuleCache.TextureCacheManager.loadTexFromCacheOrDownload(self.selectDetailData.qrCodeImg, function(err, tex)
--        if err then
--            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("加载失败！")
--        else
--			self.selectDetailData.qrCodeSpr = tex
--			ModuleCache.ModuleManager.show_module("public", "sharemuseum",self.selectDetailData)
--        end
--    end )
--end

function ChessMuseumModule:get_parlor_cost()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorCost?",
        --showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
        },
        cacheDataKey = string.format("parlor/list/getParlorCost?%s", ModuleCache.AppData.get_app_and_game_name()),
        cacheDataImmediatelyCallbackAndSuccessCallback = true
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            self.modelData.addParlorCost = retData.data.addCost    --创建亲友圈费用
            self.modelData.topMessageCost = retData.data.topMessageCost--亲友圈置顶消息费用

            self.modelData.roomRequest = retData.data.roomRequest    --自动刷新房间列表开关    0关  1开
            self.modelData.roomRequestTime = retData.data.roomRequestTime--自动刷新房间列表时间

            self.modelData.timeStampOffset = retData.data.serverTime - os.time()
            self.modelData.getServerTime = function()
                if self.modelData.timeStampOffset then
                    if self.modelData.timeStampOffset > 0 then
                        return os.date("%Y-%m-%d %H:%M:%S", os.time() + self.modelData.timeStampOffset)
                    else
                        return os.date("%Y-%m-%d %H:%M:%S", os.time() - self.modelData.timeStampOffset)
                    end

                else
                    return os.date("%Y-%m-%d %H:%M:%S")
                end

            end

            self.modelData.getTimeStamp = function()
                if self.modelData.timeStampOffset then
                    if self.modelData.timeStampOffset > 0 then
                        return os.time() + self.modelData.timeStampOffset
                    else
                        return os.time() - self.modelData.timeStampOffset
                    end

                else
                    return os.time()
                end

            end
        else

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

function ChessMuseumModule:get_data_list(index, act, canUseCacheData,showModuleNetprompt)
    if (not index) then
        index = 1
    end
    if not showModuleNetprompt then
        showModuleNetprompt = true
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getUserParlorList?",
        showModuleNetprompt = showModuleNetprompt,
        params = {
            uid = self.modelData.roleData.userID,
            all = 1,
        }
    }
    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            if AppData.Is_Independent_App then
                local data = {}
                for i = 1, #retData.data do
                    if self:independent_app_is_need_show_parlor(retData.data[i].gameId) then
                        table.insert(data, retData.data[i])

                        if retData.data[i].boxGameNameList then
                            local boxList ={}
                            local tempBox = nil
                            for j = 1, #retData.data[i].boxGameNameList do
                                tempBox = retData.data[i].boxGameNameList[j]
                                if self:independent_app_is_need_show_parlor(tempBox.gameId) then
                                    table.insert(boxList, tempBox)
                                end
                            end

                            retData.data[i].boxGameNameList = boxList
                        end
                    end
                end
                self.museumData = data
            else
                self.museumData = retData.data
            end
            local hasJoinMuseum = false
            for i = 1,#self.museumData do
                if not self.museumData[i].isShowRecommend then
                    hasJoinMuseum = true
                end
            end

            --if #self.museumData == 0 or not hasJoinMuseum then
            --    PlayerPrefsManager.SetInt("showMuseum", 0)
            --    PlayerPrefsManager.Save()
            --    ModuleCache.ModuleManager.destroy_module("public", "chessmuseum")
            --
            --    if ModuleCache.ModuleManager.module_is_active("public", "museummanagerlist") then
            --        ModuleCache.ModuleManager.get_module("public", "museummanagerlist"):on_show({ dataList = self.museumData, callBack = function(museumList,idx)
            --            self.view.dataList = museumList
            --            self:by_idx_open_museum(idx)
            --            self.canHideMuseumManagerList = true
            --        end })
            --    else
            --        ModuleCache.ModuleManager.show_module("public", "museummanagerlist", { dataList = self.museumData, callBack = function(museumList,idx)
            --            self.view.dataList = museumList
            --            self:by_idx_open_museum(idx)
            --            self.canHideMuseumManagerList = true
            --        end })
            --    end
            --    return
            --end
            --
            --if ModuleCache.ModuleManager.module_is_active("public", "museummanagerlist") then
            --    ModuleCache.ModuleManager.get_module("public", "museummanagerlist"):on_show({ dataList = self.museumData, callBack = function(museumList,idx)
            --        self.view.dataList = museumList
            --        self:by_idx_open_museum(idx)
            --        self.canHideMuseumManagerList = true
            --    end })
            --end

            self.view:initLoopScrollViewList(self.museumData)
            -- print(index,"---------------get------------ self.view.selectIndex:", self.view.selectIndex)
            --TODO XLQ 修复 修改亲友圈设置 重新获取亲友圈列表时记录上次选择的亲友圈 不正确的bug


            self.view.selectIndex = self:get_index_by_parlorId(PlayerPrefsManager.GetInt("museumIndex", 1))
            index = self.view.selectIndex
            -- print(index,"---------------get------------ self.view.selectIndex:", self.view.selectIndex,PlayerPrefsManager.GetInt("museumIndex", 1))

            self.view:select_item(index, function(data)
                if (data) then
                    self.selectData = data
                    self:get_detail(data, act, canUseCacheData)

                    self.view:setNoDataState(true)
                else--没有亲友圈
                    if not self.view:is_active() then
                        self.view:show()
                        if self.data and self.data.callback then
                            self.data.callback()
                        end
                    end

                    self.view:museumListState(true)
                    self.view:setNoDataState(false)


                end
            end)
        end
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
    end)
end

function ChessMuseumModule:get_detail(data, act, canUseCacheData)
	self.view:initLoopScrollViewList_chatMsg({},false)
    local _parlorId = data.id
    if data.fellowshipType == 2 or data.fellowshipType == 3 then --fellowshipType (integer, optional): 亲友圈类型 0普通 1联谊虚拟圈 2联谊发起圈 3联谊副圈 ,
        _parlorId = data.masterParlorId
    end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorDetail?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			platformName = GameManager.customPlatformName,
			assetVersion = GameManager.appAssetVersion,
			page = 1,
			rows = 20,
			id = _parlorId,
			gameName = data.gameId
		},
        cacheDataKey = string.format("parlor/list/getParlorDetail?%s", data.parlorNum),
        cacheDataImmediatelyCallbackAndSuccessCallback = true
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.getDataCount = 0

            retData.data.orginalParlorId = data.id--原始圈id
            retData.data.orginalParlorNum = data.parlorNum--原始圈号

            retData.data.memberCount_orginal =  retData.data.memberCount--原始圈人数
            retData.data.parlorName_orginal =  retData.data.parlorName--原始圈名
            retData.data.parlorLogo_orginal =  retData.data.parlorLogo--原始圈头像
            retData.data.playerRole_orginal =  retData.data.playerRole--原始圈身份


            local disposeDetail = function ()
                self.selectDetailData = retData.data
                self.view:get_detail( self.selectDetailData)
                --TODO XLQ:切换玩法移到获取包间列表后
                --local arr = string.split(self.selectDetailData.gameId, "_")
                --if #arr > 1 then
                --	AppData.App_Name = arr[1]
                --	AppData.Game_Name = arr[2]
                --	ModuleCache.GameManager.select_province_name_not_record(AppData.App_Name)
                --	local getConfig = ModuleCache.PlayModeUtil.getProvinceByAppName(AppData.App_Name)
                --	ModuleCache.PlayModeUtil.config = require(getConfig.modName)
                --	self.playMode = ModuleCache.PlayModeUtil.getInfoByGameName(AppData.Game_Name)
                --end


                --if(self.selectData.parlorLogo) then
                --	self.selectDetailData.imageHead = self.selectData.parlorLogo
                --else
                --	self.selectDetailData.imageHead = self.selectData.headImg
                --end

                ---- 如果没有设置玩法需要强制设置玩法
                --if self.selectDetailData.playRule == "" and self.selectDetailData.playerRole == "OWNER" then
                --	ModuleCache.ModuleManager.show_module("public", "museuminfo",{museumData = self.selectDetailData,isRuleOption = true})
                --end



                self:get_approval_member()

                --获取包间列表
                self:getParlorBoxListByParlorId(canUseCacheData)


                --获取当前玩法是否限免
                --self.get_freeByGameId()

                --Jpush_manager.setTagWithPyq("parlor_"..retData.data.parlorNum)

                --print("-----------------self.selectDetailData:",self.selectDetailData,self.selectDetailData.id)
                if self.selectDetailData and self.selectDetailData.id then

                    if self.ChatHelper.chatMgr.isLogin then
                        self.ChatHelper:get_group_id()
                    else
                        self.ChatHelper:get_user_name()
                    end
                end

                if not self.view:is_active() then
                    self.view:show()
                    if self.data and self.data.callback then
                        self.data.callback()
                    end
                end

                if act then
                    act()
                end
            end


            if retData.data.fellowshipParlorList and #retData.data.fellowshipParlorList >0 then --联谊虚拟圈
                for i =1,#retData.data.fellowshipParlorList do
                    if retData.data.fellowshipParlorList[i].fellowshipType == 2 then
                        retData.data.initiatorParlorId = retData.data.fellowshipParlorList[i].slaveParlorId   --发起联谊 圈id
                    end
                end
                retData.data.masterParlorId = retData.data.fellowshipParlorList[1].masterParlorId  -- 联谊虚拟圈id
                Jpush_manager.setTagWithFellowShip({"parlorId_"..retData.data.masterParlorId})

                -- 当前是虚拟圈，需要请求原始圈的详情
                requestData.params.id = data.id
                requestData.cacheDataKey = nil
                self:http_get(requestData, function(wwwData_orginal)
                    local retData_orginal = wwwData_orginal.www.text
                    retData_orginal = ModuleCache.Json.decode(retData_orginal)
                    if(retData_orginal.success) then
                        retData.data.memberCount_orginal = retData_orginal.data.memberCount --原始圈人数
                        retData.data.parlorName_orginal = retData_orginal.data.parlorName --原始圈名
                        retData.data.parlorLogo_orginal = retData_orginal.data.parlorLogo--原始圈头像
                        retData.data.playerRole_orginal = retData_orginal.data.playerRole--原始圈身份

                        disposeDetail()
                    end

                end,function(wwwErrorData)

                end)

            else -- 普通圈
                Jpush_manager.setTagWithFellowShip({"parlorId_"..retData.data.orginalParlorId})
                disposeDetail()
            end

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
		if self.getDataCount < 3 then
			self.getDataCount = self.getDataCount + 1
			self:get_detail(data, act)
        else
            ModuleCache.Log.report_exception("亲友圈详情获取异常",  ModuleCache.Log.format_pbc_table_tojson(requestData), "")
        end
	end)
end

function ChessMuseumModule:is_join()
    if not self.selectDetailData then
        return false
    end
    if (self.selectDetailData.playerRole == "APPLYING") then
        self.view:select_item(self.view.selectIndex, function(data)
            if (data) then
                self.selectData = data
                self:get_detail(data)
            end
        end)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("正在审核中，请稍后！")
    elseif (self.selectDetailData.playerRole == "VISITOR") then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您尚未加入此亲友圈，是否申请加入？"), function()
            ModuleCache.ModuleManager.show_module("public", "museumjoin", self.selectData.parlorNum)
        end, nil)
    end
    return self.selectDetailData.playerRole ~= "VISITOR" and self.selectDetailData.playerRole ~= "APPLYING"
end

function ChessMuseumModule:update_notice(data)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/room/updateNotice?",
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = data.id,
			notice = data.notice,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			if(data.showMsg) then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(AppData.MuseumName .."公告修改成功")
			end
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(AppData.MuseumName .."公告修改失败")
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

function ChessMuseumModule:getHistoryList()
    if not self.playMode then
        self.playMode = ModuleCache.PlayModeUtil.getInfoByGameName(AppData.Game_Name)
    end
    local initData = {}
    initData.museumData = self.selectDetailData
    ModuleCache.ModuleManager.show_module("public","gamehistory",initData)
end

function ChessMuseumModule:get_new_list(list)
    local newList = {}
    local maxNum = 0
    if (not self.selectDetailData or (self.selectDetailData and self.selectDetailData.playerRole ~= "OWNER" and self.selectDetailData.playerRole ~= "ADMIN")) then
        maxNum = 20
    else
        maxNum = 100
    end
    if (#list < maxNum) then
        return list
    else
        for i = 1, maxNum do
            table.insert(newList, list[i])
        end
        return newList
    end
end

function ChessMuseumModule:get_approval_member()
	self.view.membersNewMsgObj:SetActive(false)
    local _playerRole =self.selectDetailData.playerRole
    if self.selectDetailData.fellowshipParlorList and #self.selectDetailData.fellowshipParlorList>0 then -- 联谊圈 成员小红点功能 用原始身份
        _playerRole =self.selectDetailData.playerRole_orginal
    end

    if self.selectDetailData and (_playerRole ~= "OWNER" and _playerRole ~= "ADMIN") then
        return
    end


	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/getApprovalMember?",
		-- showModuleNetprompt = true,
        hideTips500Error = true,
		params =
		{
			uid = self.modelData.roleData.userID,
			parlorId = self.selectDetailData.orginalParlorId
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
            self.ApprovalMemberCount = #retData.data

			self.view.membersNewMsgObj:SetActive(  self.ApprovalMemberCount > 0)
			self.view.membersNewMsgTex.text =   self.ApprovalMemberCount
		end
	end , function(wwwErrorData)
		print(wwwErrorData.error)
	end )
end

--获取亲友圈房间列表
function ChessMuseumModule:getRoomList(parlorNum, isloadMore, showModuleNetprompt)
    ----TODO XLQ 修复 亲友圈打开创建亲友圈界面并切换玩法后 请求房间列表引起的问题
    --if AppData.get_app_and_game_name() ~= self.selectDetailData.gameId then
    --	return
    --end

    if showModuleNetprompt == nil then
        showModuleNetprompt = true
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/room/getGameParlorRoomAllPage?",
        showModuleNetprompt = showModuleNetprompt,
        params = {
            uid = self.modelData.roleData.userID,
            parlorId = self.selectDetailData.id,
            slaveParlorId = self.selectDetailData.orginalParlorId
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            --TODO XLQ :修复自动刷新房间列表请求收到回包前 切换了亲友圈 房间列表显示上一个亲友圈房间列表的问题
            if parlorNum ~= self.selectDetailData.parlorNum then
                return
            end

            local data
            if AppData.Is_Independent_App then
                data = {
                    list = {}
                }
                for i = 1, #(retData.data.list) do
                    if self:independent_app_is_need_show_parlor(retData.data.list[i].gameId) then
                        table.insert(data.list, retData.data.list[i])
                    end
                end
            else
                data = retData.data
            end

            --TODO XLQ :当新建包间后在为更新生成包间列表前 自动刷新房间列表时 得到的房间数据包括了新包间的  引起的异常
            if #self.boxDataList ~= #(data.list) then
                print("~~~~~~~~圈主创建了新包间，刷新包间列表~~~~~~~~~~~~~~~")
                self:getParlorBoxListByParlorId(false,true)
                return
            end

            --table.sort(retData.data.list, function(a,b)
            --    return a.boxId > b.boxId
            --end)
            self.roomDataTab = data

            if self.roomDataTab.status then--亲友圈状态 0正常 1联谊中 2已解散 3已退出
                if self.roomDataTab.status == 2 or self.roomDataTab.status == 3 then
                    self:destoryChessmuseum()
                    return
                end
            end

            self.view:initLoopScrollViewList_roomList(self.roomDataTab, function(data, roomList)
                self:disposeRoomList(data, roomList)
            end)

        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
        ModuleCache.ModuleManager.hide_public_module("netprompt")
    end)

end

-- 处理房间列表
function ChessMuseumModule:disposeRoomList(boxData, roomList)
    local data = boxData

    if #roomList == 0 then
        roomList[1] = {
            --包间数据
            boxData = boxData,
            roomType = 2,
            curRound = 0,
            boxId = data.boxId,
            roundCount = data.roundCount,
            playerCount = data.playerCount,
            playRule = data.playRule,
            players = {},
            roomId = "0" .. self.selectDetailData.parlorNum
        }
    else
        --local allFull = true
        --local hasCanJoinFastRoom = false
        ----TODO XLQ:可以中途加入的游戏在开局后 需要创建一个新房间
        --local needCreateNewRoom = (AppData.Game_Name == "ZHAJINHUA" or AppData.Game_Name == "BIJI" or AppData.Game_Name == "BULLFIGHT" or AppData.Game_Name == "SANGONG")
        --
        --for i = 1, #roomList do
        --	if roomList[i].playerCount > #roomList[i].players then
        --		allFull = false
        --		if roomList[i].roomType == 2 then
        --			hasCanJoinFastRoom = true
        --		end
        --	end
        --
        --	if roomList[i].curRound  == 0  then
        --		needCreateNewRoom = false
        --	end
        --end
        --
        --if allFull or not hasCanJoinFastRoom or needCreateNewRoom then
        --	table.insert(roomList,1,{
        --		roomType =2,
        --		curRound = 0,
        --		roundCount =self.selectDetailData.roundCount,
        --		playerCount = self.selectDetailData.playerCount,
        --		players = {},
        --		playRule = self.selectDetailData.playRule,
        --		roomId = "0"..self.selectDetailData.parlorNum
        --	})
        --end

        local notNullRoom = true

        for i = 1, #roomList do

            if #roomList[i].players == 0 then
                notNullRoom = false
            end
        end

        if notNullRoom then
            table.insert(roomList, 1, {
                boxData = boxData,
                roomType = 2,
                curRound = 0,
                boxId = data.boxId,
                roundCount = data.roundCount,
                playerCount = data.playerCount,
                players = {},
                playRule = data.playRule,
                roomId = "0" .. self.selectDetailData.parlorNum
            })
        end
    end

    for i = 1, #roomList do
    if roomList[i].playerCount == #roomList[i].players then
    roomList[i].roleFull = 0
    else
    roomList[i].roleFull = 1
    end
    end
end

-- 独立App过滤牌友圈和包间
function ChessMuseumModule:independent_app_is_need_show_parlor(gameId)
    if string.find(gameId, ModuleCache.AppData.Const_App_Name) then
        return true
    end

    if string.find(gameId, ModuleCache.AppData.Poker_App_Name) then
        if ModuleCache.AppData.Const_App_Name ~= "AQMJ" then
            for i = 1, #AppData.AQMJ_Only_Have_AppGameName do
                if gameId == AppData.AQMJ_Only_Have_AppGameName[i] then
                    return false
                end
            end
        end
        return true
    end
end

function ChessMuseumModule:join_room(roomId, boxId, gameName, playRule, appGameName, hideCircle,EnterNewRoom)
    if appGameName then
        local arr = string.split(appGameName, "_")
        if #arr > 1 then
            ModuleCache.GameManager.select_province_name_not_record(arr[1])
        end
    end
    ModuleCache.PackageManager.update_package_version(self.playMode.package, function()
        TableManager:join_room({ roomId = roomId, boxId = boxId, gameName = gameName, playRule = playRule, EnterNewRoom  = EnterNewRoom}, hideCircle)
    end)
end

---一定要获取了包间数据，才能显示包间
function ChessMuseumModule:getParlorBoxListByParlorId(userCacheData, resetBoxListInfo,callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorBoxListByParlorId?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            parlorId = self.selectDetailData.id,
        }
    }

    if userCacheData then
        requestData.cacheDataKey = string.format("parlor/list/getParlorBoxListByParlorId?%s", self.selectDetailData.id)
        requestData.cacheDataImmediatelyCallbackAndSuccessCallback = true
    end



    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        --if ModuleCache.ModuleManager.module_is_active("public", "museummanagerlist")  and self.canHideMuseumManagerList then
        --    ModuleCache.ModuleManager.hide_module("public", "museummanagerlist")
        --end

        self.view.dontClickObj:SetActive(false)

        if (retData.success) then
            --table.sort(retData.data, function(a,b)
            --    return a.boxId > b.boxId
            --end)

            if AppData.Is_Independent_App then
                local data = {}
                for i = 1, #retData.data do
                    if self:independent_app_is_need_show_parlor(retData.data[i].gameId) then
                        table.insert(data, retData.data[i])
                    end
                end
                self.boxDataList = data
            else
                self.boxDataList = retData.data
            end

            -- 包间为空，创建包间
            if #self.boxDataList == 0 then
                self:add_box()
                -- 如果没有设置玩法需要强制设置玩法
                --elseif self.selectDetailData.playRule == "" and self.selectDetailData.playerRole == "OWNER" then
                --    ModuleCache.ModuleManager.show_module("public", "museuminfo", { museumData = self.selectDetailData,isRuleOption = true })
            else
                self.view:initboxList({ data = self.boxDataList, updateBoxName = function(boxData, boxInputName)
                    self:updateParlorBox(boxData, boxInputName)
                end,
                    changeBox = function(idx)
                        self:change_box(idx)
                    end })
                self:change_box()
                self:getRoomList(self.selectDetailData.parlorNum, false, false)
                --是否需要帅西包间详情数据
                if resetBoxListInfo then
                    self.view:initboxListInfo( self.boxDataList)
                end
            end

        end
        if callback then
            callback(retData.success)
        end
    end, function(wwwErrorData)
        --if ModuleCache.ModuleManager.module_is_active("public", "museummanagerlist") then
        --    ModuleCache.ModuleManager.hide_module("public", "museummanagerlist")
        --end

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

        if callback then
            callback(false)
        end
    end)
end

function ChessMuseumModule:updateParlorBox(boxData, boxInputName)
    if boxInputName.text == "" then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入包间名")
        return
    end
    if boxData.boxName == boxInputName.text then
        return
    end

    if not Util.checkNameUnlawful(boxInputName.text) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您输入的内容非法，请重新输入")
        boxInputName.text = boxData.boxName
        return
    end

    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/room/updateParlorBox?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            boxId = boxData.boxId,
            boxName =  boxInputName.text,
            playRuleName = "",
        }
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("修改楼层名称成功！")
            self:getParlorBoxListByParlorId()
        end
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
    end)
end


--获取包间余额 gameName 包间玩法名
function ChessMuseumModule:getParlorAccount(gameName)
    self.view.AccNumTex.text ="---"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorAccount?",
        --showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            parlorId = self.selectDetailData.id,
            gameName = gameName
        },
        cacheDataKey = string.format("parlor/list/getParlorAccount?%s", self.selectDetailData.id ..gameName),
        cacheDataImmediatelyCallbackAndSuccessCallback = true
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then

            if self.selectDetailData.curBoxData and self.selectDetailData.curBoxData.gameId == gameName then
                self.view.AccNumTex.text = Util.filterPlayerGoldNum(tonumber(retData.data.cards) + tonumber(retData.data.coins))
                self.selectDetailData.curBoxData.costData = retData.data
            else
                self.view.AccNumTex.text ="---"
            end

        end
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
    end)
end


--删除包间
function ChessMuseumModule:delBoxById(boxId)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/delBoxById?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            boxId = boxId
        },
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            for i =1, #self.boxDataList do
                if self.boxDataList[i].boxId == boxId then
                    table.remove(self.boxDataList,i)
                    break
                end
            end

            self:getParlorBoxListByParlorId(false,true)
        end
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
    end)
end

--获取亲友圈统计功能url
function ChessMuseumModule:getDataUrl()
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getDataUrl?",
        showModuleNetprompt = true,
        params = {
            uid = self.modelData.roleData.userID,
            parlorId = self.selectDetailData.id,
        },
    }

    self:http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
            local data = {
                link = retData.data,
                showType = 0,
                style = 4
            }
            ModuleCache.ModuleManager.show_module("public", "webview", data);
        end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
    end)
end

return ChessMuseumModule



