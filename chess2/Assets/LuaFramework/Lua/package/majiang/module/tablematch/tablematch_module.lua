

local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableMatchModule = class("tableMatchModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local curTableData

function TableMatchModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablematch_view", "tablematch_model", ...)
	curTableData = TableManager.curTableData
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TableMatchModule:on_module_inited()
	
end

-- 绑定module层的交互事件
function TableMatchModule:on_module_event_bind()
	self:subscibe_module_event("table", "Event_All_Player_Ready", function(eventHead, eventData)
		-- 比赛场显示 匹配对手提示  curTableData.RoomType == 3   是比赛场
		if TableManager.curTableData.RoomType == 3	then
			self.view.matePlayerObj:SetActive(not eventData)

			if self.gameState then
				if self.gameState.CurRound ~= 0 then
					self.view.matePlayerObj:SetActive(false) 
				end
			end
		end
	end)

	self:subscibe_module_event("table", "Event_Refresh_State", function(eventHead, eventData)
		self.gameState = eventData
		local localSeat = nil
		local seatHolder = nil
		for i,v in ipairs(eventData.Player) do
			localSeat = TableUtil.get_local_seat(i - 1, curTableData.SeatID, curTableData.totalSeat)
			seatHolder = curTableData.seatHolderArray[localSeat]
			--print("----------------收到服务器的托管状态：",v.IntrustState)
			if seatHolder.playerId == self.modelData.roleData.userID then
				--int32 IntrustState = 39; // 牌局托管状态 (0:未托管 1:正在托管但可取消 2:正在托管且不能取消)
				if self.gameState.Result ~= 1 and self.gameState.Result ~=2 then
					self.view:DepositState(v.IntrustState)
				else
					self.view:DepositState(0)
				end
			end
		end
		
	end)
end

function TableMatchModule:on_show(is_New_Sever)
	
end

function TableMatchModule:on_click(obj, arg)	
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "FullCancelBtn" then
		--type 1 托管   2 取消托管
		self.model:request_cancel_intrust(2)
	elseif(obj.name == "cancelTuoGuanBtn") then
		self.model:request_cancel_intrust(2)
	end
end

return TableMatchModule



