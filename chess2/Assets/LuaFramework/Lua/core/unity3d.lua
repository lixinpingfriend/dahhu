






if unpack == nil then unpack = table.unpack end
local json = require "cjson"
local type = type
local tostring = tostring

function math.randomseed1(i)
    math.randomseed(tostring(os.time() + tonumber(i)):reverse():sub(1, 6))
end

function table.get_elem_size(tab)
    if not tab then return 0 end
    local i = 0
    for k, v in pairs(tab) do
        i = i + 1
    end
    return i
end

function lua_gc()
    collectgarbage("collect")
    local c = collectgarbage("count")
--    print(" gc end =" .. tostring(c) .. " ")
end



function send_message(obj, method, ...)
    local fn = obj[method]
    if type(fn) == "function" then fn(obj, ...) end
end


-- 如果obj为空或者null值默认都会返回""
function string.tostring(obj, returnDefaultNil)
    local retDefault = ""
    if returnDefaultNil then
        retDefault = nil
    end
    if obj then
        if type(obj) == 'string' then
            return obj
        elseif obj == json.null then
            return retDefault
        else
            return tostring(obj)
        end
    end
    return retDefault
end