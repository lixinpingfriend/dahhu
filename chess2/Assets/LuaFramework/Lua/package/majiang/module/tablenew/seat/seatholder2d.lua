
--- 座位数据
--- Created by houzhen.
--- DateTime: 2018/1/10 10:16
---
local ModuleCache = ModuleCache
local TableManager = TableManager
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
local Color = UnityEngine.Color
local CSmartTimer = ModuleCache.SmartTimer.instance
local class = require("lib.middleclass")
local modelData = require("package.public.model.model_data")
---@class SeatHolder2D
local SeatHolder2D = {}

--- 创建
function SeatHolder2D:new(view, localSeat)
    local seatHolder = {}
    seatHolder.view = view
    seatHolder.seatId = localSeat
    seatHolder.root = seatHolder.view.root
    setmetatable(seatHolder, { __index = SeatHolder2D })
    return seatHolder
end

--- 初始化
function SeatHolder2D:init(seatPosTran)
    local seatIndex = self.seatId
    local seatParent = GetComponentWithPath(seatPosTran, "Holder", ComponentTypeName.Transform).gameObject
    TableUtil.clone(self.view.cloneSeat, seatParent, Vector3.zero)
    local root = GetComponentWithPath(seatPosTran, "Holder/Seat", ComponentTypeName.Transform).gameObject
    local rootSwitcher = GetComponentWithPath(seatPosTran, "Holder/Seat", "UIStateSwitcher")
    if seatIndex == 1 or seatIndex == 4 then
        rootSwitcher:SwitchState("Left")
    elseif seatIndex == 2 then
        rootSwitcher:SwitchState("Right")
    elseif seatIndex == 3 then
        rootSwitcher:SwitchState("Top")
    end
    self.seatRoot = root
    self.seatParent = seatParent
    self:init_head_info(root, seatPosTran)
    self:init_hand()
    self:init_down()
    self:init_out()
    self:init_hua()
    self:reset()
end

