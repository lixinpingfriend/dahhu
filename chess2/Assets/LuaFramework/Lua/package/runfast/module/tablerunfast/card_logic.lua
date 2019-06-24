




local BranchPackageName = AppData.BranchRunfastName

---@type CardTool CardTool
local CardTool = require(string.format("package/%s/module/tablerunfast/card_tool", BranchPackageName))--require "gamelogic_pattern"

-----@type CardTool CardTool
--local CardTool = require("lua/package/runfast/module/tablerunfast/card_tool")
---@class CardLogic
local CardLogic = {}

CardLogic.cardtype_unknown = 0
CardLogic.cardtype_danpai = 1              -->单牌：单张的牌（例如黑桃K）；
CardLogic.cardtype_duizi = 2               -->对子：牌面数字相同的2张牌（例如黑桃K+红桃K）；
CardLogic.cardtype_sandaiyi = 3            -->三带一：牌面数字相同的3张牌+1张单牌或对子（例如KKK+8或QQQ+44）；
CardLogic.cardtype_feiji = 4               -->飞机：2个或更多的连续三张牌型，飞机牌型中每1个三张都可+1张单牌或对子（例如：333444+78或333444+7788）；
CardLogic.cardtype_shunzi = 5              -->顺子：5张或更多的连续单牌（例如78910J，3456789）；
CardLogic.cardtype_liandui = 6             -->连对：2对或以上的连续对子牌型（例如334455，991010JJQQ）；
CardLogic.cardtype_sidaisan = 7              -->四带三
CardLogic.cardtype_zhadan = 8              -->炸弹：牌面数字相同的4张牌（例如KKKK，QQQQ，3333）；

