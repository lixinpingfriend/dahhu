local ModuleBase = require("core.mvvm.module_base")
local Class = require("lib.middleclass")
local packageHead       = "package.huzi.module."
local TableUtilPaoHuZi 	= require(packageHead .. "tablebase.table_util")
local SoundManager 		= require(packageHead .. "tablebase.sound_manager")
local Manager 			= require("package.public.module.function_manager")

local SingleResultModule = Class("SingleResult", ModuleBase)
local coroutine = require("coroutine")
local MatchingManager = require("package.public.matching_manager")

SingleResultModule.bFullViewPath = true
SingleResultModule.viewPath = packageHead .. "singleresult.singleresultBase_view"

function SingleResultModule:initialize(...)
	self.curTableData = TableManager.phzTableData
	ModuleBase.initialize(self, self.viewPath, nil, ...)
	self.PlayerNum = self.PlayerNum or TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule).PlayerNum
	self:InitOther()
end

function SingleResultModule:InitOther()
	
end

--- 设置标题
--- @param value number 1
function SingleResultModule:set_title(value)
    if self.curTableData.SeatID == DataPaoHuZi.ZuoXingIndex then
        value = 1
    end

    self.view.imgWin.gameObject:SetActive(value == 1)
    self.view.imgLose.gameObject:SetActive(value ~= 1)
end

