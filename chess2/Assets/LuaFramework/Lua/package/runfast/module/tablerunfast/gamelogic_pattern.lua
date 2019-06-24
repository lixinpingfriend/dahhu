local table = table
local BranchPackageName = AppData.BranchRunfastName
local CardCommon = require(string.format("package/%s/module/tablerunfast/gamelogic_common",BranchPackageName))--require "gamelogic_common"
--local CardCommon = require "gamelogic_common"
-- 牌型类
local CardPattern={}


CardPattern.card_cnt = 0

-- 牌名索引 （牌名-1）* 4 + 花色, 前端收到的永远只是牌名索引，但可通过牌名索引计算出牌名与花色
-- 前后端及传输协议中保存的都是牌名索引
CardPattern.cards={}
CardPattern.value=0
CardPattern.type=CardCommon.unknown
CardPattern.repeat_cnt=1
CardPattern.disp_type =CardCommon.unknown
-- 新建并初始化一个牌型实例 return instance of CardPattern
function CardPattern.new(cards,owner_set_cnt, is_black3_player)
	local o = {}
    
	setmetatable(o, {__index=CardPattern})
	if not o:parse(cards,owner_set_cnt,is_black3_player)then
		return nil
	end
	return o
end

-- 判断两次出牌的牌型是否匹配
function CardPattern:compable(card_obj)
	assert((self.type > CardCommon.type_unknown) )
	assert((card_obj.type > CardCommon.type_unknown))
	if self.type == CardCommon.type_four or card_obj.type == CardCommon.type_four then
		return true
	elseif self.card_cnt ~= card_obj.card_cnt then
        if self.type == card_obj.type and self.repeat_cnt == card_obj.repeat_cnt  then
            if self.type == CardCommon.type_three and CardCommon.config.tailed_tripple then
                if (self.owner_set_cnt == self.card_cnt) then
                    return true
                end
            end
        end
		return false
	else
		return self.type == card_obj.type
	end
end

-- 判断两次出牌的大小 小于等于返回真，否则返回假
function CardPattern:le(card_obj)
	-- 牌型系数说明,影响牌值比较
	local CardTypeFactor={0,0,0,(CardCommon.max_card_value)*1,0,0}
	-- 要求调用此函数之前必须先调用compable
	assert(card_obj ~= nil)
	assert(self:compable(card_obj))
	-- 牌值合法性检查
	assert(self.value <=  CardCommon.max_card_value and  self.value >  0)
	assert(card_obj.value <=  CardCommon.max_card_value and card_obj.value > 0)
	if (self.value+CardTypeFactor[self.type]) <=  (card_obj.value+CardTypeFactor[card_obj.type])
		then
		return true
	else
		return false
	end
end
local dispTypeOfSingle = {"one1", "one2", "one3", "one4", "one5", "one6", "one7", "one8", "one9", "one10", "one11", "one12", "one13"};
local dispTypeOfDouble = {"dui1", "dui2", "dui3", "dui4", "dui5", "dui6", "dui7", "dui8", "dui9", "dui10", "dui11", "dui12", "dui13"};
local dispTypeOfThree =  {"san1", "san2", "san3", "san4", "san5", "san6", "san7", "san8", "san9", "san10", "san11", "san12", "san13"};
function CardPattern:parseDispType()
	if self.type == CardCommon.type_single then 
		if (self.repeat_cnt == 1) then
			self.disp_type = dispTypeOfSingle[CardCommon.ResolveCardIdx(self.cards[1]).name];
		elseif (self.repeat_cnt >= 5) then 
			self.disp_type = "shunzi"
		end
	elseif self.type == CardCommon.type_double then
		if (self.repeat_cnt == 1) then
			self.disp_type = dispTypeOfDouble[CardCommon.ResolveCardIdx(self.cards[1]).name];
		else
			self.disp_type = "liandui"
		end
	elseif self.type == CardCommon.type_three then
		if (self.repeat_cnt == 1) then
			if (self.card_cnt == 3) then 
				self.disp_type = dispTypeOfThree[CardCommon.Value2Name(self.value)];
			elseif (self.card_cnt == 4) then
				self.disp_type = "sandaiyi"
			elseif (self.card_cnt == 5) then
				self.disp_type = "sandaier"
			end
		else
			self.disp_type = "feiji"
		end
	elseif self.type == CardCommon.type_four then 
		self.disp_type = "zhadan"
	elseif self.type == CardCommon.type_4plus3 then
		self.disp_type = "sidaisan"
	end
