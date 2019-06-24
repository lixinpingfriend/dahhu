
























local function sandbox_finally(block)

	-- get the finally block function
	return {finally = block[1]}
end

-- return module
return sandbox_finally