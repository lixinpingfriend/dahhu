




local class = require("lib.middleclass")
local ModuleBase = require('package.public.module.table_video_player.base_table_video_player_module')
local TableVideoPlayerModule = class('TableVideoPlayerModule', ModuleBase)

function TableVideoPlayerModule:initialize(...)
	ModuleBase.initialize(self, "table_video_player_view", nil, ...)
	self.packageName = "public"
	self.moduleName = "table_video_player"
end

return TableVideoPlayerModule