end
-- 判断是否为合法牌型，合法返回true,否则返回假
function CardPattern:parse(cards, owner_set_cnt, is_black3_player)
	--table.sort( self.cards )
	
	local tripleA_is_bomb = CardCommon.config.tripleA_is_bomb;
    local no_triple_p1 = CardCommon.config.no_triple_p1;
    local allow_unruled_multitriple = CardCommon.config.allow_unruled_multitriple;
    local strong_triple = CardCommon.config.strong_triple
    local strong_double = CardCommon.config.strong_double;
    if (cards ~= nil)then
		self.cards = {}
		for i,c in ipairs(cards)
		do
			table.insert(self.cards, c)
		end
	end
	self.card_cnt = #self.cards
	if (not owner_set_cnt) then
			owner_set_cnt = 16
	end
    self.owner_set_cnt = owner_set_cnt
	-- 单牌，直接返回
	if (self.card_cnt == 1) then
		self.type = CardCommon.type_single
		self.value = CardCommon.NameIdx2Value(cards[1])
		self.repeat_cnt = 1
		self:parseDispType()
		return true
	end

	local card_type_stat,card_name_info,card_name_stat=CardCommon.InitParse(self.cards)
    if is_black3_player and card_name_stat[CardCommon.card_3] == 3 and self.card_cnt == 3 then
        self.type = CardCommon.type_four
		self.value = CardCommon.Name2Value(CardCommon.card_3)
		self.repeat_cnt = 1
		self:parseDispType()
		return true
    end 
    
    if tripleA_is_bomb and  card_type_stat[CardCommon.type_three][1] == CardCommon.card_A and self.card_cnt == 4 then
		self.type = CardCommon.type_four
		local card_name = card_type_stat[CardCommon.type_three][1]
		self.value = CardCommon.Name2Value(card_name)
		self.repeat_cnt = 1
		self:parseDispType()
        return true;
    end

	if (#card_type_stat[CardCommon.type_four] > 0)then
		if #self.cards == 4 then
		    self.type = CardCommon.type_four
		    local card_name = card_type_stat[CardCommon.type_four][1]
		    self.value = CardCommon.Name2Value(card_name)
		    self.repeat_cnt = 1
		    self:parseDispType()
		    return true
		end
		for ix,c in ipairs(card_type_stat[CardCommon.type_four]) do
            table.insert(card_type_stat[CardCommon.type_three], c);
        end
        CardCommon.SortAsc(card_type_stat[CardCommon.type_three], true)
	end

	if CardCommon.config.allow_4plus3 then
		local max_repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_four], card_name_stat)
		if max_repeat_info ~= nil and max_repeat_info.repeat_cnt > 0 then
			if  max_repeat_info.repeat_cnt * 4 + 3 == self.card_cnt or owner_set_cnt < 7 then
				if self.card_cnt == 5 then
					self.type = CardCommon.type_three
				else
					self.type = CardCommon.type_4plus3
				end
				self.value = CardCommon.Name2Value(max_repeat_info.card_end)
				self.repeat_cnt = 1
				self:parseDispType()
				return true
			end
			--return false
		end
	end
	local max_repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_three],card_name_stat)
	if (max_repeat_info ~= nil) then
        if strong_triple then 
            local type_cnt_4 = #card_type_stat[CardCommon.type_four];
            local type_cnt_2 = #card_type_stat[CardCommon.type_double];
            for _,ci in ipairs(max_repeat_info.cards) do
                for _,c in ipairs(card_type_stat[CardCommon.type_double]) do
                    if c == ci then
                        type_cnt_2 = type_cnt_2 - 1;
                        break;
                    end
                end
                
                for _,c in ipairs(card_type_stat[CardCommon.type_four]) do
                    if c == ci then
                        type_cnt_4 = type_cnt_4 - 1;
                        break;
                    end
                end
                
            end

            while max_repeat_info.repeat_cnt > 0 do
			    if (max_repeat_info.repeat_cnt*3 == self.card_cnt) or 
				   (max_repeat_info.repeat_cnt*5 == self.card_cnt and max_repeat_info.repeat_cnt == type_cnt_2) or
                   (max_repeat_info.repeat_cnt*5 == self.card_cnt and max_repeat_info.repeat_cnt*2 == type_cnt_4*4) 
                then
				    self.type = CardCommon.type_three
				    self.value = CardCommon.Name2Value(max_repeat_info.card_end)
				    self.repeat_cnt = max_repeat_info.repeat_cnt
				    self:parseDispType()
				    return true
			    end
			    max_repeat_info.repeat_cnt = max_repeat_info.repeat_cnt - 1;
		    end
        else 
		    while max_repeat_info.repeat_cnt > 0 do
			    if (max_repeat_info.repeat_cnt*3 == self.card_cnt or 
				    max_repeat_info.repeat_cnt*5 == self.card_cnt or 
				    ((not no_triple_p1) and owner_set_cnt <= 5) or 
                    ((allow_unruled_multitriple) and owner_set_cnt <= max_repeat_info.repeat_cnt*5 and owner_set_cnt == self.card_cnt)) then
				    self.type = CardCommon.type_three
				    self.value = CardCommon.Name2Value(max_repeat_info.card_end)
				    self.repeat_cnt = max_repeat_info.repeat_cnt
				    self:parseDispType()
				    return true
			    end
			    max_repeat_info.repeat_cnt = max_repeat_info.repeat_cnt - 1;
		    end
        end 
		return false
	end


	max_repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_double],card_name_stat)
	if (max_repeat_info ~= nil) then
		if (max_repeat_info.repeat_cnt*2 == self.card_cnt and (not strong_double)) or
           (max_repeat_info.repeat_cnt*2 == self.card_cnt and (max_repeat_info.repeat_cnt == 1 or max_repeat_info.repeat_cnt > 2))
        then
			self.type = CardCommon.type_double
			self.value = CardCommon.Name2Value(max_repeat_info.card_end)
			self.repeat_cnt = max_repeat_info.repeat_cnt
			self:parseDispType()
			return true
		else
			return false
		end
	end

	max_repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_single],card_name_stat)
	if (max_repeat_info ~= nil) and (max_repeat_info.repeat_cnt > 4) then
		if (max_repeat_info.repeat_cnt == self.card_cnt) then
			self.type = CardCommon.type_single
			self.value = CardCommon.Name2Value(max_repeat_info.card_end)
			self.repeat_cnt = max_repeat_info.repeat_cnt
			self:parseDispType()
			return true
		else
			return false
		end
	end
	return false
end
function CardPattern:count(card)
    local cnt = 0;
    for _,c in ipairs(self.cards) do
        if (c == card) then
            cnt = cnt + 1;
        end
    end 
    return cnt;
end
return CardPattern

