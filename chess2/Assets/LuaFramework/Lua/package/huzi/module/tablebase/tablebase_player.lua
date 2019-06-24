local class       = require("lib.middleclass")
local TablePlayer = class("TablePlayer")

local ModuleCache = ModuleCache
local GameObject = UnityEngine.GameObject
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local GameSDKInterface = ModuleCache.GameSDKInterface
local ComponentUtil = ModuleCache.ComponentUtil
local SmartTime = LuaBridge.SmartTimer.instance
local SoundManager = require("package.huzi.module.tablebase.sound_manager")
local Manager = require("package.public.module.function_manager")
local TableBase_Card = require("package.huzi.module.tablebase.tablebase_card")
local Sequence = DG.Tweening.DOTween.Sequence
local Tween = DG.Tweening
local coroutine = require("coroutine")
local TableUtil = require("package.public.table_util")

--覆盖相同操作的声音和特效显示
TablePlayer.actionOverride = {}
TablePlayer.soundPath = "glzp"
TablePlayer.chatPath = "NormalChat"

function TablePlayer:SetModule(module)
	self.module = module
	self.view = module.view
end

--初始化
function TablePlayer:Init(objRoot, index)
	self.PlayerIndex = index
    self.curTableData = TableManager.phzTableData
    self.objRoot = objRoot     --根节点
    self.objTran = objRoot.transform
    local tran = self.objTran
    self.chutx     = Manager.FindObject(self.objRoot, "TeXiaoHolder/ChuTX")
    self.chutxImg1 = Manager.GetImage(self.chutx, "Animator/WenBen")
    self.chutxImg2 = Manager.GetImage(self.chutx, "Animator/GaoLiang")
    self.chutxImg3 = Manager.GetImage(self.chutx, "Animator/WenBen/FangSheGuang")
    self:InitSeat()
    self:InitCards()
    self:InitGameStateEvent()
	self:InitEx()
end 

--扩展的初始化
function TablePlayer:InitEx()
    
end

---------------------------------------------------座位信息控制----------------------------------------
--初始化头像座位信息
function TablePlayer:InitSeat()
    self.objSeat = Manager.FindObject(self.objRoot, "Seat")    --座位信息
    self.seat = {
		root = self.objSeat,
		rootPosion = self.objSeat.transform.position,
        objNone = Manager.FindObject(self.objSeat, "NotSeatDown"),
        objNoneB = Manager.GetButton(self.objSeat, "NotSeatDown"),
        objInfo = Manager.FindObject(self.objSeat, "Info"),
        objState = Manager.FindObject(self.objSeat, "State"),
        head = Manager.GetImage(self.objSeat, "Info/Avatar/Mask/Image"),
        btnHead = Manager.GetButton(self.objSeat, "Info/Avatar/Image"),
        name = Manager.GetText(self.objSeat, "Info/TextName"),
        highlight = Manager.FindObject(self.objSeat, "Info/HighLight"),
        score = Manager.GetText(self.objSeat, "Info/Point/Text"),
        leave = Manager.FindObject(self.objSeat, "Info/ImageStateLeave"),
        offline = Manager.FindObject(self.objSeat, "Info/ImageStateDisconnect"),
        kick = Manager.GetButton(self.objSeat, "Info/ButtonKick"),
        banker = Manager.FindObject(self.objSeat, "Info/ImageBanker"),
        IconJinBi = Manager.FindObject(self.objSeat, "Info/IconJinBi"),
        objHuxi = Manager.FindObject(self.objSeat, "Info/Huxi"),
        Xing = Manager.FindObject(self.objSeat, "Info/Xing"),
        huxi = Manager.GetText(self.objSeat, "Info/Huxi/Text"),
		objClock = Manager.FindObject(self.objSeat, "Info/Clock"),
        clockNum = Manager.FindObject(self.objSeat, "Info/Clock/Image/Text"):GetComponent("Text"),
        ready = Manager.FindObject(self.objSeat, "State/ImageReady"),
        speak = Manager.FindObject(self.objSeat, "State/Speak"),
        objBubble = Manager.FindObject(self.objSeat, "State/ChatBubble"),
        textChat = Manager.GetText(self.objSeat, "State/ChatBubble/Image/Text"),
		objFace = Manager.FindObject(self.objSeat, "State/ChatFace"),
		objOutLine = Manager.FindObject(self.objSeat, "Info/LeftTime"),
		txtOutLine = Manager.GetText(self.objSeat, "Info/LeftTime/txtLeftTime"),
    }

	self:show_huxi(false)

    Manager.AddButtonListener(
        self.seat.objNoneB,
        function()
            self.module:invite_friend()
        end
    )   
    Manager.AddButtonListener(
        self.seat.btnHead,
		function()
			if self.module:is_qinyou_cheat() and self.PlayerIndex ~= 1 then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主已开启防作弊功能，无法查看玩家信息。")
				return
			end
			if self.playerInfo and not self.curTableData.isPlayBack then
				--位置信息放在module中
				local locations = self.module.locationDatas
				if locations then
					for k,v in pairs(locations) do		--下标从0开始 不能用#取长度
						local localSeatID = self.module:get_local_seat(k)
						if localSeatID == self.PlayerIndex then
							self.playerInfo.locationData = locations[k]
						end
					end
				end
                ModuleCache.ModuleManager.show_module("public", "playerinfo", self.playerInfo)
            end
        end
    )   
end

--初始化醒的信息
function TablePlayer:InitXing(root)
	self.xing = self.xing or {}
	self.xing.root = root
    self.xing.cardTemp = root.transform:Find("Card/Temp").gameObject
    self.xing.AniTran = root.transform:Find("Card/AniRoot").transform
    self.xing.posAniStart = self.xing.AniTran.localPosition
    self.xing.CountRoot = root.transform:Find("Count")
	self.xing.txtCount = root.transform:Find("Count/imgNum"):GetComponent("TextWrap")
	self.xing.imaType1 = root.transform:Find("Type/WenBen"):GetComponent("Image")
	self.xing.imaType2 = root.transform:Find("Type/GaoLiang"):GetComponent("Image")
end

--设置座位信息
function TablePlayer:SetSetaMsg(msg)
    self.seatData = msg
end


function TablePlayer:Reset()
	self.lastXiaCount = 0
	self.view.laseChuCard = nil
end