--- 初始化头像相关
function SeatHolder2D:init_head_info(root, seatPosTran)
    local totalSeat = self.view.totalSeat
    local seatIndex = self.seatId
    self.seatPosTran = seatPosTran
    self.buttonNotSeatDown = GetComponentWithPath(root, "NotSeatDown", ComponentTypeName.Transform).gameObject
    self.goSeatInfo = GetComponentWithPath(root, "Info", ComponentTypeName.Transform).gameObject
    self.buttonKick = GetComponentWithPath(root, "Info/ButtonKick", ComponentTypeName.Transform).gameObject--踢人
    self.imagePlayerHead = GetComponentWithPath(root, "Info/Avatar/Mask/Image", ComponentTypeName.Image)
    self.textPlayerName = GetComponentWithPath(root, "Info/TextName", ComponentTypeName.Text)
    self.textScore =  GetComponentWithPath(root, "Info/Point/Text", ComponentTypeName.Text)
    self.imageDisconnect =  GetComponentWithPath(root, "Info/ImageStateDisconnect", ComponentTypeName.Image).gameObject
    self.disconnectTimingText =  GetComponentWithPath(root, "Info/ImageStateDisconnect/DisconnectTimingText", ComponentTypeName.Text)
    self.imageLeave =  GetComponentWithPath(root, "Info/ImageStateLeave", ComponentTypeName.Image).gameObject
    self.imageSanKou = GetComponentWithPath(root, "Info/ImageSanKou", ComponentTypeName.Transform).gameObject
    self.queSprite = GetComponentWithPath(root, "Info/QueBg/Image", ComponentTypeName.Image)
    self.QueSH = GetComponentWithPath(root, "Info/QueBg/Image", "SpriteHolder")

    self.showAdd1 = GetComponentWithPath(root, "Info/ShowAdd/1", ComponentTypeName.Transform).gameObject
    self.showAdd2 = GetComponentWithPath(root, "Info/ShowAdd/2", ComponentTypeName.Transform).gameObject
    self.showAdd3 = GetComponentWithPath(root, "Info/ShowAdd/3", ComponentTypeName.Transform).gameObject
    self.showAdd1Text = GetComponentWithPath(root, "Info/ShowAdd/1/Text", ComponentTypeName.Text)
    self.showAdd2Text = GetComponentWithPath(root, "Info/ShowAdd/2/Text", ComponentTypeName.Text)
    self.showAdd3Text = GetComponentWithPath(root, "Info/ShowAdd/3/Text", ComponentTypeName.Text)
    self.showAdd1BlueBg = GetComponentWithPath(root, "Info/ShowAdd/1/BlueBg", ComponentTypeName.Transform).gameObject
    self.showAdd2BlueBg = GetComponentWithPath(root, "Info/ShowAdd/2/BlueBg", ComponentTypeName.Transform).gameObject
    self.showAdd3BlueBg = GetComponentWithPath(root, "Info/ShowAdd/3/BlueBg", ComponentTypeName.Transform).gameObject

    self.imageBanker = GetComponentWithPath(root, "Info/ImageBanker", ComponentTypeName.Image).gameObject
    self.remainBankerText =  GetComponentWithPath(self.imageBanker, "Text", "TextWrap")
    self.huaAnimation = GetComponentWithPath(seatPosTran, "HuaTXPos", ComponentTypeName.Transform).gameObject
    self.goSpeak =  GetComponentWithPath(root, "State/Group/Speak", ComponentTypeName.Transform).gameObject
    self.beginUI =  GetComponentWithPath(root, "Begin", ComponentTypeName.Transform).gameObject
    self.chuMJPos = GetComponentWithPath(seatPosTran, "ChuMJPos", ComponentTypeName.Transform).gameObject
    self.chuTXPos = GetComponentWithPath(seatPosTran, "ChuTXPos", ComponentTypeName.Transform).gameObject
    self.enable = not (totalSeat == 3 and seatIndex == 3) and not (totalSeat == 2 and (seatIndex == 2 or seatIndex == 4))
    self.objVoice = GetComponentWithPath(self.seatRoot, "State/Group/Speak", ComponentTypeName.RectTransform).gameObject
    self.objChatBubble = GetComponentWithPath(self.seatRoot, "State/Group/ChatBubble", ComponentTypeName.RectTransform).gameObject
    self.objChatFace = GetComponentWithPath(self.seatRoot, "State/Group/ChatFace", ComponentTypeName.RectTransform).gameObject
    ---分数变动提示
    self.scoreChangeText =  GetComponentWithPath(root, "ScoreChangeText", ComponentTypeName.Text)
    self.scoreChangeText.text = ""
    self.startBalanceText = GetComponentWithPath(root, "Info/StartBalanceText", ComponentTypeName.Text)
    self.startBalanceText.gameObject:SetActive(false)
    self.anticheatHeadImage = GetComponentWithPath(root, "ImageAnticheat", ComponentTypeName.Image)
    self.anticheatEmptyHead = GetComponentWithPath(root, "EmptyAnticheat", ComponentTypeName.Transform).gameObject
    self.addGoldObj = GetComponentWithPath(root, "AddGold", ComponentTypeName.Transform).gameObject
    seatPosTran:SetActive(self.enable)
    self:on_init_head_info(root, seatPosTran)
end

function SeatHolder2D:on_init_head_info(root, seatPosTran)
    local seatIndex = self.seatId
    local maxMjNum = self.view.maxMjNum
    self.tingObj = GetComponentWithPath(self.root, "Center/Child/Ting/" .. seatIndex, ComponentTypeName.Transform).gameObject
    self.centerRandom = GetComponentWithPath(self.root, "Center/Child/ImageRandom/" .. seatIndex, ComponentTypeName.Transform).gameObject
    self.centerRandom:SetActive(self.enable)
    local seatNumObj14 = GetComponentWithPath(seatPosTran, "14", ComponentTypeName.Transform).gameObject
    local seatNumObj20 = GetComponentWithPath(seatPosTran, "20", ComponentTypeName.Transform).gameObject
    seatNumObj14:SetActive(maxMjNum == 14)
    seatNumObj20:SetActive(maxMjNum == 20)
    self.readySeatHolder = GetComponentWithPath(self.centerRandom, "Holder", ComponentTypeName.Transform)
    self.imageReady = GetComponentWithPath(self.centerRandom, "ImageReady", ComponentTypeName.Transform).gameObject
    self.randomMJPos = GetComponentWithPath(self.centerRandom, "RandomPos", ComponentTypeName.Transform).gameObject
    self.handPoint = GetComponentWithPath(seatPosTran, maxMjNum .. "/RightPoint/HandMJ", ComponentTypeName.Transform).gameObject
    self.downPoint = GetComponentWithPath(seatPosTran, maxMjNum .. "/LeftPoint", ComponentTypeName.Transform).gameObject
    self.huaPoint = GetComponentWithPath(self.centerRandom, "HuaPoint", ComponentTypeName.Transform).gameObject
    self.outPoint = GetComponentWithPath(self.centerRandom, "OutPoint", ComponentTypeName.Transform).gameObject
    self.huEffectOut = GetComponentWithPath(self.centerRandom, "Effect", ComponentTypeName.Transform).gameObject
    if(seatIndex ~= 1) then
        self.huGridParent = GetComponentWithPath(seatPosTran, "HuGrid", ComponentTypeName.Transform).gameObject
        self.huGrid = GetComponentWithPath(self.huGridParent, "Grid", ComponentTypeName.Transform).gameObject
        self.jianZiHu = GetComponentWithPath(self.huGridParent, "JianZiHu", ComponentTypeName.Image)
        self.jianZiHuSH = GetComponentWithPath(self.huGridParent, "JianZiHu", "SpriteHolder")
    end
