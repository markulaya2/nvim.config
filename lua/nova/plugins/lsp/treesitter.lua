return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		dependencies = {
			"HiPhish/rainbow-delimiters.nvim",
		},

		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"php",
					"java",
					"javascript",
					"typescript",
					"nix",
					"go",
					"python",
					"html",
					"css",
					"scss",
					"json",
					"yaml",
				},
				auto_install = true,
				sync_install = false,
				ignore_install = {},
				highlight = {
					-- enable/disable the whole extension
					enable = true,
					-- languages that will be disabled
					disable = { "" },
					additional_vim_regex_highlighting = true,
				},
				indent = {
					enable = true,
					disable = {},
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
				autopairs = {
					enable = true,
				},
				context_commentstring = {
					enable = true,
					enable_autocmd = true,
				},
			})
		end,
	},
}