--- 刷新角色信息
function TablePlayer:refresh_player_info(data)
    if data then
        if not self.curTableData.isPlayBack then
            if not data.UserID or data.UserID == "0" then
				self.playerInfo = nil
				self.curTableData.seatUserIdInfo[data.SeatID .. ""] = nil
                ComponentUtil.SafeSetActive(self.seat.objInfo, false)
                ComponentUtil.SafeSetActive(self.seat.objState, false)
				ComponentUtil.SafeSetActive(self.seat.objNone, true)
            else
                if (not self.curTableData.seatUserIdInfo) then
                    self.curTableData.seatUserIdInfo = {}
                end

				local bQinyouCheat = self.module:is_qinyou_cheat()		--亲友圈防作弊是否开启

                self.curTableData.seatUserIdGo = self.curTableData.seatUserIdGo or {}
                if not self.playerInfo then
                    self.playerInfo = {}
                end


                if data.Balance and data.Balance > 0 and not self.module.Msg_Table_GameStateNTF then
                    self:update_score(data.Balance)
                end
                
                self.playerInfo.playerId = data.UserID
                self.curTableData.seatUserIdInfo[data.SeatID .. ""] = data.UserID
                self.curTableData.seatUserIdGo[data.UserID .. ""] = self.seat
                ComponentUtil.SafeSetActive(self.seat.objInfo, true)
                ComponentUtil.SafeSetActive(self.seat.objState, true)
                ComponentUtil.SafeSetActive(self.seat.objNone, false)

                --TODO XLQ:亲友圈快速组局 房主没有踢人功能  
                if data.SeatID ~= 0 and self.curTableData.SeatID == 0 and self.module.roundStart == nil  and self.curTableData.RoomType ~= 2 then
                    self:show_kick(self.module.model.Msg_Table_GameStateNTFNew == nil)
                    Manager.AddButtonListener(
                        self.seat.kick,
                        function()
                            self.module.model:request_kick_player(data.UserID)
                        end
                )
                else
                    self:show_kick(false)
                end

                --TODO XLQ:亲友圈 允许在线玩家踢出离线玩家     data.State 用户状态信息：0、在线；1、离开（休息）；2、离线
                if self.curTableData.RoomType == 2 and (not DataPaoHuZi.Msg_Table_GameStateNTF or DataPaoHuZi.Msg_Table_GameStateNTF.RealyRound == 0)  then
                    if  DataPaoHuZi.Msg_ReportStateNTF_Table and 
                    DataPaoHuZi.Msg_Table_GameStateNTF == nil and
                    DataPaoHuZi.Msg_ReportStateNTF_Table[data.SeatID] and 
                    tonumber(DataPaoHuZi.Msg_ReportStateNTF_Table[data.SeatID].State) == 2 then
                        self:show_kick(not (self.module:is_all_ready() and not DataPaoHuZi.Msg_Table_GameStateNTF ))
                        Manager.AddButtonListener(
                        self.seat.kick,
                        function()
                            self.module.model:request_kick_player(data.UserID)
                        end
                        )
                    end
                end
                


                self:show_clock(false)
                self.IndexOfDownInfo = self.IndexOfDownInfo or 0
                self.IndexOfDownInfo = self.IndexOfDownInfo + 1
                local IndexOfDownInfo = self.IndexOfDownInfo

                TableUtilPaoHuZi.download_seat_detail_info(
                    data.UserID,
                    function(playerInfo)
                        if not playerInfo then
                            return
                        end

                        if IndexOfDownInfo ~= self.IndexOfDownInfo then
                            return
                        end

                        if not self.module.view or not self.playerInfo then
                            return
						end
						if bQinyouCheat and self.playerInfo.playerId ~= TableManager.curTableData.UserID then
							local bundlePath = "public/module/hall/public_hall.atlas"
							local assetName = "1538015536245微信-头像-1"
							self.seat.head.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
						else
							self.seat.head.sprite = playerInfo.headImage
						end
						self.playerInfo.spriteHeadImage = self.seat.head.sprite
						self.seat.head.gameObject:SetActive(true)
                    end,
                    function(playerInfo)
                        if not self.module.view or not self.playerInfo then
                            return
                        end

                        if IndexOfDownInfo ~= self.IndexOfDownInfo then
                            return
                        end

						if bQinyouCheat and self.playerInfo.playerId ~= TableManager.curTableData.UserID then
							self.seat.name.text = "***"
						else
							self.seat.name.text = string.gsub(Util.filterPlayerName(playerInfo.playerName,10), "%.", "")
						end
                        
                        self.man = playerInfo.gender == 1
                        self.ip = playerInfo.ip
                        if self.playerInfo then
                            self.playerInfo.ip = playerInfo.ip
                            self.playerInfo.playerName = playerInfo.playerName
                            self.playerInfo.gender = playerInfo.gender
                        end
                    end
            )
            end
        else

            ComponentUtil.SafeSetActive(self.seat.objInfo, true)
            ComponentUtil.SafeSetActive(self.seat.objState, false)
            ComponentUtil.SafeSetActive(self.seat.objNone, false)
            self.playerInfo = self.playerInfo or {}
            self.playerInfo.playerId = data.userId

			if self.seat.head and data.userId then
				TableUtil.get_player_info(data.userId .. "",nil,function(playerInfo)
					self.seat.head.sprite = playerInfo.headImage
					self.seat.head.gameObject:SetActive(true)
					self.seat.name.text = string.gsub(Util.filterPlayerName(playerInfo.playerName,10), "%.", "")    
				end)
			end
            self:show_light(false)
            self:show_banker(false)

        end
    else
        ComponentUtil.SafeSetActive(self.seat.objInfo, false)
        ComponentUtil.SafeSetActive(self.seat.objState, false)
		ComponentUtil.SafeSetActive(self.seat.objNone, true)
		self:StartCalcLeftTime(-1)
    end
end

---隐藏出张
--false则隐藏上一次的出张
--true则隐藏本玩家出张(回放用)
function TablePlayer:hide_chuzhang(bTrueHide)
	if bTrueHide then
		pcall(function (  )					--莫名其妙的BUG 查不到 先加异常处理
			self.card.chu:Show(false)
		end)
		
	else
		pcall(function (  )
			self.view.laseChuCard:Show(false) -- 莫名其妙的BUG 查不到 先加异常处理
		end)
	end
end

--开始计算离开时间
function TablePlayer:StartCalcLeftTime(time)
	if self.show_leftTIme_coroutine then
        coroutine.stop(self.show_leftTIme_coroutine)
		self.show_leftTIme_coroutine = nil
	end
	
	if time < 0 or time > 99999999 then
		self.seat.objOutLine:SetActive(false)
		return
	end


	self.seat.objOutLine:SetActive(true)
	self.seat.objOutLine.transform:SetAsLastSibling()
	self.seat.highlight.transform:SetAsLastSibling()
	self.timeLeft = time
	self.show_leftTIme_coroutine = coroutine.create(function ()
		while 1 == 1 do
			local m = math.floor(self.timeLeft / 60)
			local s = self.timeLeft % 60
			local mStr = m >= 10 and  tostring(m)..":" or ("0"..tostring(m)..":")
			local sStr = s >= 10 and tostring(s) or ("0"..tostring(s))
			local timeStr = mStr..sStr
			if self.seat.txtOutLine == nil then
				break
			end
			self.seat.txtOutLine.text = timeStr
			self.timeLeft = self.timeLeft + 1
			coroutine.wait(1)
		end
	end)
	coroutine.resume( self.show_leftTIme_coroutine)
