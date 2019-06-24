
local class = require("lib.middleclass")
local PlayerBase = require('package.huzi.module.tablebase.tablebase_player')
local QZZPTablePlayer = class("QZZPTablePlayer", PlayerBase)
local Manager = require("package.public.module.function_manager")
local TableUtil = require("package.public.table_util")
local SoundManager = require("package.huzi.module.tablebase.sound_manager")
local Tween = DG.Tweening
QZZPTablePlayer.actionOverride = {}
QZZPTablePlayer.actionOverride[HuziAction.KaiZhao] = 3

QZZPTablePlayer.soundPath = "xxzp"

function QZZPTablePlayer:update_score(score)
	if self.module.Msg_Table_UserStateNTF and self.module.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
		self.seat.IconJinBi.gameObject:SetActive(true)
		local str = TableUtil.GetStringNum(score)
		self.seat.score.text = str
		return
	end
	if self.module.Msg_Table_GameStateNTF ~= nil then
		local data = self.module.Msg_Table_GameStateNTF
		for i=1, #data.player do
			local localSeatID = self.module:get_local_seat(i-1)
			if localSeatID == self.PlayerIndex then
				score = data.player[i].total_hu_xi
			end
		end
	else
		score = 0
	end 
	
	self.seat.score.text = score .. ""
	
end


function QZZPTablePlayer:SetDaTuo(bDaTuo)
	if self.loadTuoTag == nil or self.loadTuoTag == false then		--是否加载了打坨标记
		self.seat.objTuo = Manager.CopyObject(self.seat.banker, self.seat.objInfo.transform)
		self.seat.objTuo.name = "TagTuo" 

		--动态加载图片
		local bundlePath = "huzi/module/table/huzi_tableglzp.atlas"
		local assetName = "Public_Table_标签_图坨"
		local img = self.seat.objTuo:GetComponent("Image")
		img.sprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, assetName)

		--设置位置和大小
		local rectTran = self.seat.objTuo:GetComponent("RectTransform")
		rectTran.anchoredPosition = Vector2(26.1, 100)
		rectTran.sizeDelta = Vector2(60, 60)
		self.loadTuoTag = true
	end
	self.seat.objTuo:SetActive(bDaTuo)
end

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