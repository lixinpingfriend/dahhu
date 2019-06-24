




local ModuleBase = require("core.mvvm.module_base")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")

local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

local ModuleCache = ModuleCache

---@class TotalResultModule : Module
local TotalResultModule = Class("TotalResultModule", ModuleBase)
local curTableData

function TotalResultModule:initialize(...)
    curTableData = TableManager.phzTableData
    ModuleBase.initialize(self, "totalresult_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TotalResultModule:on_module_inited()

end

-- 绑定module层的交互事件
function TotalResultModule:on_module_event_bind()
end

-- 绑定loginModel层事件，模块内交互
function TotalResultModule:on_model_event_bind()
end

function TotalResultModule:on_show(tableModule)
	self.tableModule = tableModule
	local intentData = tableModule.Msg_Table_GameStateNTF
    if intentData == nil then
		UnityLogError("TotalResultModule:on_show  intentData == nil")
	end
    --- 加载时隐藏，手动调用显示函数
    Manager.SetActive(self.view.root, false)
    self:set_room_info(intentData.CurRound, intentData.starttime, intentData.endtime)
	self:set_players(intentData)
	
	if AppData.Game_Name == "QZZP" or AppData.Game_Name == "GLZP" then
		self.view.ButtonNext.gameObject:SetActive(true)
	end
	
	--再来一局 是否显示
	if intentData.RealyRound < curTableData.RoundCount then
		self.view.ButtonNext.gameObject:SetActive(false)
	end
   
    self:setJieSanInfo()

   
end

--- 显示大结算页面
function TotalResultModule:show_result()

    Manager.SetActive(self.view.root, true)


    if self.tableModule.model.Msg_Table_UserStateNTF_Self and self.tableModule.model.Msg_Table_UserStateNTF_Self.Ready == true and self.tableModule.model.Msg_RoomDismissedNTF ~= nil then
        Manager.SetActive(self.view.root, false)
    end

    self:start_lua_coroutine(function ()

        if TableManager:cur_game_is_gold_room_type() then
            return
        end
        ModuleCache.ShareManager().share_room_result_text(self:get_result_share_data(true))
    end)

    ModuleCache.GVoiceManager().quitTeam()
end

--- 设置房间信息
function TotalResultModule:set_room_info(round, startTime, endTime)
    self.view.roomID.text = "房号:" .. curTableData.RoomID
    self.view.round.text = string.format("第%d/%d局", round, curTableData.RoundCount)
    if AppData.Game_Name == 'XXZP' or AppData.Game_Name == 'LDZP' then
        self.view.round.text = string.format("第%d局", DataPaoHuZi.Msg_Table_GameStateNTFNew.RealyRound)
	end
	
	self.gamerule = curTableData.Rule
	self.wanfaName,
	self.ruleName,
	self.playerNum,
	self.wanfaTable = TableUtilPaoHuZi.get_rule_name(curTableData.Rule, curTableData.HallID == 0)

	self.view.wanfa.text = self.wanfaName

    if startTime then
        local strStart = os.date("!%Y/%m/%d %H:%M", startTime - 2208988800)
        self.view.startTime.text = strStart
    end

    if endTime then
        local strEnd = os.date("!%Y/%m/%d %H:%M", endTime - 2208988800)
        self.view.endTime.text = strEnd
    end

    if curTableData.HallID and curTableData.HallID ~=0 then
        self.view.textQuanHao.text = "圈号:"..curTableData.HallID
    else
         self.view.textQuanHao.text =""
    end
end







--- 设置玩家信息
function TotalResultModule:set_players(data)
	Manager.DestroyChildren(self.view.playersHolder, self.view.item)
	
	local bDissRoom = false --解散房间标记
	for i=1,#data.player do
		if data.player[i].dis_user == 1 then
			bDissRoom = true
		end
	end

    self.view.item.gameObject:SetActive(false)
    local maxScore = 0
    local scoreList = {}
    for i = 1, #data.player do
        scoreList[i] = data.player[i].total_score
        if maxScore < data.player[i].total_score then
            maxScore = data.player[i].total_score
        end
	end

	local ruleInfo = ModuleCache.Json.decode(curTableData.Rule)
	if ruleInfo.Ratio then
		for i=1, #scoreList do
			scoreList[i] = scoreList[i] * ruleInfo.Ratio
		end
		maxScore = maxScore * ruleInfo.Ratio
	end
		

    local retData = self.tableModule.model.Msg_Table_UserStateNTF or {}

    
	for i = 1, #data.player do
		
		local obj = Manager.CopyObject(self.view.item, self.view.playersHolder)
		local winBG = Manager.FindObject(obj, "WinBg") 
		local head = Manager.GetImage(obj, "ImageHeadBg/ImageMask/ImageHead")
        local name = Manager.GetText(obj, "TextName")
        local id = Manager.GetText(obj, "TextID")
        local fangzhu = Manager.FindObject(obj, "TextName/ImageBanker")
        local dayingjia = Manager.FindObject(obj, "ImageWin")
		local ImageRoomJie = Manager.FindObject(obj, "ImageDiss")
		local greenScore = Manager.GetComponentWithPath(obj, "ImageTotalScore/TextGreen", "TextWrap")
		local redScore = Manager.GetComponentWithPath(obj, "ImageTotalScore/TextRed", "TextWrap")

		

        id.text = data.player[i].UserID .. ""
		Manager.SetActive(dayingjia, scoreList[i] > 0 and scoreList[i] == maxScore)
		Manager.SetActive(winBG, scoreList[i] > 0 and scoreList[i] == maxScore)
        Manager.SetActive(fangzhu, curTableData.FangZhu == i - 1)
        Manager.SetActive(fangzhu, data.player[i].Is_RoomOwner == 1)
		Manager.SetActive(ImageRoomJie, data.player[i].dis_user == 1)

		--离线时间
		local objOutLine = Manager.FindObject(obj, "ImageHeadBg/ImageMask/image")
		local txtTotalOutline = Manager.GetText(obj, "ImageHeadBg/ImageMask/image/TotalOutline/text")
		local txtOntOutLine = Manager.GetText(obj, "ImageHeadBg/ImageMask/image/OntOutLine/text")
		local txtOutlineCount = Manager.GetText(obj, "ImageHeadBg/ImageMask/image/OutlineCount/text")
		local txtWaitTime = Manager.GetText(obj, "wait/txtWaitTime")
		local timeStr = ""
		objOutLine:SetActive(false)
    	if data.player[i].offlineTime >= 15 or bDissRoom then  ---离线时间大于15秒才显示
			txtTotalOutline.text = self:TranTime(data.player[i].offlineTime)
			txtTotalOutline.transform.parent.gameObject:SetActive(true)
			txtOntOutLine.text = self:TranTime(data.player[i].offlineTimeMax)
			txtOntOutLine.transform.parent.gameObject:SetActive(true)
			txtOutlineCount.text = data.player[i].offlineMount .. "次"
			txtOutlineCount.transform.parent.gameObject:SetActive(true)
			objOutLine:SetActive(true)
		end
		
		if data.player[i].waitTimeMax > 0 then
			txtWaitTime.text = "等待时长: " .. self:TranTime(data.player[i].waitTimeMax)
			txtWaitTime.transform.parent.gameObject:SetActive(true)
		end
		
        TableUtilPaoHuZi.download_seat_detail_info(
            data.player[i].UserID,
            function(playerInfo)
                if self.view then
                    head.sprite = playerInfo.headImage
                end
            end,
            function(playerInfo)
                if name ~= nil and self.view then
                    name.text = Util.filterPlayerName(playerInfo.playerName, 10)
                    
                end
            end
        )
		local ruleInfo = ModuleCache.Json.decode(curTableData.Rule)
		
		if AppData.Game_Name == "XXZP" or AppData.Game_Name == "LDZP" then
			local tuo = Manager.FindObject(obj, "tagTuo")
			tuo:SetActive(data.player[i].total_piao == 1)

			if AppData.Game_Name == "LDZP" then
				local txt_huxi = Manager.GetText(obj, "XXHuxi")
				txt_huxi.text = "总胡息 " .. data.player[i].total_jie_suan_hu_xi .. "  原始胡息 " .. data.player[i].total_hu_xi
				if scoreList[i] > 0 and scoreList[i] == maxScore then
					txt_huxi.color = Color(130/255, 58/255, 0)
				end
				txt_huxi.gameObject:SetActive(true)
			end
		end

        if scoreList[i] > 0 then
            Manager.SetActive(greenScore.gameObject, false)
            Manager.SetActive(redScore.gameObject, true)
            redScore.text = "+" .. scoreList[i]
        else
            Manager.SetActive(greenScore.gameObject, true)
            Manager.SetActive(redScore.gameObject, false)
            greenScore.text = tostring(scoreList[i])
        end
        Manager.SetActive(obj, true)
    end
end

function TotalResultModule:TranTime(nTime)
	local h = math.floor(nTime / 3600)
	local m = math.floor((nTime % 3600) / 60)
	local s = (nTime % 3600) % 60
	local hStr = h >= 10 and tostring(h)..":" or ("0"..tostring(h)..":")
	local mStr = m >= 10 and  tostring(m)..":" or ("0"..tostring(m)..":")
	local sStr = s >= 10 and tostring(s) or ("0"..tostring(s))
	local str = hStr..mStr..sStr
	return str
end

function TotalResultModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.btnShare.gameObject then
        self:share(ModuleCache.ShareManager().ShareTypeOfChannel.Wechat)
    elseif obj.name == "BtnShareXianLiao" then
        if not ModuleCache.ShareManager().can_share_to_xianliao() then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("当前版本暂不支持此功能，请下载新版本")
            return
        end
        self:share(ModuleCache.ShareManager().ShareTypeOfChannel.XianLiao)
    elseif obj == self.view.ButtonNext.gameObject then
		local client = ModuleCache.net.NetClientManager.get_client("gameServer")
		client:reset_cdecompress()
		self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
		self.tableModule.bReStart = true
		self.tableModule.model.Msg_Table_GameStateNTF = nil --续打清空Msg_Table_GameStateNTF 亲友圈依赖这个判断
    elseif obj == self.view.btnBack.gameObject then
		self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
    end
end

function TotalResultModule:share(ShareTypeOfChannel)
    --if ModuleCache.PlayerPrefsManager.GetInt("shareTypeToggle".. AppData.Game_Name, 0) == 2 then
    --    ModuleCache.ShareManager().shareImage(false)
    --else
    --    ModuleCache.WechatManager.share_text(0, "", ModuleCache.ShareManager().copyText or "获取内容异常~-~")
    --end

    if ModuleCache.PlayerPrefsManager.GetInt("shareTypeToggle", 0) == 1 then
        if not ModuleCache.ShareManager().copyText or ModuleCache.ShareManager().copyText == "" then
            --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("获取内容异常,请重试")
            ModuleCache.ShareManager().share_room_result_text(self:get_result_share_data(),function(copyText)
                local data = {
                    ShareTypeOfChannel = ShareTypeOfChannel,
                    text = ModuleCache.ShareManager().copyText
                }
                ModuleCache.ShareManager().share_app_result_text(data)
            end)
        else
            local data = {
                ShareTypeOfChannel = ShareTypeOfChannel,
                text = ModuleCache.ShareManager().copyText
            }
            ModuleCache.ShareManager().share_app_result_text(data)
        end
    else
        ModuleCache.ShareManager().share_app_result_image(false, false, false, ShareTypeOfChannel)
    end
end

function TotalResultModule:setJieSanInfo()
    if AppData.Game_Name ~= "GLZP" then
        return
    end


    if self.tableModule.model.Msg_DismissNTF == nil then
        return 
    end
    local freeRoomData = self.tableModule.model.Msg_DismissNTF
    for i=1,#freeRoomData.Action do
		local action = freeRoomData.Action[i]
		local playerId = curTableData.seatUserIdInfo[(i - 1) .. ""]
		TableUtilPaoHuZi.download_seat_detail_info(playerId,nil,function(playerInfo)
            if(action == 1) then
                local playerName = Util.filterPlayerName(playerInfo.playerName, 10)
			end
		end)
	end
end

function TotalResultModule:get_result_share_data(bWait)
    local resultData = {
        roomID = curTableData.RoomID,
        hallID = curTableData.HallID,
    }

    if(self.tableModule.model.Msg_Table_GameStateNTF.endTime)then
        resultData.endTime = os.date("%Y/%m/%d %H:%M:%S", self.tableModule.model.Msg_Table_GameStateNTF.endTime)
    end

    local ruleInfo = ModuleCache.Json.decode(curTableData.Rule)
    resultData.payType = ruleInfo.PayType

    resultData.isMj = true 

    local playerDatas = {}
    local data = self.tableModule.model.Msg_Table_GameStateNTF
    for i = 1, #data.player do
        local id = data.player[i].UserID
        

        local boolFlag = false
        local name = ""
        local score = data.player[i].total_score
        TableUtilPaoHuZi.download_seat_detail_info(
            id,
            function(playerInfo)
                
            end,
            function(playerInfo)
                name = playerInfo.playerName
                boolFlag = true
            end
		)
		if bWait then
			for i=1,300 do
				coroutine.wait(0)
				if boolFlag then		--手机测试代码
					break
				end
			end
		end

		if ruleInfo.Ratio then
			score = score * ruleInfo.Ratio
		end

        local tmp = {
            name,
            score,
		}
		
        if(data.player[i].dis_user == 1)then
            resultData.dissRoomPlayName = name
        end

        table.insert(playerDatas,tmp)
    end
    resultData.playerDatas = playerDatas

    resultData.roundCount = curTableData.RoundCount
    resultData.curRound = self.tableModule.Msg_Table_GameStateNTF.CurRound

    if (AppData.Game_Name == 'XXZP' or AppData.Game_Name == 'LDZP') then
        resultData.curRound = self.tableModule.Msg_Table_GameStateNTF.RealyRound
        resultData.roundCount = nil
    end

    return resultData
end

function TotalResultModule:on_destroy()
end

return TotalResultModule
