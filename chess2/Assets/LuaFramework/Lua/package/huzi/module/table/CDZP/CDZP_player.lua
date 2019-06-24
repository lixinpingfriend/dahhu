
local class = require("lib.middleclass")
local PlayerBase = require('package.huzi.module.tablebase.tablebase_player')
local QZZPTablePlayer = class("QZZPTablePlayer", PlayerBase)

QZZPTablePlayer.actionOverride = {}
QZZPTablePlayer.actionOverride[HuziAction.KaiZhao] = 3

QZZPTablePlayer.soundPath = "cdzp"

function QZZPTablePlayer:Reset()
	PlayerBase.Reset(self)
	self.module.updateXiaCard = 0
end

--8:出
function QZZPTablePlayer:GameEvent_Chu(data)
    PlayerBase.GameEvent_Chu(self,data)
	self.module.updateXiaCard = self.module.updateXiaCard + 1
	if self.module.updateXiaCard == 1 then
		local game_state = self.module.Msg_Table_GameStateNTF
		for i=1,self.module.PlayerNum do
			local localSeatID = self.module:get_local_seat(i-1)
			self.module.playersView[localSeatID]:refreshXiaZhang(game_state.player[i].xia_zhang)
		end
	end
end

return QZZPTablePlayer