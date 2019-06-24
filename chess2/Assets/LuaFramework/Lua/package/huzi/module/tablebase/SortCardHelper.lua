local class       = require("lib.middleclass")
local SortCardHelper = class('SortCardHelper')
local MAX_HAND_COL = 11

--胡子排序方式
HuziSortCardType = 
{
	Huxi = 1,		--胡息排序
	Duizi = 2,		--对子排序
}

HuziSortKanPos = 
{
	Left  = 1,		--坎牌左边
	Center = 2,		--坎牌右边
}

--胡子一墩手牌类型
HuziHandCardType = 
{
	Ti = 1,			--提 4张1样的
	Kan = 2,		--坎 3张1样的
	Duizi = 3,		--对子 2张一样
	Jiao = 4,		--绞牌 2张1样 另一张大小不同 值一样		--王牌能插入对子 但不可插入绞牌 区分出来
	Shunzi = 5,		--顺子
	Menzi = 6,		--门子
	One = 7,		--单张
	Wang = 8,		--王牌
	OneBlend = 9,	--单张混合
}

SortCardHelper.STACK_ONE_MIN_COL = 9		--李阳需求 9列以后才开始合并

--初始化
function SortCardHelper:Init()	
	self.arrCardCount = {}
	self.lastArrCardCount = {}
	self.sortCard = {}
	self.lastData = nil
	for i=1,21 do
		self.arrCardCount[i] = 0
		self.lastArrCardCount[i] = 0
	end
end

--排序手牌
--[[
    --@cards: --纯数字手牌值
	--@type:  --排序类型 1胡息排序 2对子排序
	--@HandCardView: --手牌 插入时候需要用到
	--@bHuSort:      --是否是胡牌时整理
    @return:
]]
function SortCardHelper:SortHandCard(cards, HandCardView, bHuSort)
	if cards == nil then
		UnityLogError("cards == nil")
	end
	local key = "SortCard_" .. AppData.Game_Name .. TableManager.phzTableData.modelData.roleData.userID
	local type = ModuleCache.PlayerPrefsManager.GetInt(key, 1)
	self.kanPos = ModuleCache.PlayerPrefsManager.GetInt("ZP_ZPKanPos".. AppData.Game_Name, 1)		--坎的位置
	self.bHuSort = bHuSort
	self.HandCardView = HandCardView
	--判断是否插入一张牌  
	if self.cards ~= nil and #self.cards > 0 and #cards - #self.cards == 1 and not bHuSort then
		self:DealAddCrad(cards)
		self.cards = cards
		if self.insertCardTag then
			self:InsertCardToLastCol(self.nweCard)
			self:StackOneCard()
			return self.retSort
		end
		
	end

	self:Init()
	local nCount = #cards
	local value = 0
	for i=1, nCount do
		value = cards[i]
		self.arrCardCount[value] = self.arrCardCount[value] + 1
		self.lastArrCardCount[value] = self.lastArrCardCount[value] + 1
	end
	self.cards = cards
	if type == HuziSortCardType.Huxi then
		return self:SortHandCardByHuxi()
	elseif type == HuziSortCardType.Duizi then
		return self:SortHandCardByDuizi()
	end
end

--增加一列手牌
function SortCardHelper:AddColCard(values, type,bGray)
	local cards = {}
	cards.pai = {}
	cards.type = type
	local nCount = #values
	for i=1, nCount do
		cards.pai[i] = {}
		cards.pai[i].pai = values[i]
		cards.pai[i].is_gray = bGray
	end
	nCount = #self.sortCard
	self.sortCard[nCount + 1] = cards
end

--胡息排序
function SortCardHelper:SortHandCardByHuxi(cards)
	self:PickTi()
	self:PickWei()
	self:PickDaHuxi()
	self:PickXiaoHuxi()
	self:PickShunzi()
	self:PickDuizi()
	self:InserJiao()
	self:PickMen()
	self:PickOne()
	self:InsertWang()
	self:SortHandCardRet()

	self:StackOneCard()
	return self.retSort
end

--对子排序
function SortCardHelper:SortHandCardByDuizi()
	self:PickTi()
	self:PickWei()
	self:PickDuizi()
	self:PickDaHuxi()
	self:PickXiaoHuxi()
	self:PickShunzi()
	self:InserJiao()
	self:PickMen()
	self:PickOne()
	self:InsertWang()
	self:SortHandCardRet()

	self:StackOneCard()
	return self.retSort
end

