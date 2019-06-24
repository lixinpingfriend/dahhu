local BranchPackageName = AppData.BranchRunfastName
local CardPattern = require(string.format("package/%s/module/tablerunfast/gamelogic_pattern",BranchPackageName))--require "gamelogic_pattern"
local CardCommon = require(string.format("package/%s/module/tablerunfast/gamelogic_common",BranchPackageName))
local CardSet={}

function CardSet.new(cards,card_cnt)
	local o = {}
	setmetatable(o, {__index=CardSet});
	if (cards ~= nil)then
		o.cards = {}
		for i,c in ipairs(cards)
		do
			table.insert(o.cards,c)
		end
	end
	if (card_cnt == nil) then
		card_cnt = #(o.cards)
	end
	o.card_cnt = card_cnt
	return o
end
local doGetCards4=function(cards)
	return CardPattern.new(cards);
end

local doGetCardsNormal=function (cards,start_idx, end_idx, pattern, card_name_info)
	local obj_card={}
	for idx=start_idx,end_idx do
		local name= cards[idx]
		local cnt = #(card_name_info[name])
		if (pattern) then
			cnt = pattern.type
		end
		for i=1,cnt do
			table.insert(obj_card,card_name_info[name][i])
		end
	end
	
	return CardPattern.new(obj_card);
end

local doGetCards=function (cards,start_idx, end_idx, pattern, card_name_info,card_name_stat)
	if pattern.type == CardCommon.type_four then
		return doGetCards4( card_name_info[cards[start_idx]])
	elseif pattern.type ~= CardCommon.type_three then
		return doGetCardsNormal(cards, start_idx, end_idx, pattern, card_name_info)
	else
		return doGetCardsNormal(cards, start_idx, end_idx, pattern, card_name_info)
	end
end

local doGetHintList=function (pattern, repeat_info, max_repeat_info,card_name_info, card_name_stat,pattern_four_repeat_info)
	local hintList = {}
	
    local strong_triple = CardCommon.config.strong_triple
    if repeat_info
        and max_repeat_info
        and max_repeat_info.repeat_cnt >= pattern.repeat_cnt
        and (max_repeat_info.total_cards_cnt >= pattern.card_cnt or (pattern.type == CardCommon.type_three and CardCommon.config.tailed_tripple))
	then
		if pattern.repeat_cnt == 1 and (pattern.type == CardCommon.type_double or pattern.type == CardCommon.type_single) then
			local begin_type = pattern.type
			while begin_type < CardCommon.type_four do
				for _,name in ipairs(CardCommon.SortedCardName) do
					if card_name_stat[name] == begin_type and CardCommon.Name2Value(name) > pattern.value then
						local card_pattern = doGetCards({name}, 1, 1, pattern, card_name_info,  card_name_stat)
						table.insert(hintList, card_pattern)
					end
				end
				begin_type = begin_type + 1
			end
		else
            local check_strong_triple = function(card_start, card_end,  repeat_cnt, card_cnt)
                if pattern.type ~= CardCommon.type_three or (not strong_triple) then
                    return true;
                end 
                if (repeat_cnt*3 == card_cnt) then
                    return true;
                end

                --local double_cards = {};
                local cnt = 0;
                for _,c in ipairs(CardCommon.SortedCardName) do
                    if card_name_stat[c] >= 2 
                        and (CardCommon.Name2Value(c) < CardCommon.Name2Value(card_start) 
                            or CardCommon.Name2Value(c) > CardCommon.Name2Value(card_end))
                    then
                        --table.insert(double_cards, c);
                        cnt = cnt + 1;
                        if repeat_cnt == cnt then 
                            return true;
                        end
                    end
                end
                return false;
               
            end
			for _,info in ipairs(repeat_info) do
				if (info.repeat_cnt >= pattern.repeat_cnt) then
					local loop_cnt = 1
					for index=pattern.repeat_cnt,info.repeat_cnt
					do
						if CardCommon.Name2Value(info.cards[index]) > pattern.value 
                            and check_strong_triple(info.cards[loop_cnt], info.cards[index], pattern.repeat_cnt, pattern.card_cnt)
                        then
							local card_pattern = doGetCards(info.cards, loop_cnt, index, pattern, card_name_info,  card_name_stat)
							table.insert(hintList, card_pattern)
						end
						loop_cnt = loop_cnt + 1
					end
				end
			end
		end
	end
	
	if (pattern_four_repeat_info) then
		for _,info in ipairs(pattern_four_repeat_info) do
			for _,card in ipairs(info.cards) do
				local card_pattern = doGetCards4(card_name_info[card])
				table.insert(hintList, card_pattern)
			end
		end
	end
       
	return hintList
end