--- 设置底牌
function SingleResultModule:set_dipai(data, ma_pai)
	Manager.SetActive(self.view.objDiPai, #data > 0)
    TableUtilPaoHuZi.print("剩余牌数", #data)
    Manager.DestroyChildren(self.view.dipaiParent, self.view.dipaiSample)
    for i = 1, #ma_pai do
        if ma_pai[i].no_display ~= true then
            local obj = Manager.CopyObject(self.view.dipaiSample)
            local text = Manager.GetText(obj, "Score")
            text.text = ma_pai[i].count
            Util.SetHuziCard(obj, ma_pai[i].pai, DataPaoHuZi.ZP_ZPPaiLei, Huzi_Card_Type.Qi)
            local image = obj.transform:Find("Image"):GetComponent("Image")
            image.color = Color.New(0 / 255, 253 / 255, 23 / 255, 1)
            Manager.SetActive(obj, true)
        end
    end
    
    
    for i = 1, #data do
        TableUtilPaoHuZi.print("-----", data[i])
        local obj = Manager.CopyObject(self.view.dipaiSample)
        local text = Manager.GetText(obj, "Score")
        text.text = ""
        Util.SetHuziCard(obj, data[i], DataPaoHuZi.ZP_ZPPaiLei, Huzi_Card_Type.Qi)
        Manager.SetActive(obj, true)
	end
	
	--克隆一个底牌 用于牌桌显示
	if #data > 0 then	--有才复制 没有就不管
		self.objTableDiPai = Manager.CopyObject(self.view.objDiPai)
		self.objTableDiPai:SetActive(false)
		local rTran = self.objTableDiPai:GetComponent("RectTransform")
		rTran.anchoredPosition = Vector2(10.2, -285.66)
		rTran:SetParent(self.view.root.transform)
	end
end

--- 设置胡牌下张
--- @param data
--- @param pai number 胡的牌
function SingleResultModule:set_xiazhang(data, pai)
    Manager.DestroyChildren(self.view.xiazhangParent, self.view.xiazhangSample)
    for i = 1, #data do
        local obj = Manager.CopyObject(self.view.xiazhangSample)
        local name = Manager.GetText(obj, "Name")
        local huxi = Manager.GetText(obj, "Huxi")
        name.text = data[i].des
        huxi.text = tostring(data[i].hu_xi)

        local findTag = false
        for j = 1, 4 do
            local cardObj = Manager.FindObject(obj, "Cards/" .. tostring(j))
            if data[i].pai[j] then
                local value = data[i].pai[j]
                local status = data[i].status[j]
                if status == 0 then
                    Util.SetHuziCard(cardObj,value, DataPaoHuZi.ZP_ZPPaiLei, Huzi_Card_Type.Qi)
                else
                    Util.SetHuziCard(cardObj,value, DataPaoHuZi.ZP_ZPPaiLei, Huzi_Card_Type.Qi)
                    local image = cardObj.transform:Find("Image"):GetComponent("Image")
                    image.color = Color.New(0 / 255, 253 / 255, 23 / 255, 1)
                end
                Manager.SetActive(cardObj, true)
                local tag = Manager.FindObject(cardObj, "Image/Hu")
                --- 约定胡的牌始终在最后一列
                if i == #data and not findTag and data[i].pai[j] == pai then
                    findTag = true
                    Manager.SetActive(tag, true)
                end
            else
                Manager.SetActive(cardObj, false)
            end
        end
        Manager.SetActive(obj, true)
    end
end

function SingleResultModule:SetCardByImage(img, value)
    local bundlePath = "huzi/module/table/huzi_tablecards/type".. DataPaoHuZi.ZP_ZPPaiLei ..".atlas"
    local assetName = "" .. Huzi_Card_SpriteName[Huzi_Card_Type.Qi] .. value
    img.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
end

--设置数据
function SingleResultModule:SetData(intentData)
	local winSeat = 0
	local paoSeat = 1
	local localSeatID_i = 0

	for i = 1, #intentData.player do
		local localSeatID = self.tableModule:get_local_seat(i - 1)
		if localSeatID == 1 then
			localSeatID_i = i
		end
		if intentData.player[i].hu_pai > 0 then
			self.HuPlayer = intentData.player[i]
			TableUtilPaoHuZi.print("赢家", localSeatID)
			winSeat = localSeatID
			self:set_xiazhang(intentData.player[i].xia_zhang, intentData.player[i].hu_pai)
			self:set_hufa(intentData.player[i].HuFa)
		end
		if i - 1 == intentData.loser then
			paoSeat = localSeatID
		end
		self:set_win(intentData.player[i].round_score)
	end
	self:set_title(winSeat)

	if winSeat == 0 then			--没人赢 默认显示自己牌
		self:show_huangzhuang()
		self:set_xiazhang(intentData.player[localSeatID_i].xia_zhang, intentData.player[localSeatID_i].hu_pai)
		self.view.objDiPai.gameObject:SetActive(false)	--隐藏底牌
	else
		self.view.objDiPai.gameObject:SetActive(true)	--显示底牌
	end

	self:set_dipai(intentData.dun, intentData.ma_pai)
end

--- 设置胡法
function SingleResultModule:set_hufa(data)
    local str = ""
    Manager.DestroyChildren(self.view.suanfenParent, self.view.suanfenSample)
	Manager.DestroyChildren(self.view.suanfenParent1, self.view.suanfenSample1)
	
	--先设置王牌
	if self.HuPlayer and self.HuPlayer.replace_pai ~= nil then
		local nCount = #self.HuPlayer.replace_pai
		for i=1, nCount do
			local obj = Manager.CopyObject(self.view.WangPaiTemp)
			obj.transform.parent = self.view.suanfenParent.transform
			obj.transform.localScale = Vector3.one
			local imgWang = obj.transform:Find("imgWang"):GetComponent("Image")
			local imgTar = obj.transform:Find("imgTar"):GetComponent("Image")
			self:SetCardByImage(imgWang, 21)	--王牌值为21
			self:SetCardByImage(imgTar, self.HuPlayer.replace_pai[i])
			obj:SetActive(true)
		end
	end

    --设置醒牌值
	local nCount = #self.data.ma_pai
	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	if  ruleInfo.XingType ~= nil then
		for i=1, nCount do
			local obj = Manager.CopyObject(self.view.XingTemp)
			obj.transform.parent = self.view.suanfenParent.transform
			obj.transform.localScale = Vector3.one
			local name = Manager.GetText(obj, "Name")
			if ruleInfo.XingType == 0 then	--跟醒
				name.text = "跟醒"
			elseif ruleInfo.XingType == 1 then	--翻醒
				name.text = "翻醒"
			end
			local score = Manager.GetComponentWithPath(obj, "Score", "TextWrap")
			score.text = tostring("+" .. self.data.ma_pai[i].count)
			local imgTar = Manager.GetImage(obj, "imgTar")
			self:SetCardByImage(imgTar, self.data.ma_pai[i].pai)
			obj:SetActive(true)
		end
	end
    
	
	
    for i = 1, #data do
        if data[i].display_position == 1 then
            str = str .. data[i].name .. "  "
        end

		local obj
        if data[i].display_position == 3  then
			obj = Manager.CopyObject(self.view.suanfenSample)
		elseif data[i].display_position == 2 then
			obj = Manager.CopyObject(self.view.suanfenSample1)
		end

		if obj ~= nil then
			local name = Manager.GetText(obj, "Name")
			local score = Manager.GetComponentWithPath(obj, "Score", "TextWrap")
			name.text = data[i].name 
			score.text = ""
			score.text = tostring(data[i].fen)
			
			if data[i].symbol_type == 1 then	--+号
				score.text = "+" .. score.text
			elseif data[i].symbol_type == 2	 then	--*号
				score.text = "*" .. score.text
			end
			
			Manager.SetActive(obj, true)
		end
    end

    self.view.hufa.text = str
    TableUtilPaoHuZi.print("胡法", str)
end

--- 设置输赢
--- @param score number 输赢多少分
function SingleResultModule:set_win(score)
    if score == nil then
        self.view.winImg.gameObject:SetActive(false)
        return
    else
        self.view.winImg.gameObject:SetActive(true)
    end

    local str = tostring(score)
    if score > 0 then
        str = "+" .. score
    end
    self.view.winScoreRed.text = str
    self.view.winScoreGreen.text = str
    Manager.SetActive(self.view.winScoreRed.gameObject, score > 0)
    Manager.SetActive(self.view.winScoreGreen.gameObject, score <= 0)
    self.view.winImg.sprite = self.view.winSpriteHolder:FindSpriteByName(tostring(score > 0 and 1 or 2))
--self.view.winScore.text = tostring(score)
end

function SingleResultModule:on_show(tableModule)
	self.tableModule = tableModule
	local intentData = tableModule.Msg_Table_GameStateNTF
	self.data = intentData    
	self:show_fanxingend()
	self:Set_WanFaShow()
	self:InitPersonInfos(intentData)
	self:ShowButtons()
	self:SetData(intentData)

	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	if not TableManager:cur_game_is_gold_room_type() then
		if not self.curTableData.RoundCount then
			return
		end
		if DataPaoHuZi.Msg_Table_GameStateNTF.CurRound % self.curTableData.RoundCount == 0 then
			return
		end            
	end
	
	if self.curTableData.isPlayBack then
		return
	end
	self:start_lua_coroutine(function()
        self:DaoJiShi()
    end)
end

function SingleResultModule:ShowButtons()
	local bJinBi = TableManager:cur_game_is_gold_room_type()

	Manager.SetActive(self.view.btnNext.gameObject, not self.curTableData.isPlayBack and DataPaoHuZi.Msg_Table_GameStateNTFNew.result == 1)
	Manager.SetActive(self.view.btnTotal.gameObject, not self.curTableData.isPlayBack and DataPaoHuZi.Msg_Table_GameStateNTFNew.result == 2)
	Manager.SetActive(self.view.btnBack.gameObject, self.curTableData.isPlayBack and not bJinBi)
	Manager.SetActive(self.view.btnShow.gameObject, not bJinBi)
	Manager.SetActive(self.view.btnHide.gameObject, false)
	

	--金币场独有按钮
	Manager.SetActive(self.view.btnHuanZhuo.gameObject, bJinBi) 	
	Manager.SetActive(self.view.btnJinBiClose.gameObject, bJinBi)
	Manager.SetActive(self.view.btnShare.gameObject, bJinBi)
	self:SetButtonInterval()
end

function SingleResultModule:DaoJiShi()
    if AppData.Game_Name == "GLZP" and self.modelData.tableCommonData.tableType ~= 1 then
        for i=5,1,-1 do
            self.view.TextDaoJiShi.text = '倒计时' .. i .. '秒'
            coroutine.wait(1)
            if not self.view then
                return
            end
        end
        self.view.TextDaoJiShi.text = ''
        self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
        ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
    end
end


--- 显示桌面/返回结算
function SingleResultModule:show_table(show)
    Manager.SetActive(self.view.bg, not show)
    Manager.SetActive(self.view.titleImg.gameObject, not show)
    Manager.SetActive(self.view.leftObj, not show)
    Manager.SetActive(self.view.rightObj, not show)
    Manager.SetActive(self.view.btnShow.gameObject, not show)
	Manager.SetActive(self.view.btnHide.gameObject, show)
	Manager.SetActive(self.view.btnBack.gameObject, self.curTableData.isPlayBack)
	Manager.SetActive(self.view.btnHuanZhuo.gameObject, false)

	Manager.SetActive(self.objTableDiPai, show)
	
	if TableManager:cur_game_is_gold_room_type() then
		Manager.SetActive(self.view.btnShow.gameObject, false)
		Manager.SetActive(self.view.btnBack.gameObject, show)
		Manager.SetActive(self.view.btnHuanZhuo.gameObject, not show)
		Manager.SetActive(self.view.btnJinBiClose.gameObject, not show)
		Manager.SetActive(self.view.btnShare.gameObject, not show)
	end

	self:SetButtonInterval()
end

function SingleResultModule:SetButtonInterval()
	local grid = self.view.objBottom:GetComponent("GridLayoutGroup")
	local nCount = 0
	for i=1, self.view.objBottom.transform.childCount do
		local item = self.view.objBottom.transform:GetChild(i-1).gameObject
		if item.activeSelf then
			nCount = nCount + 1
		end
	end

	if nCount <= 2 then
		grid.spacing = Vector2(315.91, 0)
	else
		grid.spacing = Vector2(14.16, 0)
	end
end

--- 显示黄庄
function SingleResultModule:show_huangzhuang()
    Manager.SetActive(self.view.bg, false)
    Manager.SetActive(self.view.titleImg.gameObject, false)
    Manager.SetActive(self.view.leftObj, false)
    Manager.SetActive(self.view.rightObj, false)
    Manager.SetActive(self.view.btnShow.gameObject, false)
    Manager.SetActive(self.view.btnHide.gameObject, false)
    Manager.SetActive(self.view.HuangZhuang, true)
	Manager.SetActive(self.objTableDiPai, false)
	
    if TableManager:cur_game_is_gold_room_type() then
        Manager.SetActive(self.view.btnShow.gameObject, false)
	end
	self:sethuangzhuang_score()
end

--设置黄庄分数
function SingleResultModule:sethuangzhuang_score()
	local ruleInfo = TableUtilPaoHuZi.convert_rule(self.curTableData.Rule)
	--无王 不需要显示
	if ruleInfo.WangPaiNum == nil or ruleInfo.WangPaiNum <= 0 then
		return
	end
	local data = self.data
	local nPlayerCount = #data.player
	local playerNode = self.view.HuangZhuang.transform:Find(nPlayerCount .. "Player")
	playerNode.gameObject:SetActive(true)
	for i = 1, #data.player do
		local localSeatID = self.tableModule:get_local_seat(i - 1)
		local nScore = data.player[i].round_score
		local strScore = ""
		local txtScore
		if nScore > 0 then
			strScore = "+" .. tostring(nScore)
			txtScore = playerNode:Find(localSeatID .. "/win"):GetComponent("TextWrap")
		else 
			strScore = tostring(nScore)
			txtScore = playerNode:Find(localSeatID .. "/lose"):GetComponent("TextWrap")
		end
		
		
		txtScore.text = strScore
		txtScore.gameObject:SetActive(true)
	end

	--设置王牌显示
	local nWangCount = 0
	for i = 1, #data.player do
		--遍历玩家的 手牌 下张  找出几张王  --固定砍没有王牌
		local handCount = #data.player[i].shou_zhang
		local nSubCount = 0
		nWangCount = 0
		for j=1, handCount do					--手牌砍树
			nSubCount = #data.player[i].shou_zhang[j].pai		--一砍手牌的长度 1-4
			for k = 1, nSubCount do 
				local n = data.player[i].shou_zhang[j].pai[k].pai
				if n == 21 then	--王牌值 21
					nWangCount = nWangCount + 1
				end
			end
		end
		local xiaCount = #data.player[i].xia_zhang
		for j=1, xiaCount do					--手牌砍树
			nSubCount = #data.player[i].xia_zhang[j].pai		--一砍手牌的长度 1-4
			for k = 1, nSubCount do 
				local n = data.player[i].xia_zhang[j].pai[k]
				if n == 21 then	--王牌值 21
					nWangCount = nWangCount + 1
				end
			end
		end
		local localSeatID = self.tableModule:get_local_seat(i - 1)
		self.tableModule.playersView[localSeatID]:PlayWangHuAni(nWangCount, true)
	end
end

-- 显示翻醒结束
function SingleResultModule:show_fanxingend()
    Manager.SetActive(self.view.bg, true)
    Manager.SetActive(self.view.titleImg.gameObject, true)
    Manager.SetActive(self.view.leftObj, true)
    Manager.SetActive(self.view.rightObj, true)
    Manager.SetActive(self.view.huangzhuang, false)
end

function SingleResultModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.btnShow.gameObject then
        self:show_table(true)
    elseif obj == self.view.btnHide.gameObject then
        self:show_table(false)       
	elseif obj == self.view.btnNext.gameObject and TableManager:cur_game_is_gold_room_type() then
		--金币场未断线处理 金币级别没变化 则继续 有变化则换桌
		if self.tableModule.gameClient.clientConnected and (self.tableModule.gameClient.lastReceivePackTime + 15 > UnityEngine.Time.realtimeSinceStartup) then
			self:CoinContinue()
		else		--断线则换桌
			self:ChangeTable()
		end
    elseif obj == self.view.btnNext.gameObject then
        self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
    elseif obj == self.view.btnTotal.gameObject then
		local totalresult = ModuleCache.ModuleManager.get_module("huzi", "totalresult")
        if totalresult ~= nil and totalresult.show_result ~= nil then
            ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
			totalresult:show_result()
		end
	elseif obj == self.view.btnBack.gameObject then
		if TableManager.phzTableData.isPlayBack and TableManager.last_game_id then
			ModuleCache.GameManager.change_game_by_gameName(TableManager.last_game_id)
			TableManager.last_game_id = nil
		end
		self.tableModule:request_exit_room()
		self.tableModule:exit_room()
	elseif obj == self.view.btnShare.gameObject then
		ModuleCache.ShareManager().shareImage(false)
	elseif obj == self.view.btnHuanZhuo.gameObject then
		self:ChangeTable()
	elseif obj == self.view.btnJinBiClose.gameObject then
		self:show_table(true)
    end
end

function SingleResultModule:InitPersonInfos(data)
    local ScoreSettle = DataPaoHuZi.Msg_Table_GameStateNTF.ScoreSettle
    local ScoreSettleta = {}
    for i,v in ipairs(ScoreSettle) do
        ScoreSettleta[v.SeatID] = v.ActualAmount
    end

    for i = 1, self.view.PlayerNum do
        self.view.personInfos[i].Go:SetActive(false)
    end
    
    for i = 1, #data.player do
        self.view.personInfos[i].Go:SetActive(true)
        local round_score = tostring(ScoreSettleta[i - 1])

        if data.loser == i - 1 then
            self.view.personInfos[i].Pao.gameObject:SetActive(true)
        else
            self.view.personInfos[i].Pao.gameObject:SetActive(false)
        end

        local localSeatID = self.tableModule:get_local_seat(i - 1)
        if localSeatID == 4 then
            self.view.personInfos[i].Xing.gameObject:SetActive(true)
        else
            self.view.personInfos[i].Xing.gameObject:SetActive(false)
        end

        local round_score2 = 1

        if TableManager:cur_game_is_gold_room_type() and DataPaoHuZi.Msg_Table_UserStateNTF then

            round_score2 = DataPaoHuZi.Msg_Table_UserStateNTF.State[i].Balance
        end

       

        if tonumber(round_score) == nil then
            round_score = data.player[i].round_score
        end
    
        if tonumber(round_score) == nil then
            round_score = 0
		end
		
		local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)

		--大冶字牌有倍率 和湘乡字牌倍率还不一样
		if AppData.Game_Name == "DYZP" and ruleInfo.Ratio then
			round_score = round_score * ruleInfo.Ratio
		end

 
        if TableManager.phzTableData.seatUserIdInfo and TableManager.phzTableData.seatUserIdInfo["0"] ~= nil  then
            TableUtilPaoHuZi.download_seat_detail_info(TableManager.phzTableData.seatUserIdInfo[tostring(i - 1)],
                function(playerInfo)
                    if not self.view then
                        return
					end
					local bQinyouCheat = self.tableModule:is_qinyou_cheat()		--亲友圈防作弊是否开启
					if bQinyouCheat and TableManager.curTableData.UserID ~= TableManager.phzTableData.seatUserIdInfo[tostring(i - 1)] then
						local bundlePath = "public/module/hall/public_hall.atlas"
						local assetName = "1538015536245微信-头像-1"
						self.view.personInfos[i].Image.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)
						self.view.personInfos[i].Name.text =  "***"
					else
						self.view.personInfos[i].Image.sprite = playerInfo.headImage
                    	self.view.personInfos[i].Name.text =  Util.filterPlayerName(playerInfo.playerName, 10)
					end
                end)
        else
            TableUtilPaoHuZi.download_seat_detail_info(TableManager.phzTableData.players[i].userId,
				function(playerInfo)
					if not self.view then
                        return
                    end
                    self.view.personInfos[i].Image.sprite = playerInfo.headImage
                    self.view.personInfos[i].Name.text = playerInfo.playerName
                end)
           
        end

        self.view.personInfos[i].ScoreWin.text = round_score
        self.view.personInfos[i].ScoreLose.text = round_score
        self.view.personInfos[i].ScoreWin.gameObject:SetActive(false)
        self.view.personInfos[i].ScoreLose.gameObject:SetActive(false)
        if tonumber(round_score) > 0 then
            self.view.personInfos[i].Lv.gameObject:SetActive(true)
            self.view.personInfos[i].ScoreWin.gameObject:SetActive(true)
            self.view.personInfos[i].JinBi.text = "<color=#FF3030>+" .. self:getStrYiWan(round_score) .. '</color>'
            self.view.personInfos[i].Hu.gameObject:SetActive(true)
        else
            self.view.personInfos[i].Lv.gameObject:SetActive(false)
            self.view.personInfos[i].ScoreLose.gameObject:SetActive(true)
            self.view.personInfos[i].JinBi.text = "<color=#32CD32>" .. self:getStrYiWan(round_score) .. '</color>'
            self.view.personInfos[i].Hu.gameObject:SetActive(false)
        end

        if tonumber(round_score) < 0 and round_score2 == 0 then
            self.view.personInfos[i].ShuGuang.gameObject:SetActive(true)
        else
            self.view.personInfos[i].ShuGuang.gameObject:SetActive(false)
        end

        if localSeatID == 4 then
            self.view.personInfos[i].Hu.gameObject:SetActive(false)
        end


        
    end