CardLogic.color_name = { "黑桃", "红桃", "梅花", "方块", }
CardLogic.value_name = { "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "小王", "大王" }

CardLogic.CardValue = { 12, 14, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 16, 18 }

CardLogic.card_unknown = 0
CardLogic.card_A = 1
CardLogic.card_2 = 2
CardLogic.card_3 = 3
CardLogic.card_4 = 4
CardLogic.card_5 = 5
CardLogic.card_6 = 6
CardLogic.card_7 = 7
CardLogic.card_8 = 8
CardLogic.card_9 = 9
CardLogic.card_10 = 10
CardLogic.card_J = 11
CardLogic.card_Q = 12
CardLogic.card_K = 13
CardLogic.card_small_king = 14
CardLogic.card_big_king = 15
-- 花色说明 取值范围1~4   1代表黑桃 2代表红桃 3代表梅花 4代表方块
CardLogic.color_unkown = 0
CardLogic.color_black_heart = 1
CardLogic.color_red_heart = 2
CardLogic.color_plum = 3
CardLogic.color_square = 4
CardLogic.rule = {}
function CardLogic.initRule(rule)
    CardLogic.rule = {}
    CardLogic.rule.allow_unruled_multitriple = rule.allow_unruled_multitriple  --最后一手飞机可以乱带,
    CardLogic.rule.triple_p1 = not rule.no_triple_p1  --最后一手首发允许三带一
    CardLogic.rule.tripleA_is_bomb = rule.tripleA_is_bomb  --三个A是炸弹(大于所有的炸弹)必须带一张牌
    CardLogic.rule.allow_4plus3 = rule.allow_4plus3  --允许4带3,
    CardLogic.rule.tailed_tripple = rule. tailed_tripple  --最后一手允许三张压死别人的三带二,
end

---@return 牌列表转换为牌值
---@param cards table,cards
function CardLogic.idx2value(cards)
    if not CardTool.table_nil_or_null(cards) then
        return cards
    else
        local newcards = {}
        for i, j in ipairs(cards) do
            table.insert(newcards, CardLogic.NameIdx2Value(j))
        end
        return newcards
    end
end

---@return 是否是单牌
---@param cards,table,cards
function CardLogic.danpai(cards)
    if #cards == 1 then
        local newcards = CardLogic.idx2value(cards)
        return newcards[1]
    else
        return false
    end
end

---@return 是否是对子
---@param cards table,cards
function CardLogic.duizi(cards)
    if #cards == 2 then
        local newcards = CardLogic.idx2value(cards)
        if CardTool.table_same_value(newcards) then
            return newcards[1]
        else
            return false
        end
    else
        return false
    end
end

---@return 是否是三张，和三带二
---@param cards table,cards


---@return 是否是连对（对子数大于或等于2个对子才是合法的）
---@param cards table,cards
function CardLogic.liandui(cards)
    local newcards = CardLogic.idx2value(cards)
    local twol, surl = CardTool.remove_two_same(newcards)
    if CardTool.table_value_shunzi(twol) and (#twol >= 2) and (#surl == 0) then
        twol = CardTool.sort_descend(twol)
        return twol[1]
    else
        return false
    end
end

---@return 是否是的顺子 必须大于或等于5个元素
---@param cards table,cards
function CardLogic.shunzi(cards)
    local newcards = CardLogic.idx2value(cards)
    if CardTool.table_value_shunzi(newcards) and #cards >= 5 then
        newcards = CardTool.sort_descend(newcards)
        return newcards[1]
    else
        return false
    end
end

function CardLogic.sanzhang(cards)
    if #cards == 3 then
        local newcards = CardLogic.idx2value(cards)
        local threel, surl = CardTool.remove_three_same(newcards)
        if (#threel == 1) then
            return threel[1]
        else
            return false
        end
    else
        return false
    end
end

function CardLogic.sandai_one(cards)
    if #cards == 4 then
        local newcards = CardLogic.idx2value(cards)
        local threel, surl = CardTool.remove_three_same(newcards)
        if (#threel == 1) then
            return threel[1]
        else
            return false
        end
    else
        return false
    end
end

function CardLogic.sandai_two(cards)
    if #cards == 5 then
        local newcards = CardLogic.idx2value(cards)

        local threel, surl = CardTool.remove_three_same(newcards)

        if (#threel == 1) then
            return threel[1]
        else
            return false
        end
    else
        return false
    end
end

function CardLogic.sandai_n(cards)
    if #cards >= 3 and #cards <= 5 then
        local newcards = CardLogic.idx2value(cards)
        local threel, surl = CardTool.remove_three_same(newcards)
        if (#threel == 1) then
            return threel[1]
        else
            return false
        end
    else
        return false
    end
end

---@return 是否是飞机
---@param cards table,cards
function CardLogic.feiji(cards)
    local newcards = CardLogic.idx2value(cards)
    local threel, surl = CardTool.remove_three_same(newcards)
    local air = false
    local feijinum = 0
    if #threel > 1 then
        local i = #threel
        while (i > 1) and (not air) do
            local lianshunl = CardTool.find_point_shunzi(threel, i)

            if #lianshunl > 0 then
                for j, l in ipairs(lianshunl) do
                    local sur_three = CardTool.TableSubtract(threel, l)
                    local surl1 = CardTool.copy_table_value(sur_three, 3)
                    local surl2 = CardTool.two_table_add(surl1, surl)
                    if (2 * #l == #surl2) or (#surl2 == 0) then
                        l = CardTool.sort_descend(l)
                        air = l[1]
                        feijinum = i
                    end
                end
            end
            i = i - 1
        end
    end
    return air, feijinum
end

---@return 是否是最后的飞机
---@param cards table,cards
function CardLogic.last_feiji(cards)
    local newcards = CardLogic.idx2value(cards)
    local threel, surl = CardTool.remove_three_same(newcards)
    local air = false
    local feijinum = 0
    if #threel > 1 then
        local i = #threel
        while (i > 1) and (not air) do
            local lianshunl = CardTool.find_point_shunzi(threel, i)

            if #lianshunl > 0 then
                for j, l in ipairs(lianshunl) do
                    local sur_three = CardTool.TableSubtract(threel, l)
                    local surl1 = CardTool.copy_table_value(sur_three, 3)
                    local surl2 = CardTool.two_table_add(surl1, surl)
                    if (2 * #l >= #surl2) then
                        --带的牌少于等于最大能带的牌数量就能出
                        l = CardTool.sort_descend(l)
                        air = l[1]
                        feijinum = i
                    end
                end
            end
            i = i - 1
        end
    end
    return air, feijinum
end

function CardLogic.sizhang(cards)
    if #cards == 4 then
        local newcards = CardLogic.idx2value(cards)
        if CardTool.table_same_value(newcards) then
            return newcards[1]
        else
            return false
        end
    else
        return false
    end
end

function CardLogic.zhadan(cards)
    local sizhang = CardLogic.sizhang(cards)
    if sizhang then
        return sizhang
    else
        if CardLogic.rule.tripleA_is_bomb then
            local sandaiyi = CardLogic.sandai_one(cards)
            if sandaiyi and sandaiyi == CardLogic.CardValue[CardLogic.card_A] then
                return sandaiyi
            else
                return false
            end
        else
            if CardLogic.rule.otherblack3player then
                local sanzhang = CardLogic.sanzhang(cards)
                if sanzhang and sanzhang == CardLogic.CardValue[CardLogic.card_3] then
                    return sanzhang
                else
                    return false
                end
            else
                return false
            end
        end
    end
end

function CardLogic.sidai_three(cards)
    if #cards == 7 and CardLogic.rule.allow_4plus3 then
        local newcards = CardLogic.idx2value(cards)
        local fourl, surl = CardTool.remove_four_same(newcards)
        if (#fourl == 1) then
            return fourl[1]
        else
            return false
        end
    else
        return false
    end
end

---@return 获取牌的牌型
---@param table
function CardLogic.get_cards_type(cards)
    if CardTool.table_nil_or_null(cards) then
        local danpai = CardLogic.danpai(cards)
        if danpai then
            return CardLogic.cardtype_danpai, danpai
        else
            local duizi = CardLogic.duizi(cards)
            if duizi then
                return CardLogic.cardtype_duizi, duizi
            else
                local liandui = CardLogic.liandui(cards)
                if liandui then
                    return CardLogic.cardtype_liandui, liandui
                else
                    local shunzi = CardLogic.shunzi(cards)
                    if shunzi then
                        return CardLogic.cardtype_shunzi, shunzi
                    else
                        local sidaisan = CardLogic.sidai_three(cards)
                        if sidaisan then
                            return CardLogic.cardtype_sidaisan, sidaisan
                        else
                            local zhadan = CardLogic.zhadan(cards)
                            if zhadan then
                                return CardLogic.cardtype_zhadan, zhadan
                            else
                                local sandaiyi = CardLogic.sandai_n(cards)
                                if sandaiyi then
                                    return CardLogic.cardtype_sandaiyi, sandaiyi
                                else
                                    local feiji = CardLogic.last_feiji(cards)
                                    if feiji then
                                        return CardLogic.cardtype_feiji, feiji
                                    else
                                        return CardLogic.cardtype_unknown
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        return CardLogic.cardtype_unknown
    end
end

---@return 找出所有的四张
---@param handcards table
function CardLogic.find_all_sizhang(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local fourl = CardTool.remove_four_same(newcardvalue)
    table.sort(fourl)
    local zhadanl = {}
    for i, j in ipairs(fourl) do
        local t = CardLogic.value2idx(j)
        table.insert(zhadanl, t)
    end
    return zhadanl
end

---@return 找出所有的炸弹
---@param handcards table
function CardLogic.find_all_zhadan(handcards)
    local sizhang = CardLogic.find_all_sizhang(handcards)
    local threel = CardLogic.find_all_sanzhang(handcards)
    for _, j in ipairs(threel) do
        if (CardLogic.rule.tripleA_is_bomb and CardLogic.NameIdx2Value(j[1]) == CardLogic.CardValue[CardLogic.card_A] and #handcards > 3) then
            local danzhang = CardTool.TableSubtract(handcards, j)
            CardLogic.CardSort(danzhang)
            table.insert(j, danzhang[#danzhang])
            table.insert(sizhang, j)
        elseif (CardLogic.rule.myblack3player and CardLogic.NameIdx2Value(j[1]) == CardLogic.CardValue[CardLogic.card_3]) then
            table.insert(sizhang, j)
        end
    end
    return sizhang
end

---@return 找出所有的三张
---@param handcards table
function CardLogic.find_all_sanzhang(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local fourl, surl = CardTool.remove_four_same(newcardvalue)
    local threel = CardTool.remove_three_same(surl)
    local sanzhangl = {}
    table.sort(threel)
    for _, j in ipairs(threel) do
        local t = CardLogic.value2have_idx(j, handcards)
        table.insert(sanzhangl, t)
    end
    return sanzhangl
end

---@return 找出所有的三张（排序版）
---@param handcards table
function CardLogic.find_sanzhang(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local fourl, surl = CardTool.remove_four_same(newcardvalue)
    local threel = CardTool.remove_three_same(surl)
    local feiji = CardLogic.find_feiji(handcards)
    local feiji_card = CardTool.TableCombine(feiji)
    local feiji_index = CardLogic.idx2value(feiji_card)

    local sanzhangl = {}
    table.sort(threel)
    for _, j in ipairs(threel) do
        local t = CardLogic.value2have_idx(j, handcards)
        if not CardTool.TableMember(feiji_index, j) then
            table.insert(sanzhangl, t)
        end
    end
    for _, j in ipairs(threel) do
        local t = CardLogic.value2have_idx(j, handcards)
        if CardTool.TableMember(feiji_index, j) then
            table.insert(sanzhangl, t)
        end
    end
    return sanzhangl
end

---@return 找出所有的对子（包括三张）
---@param handcards table
function CardLogic.find_all_duizi(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local fourl, surl = CardTool.remove_four_same(newcardvalue)
    local threel, surl2 = CardTool.remove_three_same(surl)
    local twol = CardTool.remove_two_same(surl2)
    table.sort(threel)
    table.sort(twol)
    local duizil = {}
    local sanzhangl = {}
    for _, j in ipairs(twol) do
        local t = CardLogic.value2have_idx(j, handcards)
        table.insert(duizil, t)
    end
    for _, j in ipairs(threel) do
        local t = CardLogic.value2have_point_idx({ j, j }, handcards)
        table.insert(sanzhangl, t)
    end
    return CardTool.two_table_add(duizil, sanzhangl), duizil
end

---@return 找出所有的对子（包括三张）(排序版)
---@param handcards table
function CardLogic.find_duizi(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local fourl, surl = CardTool.remove_four_same(newcardvalue)
    local threel, surl2 = CardTool.remove_three_same(surl)
    local twol = CardTool.remove_two_same(surl2)
    local liandui = CardLogic.find_liandui(handcards)
    local liandui_card = CardTool.TableCombine(liandui)
    local liandui_index = CardLogic.idx2value(liandui_card)
    table.sort(threel)
    table.sort(twol)
    local duizil = {}
    local sanzhangl = {}
    for _, j in ipairs(twol) do
        local t = CardLogic.value2have_idx(j, handcards)
        if not CardTool.TableMember(liandui_index, j) then
            table.insert(duizil, t)
        end
    end
    for _, j in ipairs(twol) do
        local t = CardLogic.value2have_idx(j, handcards)
        if CardTool.TableMember(liandui_index, j) then
            table.insert(duizil, t)
        end
    end
    for _, j in ipairs(threel) do
        local t = CardLogic.value2have_point_idx({ j, j }, handcards)
        table.insert(sanzhangl, t)
    end
    return CardTool.two_table_add(duizil, sanzhangl), duizil
end

--手牌排序
function CardLogic.CardSort(handcards)
    local newcardvalue = CardTool.usort(CardLogic.idx2value(handcards))
    local newhandCards = {}
    for i = 1, #newcardvalue do
        local v = CardLogic.value2have_idx(newcardvalue[i], handcards)
        for j = 1, #v do
            table.insert(newhandCards, v[j])
        end
    end
    return newhandCards
end

--移除2
function CardLogic.remove2(handcards)
    local value2 = {}
    for k, v in ipairs(handcards) do
        if CardLogic.NameIdx2Value(v) == CardLogic.CardValue[2] then
            table.remove(handcards, k)
            table.insert(value2, v)
        end
    end
    return value2
end

---@return 找出所有的单张(包括对子，三张中的一张) 和可以带的牌
---@param handcards table
function CardLogic.find_all_danzhang(handcards)
    local handcard = CardTool.copy_table(handcards)
    local value2 = CardLogic.remove2(handcard)
    local new_handcards = CardLogic.CardSort(handcard)
    local shunzi = CardLogic.find_special_shunzi(new_handcards)
    local zhadan = CardLogic.find_all_zhadan(new_handcards)
    local handNoBom = CardTool.TableSubtract(new_handcards, CardTool.TableCombine(zhadan))
    local sanzhang = CardLogic.find_all_sanzhang(new_handcards)
    local _, duizi = CardLogic.find_all_duizi(new_handcards)
    local nocard = CardLogic.CardSort(CardTool.usort(CardTool.TableCombine(CardTool.TableAdd({ shunzi, zhadan, sanzhang, duizi }))))
    local single = {}
    local daipai = {}
    for i = 1, #new_handcards do
        --除去顺子炸弹三张对子后的单张
        if not CardTool.TableMember(nocard, new_handcards[i]) then
            table.insert(single, new_handcards[i])
            table.insert(daipai, new_handcards[i])
        end
    end

    --顺子中的对子
    local shunzi_combine_index = CardLogic.idx2value(CardTool.usort(CardTool.TableCombine(shunzi)))
    --顺子中的单张
    local t = CardLogic.idx2value(CardTool.TableCombine(CardTool.TableAdd({ sanzhang, duizi })))
    for j = 1, #shunzi_combine_index do
        if CardTool.TableMember(t, shunzi_combine_index[j]) then
            local v = CardLogic.value2have_idx(shunzi_combine_index[j], handcards)
            if #v > 1 then
                table.insert(single, v[1])
                for i = 2, #v do
                    table.insert(daipai, v[i])
                end
            end
        end
    end
    --2放入单张列表中
    for i = 1, #value2 do
        table.insert(single, value2[i])
    end
    local lastSingle
    if #daipai % 2 == 1 then
        lastSingle = daipai[#daipai]
        table.remove(daipai, #daipai)
    end
    local duizicombine_index = CardTool.usort(CardLogic.idx2value(CardTool.TableCombine(duizi))) --对子中的一张
    for i = 1, #duizicombine_index do
        if not CardTool.TableMember(CardLogic.idx2value(single), duizicombine_index[i]) then
            local v = CardLogic.value2have_idx(duizicombine_index[i], handcards)
            if v and #v > 0 then
                table.insert(single, v[1])
                if lastSingle and CardLogic.NameIdx2Value(v[1]) > CardLogic.NameIdx2Value(lastSingle) then
                    table.insert(daipai, lastSingle)
                    for j = 1, #v do
                        table.insert(daipai, v[j])
                    end
                    lastSingle = nil
                else
                    for j = 1, #v do
                        table.insert(daipai, v[j])
                    end
                end
            end
        end
    end
    if lastSingle then
        table.insert(daipai, lastSingle)
        lastSingle = nil
    end
    local threecombine_index = CardTool.usort(CardLogic.idx2value(CardTool.TableCombine(sanzhang))) --三张中的一张
    for i = 1, #threecombine_index do
        if not CardTool.TableMember(CardLogic.idx2value(single), threecombine_index[i]) then
            local v = CardLogic.value2have_idx(threecombine_index[i], handcards)
            if v and #v > 0 then
                table.insert(single, v[1])
                for j = 1, #v do
                    table.insert(daipai, v[j])
                end
            end
        end
    end

    local shunzi_combine = CardLogic.CardSort(CardTool.usort(CardTool.TableCombine(shunzi)))
    --顺子中的单张
    for i = 1, #shunzi_combine do
        if not CardTool.TableMember(single, shunzi_combine[i]) then
            table.insert(single, shunzi_combine[i])
        end
    end
    for i = 1, #handNoBom do
        --剩下的单张放到带的牌列表中
        if not CardTool.TableMember(daipai, handNoBom[i]) then
            table.insert(daipai, handNoBom[i])
        end
    end
    --2放入带牌列表中
    for i = 1, #value2 do
        table.insert(daipai, value2[i])
    end

    local single_table = {}
    for i = 1, #single do
        table.insert(single_table, { single[i] })
    end

    return single_table, daipai, single
end

---@return 找出所有指定长度的顺子
---@param handcards table
---@param num int
function CardLogic.find_all_shunzi(handcards, num)
    local newcardvalue = CardLogic.idx2value(handcards)
    local _, surl = CardTool.remove_four_same(newcardvalue)
    local value_shunzi = CardTool.find_point_shunzi(surl, num)
    local idx_shunzi = {}
    for i, j in ipairs(value_shunzi) do
        local shunzi = CardLogic.value2have_point_idx(j, handcards)
        table.insert(idx_shunzi, shunzi)
    end
    return idx_shunzi
end

---@return 找出所有的顺子
---@param handcards table
---@param num int
function CardLogic.find_shunzi(handcards)
    local idx_shunzi = {}
    if #handcards >= 5 then
        for i = 5, #handcards do
            local value_shunzi = CardLogic.find_all_shunzi(handcards, i)
            for _, j in ipairs(value_shunzi) do
                table.insert(idx_shunzi, j)
            end
        end
    end
    return idx_shunzi
end

---@return 找出所有去掉头尾为对子的顺子
---@param handcards table
---@param num int
function CardLogic.find_special_shunzi(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local duizi, _ = CardTool.remove_two_same(newcardvalue)
    local shunzi = CardLogic.find_shunzi(handcards)
    local sp_shunzi = {}
    for _, i in ipairs(shunzi) do
        local index = CardLogic.idx2value(i)
        if not CardTool.TableMember(duizi, index[1]) and not CardTool.TableMember(duizi, index[#index]) then
            table.insert(sp_shunzi, i)
        end
    end
    for _, i in ipairs(shunzi) do
        local index = CardLogic.idx2value(i)
        if CardTool.TableMember(duizi, index[1]) or CardTool.TableMember(duizi, index[#index]) then
            table.insert(sp_shunzi, i)
        end
    end
    return sp_shunzi
end
--顺子排序，头尾为对子或者三张的排在后面
function CardLogic.shunziSort(handcards, shunzi)
    local newcardvalue = CardLogic.idx2value(handcards)
    local duizi, _ = CardTool.remove_two_same(newcardvalue)
    local sp_shunzi = {}
    for _, i in ipairs(shunzi) do
        local index = CardLogic.idx2value(i)
        if not CardTool.TableMember(duizi, index[1]) and not CardTool.TableMember(duizi, index[#index]) then
            table.insert(sp_shunzi, i)
        end
    end
    for _, i in ipairs(shunzi) do
        local index = CardLogic.idx2value(i)
        if CardTool.TableMember(duizi, index[1]) or CardTool.TableMember(duizi, index[#index]) then
            table.insert(sp_shunzi, i)
        end
    end
    return sp_shunzi
end

---@return 找出所有的飞机(不包括炸弹)
---@param handcards table
---@param num int
function CardLogic.find_all_feiji(handcards, num)
    local newcardvalue = CardLogic.idx2value(handcards)
    local fourl, surl = CardTool.remove_four_same(newcardvalue)
    local threel = CardTool.remove_three_same(surl)
    local value_shunzi = CardTool.find_point_shunzi(threel, num)
    local idx_shunzi = {}
    for i, j in ipairs(value_shunzi) do
        table.insert(idx_shunzi, CardLogic.value2have_point_idx(CardTool.copy_table_value(j, 3), handcards))
    end
    return idx_shunzi
end

---@return 找出所有的飞机
---@param handcards table
---@param num int
function CardLogic.find_feiji(handcards)
    local threel = CardLogic.find_all_sanzhang(handcards)
    local feijil = {}
    if #threel > 1 then
        for i = 2, #threel do
            local tem = CardLogic.find_all_feiji(handcards, i)
            for _, j in ipairs(tem) do
                table.insert(feijil, j)
            end
        end
    end
    return feijil
end

---@return 找出所有的连对
---@param handcards table
---@param num int
function CardLogic.find_all_liandui(handcards, num)
    local newcardvalue = CardLogic.idx2value(handcards)
    local fourl, surl = CardTool.remove_four_same(newcardvalue)
    local threel, surl2 = CardTool.remove_three_same(surl)
    local twol, surl3 = CardTool.remove_two_same(surl2)
    local alltwo = CardTool.two_table_add(threel, twol)
    local value_shunzi = CardTool.find_point_shunzi(alltwo, num)
    local idx_shunzi = {}
    for i, j in ipairs(value_shunzi) do
        table.insert(idx_shunzi, CardLogic.value2have_point_idx(CardTool.copy_table_value(j, 2), handcards))
    end
    return idx_shunzi
end
---@return 找出所有的连对
---@param handcards table
function CardLogic.find_liandui(handcards)
    local duizi = CardLogic.find_all_duizi(handcards)
    local liandui = {}
    if #duizi > 1 then
        for i = 2, #duizi do
            local tem = CardLogic.find_all_liandui(handcards, i)
            for _, j in ipairs(tem) do
                table.insert(liandui, j)
            end
        end
    end
    return liandui
end

---@return 找出所有去掉头尾为三张的连对
---@param handcards table
function CardLogic.find_special_liandui(handcards)
    local liandui = CardLogic.find_liandui(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local sanzhang, _ = CardTool.remove_three_same(newcardvalue)
    local sp = {}
    for _, i in ipairs(liandui) do
        local index = CardLogic.idx2value(i)
        if not CardTool.TableMember(sanzhang, index[1]) and not CardTool.TableMember(sanzhang, index[#index]) then
            table.insert(sp, i)
        end
    end
    for _, i in ipairs(liandui) do
        local index = CardLogic.idx2value(i)
        if CardTool.TableMember(sanzhang, index[1]) or CardTool.TableMember(sanzhang, index[#index]) then
            table.insert(sp, i)
        end
    end
    return sp
end

--连对排序
function CardLogic.lianduiSort(handcards, liandui)
    local newcardvalue = CardLogic.idx2value(handcards)
    local three, _ = CardTool.remove_three_same(newcardvalue)
    local sp = {}
    for _, i in ipairs(liandui) do
        local index = CardLogic.idx2value(i)
        if not CardTool.TableMember(three, index[1]) and not CardTool.TableMember(three, index[#index]) then
            table.insert(sp, i)
        end
    end
    for _, i in ipairs(liandui) do
        local index = CardLogic.idx2value(i)
        if CardTool.TableMember(three, index[1]) or CardTool.TableMember(three, index[#index]) then
            table.insert(sp, i)
        end
    end
    return sp
end

---@return 牌值转换为手牌中的索引(指定数量的牌)
---@param cardvaluel table
---@param handcard table
function CardLogic.value2have_point_idx(cardvaluel, handcard)
    local pointl = {}
    local newhandcard = CardTool.copy_table(handcard)
    for i, j in ipairs(cardvaluel) do
        local havel = CardLogic.value2have_idx(j, newhandcard)
        if #havel > 0 then
            for t, k in ipairs(newhandcard) do
                if k == havel[1] then
                    table.insert(pointl, k)
                    table.remove(newhandcard, t)
                end
            end
        end
    end
    -- pointl = CardTool.sort_ascend(pointl)
    return pointl
end

---@return 牌值转换为手牌中的索引（全部拥有的牌）
---@param cardvalue int
---@param handcard table
function CardLogic.value2have_idx(cardvalue, handcard)
    local cardl = CardLogic.value2idx(cardvalue)
    local havecardl = {}
    for i, j in ipairs(cardl) do
        if CardTool.TableMember(handcard, j) then
            table.insert(havecardl, j)
        end
    end
    havecardl = CardTool.sort_ascend(havecardl)
    return havecardl
end

---@return 牌值列表转换为手牌中的索引（全部拥有的牌）
---@param cardvalue int
---@param handcard table
function CardLogic.values2have_idx(cardvalues, handcard)
    local havel = {}
    for i = 1, #cardvalues do
        local s = CardLogic.value2have_idx(cardvalues[i], handcard)
        for j = 1, #s do
            table.insert(havel, s[j])
        end
    end
    return havel
end

---@return 牌值转换为牌中的索引
---@param cardvalue int
function CardLogic.value2idx(cardvalue)
    local cardname = CardLogic.card_unknown
    for i, j in ipairs(CardLogic.CardValue) do
        if cardvalue == j then
            cardname = i
        end
    end
    return {
        CardLogic.FormatCardIndex(cardname, CardLogic.color_black_heart),
        CardLogic.FormatCardIndex(cardname, CardLogic.color_red_heart),
        CardLogic.FormatCardIndex(cardname, CardLogic.color_plum),
        CardLogic.FormatCardIndex(cardname, CardLogic.color_square)
    }
end

---@return 牌值转换为CardValue
---@param cardvalue int
function CardLogic.value2cardvalue(cardvalue)
    local cardname = 0
    for i, j in ipairs(CardLogic.CardValue) do
        if cardvalue == j then
            cardname = i
        end
    end
    return cardname
end

---@return 牌转换为name
---@param card int
function CardLogic.card2name(card)
    local cardname = CardLogic.card_unknown
    for i, j in ipairs(CardLogic.CardValue) do
        if card == j then
            cardname = i
        end
    end
    return cardname
end

---@return 找出所有大于单张的牌型
---@param handcard table
---@param outvalue int
function CardLogic.find_all_biger_danpai(handcard, outvalue)
    local alltype = CardLogic.find_all_danzhang(handcard)
    local biger = {}
    for i, j in ipairs(alltype) do
        local v = CardLogic.danpai(j)
        if v then
            if v > outvalue then
                table.insert(biger, j)
            end
        end
    end
    return biger
end
---@return 找出所有大于对子的牌型
---@param handcard table
---@param outvalue int
function CardLogic.find_all_biger_duizi(handcard, outvalue)
    local alltype = CardLogic.find_duizi(handcard)
    local biger = {}
    for i, j in ipairs(alltype) do
        local v = CardLogic.duizi(j)
        if v then
            if v > outvalue then
                table.insert(biger, j)
            end
        end
    end
    return biger
end

---@return 找出所有大于炸弹的牌型
---@param handcard table
---@param outvalue int
function CardLogic.find_all_biger_zhadan(handcard, outvalue)
    local alltype = CardLogic.find_all_zhadan(handcard)
    local biger = {}
    for i, j in ipairs(alltype) do
        local v = CardLogic.zhadan(j)
        if v then
            if v > outvalue then
                table.insert(biger, j)
            end
        end
    end
    return biger
end
---@return 找出所有大于顺子的牌型
---@param handcard table
---@param outvalue int
---@param num int
function CardLogic.find_all_biger_shunzi(handcard, outvalue, num)
    local alltype = CardLogic.find_all_shunzi(handcard, num)
    local shunzi = CardLogic.shunziSort(handcard, alltype)
    local biger = {}
    if #handcard >= num then
        for i, j in ipairs(shunzi) do
            local v = CardLogic.shunzi(j)
            if v then
                if v > outvalue then
                    table.insert(biger, j)
                end
            end
        end
    end
    return biger
end
---@return 找出所有大于连对的牌型
---@param handcard table
---@param outvalue int
---@param num int
function CardLogic.find_all_biger_liandui(handcard, outvalue, num)
    local alltype = CardLogic.find_all_liandui(handcard, num)
    local liandui = CardLogic.lianduiSort(handcard, alltype)
    local biger = {}
    if #handcard >= num * 2 then
        for i, j in ipairs(liandui) do
            local v = CardLogic.liandui(j)
            if v then
                if v > outvalue then
                    table.insert(biger, j)
                end
            end
        end
    end
    return biger
end

---@return 找出所有大于三张的牌型
---@param handcard table
---@param outvalue int
function CardLogic.find_all_biger_sanzhang(handcard, outvalue, num)
    local alltype = CardLogic.find_sanzhang(handcard)
    local biger = {}
    if #handcard >= num then
        for i, j in ipairs(alltype) do
            local v = CardLogic.sandai_n(j)
            if v then
                if v > outvalue then
                    table.insert(biger, j)
                end
            end
        end
    else
        if CardLogic.rule.tailed_tripple then
            local san = CardLogic.sandai_n(handcard)
            if san and san > outvalue then
                table.insert(biger, handcard)
            end
        end
    end
    if CardLogic.rule.tripleA_is_bomb then
        local index = 0
        for i = 1, #biger do
            if CardLogic.NameIdx2Value(biger[i][1]) == CardLogic.CardValue[CardLogic.card_A] then
                index = i
            end
        end
        if index > 0 then
            table.remove(biger,index)
        end

    end
    return biger
end

---@return 找出所有大于飞机的牌型
---@param handcard table
---@param outvalue int
---@param num int
function CardLogic.find_all_biger_feiji(handcard, outcard)
    local outvalue, num = CardLogic.feiji(outcard)
    local alltype = CardLogic.find_all_feiji(handcard, num)
    local biger = {}
    if #handcard >= #outcard then
        for i, j in ipairs(alltype) do
            local v = CardLogic.feiji(j)
            if v then
                if v > outvalue then
                    table.insert(biger, j)
                end
            end
        end
    else
        if CardLogic.rule.allow_unruled_multitriple then
            local fei, n = CardLogic.last_feiji(handcard)
            if fei and fei > outvalue and n == num then
                table.insert(biger, handcard)
            end
        end
    end
    return biger
end

---@return 升序排序
---@param t table
function CardLogic.sort_ascend(t)
    table.sort(
            t,
            function(a, b)
                return CardLogic.NameIdx2Value(a) < CardLogic.NameIdx2Value(b)
            end
    )
    return t
end

---@return 找出所有大于上家出的牌的牌型(压牌提示)
---@param handcard table
---@param outcard table
function CardLogic.find_all_biger_type(handcard, outcard, singleMax)
    local allboom = CardLogic.find_all_zhadan(handcard)
    local outtype, outvalue = CardLogic.get_cards_type(outcard)
    if outtype == CardLogic.cardtype_danpai then
        if singleMax then
            local tishi = CardLogic.find_all_biger_danpai(handcard, outvalue)
            if #tishi > 0 then
                return CardTool.two_table_add({ { CardLogic.MaxCards(handcard) } }, allboom)
            else
                return allboom
            end
        else
            return CardTool.two_table_add(CardLogic.find_all_biger_danpai(handcard, outvalue), allboom)
        end
    elseif outtype == CardLogic.cardtype_duizi then
        return CardTool.two_table_add(CardLogic.find_all_biger_duizi(handcard, outvalue), allboom)
    elseif outtype == CardLogic.cardtype_sandaiyi then
        local sanzhang = CardLogic.find_all_biger_sanzhang(handcard, outvalue, #outcard)
        --CardLogic.insertThreeOrAir(handcard, sanzhang)
        return CardTool.two_table_add(sanzhang, allboom)
    elseif outtype == CardLogic.cardtype_sidaisan then
        return CardLogic.find_all_biger_zhadan(handcard, outvalue)
    elseif outtype == CardLogic.cardtype_zhadan then
        return CardLogic.find_all_biger_zhadan(handcard, outvalue)
    elseif outtype == CardLogic.cardtype_shunzi then
        return CardTool.two_table_add(CardLogic.find_all_biger_shunzi(handcard, outvalue, #outcard), allboom)
    elseif outtype == CardLogic.cardtype_liandui then
        return CardTool.two_table_add(CardLogic.find_all_biger_liandui(handcard, outvalue, #outcard / 2), allboom)
    elseif outtype == CardLogic.cardtype_feiji then
        local feiji = CardLogic.find_all_biger_feiji(handcard, outcard, #outcard)
        --CardLogic.insertThreeOrAir(handcard, feiji)
        return CardTool.two_table_add(feiji, allboom)
    else
        return {}
    end
end

function CardLogic.can_one_outall(handcard)
    if #handcard == 1 then
        return true
    else
        local zhadan = CardLogic.find_all_zhadan(handcard)
        if #zhadan == 0 then
            if CardLogic.duizi(handcard) or CardLogic.shunzi(handcard) or CardLogic.liandui(handcard) or CardLogic.zhadan(handcard) or CardLogic.feiji(handcard) or CardLogic.sandai_two(handcard) or CardLogic.sanzhang(handcard) then
                return true
            elseif CardLogic.rule.triple_p1 and CardLogic.sandai_one(handcard) then
                return true
            elseif CardLogic.rule.allow_unruled_multitriple and CardLogic.last_feiji(handcard) then
                return true
            else
                return false
            end
        else
            return false
        end
    end
end

---@return 先手提示
---@param handcard table
function CardLogic.first_tishi_card(handcard, black3, singleMax)
    local tishi, auto = {}, false
    local oneout = CardLogic.can_one_outall(handcard)
    if oneout then
        tishi = { handcard }
        auto = true
    else
        tishi = CardLogic.find_tishi_type(handcard, black3)
    end

    if black3 then
        local black3tishi = {}
        for i = 1, #tishi do
            local tem = tishi[i]
            if CardTool.TableMember(CardLogic.idx2value(tem), CardLogic.NameIdx2Value(black3)) then
                if not CardTool.TableMember(tem, black3) then
                    for j = 1, #tem do
                        if CardLogic.NameIdx2Value(tem[j]) == CardLogic.NameIdx2Value(black3) then
                            tem[j] = black3
                            break
                        end
                    end
                end
                table.insert(black3tishi, tishi[i])
            end
        end
        return black3tishi, auto
    elseif singleMax then
        local tishi1 = {}
        for i = 1, #tishi do
            if #(tishi[i]) > 1 then
                table.insert(tishi1, tishi[i])
            end
        end
        table.insert(tishi1, { CardLogic.MaxCards(handcard) }) --手牌中最大的牌
        return tishi1, auto
    else
        return tishi, auto
    end
end
--手牌中最大的牌
function CardLogic.MaxCards(handcards)
    local newcardvalue = CardLogic.idx2value(handcards)
    local max = 0
    for i = 1, #newcardvalue do
        if newcardvalue[i] > max then
            max = newcardvalue[i]
        end
    end
    local maxCard = CardLogic.value2have_idx(max, handcards)
    return maxCard[1]
end

--筛选提示中包含cards中的值的提示
function CardLogic.tishiChoose(tishi, cards)
    local tishi1 = {}
    for i = 1, #tishi do
        for j = 1, #cards do
            if CardTool.TableMember(tishi[i], cards[j]) then
                table.insert(tishi1, tishi[i])
            end
        end
    end
    if #tishi1 > 0 then
        return { tishi1[1] }
    else
        return { cards }
    end
end

--插入可以带的牌，直接操作table
function CardLogic.insertThreeOrAir(handcard, cardl, black3)
    for i = 1, #cardl do
        local surhandcard = CardTool.TableSubtract(handcard, cardl[i]) --可以带的牌
        local _, daipai = CardLogic.find_all_danzhang(surhandcard) --带的牌排序
        local num = #cardl[i] / 3 * 2
        if black3 and CardTool.TableMember(daipai, black3) then
            local index = 0
            while index < num and #daipai > 0 do
                if index == 0 then
                    table.insert(cardl[i], black3)
                    index = index + 1
                    if CardTool.TableMember(daipai, black3) then
                        CardLogic.table_remove_value(daipai, black3)
                    end
                else
                    local newdaipai = CardLogic.idx2value(daipai)
                    local black3Index = CardLogic.NameIdx2Value(black3)
                    if CardTool.TableMember(newdaipai, black3Index) then
                        local have3 = CardLogic.value2have_idx(black3Index, daipai)
                        table.insert(cardl[i], have3[1])
                        CardLogic.table_remove_value(daipai, have3[1])
                    else
                        table.insert(cardl[i], daipai[1])
                        table.remove(daipai, 1)
                    end
                    index = index + 1
                end
            end
        else
            for j = 1, num do
                if daipai[j] then
                    table.insert(cardl[i], daipai[j])
                end
            end
        end
    end
end

function CardLogic.table_remove_value(t, v)
    local index
    for i = 1, #t do
        if t[i] == v then
            index = i
        end
    end
    if index then
        table.remove(t, index)
    end
end

---@return 不能一把出完的首发提示牌型
---@param handcard table
function CardLogic.find_tishi_type(handcard, black3)
    local shunzi = CardLogic.find_special_shunzi(handcard)
    local liandui = CardLogic.find_special_liandui(handcard)
    local feiji = CardLogic.find_feiji(handcard)
    local sanzhang = CardLogic.find_sanzhang(handcard)
    local _, duizi = CardLogic.find_all_duizi(handcard)
    local danzhang = CardLogic.find_all_danzhang(handcard) --所有牌型按错小到大排序
    local zhadan = CardLogic.find_all_zhadan(handcard)
    --CardLogic.insertThreeOrAir(handcard, feiji, black3) --插入可以带的牌
    --CardLogic.insertThreeOrAir(handcard, sanzhang, black3)
    --牌型按 飞机带翅膀>顺子>三带二>连对>对子>单张 排序
    local alltype = CardTool.TableAdd({ feiji, shunzi, sanzhang, liandui, duizi, danzhang }) --所有可以出的牌型
    local len = 0
    local sortAllType = {}
    for i = 1, #alltype do
        --找出最大牌数
        local num = CardLogic.get_cards_len(alltype[i])
        if num > len then
            len = num
        end
    end
    for i = len, 1, -1 do
        --按牌数从大到小排序
        for j = 1, #alltype do
            local num = CardLogic.get_cards_len(alltype[j])
            if num == i then
                table.insert(sortAllType, alltype[j])
            end
        end
    end
    for i = 1, #zhadan do
        table.insert(sortAllType, zhadan[i])
    end
    return sortAllType
end

function CardLogic.get_cards_len(cards)
    local num = #cards
    local tp = CardLogic.get_cards_type(cards)
    if tp == CardLogic.cardtype_sandaiyi then
        num = num + 2
    elseif tp == CardLogic.cardtype_feiji then
        num = num + (math.floor(num) / 3) * 2
    end
    return num
end

--初始化，牌局开始前须先初始化，不初始化用默认值
---@param rule table 牌局规则
function CardLogic.initRule(rule)

    CardLogic.rule.allow_unruled_multitriple = rule.allow_unruled_multitriple  --最后一手飞机可以乱带,
    CardLogic.rule.triple_p1 = not rule.no_triple_p1  --最后一手首发允许三带一
    CardLogic.rule.tripleA_is_bomb = rule.tripleA_is_bomb  --三个A是炸弹(大于所有的炸弹)必须带一张牌
    CardLogic.rule.allow_4plus3 = rule.allow_4plus3  --允许4带3,
    CardLogic.rule.tailed_tripple = rule.tailed_tripple  --最后一手允许三张压死别人的三带二,
    CardLogic.rule.black3isboom = rule.four3_black3_three3_isbomb or rule.first_must_black3  --黑桃3是炸弹,如果默认黑桃3先出就算炸弹
    if ModuleCache.GameManager.developmentMode then
        print(ModuleCache.Json.encode(rule))
    end
end

---@return1 提示牌型 table
---@return2 是否能一次出完 boolean
---@return3 置灰牌 table
---@param handcard table 手牌  {1,2,3,4,5}
---@param black3 number 特定牌是否要先出 黑桃3 9
---@param outcard table 上家出的牌，没有的话默认为首发 {1,2,3}
---@param opCards table 玩家点击或者滑动的牌,没有的话默认为玩家点击提示  {1,2}
---@param firstOp boolean 玩家的操作是否第一次  true false
---@param singleMax boolean 下家报单是否要出最大牌
---@param myblack3player boolean 自己是否是首发出黑桃3的玩家（3个3算炸弹）
---@param otherblack3player boolean 别人是否是出黑桃3的玩家（3个3算炸弹）
function CardLogic.tishi(handcard, black3, outcard, opCards, firstOp, singleMax, myblack3player, otherblack3player)
    print("====跑得快提示====", myblack3player, otherblack3player,black3,firstOp,singleMax)
    CardLogic.rule.myblack3player = myblack3player and CardLogic.rule.black3isboom
    CardLogic.rule.otherblack3player = otherblack3player and CardLogic.rule.black3isboom
    local handcards = CardTool.copy_table(handcard)
    local tishi, auto, greycards = {}, false, {}
    if not outcard then
        --首发
        if not opCards then
            --玩家点击提示
            tishi, auto = CardLogic.first_tishi_card(handcards, black3, singleMax)
        else
            --玩家操作提示
            if #opCards == 1 then
                --点击操作
                tishi = { opCards }
            else
                --滑动操作
                --if firstOp then
                --    --第一次滑动
                --    local tishi = CardLogic.first_tishi_card(opCards)
                --    return tishi, false
                --else
                --    return { opCards }, false
                --end
                tishi = CardLogic.first_tishi_card(opCards)
            end
        end
    else
        --非首发，压牌提示
        if not opCards then
            --玩家点击提示
            tishi = CardLogic.find_all_biger_type(handcards, outcard, singleMax)
            if #tishi > 0 then
                for i = 1, #tishi do
                    if #tishi[i] == #handcards then
                        auto = true
                    end
                end
                local outtype = CardLogic.get_cards_type(outcard)
                if outtype == CardLogic.cardtype_sandaiyi or outtype == CardLogic.cardtype_feiji then
                    greycards = {}
                else
                    local handvalue = CardTool.usort(CardLogic.idx2value(handcards))
                    local tishivalue = CardTool.usort(CardLogic.idx2value(CardTool.TableCombine(tishi)))
                    local greyvalue = CardTool.TableSubtract(handvalue, tishivalue)
                    greycards = CardLogic.values2have_idx(greyvalue, handcards)
                    --print("===========",ModuleCache.Json.encode(handvalue),ModuleCache.Json.encode(tishivalue),ModuleCache.Json.encode(greyvalue),ModuleCache.Json.encode(greycards))
                end

            else
                greycards = handcards
            end
        else
            if #opCards == 1 then
                --玩家点击操作
                if firstOp then
                    --第一次点击
                    local bigger = CardLogic.find_all_biger_type(handcards, outcard, singleMax)
                    tishi = CardLogic.tishiChoose(bigger, opCards)
                else
                    --第二次之后的点击
                    tishi = { opCards }
                end
            else
                --滑动操作
                --if firstOp then
                --    --第一次滑动
                --    local tishi = CardLogic.find_all_biger_type(handcards, outcard, singleMax)
                --    local tishi1 = CardLogic.tishiChoose(tishi, opCards)
                --    return tishi1, false
                --else
                --    return { opCards }, false
                --end
                tishi = CardLogic.find_all_biger_type(opCards, outcard, singleMax)
                if #tishi == 0 then
                    tishi = { opCards }
                end

            end
        end
    end
    if ModuleCache.GameManager.developmentMode then
        print("提示手牌:", CardLogic.Card2Str(handcard),"\n上家出的牌:", CardLogic.Card2Str(outcard),"\n滑动的牌:", CardLogic.Card2Str(opCards), "，\n是否自动出牌：", auto, "，\n提示牌型：", ModuleCache.Json.encode(CardLogic.Cards2Str(tishi)), "，\n置灰牌：", CardLogic.Card2Str(greycards))

    end

    return tishi, auto, greycards
end

function CardLogic.NameIdx2Value(name_idx)
    return CardLogic.CardValue[math.modf((name_idx - 1) / 4 + 1)]
end

function CardLogic.FormatCardIndex(name, color)
    return (name - 1) * 4 + color
end

function CardLogic.Card2Str(cards)
    if not cards then
        return ""
    end
    local newcards = CardLogic.CardSort(cards)
    local str = ""
    for i = 1, #newcards do
        local v = CardLogic.ResolveCardIdx(newcards[i])

        str = str .. CardLogic.color_name[v.color] .. CardLogic.value_name[v.name] .. ","
    end
    return str
end

function CardLogic.Cards2Str(cards)
    if not cards then
        return ""
    end
    local strs = {}
    for i = 1, #cards do
        table.insert(strs, CardLogic.Card2Str(cards[i]))
    end
    return strs
end

function CardLogic.ResolveCardIdx(name_idx)
    local name = math.modf((name_idx - 1) / 4 + 1)
    local color = name_idx - (name - 1) * 4
    return { name = name, color = color }
end

return CardLogic
