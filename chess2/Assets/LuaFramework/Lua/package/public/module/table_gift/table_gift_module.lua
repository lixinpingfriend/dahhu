




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local list = require("list")
local ModuleBase = require('core.mvvm.module_base')
local TableGiftModule = class('TableGiftModule', ModuleBase)

function TableGiftModule:initialize(...)
	ModuleBase.initialize(self, 'table_gift_view', nil, ...)

	self:subscibe_package_event("Event_Table_Play_SendGift", function(eventHead, eventData)
		self.view:create_send_gift_anim(eventData)
	end)
end

function TableGiftModule:on_show(intentData)

end


return TableGiftModule