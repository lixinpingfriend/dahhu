


























local sandbox_try = {}

-- join all objects and tables
local function join(...)

	local result = {}
	for _, t in ipairs({...}) do
		if type(t) == "table" then
			for k, v in pairs(t) do
				if type(k) == "number" then table.insert(result, v)
				else result[k] = v end
			end
		else
			table.insert(result, t)
		end
	end
	return result
end

-- join all objects and tables to self
local function join2(self, ...)

	for _, t in ipairs({...}) do
		if type(t) == "table" then
			for k, v in pairs(t) do
				if type(k) == "number" then table.insert(self, v)
				else self[k] = v end
			end
		else
			table.insert(self, t)
		end
	end
	return self
end


local function _traceback(...)
	local startLevel = 2 --0表示getinfo本身,1表示调用getinfo的函数(printCallStack),2表示调用printCallStack的函数,可以想象一个getinfo(0级)在顶的栈.
	local maxLevel = 20 --最大递归10层
	local str = "<color=#00ffff>      "
	str = str .. ...
	str = str .. "</color>\r\n"
	-- print(str)
	str = "<color=#00ff00>  " .. str
	for level = startLevel, maxLevel do
		-- 打印堆栈每一层
		local info = debug.getinfo(level, "nSl")
		if info == nil then break end
		str = str .. string.format("[%s :: line : %-4d]  %-20s ", info.source or "", info.currentline, info.name or "") .. "\r\n"

		-- 打印该层的参数与局部变量
		local index = 1 --1表示第一个参数或局部变量, 依次类推
		while true do
			local name, value = debug.getlocal(level, index)
			if name == nil then break end

			local valueType = type(value)
			local valueStr
			if valueType == 'string' then
				valueStr = value
			elseif valueType == "number" then
				valueStr = string.format("%.2f", value)
			elseif valueType == "function" then
				valueStr = value
			end
			if valueStr ~= nil then
				str = str .. string.format("\t%s = %s\n", name, value)
			end
			index = index + 1
		end
	end
	str = str .. "</color>"
	return str
end


-- try
function sandbox_try.try(block)

	-- get the try function
	local try = block[1]
	assert(try)

	-- get catch and finally functions
	local funcs = join(block[2] or {}, block[3] or {})

	-- try to call it
	local ok, errors = xpcall(try, debug.traceback)
	if not ok then

		-- run the catch function
		if funcs and funcs.catch then
			funcs.catch(errors)
		end
	end

	-- run the finally function
	if funcs and funcs.finally then
		funcs.finally(ok, errors)
	end

	-- ok?
	if(ok)then
		return errors
	else
		return nil
	end
end

-- return module
return sandbox_try.try