






local ViewBase = require("core.mvvm.view_base")
local Class = require("lib.middleclass")

local Manager = require("package.public.module.function_manager")

local PlaybackView = Class("HuZi.PlaybackView", ViewBase)

local AssetBundleName = "huzi/module/playback/huzi_playback.prefab"
local AssetName = "HuZi_Playback"

function PlaybackView:initialize(...)
    ViewBase.initialize(self, AssetBundleName, AssetName, 2)

    self.btnPlay = Manager.GetButton(self.root, "Play")
	self.btnPause = Manager.GetButton(self.root, "Pause")
	self.ButtonNextRound = Manager.GetButton(self.root, "NextRound")
	self.ButtonLastRound = Manager.GetButton(self.root, "LastRound")

	local Manager = require("package.public.module.function_manager")
	self:fixed_tran_size(self.root)
end

return PlaybackView