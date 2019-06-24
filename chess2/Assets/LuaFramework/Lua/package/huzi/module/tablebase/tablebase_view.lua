



local ModuleCache = ModuleCache
local GameObject = UnityEngine.GameObject
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local GameSDKInterface = ModuleCache.GameSDKInterface
local ComponentUtil = ModuleCache.ComponentUtil
local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
---@class PaoHuZiTableBaseView
local TableBaseView = class('tableBaseView', View)
local PlayerPrefs = UnityEngine.PlayerPrefs
local coroutine = require("coroutine")
local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

TableBaseView.bgName = {}
TableBaseView.bgName[1] = "1"
TableBaseView.bgName[2] = "2"
TableBaseView.bgName[3] = "3"
TableBaseView.nZiPaiPaiLei = 1
TableBaseView.nDefaultKanPos = 1
TableBaseView.nDefaultSortType = 1
TableBaseView.ConstMaxPlayer = 4
TableBaseView.ConstMinPlayer = 2

function TableBaseView:SetModel(model)
	self.model = model
end

function TableBaseView:SetModule(module)
	self.module = module
end

function TableBaseView:initialize(...)

	self.TableData = TableManager.phzTableData
    TableUtilPaoHuZi.PlayerNum = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule).PlayerNum
    self.ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
    View.initialize(self, "huzi/module/table/huzi_table.prefab", "HuZi_Table", 0)
	self.PlayerNum = self.PlayerNum or self.ruleInfo.PlayerNum
	

	local gameRoot = GameObject.Find("GameRoot")	--根节点
	self.uicamera = GetComponentWithPath(gameRoot, "Game/UIRoot/UICamera", "UnityEngine.Camera")	--UI摄像机

	self.tableBg = ModuleCache.ComponentUtil.Find(self.root, "Center/Bg").transform:GetComponent("Image")	--背景

	self.btnActivity = Manager.GetButton(self.root, "Top/ButtonActivity")					--活动按钮
    self.spriteRedPoint = Manager.FindObject(self.root, "Top/ButtonActivity/RedPoint")		--活动的红点
    self.RightBtn = Manager.FindObject(self.root, "RightBtn")								--右边按钮节点
    self.btnChat = Manager.GetButton(self.root, "RightBtn/fixed/Chat")							--聊天按钮
	self.btnVoice = Manager.GetButton(self.root, "RightBtn/fixed/Voice")    						--语音按钮
	self.Voice1 = Manager.GetButton(self.root, "RightBtn/fixed/Voice1")    						--语音按钮
	self.Voice2 = Manager.GetButton(self.root, "RightBtn/fixed/Voice2")    						--语音按钮
	self.btnSortCard = Manager.GetButton(self.root, "RightBtn/fixed/ButtonLi")   					--理牌按钮
	self.btnHuanFu = Manager.GetButton(self.root, "Top/ButtonHuanFu")   					--换肤按钮
	if TableManager.phzTableData.isPlayBack then
		self.btnHuanFu.gameObject:SetActive(false)
	end

    --- 中间布局：离开房间、邀请好友、开始游戏
    self.centerBtnHolder = Manager.FindObject(self.root, "CenterBtn")						--中间按钮节点
    self.btnLeave = Manager.GetButton(self.root, "CenterBtn/Leave")							--离开按钮
    self.btnInvite = Manager.GetButton(self.root, "CenterBtn/Invite")						--邀请按钮
    self.btnStart = Manager.GetButton(self.root, "CenterBtn/Start")							--开始按钮
    self.btnStartHui = Manager.GetButton(self.root, "CenterBtn/StartHui")					--开始灰色按钮
	self.btnReady = Manager.GetButton(self.root, "CenterBtn/Ready")							--准备按钮
	self.btnReady_cd =  Manager.FindObject(self.root, "CenterBtn/Ready/Count down")		--准备倒计时
	self.txtReady_cd =  GetComponentWithPath(self.root, "CenterBtn/Ready/Count down/Text",ComponentTypeName.Text)	--准备倒计时文本
	self.btnEarlyStart = Manager.GetButton(self.root, "CenterBtn/EarlyStart")							--提前开始按钮
	self.txtEarlyStart = Manager.GetText(self.root, "CenterBtn/EarlyStart/Text")							--提前开始按钮文字
	self.btnEarlyStartGray = Manager.FindObject(self.root, "CenterBtn/EarlyStart/Gray")					--提前开始按钮(灰)
	self.txtEarlyStartGray = Manager.GetText(self.root, "CenterBtn/EarlyStart/Gray/Text")					--提前开始按钮(灰)

    --- 中间布局：余张、
    self.remainderCardObj = Manager.FindObject(self.root, "Center/Remainder")				--余张节点
    self.remainderCardNum = Manager.GetText(self.remainderCardObj, "Num")					--余张数量
    self.PaiBei = {}																		--牌背景
    self.PaiBei[1] = Manager.FindObject(self.root, "Center/Remainder/PaiBeiMen1")			--牌背景1
    self.PaiBei[2] = Manager.FindObject(self.root, "Center/Remainder/PaiBeiMen2")			--牌背景2
    self.PaiBei[3] = Manager.FindObject(self.root, "Center/Remainder/PaiBeiMen3")			--牌背景3

    self.line = Manager.FindObject(self.root, "Center/Line")								--出牌间隔线

    --- 顶部布局：玩法、局数
    self.txtWanFa = Manager.GetText(self.root, "Top/Image/WanFa")							--游戏名字
    self.txtJushu = Manager.GetText(self.root, "Top/Image/JuShu")							--局数
    self.txtWanFaShow = Manager.GetText(self.root, "Center/WanFaShow")						--玩法选项
    self.GpsErr = Manager.FindObject(self.root, "Top/GpsErr")								--GPS信息
    self.GpsErrText = Manager.GetText(self.root, "Top/GpsErr/Text")							--GPS信息提示
    self.MsgZuoXing = Manager.GetText(self.root, "MsgZuoXing")								--坐醒提示
    self.txtRoomID = Manager.GetText(self.root, "TopRight/Fixed/Child/BatteryTime/RoomID/Text")	--房间ID
    self.TrBg1 = Manager.FindObject(self.root, "TopRight/Fixed/Child/BatteryTime/Bg1")			--信息背景(金币场)
    self.TrBg = Manager.FindObject(self.root, "TopRight/Fixed/Child/BatteryTime/Bg")				--信息背景(房卡场)
    
	self.cloneRoot = Manager.FindObject(self.root, "Clone")				                    --克隆节点
    self.handcardHolder = Manager.FindObject(self.root, "Players/HandView")				--手牌
    self.ctrlHolder = Manager.FindObject(self.root, "Control")								--吃碰杠控制器
    self.effFapai_end1 = Manager.FindObject(self.root, "Center/Remainder/FaPai_end1")		--方形牌发牌结束特效
	self.effFapai_end2 = Manager.FindObject(self.root, "Center/Remainder/FaPai_end2")		--圆形牌发牌结束特效
	
	local size = ViewBaseData.GameScreenAdaptParam
	self:fixed_tran_size(Manager.FindObject(self.root, "Players"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "TopLeft"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "TopRight"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "RightBtn"), size)
	
    self.btnReconnect = Manager.GetButton(self.root, "Reconnect")							--测试环境断线重连按钮
	self.objRightTop = Manager.FindObject(self.root, "TopRight/Fixed")							--顶部节点
	self.LeftRoot = Manager.FindObject(self.root, "TopLeft/Fixed/Root")							--顶部左边节点
	self.BtnLeftClose = Manager.GetButton(self.LeftRoot, "LeftRoot/BtnLeftClose")			--顶部左边遮罩 用来关闭左边
    self.BtnLeftOpen = Manager.GetButton(self.root, "TopLeft/Fixed/BtnLeftOpen")
	
	self.BtnLeftClose.onClick:AddListener(handler(self,self.closeTopLeft))					--添加关闭事件
	self.BtnLeftOpen.onClick:AddListener(handler(self,self.openTopLeft))					--添加打开事件
	
	self.JinBiChangMatch = Manager.FindObject(self.LeftRoot, "LeftRoot/Bg/JinBiChangMatch")	--弹出按钮主节点
	self.btnSettings = Manager.GetButton(self.JinBiChangMatch, "BtnSetting")				--设置按钮
	self.btnTopLeave = Manager.GetButton(self.JinBiChangMatch, "ButtonJinBiChangExit")		--离开按钮
	self.btnRule1 = Manager.GetButton(self.JinBiChangMatch, "ButtonRuleExplain")				--游戏玩法按钮
    self.buttonWarning = Manager.GetButton(self.JinBiChangMatch, "ButtonWarning")					--GPS按钮
	self.btnTopRule = Manager.GetButton(self.root, "TopRight/Fixed/Child/BatteryTime/ButtonRule")	--顶部游戏规则
    self.btnTuoGuan = Manager.GetButton(self.root, "btnTuoGuan")							--托管按钮

	self.buttonWarning.gameObject:SetActive(self.PlayerNum > 2)
	--电量 时间 信号信息
	self.sliderBattery = GetComponentWithPath(self.root, "TopRight/Fixed/Child/BatteryTime/Battery", ComponentTypeName.Slider)	--电量的Slider
	self.batteryCharging = Manager.FindObject(self.root, "TopRight/Fixed/Child/BatteryTime/Battery/ImageCharging")			--充电状态
	self.textTime = GetComponentWithPath(self.root, "TopRight/Fixed/Child/BatteryTime/Time/Text", ComponentTypeName.Text)		--时间文本
	self.goGState2G = Manager.FindObject(self.root, "TopRight/Fixed/Child/BatteryTime/GState/2g")				--2G信号
	self.goGState3G = Manager.FindObject(self.root, "TopRight/Fixed/Child/BatteryTime/GState/3g")				--3G信号
	self.goGState4G = Manager.FindObject(self.root, "TopRight/Fixed/Child/BatteryTime/GState/4g")				--4G信号
	self.textPingState = GetComponentWithPath(self.root, "TopRight/Fixed/Child/BatteryTime/TextPingState", ComponentTypeName.Text)		--ping值
	self.goWifiStateArray = {}	
	for i = 1, 5 do
		local goState = Manager.FindObject(self.root, "TopRight/Fixed/Child/BatteryTime/WifiState/state" ..(i - 1))
		table.insert(self.goWifiStateArray, goState)		--5种wifi信号强弱
	end

	self.XingRoot = Manager.FindObject(self.root, "Xing")				--醒牌的节点
	self.imgLeftCards = Manager.FindObject(self.root, "Center/2RenBG"):GetComponent("Image")		--丢弃的牌堆 2人玩法丢弃

	self.txtStartTime = Manager.GetText(self.root, "Top/startTime")		--牌局开始时间 回放显示

	

	self:InitEx()