end

---显示醒
---@param b boolean
function TablePlayer:show_xing(b)

    if not self.seat.Xing then
        return
    end
    self.seat.Xing.gameObject:SetActive(b)
    if self.PlayerNum == 3 then
        self.seat.Xing.gameObject:SetActive(false)
    end
end

---显示离线
---@param b boolean
function TablePlayer:show_offline(b)
	if self.PlayerIndex == 1 then
		return
	end
    self.seat.offline:SetActive(b)
end

--- 显示离开
--- @param b boolean
function TablePlayer:show_leave(b)
    self.seat.leave:SetActive(b)
end

---显示准 备
---@param b boolean
function TablePlayer:show_ready(b)
    self.seat.ready:SetActive(b)
    if self.module.modelData.tableCommonData.tableType == 1 then
        self.seat.ready:SetActive(false)
    end
end

---显示高亮
---@param b boolean
function TablePlayer:show_light(b)
    self:show_clock(b)
    self.seat.highlight:SetActive(b)
end

---显示庄家
---@param b boolean
function TablePlayer:show_banker(b)
    self.seat.banker:SetActive(b)
end

--- 更新位置信 息
function TablePlayer:update_location_data(data)
    if not self.playerInfo then
        self.playerInfo = {}
    end
    self.playerInfo.locationData = data
end


--- 播放短 语
function TablePlayer:play_shot_voice(index)
    if self.module.view.openVoice then
        TableUtilPaoHuZi.print("播放短语    ", index)
        local strSex = not self.man and "M_" or "F_"
        local name = strSex .. "chat_" .. index
        local path = self.chatPath .. '/' .. name
        SoundManager:play_sound(path, name)
    end
end

--- 显示聊天文字
function TablePlayer:show_chat_bubble(text)
    Manager.SetActive(self.seat.objBubble, true)
    self.seat.textChat.text = text
    Manager.SetActive(self.seat.textChat.gameObject, true)

    self.module:start_lua_coroutine(function ()
        coroutine.wait(3)

        Manager.SetActive(self.seat.objBubble, false)
        Manager.SetActive(self.seat.textChat.gameObject, false)
    end)
end

--- 显示聊天表情
function TablePlayer:show_chat_face(index)
    if not self.seat.face[index] then
        return
    end
    self.selfFaceList = self.selfFaceList or {}
    table.insert(self.selfFaceList, index)
    self.XunHuanFace_coroutine = self.XunHuanFace_coroutine or self.module:start_lua_coroutine(
        function()
            while true do
                if #self.selfFaceList > 0 then
                    local dex = self.selfFaceList[1]
                    table.remove(self.selfFaceList, 1)
                    Manager.SetActive(self.seat.objFace, true)
                    Manager.SetActive(self.seat.face[dex], true)
                    coroutine.wait(3) 
                    Manager.SetActive(self.seat.objFace, false)
                    Manager.SetActive(self.seat.face[dex], false)
                end
                coroutine.wait(0.05) 
            end
        end
    )
end

--- 显示语音
function TablePlayer:show_voice(show)
    Manager.SetActive(self.seat.speak, show)
end

---更新分数
---@param score number
function TablePlayer:update_score(score)
	local str = TableUtil.GetStringNum(score)
	self.seat.score.text = str
	if self.module.Msg_Table_UserStateNTF and self.module.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
		ComponentUtil.SafeSetActive(self.seat.IconJinBi, true)
	end 
end

---  显示踢人
function TablePlayer:show_kick(b)
    ComponentUtil.SafeSetActive(self.seat.kick.gameObject, b)

    if TableManager:cur_game_is_gold_room_type() then
        ComponentUtil.SafeSetActive(self.seat.kick.gameObject, false)
    end
end


---显示倒计时闹钟
---@param b boolean
function TablePlayer:show_clock(b)
    if self.curTableData.isPlayBack then
        self.seat.objClock:SetActive(false)
        return
    end

    if self.module.Msg_Table_GameStateNTF and self.module.Msg_Table_GameStateNTF.result == 1 then
        self.seat.objClock:SetActive(false)
        return
    end

    self.seat.objClock:SetActive(b)
    
    if self.show_clock_coroutine then
        coroutine.stop(self.show_clock_coroutine)
        self.show_clock_coroutine = nil
    end

    if not b then
        return
    end

    if not self.module.Msg_Table_GameStateNTF then
        return
    end

    local time = self.module.Msg_Table_GameStateNTF.IntrustRestTime

    local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
    if TableManager:cur_game_is_gold_room_type() then
        
    else
        time = 15
    end

    self.show_clock_coroutine = self.module:start_lua_coroutine(function ()
        self.indexofccsa = self.indexofccsa or 0
        self.indexofccsa = self.indexofccsa + 1


        for i=time,1,-1 do
            self:set_clock_num(i)

            local indexofccsa = self.indexofccsa
            coroutine.wait(1)
            if indexofccsa ~= self.indexofccsa then
                break
            end
            self.seat.objClock:SetActive(true)
            if i <= 5 then
                SoundManager:play_clock()
            end
            if self.module.Msg_Table_GameStateNTF and self.module.Msg_Table_GameStateNTF.result ~= 0 or self:has_actionWhat(6) then
                self.seat.objClock:SetActive(false)
                return
            end
        end
        --if not self.module.view.openShake then
        --    ModuleCache.GameSDKInterface:ShakePhone(1000)
        --end
        self.seat.objClock:SetActive(false)
    end)
end

--- 判断是否有动作ID
function TablePlayer:has_actionWhat(id)
    local data = DataPaoHuZi.Msg_Table_GameStateNTF

    for i = 1, #data.player do

        if data.action then
            for j = 1, #data.action do
                if data.action[j].action == id then
                    return true
                end
            end
        end
    end

    return false
end

---设置倒计时闹钟数字
---@param num number
function TablePlayer:set_clock_num(num)
    self.seat.clockNum.text = num
end

---更新胡息数
---@param huxi number
function TablePlayer:update_huxi()
    self:SetRealHuXi()

    if not self.huxi then
        self.huxi = 0
    end
    self:show_huxi(true)
    if DataPaoHuZi.Msg_Table_GameStateNTFNew and DataPaoHuZi.Msg_Table_GameStateNTFNew.result == 2 then
        return
    end
    self.seat.huxi.text = self.huxi .. "胡"
end

