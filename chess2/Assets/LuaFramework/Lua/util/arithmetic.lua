



local table = table
local print = print
local arithmetic = {}
local retData = nil

--全排列
function arithmetic.fullPermutation(fullArray, startPos, endPos)
    local function swap(i1, i2, arr)
        local temp = arr[i2];
        arr[i2] = arr[i1];
        arr[i1] = temp;
    end
    startPos = startPos or 1
    endPos = endPos or #fullArray
    if startPos >= endPos then
        local tmpData = {}
        for i = 1, #fullArray do
            table.insert(tmpData, fullArray[i])
        end
        table.insert(retData, tmpData)
        print(table.concat(fullArray, ","))
        return
    else
        for j = startPos, endPos do
            --for循环将每个数放到start位置中去
            swap(startPos, j, fullArray);
            --剩下的数继续递归,下一个位置,一维问题
            arithmetic.fullPermutation(fullArray, startPos + 1, endPos);
            --回溯
            swap(startPos, j, fullArray);
        end
    end
end

--组合
function arithmetic.combination(arr, nCount, resultArr, head)
    head = head or 1
    resultArr = resultArr or {}
    if (#resultArr == nCount ) then
        --组合选的结果出来
        local tmpData = {}
        for i = 1, #resultArr do
            table.insert(tmpData, resultArr[i])
        end
        table.insert(retData, tmpData)
        --print(table.concat(resultArr, ","))
    else
        for i = head, #arr do
            if (#resultArr < nCount  ) then
                table.insert(resultArr, arr[i])
                arithmetic.combination(arr, nCount, resultArr, i + 1)
                --回溯还原
                table.remove(resultArr)
            end
        end
    end
end

--所有组合
function arithmetic.allCombination(arr, num)
    retData = {}
    if num then
        arithmetic.combination(arr, num)
    else
        for i = 1, #arr do
            arithmetic.combination(arr, i)
        end
    end
end

-- 组合分组
function arithmetic.allCombinationGroup(arr, num, group)
    arithmetic.allCombination(arr, num)
    local groupData = {}
    for i = 1, #retData do
        for j = i + 1, #retData do
            local contain = false
            for m = 1, 3 do
                for n = 1, 3 do
                    if retData[i][m] == retData[j][n] then
                        contain = true
                        break
                    end
                end
                if contain then
                    break
                end
            end

            if not contain then
                local tmpData = {}
                for m = 1, 3 do
                    table.insert(tmpData, retData[i][m])
                end
                for m = 1, 3 do
                    table.insert(tmpData, retData[j][m])
                end

                for m = 1, 9 do
                    local inclue = false
                    for n = 1, 6 do
                        if m == tmpData[n] then
                            inclue = true
                            break
                        end
                    end

                    if not inclue then
                        table.insert(tmpData, m)
                    end
                end

                table.insert(groupData, tmpData)
            end
        end
    end
    return groupData
end

--所有排列
function arithmetic.allPermutation(arr, num)
    local function combination(arr, nCount, resultArr, head)
        head = head or 1
        resultArr = resultArr or {}
        if (#resultArr == nCount) then
            --组合选的结果出来
            --print(table.concat(resultArr,","))
            --组合结果
            arithmetic.fullPermutation(resultArr)
        else
            for i = head, #arr do
                if (#resultArr < nCount  ) then
                    table.insert(resultArr, arr[i])
                    combination(arr, nCount, resultArr, i + 1)
                    --回溯还原
                    table.remove(resultArr)
                end
            end
        end
    end

    retData = {}
    if num then
        combination(arr, num)
    else
        for i = 1, #arr do
            combination(arr, i)
        end
    end
    return retData
end



--
--
----注意排列中的数字不能重复
----测试代码,在luaEditor中测试通过
local Data = { 1,2,3,4,5,6,7,8,9 }
----fullPermutation(Data)
--arithmetic.allPermutation(Data, 9)
local groupData = arithmetic.allCombinationGroup(Data, 3)
print_table(groupData)
--
--local tmp = {}
--for i = 1, #retData do
--    for j = i + 1, #retData do
--        local contain = false
--        for m = 1, 3 do
--            for n = 1, 3 do
--                if retData[i][m] == retData[j][n] then
--                    contain = true
--                    break
--                end
--            end
--            if contain then
--                break
--            end
--        end
--
--        if not contain then
--            local oneLine = {}
--            local tmpTmp = {}
--            for m = 1, 3 do
--                table.insert(tmpTmp, retData[i][m])
--            end
--            --table.insert(oneLine, tmpTmp)
--            --tmpTmp = {}
--            for m = 1, 3 do
--                table.insert(tmpTmp, retData[j][m])
--            end
--
--            --tmpTmp = {}
--            for m = 1, 9 do
--                local inclue = false
--                for n = 1, 6 do
--                    if m == tmpTmp[n] then
--                        inclue = true
--                        break
--                    end
--                end
--
--                if not inclue then
--                    table.insert(tmpTmp, m)
--                end
--            end
--
--            table.insert(tmp, tmpTmp)
--        end
--    end
--end
--
--print_table(retData, #retData)
--print_table(tmp)
--allCombination(Data)
--combination(Data,2)

return arithmetic