end

function TableBaseView:InitOther()
	self:InitPlayer()
	self:refresh_table_bg()
	self:setPlayBack()
	self:SetZP_ZPPaiLeiStart()
    self:set_room_id()
    self:set_wanfa()
    self:refresh_round(1)
    Manager.SetActive(self.btnReconnect.gameObject, false)

    self.buttonWarning.onClick:AddListener(
        function()
            self:ShowGpsInfo(true)
        end
    )

    self.btnTopLeave.onClick:AddListener(handler(self, self.onClick_BtnTopLevel))

    self.btnSettings.onClick:AddListener(
        function()
            self.module:show_settings()
        end
    )
    self.btnRule1.onClick:AddListener(
        function()
            ModuleCache.ModuleManager.show_module("public", "goldhowtoplay")
        end
    )

    self.btnTopRule.onClick:AddListener(
        function()
            print(self.TableData.Rule)
            ModuleCache.ModuleManager.show_module("public", "tablerule", self.TableData.Rule)
        end
	)
	
	self.btnSortCard.onClick:AddListener(handler(self,self.on_click_SordCard))
	self:ShowBtnSortCard(false)
	self:InitCoinMatch()
end

function TableBaseView:onClick_BtnTopLevel()
	local bConnected = self.module.gameClient.clientConnected and (self.module.gameClient.lastReceivePackTime + 15 > UnityEngine.Time.realtimeSinceStartup) 
	if TableManager:cur_game_is_gold_room_type() and not bConnected then
		self.module:exit_room()
		return
	end
	if self.model.Msg_Table_GameStateNTF == nil then
		self.module:request_exit_room()
	else
		if self.model.Msg_Table_GameStateNTF.result == 2 then
			self.module:request_exit_room()
		else
			self.module:dispatch_module_event("dissolveroom", "Event_DissolvedRoom", 1)
		end
	end
