




local class = require("lib.middleclass")
local View = require('package.public.module.table_video_player.base_table_video_player_view')
local TableVideoPlayerView = class('TableVideoPlayerView', View)

function TableVideoPlayerView:initialize(...)
    View.initialize(self, "public/module/pokertablevideoplayer/table_video_player.prefab", "Table_Video_Player", 2)
end

return  TableVideoPlayerView