




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local list = require("list")
local ModuleBase = require('core.mvvm.module_base')
local BaseTableVideoPlayerModule = class('BaseTableVideoPlayerModule', ModuleBase)
local VideoMachine = require('package.public.module.table_video_player.video_machine')

function BaseTableVideoPlayerModule:initialize(viewName, modleName, packageModuleSimpleData, intentData)
	ModuleBase.initialize(self, viewName, modleName, packageModuleSimpleData, intentData)
	self.packageName = "public"
	self.moduleName = "table_video_player"
end

function BaseTableVideoPlayerModule:on_show(intentData)
	self.intentData = intentData
	if(intentData.playBackInitData)then
		self.view.buttonNextRound.gameObject:SetActive(true)
		self.view.buttonPreRound.gameObject:SetActive(true)
	else
		self.view.buttonNextRound.gameObject:SetActive(false)
		self.view.buttonPreRound.gameObject:SetActive(false)
	end
	self.videoModule = ModuleCache.ModuleManager.show_module(intentData.packageName, intentData.moduleName, intentData.videoData)
	self.videoModule.videoPlayerModule = self
	self.videoMachine = VideoMachine:new(self, {list=self.videoModule.videoDataList}, function(step)
		if(step.state == 1)then
			self.videoModule:on_step(step, false)
		elseif(step.state == -1)then
			self.videoModule:on_step(step, true)
		elseif(step.state == 2)then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已到最结尾")
			self.videoMachine:pause()
			self.view:showPauseBtn(false)
			self.view:showPlayBtn(true)
		elseif(step.state == -2)then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已到最开始")
		end
	end)
	self.videoMachine:play()
	--UpdateBeat:Add(self.UpdateBeat, self)
end

--function BaseTableVideoPlayerModule:on_hide()
--	--UpdateBeat:Remove(self.UpdateBeat, self)
--end
--
--function BaseTableVideoPlayerModule:on_destroy()
--	--UpdateBeat:Remove(self.UpdateBeat, self)
--end

function BaseTableVideoPlayerModule:on_update()
	if(self.videoMachine)then
		self.videoMachine:update()
	end
end


function BaseTableVideoPlayerModule:on_click(obj, arg)
	if(self.videoModule:isPlayingAnim())then
		return
	end
	if(obj == self.view.buttonClose.gameObject)then
		self:on_click_close_btn(obj, arg)
	elseif(obj == self.view.buttonReset.gameObject)then
		self:on_click_reset_btn(obj, arg)
	elseif(obj == self.view.buttonNextStep.gameObject)then
		self.videoMachine:next_step()
		self.videoMachine:refreshLastTime()
	elseif(obj == self.view.buttonPreStep.gameObject)then
		self.videoMachine:pre_step()
		self.videoMachine:refreshLastTime()
	elseif(obj == self.view.buttonPlay.gameObject)then
		self.videoMachine:play()
		self.view:showPauseBtn(true)
		self.view:showPlayBtn(false)
	elseif(obj == self.view.buttonPause.gameObject)then
		self.videoMachine:pause()
		self.view:showPauseBtn(false)
		self.view:showPlayBtn(true)
	elseif(obj == self.view.buttonNextRound.gameObject)then
		self:on_click_next_round_btn(obj, arg)
	elseif(obj == self.view.buttonPreRound.gameObject)then
		self:on_click_pre_round_btn(obj, arg)
	end
end

function BaseTableVideoPlayerModule:on_click_pre_round_btn(obj, arg)
	local playBackInitData = self.intentData.playBackInitData
	if(playBackInitData)then
		local curReplayIndex = playBackInitData.curReplayIndex
		local replayRoundInfos = playBackInitData.replayRoundInfos
		curReplayIndex = curReplayIndex - 1
		local roundInfo = replayRoundInfos[curReplayIndex]
		if(roundInfo)then
			local players = {}
			for i=1,#roundInfo.players do
				local player = {}
				player.userId = roundInfo.players[i].userId
				table.insert(players,player)
			end
			playBackInitData.curReplayIndex = curReplayIndex
			self:playOtherVideo(roundInfo.gameId, roundInfo.replay, players, playBackInitData)
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已经是第一局")
		end
	end
end

function BaseTableVideoPlayerModule:on_click_next_round_btn(obj, arg)
	local playBackInitData = self.intentData.playBackInitData
	if(playBackInitData)then
		local curReplayIndex = playBackInitData.curReplayIndex
		local replayRoundInfos = playBackInitData.replayRoundInfos
		curReplayIndex = curReplayIndex + 1
		local roundInfo = replayRoundInfos[curReplayIndex]
		if(roundInfo)then
			local players = {}
			for i=1,#roundInfo.players do
				local player = {}
				player.userId = roundInfo.players[i].userId
				table.insert(players,player)
			end
			playBackInitData.curReplayIndex = curReplayIndex
			self:playOtherVideo(roundInfo.gameId, roundInfo.replay, players, playBackInitData)
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已经是最后一局")
		end
	end
end

function BaseTableVideoPlayerModule:playOtherVideo(gameId, recordId, players, playBackInitData)
	local data = {
		gameId = gameId,
		recordId = recordId,
		players = players,
		playBackInitData = playBackInitData,
	}
	TableManager:play_back_common_poker(data, data.players, function()
		ModuleCache.ModuleManager.destroy_module(self.intentData.packageName, self.intentData.moduleName)
		ModuleCache.ModuleManager.destroy_module(self.packageName, self.moduleName)
	end)
end

function BaseTableVideoPlayerModule:on_click_reset_btn(obj, arg)
	self.view:showPauseBtn(false)
	self.view:showPlayBtn(true)
	self.videoMachine:stop()
	self.videoMachine:forward()
end

function BaseTableVideoPlayerModule:on_click_close_btn(obj, arg)
	ModuleCache.ModuleManager.destroy_module(self.intentData.packageName, self.intentData.moduleName)
	ModuleCache.ModuleManager.destroy_module(self.packageName, self.moduleName)
	if(self.intentData.needDestroyPackage)then
		for k, v in pairs(ModuleCache.AppData.allPackageConfig) do
			ModuleCache.ModuleManager.destroy_package(v.package_name)
		end
		ModuleCache.ModuleManager.show_module("public", "hall")
	end
end


return BaseTableVideoPlayerModule 