end

--初始化金币场设置
function TableBaseView:InitCoinMatch()
	if not TableManager:cur_game_is_gold_room_type() then
		return
	end
	local text = Manager.GetText(self.btnTopLeave.gameObject, "Text")
	text.text = "离开"
end

function TableBaseView:InitEx()

end

function TableBaseView:btnTopLeave()
	if self.model.Msg_Table_GameStateNTF == nil then
		self.module:request_exit_room()
	else
		self.module:dispatch_module_event("dissolveroom", "Event_DissolvedRoom", 1)
	end
end

function  TableBaseView:set_wanfa()
	self.gamerule = TableManager.phzTableData.Rule
    self.wanfaName,
    self.ruleName,
    self.playerNum,
    self.wanfaTable = TableUtilPaoHuZi.get_rule_name(TableManager.phzTableData.Rule, TableManager.phzTableData.HallID == 0)
	self.txtWanFa.text = self.wanfaName
	self.txtWanFaShow.text = self.ruleName
    if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
        self.txtWanFa.text = self.txtWanFa.text .. ' 底注:' .. self.model.Msg_Table_UserStateNTF.BaseCoinScore
    end
end

--- 设置房号  
function TableBaseView:set_room_id()
    if self.TableData.HallID and self.TableData.HallID > 0 then
        self.txtRoomID.text = AppData.MuseumName .."房号:" .. self.TableData.RoomID
    else
        self.txtRoomID.text = "房号:" .. self.TableData.RoomID
    end
end

