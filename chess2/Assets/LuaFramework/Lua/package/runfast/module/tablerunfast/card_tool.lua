





local CardTool = {}

---@return多个表相加
---@param t table
---@param num int
function CardTool.TableAdd(t, num)
    if num == nil then
        num = #t
    end
    local r = {}
    for i = 1, num do
        for j, v in ipairs(t[i]) do
            table.insert(r, v)
        end
    end
    return r
end

---@return两个表相加
---@param t1 table
---@param t2 table
function CardTool.two_table_add(t1, t2)
    return CardTool.TableAdd({ t1, t2 }, 2)
end

---@return两个表相减
---@param t1 table
---@param t2 table
function CardTool.TableSubtract(t1, t2)
    local r = {}
    local tempt2 = CardTool.copy_table(t2)
    for _, v in ipairs(t1) do
        local temp1 = false
        local num1 = 0
        for i, j in ipairs(tempt2) do
            if v == j then
                temp1 = true
                num1 = i
            end

        end
        if temp1 then
            table.remove(tempt2, num1)
        else
            table.insert(r, v)
        end
    end
    return r
end

---@return是否表中的元素
---@param t table
---@param v any
function CardTool.TableMember(t, v)
    local mem = false
    for i, j in ipairs(t) do
        if j == v then
            mem = true
        end
    end
    return mem
end

---@return 表中的元素是否一样
---@param t table
function CardTool.table_same_value(t)
    if CardTool.table_nil_or_null(t) then
        local same = true
        if #t > 1 then
            for i = 1, #t - 1 do
                if t[i] ~= t[i + 1] then
                    same = false
                end
            end
        end
        return same
    else
        return true
    end
end

---@return 降序排序
---@param t table
function CardTool.sort_descend(t)
    table.sort(t, function(a, b)
        return a > b
    end)
    return t
end

---@return 升序排序
---@param t table
function CardTool.sort_ascend(t)
    table.sort(t, function(a, b)
        return a < b
    end)
    return t
end

---@return 随机排序
---@param tbl table
function CardTool.table_shuffle(tbl)
    local n = #tbl
    for i = 1, n do
        local j = math.random(i, n)
        if j > i then
            tbl[i], tbl[j] = tbl[j], tbl[i]
        end
    end
    return tbl
end

---@return 取整
---@param x number
function CardTool.getIntPart(x)
    if x <= 0 then
        return math.ceil(x);
    end

    if math.ceil(x) == x then
        x = math.ceil(x);
    else
        x = math.ceil(x) - 1;
    end
    return x;
end

---x ^ y,幂次方
---@param x number
---@param y number
---@return number
function CardTool.pow(x, y)
    if y == 0 then
        return 1
    elseif y > 0 then
        local result = 1
        for i = 1, y do
            result = result * x
        end
        return result
    else
        local result = 1
        for i = 1, -y do
            result = result * x
        end
        return 1 / result
    end
end

---@return 判断是否是table 且元素个数大于0
---@param t table
function CardTool.table_nil_or_null(t)
    if type(t) ~= "table" then
        return false
    elseif #t == 0 then
        return false
    else
        return true
    end
end

---@return 将表中的所有元素复制指定数量
---@param t table
---@param i int
function CardTool.copy_table_value(t, i)
    local ntable = {}
    for k, j in ipairs(t) do
        for m = 1, i do
            table.insert(ntable, j)
        end
    end
    return ntable
end

---@return 移除四个相同的元素
---@param t table
function CardTool.remove_four_same(t)
    local removel = CardTool.get_mulsame_card(t, 4)
    local surl = CardTool.TableSubtract(t, CardTool.copy_table_value(removel, 4))
    return removel, surl
end

---@return 移除三个相同的元素
---@param t table
function CardTool.remove_three_same(t)
    local removel = CardTool.get_mulsame_card(t, 3)
    local surl = CardTool.TableSubtract(t, CardTool.copy_table_value(removel, 3))
    return removel, surl
end

---@return 移除两个个相同的元素
---@param t table
function CardTool.remove_two_same(t)
    local removel = CardTool.get_mulsame_card(t, 2)
    local surl = CardTool.TableSubtract(t, CardTool.copy_table_value(removel, 2))
    return removel, surl
end