local doGetFirstHintList=function (card_type_stat,card_name_info,card_name_stat, single_repeat_info)
	local hintList = {}
    local strong_double = CardCommon.config.strong_double;
	local try_cnt = 13
	if (single_repeat_info) then
		while (#hintList==0 and try_cnt > 4) do
			for _,info in ipairs(single_repeat_info) do
				if (info.repeat_cnt >= try_cnt) then
					local card_pattern = doGetCards(info.cards, 1, info.repeat_cnt, {type=CardCommon.type_single}, card_name_info,  card_name_stat)
					table.insert(hintList, card_pattern)
					break
				end
			end
			try_cnt = try_cnt -1
		end
	end 
	try_cnt = 5
	local list = {}
	local max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_three],card_name_stat)
	while ((#list == 0)  and try_cnt > 0) do
		list = doGetHintList({type=CardCommon.type_three,repeat_cnt=try_cnt, value=0,card_cnt=try_cnt*3},repeat_info,max_repeat_info,card_name_info,card_name_stat)
		hintList = CardCommon.Combine(hintList,list)
		try_cnt = try_cnt -1
	end
	try_cnt = 8
	list = {}
	max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_double],card_name_stat)
	while ((#list == 0)  and try_cnt > 0) do
        if not strong_double or  (try_cnt ~= 2)  then 
            list = doGetHintList({type=CardCommon.type_double,repeat_cnt=try_cnt, value=0,card_cnt=try_cnt*2},repeat_info,max_repeat_info,card_name_info,card_name_stat)
		    hintList = CardCommon.Combine(hintList,list)
        end 
		try_cnt = try_cnt -1
	end
	for _,name in ipairs(CardCommon.SortedCardName) do
		if (card_name_stat[name] == 1)then
			local card_pattern = CardPattern.new({card_name_info[name][1]})
			table.insert(hintList, card_pattern)
			break
		end
	end
	try_cnt = 1
	list = {}
	max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_four],card_name_stat)
	while ((#list == 0)  and try_cnt > 0) do
		list = doGetHintList({type=CardCommon.type_four,repeat_cnt=try_cnt, value=0,card_cnt=4},repeat_info,max_repeat_info,card_name_info,card_name_stat)
		hintList = CardCommon.Combine(hintList,list)
		try_cnt = try_cnt -1
	end
	
	return hintList
end
--存在漏洞，只能必选黑桃，其他花色不行（目前只有黑桃3，所以无碍）。
local doGetHintWithCard=function (card_type_stat,card_name_info,card_name_stat, single_repeat_info, essential_card)
	local hintList = {}
    local name = CardCommon.ResolveCardIdx(essential_card).name
    local strong_double = CardCommon.config.strong_double;
	local try_cnt = 13
    if card_name_stat[name] == 0 then
        return hintList;
    end
    local find_card = false;
    for _,c in ipairs(card_name_info[name]) do
        if c == essential_card then
            find_card = true;
            break;
        end
    end
    if not find_card then
        return hintList;
    end
	if (single_repeat_info) then
		for _,info in ipairs(single_repeat_info) do
			if (info.repeat_cnt >= 5) 
                and (CardCommon.Name2Value(name) >= CardCommon.Name2Value(info.card_start))
                and (CardCommon.Name2Value(name) <= CardCommon.Name2Value(info.card_end)) 
            then
				local card_pattern = doGetCards(info.cards, 1, info.repeat_cnt, {type=CardCommon.type_single}, card_name_info,  card_name_stat)
				table.insert(hintList, card_pattern)
				break
			end
		end
	end 

    try_cnt = 5
	local list = {}
	local max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_three],card_name_stat)
	local find = false;
    while (try_cnt > 1 and (not find)) do
		list = doGetHintList({type=CardCommon.type_three,repeat_cnt=try_cnt, value=0,card_cnt=try_cnt*3},repeat_info,max_repeat_info,card_name_info,card_name_stat)
        for i=1,#list do 
            if list[i]:count(essential_card) > 0 then
                table.insert(hintList, list[i]);
                find = true;
                break;
            end
        end
		try_cnt = try_cnt -1
	end

	try_cnt = 8
    local min_try_cnt = 1;
    if strong_double then 
        min_try_cnt = 2;
    end
	list = {}
	max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_double],card_name_stat)
	local find = false;
    while (try_cnt > min_try_cnt and (not find)) do
		list = doGetHintList({type=CardCommon.type_double,repeat_cnt=try_cnt, value=0,card_cnt=try_cnt*2},repeat_info,max_repeat_info,card_name_info,card_name_stat)
        
        for i=1,#list do 
            if list[i]:count(essential_card) > 0 then
                table.insert(hintList, list[i]);
                find = true;
                break;
            end
        end
		try_cnt = try_cnt -1
	end
    for i=1,card_name_stat[name] do
        if card_name_info[name][i] == essential_card then
            local card_pattern = CardPattern.new(card_name_info[name])
			table.insert(hintList, card_pattern)
			break
        end
    end

    for _,pt in ipairs(hintList) do 
        if pt:count(essential_card) == 0 then
            for i,c in ipairs(pt.cards) do
                local local_name = CardCommon.ResolveCardIdx(c).name;
                if local_name == name then
                    pt.cards[i] = essential_card;
                end
            end
        end
    end
	return hintList
