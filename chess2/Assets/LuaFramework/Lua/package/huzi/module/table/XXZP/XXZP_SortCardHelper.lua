---湘乡 娄底 大冶通用


local class       = require("lib.middleclass")
local SortBase = require("package.huzi.module.tablebase.SortCardHelper")
local SortCardHelper = class("XXZP_SortCardHelper", SortBase)

SortCardHelper.STACK_ONE_MIN_COL = 11

function SortCardHelper:StackOneCard()
	local nCount = #self.retSort
	if nCount < self.STACK_ONE_MIN_COL and not self.bHuSort then		
		return
	end
	if self.retSort[12] ~= nil then
		self.retSort[11].pai[2] = self.retSort[12].pai[1]
		self.retSort[11].type = HuziHandCardType.OneBlend
		self.retSort[12] = nil
	end

	if self.retSort[13] ~= nil then
		self.retSort[11].pai[3] = self.retSort[13].pai[1]
		self.retSort[13] = nil
	end

	if self.retSort[14] ~= nil then
		self.retSort[10].pai[2] = self.retSort[14].pai[1]
		self.retSort[10].type = HuziHandCardType.OneBlend
		self.retSort[14] = nil
	end

	if self.retSort[15] ~= nil then
		self.retSort[10].pai[3] = self.retSort[15].pai[1]
		self.retSort[15] = nil
	end
end	

function SortCardHelper:SortHandCardByHuxi(cards)
	SortBase.SortHandCardByHuxi(self,cards)
	self:XXZPSortRet()
	return self.retSort
end

function SortCardHelper:SortHandCardByDuizi(cards)
	SortBase.SortHandCardByDuizi(self,cards)
	self:XXZPSortRet()
	return self.retSort
end

--湘乡字牌再次排序
function SortCardHelper:XXZPSortRet()
	table.sort( self.retSort, function(a, b)
		local nA = a.pai[1].pai
		local nB = b.pai[1].pai
		if a.type == HuziHandCardType.OneBlend then
			nA = nA + 10000
		end
		if b.type == HuziHandCardType.OneBlend then
			nB = nB + 10000
		end
		if self.kanPos == HuziSortKanPos.Left and (a.type == HuziHandCardType.Ti or a.type == HuziHandCardType.Kan) then
			nA = nA - 10000
		end
		if self.kanPos == HuziSortKanPos.Left and (b.type == HuziHandCardType.Ti or b.type == HuziHandCardType.Kan) then
			nB = nB - 10000
		end
		local b1 = (nA + 1 == nB and nB % 2 == 0)
		if b1 then return false	end
		local b2 = (nA - 1 == nB and nA % 2 == 0)
		if b2 then return true	end
		return nA < nB
	end )
end

return SortCardHelper