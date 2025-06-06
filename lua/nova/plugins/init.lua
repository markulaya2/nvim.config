---- BOOTSTRAP lazy.nvim ----

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})

		vim.fn.getchar()

		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)

-- Setup `mapleader` and `maplocalleader` so mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

---- SETUP lazy.nvim ----

-- See the documentation at https://lazy.folke.io/ for more details.
require("lazy").setup({
	spec = {
		{ import = "nova.plugins.ui" },
		{ import = "nova.plugins.lsp" },
		{ import = "nova.plugins.tools" },
	},

	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },

	-- automatically check for plugin updates
	checker = { enabled = true },

	git = {
		timeout = 300,
	},
})
