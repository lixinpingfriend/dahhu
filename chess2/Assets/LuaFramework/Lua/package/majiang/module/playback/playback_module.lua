local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local PlayBackModule = class("playbackModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local ComponentUtil = ModuleCache.ComponentUtil
local UnityEngine = UnityEngine
local curTableData = nil
local TableManager = TableManager

function PlayBackModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "playback_view", nil, ...)
    curTableData = TableManager.curTableData
    self.lastTime = 0
    self.curFrame = 1
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function PlayBackModule:on_module_inited()

end

-- 绑定module层的交互事件
function PlayBackModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function PlayBackModule:on_model_event_bind()

end

function PlayBackModule:on_show(InitData)
    if InitData then
        self.InitData = InitData
        self.replayRoundInfos = InitData.replayRoundInfos
        self.curReplayIndex = InitData.curReplayIndex
        if self.replayRoundInfos and #self.replayRoundInfos > 1 and self.curReplayIndex then
            self.view.ButtonNextRound:SetActive(true)
            self.view.ButtonLastRound:SetActive(true)
        else
            self.view.ButtonNextRound:SetActive(false)
            self.view.ButtonLastRound:SetActive(false)
        end
    end
    --UpdateBeat:Add(self.UpdateBeat, self)
    self:set_per_update_time(1.5)
    local gamestates = curTableData.gamestates
    local players = curTableData.players
    local videoData = curTableData.videoData
    self.players = players
    self.gameStates = gamestates
    local userState = {}
    userState.State = {}
    for i = 1, #players do
        local seatInfo = {}
        seatInfo.SeatID = players[i].seatId
        if (videoData.seatmap) then
            seatInfo.SeatID = videoData.seatmap[seatInfo.SeatID + 1]
        end
        seatInfo.UserID = players[seatInfo.SeatID + 1].userId
        seatInfo.PiaoType = 0
        seatInfo.Ready = true
        if (videoData.piaonum) then
            seatInfo.PiaoNum = videoData.piaonum[i]
        else
            seatInfo.PiaoNum = -1
        end
        if (videoData.paonum) then
            seatInfo.Pao = videoData.paonum[i]
        else
            seatInfo.Pao = -1
        end
        seatInfo.DiTuo = false
        table.insert(userState.State, seatInfo)
    end
    if (videoData.seatmap) then
        userState.randomseat = 1
    else
        userState.randomseat = 0
    end
    userState.msgtype = 0
    self:dispatch_module_event("playback", "Event_Msg_Table_UserStateNTF", userState)
    self:play_frame()
end

function PlayBackModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.playBackView.ButtonExit then
        ModuleCache.ModuleManager.hide_public_module("netprompt")
        --ModuleCache.ModuleManager.destroy_package("public")
        ModuleCache.ModuleManager.destroy_package("changpai","",{"roomdetail","historylist"})
        ModuleCache.ModuleManager.destroy_package("majiang","",{"roomdetail","historylist"})
        ModuleCache.ModuleManager.destroy_package("majiang3d","",{"roomdetail","historylist"})
        ModuleCache.ModuleManager.show_module("public", "hall")
        if nil ~= ModuleCache.ModuleManager.get_module("majiang", "historylist") then
            ModuleCache.ModuleManager.show_module("majiang", "historylist")
        end
        if nil ~= ModuleCache.ModuleManager.get_module("majiang", "roomdetail") then
            ModuleCache.ModuleManager.show_module("majiang", "roomdetail")
        end
        if nil ~= ModuleCache.ModuleManager.get_module("public", "gamehistory") then
            ModuleCache.ModuleManager.show_module("public", "gamehistory")
        end
        if nil ~= ModuleCache.ModuleManager.get_module("public", "gamehistorydetails") then
            ModuleCache.ModuleManager.show_module("public", "gamehistorydetails")
        end
    elseif obj == self.playBackView.ButtonPause then
        self:play()
    elseif obj == self.playBackView.ButtonReset then
        self:reset()
    elseif obj == self.playBackView.ButtonUnPause then
        self:play()
    elseif obj == self.playBackView.ButtonFront then
        self:play_front()
    elseif obj == self.playBackView.ButtonBack then
        self:play_back()
    elseif obj == self.playBackView.ButtonLastRound then
        self:play_back_last_round()
    elseif obj == self.playBackView.ButtonNextRound then
        self:play_back_next_round()
    else
        if self.other_click then
            self:other_click(obj, arg)
        end
    end
