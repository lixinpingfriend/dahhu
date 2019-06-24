local ModuleCache = ModuleCache
local LogConfig = {}

local pacageEnableLogConfig = {
	['biji'] = true,
	--['majiang'] = true,
	--['majiang3d'] = true,
}

LogConfig.isEnableLog = function(packageName)
	return true
	--if ModuleCache.GameManager.tester then
	--	return true
	--end
    --
	--if not packageName or packageName == '' then
	--	return false
	--end
	----assert(packageName and packageName ~= '', 'packageName should not be nil or empty')
	--return pacageEnableLogConfig[packageName] or false
end

return LogConfig