--抽取4张相同的
function SortCardHelper:PickTi()
	for i=1,20 do
		if self.arrCardCount[i] == 4 then
			self.arrCardCount[i] = self.arrCardCount[i] - 4
			local cards = {i,i,i,i}
			self:AddColCard(cards, HuziHandCardType.Ti,true)
		end
	end
end

--抽取3张相同的
function SortCardHelper:PickWei()
	for i=1,20 do
		if self.arrCardCount[i] == 3 then
			self.arrCardCount[i] = self.arrCardCount[i] - 3
			local cards = {i,i,i}
			self:AddColCard(cards, HuziHandCardType.Kan, true)
		end
	end
end

--抽取大牌胡息  壹贰叁 和 贰柒拾
function SortCardHelper:PickDaHuxi()
	self:PickYiErSan(true)
	self:PickYiErSan(true)
	self:PickErQiShi(true)
	self:PickErQiShi(true)
end

--抽取小牌胡息 一二三 和 二七十
function SortCardHelper:PickXiaoHuxi()
	self:PickYiErSan(false)
	self:PickYiErSan(false)
	self:PickErQiShi(false)
	self:PickErQiShi(false)
end

--抽取壹贰叁(一二三)
function SortCardHelper:PickYiErSan(big)
	local nEx = 0
	if big ~= nil and big == true then
		nEx = 1
	end
	local erValue = 1	+ nEx
	local qiValue = 3	+ nEx
	local shiValue = 5	+ nEx
	if self.arrCardCount[erValue] >= 1 and self.arrCardCount[qiValue] >= 1 and self.arrCardCount[shiValue] >= 1 then
		self.arrCardCount[erValue] = self.arrCardCount[erValue] - 1
		self.arrCardCount[qiValue] = self.arrCardCount[qiValue] - 1
		self.arrCardCount[shiValue] = self.arrCardCount[shiValue] - 1
		local cards = {erValue, qiValue, shiValue}
		self:AddColCard(cards, HuziHandCardType.Shunzi,false)
	end
end

--选出贰柒拾(二七十)
function SortCardHelper:PickErQiShi(big)
	local nEx = 0
	if big ~= nil and big == true then
		nEx = 1
	end
	local yiValue = 3	+ nEx
	local erValue = 13	+ nEx
	local sanValue = 19	+ nEx
	if self.arrCardCount[yiValue] >= 1 and self.arrCardCount[erValue] >= 1 and self.arrCardCount[sanValue] >= 1 then
		self.arrCardCount[yiValue] = self.arrCardCount[yiValue] - 1
		self.arrCardCount[erValue] = self.arrCardCount[erValue] - 1
		self.arrCardCount[sanValue] = self.arrCardCount[sanValue] - 1
		local cards = {yiValue, erValue, sanValue}
		self:AddColCard(cards, HuziHandCardType.Shunzi,false)
	end
end

--抽取对子
function SortCardHelper:PickDuizi()
	for i=1,20 do
		if self.arrCardCount[i] == 2 then
			self.arrCardCount[i] = self.arrCardCount[i] - 2
			local cards = {i,i}
			self:AddColCard(cards, HuziHandCardType.Duizi, false)
		end
	end
end

--插入绞牌
function SortCardHelper:InserJiao()
	local nCount = #self.sortCard
	local value = 0
	local jiaoValue = 0
	for i=1, nCount do
		if self.sortCard[i].type == HuziHandCardType.Duizi then
			value = self.sortCard[i].pai[1].pai
			if value % 2 == 0 then
				jiaoValue = value - 1 --大牌值-1 获取对应的绞牌  
			else 
				jiaoValue = value + 1 --小牌值+1 获取对应的绞牌  
			end
			if self.arrCardCount[jiaoValue] >= 1 then	--还剩有绞牌则加入绞牌
				self.arrCardCount[jiaoValue] = self.arrCardCount[jiaoValue] - 1
				self.sortCard[i].type = HuziHandCardType.Jiao
				self.sortCard[i].pai[3] = {}
				self.sortCard[i].pai[3].pai = jiaoValue
				self.sortCard[i].pai[3].is_gray = false
			end
		end
	end
end