end

function SingleResultModule:getStrYiWan(scoreT)
    local score = tonumber(scoreT)
    local str = tostring(score)
    if score >= 10^8 or score <= -10^8 then
        local number = math.floor(score / 10^6)  
        str = string.format("%.2f", number/10^2).."亿"
    elseif score >= 10^6 or score <= -10^6 then
        local number = math.floor(score / 10^2)  
        str = string.format("%.0f", number/10^2).."万"
    elseif score >= 10^4 or score <= -10^4 then
        local number = math.floor(score / 10^2)  
        str = string.format("%.1f", number/10^2).."万"
    end 

    return str
end

function SingleResultModule:Set_WanFaShow()
	self.view.WanFaShow.gameObject:SetActive(true)
    self.view.WanFaShow.text = self:getstrByWanFa()
end

--金币场继续游戏
function SingleResultModule:CoinContinue()
	local roomData = MatchingManager.roomData
	if roomData == nil then	--没有信息则继续游戏
		self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
	end
	
	--找到对应游戏ID的信息
	local nCount = #roomData
	local goldid = self.modelData.tableCommonData.goldFildId
	local curRoomInfo = nil
	for i=1, nCount do
		if roomData[i].goldId == goldid then
			curRoomInfo = roomData[i]
			break
		end
	end

	if curRoomInfo then
		if (self.modelData.roleData.gold and curRoomInfo.minJoinCoin and curRoomInfo.maxJoinCoin) and (self.modelData.roleData.gold >= curRoomInfo.minJoinCoin and self.modelData.roleData.gold <= curRoomInfo.maxJoinCoin) then
			self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
		else
			--找到一个合适的桌子
			for i=1,nCount do
				local info = roomData[i]
				if (self.modelData.roleData.gold and info.minJoinCoin and info.maxJoinCoin) and self.modelData.roleData.gold >= info.minJoinCoin and self.modelData.roleData.gold <= info.maxJoinCoin then
					self.modelData.tableCommonData.goldFildId = info.goldId		--换桌
					self:ChangeTable()		
					break
				end
			end
			--没有找到
			self.tableModule:exit_room("金币不足")
		end
	end
	