function TableBaseView:InitPlayer()
	local TablePlayer = require("package.huzi.module.table." .. AppData.Game_Name .. "." .. AppData.Game_Name .. "_player")
	self.playersView = {}
	for i=1,4 do
		local obj = Manager.FindObject(self.root, "Players/"..i)
		obj:SetActive(false)
	end
	if self.PlayerNum == 3 or self.PlayerNum == 4 then	--3人玩法或者4人玩法
		for i=1, self.PlayerNum do
			self.playersView[i] = TablePlayer:new()
			local obj = Manager.FindObject(self.root, "Players/"..i)
			self.playersView[i]:SetModule(self.module)
			self.playersView[i]:Init(obj, i)
			self.playersView[i]:InitXing(self.XingRoot)
			obj:SetActive(true)
		end
	elseif self.PlayerNum == 2 then --2人玩法
			self.playersView[1] = TablePlayer:new()
			local obj = Manager.FindObject(self.root, "Players/1")
			self.playersView[1]:SetModule(self.module)
			self.playersView[1]:Init(obj, 1)
			self.playersView[1]:InitXing(self.XingRoot)
			obj:SetActive(true)

			--第二个人是第三个位置
			self.playersView[2] = TablePlayer:new()
			obj = Manager.FindObject(self.root, "Players/3")
			self.playersView[2]:SetModule(self.module)
			self.playersView[2]:Init(obj, 2)
			self.playersView[2]:InitXing(self.XingRoot)
			obj:SetActive(true)
	end
end

--设置回放 部分按钮隐藏
function TableBaseView:setPlayBack()
	if self.TableData.isPlayBack then
        self.btnInvite.gameObject.transform.localScale = Vector3.New(0, 0, 0)
        self.btnLeave.gameObject.transform.localScale = Vector3.New(0, 0, 0)
        self.btnActivity.gameObject.transform.localScale = Vector3.New(0, 0, 0)
		self.BtnLeftOpen.gameObject.transform.localScale = Vector3.New(0, 0, 0)
    else
        self.btnInvite.gameObject.transform.localScale = Vector3.New(1, 1, 1)
		self.btnLeave.gameObject.transform.localScale = Vector3.New(1, 1, 1)
    end
end

--关闭顶部左边弹出面板
function TableBaseView:closeTopLeft()
	self.LeftRoot.gameObject:SetActive(false)
end

--打开顶部左边弹出面板
function TableBaseView:openTopLeft()
	self.LeftRoot.gameObject:SetActive(true)
end

--刷新背景图片
function TableBaseView:refresh_table_bg()
	local gameType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
	local bgSetKey = string.format("%s_MJBackground",gameType)
	local key = bgSetKey
    if not ModuleCache.PlayerPrefsManager.HasKey(key) then
        ModuleCache.PlayerPrefsManager.SetInt(key, 1)
	end
	
	local tableBg = ModuleCache.PlayerPrefsManager.GetInt(key)
	--动态设置背景
	self.tableBg.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle("huzi/module/table/huzi_tablebackground" .. self.bgName[tableBg] ..".atlas", "bg" .. self.bgName[tableBg])
end

--改变背景
function TableBaseView:changeBg()
	local gameType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
	local bgSetKey = string.format("%s_MJBackground",gameType)
	local key = bgSetKey
    if not ModuleCache.PlayerPrefsManager.HasKey(key) then
        ModuleCache.PlayerPrefsManager.SetInt(key, 1)
	end
	local tableBg = ModuleCache.PlayerPrefsManager.GetInt(key)
	local bgnew = tableBg+1
	if bgnew == 4 then
		bgnew = 1
	end
	ModuleCache.PlayerPrefsManager.SetInt(key, bgnew)
	self:refresh_table_bg()
end

--重置声音设置
function TableBaseView:refresh_voice_shake()
	self.openVoice =(PlayerPrefs.GetFloat("openVoiceVolume", 0.5) > 0)
	self.openShake =(PlayerPrefs.GetInt("openShake", 1) == 1)
	self.openGuoHu =(PlayerPrefs.GetInt("openGuoHu", 1) == 1)
	self.openFast =(PlayerPrefs.GetInt("openFast", 1) ==  1)
end

--根据屏幕坐标获取世界坐标
function TableBaseView:get_world_pos(screenPos, z)
	return self.uicamera:ScreenToWorldPoint(Vector3.New(screenPos.x, screenPos.y, z))
end

-- 实时刷新
function TableBaseView:update_beat()
	
end

