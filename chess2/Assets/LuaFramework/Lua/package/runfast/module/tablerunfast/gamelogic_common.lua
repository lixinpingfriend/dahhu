local CardCommon={}

-- 牌型说明 取值范围 1~4 1代表单牌 2代表对子 3代表三张相同 4代表炸弹
CardCommon.type_unknown=0
CardCommon.type_single=1
CardCommon.type_double=2
CardCommon.type_three=3
CardCommon.type_four=4
CardCommon.type_4plus3=5
-- 显示牌型说明 取值范围
--[[
one1
one2
one3
one4
one5
one6
one7
one8
one9
one10
one11
one12
one13
dui1
dui2
dui3
dui4
dui5
dui6
dui7
dui8
dui9
dui10
dui11
dui12
dui13
shunzi
sanzhang
sandaiyi
sandaier
liandui
feiji
zhadan
yaobuqi--]]
-- 牌名说明 取值范围1~15  11代表J, 12代表Q, 13代表K, 1代表A, 2~10代表2~10 14代表小王 15代表大王
CardCommon.card_unknown=0
CardCommon.card_A=1
CardCommon.card_2=2
CardCommon.card_3=3
CardCommon.card_4=4
CardCommon.card_5=5
CardCommon.card_6=6
CardCommon.card_7=7
CardCommon.card_8=8
CardCommon.card_9=9
CardCommon.card_10=10
CardCommon.card_J=11
CardCommon.card_Q=12
CardCommon.card_K=13
CardCommon.card_small_king=14
CardCommon.card_big_king=15
-- 花色说明 取值范围1~4   1代表黑桃 2代表红桃 3代表梅花 4代表方块
CardCommon.color_unkown=0
CardCommon.color_black_heart=1
CardCommon.color_red_heart=2
CardCommon.color_plum=3
CardCommon.color_square=4
-- 牌值定义，下标对应到牌名
CardCommon.CardValue={12,14,1,2,3,4,5,6,7,8,9,10,11,16,18}
CardCommon.SortedCardName={
	CardCommon.card_3,
	CardCommon.card_4,
	CardCommon.card_5,
	CardCommon.card_6,
	CardCommon.card_7,
	CardCommon.card_8,
	CardCommon.card_9,
	CardCommon.card_10,
	CardCommon.card_J,
	CardCommon.card_Q,
	CardCommon.card_K,
	CardCommon.card_A,
	CardCommon.card_2,
	CardCommon.card_small_king,
	CardCommon.card_big_king
}
CardCommon.max_card_value=15
CardCommon.max_card_name=CardCommon.card_big_king
CardCommon.max_normal_card_name=13
CardCommon.max_card_cnt = 13*4+2
CardCommon.config = {}
function CardCommon.InitConf(room_conf)
	CardCommon.config = room_conf or {}
    if (room_conf.wanfa and (room_conf.wanfa == "jiangsu" or room_conf.wanfa == "jiangsu_guanpai")) then
        CardCommon.config.no_triple_p1=true
        CardCommon.config.tripleA_is_bomb= room_conf.wanfa == "jiangsu_guanpai"
        CardCommon.config.allow_unruled_multitriple = false;
        CardCommon.config.strong_triple = true;
        CardCommon.config.strong_double = false;
		CardCommon.config.tailed_tripple = false;
		CardCommon.config.allow_4plus3 = false;
    else
		if CardCommon.config.tailed_tripple then
			CardCommon.config.allow_unruled_multitriple = true
		end
        CardCommon.config.strong_triple = false;
        CardCommon.config.strong_double = false;
    end
	CardCommon.no_triple_p1 = CardCommon.config.no_triple_p1
	CardCommon.tripleA_is_bomb = CardCommon.config.tripleA_is_bomb
	CardCommon.allow_unruled_multitriple = CardCommon.config.allow_unruled_multitriple
	CardCommon.wanfa = CardCommon.config.wanfa
	CardCommon.strong_triple = CardCommon.config.strong_triple
	CardCommon.strong_double = CardCommon.config.strong_double
	CardCommon.pay_all = CardCommon.config.pay_all
	CardCommon.allow_4plus3 = CardCommon.config.allow_4plus3
end

function CardCommon.NameIdx2Value(name_idx)
	return CardCommon.CardValue[math.modf((name_idx-1)/4+1)]
end
function CardCommon.Name2Value(name)
	return CardCommon.CardValue[name]
end

function CardCommon.Value2Name(value)
    for name,val in ipairs(CardCommon.CardValue) do
        if val == value then
            return name;
        end
    end
    return CardCommon.card_unknown;
end


function CardCommon.ResolveCardIdx(name_idx)
	local name = math.modf((name_idx-1)/4+1)
	local color = name_idx - (name-1) * 4
	return {name=name,color=color}
end

function CardCommon.FormatCardIndex(name,color) 
	return (name-1)*4+color
end
function CardCommon.Sort(cards)
	table.sort(cards, function (a,b)
		local index_a = math.modf((a-1)/4+1)
		local index_b = math.modf((b-1)/4+1)
		if (CardCommon.Name2Value(index_a) == CardCommon.Name2Value(index_b)) then
			return a < b
		else
			return CardCommon.Name2Value(index_a) > CardCommon.Name2Value(index_b)
		end
		
	end)
