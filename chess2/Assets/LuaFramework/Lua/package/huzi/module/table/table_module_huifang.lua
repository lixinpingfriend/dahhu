

local TableModule = HuZi_TableModule

local ModuleCache = ModuleCache
local ModuleManager = ModuleCache.ModuleManager

--local PlayerView = require("package.paohuzi.module.table.player_view")
local packageHead       = "package.huzi.module."
local HandCardView = require("package.huzi.module.tablebase.handcard_view")
local SoundManager = require("package.huzi.module.tablebase.sound_manager")

local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

local ComponentUtil = ModuleCache.ComponentUtil
local DoTween = DG.Tweening.DOTween

local UnityEngine = UnityEngine
local Input = UnityEngine.Input
 
local TOTAL_SEAT = 3 --               座位数



function TableModule:innitHuiFang()


end


--- 初始化回放数据
function TableModule:init_playback_data()
    local curTableData = TableManager.phzTableData
	if curTableData.isPlayBack then
		TableManager.modelData.tableCommonData.tableType = 0
        self.playbackModule = ModuleManager.show_module("huzi", "playback")

        self:show_invite_btn(false)
        self:show_leave_btn(false)
        --Manager.SetActive(self.view.btnRule.gameObject, false)
        Manager.SetActive(self.view.btnVoice.gameObject, false)
        Manager.SetActive(self.view.btnChat.gameObject, false)
        Manager.SetActive(self.view.buttonWarning.gameObject, false)
        --Manager.SetActive(self.view.objRightTop, false)

        HandCardView:set_drag_enable(false)
		HandCardView:set_out_card_enable(false)

		self:CheckHuanWei()
		for i = 1, #curTableData.players do
            local localSeatID = self:get_local_seat(curTableData.players[i].seatId)
            self.playersView[localSeatID]:refresh_player_info(curTableData.players[i])
        end

        self.gameStateTable = {}

        self:start_lua_coroutine(
            function()
                while true do
                    coroutine.wait(0.6)
                    if not self.view then
                        break
                    end

                    if #self.gameStateTable >= self.playbackIndex and self.playingPlayback and self.view and not self.IsHuifang then
                        self:playback()
                        self.playbackIndex = self.playbackIndex + 1
                    else
                        if self.view then
                            self.playbackModule:show_btn_play(true)
                        end
                    end
                end
            end
        )

        self.playbackIndex = 1
        for i = 1, #curTableData.gamestates do
            table.insert(self.gameStateTable, curTableData.gamestates[i])
        end

        self:playback_reset()
        self.playingPlayback = true
    end
end


--- 回放
function TableModule:playback()
    local curTableData = TableManager.phzTableData
    local data = self.gameStateTable[self.playbackIndex]
    if not data then
        return
    end
    print_pbc_table(data)
	
    DataPaoHuZi.Msg_Table_GameStateNTFLast = DataPaoHuZi.Msg_Table_GameStateNTF
    DataPaoHuZi.Msg_Table_GameStateNTF = data
	DataPaoHuZi.Msg_Table_GameStateNTFNew = data
	self.Msg_Table_GameStateNTF = data
	self.Msg_Table_GameStateNTFNew = data

    if self.PlayerNum and self.playbackIndex == 1 then
		self:SetStartTime()
    end
    self.playbackModule:show_btn_play(not self.playingPlayback)

	--刷新其他人手张
    for i = 1, #data.player do
        local localSeatID = self:get_local_seat(i - 1)
		self:refreshShouZhang(localSeatID,data.player[i])
	end
	
	self:ReadyBeforPlay(data)

    coroutine.wait(0.3)
end

--- 播放按钮播放
function TableModule:playback_play()
    self.playingPlayback = true
end

--- 暂停
function TableModule:playback_pause()
    self.playingPlayback = false
end

--- 后退一步
function TableModule:playback_back()
	ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
	self.view.XingRoot:SetActive(false)
    self:hide_players_chuzhang()
	self.playingPlayback = false
	self.playbackIndex = self.playbackIndex - 1
	if self.playbackIndex < 1 then
		self.playbackIndex = 1
	end
    self:start_lua_coroutine(
        function()
            self.IsHuifang = true
            self:playback()
            self.IsHuifang = false
        end
    )
end

-- 后退刷新
-- 后退到上一帧 需要先退到上上一帧  然后播放上一帧
function TableModule:back_update()
	local updateIndex = self.playbackIndex - 2
	if updateIndex < 1 then
		updateIndex = 1
	end
	local data = self.gameStateTable[updateIndex]		--用上上帧数据刷新
	for i=1, self.PlayerNum do
		local localSeatID = self:get_local_seat(i - 1)
		self:refreshShouZhang(localSeatID, data.player[i])
		self.playersView[localSeatID]:refreshXiaZhang(data.player[i].xia_zhang)
		self.playersView[localSeatID]:refreshQiZhang(data.player[i].qi_zhang)
	end
	self.playbackIndex = self.playbackIndex - 1
	if self.playbackIndex < 1 then
		self.playbackIndex = 1
	end
end

function TableModule:refreshShouZhang(localSeatID, player)
	local cardData = {}
	local count = 0
	for j = 1, #player.fixed_pai do
		local nCount = #(player.fixed_pai[j].pai)
		for m=1,nCount do
			table.insert(cardData, player.fixed_pai[j].pai[m].pai)
		end
		count = count + 1
	end
	for j = 1, #player.shou_zhang do
		local nCount = #(player.shou_zhang[j].pai)
		for m=1,nCount do
			table.insert(cardData, player.shou_zhang[j].pai[m].pai)	
		end
	end
	
	local sortCard = self.SortCardHelper:SortHandCard(cardData, HandCardView)
	local bHu = self:has_ActionHu()
	if localSeatID ~= 1 then
		if self.Msg_Table_GameStateNTF.result == 0 and not bHu then
			self.playersView[localSeatID]:refreshShouZhang(sortCard)
		else
			self.playersView[localSeatID]:refreshShouZhang({})
		end
	end
	
	if bHu then
		self.playersView[localSeatID]:refreshShouZhang({})
	end
end

--- 前进一步
function TableModule:playback_front()
    self.playbackIndex = self.playbackIndex + 1
   
    self:hide_players_chuzhang()
    
    if self.playbackIndex > #self.gameStateTable then
        self.playbackIndex = #self.gameStateTable
    end
    self.playingPlayback = false
    self:start_lua_coroutine(
        function()
            self.IsHuifang = true
            self:playback()
            self.IsHuifang = false
        end
    )
end

--- 隐藏所有玩家出张
function TableModule:hide_players_chuzhang()
    for i = 1, #self.playersView do
        self.playersView[i]:hide_chuzhang(true)
    end
end

--- 重置
function TableModule:playback_reset()
	ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
	self:reset()
	self:hide_players_chuzhang(true)
	self.playbackIndex = 1
	self.playbackModule:show_btn_play(true)
	self.view:show_start_btn()
end


--设置开始时间
function TableModule:SetStartTime()
	local startTime = self.Msg_Table_GameStateNTF.starttime
	if startTime ~= nil then
		self.view.txtStartTime.text = "开始时间:" .. os.date("%Y/%m/%d %H:%M", tonumber(startTime) - 2208988800 - 3600 * 8)
		self.view.txtStartTime.gameObject:SetActive(true)
	end
	
end