--- 显示胡息
function TablePlayer:show_huxi(show)
    ComponentUtil.SafeSetActive(self.seat.objHuxi, show)
	ComponentUtil.SafeSetActive(self.seat.huxi.gameObject, show)
	if self.PlayerIndex == 4 then
		ComponentUtil.SafeSetActive(self.seat.objHuxi, false)
	end
end

function TablePlayer:SetRealHuXi()
    if self.curData then
        local hu_xi = 0

        for i=1,#self.curData.xia_zhang do
            local kan = self.curData.xia_zhang[i]
            hu_xi = hu_xi + kan.hu_xi
        end
		self.huxi = hu_xi
    else
        self.huxi = 0
    end
end

---更新托管
---@param huxi number
function TablePlayer:update_tuoguan()
    if not self.seat.tuoguanz then
        return
    end

    self.seat.tuoguanz.gameObject:SetActive(false)
    self.seat.tuoguany.gameObject:SetActive(false)

    local tuoguan = nil
    if self.seatIndex == 2 then
        tuoguan = self.seat.tuoguanz
    end

    if self.seatIndex == 3 then
        tuoguan = self.seat.tuoguany
    end

    if self.seatIndex == 1 then
        return
    end

    if self.curData and self.curData.IntrustState then
        tuoguan.gameObject:SetActive(self.curData.IntrustState ~= 0)
    end
end

-------------------------------------牌局内操作----------------------------------------
--初始化所有牌(除手牌)
function TablePlayer:InitCards()
    self.card = self.card or {}
	self:InitChuCards()
    self:InitQiCards()
    self:InitTingCards()
	self:InitXiaCards()
	self:InitShouCards()
    self:InitOperaCards()
end

--初始化出张
function TablePlayer:InitChuCards()
	if self.card.chu == nil then
        local obj = Manager.FindObject(self.objRoot, "ChuZhang")
        self.card.chu = TableBase_Card:new()
        self.card.chu:Init(obj, Huzi_Card_Type.Chu)    
        self.card.chu.startPos = obj:GetComponent("RectTransform").position
    end
    self.card.chu:Show(false)
    self.card.chuBg1 = Manager.FindObject(self.objRoot, "ChuZhang/Image/1")
    self.card.chuBg2 = Manager.FindObject(self.objRoot, "ChuZhang/Image/2")
end

--初始化弃张
function TablePlayer:InitQiCards()
    self.card.qi = self.card.qi or {}
    for i=1, HuziConfig.MAX_QI_COUNT do
        if self.card.qi[i] == nil then
            local obj = Manager.FindObject(self.objRoot, "QiZhangHolder/" .. i)
            self.card.qi[i] = TableBase_Card:new()
            self.card.qi[i]:Init(obj, Huzi_Card_Type.Qi)
        end
        self.card.qi[i]:Show(false)    
    end
end

--初始化听张
function TablePlayer:InitTingCards()
    if self.card.ting == nil then
        local objRoot = Manager.FindObject(self.objRoot, "TingPai/")
        self.card.ting = {}
		self.card.ting.root = objRoot
		local objAllHu = Manager.FindObject(self.objRoot, "TingPai/AllHu")
		self.card.ting.objAllHu = objAllHu
    end
    
    for i=1, HuziConfig.MAX_TING_COUNT do
        if self.card.ting[i] == nil then
            local obj = Manager.FindObject(self.objRoot, "TingPai/grid/" .. i)
            self.card.ting[i] = TableBase_Card:new()
            if obj == nil then
                print("obj = nil  Index = " .. i)
            end
            self.card.ting[i]:Init(obj, Huzi_Card_Type.Qi)    
        end
        self.card.ting[i]:Show(false)
    end
end

--初始化下张
function TablePlayer:InitXiaCards()
	self.card.xia = self.card.xia or {}
	for i=1, HuziConfig.MAX_XIA_COUNT do
		if self.card.xia[i] == nil then
			local objXiaRoot = Manager.FindObject(self.objRoot, "XiaZhangHolder/" .. i)
			self.card.xia[i] = {}
			self.card.xia[i].root = objXiaRoot
			for j=1,4 do
				local obj = Manager.FindObject(self.objRoot, "XiaZhangHolder/" .. i .. "/" .. j)
				self.card.xia[i][j] = TableBase_Card:new()
				self.card.xia[i][j]:Init(obj, Huzi_Card_Type.Xia)
			end    
		end
		self.card.xia[i].root:SetActive(false)
	end
end

--设置下张值
function TablePlayer:SetXiaData(nIndex, xiaData)
    if nIndex <= 0 or nIndex > HuziConfig.MAX_XIA_COUNT then
        return
    end
    
    self:SetSetCard(self.card.xia[nIndex], xiaData.pai, xiaData.is_gray)
    self.card.xia[nIndex].root:SetActive(true)
end

--初始手张(回放用)
function TablePlayer:InitShouCards()
	self.card.shou = self.card.shou or {}
	for i=1, HuziConfig.MAX_XIA_COUNT do
		if self.card.shou[i] == nil then
			local objShouRoot = Manager.FindObject(self.objRoot, "ShouZhangHolder/" .. i)
			self.card.shou[i] = {}
			self.card.shou[i].root = objShouRoot
			for j=1,4 do
				local obj = Manager.FindObject(self.objRoot, "ShouZhangHolder/" .. i .. "/" .. j)
				self.card.shou[i][j] = TableBase_Card:new()
				self.card.shou[i][j]:Init(obj, Huzi_Card_Type.Xia)
			end    
		end
		self.card.shou[i].root:SetActive(false)
	end
end

-- 刷新自己的手张
function TablePlayer:refreshShouZhang(shouData)
	local nIndex = 1
	local nCount = #shouData
    for i=1, HuziConfig.MAX_XIA_COUNT do
        if i <= nCount then
			self:SetShouData(nIndex, shouData[i])
		else
			if nIndex <= HuziConfig.MAX_XIA_COUNT then
				self.card.shou[nIndex].root:SetActive(false)
			end
		end
		nIndex = nIndex + 1
    end
end

--设置手张值(回放用)
function TablePlayer:SetShouData(nIndex, shouData)
    if nIndex <= 0 or nIndex > HuziConfig.MAX_XIA_COUNT then
        return
    end
	local nCount = #shouData.pai
	local values = {}
	local is_grays = {}
	for i=1,nCount do
		values[i] = shouData.pai[i].pai
		is_grays[i] = shouData.pai[i].is_gray
	end
	
    self:SetSetCard(self.card.shou[nIndex], values, shouData.is_gray)
    self.card.shou[nIndex].root:SetActive(true)
end


--设置一堆牌(最多4张)
function TablePlayer:SetSetCard(tablecards, values, is_gray)
    local nCount = #values
    for i=1,4 do
        if i <= nCount then
            tablecards[i]:Show(true)
			tablecards[i]:SetData(values[i])
			if is_gray ~= nil and is_gray[i] == true then
				tablecards[i]:SetGray(true)
			else
				tablecards[i]:SetGray(false)
			end
        else
            tablecards[i]:Show(false)
        end
    end
    tablecards.root:SetActive(true)
