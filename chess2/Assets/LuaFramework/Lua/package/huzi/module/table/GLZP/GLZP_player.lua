
local class = require("lib.middleclass")
local PlayerBase = require('package.huzi.module.tablebase.tablebase_player')
local QZZPTablePlayer = class("QZZPTablePlayer", PlayerBase)
local SoundManager = require("package.huzi.module.tablebase.sound_manager")

QZZPTablePlayer.actionOverride = {}
QZZPTablePlayer.actionOverride[HuziAction.WeiOrSao] = 3
QZZPTablePlayer.actionOverride[HuziAction.GuoSao] = 2
QZZPTablePlayer.actionOverride[HuziAction.Ti] = 5

QZZPTablePlayer.soundPath = "glzp"
QZZPTablePlayer.chatPath = "glzp"
QZZPTablePlayer.XingAssetName = "Guangxi_Table_要牌_翻醒"

function QZZPTablePlayer:InitSeat()
	PlayerBase.InitSeat(self)
	--if self.PlayerIndex == 4 or self.PlayerIndex == 1 then
		local rectTran = self.seat.kick:GetComponent("RectTransform")
		rectTran.anchoredPosition = Vector2(-1, -28.6)
	--end
end

function QZZPTablePlayer:show_chuzhangZuoZing(value)
	self.module:start_lua_coroutine(function ()
		self.card.chu.root.gameObject.transform.position = self.view.CenterPos
		local zipaiz = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPPaiLei" .. AppData.Game_Name, 1)
		self.card.chuBg1:SetActive(zipaiz ~= 3)
		self.card.chuBg2:SetActive(zipaiz == 3)
		self.card.chu:Show(true)
        self.card.chu.root.gameObject.transform:DOMove(self.view.exNode.player[self.PlayerIndex].paiPos, 1)
        self.card.chu:SetData(0)
        coroutine.wait(1.5)
		self.card.chu:SetData(value)
        coroutine.wait(2)
        self.card.chu:Show(false)
    end)
end

function QZZPTablePlayer:SetXingData()
	PlayerBase.SetXingData(self)
	local ruleInfo = TableUtilPaoHuZi.convert_rule(TableManager.phzTableData.Rule)
	--播放翻醒声音
	local path = self.man and self.soundPath .. "/m_fanxing" or self.soundPath .. "/f_fanxing"
	local name = self.man and "M_FanXing" or "F_FanXing"
	SoundManager:play_sound(path, name)
end

return QZZPTablePlayer