--抽取顺子
function SortCardHelper:PickShunzi()
	local value1 = 0
	local value2 = 0
	local value3 = 0
	for i=1, 16 do	--最大顺子 捌玖拾
		value1 = i
		value2 = i + 2
		value3 = i + 4
		if self.arrCardCount[value1] >= 1 and self.arrCardCount[value2] >= 1 and self.arrCardCount[value3] >= 1 then
			--另类情况 例如 44 567 分成44一列 567一列	优先插入一个对子
			local key = "SortCard_" .. AppData.Game_Name .. TableManager.phzTableData.modelData.roleData.userID
			local type = ModuleCache.PlayerPrefsManager.GetInt(key, 1)
			local bDuizi = self.arrCardCount[value1] >= 2
			local bLastShunzi = false
			local bLianDui = false
			if value3 < 19 then
				bLastShunzi = self.arrCardCount[value1+6] >= 1 and self.arrCardCount[value2] >= 1 and self.arrCardCount[value3] >= 1	--后面有顺子
				bLianDui = self.arrCardCount[value1] >= 2 and self.arrCardCount[value2] >= 2 and self.arrCardCount[value3] >= 2			--连队做两套顺子
			end
			if type == HuziSortCardType.Huxi and bDuizi and bLastShunzi and not bLianDui then
				self.arrCardCount[value1] = self.arrCardCount[value1] - 2
				local cards = {value1, value1}
				self:AddColCard(cards, HuziHandCardType.Duizi, false)
				self:PickShunzi()
				return
			end
			self.arrCardCount[value1] = self.arrCardCount[value1] - 1
			self.arrCardCount[value2] = self.arrCardCount[value2] - 1
			self.arrCardCount[value3] = self.arrCardCount[value3] - 1
			local cards = {value1, value2, value3}
			self:AddColCard(cards, HuziHandCardType.Shunzi, false)
			self:PickShunzi()
			return
		end
	end
end

--抽取缺门牌
function SortCardHelper:PickMen()
	local value1 = 0
	local value2 = 0
	local menValue = 0
	local ErQiShiValue = 0

	--优先挑选出所有绞牌门子
	for i=1,19, 2 do
		if self.arrCardCount[i] >= 1 and self.arrCardCount[i+1] >= 1 then
			self.arrCardCount[i] = self.arrCardCount[i] - 1
			self.arrCardCount[i+1] = self.arrCardCount[i+1] - 1
			local cards = {i, i+1}
			self:AddColCard(cards, HuziHandCardType.Menzi, false)
		end
	end

	for i=1, 19 do	--最大顺子 捌玖拾
		value1 = i
		value2 = 0
		ErQiShiValue = 0
		if self.arrCardCount[i] >= 1 then
			if value1 % 2 == 0 then
				menValue = value1 - 1 --大牌值-1 获取对应的绞牌  
			else 
				menValue = value1 + 1 --小牌值+1 获取对应的绞牌  
			end
			
			ErQiShiValue = self:GetErQiShiMenzi(value1)
			if self.arrCardCount[menValue] >= 1 then		--优先绞牌的门子
				value2 = menValue
			elseif (i+2) <= 20 and self.arrCardCount[i + 2] >= 1 then
				value2 = i + 2
			elseif (i+4) <= 20 and self.arrCardCount[i + 4] >= 1 then		--王牌独立排序
				value2 = i + 4
			elseif ErQiShiValue > 0 then				--最后二七十检测
				value2 = ErQiShiValue
			end
			if value2 ~= 0 then
				self.arrCardCount[value1] = self.arrCardCount[value1] - 1
				self.arrCardCount[value2] = self.arrCardCount[value2] - 1
				local cards = {value1, value2}
				self:AddColCard(cards, HuziHandCardType.Menzi, false)
			end
		end
	end
end

--获取二七十的门子
function SortCardHelper:GetErQiShiMenzi(value)
	local arr = 
	{
		{3, 13, 19},
		{4, 14, 20},
	}
	local ret = 0
	local arrIndex = 0
	for i=1, 2 do
		for j=1, 3 do
			if arr[i][j] == value then
				self.arrCardCount[value] = self.arrCardCount[value] - 1
				arrIndex = i
				break
			end
		end
	end

	if arrIndex > 0 then
		for i=1,3 do
			if arr[arrIndex][i] ~= value and self.arrCardCount[arr[arrIndex][i]] > 0 then
				ret = arr[arrIndex][i]
			end
		end
		self.arrCardCount[value] = self.arrCardCount[value] + 1
	end

	return ret
end

--抽取单张
function SortCardHelper:PickOne()
	local value1 = 0
	local nCount = 0
	for i=1, 20 do	--最大顺子 捌玖拾
		value1 = i
		if self.arrCardCount[value1] >= 1 then
			self.arrCardCount[value1] = self.arrCardCount[value1] - 1
			local cards = {value1}
			self:AddColCard(cards, HuziHandCardType.One, false)
			nCount = nCount + 1
		end
	end