end
function CardSet:get_cards_with_multiplicity(card_name_info, multiplicity, cnt, out_cards, filter, next_idx)
    local cards = out_cards or {}
    local len = #cards
    local begin_idx = next_idx  or 1
    while len < cnt and begin_idx < #CardCommon.SortedCardName do
        local name =  CardCommon.SortedCardName[begin_idx]
        local found = false;
        if filter then 
            for i=1,#filter do
                local filter_name = CardCommon.ResolveCardIdx(filter[i]).name
                if (name == filter_name) then 
                    found= true;
                    break;
                end 
            end
        end 
        if not found then 
            if #card_name_info[name] == multiplicity then 
                if len + multiplicity <= cnt then 
                    CardCommon.Combine(cards, card_name_info[name])
                    len = len + multiplicity;
                else
                    CardCommon.Combine(cards, card_name_info[name], cnt - len)
                    len = cnt;
                end 
            end 
        end
        begin_idx = begin_idx + 1
    end 
    return cards;
end 

function CardSet:get_additonal_cards(card_name_info,  cnt, next_idx, filter)
    local cards = self:get_cards_with_multiplicity(card_name_info, 1, cnt, nil, filter) 
    self:get_cards_with_multiplicity(card_name_info, 2, cnt, cards, filter) 
    self:get_cards_with_multiplicity(card_name_info, 3, cnt, cards, filter, next_idx) 
    return self:get_cards_with_multiplicity(card_name_info, 4, cnt, cards, filter)
end 

function CardSet:get_sequence_start_with(card_name_info, card_name, begin_multiplicity)
    local begin_idx = 0;
    for i=1,#CardCommon.SortedCardName do
        local name =  CardCommon.SortedCardName[i]
        local multiplicity = #card_name_info[name]
        if (((not card_name) and multiplicity > 0) or (name == card_name)) 
            and ((not begin_multiplicity) or multiplicity >= begin_multiplicity )
        then 
            begin_idx = i;
            break;
        end 
    end 
    if begin_idx == 0 then 
        return nil;
    end 
    local sequence_length = 0;
    local cards = {}
    local name = CardCommon.SortedCardName[begin_idx]
    local multiplicity = #card_name_info[name]
    local last_value = CardCommon.Name2Value(name) - 1;
    while begin_idx <= #CardCommon.SortedCardName 
        and #card_name_info[name] == multiplicity 
        and (last_value + 1) == CardCommon.Name2Value(name)
    do
        last_value = CardCommon.Name2Value(name)
        CardCommon.Combine(cards, card_name_info[name])
        begin_idx = begin_idx + 1
        name = CardCommon.SortedCardName[begin_idx]
        sequence_length = sequence_length + 1
    end 
    return cards, multiplicity, sequence_length, begin_idx
end