end
function CardCommon.SortAsc(cards, is_name)
	table.sort(cards, function (a,b)
		local index_a = a
		local index_b = b
		if not is_name then
			index_a = math.modf((a-1)/4+1)
			index_b = math.modf((b-1)/4+1)
		end
		if (CardCommon.Name2Value(index_a) == CardCommon.Name2Value(index_b)) then
			return a < b
		else
			return CardCommon.Name2Value(index_a) < CardCommon.Name2Value(index_b)
		end
		
	end)
end
-- 初始牌型分析，仅统计单牌、对牌、三张及王炸的个数
function CardCommon.InitParse(cards, flag)
	for _,c in ipairs(cards) do
		local name = CardCommon.ResolveCardIdx(c)
		--print(_,c, name, CardValue[name])
	end
	table.sort(cards)
	for _,c in ipairs(cards) do
		local name = CardCommon.ResolveCardIdx(c)
		--print(_,c, name, CardValue[name])
	end
	CardCommon.SortAsc(cards)
	--[[table.sort(cards, function (a,b)
		local index_a = math.modf((a-1)/4+1)
		local index_b = math.modf((b-1)/4+1)
		if (CardCommon.Name2Value(index_a) == CardCommon.Name2Value(index_b)) then
			return a < b
		else
			return CardCommon.Name2Value(index_a) < CardCommon.Name2Value(index_b)
		end
		
	end)--]]
	for _,c in ipairs(cards) do
		local name = CardCommon.ResolveCardIdx(c)
		--print(_,c, name, CardValue[name])
	end
	-- 牌型数量统计
	local card_type_stat={{},{},{},{}}
	local card_name_info={}
	-- 针对各张牌名的数量统计
	local card_name_stat={}
	for idx=1,CardCommon.max_card_name
	do
		card_name_stat[idx] = 0
		card_name_info[idx] = {}
	end
	local last_card = CardCommon.card_unknown
	local card_repeat_cnt = 0
	for _,c in ipairs(cards)
	do
		assert(c > 0)
		local name = math.modf((c-1)/4+1)
		card_name_stat[name] = card_name_stat[name]+1
		table.insert(card_name_info[name],c)
		-- 暂时支持一副牌
		assert(card_name_stat[name] <= 4)
		--table.insert(card_type_stat[card_name_stat[name]],name)
		if last_card == CardCommon.card_unknown then
			last_card = name
			card_repeat_cnt = 1
		elseif name ~= last_card  then
			if (card_repeat_cnt == 4 or flag) then
				table.insert(card_type_stat[card_repeat_cnt],last_card)
			else
				for i=1,card_repeat_cnt do
					table.insert(card_type_stat[i],last_card)
				end
			end
			last_card = name
			card_repeat_cnt = 1
		else
			card_repeat_cnt = card_repeat_cnt + 1
		end
		
	end
	if (card_repeat_cnt == 4 or flag) then
		table.insert(card_type_stat[card_repeat_cnt],last_card)
	else
		for i=1,card_repeat_cnt do
			table.insert(card_type_stat[i],last_card)
		end
	end
	return card_type_stat,card_name_info,card_name_stat
end

function CardCommon.StatRepeatCnt (card_type_stat,card_name_stat)
	local max_repeat_info = nil
	local info=nil
	local repeat_info={}
	if ((card_type_stat == nil) or (#card_type_stat == 0)) then
	return nil,nil
	end
	local card_cnt = #card_type_stat
	local last_value = 0
	local total_cards_cnt = 0
	for _,cnt in ipairs(card_name_stat) do
		total_cards_cnt = total_cards_cnt + cnt;
	end
	
	for name_idx=1,card_cnt
	do
		--print("index=",name_idx, " value=",CardCommon.Name2Value(card_type_stat[name_idx]))
		local value = CardCommon.Name2Value(card_type_stat[name_idx])
		if name_idx == 1  then
			info = {repeat_cnt=1
                ,card_start=card_type_stat[name_idx]
                ,card_end=card_type_stat[name_idx]
                ,cards={card_type_stat[name_idx]}}
			table.insert(repeat_info,info)
			max_repeat_info = info
		elseif value == last_value + 1  then
			info.card_end = card_type_stat[name_idx]
			info.repeat_cnt = info.repeat_cnt+1
			table.insert(info.cards, card_type_stat[name_idx])
		else
			if (info.repeat_cnt > max_repeat_info.repeat_cnt) then
				max_repeat_info = info
			end
			info = {repeat_cnt=1
                ,card_start=card_type_stat[name_idx]
                ,card_end=card_type_stat[name_idx]
                ,cards={card_type_stat[name_idx]}}
			table.insert(repeat_info,info)
		end
		last_value = value
	end
	if ((not max_repeat_info) or (info.repeat_cnt > max_repeat_info.repeat_cnt)) then
		max_repeat_info = info
	end
	max_repeat_info.total_cards_cnt = total_cards_cnt;
	return max_repeat_info,repeat_info
end
function CardCommon.Combine(a,b,len,offset)
    if a == nil then
        return b
    end
	if b then
		len = len or #b
		offset = offset or 1
		for i=offset,offset+len-1 do
			table.insert(a, b[i])
		end
	end
    return a
end

function CardCommon.GenerateRandomSequence(cnt)
	local orignal={}
	local rand_sequence={}
	for idx=1,cnt do
		table.insert(orignal,idx)
	end
	local rand_cnt = 0
	while (rand_cnt < cnt) do
		local x = math.random(1,cnt-rand_cnt);
		table.insert(rand_sequence, orignal[x])
		table.remove(orignal, x)
		rand_cnt = rand_cnt + 1
	end
	return rand_sequence

end

return CardCommon
			
						
						
						