end

--换桌
function SingleResultModule:ChangeTable()
	self:start_lua_coroutine(
		function()
			self.tableModule:request_exit_room()
			TableManager:disconnect_login_server()
			TableManager:disconnect_game_server()
			--ModuleCache.net.NetClientManager.disconnect_all_client()

			local myPlayer = self.tableModule.model.Msg_Table_UserStateNTF_Self
			local goldid = self.modelData.tableCommonData.goldFildId
			MatchingManager:getGoldById(
				goldid,
				function(info)
					if info == nil then
						self.tableModule:exit_room("意外情况退出")
						return
					end
					if myPlayer.Balance < info.minJoinCoin or myPlayer.Balance > info.maxJoinCoin then
						self.tableModule:exit_room("您的金币不匹配当前场次")
						return
					end					
					
					MatchingManager:gold_jump(
						goldid,
						function()
							self:start_lua_coroutine( function()
								coroutine.wait(0)
								ModuleCache.ModuleManager.destroy_module("huzi", "table")
								ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
							end)
						end
					)
				end
			)
		end
	)
end

function SingleResultModule:is_HuangZhuang()
	if self.data == nil then
		return true
	end
	for i=1,#self.data.player do
		if self.data.player[i].hu_pai > 0 then
			return false
		end
	end
	return true