end

--初始化操作张
function TablePlayer:InitOperaCards()
    if self.card.opera == nil then
        self.card.opera = {}
        local root = Manager.FindObject(self.objRoot, "PinZhangHolder")
        self.card.opera.root = root
        self.card.opera.startPos = root.transform.localPosition
    end
    
    for i=1, HuziConfig.MAX_OPERA_COUNT do
        if self.card.opera[i] == nil then
            local objOperaRoot = Manager.FindObject(self.objRoot, "PinZhangHolder/Holder/" .. i)
            self.card.opera[i] = {}
            self.card.opera[i].root = objOperaRoot
            for j=1,4 do
                local obj = Manager.FindObject(self.objRoot, "PinZhangHolder/Holder/" .. i .. "/" .. j)
                self.card.opera[i][j] = TableBase_Card:new()
                self.card.opera[i][j]:Init(obj, Huzi_Card_Type.Chu)
            end
        end
        self.card.opera[i].root:SetActive(false)
    end
end

--刷新数据
function TablePlayer:UpdateCards(data)
	if not TableManager.phzTableData.isPlayBack then
		self:refreshXiaZhang(data.xia_zhang)
		self:refreshQiZhang(data.qi_zhang)
	else
		self:UpdateCards_PlayBack()
	end
end

--回放刷新数据
function TablePlayer:UpdateCards_PlayBack()
	local data = self.module.Msg_Table_GameStateNTF
	if data.result ~= 0 or self.module:has_ActionHu() then
		self:refreshShouZhang({})
		return
	end
	for i=1, #data.player do
		local localSeatID = self.module:get_local_seat(i - 1)
		if localSeatID == self.PlayerIndex then
			self:refreshXiaZhang(data.player[i].xia_zhang)
			self:refreshQiZhang(data.player[i].qi_zhang)
		end
	end
end

-- 刷新自己的 下张
function TablePlayer:refreshXiaZhang(xiaData)
    local nCount = #xiaData
    for i=1, HuziConfig.MAX_XIA_COUNT do
        if i <= nCount then
            self:SetXiaData(i, xiaData[i])
        else
            self.card.xia[i].root:SetActive(false)
        end
    end
end

-- 刷新自己的 弃张
function TablePlayer:refreshQiZhang(qiData)
    local nCount = #qiData
    for i=1, HuziConfig.MAX_QI_COUNT do
        if i <= nCount then
            self.card.qi[i]:Show(true)
            self.card.qi[i]:SetData(qiData[i])
        else
            self.card.qi[i]:Show(false)
        end
    end
end

function TablePlayer:refresh_TingZhang(tingData)
	if self.module.Msg_Table_GameStateNTF.result ~= 0 then
		self.card.ting.root:SetActive(false)
        return
	end
    if tingData == nil or #tingData <= 0 then
        self.card.ting.root:SetActive(false)
        return
    end
    self:InitTingCards()
	local nCount = #tingData
	if nCount < 20 then
		for i=1, nCount do
			self.card.ting[i]:SetData(tingData[i])
			local nLeft = self.module:GetLeftCardCount(tingData[i])
			self.card.ting[i]:AddTingCount(nLeft)
			self.card.ting[i]:Show(true)
		end
	end
	self.card.ting.objAllHu:SetActive(nCount >= 20)
	if self.module:has_ActionHu() then
		self.card.ting.root:SetActive(false)
	else
		self.card.ting.root:SetActive(true)
	end
end 

--添加GameState的Action事件监听
function TablePlayer:AddGameStateEvent(nEventNum, handlerEvent)
    self.GameStateEvent = self.GameStateEvent or {}
    self.GameStateEvent[nEventNum] = handlerEvent
end

function TablePlayer:FireGameStateEvent(nActionID, data)
    if self.GameStateEvent and self.GameStateEvent[nActionID] then
        self.GameStateEvent[nActionID](data)
    end
end

--初始化GameState的Action事件监听
function TablePlayer:InitGameStateEvent()
    self:AddGameStateEvent(HuziAction.Chi, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.Peng, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.WeiOrSao, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.KaiZhao, handler(self,self.GameEvent_KaiZhao))
    self:AddGameStateEvent(HuziAction.Ti, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.Hu, handler(self,self.GameEvent_Hu))
    self:AddGameStateEvent(HuziAction.Qi, handler(self,self.GameEvent_Qi))
    self:AddGameStateEvent(HuziAction.Chu, handler(self,self.GameEvent_Chu))
    self:AddGameStateEvent(HuziAction.FanJiang, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.KaiZhaoChongZhao, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.GuoSao, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.SaoChuang, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.DangDi, handler(self,self.GameEvent_DangDi))
    self:AddGameStateEvent(HuziAction.SaoChuangChongZhao, handler(self,self.GameEvent_ShowOpearCard))
    self:AddGameStateEvent(HuziAction.ChongZhao, handler(self,self.GameEvent_ShowOpearCard))
	self:AddGameStateEvent(HuziAction.ChuZhangShouHui, handler(self,self.GameEvent_ChuZhangShouHui))
	self:AddGameStateEvent(HuziAction.Guo, handler(self,self.GameEvent_Guo))
	self:AddGameStateEvent(HuziAction.QiHu, handler(self,self.GameEvent_JustPlayEffect))
	self:AddGameStateEvent(HuziAction.BiPai, handler(self,self.GameEvent_ShowOpearCard))
	self:AddGameStateEvent(HuziAction.MoPai, handler(self,self.GameEvent_MoPai))
	self:AddGameStateEvent(HuziAction.PingHu, handler(self,self.GameEvent_Hu))
	self:AddGameStateEvent(HuziAction.ZiMo, handler(self,self.GameEvent_Hu))
    self:AddGameStateEvent(HuziAction.TianHu, handler(self,self.GameEvent_Hu))
	self:AddGameStateEvent(HuziAction.DiHu, handler(self,self.GameEvent_Hu))
	self:AddGameStateEvent(HuziAction.SanLongWuKan, handler(self,self.GameEvent_Hu))
	self:AddGameStateEvent(HuziAction.JiePao, handler(self,self.GameEvent_JiePaoHu))
	self:AddGameStateEvent(HuziAction.DianPao, handler(self,self.GameEvent_DianPao))
end

