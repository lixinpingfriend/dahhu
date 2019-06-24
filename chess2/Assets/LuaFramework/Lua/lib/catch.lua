
























local function sandbox_catch(block)

	-- get the catch block function
	return {catch = block[1]}
end

-- return module
return sandbox_catch