end

--检查金币场是否可以继续游戏
function SingleResultModule:CheckJinBiReady()
	local goldid = self.modelData.tableCommonData.goldFildId
	local addStr = "gold/getById?"
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. addStr,
        showModuleNetprompt = false,
        params = {
            goldId = goldid,
            uid = self.modelData.roleData.userID
        }
    }
    Util.http_get(requestData, function(wwwData)
        local retData = wwwData.www.text
        retData = ModuleCache.Json.decode(retData)
        if (retData.success) then
			local info = retData.data
			local gold = 1111
			if gold > info.maxJoinCoin then
				self:get_quickJoin_data(function(data)
					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_other_confirm_cancel(
							"您的金币超过<color=red>" .. info.maxJoinCoin .. "</color>,无法进入<color=red>" .. info.goldName .. "</color>!是否去往<color=red>" .. data.goldName .. "</color>", function()
								TableManager:start_enter_gold_matching(self.modelData.roleData.userID, self.modelData.roleData.password, data.goldId, onFinish)
							end, function()
								ModuleEventBase:dispatch_package_event("Event_GoldJump_error")
							end, true, "确定", "取消")
				end, function()
					ModuleEventBase:dispatch_package_event('Event_GoldJump_error')
				end)
			end
        end
	end, 
	function(wwwErrorData)end)
end

function SingleResultModule:getstrByWanFa()
    return ""
end

function SingleResultModule:on_destroy()

end

return SingleResultModule