end

--- 初始化手牌
function SeatHolder2D:init_hand()
    self.handBeginPos = self.handPoint.transform.localPosition
    self.handCloneMJ = GetComponentWithPath(self.handPoint, self.seatId .. "_InMJ", ComponentTypeName.Transform).gameObject
    if 1 == self.seatId then
        self.handCloneMJ.transform.position = GetComponentWithPath(self.root, "BottomLeft/myHandMjAnchor/originAnchor" , ComponentTypeName.Transform).position
        if 20 == self.view.maxMjNum then
            self.handCloneMJ.transform.position = GetComponentWithPath(self.root, "BottomLeft/myHandMjAnchor/originAnchor_20" , ComponentTypeName.Transform).position
        end
    end
    self.handMjBeginPos = self.handCloneMJ.transform.localPosition
    for i=1,self.view.maxMjNum - 1 do
        TableUtil.clone(self.handCloneMJ, self.handPoint, Vector3.zero)
    end
    self.handObjs = TableUtil.get_all_child(self.handPoint)
    self.handPoint:SetActive(false)
    ---@type Mj2DHeapHand
    self.mjHeapHand = require('package.majiang.module.tablenew.mj.mj2dheap_hand'):new(self.view, 1)
end

--- 初始化下张
function SeatHolder2D:init_down()
    self.downBeginPos = self.downPoint.transform.localPosition
    ---@type Mj2DHeapDown
    self.mjHeapDown = require('package.majiang.module.tablenew.mj.mj2dheap_down'):new(self.view, 3)
end

--- 初始化弃张
function SeatHolder2D:init_out()
    self.outCloneMJ = GetComponentWithPath(self.outPoint, self.seatId .. "_OutMJ", ComponentTypeName.Transform).gameObject
    self.outMjBeginPos = self.outCloneMJ.transform.localPosition
    if 2 == self.view.totalSeat then
        local pos = self.outMjBeginPos
        pos.x = (1 == self.seatId and -362 or 362)
        self.outMjBeginPos = pos
    end
    TableUtil.move_clone(self.outCloneMJ, self.view.cloneParent)
    self.outCloneMJ.transform.localScale = Vector3.New(1,1,1)
    ---@type Mj2DHeapOut
    self.mjHeapOut = require('package.majiang.module.tablenew.mj.mj2dheap_out'):new(self.view, 2)
end

--- 初始化花牌
function SeatHolder2D:init_hua()
    self.huaCloneMJ = GetComponentWithPath(self.huaPoint, self.seatId .. "_HuaMJ", ComponentTypeName.Transform).gameObject
    self.huaMjBeginPos = self.huaCloneMJ.transform.localPosition
    TableUtil.move_clone(self.huaCloneMJ, self.view.cloneParent)
    self.huaCloneMJ.transform.localScale = Vector3.New(1,1,1)
    ---@type Mj2DHeapHua
    self.mjHeapHua = require('package.majiang.module.tablenew.mj.mj2dheap_hua'):new(self.view, 4)
end

--- 点击继续游戏时重置
function SeatHolder2D:reset()
    SeatHolder2D.museumData = nil
    self.ready = false
    self.imageBanker:SetActive(false)
    self.remainBankerText.text = ""
    self.queSprite.transform.parent.gameObject:SetActive(false)
    self.imageSanKou:SetActive(false)
    self.mjHeapHua:clear()
    self.mjHeapHand:clear()
    self.mjHeapOut:clear()
    self.mjHeapDown:clear()
    self:on_reset()