--刷新电量及信号时间信息
function TableBaseView:refresh_battery_time_info()
	
	local batteryValue = GameSDKInterface:GetCurBatteryLevel()
	batteryValue = batteryValue / 100
	self.sliderBattery.value = batteryValue
	self.textTime.text = os.date("%H:%M", os.time())
	
	local signalType = ModuleCache.SDKInterface().get_cur_signal_type()
	if(signalType == "none") then
		self:show_wifi_state(true, 0)
		self:show_4g_state(false)
	elseif(signalType == "wifi") then
		local wifiLevel = ModuleCache.SDKInterface().get_cur_signal_strength()
		self:show_wifi_state(true, math.ceil(wifiLevel))
		self:show_4g_state(false)
	else
		self:show_wifi_state(false)
		self:show_4g_state(true, signalType)
	end
	ModuleCache.ComponentUtil.SafeSetActive(self.batteryCharging, GameSDKInterface:GetCurChargeState())
end

--显示wifi信息
function TableBaseView:show_wifi_state(show, wifiLevel)	
	for i = 1, #self.goWifiStateArray do		
		ModuleCache.ComponentUtil.SafeSetActive(self.goWifiStateArray[i], show and wifiLevel + 1 == i)
	end
end

--显示手机信号信息
function TableBaseView:show_4g_state(show, signalType)
	ModuleCache.ComponentUtil.SafeSetActive(self.goGState2G, show and signalType == "2g")	
	ModuleCache.ComponentUtil.SafeSetActive(self.goGState3G, show and signalType == "3g")	
	ModuleCache.ComponentUtil.SafeSetActive(self.goGState4G, show and signalType == "4g")	
end

--显示网络延迟信息
function TableBaseView:show_ping_delay(show, delaytime)
	ModuleCache.ComponentUtil.SafeSetActive(self.textPingState.gameObject, show)	
	if(not show) then
		return
	end
	delaytime = math.floor(delaytime * 1000)
	local content = ''
	if(delaytime >= 1000) then
		delaytime = delaytime / 1000
		delaytime = Util.getPreciseDecimal(delaytime, 2)
		content = '<color=#a31e2a>' .. delaytime .. 's</color>'
	elseif(delaytime >= 200) then
		content = '<color=#a31e2a>' .. delaytime .. 'ms</color>'
	elseif(delaytime >= 100) then
		content = '<color=#b5a324>' .. delaytime .. 'ms</color>'
	else
		content = '<color=#44b916>' .. delaytime .. 'ms</color>'
	end
	self.textPingState.text = content
end

--- 刷新用户状态
function TableBaseView:refresh_user_state(data)
	TableUtilPaoHuZi.print("刷新用户状态")
	--刷新用户的座位
	for i = 1, #data.State do		
		if data.State[i].UserID == self.modelData.roleData.userID then
			self.TableData.SeatID = data.State[i].SeatID
		end
	end
	
    for i = 1, #data.State do
        if not self.TableData.isPlayBack then
            local localSeatID = self.module:get_local_seat(data.State[i].SeatID)
            self.playersView[localSeatID]:refresh_player_info(data.State[i])
            self.playersView[localSeatID]:show_banker(data.State[i].SeatID == data.ZhuangJia)
			self.playersView[localSeatID]:show_ready(data.State[i].Ready)
			self.playersView[localSeatID].SeatID = data.State[i].SeatID
		
            if self.model.Msg_ReportStateNTF_Table and self.model.Msg_ReportStateNTF_Table[data.State[i].SeatID] then
                self.playersView[localSeatID]:show_leave(self.model.Msg_ReportStateNTF_Table[data.State[i].SeatID].State == 1)
                self.playersView[localSeatID]:show_offline(self.model.Msg_ReportStateNTF_Table[data.State[i].SeatID].State == 2)
			end
        end
    end
    self.TableData.FangZhu = data.ZhuangJia

    local seatHolderArray = {}
    for i, v in ipairs(self.playersView) do
        seatHolderArray[i] = v.playerInfo
    end

    if self.module:getDangQianRenShu() < self.PlayerNum then
        self.buttonWarning.gameObject:SetActive(false)
    else
        self.buttonWarning.gameObject:SetActive(self.PlayerNum > 2)

        if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
            self.buttonWarning.gameObject:SetActive(false)
            self.btnVoice.gameObject:SetActive(false)
        else
            --self:ShowGpsInfo(true)
        end
    end
    self:show_start_btn()

    if not self.IsLoad_activityOrady then
        self.IsLoad_activityOrady = true
        local object = 
        {
        	buttonActivity=self.btnActivity,
        	spriteRedPoint = self.spriteRedPoint
        }
        ModuleCache.ModuleManager.show_public_module("activity", object);
    end

    self:hideJinBiTr()
    self:refresh_round()
end


function TableBaseView:hideJinBiTr()
    local us = self.model.Msg_Table_UserStateNTF

    if us.BaseCoinScore ~= 0 then
        self.TrBg1.gameObject:SetActive(true)
        self.TrBg.gameObject:SetActive(false)
        self.btnTopRule.gameObject:SetActive(false)
        self.txtRoomID.gameObject:SetActive(false)
    end