--展示操作的牌并播放动画
function TablePlayer:GameEvent_ShowOpearCard(data)
	if not self.module:has_ActionHu() then
		self:hide_chuzhang(false)
	end
    self:SetOperaCard(data)
    self.card.opera.root.transform.localPosition = self.card.opera.startPos
    self.card.opera.root.transform.localScale = Vector3.one
    self.card.opera.root:SetActive(true)
    SoundManager:play_nameroot('chipeng')
    self:play_action_sound(self.curActionID)
    self:show_chutx(self.curActionID, self.actionOverride[self.curActionID])
    --移动和缩小
    --移动
    local nOperaCount = self:GetOperaComCount()
    local nXiaCount = #data.xia_zhang
    --移动到最前位置 和 最后位置的中间
	local nIndexFirst = nXiaCount - nOperaCount + 1
	if nIndexFirst < 1 then	--容错处理
		nIndexFirst = 1
	end
	local posFront = self.card.xia[nIndexFirst].root.transform.position
	if nXiaCount < 1 then	--容错处理
		nXiaCount = 1
	end
    local posLast  = self.card.xia[nXiaCount].root.transform.position
    local tarPos = (posFront + posLast) / 2 --目标点为两个坐标中间
	
	coroutine.wait(0.8)     --展示0.8秒时间
	local sequence = self:CreateSequence()
    sequence:Join(self.card.opera.root.transform:DOMove(tarPos, 0.15))
    sequence:Join(self.card.opera.root.transform:DOScale(0.35, 0.15)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        self.card.opera.root:SetActive(false)
        self.card.opera.root.transform.localPosition = self.card.opera.startPos
        self:UpdateCards(data)
    end)
end

--设置操作的牌
function TablePlayer:SetOperaCard(data)
    local nOperaCount = self:GetOperaComCount()
    local nXiaCount = #data.xia_zhang
    self:InitOperaCards()       --先隐藏操作牌
    --获取操作的牌组
    local nIndex = 1
    local startIndex = nXiaCount - nOperaCount + 1
    if startIndex <= 0 then
        return
    end
    for i = startIndex, nXiaCount do
        self:SetSetCard(self.card.opera[nIndex], data.xia_zhang[i].pai)
        nIndex = nIndex + 1
    end
end

--设置开招的牌
function TablePlayer:SetKaiZhaoOperaCard(data)
    local nOperaCount = 1
    self:InitOperaCards()       --先隐藏操作牌
	--获取操作的牌组
	
    local nKaiZhaoValue = data.xia_zhang[self.action_xiazhang_index[1]].pai[1]
    for i = 1, 4 do
        self.card.opera[1][i]:SetData(nKaiZhaoValue)
    end
    self.card.opera[1].root:SetActive(true)
end

--获取操作的数量 适用于吃 碰 胡  不适用于开招
function TablePlayer:GetOperaComCount()
	--比牌可能有多列
	if self.curActionID == HuziAction.BiPai or self.curActionID == HuziAction.Chi then
		return #self.action_xiazhang_index	
	end

	--胡是多列
	if self.module:has_ActionHu() then
		local nLastCom = self.lastXiaCount or 0
		local nCurCom = #self.curData.xia_zhang
		return nCurCom - nLastCom
	end
	
	return 1
end

--4:开招
function TablePlayer:GameEvent_KaiZhao(data)    
	self:hide_chuzhang(false)
    self:SetKaiZhaoOperaCard(data)
    self.card.opera.root.transform.localPosition = self.card.opera.startPos
    self.card.opera.root.transform.localScale = Vector3.one
    self.card.opera.root:SetActive(true)
    SoundManager:play_nameroot('chipeng')
    self:play_action_sound(self.curActionID)
    self:show_chutx(self.curActionID, self.actionOverride[self.curActionID])
    
    --移动 找到该开招列位置
    local tarPos = Vector3.zero
    local nXiaCount = #data.xia_zhang
    local nKaiZhaoValue = self.module.lastChuCard
    for i=1, nXiaCount do
        if data.xia_zhang[i].pai[1] == nKaiZhaoValue and data.xia_zhang[i].pai[2] == nKaiZhaoValue then
            tarPos = self.card.xia[i].root.transform.position
        end
    end
    
	coroutine.wait(0.8)     --展示0.8秒时间
	--移动和缩小
    local sequence = self:CreateSequence()
    sequence:Join(self.card.opera.root.transform:DOMove(tarPos, 0.15))
    sequence:Join(self.card.opera.root.transform:DOScale(0.35, 0.15)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        self.card.opera.root:SetActive(false)
        self.card.opera.root.transform.localPosition = self.card.opera.startPos
        self:UpdateCards(data)
    end)
end

--6:胡牌
function TablePlayer:GameEvent_Hu(data)
	if self.PlayerIndex == 1 then		--自己则直接删除手牌
		local HandCardView = require("package.huzi.module.tablebase.handcard_view")
		HandCardView:clear()
	end
	self:GameEvent_ShowOpearCard(data)			--先播放胡牌的动画
	if	self.view.laseChuCard ~= nil then
		self.view.laseChuCard.root.transform.position = self.view.laseChuCard.startPos
		self.view.laseChuCard.root.transform.localScale = Vector3.one
		self.view.laseChuCard.root:SetActive(true)
	end
	
	self:SetRealHuXi()
	self:HideHuCard()                   --隐藏胡的那张牌

	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	self:SetXingData()
	self:PlayXingAni()                  --播放醒牌动画
end

function TablePlayer:GameEvent_JiePaoHu(data)
	coroutine.wait(0.8)
	self:GameEvent_Hu(data)
end

--设置醒牌信息
function TablePlayer:SetXingData()
	--设置翻醒 还是 跟醒的图片
	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	local bundleName = "huzi/module/table/huzi_tableglzp.atlas"
	local assetName = ""
	if self.XingAssetName ~= nil then
		if self.XingAssetName == "" then	--无醒牌动画
			return
		else
			assetName = self.XingAssetName
		end
	else
		if ruleInfo.XingType == nil then	--无醒牌
			return
		elseif ruleInfo.XingType == 0 then	--跟醒
			assetName = "Guangxi_Table_要牌_跟醒"
		elseif ruleInfo.XingType == 1 then	--翻醒
			assetName = "Guangxi_Table_要牌_翻醒"
		else
			assetName = "醒"
		end
	end
	
	self.xing.imaType1.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundleName, assetName)
	self.xing.imaType2.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundleName, assetName)

	if self.module.Msg_Table_GameStateNTF.ma_pai ~= nil and #self.module.Msg_Table_GameStateNTF.ma_pai > 0 then
		self.module.tagXing = true
	end
	
    Manager.DestroyChildren(self.xing.AniTran.gameObject)
	self.xing.XingIndex = 1             --翻醒牌的序号 可能翻多张
	local rtTran = self.xing.CountRoot:GetComponent("RectTransform")
	local posCountStart = rtTran.localPosition
	posCountStart.y = 700
	rtTran.localPosition = posCountStart
	self.xing.root:SetActive(false)
	if assetName ~= nil then
		self.xing.root:SetActive(true)      --显示翻醒或者跟醒字 的动画
	end
    self.xing.AniTran.localPosition = self.xing.posAniStart