end

function SeatHolder2D:on_reset()
    self.tingObj:SetActive(false)
    self.huEffectOut:SetActive(false)
    if(self.huGridParent) then
        self.huGridParent:SetActive(false)
    end
end

--- 显示听牌标志
function SeatHolder2D:show_ting_pai_tag(show)
    self.tingObj:SetActive(show)
end

--------------------------------------------- 头像相关
--- 显示庄家标志
function SeatHolder2D:show_banker_tag(show)
    self.imageBanker:SetActive(show)
end

--- 显示头像附加信息1
function SeatHolder2D:show_head_add_text1(text)
    text = text or ""
    if(text == "") then
        self.showAdd1:SetActive(false)
    else
        self.showAdd1:SetActive(true)
    end
    self.showAdd1Text.text = text
end

--- 显示头像附加信息2
function SeatHolder2D:show_head_add_text2(text)
    text = text or ""
    if(text == "") then
        self.showAdd2:SetActive(false)
    else
        self.showAdd2:SetActive(true)
    end
    self.showAdd2Text.text = text
end

--- 显示头像附加信息3
function SeatHolder2D:show_head_add_text3(text)
    text = text or ""
    if(text == "") then
        self.showAdd3:SetActive(false)
    else
        self.showAdd3:SetActive(true)
    end
    self.showAdd3Text.text = text
end

--- 显示踢人按钮
function SeatHolder2D:show_kick(show)
    self.buttonKick:SetActive(show)
end

--- 显示离开
function SeatHolder2D:show_levave(show)
    self.imageLeave:SetActive(show)
end

--- 显示断线
function SeatHolder2D:show_disconnect(show)
    self.imageDisconnect:SetActive(show)
    if show then
        self.imagePlayerHead.material = self.view.grayMat
    else
        self.imagePlayerHead.material = nil
    end
end

--- 显示三口报警
function SeatHolder2D:show_sankou(show)
    self.imageSanKou:SetActive(show)
end

--- 显示连庄数
function SeatHolder2D:show_remain_banker_num(lianzhuangnum)
    self.remainBankerText.text = "x"..tostring(lianzhuangnum)
end

--- 显示定缺标志
function SeatHolder2D:show_que(que)
    self.queSprite.transform.parent.gameObject:SetActive(true)
    self.queSprite.sprite = self.QueSH:FindSpriteByName(que .. "")
    self.queSprite:SetNativeSize()
end

--- 显示飘花
function SeatHolder2D:show_piao_hua(piaoHuaNum)
    local piaoTitles = {"飘花","不飘"}
    self:show_head_add_text2(piaoTitles[piaoHuaNum])
end

--- 玩家在座位上
function SeatHolder2D:player_on_seat(userId, seatId, data)
    self.buttonNotSeatDown:SetActive(false)
    self.goSeatInfo:SetActive(true)

    self:refresh_player_info(data.UserID)

    self:show_kick(self.view.roomType:can_kick(seatId, self))
    if(data.AppendData and data.AppendData ~= "") then
        self:set_location_data(data.AppendData)
    end

    --[[TableUtil.download_seat_detail_info(data.UserID,function(playerInfo)
        if self.view.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
            return
        end
        self:set_player_head_image(playerInfo.headImage)
    end,function(playerInfo)
        if self.view.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
            return
        end
        self:set_player_name(Util.filterPlayerName(playerInfo.playerName, 10))
        self:set_player_sex(playerInfo.gender)
        self:set_player_ip(playerInfo.ip)
        self.view:update_gps()
    end)--]]
end

