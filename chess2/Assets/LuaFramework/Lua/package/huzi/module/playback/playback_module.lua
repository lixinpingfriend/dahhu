






local ModuleBase = require("core.mvvm.module_base")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")

local ModuleCache = ModuleCache

local PlaybackModule = Class("HuZi.PlaybackModule", ModuleBase)

function PlaybackModule:initialize(...)
    ModuleBase.initialize(self, "playback_view", nil, ...)
end

function PlaybackModule:on_show(InitData)
    if InitData then
        self.InitData = InitData
        self.replayRoundInfos = InitData.replayRoundInfos
        self.curReplayIndex = InitData.curReplayIndex
        if self.replayRoundInfos and #self.replayRoundInfos > 1 and self.curReplayIndex then
            self.view.ButtonNextRound.gameObject:SetActive(true)
            self.view.ButtonLastRound.gameObject:SetActive(true)
        else
            self.view.ButtonNextRound.gameObject:SetActive(false)
            self.view.ButtonLastRound.gameObject:SetActive(false)
        end
    end
    --UpdateBeat:Add(self.UpdateBeat, self)
    local players = TableManager.phzTableData.players
    local videoData = TableManager.phzTableData.videoData
    self.players = players
end

function PlaybackModule:on_click(obj, arg)
    if not obj then
        return
    end
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

    if obj.name == "Play" then
        self:dispatch_module_event("Playback", "Event_Playback_Play")
    elseif obj.name == "Pause" then
        self:dispatch_module_event("Playback", "Event_Playback_Pause")
    elseif obj.name == "Back" then
        self:dispatch_module_event("Playback", "Event_Playback_Back")
    elseif obj.name == "Front" then
        self:dispatch_module_event("Playback", "Event_Playback_Front")
    elseif obj.name == "Reset" then
        self:dispatch_module_event("Playback", "Event_Playback_Reset")
    elseif obj.name == "Exit" then
		if TableManager.last_game_id then
			ModuleCache.GameManager.change_game_by_gameName(TableManager.last_game_id)
			TableManager.last_game_id = nil
		end
		self:dispatch_module_event("Playback", "Event_Playback_Exit")
	elseif obj.name == "LastRound" then
        self:play_back_last_round()
    elseif obj.name == "NextRound" then
        self:play_back_next_round()
    else
    end
end

function PlaybackModule:show_btn_play(show)
    if not self.view then
        return
    end
    Manager.SetActive(self.view.btnPlay.gameObject, show)
    Manager.SetActive(self.view.btnPause.gameObject, not show)
end

function PlaybackModule:play_back_last_round()
    if (not self.replayRoundInfos) or (not self.curReplayIndex) then
        return 
    end
    local nextIndex = self.curReplayIndex - 1
    if nextIndex < 1 then
        nextIndex = 1
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已经是第一局")
        return
    end
    local nextRoundInfo = self.replayRoundInfos[nextIndex]
    if nextRoundInfo then
        self:play_next_replay(nextIndex,nextRoundInfo)
    end
end

function PlaybackModule:play_back_next_round()
    if (not self.replayRoundInfos) or (not self.curReplayIndex) then
        return 
    end
    local nextIndex = self.curReplayIndex + 1
    if nextIndex > #self.replayRoundInfos then
        nextIndex = #self.replayRoundInfos
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("已经是最后一局")
        return
    end
    local nextRoundInfo = self.replayRoundInfos[nextIndex]
    if nextRoundInfo then
        self:play_next_replay(nextIndex,nextRoundInfo)
    end
end

function PlaybackModule:play_next_replay(nextIndex,nextRoundInfo)
    local data = {}
    data.recordId = nextRoundInfo.replay
    local players = {}
    for i=1,#nextRoundInfo.players do
        local player = {}
        player.userId = nextRoundInfo.players[i].userId
        player.seatId =  nextRoundInfo.players[i].seatId
        table.insert(players,player)
    end
    self.InitData.curReplayIndex = nextIndex
    local curGameName = AppData.get_url_game_name()
    ModuleCache.GameManager.change_game_by_gameName(nextRoundInfo.gameName)
    TableManager:play_back(data,players,true,self.InitData,function ()
        ModuleCache.ModuleManager.destroy_package("huzi")
    end,function ()
        ModuleCache.GameManager.change_game_by_gameName(curGameName)
    end)
end



return PlaybackModule