---@return获取多个一样的元素 ({3,3,3,3,4} 3,) {{3,3,3},{3,4}}
---@param t table
---@param num int
function CardTool.get_mulsame_card(t, num)
    local copyt = CardTool.usort(t)   --去掉重复的牌并排序
    local mul = {}
    for i = 1, #copyt do
        local ts = 0
        for j, k in ipairs(t) do
            if k == copyt[i] then
                ts = ts + 1
            end
        end
        if ts >= num then
            table.insert(mul, copyt[i])  --CardTool.copy_table_value({ copyt[i] }, num)
        end
    end
    return mul
end

---@return 判断表中的元素是不是顺子 1,2  4,5,6
---@param t table
function CardTool.table_value_shunzi(t)
    local shunzi = true
    if #t == 0 then
        shunzi = false
    elseif #t > 1 then
        local copyt = CardTool.copy_table(t)
        copyt = CardTool.sort_ascend(copyt)
        for i = 1, #copyt - 1 do
            if copyt[i] + 1 ~= copyt[i + 1] then
                shunzi = false
            end
        end
    end
    return shunzi
end

---@return 找出所有指定长度的顺子
---@param t table
function CardTool.find_point_shunzi(t, len)
    local copyt = CardTool.usort(t)   --去掉重复的牌并排序
    local shunzil = {}
    if (#copyt >= len) and (len > 1) then
        for i = 1, #copyt - len + 1 do
            local daixuan = {}
            for j = i, len + i - 1 do
                table.insert(daixuan, copyt[j])
            end
            if CardTool.table_value_shunzi(daixuan) then
                table.insert(shunzil, daixuan)
            end
        end
    end
    return shunzil
end

---@return 复制table，只复制一层
---@param t table
function CardTool.copy_table(t)
    local copyt = {}
    for i, j in ipairs(t) do
        table.insert(copyt, j)
    end
    return copyt
end

---@return 去掉重复的元素并升序排序(复制出一份新表操作)
---@param t table
function CardTool.usort(t)
    local r = {}
    for i, j in ipairs(t) do
        if not CardTool.TableMember(r, j) then
            table.insert(r, j)
        end
    end
    --r = CardTool.sort_ascend(r)
    table.sort(r)
    return r
end


-- @function: 打印table的内容，递归
-- @param: tbl 要打印的table
-- @param: level 递归的层数，默认不用传值进来
-- @param: filteDefault 是否过滤打印构造函数，默认为是
-- @return: return
function CardTool.PrintTable(tbl, level, filteDefault)
    print("======开始打印table======")
    PrintTable(tbl, level, filteDefault)
    print("======结束打印table======")
end

-- @function: 打印table的内容，递归
-- @param: tbl 要打印的table
-- @param: level 递归的层数，默认不用传值进来
-- @param: filteDefault 是否过滤打印构造函数，默认为是
-- @return: return
function PrintTable(tbl, level, filteDefault)
    filteDefault = filteDefault or true --默认过滤关键字（DeleteMe, _class_type）
    level = level or 1
    local indent_str = ""
    for i = 1, level do
        indent_str = indent_str .. "  "
    end

    print(indent_str .. "{")
    for k, v in pairs(tbl) do
        if filteDefault then
            if k ~= "_class_type" and k ~= "DeleteMe" then
                local item_str = string.format("%s%s = %s", indent_str .. " ", tostring(k), tostring(v))
                print(item_str)
                if type(v) == "table" then
                    PrintTable(v, level + 1)
                end
            end
        else
            local item_str = string.format("%s%s = %s", indent_str .. " ", tostring(k), tostring(v))
            print(item_str)
            if type(v) == "table" then
                PrintTable(v, level + 1)
            end
        end
    end
    print(indent_str .. "}")
end

---@return 最大值
---@param t table
function CardTool.Max(t)
    local max = 0
    for k, v in ipairs(t) do
        if v > max then
            max = v
        end
    end
    return max
end

function CardTool.TableCombine(t)
    local combine = {}
    if type(t) == "table" then
        for _, m in ipairs(t) do
            if type(m) == "table" then
                local n = CardTool.TableCombine(m)
                for _, i in ipairs(n) do
                    table.insert(combine, i)
                end
            else
                table.insert(combine, m)
            end
        end
    else
        return t
    end
    return combine
end

return CardTool