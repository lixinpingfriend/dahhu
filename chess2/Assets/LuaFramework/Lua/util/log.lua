





local print = print
local tconcat = table.concat
local tinsert = table.insert
local srep = string.rep
local type = type
local pairs = pairs
local tostring = tostring
local next = next
local debug = debug
local string = string
local getmetatable = getmetatable
local GameSDKInterface = LuaBridge.GameSDKInterface.instance
local table = table
local UnityEngine = UnityEngine
local UnityDebug = UnityEngine.Debug

---@class Log
local Log = {}

function Log.stringInsertToTable(table, ...)
	if table then
		for key, value in pairs{...} do
			table[#table + 1] = value
		end
	end
end

function Log.ToStringEx(tableTmp, value, array)
	if type(value)=='table' then
		return Log.TableToStr(tableTmp, value._fields or value, array)
	elseif type(value)=='string' then
		return "\""..value.."\""
	else
		return tostring(value)
	end
end



function Log.TableToStr(tableTmp, t, array)
	if t == nil then return "" end
	local retstr= "{"
	if array then
		retstr = "["
	end
	Log.stringInsertToTable(tableTmp, retstr)

	local i = 1

	for key,value in pairs(t) do
		local signal = ","
		if i==1 then
			signal = ""
		end

		if key == i then
			if type(value) == 'table' then
				Log.stringInsertToTable(tableTmp, signal)
				Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp,value._fields or value))
				--retstr = retstr..signal..ToStringEx(value._fields or value)
			else
				--retstr = retstr..signal..ToStringEx(value)
				Log.stringInsertToTable(tableTmp, signal)
				Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, value))
			end

		else
			local keyType = type(key)
			if keyType =='number' then
				--retstr = retstr..signal..'['..ToStringEx(key).."]="..ToStringEx(value)
				Log.stringInsertToTable(tableTmp, signal, '[')
				Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, key))
				Log.stringInsertToTable(tableTmp, "]=")
				Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, value))
			elseif keyType == 'string' then
				--这个是关键
				if string.sub(key, 1, 1) ~= "_" then
					--retstr = retstr..signal..'['..ToStringEx(key).."]="..ToStringEx(value)
					Log.stringInsertToTable(tableTmp, signal, '[')
					Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, key))
					Log.stringInsertToTable(tableTmp, "]=")
					Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, value))
				end
			else
				if keyType=='userdata' then
					--retstr = retstr..signal.."*s"..TableToStr(getmetatable(key)).."*e".."="..ToStringEx(value)
					Log.stringInsertToTable(tableTmp, signal, "*s")
					Log.stringInsertToTable(tableTmp, signal, "*s", Log.TableToStr(tableTmp, getmetatable(key)))
					Log.stringInsertToTable(tableTmp, "*e=")
					Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, value))
				elseif keyType=='table' then
					--retstr = retstr..signal.."\""..key.name.."\""..":"..Log.ToStringEx(tableTmp, value, true)
					Log.stringInsertToTable(tableTmp, signal, "\"", key.name, "\":")
					Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, value, true))
				else
					--retstr = retstr..signal.."\""..key.."\""..":"..Log.ToStringEx(tableTmp, value)
					Log.stringInsertToTable(tableTmp, signal, "\"", key, "\":")
					Log.stringInsertToTable(tableTmp, Log.ToStringEx(tableTmp, value))
				end
			end
		end

		i = i+1
	end
	if array then
		retstr = "]"
	else
		retstr = "}"
	end

	Log.stringInsertToTable(tableTmp, retstr)
end