function CardSet:discard_auto(pattern,essential_card, is_single, is_black3_player)
    if pattern then 
        local fn,cnt = self:hintIterator(pattern,nil, is_single, is_black3_player)
        local i = 1;
        local pattern_list = {}
        if not cnt or cnt == 0 then 
            return nil;
        end 
        local last_pt = fn();
        table.insert(pattern_list, last_pt);
        while i < cnt do
            i = i + 1;
            local cur_pt = fn();
            table.insert(pattern_list, cur_pt);
            if not (last_pt:le(cur_pt)) then 
                last_pt = cur_pt;
            end 
        end 
        if cnt > 1 and pattern.repeat_cnt == 1 and pattern.type ~= CardCommon.type_three then
            local ret_pt = nil;
            local last_card = nil;
            local card_type_stat,card_name_info,card_name_stat=CardCommon.InitParse(self.cards, true)
            for i=1,#pattern_list do 
                local cur_pt = pattern_list[i];
                if not ret_pt then 
                    ret_pt = cur_pt;
                    last_card = CardCommon.ResolveCardIdx(ret_pt.cards[1]).name;
                else
                    local cur_card = CardCommon.ResolveCardIdx(cur_pt.cards[1]).name;
                    if card_name_stat[cur_card] < card_name_stat[last_card] then
                        ret_pt = cur_pt
                    elseif card_name_stat[cur_card] == card_name_stat[last_card]  
                        and (not (ret_pt:le(cur_pt)))  
                    then 
                        ret_pt = cur_pt
                    end 
                end  
            end 
            return ret_pt;
        elseif last_pt.type == CardCommon.type_three  then
            if self.card_cnt < pattern.card_cnt then
                return 
            end 
            local card_type_stat,card_name_info,card_name_stat=CardCommon.InitParse(self.cards, true)
            local cards_additional = self:get_additonal_cards(card_name_info, pattern.card_cnt - pattern.repeat_cnt*3, nil, last_pt.cards)
            if #cards_additional then 
                local whole_cards = CardCommon.Combine({}, last_pt.cards);
                CardCommon.Combine(whole_cards, cards_additional);
                local tmp_pattern = CardPattern.new(whole_cards
                    , self.card_cnt
                    , is_black3_player)
                if tmp_pattern then 
                    return tmp_pattern;
                else
                    return last_pt
                end
            else
                return last_pt
            end 
        end 
        return last_pt;
    elseif is_single then
        local card_type_stat,card_name_info,card_name_stat=CardCommon.InitParse(self.cards, true)
        local cards, multiplicity, sequence_length, next_idx 
            = self:get_sequence_start_with(card_name_info, nil, 2)
        if not sequence_length then
            local max_card = self.cards[1]
            for _, c in ipairs(self.cards) do
                if CardCommon.NameIdx2Value(c) > CardCommon.NameIdx2Value(max_card) then
                    max_card = c;
                end  
            end
            return CardPattern.new({max_card}, self.card_cnt, is_black3_player)
        else
            if multiplicity == 3 then 
                if sequence_length > 1 then 
                    local tmp_pattern = CardPattern.new({cards[1], cards[2], cards[3]}
                        , self.card_cnt
                        , is_black3_player)
                    if tmp_pattern.type == CardCommon.type_four then 
                        return tmp_pattern;
                    end 
                end 
                local cards_additional = self:get_additonal_cards(card_name_info, sequence_length*2, next_idx, cards)
                if #cards_additional then 
                    local whole_cards = CardCommon.Combine({}, cards);
                    CardCommon.Combine(whole_cards, cards_additional);
                    local tmp_pattern = CardPattern.new(whole_cards
                        , self.card_cnt
                        , is_black3_player)
                    if tmp_pattern then 
                        return tmp_pattern;
                    else
                        return CardPattern.new(cards, self.card_cnt, is_black3_player)
                    end
                else
                    return CardPattern.new(cards, self.card_cnt, is_black3_player)
                end 
            else
                local pt = CardPattern.new(cards, self.card_cnt, is_black3_player)
                if not pt and sequence_length > 1 then 
                    cards = CardCommon.Combine({}, cards, multiplicity);
                    return CardPattern.new(cards, self.card_cnt, is_black3_player)
                end 
                return pt;
            end 
        end 
    else
        local card_type_stat,card_name_info,card_name_stat=CardCommon.InitParse(self.cards, true)
        if essential_card then
            essential_card = CardCommon.ResolveCardIdx(essential_card).name;
        end 
        local cards, multiplicity, sequence_length, next_idx 
            = self:get_sequence_start_with(card_name_info, essential_card, 1)
        if not sequence_length then
            return nil;
        end 
        if multiplicity == 3 then 
            if sequence_length > 1 then 
                local tmp_pattern = CardPattern.new({cards[1], cards[2], cards[3]}
                    , self.card_cnt
                    , is_black3_player)
                if tmp_pattern.type == CardCommon.type_four then 
                    return tmp_pattern;
                end 
            end 
            local cards_additional = self:get_additonal_cards(card_name_info, sequence_length*2, next_idx, cards)
            if #cards_additional then 
                local whole_cards = CardCommon.Combine({}, cards);
                CardCommon.Combine(whole_cards, cards_additional);
                local tmp_pattern = CardPattern.new(whole_cards
                    , self.card_cnt
                    , is_black3_player)
                if tmp_pattern then 
                    return tmp_pattern;
                else
                    return CardPattern.new(cards, self.card_cnt, is_black3_player)
                end
            else
                return CardPattern.new(cards, self.card_cnt, is_black3_player)
            end 
        else
            local pt = CardPattern.new(cards, self.card_cnt, is_black3_player)
            if not pt and sequence_length > 1 then 
                cards = CardCommon.Combine({}, cards, multiplicity);
                return CardPattern.new(cards, self.card_cnt, is_black3_player)
            end 
            return pt;
        end 
    end 
end

