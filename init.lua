--- Safely requires a Lua module, showing a notification if the require fails.
--- Returns the module or a dummy table with a no-op setup function.
--- @param modname string The name of the module to import.
--- @return table
Prequire = function(modname)
	local ok, module = pcall(require, modname)

	if not ok then
		vim.notify("failed to require " .. modname, vim.log.levels.ERROR)

		return {
			setup = function(_, _) end,
		}
	end

	return module
end

--- Available config profiles
local configs = {
	ide = "ide",
	nova = "nova",
}

-- Switch configs here
Prequire(configs.nova)