end

--- 刷新局数
function TableBaseView:refresh_round(round)
	if not round then
		
	else
		local jushu = self.TableData.RoundCount
		self.txtJushu.text = string.format("第%d/%d局", round, jushu)
    end
    if self.modelData.tableCommonData.tableType == 1 then
        self.txtJushu.text = "  " 
        if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
            self.txtJushu.text = "  底分" .. self.model.Msg_Table_UserStateNTF.BaseCoinScore
        end
        return
    end
end

function TableBaseView:show_start_btn()
    Manager.SetActive(self.btnStart.gameObject, false)
    Manager.SetActive(self.btnStartHui.gameObject, false)
    Manager.SetActive(self.btnReady.gameObject, false)
	Manager.SetActive(self.btnReady_cd.gameObject, false)
	Manager.SetActive(self.btnEarlyStart.gameObject, false)
	Manager.SetActive(self.btnEarlyStartGray.gameObject, false)

    if self.TableData.isPlayBack then
        return
    end

    if self.model.Msg_Table_GameStateNTFNew ~= nil then
		return
	end

    --TODO XLQ:亲友圈快速组局
    if self.TableData.RoomType == 2 then
        if self.model.Msg_Table_UserStateNTF_Self and not self.model.Msg_Table_UserStateNTF_Self.Ready then
            Manager.SetActive(self.btnReady.gameObject,(not self.module.Msg_Table_GameStateNTF or self.module.Msg_Table_GameStateNTF.RealyRound == 0) )
        end
    end

    if self.roundStart then
        return
    end

    if not self.model.Msg_Table_UserStateNTF_Self then
        return
	end
    
    if self.model.Msg_Table_GameStateNTF and self.model.Msg_Table_GameStateNTF.resule ~= 0  then
        return
    end

	if self.model.Msg_Table_UserStateNTF_Self.Ready then
		self:CheckEarlyStart()
        return
    end
    local data = self.model.Msg_Table_UserStateNTF
    local isFangZhu = data.ZhuangJia == self.TableData.SeatID
    if isFangZhu then
        if self.module:is_all_ready() then
            Manager.SetActive(self.btnStart.gameObject, true)
        else
            Manager.SetActive(self.btnStartHui.gameObject, true)
		end
    else
        if self.model.Msg_Table_UserStateNTF_Self and not self.model.Msg_Table_UserStateNTF_Self.Ready then
            if not TableManager:cur_game_is_gold_room_type() then
                Manager.SetActive(self.btnReady.gameObject, true)    
            end
        end
	end
	self:CheckEarlyStart()

    --TODO XLQ:亲友圈快速组局
    if self.TableData.RoomType == 2 then
        Manager.SetActive(self.btnStart.gameObject, false)
		Manager.SetActive(self.btnStartHui.gameObject, false)
		--Manager.SetActive(self.btnEarlyStart.gameObject, false)
    end

    self.module:invite_friend(true)
end

function TableBaseView:CheckEarlyStart()
	if TableManager:cur_game_is_gold_room_type() then	--金币场不检查
		return
	end
	local ruleInfo = ModuleCache.Json.decode(TableManager.phzTableData.Rule)
	if not ruleInfo.StartNow then
		return
	end

	local num = 0
    for key, v in pairs(self.playersView) do
        if v.playerInfo ~= nil and v.playerInfo ~= "0" then
            num = num + 1
        end
	end
	local nMaxPlayer = self.ConstMaxPlayer		--防止修改配置数据
	local nMinPlayer = self.ConstMinPlayer		--防止修改配置数据
	if nMaxPlayer > self.PlayerNum then
		nMaxPlayer = self.PlayerNum
	end
	if nMaxPlayer <= nMinPlayer then
		return
	end
	if num >= nMaxPlayer then
		return
	end
	if num >= nMaxPlayer and nMaxPlayer < 3 then
		Manager.SetActive(self.btnEarlyStart.gameObject, false)
		Manager.SetActive(self.btnEarlyStartGray.gameObject, false)
		return
	else
		Manager.SetActive(self.btnEarlyStart.gameObject, true)
		Manager.SetActive(self.txtEarlyStart.gameObject, false)
		Manager.SetActive(self.btnStart.gameObject, false)
		Manager.SetActive(self.btnStartHui.gameObject, false)
		Manager.SetActive(self.btnReady.gameObject, false)
	end

	if num >= nMinPlayer and num < nMaxPlayer then
		if num == 2 then
			self.txtEarlyStart.text = "(2人)"
		elseif num == 3 then
			self.txtEarlyStart.text = "(3人)"
		end
		Manager.SetActive(self.txtEarlyStart.gameObject, true)
		return
	end

	if num == 1 then
		if nMaxPlayer == 4 then
			Manager.SetActive(self.btnEarlyStartGray.gameObject, true)
			if nMinPlayer == 2 then
				self.txtEarlyStartGray.text = "3人/2人也可开局"
			else
				self.txtEarlyStartGray.text = "3人也可开局"
			end
		elseif nMaxPlayer == 3 then
			if nMinPlayer == 2 then
				Manager.SetActive(self.btnEarlyStartGray.gameObject, true)
				self.txtEarlyStartGray.text = "2人也可开局"
			end
		end
	elseif num == 2 then
		if nMaxPlayer == 4 then
			Manager.SetActive(self.btnEarlyStartGray.gameObject, true)
			self.txtEarlyStartGray.text = "3人也可开局"
		end		
	end
