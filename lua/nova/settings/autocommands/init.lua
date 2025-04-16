-- Define auto commands here
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- GENERAL SETTINGS
local __general_settings__ = augroup("__general_settings__", { clear = true })

-- highlight on yank
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
	    vim.highlight.on_yank({
			higroup = "Search",
			timeout = 200,
		})
	end,
	group = __general_settings__,
})

-- format on save
autocmd("BufWritePost", {
	command = ":FormatWrite",
	group = __general_settings__,
})

---[[ make statusline global
autocmd("BufEnter", {
	command = ":set laststatus=3",
	group = __general_settings__,
})

autocmd("WinEnter", {
	command = ":set laststatus=3",
	group = __general_settings__,
})

autocmd("TabEnter", {
	command = ":set laststatus=3",
	group = __general_settings__,
})
--]]

---[[ make statusline global
autocmd("BufEnter", {
	command = ":set showtabline=0",
	group = __general_settings__,
})

autocmd("WinEnter", {
	command = ":set showtabline=0",
	group = __general_settings__,
})

autocmd("TabEnter", {
	command = ":set showtabline=0",
	group = __general_settings__,
})
--]]
