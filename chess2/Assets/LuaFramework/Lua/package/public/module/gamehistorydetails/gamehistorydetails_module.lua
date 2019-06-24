local class = require("lib.middleclass")
---@type ModuleBase
local ModuleBase = require("core.mvvm.module_base")
---@class GameHistoryDetailsModule : ModuleBase
---@field view GameHistoryDetailsView
local GameHistoryDetailsModule = class("gameHistoryDetailsModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local TableUtil = TableUtil


function GameHistoryDetailsModule:initialize(...)
    ModuleBase.initialize(self, "gamehistorydetails_view", nil, ...)
    self.view.module = self
end

function GameHistoryDetailsModule:on_show(initData)
    if not initData then
		return
	end
    self.initData = initData
    if initData.comType then
        if self.com then
            self.com:Destroy()
            self.comType = nil
        end
        self.comType = initData.comType
        ---@type DetailComCtrlBase
        local com = require("package.public.module.gamehistorydetails.com."..self.comType.."_ctrl"):new()
        com:Init(self)
        self.com = com
    end
    local roomDetailsInfo = self:process_data_to_local_struct(initData.roomDetailsData) ---转换运营服务器发来的平铺数据到本地按round划分的结构
    if self.com then
        self.com:on_show(roomDetailsInfo)
    end

    local isMuseumRoom = (roomDetailsInfo.parlorId and roomDetailsInfo.parlorId > 0) and true or false
    local appAndGameName = initData.roomDetailsData.gameId
    local wanfaName, ruleName, renshu = TableUtil.get_rule_name_onegameresult(initData.roomDetailsData.playRule,isMuseumRoom,appAndGameName)
    self.view.ruleText.text = Util.filterPlayerName(ruleName, 70)

    self.view.dissInfoText.text = ""
    local disNickName = Util.filterPlayerName(string.tostring(initData.roomDetailsData.disUserNickname), 10)
    if "" ~= disNickName then
        self.view.dissInfoText.text = "解散原因: "..initData.roomDetailsData.disUserNickname.." 发起解散"
    end
end

---转换运营服务器发来的平铺数据到本地按round划分的结构
function GameHistoryDetailsModule:process_data_to_local_struct(roomDetailsData)
    local roomDetailsInfo = {}
    roomDetailsInfo.playRuleInfo = ModuleCache.Json.decode(roomDetailsData.playRule)
    roomDetailsInfo.players = {}
    roomDetailsInfo.roundInfos = {}
    roomDetailsInfo.parlorId = nil
    roomDetailsInfo.creatorId = roomDetailsData.creatorId
    roomDetailsInfo.disUser = roomDetailsData.disUser
    local totalPlayerCount = 
        roomDetailsInfo.playRuleInfo.PlayerNum or roomDetailsInfo.playRuleInfo.PlayerCount or roomDetailsInfo.playRuleInfo.playerCount

    local appRoundUserList = roomDetailsData.appRoundUserList
    for i=1,totalPlayerCount do
        local player = appRoundUserList[i]
        table.insert(roomDetailsInfo.players,player)
    end
    local totalRound = #appRoundUserList / totalPlayerCount
    local index = 1
    for i=1,totalRound do
        local roundInfo = {}
        roundInfo.players = {}
        roundInfo.replay = nil
        roundInfo.roomId = nil
        roundInfo.gameName = nil
        for j=1,totalPlayerCount do 
            local playerInfo = appRoundUserList[index]
            if not roundInfo.replay then
                roundInfo.replay = playerInfo.replay
            end
            if not roundInfo.roomId then
                roundInfo.roomId = playerInfo.roomId
            end
            if not roundInfo.gameName then
                roundInfo.gameName = playerInfo.gameId
            end
            if not roomDetailsInfo.parlorId then
                roomDetailsInfo.parlorId = playerInfo.parlorId
            end
            if not roomDetailsInfo.roomMasterId then
                roomDetailsInfo.roomMasterId = playerInfo.parlorId
            end
            local insertIndex = 0
            for k=1,#roomDetailsInfo.players do
                if roomDetailsInfo.players[k].userId == playerInfo.userId then
                    insertIndex = k
                    break
                end
            end
            roundInfo.players[insertIndex] = playerInfo
            index = index + 1
        end
        table.insert(roomDetailsInfo.roundInfos,roundInfo)
    end
    print("roomDetailsInfo")
    print_table(roomDetailsInfo)
    return roomDetailsInfo
end

function GameHistoryDetailsModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.closeBtn then
        ModuleCache.ModuleManager.destroy_module("public", "gamehistorydetails")
    elseif obj == self.view.lookMatchBtn then
		ModuleCache.ModuleManager.show_module("public", "playvideo")
    end
    if self.com then
        self.com:on_click(obj, arg)
    end
end

return GameHistoryDetailsModule