end

function TableBaseView:Init10DaoJsButton()
    if self.Init10DaoJsButtonFlag then
        return
    end

	Manager.SetActive(self.btnReady_cd.gameObject, true)
    self.Init10DaoJsButtonFlag = self:start_lua_coroutine(function ()
        for i = self.model.Msg_Table_UserStateNTF_Self.RestTime,1,-1 do
            coroutine.wait(0.96)
            if not self.btnReady_cd.gameObject.activeSelf then
                break
            end
            self.txtReady_cd.text = tostring(i)
        end
        --self.module:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy
        self.Init10DaoJsButtonFlag = nil
    end)
end

--- 房间内用户上线
function TableBaseView:refresh_user_online(data)
    TableUtilPaoHuZi.print("房间内用户上线")
    local localSeatID = self.module:get_local_seat(data.SeatID)
    self.playersView[localSeatID]:show_offline(false)
end

--- 房间内用户离线
function TableBaseView:refresh_user_offline(data)
    TableUtilPaoHuZi.print("房间内用户离线")
    local localSeatID = self.module:get_local_seat(data.SeatID)
    self.playersView[localSeatID]:show_offline(true)
    self:show_start_btn()
end

--- 玩家即时反馈的状态
function TableBaseView:refresh_report_state(data)
    if not self.model.Msg_Table_UserStateNTF then
        return
    end

    TableUtilPaoHuZi.print("玩家即时反馈的状态")
    local localSeatID = self.module:get_local_seat(data.SeatID)
    self.playersView[localSeatID]:show_leave(data.State and data.State == 1)
    self.playersView[localSeatID]:show_offline(data.State and data.State == 2)

    --TODO XLQ:亲友圈 允许在线玩家踢出离线玩家     data.State 用户状态信息：0、在线；1、离开（休息）；2、离线
	if self.model.Msg_Table_GameStateNTF == nil 
		and self.TableData.RoomType == 2 
		and tonumber(data.State) == 2  then

        self.playersView[localSeatID]:show_kick(not (self.module:is_all_ready() and not self.model.Msg_Table_GameStateNTF ))
        Manager.AddButtonListener(
        self.playersView[localSeatID].seat.kick,
        function()
            self.model:request_kick_player(self.TableData.seatUserIdInfo[data.SeatID..""])
        end
        )
    end
end
function TableBaseView:ShowGpsInfo(bRealShow)
	if self.PlayerNum == 2 then	--字牌 两人不管如何都不显示GPS
		return
	end
	if bRealShow then
		self.bGPSZuoBi = nil
	end
	self:start_lua_coroutine(function ()		
		local datas = {}
		datas.gameType = "huazhipai"
		local seatHolderArray = {}
		for i, v in ipairs(self.playersView) do
			if i <= self.PlayerNum then
				local nProtectCount = 0		--保护计数 300帧跳出循环执行后面代码
				while nProtectCount < 60 do	--ip等待不用太久 没有ip信息 tablelocation不会显示ip宜昌
					if v.playerInfo then
						if v.playerInfo.ip  then
							break
						else
							nProtectCount = nProtectCount + 1
							coroutine.wait(0)	--ip还没读取到 等待一下
						end
					else
						break
					end
				end
				seatHolderArray[i] = v.playerInfo
			end
		end
	
		if not bRealShow then
			bRealShow = self:CheckFirstMeet()
		end

		self.buttonWarning.gameObject:SetActive(true)
		---金币场相关设置
		datas.buttonLocation = self.buttonWarning
		datas.isShowLocation = bRealShow
		coroutine.wait(0.2)
		
		nProtectCount = 0		--保护计数 300帧跳出循环执行后面代码
		while nProtectCount < 300 do	--数据没获取完全
			for i=1,self.PlayerNum do
				local localSeatID = self.module:get_local_seat(i-1)
				if seatHolderArray[localSeatID] and self.module.locationDatas~= nil and self.module.locationDatas[i-1] ~= nil then
					seatHolderArray[localSeatID].locationData = self.module.locationDatas[i-1]
				end
			end
			nProtectCount = nProtectCount + 1
			local nCurPlayer = self.module:get_cur_player_count()
			local nLocationCount = TableUtil.GetTableItemCount(self.module.locationDatas)
			local nCale = 0
			if self.module.locationDatas then
				for i=1, nLocationCount do
					if self.module.locationDatas[i-1] ~= "" then
						nCale = nCale + 1
					end
				end
			end
			if nCale == nCurPlayer then
				break
			end
			
			coroutine.wait(0)		--0.2秒可能不够用
		end

		for i=1,self.PlayerNum do
			if seatHolderArray[i] == nil then
				seatHolderArray[i] = {}
			end
		end
		datas.seatHolderArray = seatHolderArray
		local tablelocation = ModuleCache.ModuleManager.show_module("public", "tablelocation", datas)
    end)