end

--播放醒牌动画
function TablePlayer:PlayXingAni()
	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
    local obj = Manager.CopyObject(self.xing.cardTemp)
    local tran = Manager.GetComponentWithPath(obj, "", ComponentTypeName.RectTransform)
    local tarPosition = obj.transform.localPosition
    local pos = tran.localPosition
    pos.y = 550
    tran.localPosition = pos

    if self.xing.XingIndex == 1 and ruleInfo.XingType ~= nil then    --第一张要等播完字动画
        coroutine.wait(1)       
    end

	--设置醒牌的值
	if self.module.Msg_Table_GameStateNTF.ma_pai[self.xing.XingIndex] == nil then
		return
	end
    local tablecard = TableBase_Card:new()
    tablecard:Init(obj, Huzi_Card_Type.Chu)
	tablecard:SetData(self.module.Msg_Table_GameStateNTF.ma_pai[self.xing.XingIndex].pai)
    obj:SetActive(true)

    local sequence = self:CreateSequence()
    sequence:Join(tran:DOLocalMove(tarPosition, 0.9)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        obj.transform:SetParent(self.xing.AniTran)

        --设置醒数
        local nValueCount = 0
		for i=1, self.xing.XingIndex do
			if self.module.Msg_Table_GameStateNTF.ma_pai[i] ~= nil then
				nValueCount = nValueCount + self.module.Msg_Table_GameStateNTF.ma_pai[i].count
			end
		end
		if ruleInfo.ShuangXing then
			nValueCount = nValueCount / 2
		end
        self.xing.txtCount.text = "" .. nValueCount
        --醒数的动画
        local sequence2 = self:CreateSequence()
        local rtTran = self.xing.CountRoot:GetComponent("RectTransform")
        local posCountTar = rtTran.localPosition
        posCountTar.y = 230
        sequence:Join(self.xing.CountRoot.transform:DOLocalMove(posCountTar, 0.5)):SetEase(Tween.Ease.InQuad)

        self.xing.XingIndex = self.xing.XingIndex + 1
        if self.module.Msg_Table_GameStateNTF.ma_pai[self.xing.XingIndex] ~= nil then   --翻到最后一张 退出
            local posAniTar = Vector3.zero
            posAniTar.x = (self.xing.XingIndex - 1) * (-150)
            sequence:Append(self.xing.AniTran:DOLocalMove(posAniTar, 0.9)):SetEase(Tween.Ease.InQuad)
            self:PlayXingAni()  --递归下去
        end
    end)
end

--关闭胡的那张牌    --这里有等待1秒隐藏, 不用同一个携程 避免重复等待
function TablePlayer:HideHuCard()
    coroutine.wait(1)       --1秒后 关闭胡的那张牌
	if	self.view.laseChuCard ~= nil then
		self.view.laseChuCard.root:SetActive(false)
	end
end

--胡牌时候 剩下两名玩家需要把手牌拼到下张
function TablePlayer:HupaiHandToXia(data)
    local xiaData = {}
    local xiaCount = 0
    if data.xia_zhang ~= nil then
        xiaCount = #data.xia_zhang
    end
    for i=1,xiaCount do
        xiaData[i] = data.xia_zhang[i]
    end
    
    local index = 0
    
    --先拼接固定牌
    local fixedCount = 0
    if data.fixed_pai ~= nil then
        fixedCount = #data.fixed_pai
    end
    for i = 1, fixedCount do
        if data.fixed_pai[i] ~= nil then
            index = i + xiaCount
            xiaData[index] = {}
            xiaData[index].pai = {}
            for j=1,#data.fixed_pai[i].pai do
                xiaData[index].pai[j] = data.fixed_pai[i].pai[j].pai
            end
        end
    end

	--拼接手张 --手张需要排序
	local cardData = {}
	for j = 1, #data.shou_zhang do
		local nCount = #(data.shou_zhang[j].pai)
		for k=1,nCount do
			table.insert(cardData, data.shou_zhang[j].pai[k].pai)	
		end
	end

	local sortCard = self.module.SortCardHelper:SortHandCard(cardData, nil, true)	

    local handCount = 0
    if sortCard ~= nil then
        handCount = #sortCard
    end
    for i = 1, handCount do
        if sortCard[i] ~= nil then
            index = i + xiaCount + fixedCount
            xiaData[index] = {}
            xiaData[index].pai = {}
            for j=1,#sortCard[i].pai do
                xiaData[index].pai[j] = sortCard[i].pai[j].pai
            end
        end
    end
    self:refreshXiaZhang(xiaData)
end