---更新玩家信息
function SeatHolder2D:refresh_player_info(userId)
    self.playerId = userId
    TableUtil.download_seat_detail_info(userId,function(playerInfo)
        if self.view.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
            return
        end

        --亲友圈房间
        if TableManager.curTableData.HallID and TableManager.curTableData.HallID >0 then
            if not SeatHolder2D.museumData then
                self:get_detail(function()
                    -- 开启了防作弊   并且不是自己  不显示头像
                    if SeatHolder2D.museumData.preventionCheat == 1 and tonumber(userId) ~= tonumber(modelData.roleData.userID) and not TableManager.curTableData.isPlayBack then
                        self:set_player_head_image(modelData.defaultHead)
                    else
                        self:set_player_head_image(playerInfo.headImage)
                    end
                end)
            elseif SeatHolder2D.museumData.preventionCheat == 1 and tonumber(userId) ~= tonumber(modelData.roleData.userID) and not TableManager.curTableData.isPlayBack then -- 开启了防作弊 不显示头像   并且不是自己
                self:set_player_head_image(modelData.defaultHead)
            else
                self:set_player_head_image(playerInfo.headImage)
            end
        else
            self:set_player_head_image(playerInfo.headImage)
        end



    end,function(playerInfo)
        if self.view.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
            return
        end

        --亲友圈房间
        if TableManager.curTableData.HallID and TableManager.curTableData.HallID >0 then
            if not SeatHolder2D.museumData then
                self:get_detail(function()
                    -- 开启了防作弊   并且不是自己
                    if SeatHolder2D.museumData.preventionCheat == 1 and tonumber(userId) ~= tonumber(modelData.roleData.userID) and not TableManager.curTableData.isPlayBack then
                        self:set_player_name("***")
                    else
                        self:set_player_name(Util.filterPlayerName(playerInfo.playerName, 10), playerInfo.isRedName)
                    end
                end)
            elseif SeatHolder2D.museumData.preventionCheat == 1 and tonumber(userId) ~= tonumber(modelData.roleData.userID) and not TableManager.curTableData.isPlayBack then -- 开启了防作弊 不显示头像   并且不是自己
                self:set_player_name("***")
            else
                self:set_player_name(Util.filterPlayerName(playerInfo.playerName, 10), playerInfo.isRedName)
            end
        else
            self:set_player_name(Util.filterPlayerName(playerInfo.playerName, 10), playerInfo.isRedName)
        end


        self:set_player_sex(playerInfo.gender)
        self:set_player_ip(playerInfo.ip)
        self.view:update_gps()
    end)
end

--- 玩家离开座位
function SeatHolder2D:player_leave_seat()
    self.buttonNotSeatDown:SetActive(true)
    self.goSeatInfo:SetActive(false)
    self.imageReady:SetActive(false)
    self.playerId = "0"
    self.ready = false
    self.locationData = nil
    self.scoreChangeText.text = ""
    self.view:update_gps()
end

--- 显示准备标志
function SeatHolder2D:show_ready(show)
    self.imageReady:SetActive(show)
end

--- 设置玩家名称
function SeatHolder2D:set_player_name(name, isRedName)
    self.textPlayerName.text = Util.filterPlayerName(name, 10)
    self.textPlayerName.color = isRedName and Color.red or Color.white
end

--- 设置玩家头像
function SeatHolder2D:set_player_head_image(image)
    self.imagePlayerHead.sprite = image
end

--- 设置分数
function SeatHolder2D:set_score(score)
    score = score .. "" or ""
    self.textScore.text = score
end

---------------------------------------------end

--- 设置玩家ip
function SeatHolder2D:set_player_ip(ip)
    self.ip = ip
end

--- 设置玩家性别
function SeatHolder2D:set_player_sex(gender)
    self.gender = gender
end

--- 是否是男娃
function SeatHolder2D:is_boy()
    return self.gender == 1 or not self.gender
end

--- 是否是女娃
function SeatHolder2D:is_girl()
    return self.gender == 2
end

--- 游戏未开始时（整个牌局） --- 此时不是所有玩家都准备了
function SeatHolder2D:set_game_not_begin_ui()
    self:set_score("")
    self.beginUI:SetActive(false)
    self.seatRoot.transform:SetParent(self.readySeatHolder)
    --self.textPlayerName.transform.anchoredPosition = Vector3.New(0, 20, 0)
    self.seatRoot.transform.anchoredPosition = Vector3.New(0, 0, 0)
end

--- 游戏开始时（整个牌局）--- 或者所有人都准备了
function SeatHolder2D:set_game_begin_ui()
    self.beginUI:SetActive(true)
    self.seatRoot.transform:SetParent(self.seatParent.transform)
    --self.textPlayerName.transform.anchoredPosition = Vector3.New(0, -3, 0)
    self.seatRoot.transform.anchoredPosition = Vector3.New(0, 0, 0)
end