end

--检查初次见面
function TableBaseView:CheckFirstMeet()
	if self.module.Msg_Table_UserStateNTF == nil then
		return false
	end
	
	--用所有玩家的ID做key 如果座位为空不处理
	local key = ""
	local nCount = #self.module.Msg_Table_UserStateNTF.State
	for i=1, nCount do
		key = key .. self.module.Msg_Table_UserStateNTF.State[i].UserID
	end

	self.meetData = self.meetData or {}
	if self.meetData[key] ~= nil then
		return false
	else 
		self.meetData[key] = 1
		return true
	end
end

--- 刷新座位信息
function TableBaseView:refresh_seat_info(data)
    TableUtilPaoHuZi.print("刷新座位信息")
    local localSeatID = self.module:get_local_seat(data.SeatID)
    self.playersView[localSeatID]:refresh_player_info(data)

    if self.TableData.RoomType == 2 and data  then
        if not self.TableData.isPlayBack then
            if not data.UserID or data.UserID == "0" then
                self.btnReady_cd:SetActive(false)
            end

        end
    end
	self.module:invite_friend(true)
	self:show_start_btn()
end

--- 显示取消托管按钮
function TableBaseView:quxiaoTuoGuan(data)
    if not self.btnTuoGuan then
        return
    end
    if data and self.model.Msg_Table_GameStateNTFNew.result == 0 then
        self.btnTuoGuan.gameObject:SetActive(data.IntrustState == 1)
    else
        self.btnTuoGuan.gameObject:SetActive(false)
    end
end

--- 字牌设置
function TableBaseView:SetZP_ZPPaiLeiStart()
    local zipaiz = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, -1)
    if zipaiz == -1 then
        self:SetZP_ZPPaiLei(self.nZiPaiPaiLei)
    end
    local zipaiz = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
    self.model.ZP_ZPPaiLei = zipaiz 

    for i=1,#self.PaiBei do
        self.PaiBei[i]:SetActive(i == zipaiz)
	end
	
	local kanPos = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPKanPos".. AppData.Game_Name, -1)		--坎的位置
	if kanPos == -1 then
		ModuleCache.PlayerPrefsManager.SetInt("ZP_ZPKanPos".. AppData.Game_Name, self.nDefaultKanPos)
	end

	--排序方式
	local key = "SortCard_" .. AppData.Game_Name .. TableManager.phzTableData.modelData.roleData.userID
	local type = ModuleCache.PlayerPrefsManager.GetInt(key, -1)
	if type == -1 then
		ModuleCache.PlayerPrefsManager.SetInt(key, self.nDefaultSortType)
	end
end

function TableBaseView:SetZP_ZPPaiLei(zipai)
    ModuleCache.PlayerPrefsManager.SetInt("ZP_ZPPaiLei" .. AppData.Game_Name, zipai)
end

--播放发牌动画动画
function TableBaseView:PlayFaPaiAni()
	local cardType = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name)
	self.effFapai_end1:SetActive(false)
	self.effFapai_end2:SetActive(false)
	self.effFapai_end1:SetActive(cardType ~= 3)
	self.effFapai_end2:SetActive(cardType == 3)
end

--显示理牌按钮
function TableBaseView:ShowBtnSortCard(bShow)
	self.btnSortCard.gameObject:SetActive(bShow)
end

--点击理牌按钮
function TableBaseView:on_click_SordCard()
	self.module:request_sortCard()
end

--显示剩余牌堆
function TableBaseView:ShowLeftCard(bShow)
	if bShow then
		self:SetLeftCard()
	end
	self.imgLeftCards.gameObject:SetActive(bShow)
end

--设置剩余牌堆的样式
function TableBaseView:SetLeftCard()
	self.color_type = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
	local bundlePath = "huzi/module/table/huzi_tablecards/type".. self.color_type ..".atlas"
    local assetName = "cardstack"
    self.imgLeftCards.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
end

return TableBaseView 