end

function PlayBackModule:on_update_per_second()
    if (not self.view.root.activeSelf) then
        return
    end
    if (self.playBackView.ButtonUnPause.activeSelf) then
        return
    end
    if (not self:next_frame()) then
        self:play()
    else
        self.lastTime = Time.timeSinceLevelLoad
    end
end

function PlayBackModule:next_frame()
    if (self.curFrame == #self.gameStates) then
        return false
    end
    self.curFrame = self.curFrame + 1
    self:play_frame()
    return true
end

function PlayBackModule:reset()
    ComponentUtil.SafeSetActive(self.playBackView.ButtonUnPause, false)
    ComponentUtil.SafeSetActive(self.playBackView.ButtonPause, true)
    if (ModuleCache.ModuleManager.module_is_active("majiang", "onegameresult")) then
        ModuleCache.ModuleManager.destroy_module("majiang", "onegameresult")
    end
    if (ModuleCache.ModuleManager.module_is_active("majiang", "onegameresultpuning")) then
        ModuleCache.ModuleManager.destroy_module("majiang", "onegameresultpuning")
    end
    if (ModuleCache.ModuleManager.module_is_active("changpai", "onegameresult")) then
        ModuleCache.ModuleManager.destroy_module("changpai", "onegameresult")
    end
    self.curFrame = 1
    self.lastTime = Time.timeSinceLevelLoad
    self:play_frame()
end

function PlayBackModule:play_front()
    self:next_frame()
end

function PlayBackModule:play()
    if (self.playBackView.ButtonUnPause.activeSelf) then
        self.lastTime = Time.timeSinceLevelLoad
        ComponentUtil.SafeSetActive(self.playBackView.ButtonUnPause, false)
        ComponentUtil.SafeSetActive(self.playBackView.ButtonPause, true)
    else
        ComponentUtil.SafeSetActive(self.playBackView.ButtonUnPause, true)
        ComponentUtil.SafeSetActive(self.playBackView.ButtonPause, false)
    end
end

function PlayBackModule:play_back()
    if (ModuleCache.ModuleManager.module_is_active("majiang", "onegameresult")) then
        ModuleCache.ModuleManager.destroy_module("majiang", "onegameresult")
        self.curFrame = self.curFrame - 1
    end
    if (ModuleCache.ModuleManager.module_is_active("majiang", "onegameresultpuning")) then
        ModuleCache.ModuleManager.destroy_module("majiang", "onegameresultpuning")
        self.curFrame = self.curFrame - 1
    end
    if (ModuleCache.ModuleManager.module_is_active("changpai", "onegameresult")) then
        ModuleCache.ModuleManager.destroy_module("changpai", "onegameresult")
        self.curFrame = self.curFrame - 1
    end
    if (ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
        ModuleCache.ModuleManager.hide_module("tablepop", "tablepop")
    end
    if (self.curFrame == 1) then
        return
    end
    self.curFrame = self.curFrame - 1
    self:play_frame()
end

function PlayBackModule:play_frame()
    if ModuleCache.GameManager.isEditor then
        print_pbc_table(self.gameStates[self.curFrame])
    end
    self:dispatch_module_event("playback", "Event_PlayBackFrame", self.gameStates[self.curFrame])
end

function PlayBackModule:play_back_last_round()
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

function PlayBackModule:play_back_next_round()
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

function PlayBackModule:play_next_replay(nextIndex,nextRoundInfo)
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
        ModuleCache.ModuleManager.destroy_package("majiang")
        ModuleCache.ModuleManager.destroy_package("majiang3d")
    end,function ()
        ModuleCache.GameManager.change_game_by_gameName(curGameName)
    end)
end

return PlayBackModule