function CardSet:proc_3p2_withcards(pattern_set)
    local withcards_set = {}

    local function sort_name(name1, name2)
        if name2 == CardCommon.card_2 then
            return true
        elseif name2 == CardCommon.card_A then
            return (name1 ~= CardCommon.card_2) and true or false
        elseif name1 == CardCommon.card_2 then
            return false
        elseif name1 == CardCommon.card_A then
            return (name2 == CardCommon.card_2) and true or false
        else
            return name1 < name2
        end
    end

    local function porc_serial_cards(card_name_stat, type, type_size, type_stat, least_repeat_cnt, straight_names, remain_names)
        local beg = 1
        if type_size >= least_repeat_cnt then
            for i = 1,type_size-1 do
                if (CardCommon.CardValue[type_stat[i]] + 1) ~= (CardCommon.CardValue[type_stat[i+1]]) then
                    if i - beg + 1 >= least_repeat_cnt then
                        table.insert(straight_names, {})
                        for j = beg,i do
                           table.insert(straight_names[#straight_names], type_stat[j]) 
                        end
                    else
                        for j = beg,i do
                            if card_name_stat[type_stat[j]] == type then
                                table.insert(remain_names, type_stat[j])
                            end
                        end
                    end

                    beg = i + 1
                    if type_size - beg + 1 < least_repeat_cnt then
                        break
                    end
                end
            end
        end

        if type_size - beg + 1 >= least_repeat_cnt then
            table.insert(straight_names, {}) 
            for i = beg,type_size do
                table.insert(straight_names[#straight_names], type_stat[i])
            end
        else
            for i = beg,type_size do
                if card_name_stat[type_stat[i]] == type then
                    table.insert(remain_names, type_stat[i])
                end 
            end
        end 
    end

    for _,set in ipairs(pattern_set) do
        table.insert(withcards_set, set)
        if set.card_cnt % 3 == 0 then
            local with_card_cnt = (set.card_cnt / 3) * 2
            local rest_card_cnt = self.card_cnt - set.card_cnt
            if rest_card_cnt > with_card_cnt then
                local used_cards = {}
                for _,card in ipairs(set.cards) do
                    used_cards[card] = true
                end

                local rest_cards = {}
                for _,card in ipairs(self.cards) do
                    if not used_cards[card] then
                        table.insert(rest_cards, card)
                    end
                end

                local rest_card_type_stat, rest_card_name_info, rest_card_name_stat = CardCommon.InitParse(rest_cards)
                local straight_cards = {} -- 顺子(多个顺子时从小到大排序)
                local remain_single_cards = {} -- 顺子中多余的单牌和不成牌型的单牌(从小到大排序)
                local remain_pair_cards = {} -- 顺子中多余的对子，非连对对子，连对对子(从小到大排序)
                local type_single_size = #rest_card_type_stat[CardCommon.type_single]
                local single_type_stat = rest_card_type_stat[CardCommon.type_single]
                porc_serial_cards(rest_card_name_stat, CardCommon.type_single, type_single_size, single_type_stat, 5, straight_cards, remain_single_cards)

                local used_pair_cards = {}
                for i,cards in ipairs(straight_cards) do
                    for _,name in ipairs(cards) do
                        if rest_card_name_stat[name] == 2 then
                            used_pair_cards[name] = {index = i, count = 1}
                            table.insert(remain_single_cards, name)
                        elseif rest_card_name_stat[name] == 3 then
                            used_pair_cards[name] = {index = i, count = 2}
                            table.insert(remain_pair_cards, name) -- 顺子中多余的对子
                        end
                    end
                end

                if #remain_single_cards > 0 then
                    table.sort(remain_single_cards, sort_name)

                    for i = 1,with_card_cnt do
                        if i <= #remain_single_cards then
                            table.insert(withcards_set[#withcards_set].cards, rest_card_name_info[remain_single_cards[i]][1])
                            withcards_set[#withcards_set].card_cnt = withcards_set[#withcards_set].card_cnt + 1
                        else
                            break
                        end
                    end
                end

                if #remain_single_cards < with_card_cnt then -- 单牌不够找对子
                    local need_card_cnt = with_card_cnt - #remain_single_cards
                    local pair_type_stat = {}
                    for _,name in ipairs(rest_card_type_stat[CardCommon.type_double]) do
                        if not used_pair_cards[name] and rest_card_name_stat[name] == 2 then
                            table.insert(pair_type_stat, name)
                        end
                    end

                    local straight_pair_cards = {}
                    local plain_pair_cards = {}
                    if #pair_type_stat > 0 then
                        porc_serial_cards(rest_card_name_stat, CardCommon.type_double, #pair_type_stat, pair_type_stat, 2, straight_pair_cards, plain_pair_cards)
                        for _,name in ipairs(plain_pair_cards) do
                            table.insert(remain_pair_cards, name)
                        end
                        table.sort(remain_pair_cards, sort_name)
                        
                        for _,pair_names in ipairs(straight_pair_cards) do
                            for _,name in ipairs(pair_names) do
                                table.insert(remain_pair_cards, name)
                            end
                        end
                    end

                    if #remain_pair_cards > 0 then
                        if #remain_single_cards == 1 then -- 只有一张单牌，如果这张单牌比对子要大，则不带这张单牌
                            if sort_name(remain_pair_cards[1], remain_single_cards[1]) then
                                table.remove(withcards_set[#withcards_set].cards)
                                withcards_set[#withcards_set].card_cnt = withcards_set[#withcards_set].card_cnt - 1
                                need_card_cnt = need_card_cnt + 1
                            end
                        end

                        local key_index = 1
                        local value_index = 1
                        for i = 1,need_card_cnt do
                            if key_index <= #remain_pair_cards then
                                table.insert(withcards_set[#withcards_set].cards, rest_card_name_info[remain_pair_cards[key_index]][value_index])
                                withcards_set[#withcards_set].card_cnt = withcards_set[#withcards_set].card_cnt + 1
                            else
                                break
                            end

                            value_index = value_index + 1
                            if value_index == 3 then
                                key_index = key_index + 1
                                value_index = 1 
                            end
                        end
                    end

                    if #remain_pair_cards*2 < need_card_cnt then -- 对子不够找3张
                        need_card_cnt = need_card_cnt - #remain_pair_cards*2
                        local three_type_stat = {}
                        for _,name in ipairs(rest_card_type_stat[CardCommon.type_three]) do
                            if not used_pair_cards[name] and rest_card_name_stat[name] == 3 then
                                table.insert(three_type_stat, name)
                            end
                        end

                        key_index = 1
                        value_index = 1
                        for i = 1,need_card_cnt do
                            if key_index <= #three_type_stat then
                                table.insert(withcards_set[#withcards_set].cards, rest_card_name_info[three_type_stat[key_index]][value_index])
                                withcards_set[#withcards_set].card_cnt = withcards_set[#withcards_set].card_cnt + 1
                            else
                                break
                            end

                            value_index = value_index + 1
                            if value_index == 4 then
                                key_index = key_index + 1
                                value_index = 1 
                            end
                        end
                    
                        if #three_type_stat*3 < need_card_cnt then -- 3张还不够，就从顺子中取牌
                            need_card_cnt = need_card_cnt - #three_type_stat*3
                            for k,v in pairs(used_pair_cards) do
                                if #straight_cards[v.index] - need_card_cnt >= 5 then
                                    for i = 1,need_card_cnt do
                                        local name = straight_cards[v.index][i]
                                        table.insert(withcards_set[#withcards_set].cards, rest_card_name_info[name][rest_card_name_stat[name]])
                                        withcards_set[#withcards_set].card_cnt = withcards_set[#withcards_set].card_cnt + 1
                                    end
                                else
                                    for i = 1,v.count do
                                        table.remove(withcards_set[#withcards_set].cards)
                                        withcards_set[#withcards_set].card_cnt = withcards_set[#withcards_set].card_cnt - 1
                                        need_card_cnt = need_card_cnt + 1
                                    end

                                    for _,name in ipairs(straight_cards[v.index]) do
                                        if not used_pair_cards[name] then
                                            table.insert(withcards_set[#withcards_set].cards, rest_card_name_info[name][rest_card_name_stat[name]])
                                            withcards_set[#withcards_set].card_cnt = withcards_set[#withcards_set].card_cnt + 1
                                            need_card_cnt = need_card_cnt - 1
                                            if need_card_cnt == 0 then
                                                break
                                            end
                                        end
                                    end
                                end

                                break
                            end
                        end
                    end
                end
            end
        end
    end

    return withcards_set
end

function CardSet:hintIterator(pattern,essential_card, is_single, is_black3_player)
	local card_type_stat,card_name_info,card_name_stat=CardCommon.InitParse(self.cards)
	local max_repeat_info = nil
	local repeat_info = nil
	local pattern_four_repeat_info = nil
	local max_pattern_four_repeat_info = nil
	local tripleA_is_bomb = CardCommon.config.tripleA_is_bomb;
	local discard_now = false;
	local pattern_set = nil
    if not pattern then
		local min_card = self.cards[1]
        local max_card = self.cards[1]
        for _, c in ipairs(self.cards) do
            if CardCommon.NameIdx2Value(c) > CardCommon.NameIdx2Value(max_card) then
                max_card = c;
            end  
            if CardCommon.NameIdx2Value(c) < CardCommon.NameIdx2Value(min_card) then
                min_card = c;
            end
        end
        max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_single],card_name_stat)
        if essential_card then 
            pattern_set = doGetHintWithCard(card_type_stat,card_name_info,card_name_stat, repeat_info, essential_card)
        else
            pattern_set = doGetFirstHintList(card_type_stat,card_name_info,card_name_stat, repeat_info)
        end

        for i,set in ipairs(pattern_set) do
            if set.type == CardCommon.type_three and (set.card_cnt%3 == 0) then
                pattern_set[i] = self:proc_3p2_withcards({set})[1]
            end
        end

		if (is_single ) then 
            if not pattern_set then
                pattern_set = {};
            end
			for idx,pt in ipairs(pattern_set) do
				if (pt.type == CardCommon.type_single and pt.repeat_cnt == 1) then
                    pt.cards[1] = max_card;
                    pt.value = CardCommon.NameIdx2Value(max_card);
					break
				end
			end
                
		end
        
    else
        if (self.card_cnt < pattern.card_cnt) then
            --return nil
        end
        max_pattern_four_repeat_info,pattern_four_repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_four],card_name_stat)
        
        if pattern.type == CardCommon.type_four then
            max_repeat_info,repeat_info = max_pattern_four_repeat_info,pattern_four_repeat_info
            pattern_set = doGetHintList(pattern,repeat_info,max_repeat_info,card_name_info,card_name_stat)
        end
        if pattern.type == CardCommon.type_4plus3 then
            pattern_set = doGetHintList(pattern,nil,max_repeat_info,card_name_info,card_name_stat,pattern_four_repeat_info)
        end
        if pattern.type == CardCommon.type_three then
            max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_three],card_name_stat)
            pattern_set = doGetHintList(pattern,repeat_info,max_repeat_info,card_name_info,card_name_stat,pattern_four_repeat_info)
            if pattern.disp_type == "sandaier" or (pattern.disp_type == "feiji" and pattern.card_cnt%5 == 0) then
                pattern_set = self:proc_3p2_withcards(pattern_set)
            end
        end
        if pattern.type == CardCommon.type_double then
            max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_double],card_name_stat)
            pattern_set = doGetHintList(pattern,repeat_info,max_repeat_info,card_name_info,card_name_stat,pattern_four_repeat_info)
        end
        
        if pattern.type == CardCommon.type_single then
            max_repeat_info,repeat_info = CardCommon.StatRepeatCnt(card_type_stat[CardCommon.type_single],card_name_stat)
            pattern_set = doGetHintList(pattern,repeat_info,max_repeat_info,card_name_info,card_name_stat,pattern_four_repeat_info)
        end
		if pattern.type == CardCommon.type_single and pattern.repeat_cnt == 1 and is_single and pattern_set  and #pattern_set > 0 then
			local last_pt = nil;
            while  true do 
                local find = false
                for i=1,#pattern_set do 
                    if (pattern_set[i].type == CardCommon.type_single) then
                        if (last_pt == nil or pattern_set[i].value > last_pt.value) then
                            last_pt = pattern_set[i];
                        end
                        table.remove(pattern_set, i);
                        find = true;
                        break;
                    end
                end
                if not find then
                    break;
                end
            end
            local raw_single = true;
			if (last_pt and (#pattern_set) >= 1) then 
				for i=1,#pattern_set do
					if (pattern_set[i].value > last_pt.value) then 
						 last_pt.value = pattern_set[i].value;
						 last_pt.cards[1] = pattern_set[i].cards[1];
                         raw_single = false;
					end 
				end
			end
            if (last_pt) then
                if raw_single then 
                    table.insert(pattern_set, 1, last_pt);
                else
                    table.insert(pattern_set, last_pt);
                end
            end
		end
        
    end 
    
    if is_black3_player and (not essential_card) then
        if (card_name_stat[CardCommon.card_3] == 3) then
            for ix,pt in ipairs(pattern_set) do
                if pt.type == CardCommon.type_three and pt.value == CardCommon.Name2Value(CardCommon.card_3)  then
                    table.remove(pattern_set, ix);
                    break; 
                end
            end
            local pt_bomb3 = CardPattern.new(card_name_info[CardCommon.card_3], 3, true);
            if  (not pattern) or ( pt_bomb3:compable(pattern) and (not pt_bomb3:le(pattern))) then
                table.insert(pattern_set, pt_bomb3);
            end
        end
    end
    
    if tripleA_is_bomb and self.card_cnt >= 4 and (not essential_card) then 
        local find=false;
        if (card_name_stat[CardCommon.card_A] == 3)  then 
            local cnt = 1;
            local cards = {}
            CardCommon.Combine(cards, card_name_info[CardCommon.card_A]);
            while cnt <= 4 and (not find) do
                for _,card in ipairs(CardCommon.SortedCardName) do
                    local info_cnt = card_name_stat[card];
                    if card ~= CardCommon.card_A and info_cnt == cnt then 
                        table.insert(cards, card_name_info[card][1]);
                        find = true;
                        break;
                    end
                end
                cnt = cnt + 1
            end
            if (find) then 
                for ix,pt in ipairs(pattern_set) do
                    if pt.type == CardCommon.type_three 
                        and pt.value == CardCommon.Name2Value(CardCommon.card_A)
                    then
                        table.remove(pattern_set, ix);
                    end
                end
                table.insert(pattern_set, CardPattern.new(cards));
            end
        end
    end
    
	if (pattern_set == nil) then
		return nil
	end
	if (#pattern_set) == 0 then
		return nil
	end
    local find_bomb = false;
    for _,pt in ipairs(pattern_set) do 
        if pt.type == CardCommon.type_four then 
            find_bomb = true;
            break;
        end
    end
	if (pattern) then 
		if #pattern_set == 1 
            and pattern_set[1].type ~= CardCommon.type_three
            and pattern_set[1].card_cnt == self.card_cnt
        then
		    discard_now = true;
		elseif pattern.type == CardCommon.type_three  and (not find_bomb) then 
            local pattern_tmp = CardPattern.new(self.cards,self.card_cnt)
            if pattern_tmp then
                pattern_set = {}
				table.insert(pattern_set, pattern_tmp);
				discard_now = true;
            end
		end
	else 
		for _,pattern_obj in ipairs(pattern_set) do 
			if pattern_obj.card_cnt == self.card_cnt then
				pattern_set = {}
				table.insert(pattern_set, pattern_obj)
				discard_now = true
				break
			elseif pattern_obj.type == CardCommon.type_three   and (not find_bomb)  then
                local pattern_tmp = CardPattern.new(self.cards,self.card_cnt)
                if pattern_tmp then
                    pattern_set = {}
				    table.insert(pattern_set, pattern_tmp);
				    discard_now = true;
                    break;
                end
               
			end
		end
	end
	local index = 0
	return function ()
		index = index  % (#pattern_set) + 1
		return pattern_set[index]
	end, (#pattern_set),discard_now, pattern_set
end

local doAddOneCard=function(result, name, color, cards_removed)
	local card_idx = 0
	local remove_flag = false;
	card_idx = CardCommon.FormatCardIndex(name, color)
	for _,c in ipairs(cards_removed) do
		if (c == card_idx) then
			remove_flag = true
			break
		end
	end
	if not remove_flag then
		table.insert(result, card_idx)
	end
end
function CardSet.shuffle(cards_removed,randomseed)
	local card_names=CardCommon.SortedCardName
	local colors={CardCommon.color_black_heart,CardCommon.color_red_heart,CardCommon.color_plum,CardCommon.color_square};
	local cards={}
	
	for idx=1,CardCommon.max_normal_card_name do
		--local color_idx = CardCommon.GenerateRandomSequence(4)
		for i=1,4 do
			doAddOneCard(cards, card_names[idx], i, cards_removed)
		end
	end
	--doAddOneCard(cards, CardName.card_small_king, CardColor.color_black_heart, cards_removed)
	--doAddOneCard(cards, CardName.card_big_king, CardColor.color_black_heart, cards_removed)
	local cards_return_idx = CardCommon.GenerateRandomSequence(#cards);
	local cards_return={}
	for _,v in ipairs(cards_return_idx) do
		table.insert(cards_return, cards[v])
	end
	return cards_return
end
function CardSet.deal(cards_removed, randomseed, player_cnt, bomb_record)
    math.randomseed(tonumber(tostring(os.time()):reverse():sub(1,6))+tonumber(randomseed)*10)
	local cards = CardSet.shuffle(cards_removed, randomseed)
	local max_cnt = #cards
    local player_cards={{},{},{},{}}
    local card_cnt_per_player = max_cnt / player_cnt
	assert(max_cnt % player_cnt == 0)
    local try_cnt = 5
    while bomb_record and bomb_record["max_cnt"] and try_cnt > 0 and bomb_record[0] >= bomb_record["max_cnt"]  do
        local bomb_cnt_tmp = 0
        for i=1,player_cnt do
            local cards_tmp = CardCommon.Combine({}, cards, card_cnt_per_player, (i-1) *card_cnt_per_player + 1 )
            local card_type_stat = CardCommon.InitParse(cards_tmp, true)
            bomb_cnt_tmp = bomb_cnt_tmp +  #card_type_stat[4]
        end
        if bomb_cnt_tmp == 0 then
            break;
        end
        cards = CardSet.shuffle(cards_removed, randomseed)
        try_cnt = try_cnt - 1

    end
	for pix =1,player_cnt do
        for i=1, card_cnt_per_player do 
            table.insert(player_cards[pix], cards[(pix-1)*card_cnt_per_player+i])
        end 
	end
	local cardset = {};
	for i=1,player_cnt do 
		table.insert(cardset, CardSet.new(player_cards[i]))
	end 
	return cardset, cards;
end
function CardSet:find(card)
    for _,c in ipairs(self.cards) do
        if c == card then
            return true;
        end
    end
    return false;
end
function CardSet:discard(card_pattern_object)
local cnt = #(self.cards)
	-- for _,c in ipairs(card_pattern_object.cards) do
	-- 	for idx,card in ipairs(self.cards) do
	-- 		if (c == card) then
	-- 			table.remove(self.cards,idx)
	-- 			break
	-- 		end
	-- 	end
	-- end
	
	-- self.card_cnt = #(self.cards)
	-- --print("self.card_cnt="..self.card_cnt.." old_cnt="..cnt.." pt.ctn="..card_pattern_object.card_cnt);
	-- return self.card_cnt,self.card_cnt ==(cnt-card_pattern_object.card_cnt)
    local cards = {};
    cards = CardCommon.Combine(cards, self.cards);
  local cnt = #(cards)
  for _,c in pairs(card_pattern_object.cards) do
    for idx,card in ipairs(cards) do
      if (c == card) then
        table.remove(cards,idx)
        break
      end
    end
  end
  local new_cnt = #cards;
    if new_cnt == cnt - card_pattern_object.card_cnt then
        self.card_cnt = new_cnt;
        self.cards = cards;
        return new_cnt, true;
    else
        return cnt, false;
    end;
end    
function CardSet:count(card)
    local cnt = 0;
    for _,c in ipairs(self.cards) do
        if (c == card) then
            cnt = cnt + 1;
        end
    end 
    return cnt;
end		
 
function CardSet:count_name(card)
    local cnt = 0;
    local name = card;
    for _,c in ipairs(self.cards) do
        if (CardCommon.ResolveCardIdx(c).name == name) then
            cnt = cnt + 1;
        end
    end 
    return cnt;
end	
return CardSet						
						
						
