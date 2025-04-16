-- Define highlights here
local colors = require("nova.settings.highlights.colors")

vim.api.nvim_set_hl(0, "Normal", { fg = colors.white, bg = colors.black })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = colors.white, bg = colors.black })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.grey2, bg = colors.black })
vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = colors.green_light })
vim.api.nvim_set_hl(0, "TelescopeNormal", {
	fg = colors.green_light,
})
vim.api.nvim_set_hl(0, "TelescopeBorder", {
	fg = colors.grey2,
})
vim.api.nvim_set_hl(0, "WhichKeyBorder", {
	fg = colors.grey2,
})
vim.api.nvim_set_hl(0, "WhichKeyFloat", {
	fg = "#ff0000",
	bg = colors.black,
})
vim.api.nvim_set_hl(0, "Pmenu", {
	fg = colors.white,
	bg = colors.black,
})
vim.api.nvim_set_hl(0, "PmenuSel", {
	fg = colors.green_light,
	bg = colors.grey0,
})
vim.api.nvim_set_hl(0, "Tabline", {
	fg = colors.white,
	bg = colors.black,
})

---[[ Treesitter
vim.api.nvim_set_hl(0, "TreesitterContext", {
	bg = colors.grey0,
	fg = "#c0caf5",
})
vim.api.nvim_set_hl(0, "TreesitterContextLineNumber", {
	bg = colors.grey0,
	fg = "#5c6370",
})
vim.api.nvim_set_hl(0, "TreesitterContextSeparator", {
	bg = colors.blue,
	fg = "#3b3f51",
})
--]]

---[[ Folds
vim.api.nvim_set_hl(0, "Folded", {
	bg = colors.grey0,
})
--]]