function Log.print_pbc_table(root, text, noPrint)
	local cache = {[root] = "."}
	local str = ""
	if text then
		str = "<color=#00ffffff>" .. text .. "</color> \n\n<color=#00ff00>"
	else
		str = "\n<color=#00ff00ff>"
	end
	local info = debug.getinfo(2, "nSl")
	if info then
		str = str .. string.format("[%s : %-4d]", info.source or "", info.currentline) .. "\n"
	end

	local function _dump(t, space, name)
		local temp = {}
		for k, v in pairs(t) do
			local key = tostring(k)
			if type(k) == "table" and k.name then
				key = k.name
			else
				key = tostring(k)
			end
			if type(v) == "table" then
				local new_key = name .. "." .. key
				cache[v] = new_key
				if string.sub(key, 1, 1) == "_" then
					if key == "_fields" then
						tinsert(temp, _dump(v._fields or v, space, new_key))
					end
				else
					tinsert(temp, " * " .. key .. _dump(v, space ..(next(t, k) and " | " or " ") .. srep(" ", #key), new_key))
				end
			else
				if string.sub(key, 1, 1) ~= "_" then
					if cache[v] then
						tinsert(temp, " + " .. key .. " {" .. cache[v] .. "}")
					elseif type(v) == "string" then
						tinsert(temp, " + " .. key .. " = \"" .. v .. "\"")
					else
						tinsert(temp, " + " .. key .. " = " .. tostring(v))
					end
				end
			end
		end
		return tconcat(temp, "\n" .. space)
	end

	local tmpString = str .. _dump(root._fields, "", "") .. "</color>"
	if(noPrint == true)then
		return tmpString
	end
	print(tmpString)
	return tmpString
end

function Log.format_pbc_table_tojson(root, text)
	local tableTmp = {}
	Log.stringInsertToTable(tableTmp, text, " ")
	Log.TableToStr(tableTmp, root)
	return table.concat(tableTmp)
end



function Log.format_pbc_table(root, text)
	if not root then
		return
	end

	local cache = {[root] = "."}
	local str = ""
	if text then
		str = "" .. text .. "\n"
	else
		str = "\n"
	end

	local function _dump(t, space, name)
		local temp = {}
		for k, v in pairs(t) do
			local key = tostring(k)
			if type(k) == "table" and k.name then
				key = k.name
			else
				key = tostring(k)
			end
			if type(v) == "table" then
				local new_key = name .. "." .. key
				cache[v] = new_key
				if string.sub(key, 1, 1) == "_" then
					if key == "_fields" then
						tinsert(temp, _dump(v._fields or v, space, new_key))
					end
				else
					tinsert(temp, "*" .. key .. _dump(v, space ..(next(t, k) and "|" or "") .. srep("", #key), new_key))
				end
			else
				if string.sub(key, 1, 1) ~= "_" then
					if cache[v] then
						tinsert(temp, "+" .. key .. "{" .. cache[v] .. "}")
					elseif type(v) == "string" then
						tinsert(temp, "+" .. key .. "=\"" .. v .. "\"")
					else
						tinsert(temp, "+" .. key .. "=" .. tostring(v))
					end
				end
			end
		end
		return tconcat(temp, "\n" .. space)
	end

	local tmpString = str .. _dump(root._fields or root, "", "") .. "</color>"
	return tmpString
end

function Log.print_table(root, text, noPrint)
	if not root then
		return
	end
	local cache = {[root] = "."}
	local str
	if text then
		str = "<color=#00ffff>" .. text .. "</color> \n\n<color=#00ff00>\n"
	else
		str = "<color=#00ff00> \n\n"
	end

	local info = nil
	for level = 10, 2, -1 do
		-- 打印堆栈每一层
		info = debug.getinfo(level, "nSl")
		if info then
			str = str .. string.format("[%s : %-4d]", info.source or "", info.currentline) .. "\n"
		end
	end

	local function _dump(t, space, name)
		local temp = {}
		local kType, vType
		for k, v in pairs(t) do
			if v then
				local key = tostring(k)
				kType = type(k)
				vType = type(v)
				if kType == "table" and k.name then
					key = k.name
				elseif kType == "string" then
					key = "\"" .. k .. "\""
				else
					key = tostring(k)
				end
				if cache[v] then
					tinsert(temp, " + " .. (key or "") .. " {" .. cache[v] .. "}")
				elseif vType == "table" then
					local new_key = name .. "." .. (key or "")
					cache[v] = new_key
					tinsert(temp, " * " .. (key or "") .. _dump(v, space ..(next(t, k) and " | " or " ") .. srep(" ", # key), new_key))
				elseif vType == "string" then
					--tinsert(temp, " + " .. (key or "") .. " = \"" .. v .. "\"")
					tinsert(temp, string.format(" + %s = \"%s\"", key, v))
				else
					tinsert(temp, string.format(" + %s = %s", key, tostring(v)))
				end
			end
		end
		return tconcat(temp, "\n" .. space)
	end
	local tmpString = str .. _dump(root, "", "") .. "</color>"
	if(noPrint == true)then
		return tmpString
	end
	print(tmpString)
	return tmpString
end

function Log.print_traceback(text)
	local startLevel = 2 --0表示getinfo本身,1表示调用getinfo的函数(printCallStack),2表示调用printCallStack的函数,可以想象一个getinfo(0级)在顶的栈.
	local maxLevel = 8 --最大递归10层
	local str = text or "" .. "\r\n"
	for level = startLevel, maxLevel do
		-- 打印堆栈每一层
		local info = debug.getinfo(level, "nSl")
		if info == nil then break end
		str = str .. string.format("[%s :: line : %-4d]  %-20s ", info.source or "", info.currentline, info.name or "") .. "\r\n"
	end
	print(str)
	return str
end

function Log.print_debug(text)
	local startLevel = 2 --0表示getinfo本身,1表示调用getinfo的函数(printCallStack),2表示调用printCallStack的函数,可以想象一个getinfo(0级)在顶的栈.
	local maxLevel = 8 --最大递归10层
	local str = text or "" .. "\r\n"
	for level = startLevel, maxLevel do
		-- 打印堆栈每一层
		local info = debug.getinfo(level, "nSl")
		if info == nil then break end
		str = str .. string.format("[%s :: line : %-4d]  %-20s ", info.source or "", info.currentline, info.name or "") .. "\r\n"
	end
	print(str)
	return str
end

function Log.report_exception(name, message, stackTrace)
	stackTrace = stackTrace or ''
	message = message or ""
	if ModuleCache.GameManager.isEditor then
		print(name .. message .. stackTrace)
	else
		GameSDKInterface:ReportException(name, message, stackTrace)
	end
end

function Log.begin_id_counting(id)
	if not Log.socket then
		Log.socket = require "socket"
		Log.timeID = {}
	end
	Log.timeID.id = Log.socket.gettime()
end

function Log.cur_time(id)
	if not Log.socket then
		Log.socket = require "socket"
	end
	return Log.socket.gettime() * 1000
end

function Log.end_id_counting(id, text)
	Log.print_red((text or "") .. " id time(ms)：" .. (Log.socket.gettime()- Log.timeID.id) * 1000)
end

function Log.begin_counting(step)
	Log.socket = Log.socket or require "socket"
	Log._statTime = Log.socket.gettime()
end

function Log.end_counting(...)
	Log.print_red((... or "") .. " total elapsed time(ms)：" .. (Log.socket.gettime() - Log._statTime) * 1000)
end

function Log.print_red(str)
	print("<color=red>" .. str .." </color>")
end

function Log.print_red(str)
	print("<color=red>" .. str .." </color>")
end

function Log.print_blue(str)
	print("<color=#00D5FFFF>" .. str .." </color>")
end

function Log.print_yellow(str)
	print("<color=#F9DE00FF>" .. str .." </color>")
end

--------------------Unity接口打印日志----------------------
--[[
    @desc: 此处所有日志皆使用Unity的Debug接口 使用需要Wrap Unity的Debug类.  我不会上传C#文件,需要使用自己Wrap Debug类
    author:{荆竹}}
    time:2018-08-22 11:17:55
    --@str: 
    @return:
]]


--打印错误日志
function Log.UnityLogError(str)
	print("<color=red>" .. str .." </color>")
end

--打印Unity日志
function Log.UnityLog(str)
	print(str)
end

--打印蓝色日志
function Log.UnityLogBlue(str)
	print("<color=#00D5FFFF>" .. str .." </color>")
end

--打印黄色日志
function Log.UnityLogYellow(str)
	print("<color=#F9DE00FF>" .. str .." </color>")
end

function UnityLogError(str)
	if UnityDebug then
		local traceStr = Log.print_debug()
		UnityEngine.Debug.LogError(str .. "\n" .. traceStr)
	end
end

function UnityLog(str)
	if UnityDebug then
		local traceStr = Log.print_debug()
		print("<color=#909090FF>" .. str .." </color>\n" .. traceStr .. "\r\n")
	end
end

function UnityLogBlue(str)
	if UnityDebug then
		local traceStr = Log.print_debug()
		print("<color=#00D5FFFF>" .. str .." </color>\n" .. traceStr .. "\r\n")
	end
end

function UnityLogYellow(str)
	if UnityDebug then
		local traceStr = Log.print_debug()
		print("<color=#F9DE00FF>" .. str .." </color>\n" .. traceStr .. "\r\n")
	end
end

--------------------Unity接口打印日志----------------------

Log.print = print
print_table = Log.print_table
print_pbc_table = Log.print_pbc_table
print_traceback = Log.print_traceback
print_debug = Log.print_debug

log_print = print
log_table = print_table
log_debug = print_debug
log_traceback = print_traceback
log_pbc_table = print_pbc_table



return Log