--- 设置位置信息
function SeatHolder2D:set_location_data(locationStr)
    local locationStrs = string.split(locationStr, ",")
    if(#locationStrs > 0) then
        self.locationData =
        {
            latitude = tonumber(locationStrs[1]),
            longitude = tonumber(locationStrs[2]),
            address = locationStrs[3],
        }
    end
end

--- 空的位置信息
function SeatHolder2D:set_empty_location_data(data)
    if(not data) then
        data = {}
    end
    if(not data.address) then
        data.address = "未开启获取位置功能"
        data.latitude = 0
        data.longitude = 0
    end
    return data
end

--- 显示语音
function SeatHolder2D:show_voice()
    self.objVoice:SetActive(true)
end

--- 隐藏语音
function SeatHolder2D:hide_voice()
    self.objVoice:SetActive(false)
end

--- 显示聊天表情
function SeatHolder2D:show_chat_face(content)
    local faceObj = TableUtil.get_all_child(self.objChatFace)
    for i=1,#faceObj do
        faceObj[i]:SetActive(i == content)
    end
    self.objChatFace:SetActive(true)
    self.objChatBubble:SetActive(false)
    if self.timeChatEventId then
        CSmartTimer:Kill(self.timeChatEventId)
        self.timeChatEventId = nil
    end
    self.timeChatEventId = self.view:subscibe_time_event(3, false, 0):OnComplete(function(t)
        self.objChatFace:SetActive(false)
    end).id
end

--- 显示聊天气泡
function SeatHolder2D:show_chat_bubble(content)
    if not content then
        return
    end
    local chatText
    if self.seatId == 1 or self.seatId == 4 then
        chatText = GetComponentWithPath(self.objChatBubble, "TextBgLeft/Text", ComponentTypeName.Text)
    elseif self.seatId == 2 or self.seatId == 3 then
        chatText = GetComponentWithPath(self.objChatBubble, "TextBgRight/Text", ComponentTypeName.Text)
    end
    chatText.text = TableUtil.cut_text(self.view.widthText,content,400)
    self.objChatFace:SetActive(false)
    self.objChatBubble:SetActive(true)
    if self.timeChatEventId then
        CSmartTimer:Kill(self.timeChatEventId)
        self.timeChatEventId = nil
    end
    self.timeChatEventId = self.view:subscibe_time_event(3, false, 0):OnComplete(function(t)
        self.objChatBubble:SetActive(false)
    end).id
end

---注册使用新action特效的Action
SeatHolder2D.newActionTexReg = 
{
    1,2,3,4,5,6
}


---播放操作的特效
function SeatHolder2D:play_action_tx(action)
    if(action == 0) then
        return
    end
    local newChuTX = TableUtil.poor("ChuTxNew", self.chuTXPos, Vector3.zero, self.view.poorObjs, self.view.clones)
    local chuimage = GetComponentWithPath(newChuTX, "Animator/WenBen", ComponentTypeName.Image)
    local imageSprite = GetComponentWithPath(newChuTX, "", "SpriteHolder")
    local image2Sprite = GetComponentWithPath(newChuTX, "ParticleSystem", "SpriteHolder")
    local chuimage1 = GetComponentWithPath(newChuTX, "Animator/GaoLiang", ComponentTypeName.Image)
    local getImage = imageSprite:FindSpriteByName(tostring(action))
    local getImage2 = image2Sprite:FindSpriteByName(tostring(action))
    local particleSystemRender = GetComponentWithPath(newChuTX, "ParticleSystem", "UnityEngine.ParticleSystemRenderer")
    newChuTX:SetActive(false)
    if(getImage and getImage2) then
        particleSystemRender.material.mainTexture = getImage2.texture 
        newChuTX:SetActive(true)
        chuimage.sprite = getImage
        chuimage1.sprite = getImage
        chuimage:SetNativeSize()
        chuimage1:SetNativeSize()
        self.view:subscibe_time_event(1, false, 0):OnComplete(function(t)
            self.view.poorObjs = TableUtil.add_poor(newChuTX, self.view.poorObjs, self.view.cloneParent)
        end)
        return newChuTX
    else
        self.view.poorObjs = TableUtil.add_poor(newChuTX, self.view.poorObjs, self.view.cloneParent)
    end    
end

---播放多个特效
function SeatHolder2D:play_multi_action_tx(actions)
    for i=1,#actions do
        local action = actions[i]
        self:play_action_tx(action)
    end
end

--- 显示刚开始随机座位时的相关
function SeatHolder2D:show_begin_random(randomSeat)
    self.randomMJ = TableUtil.poor("RandomMJ", self.randomMJPos, Vector3.zero, self.view.poorObjs, self.view.clones)
    TableUtil.set_mj(randomSeat, self.randomMJ, self.view.mjScaleSet)
    TableUtil.set_mj_bg(1, self.randomMJ, self.view.mjColorSet)
    self:show_ready(false)
end

--- 显示结束随机座位时的相关
function SeatHolder2D:show_end_random()
    self.view.poorObjs = TableUtil.add_poor(self.randomMJ, self.view.poorObjs, self.view.cloneParent)
    self.randomMJ = nil
end

--- 播放分数变动文字弹出效果
function SeatHolder2D:play_score_change_text(changeValue)
    changeValue = changeValue or 0
    if(changeValue == 0) then
        return
    end
    local rootT = self.scoreChangeText.transform
    self.scoreChangeText.text = ""
    if  changeValue > 0 then
        self.scoreChangeText.text = "+"..changeValue
    elseif  changeValue < 0 then
        self.scoreChangeText.text = ""..changeValue
    end
    rootT.localPosition = Vector3.New(0,75,0)
    local yOffset = 0
    local xOffset = 80
    if self.seatId == 3 then
        yOffset = 0
    else
        yOffset = 150
    end

    if 2 == self.seatId then
        rootT:DOLocalMoveX(-xOffset,0.5):SetEase(DG.Tweening.Ease.OutBounce):OnComplete(function()
            self.view:subscibe_time_event(1.5, false, 0):OnComplete(function()
                self.scoreChangeText.text = ""
            end)
        end)
    elseif 4 == self.seatId then
        rootT:DOLocalMoveX(xOffset,0.5):SetEase(DG.Tweening.Ease.OutBounce):OnComplete(function()
            self.view:subscibe_time_event(1.5, false, 0):OnComplete(function()
                self.scoreChangeText.text = ""
            end)
        end)
    else
        rootT:DOLocalMoveY(yOffset,0.5):SetEase(DG.Tweening.Ease.OutBounce):OnComplete(function()
            self.view:subscibe_time_event(1.5, false, 0):OnComplete(function()
                self.scoreChangeText.text = ""
            end)
        end)
    end
end

--- 显示金币余额
function SeatHolder2D:show_gold_balance(balance)
    if(balance) then
        self.startBalanceText.gameObject:SetActive(true)
        self.startBalanceText.text = balance
        self:set_score("")
    else
        self.startBalanceText.gameObject:SetActive(false)
    end
end


function SeatHolder2D:get_detail(act)
    local  cachKey = string.format("parlor/list/getParlorDetail?%s", TableManager.curTableData.HallID)
    local text = ModuleCache.PlayerPrefsManager.GetString(cachKey, "")
    if text ~= "" then
        local retData = ModuleCache.Json.decode(text)
        if(retData.success) then
            SeatHolder2D.museumData =  retData.data
            if act then
                act()
            end
        end
    else
        SeatHolder2D.museumData = {preventionCheat = 0}
        if act then
            act()
        end
    end

    --local rule = TableUtil.convert_rule(TableManager.curTableData.Rule)
    --local requestData = {
    --    baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorDetail?",
    --    showModuleNetprompt = true,
    --    params = {
    --        uid = modelData.roleData.userID,
    --        page = 1,
    --        rows = 20,
    --        id = TableManager.curTableData.HallID,
    --        gameName = rule.GameID or rule.gameId
    --    },
    --    cacheDataKey = string.format("parlor/list/getParlorDetail?%s", TableManager.curTableData.HallID),
    --    cacheDataImmediatelyCallbackAndIngoreSuccessCallback = true
    --}
    --Util.http_get(requestData, function(wwwData)
    --    local retData = wwwData.www.text
    --    retData = ModuleCache.Json.decode(retData)
    --    if(retData.success) then
    --        SeatHolder2D.museumData =  retData.data
    --        if act then
    --            act()
    --        end
    --    end
    --end, function(wwwErrorData)
    --    print(wwwErrorData.error)
    --    -- 没有缓存亲友圈详情数据 默认显示头像
    --    SeatHolder2D.museumData = {preventionCheat = 0}
    --end)
end

return SeatHolder2D