end

--插入王牌
function SortCardHelper:InsertWang()
	--插王牌到对子中  ---->优先插入对子
	local nCount = #self.sortCard
	local value = 0
	local wangValue = 21
	for i=1, nCount do
		if self.sortCard[i].type == HuziHandCardType.Duizi then
			if self.arrCardCount[wangValue] >= 1 then	--还剩有绞牌则加入绞牌
				self.arrCardCount[wangValue] = self.arrCardCount[wangValue] - 1
				self.sortCard[i].pai[3] = {}
				self.sortCard[i].pai[3].pai = wangValue
				self.sortCard[i].pai[3].is_gray = false
			end
		end
	end
	--第二遍插入到门子中
	for i=1, nCount do
		if self.sortCard[i].type == HuziHandCardType.Menzi then
			if self.arrCardCount[wangValue] >= 1 then	--还剩有绞牌则加入绞牌
				self.arrCardCount[wangValue] = self.arrCardCount[wangValue] - 1
				self.sortCard[i].pai[3] = {}
				self.sortCard[i].pai[3].pai = wangValue
				self.sortCard[i].pai[3].is_gray = false
			end
		end
	end

	--剩下的王
	if self.arrCardCount[wangValue] == 1 then	--一张王牌
		local cards = {wangValue}
		self:AddColCard(cards, HuziHandCardType.Wang, false)
	elseif self.arrCardCount[wangValue] == 2 then	--二张王牌
		local cards = {wangValue, wangValue}
		self:AddColCard(cards, HuziHandCardType.Wang, false)
	elseif self.arrCardCount[wangValue] == 3 then	--三张王牌
		local cards = {wangValue, wangValue, wangValue}
		self:AddColCard(cards, HuziHandCardType.Wang, false)
	elseif self.arrCardCount[wangValue] == 4 then	--四张王牌
		local cards = {wangValue, wangValue}
		self:AddColCard(cards, HuziHandCardType.Wang, false)
		local cards2 = {wangValue, wangValue}
		self:AddColCard(cards2, HuziHandCardType.Wang, false)
	end
end

--牌墩排序 排序顺序：四张>固定坎>绞牌或对子>顺子>门子>单张   (同中类型 小张在大张前)
function SortCardHelper:SortHandCardRet()
	self.retSort = {} --最终返回结果
	for i = 1, HuziHandCardType.Wang do
		if i ~= HuziHandCardType.Jiao and i ~= HuziHandCardType.Duizi then	 --绞牌和对子特殊处理
			self:SortHandCardRetOneType(i, true)
		end

		if i == HuziHandCardType.Duizi then		--绞牌和对子一起处理
			self:SortHandCardRetOneType(i, true, HuziHandCardType.Jiao)
		end
	end

	self:SortKanPaiPos()
end

--排序一种类型牌墩
--type 第一种类型 
--big  大牌还是小牌
--type2 第二种类型  对子和绞牌同一层级
function SortCardHelper:SortHandCardRetOneType(type, big, type2)
	local nCount = #self.sortCard
	if type2 == nil then
		type2 = -1
	end
	for i=1, nCount do
		if self.sortCard[i].type == type or self.sortCard[i].type == type2 then
			self:AddToSortRet(self.sortCard[i])
			--[[if big then	
				if self.sortCard[i].pai[1].pai % 2 == 0 then
					self:AddToSortRet(self.sortCard[i])
				end
			else
				if self.sortCard[i].pai[1].pai % 2 == 1 then
					self:AddToSortRet(self.sortCard[i])
				end
			end--]]
		end
	end
end

