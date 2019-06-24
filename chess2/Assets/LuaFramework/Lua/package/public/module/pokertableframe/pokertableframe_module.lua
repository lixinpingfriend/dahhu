




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local list = require("list")
local ModuleBase = require('core.mvvm.module_base')
---@class PokerTableFrameModule
---@field view PokerTableFrameView
local PokerTableFrameModule = class('tableModule', ModuleBase)

local UpdateBeat = UpdateBeat
local Time = Time

function PokerTableFrameModule:initialize(...)
	ModuleBase.initialize(self, 'pokertableframe_view', nil, ...)
end

function PokerTableFrameModule:on_show(intentData)
	self._intentData = intentData
	local style = intentData.style or 1
	self.view:initView(style)
	self.rule = intentData.rule
	local roomNumber = intentData.roomNumber
	self.view:setRoomInfo(roomNumber)
	local showShopBtn = intentData.show_shop_btn
	self.view.is_show_shop = showShopBtn
	self.view:show_shop_btn(showShopBtn or false)
	self.view:show_location_btn(intentData.show_location_btn or false)
end


function PokerTableFrameModule:on_update_per_second()
	self.view:refreshBatteryAndTimeInfo()
end


function PokerTableFrameModule:on_module_event_bind()
	self:subscibe_package_event("Event_Refresh_Ping_Value", function(eventHead, eventData)
		self.view:show_ping_delay(true, eventData or 30)
	end)

	self:subscibe_package_event("Event_On_PokerTable_Destroy", function(eventHead, eventData)
		ModuleCache.ModuleManager.destroy_module("public", "pokertableframe")
	end)
end

function PokerTableFrameModule:on_click(obj, arg)
	if(obj.name == 'BtnLeftOpen')then
		self:on_click_open_btn(obj, arg)
	elseif(obj.name == 'BtnLeftClose')then
		self:on_click_close_btn(obj, arg)
	elseif(obj.name == 'ButtonLeave')then
		self:dispatch_package_event('Event_PokerTableFrame_Click_Leave', obj)
	elseif(obj.name == 'ButtonFree')then
		if(self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0) then

			local ruleTable = ModuleCache.Json.decode(self.modelData.curTableData.roomInfo.rule)
			if not ruleTable.allowDissolveRoom or ruleTable.allowDissolveRoom == 1 then
				print("=====解散房间")
				self:dispatch_package_event('Event_PokerTableFrame_Click_Free')
			else
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主禁止解散房间。")
			end
		else
			print("=====解散房间")
			self:dispatch_package_event('Event_PokerTableFrame_Click_Free')
		end


	elseif(obj.name == 'ButtonSettings')then
		self:dispatch_package_event('Event_PokerTableFrame_Click_Setting', obj)
	elseif(obj.name == 'ButtonRule')then
		self:on_click_rule_btn(obj, arg)
	elseif(obj.name == 'ButtonRuleExplain')then
		self:on_click_wanfashuoming_btn(obj, arg)
	elseif(obj == self.view.buttonTextReconnect.gameObject)then
		self:dispatch_package_event('Event_PokerTableFrame_Click_TestReconnect')
	elseif(obj.name == 'ButtonLocation')then
		self:dispatch_package_event('Event_PokerTableFrame_Click_Location')
	elseif(obj.name == 'buttonGoldShop')then
		self:on_click_shop_btn(obj, arg)
	elseif(obj.name == 'ButtonCustomService')then
		ModuleCache.ModuleManager.show_public_module("customerservicesystem")
	elseif(obj == self.view.buttonActivity.gameObject)then
		self:on_click_activity_btn(obj, arg)
	end
end

function PokerTableFrameModule:on_click_activity_btn(obj, arg)
    local object = 
        {
        showRegionType = "table",
        showType="Manual",
        }
	ModuleCache.ModuleManager.show_public_module("activity", object)
end

function PokerTableFrameModule:on_click_shop_btn(obj, arg)
	ModuleCache.ModuleManager.show_module("public", "goldadd")
end

function PokerTableFrameModule:on_click_open_btn(obj, arg)
	self.view:show_detail_panel(true)
	local roomInfo = self._intentData.roomInfo
	if(roomInfo and roomInfo.curRoundNum and roomInfo.curRoundNum > 0)then
		self.view:show_free_btn(true)
	else
		self.view:show_free_btn(false)
	end
end

function PokerTableFrameModule:on_click_close_btn(obj, arg)
	self.view:show_detail_panel(false)
end

function PokerTableFrameModule:on_destroy()
	if self._addUpdateBeat then
		UpdateBeat:Remove(self._update, self)
	end
end

function PokerTableFrameModule:on_click_rule_btn(obj, arg)
	if(self.rule)then
		local animArg = {
			fromPos = obj.transform.position,
			fromScale = Vector3.New(0.01, 0.01, 1),
			duration = 0.5,
			ease = DG.Tweening.Ease.OutBack,
		}
		ModuleCache.ModuleManager.show_module("public", "tablerule", self.rule, animArg)
	end
end

function PokerTableFrameModule:on_click_wanfashuoming_btn(obj, arg)
	local animArg = {
		fromPos = obj.transform.position,
		fromScale = Vector3.New(0.01, 0.01, 1),
		duration = 0.5,
		ease = DG.Tweening.Ease.OutBack,
	}
	ModuleCache.ModuleManager.show_module("public", "goldhowtoplay", nil, animArg)
end

-- 获取活动左侧列表协议
function PokerTableFrameModule:check_activity_is_open()
	local object =
	{
		buttonActivity=self.view.buttonActivity,
		spriteRedPoint = self.view.spriteActivityRedPoint
	}
	ModuleCache.ModuleManager.show_public_module("activity", object);
end


return PokerTableFrameModule