--7:弃牌 
function TablePlayer:GameEvent_Qi(data)
    if data == nil or data.qi_zhang == nil or #data.qi_zhang <= 0 then
        return
	end
    local nLastIndex = #data.qi_zhang
    local value = data.qi_zhang[#data.qi_zhang]
    local chuRt = self.card.chu.root.transform
    chuRt.position = self.card.chu.startPos --先重置位置
    self.card.chu:SetData(value)
    self.card.chu.root.transform.localScale = Vector3.one
    self.card.chu.root:SetActive(true)
    
    local sequence = self:CreateSequence()
    --移动出牌
    local tarRt = self.card.qi[nLastIndex].root.transform
    sequence:Join(chuRt:DOMove(tarRt.position, 0.5)):SetEase(Tween.Ease.InQuad)
    --缩小出牌
    sequence:Join(chuRt:DOScale(0.35, 0.2)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        self:UpdateCards(data)
        self.card.chu.root:SetActive(false)
        chuRt.position = self.card.chu.startPos --先重置位置
    end)
end

--8:出
function TablePlayer:GameEvent_Chu(data)
	--出的牌为最后一张弃张 所以不刷新牌面 只显示出牌即可
	if self.module.bSelfChu then
		self.module.bSelfChu = false
		return
	end
	local value = data.qi_zhang[#data.qi_zhang]
	self:ShowChu(value)
	
end

--展示出
function TablePlayer:ShowChu(value)
	if self.chuSequence ~= nil then
		self.chuSequence:Kill()
	end
	self.module.lastChuCard = value
    self.card.chu:SetData(value)
	local chuRt = self.card.chu.root.transform
	chuRt.position = self.card.chu.startPos --先重置位置
	self.view.laseChuCard = self.card.chu
    self.card.chu.root.transform.localScale = Vector3.zero
    local zipaiz = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
    self.card.chuBg1:SetActive(zipaiz ~= 3)
    self.card.chuBg2:SetActive(zipaiz == 3)
    self.card.chu.root:SetActive(true)
	self:play_card_sound(value)
	local curTableData = TableManager.phzTableData
	
    local sequence = self:CreateSequence()
    sequence:Join(self.card.chu.root.transform:DOScale(1, 0.3)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        
	end)
end

--26: 摸牌
function TablePlayer:GameEvent_MoPai(data)
	--出的牌为最后一张弃张 所以不刷新牌面 只显示出牌即可
	if self.chuSequence ~= nil then
		self.chuSequence:Kill()
	end
    local value = data.qi_zhang[#data.qi_zhang]
    self.module.lastChuCard = value
    self.card.chu:SetData(value)
	local chuRt = self.card.chu.root.transform
	chuRt.position = self.view.remainderCardObj.transform.position --先重置到牌堆
	self.view.laseChuCard = self.card.chu
    self.card.chu.root.transform.localScale = Vector3.zero
    local zipaiz = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
    self.card.chuBg1:SetActive(zipaiz ~= 3)
    self.card.chuBg2:SetActive(zipaiz == 3)
    self.card.chu.root:SetActive(true)
    self:play_card_sound(value)
	local sequence = self:CreateSequence()
	self.chuSequence = sequence
	self.DebugTime =  UnityEngine.Time.time
	sequence:Join(self.card.chu.root.transform:DOMove(self.card.chu.startPos, 0.3)):SetEase(Tween.Ease.InQuad)
    sequence:Join(self.card.chu.root.transform:DOScale(1, 0.3)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        
	end)
end

--13:档底
function TablePlayer:GameEvent_DangDi(data)
	--出的牌为最后一张弃张 所以不刷新牌面 只显示出牌即可
	if self.chuSequence ~= nil then
		self.chuSequence:Kill()
	end
    local value = data.qi_zhang[#data.qi_zhang]
    self.card.chu:SetData(value)
    local chuRt = self.card.chu.root.transform
    chuRt.position = self.card.chu.startPos --先重置位置
	self.card.chu.root.transform.localScale = Vector3.zero
	self.view.laseChuCard = self.card.chu
    local zipaiz = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
    self.card.chuBg1:SetActive(zipaiz ~= 3)
    self.card.chuBg2:SetActive(zipaiz == 3)
    self.card.chu.root:SetActive(true)
	SoundManager:play_nameroot('chipeng')
	self:play_action_sound(self.curActionID)
    self:show_chutx(self.curActionID, self.actionOverride[self.curActionID])
	local sequence = self:CreateSequence()
	self.chuSequence = sequence
    sequence:Append(self.card.chu.root.transform:DOScale(1, 0.15)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        
    end)
end

--16:出张收回
function TablePlayer:GameEvent_ChuZhangShouHui(data)
	--出的牌为最后一张弃张 所以不刷新牌面 只显示出牌即可
	if self.chuSequence ~= nil then
		self.chuSequence:Kill()
	end
    self.card.chu.root.transform.localScale = Vector3.one
    self.card.chu.root:SetActive(true)
	local sequence = self:CreateSequence()
	self.chuSequence = sequence
	sequence:Append(self.card.chu.root.transform:DOScale(1, 1.5)):SetEase(Tween.Ease.InQuad)
    sequence:Append(self.card.chu.root.transform:DOScale(0, 0.5)):SetEase(Tween.Ease.InQuad):OnComplete(function()
        
    end)
end

--20:过
function TablePlayer:GameEvent_Guo(data)
	local curTableData = TableManager.phzTableData
    if curTableData.isPlayBack then
		self:show_chutx(self.curActionID)
	end
end

--24:弃胡
function TablePlayer:GameEvent_JustPlayEffect(data)
	self:show_chutx(self.curActionID)
end

--37 点炮
function TablePlayer:GameEvent_DianPao(data)
	self.card.chu.root:SetActive(false)
	self:show_chutx(self.curActionID)
	self:play_action_sound(self.curActionID)
end


--- 刷新游戏状态
function TablePlayer:refresh_game_state(data, actionID, action_xiazhang_index)
    if not data then
        return
    end
    
    if self.curData ~= nil and self.curData.xia_zhang ~= nil then
        self.lastXiaCount = #self.curData.xia_zhang
	end
	self.action_xiazhang_index = action_xiazhang_index
    self.curData = data
    self.curActionID = actionID
    self:FireGameStateEvent(actionID,data)
    self:update_huxi()
    self:update_tuoguan()

    if DataPaoHuZi.Msg_Table_GameStateNTF and DataPaoHuZi.Msg_Table_GameStateNTF.result ~= 0 then
        self:show_clock(false)
    end
end

--播放要牌声音
function TablePlayer:play_action_sound(actionID)
    local path = self.man and self.soundPath .. "/m_d" .. actionID  or self.soundPath .. "/f_d" .. actionID
    local name = self.man and "M_D" .. actionID  or "F_D" .. actionID
	SoundManager:play_sound(path, name)
end

--播放出牌声音
function TablePlayer:play_card_sound(id)
    SoundManager:play_nameroot('fanpai')
    local path = self.man and self.soundPath .. "/m_" .. id  or self.soundPath .. "/f_" .. id
    local name = self.man and "M_" .. id  or "F_" .. id
	SoundManager:play_sound(path, name)
end

---显示要牌特效
---@param index number
function TablePlayer:show_chutx(actionID, index)
    local strIndex = ""
    if index ~= nil then
        strIndex = "_" .. tostring(index)
    end
    local bundlePath = "huzi/module/table/huzi_tableglzp.atlas"
    local assetName = "TX_" .. actionID .. strIndex
    local sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
    self.chutxImg1.sprite = sprite
    self.chutxImg2.sprite = sprite
    self.chutxImg1:SetNativeSize()
    self.chutxImg2:SetNativeSize()
    self.chutxImg3:SetNativeSize()
    self.chutx:SetActive(false)
    self.chutx:SetActive(true)
end

function TablePlayer:CreateSequence()
	self.tabSequence = self.tabSequence or {}
	local sequence = Sequence()
	--table.insert(self.tabSequence, sequence)
	return sequence
end

--停止所有DoTween动画事件(回放用)
function TablePlayer:StopAllSequence()
	if self.tabSequence == nil then
		return
	end
	for k,v in pairs(self.tabSequence) do
		if	v ~= nil then 
			v:Kill()
			v = nil
		end
	end
	self.card.opera.root.transform:DOKill()
	self.card.chu.root.transform:DOKill()
	self.tabSequence = {}
	
	--上面的代码并没有生效 没有杀掉所有DoTween事件 给UpdateCards函数增加限制
	self.module:start_lua_coroutine(function (  )
		self.bPlayBackResetTime = true
		coroutine.wait(0.5)
		self.bPlayBackResetTime = false
	end)
end


function TablePlayer:Destroy()
	self:StartCalcLeftTime(-1)
	self.chutx:SetActive(false)
end

return TablePlayer