function SortCardHelper:SortKanPaiPos()
	table.sort( self.retSort, function(a, b)
		local nA = a.pai[1].pai
		local nB = b.pai[1].pai
		if a.type == HuziHandCardType.One then
			nA = nA + 10000
		end
		if b.type == HuziHandCardType.One then
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

--堆叠一张的牌
function SortCardHelper:StackOneCard()
	local nCount = #self.retSort
	if nCount < self.STACK_ONE_MIN_COL and not self.bHuSort then		
		return
	end

	--先找出所有单张
	local arrOne = {}
	local index = 1
	local startRetIndex = 0
	for i=1, nCount do
		if self.retSort[i].type == HuziHandCardType.One then
			arrOne[index] = self.retSort[i].pai[1].pai
			self.retSort[i] = nil
			if index == 1 then
				startRetIndex = i
			end
			index = index + 1
		end

		--王牌也算单张
		if self.retSort[i] ~= nil and self.retSort[i].type == HuziHandCardType.Wang then
			if index == 1 then
				startRetIndex = i
			end
			local n = #self.retSort[i].pai
			for j=1, n do
				arrOne[index] = self.retSort[i].pai[j].pai
				index = index + 1
			end
			self.retSort[i] = nil
		end
	end

	nCount = math.modf(#arrOne / 3) + 1
	index = 1
	for i = 0, nCount do
		local arr = {}
		arr.type = HuziHandCardType.OneBlend
		arr.pai = {}
		for j=1, 3 do
			if arrOne[i*3 + j] ~= nil and arrOne[i*3 + j] > 0 then
				arr.pai[j] = {}
				arr.pai[j].pai = arrOne[i*3 + j]
				arr.pai[j].is_gray = false
			end
		end
		if arr.pai[1] ~= nil then
			self.retSort[startRetIndex] = arr
			startRetIndex = startRetIndex + 1
		end
	end
end

--增加到最终结果
function SortCardHelper:AddToSortRet(cards)
	self.retSort = self.retSort or {}
	local nCount = #self.retSort
	self.retSort[nCount + 1] = cards
end


--插入牌的处理
function SortCardHelper:DealAddCrad(newCards)
	self.insertCardTag = false
	self:GetHandCard()

	--找出新加的那张牌
	local nCount = #newCards
	local value = 0
	self.newArrCardCount = {}
	for i=1,21 do
		self.newArrCardCount[i] = 0
	end
	for i=1, nCount do
		value = newCards[i]
		self.newArrCardCount[value] = self.newArrCardCount[value] + 1
	end

	local nNewCard = 0
	for i=1,21 do
		if self.newArrCardCount[i] - self.lastArrCardCount[i] == 1 then
			nNewCard = i
			break
		end
	end
	self.lastArrCardCount = self.newArrCardCount		--为下一次做铺垫
	--插入最后列
	self.nweCard = nNewCard
	if self.nweCard == 21 then
		self.insertCardTag = true
	end
end

--获取手牌排序
function SortCardHelper:GetHandCard()
	self.retSort = {}
	if self.HandCardView == nil then
		UnityLogYellow("error: self.HandCardView == nil")
		return
	end
	local nCount = #self.HandCardView.card
	local cards = self.HandCardView.card
	local index = 1
	for i=1, nCount do
		if cards[i][1].id > 0 then
			self.retSort[index] = {}
			self.retSort[index].pai = {}
			for j=1,4 do
				if cards[i][j].id > 0 then
					self.retSort[index].pai[j] = {}
					self.retSort[index].pai[j].pai = cards[i][j].id
					self.retSort[index].pai[j].is_gray = false
				end
			end
			self:CheckColCardGray(self.retSort[index].pai)
			index = index + 1
		end
	end
end

--检查一列牌 是否置灰
function SortCardHelper:CheckColCardGray(pai)
	if #pai < 3 then
		return
	end
	if pai[1].pai == pai[2].pai and pai[2].pai == pai[3].pai then
		for i=1, #pai do
			pai[i].is_gray = true
		end
		if pai[1].pai == self.nweCard then
			if pai[4] == nil then
				pai[4] = {}
			end
			
			pai[4].pai = self.nweCard
			pai[4].is_gray = true
			self.nweCard = -1
		end
	end
end

--将一张牌插入最后一列
function SortCardHelper:InsertCardToLastCol(newCard)
	if self.nweCard == -1 then	--已经插入到坎中
		return
	end
	if self.HandCardView == nil then
		UnityLogYellow("error: self.HandCardView == nil")
	end
	--从最后开始 插入到能插入的地方
	local nCount = #self.retSort
	if nCount < MAX_HAND_COL then
		self.retSort[nCount + 1] = {}
		self.retSort[nCount + 1].pai = {}
		self.retSort[nCount + 1].pai[1] = {}
		self.retSort[nCount + 1].pai[1].pai = self.nweCard
		self.retSort[nCount + 1].pai[1].is_gray = false
	else
		for i=nCount, 1, -1 do
			local nSubCount = #self.retSort[i].pai
			if nSubCount < 4 then
				self.retSort[i].pai[nSubCount + 1] = {}
				self.retSort[i].pai[nSubCount + 1].pai = self.nweCard
				self.retSort[i].pai[nSubCount + 1].is_gray = false
				break
			end
		end
	end
	self.nweCard = -1
end

return SortCardHelper