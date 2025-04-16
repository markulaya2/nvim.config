return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.add({
				{
					"<leader>e",
					"<cmd>NvimTreeFocus<cr>",
					desc = "Explorer",
				},
				{ "<leader>d", "<cmd>Alpha<cr>", desc = "Dashboard" },
				{ "<leader>a", group = "avante" },

				---- BUFFERS ----
				{ "<leader>b", group = "avante" },
				{ "<leader>bc", "<cmd>bdelete<CR>", desc = "Close Buffer" },
				{
					"<leader>bs",
					function()
						require("telescope.builtin").buffers(
							require("telescope.themes").get_dropdown({ previewer = false })
						)
					end,
					desc = "buffers: search",
				},

				{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
				{
					"<leader>P",
					function()
						require("telescope").extensions.projects.projects()
					end,
					desc = "Projects",
				},

				-- Plugin group
				{ "<leader>p", group = "plugins" },
				{ "<leader>ph", "<cmd>Lazy home<cr>", desc = "Home" },
				{ "<leader>pi", "<cmd>Lazy install<cr>", desc = "Install" },
				{ "<leader>pu", "<cmd>Lazy update<cr>", desc = "Update" },
				{ "<leader>ps", "<cmd>Lazy sync<cr>", desc = "Sync" },
				{ "<leader>pc", "<cmd>Lazy clean<cr>", desc = "Clean" },
				{ "<leader>pC", "<cmd>Lazy check<cr>", desc = "Check" },
				{ "<leader>pl", "<cmd>Lazy log<cr>", desc = "Log" },
				{ "<leader>pr", "<cmd>Lazy restore<cr>", desc = "Restore" },
				{ "<leader>pp", "<cmd>Lazy profile<cr>", desc = "Profile" },
				{ "<leader>pd", "<cmd>Lazy debug<cr>", desc = "Debug" },
				{ "<leader>p?", "<cmd>Lazy help<cr>", desc = "Help" },

				-- Git group
				{ "<leader>g", group = "git" },
				{
					"<leader>gg",
					function()
						_LAZYGIT_TOGGLE()
					end,
					desc = "Git: Lazygit",
				},
				{
					"<leader>gj",
					function()
						require("gitsigns").next_hunk()
					end,
					desc = "Git: Next Hunk",
				},
				{
					"<leader>gk",
					function()
						require("gitsigns").prev_hunk()
					end,
					desc = "Git: Prev Hunk",
				},
				{
					"<leader>gl",
					function()
						require("gitsigns").blame_line()
					end,
					desc = "Git: Blame",
				},
				{
					"<leader>gp",
					function()
						require("gitsigns").preview_hunk()
					end,
					desc = "Git: Preview Hunk",
				},
				{
					"<leader>gr",
					function()
						require("gitsigns").reset_hunk()
					end,
					desc = "Git: Reset Hunk",
				},
				{
					"<leader>gR",
					function()
						require("gitsigns").reset_buffer()
					end,
					desc = "Git: Reset Buffer",
				},
				{
					"<leader>gs",
					function()
						require("gitsigns").stage_hunk()
					end,
					desc = "Git: Stage Hunk",
				},
				{
					"<leader>gu",
					function()
						require("gitsigns").undo_stage_hunk()
					end,
					desc = "Git: Undo Stage Hunk",
				},
				{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Git: Changed Files" },
				{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Git: Branches" },
				{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git: Commits" },
				{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git: Diff" },

				-- LSP group
				{ "<leader>l", group = "lsp" },
				{ "<leader>lf", "<cmd>Format<cr>", desc = "lsp: format" },
				{
					"<leader>la",
					function()
						vim.lsp.buf.code_action()
					end,
					desc = "lsp: code action",
				},
				{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "lsp: document diagnostics" },
				{ "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "lsp: workspace diagnostics" },
				{ "<leader>li", "<cmd>LspInfo<cr>", desc = "lsp: info" },
				{ "<leader>lI", "<cmd>LspInstallInfo<cr>", desc = "lsp: installer info" },
				{
					"<leader>lj",
					function()
						vim.diagnostic.goto_next()
					end,
					desc = "lsp: next diagnostic",
				},
				{
					"<leader>lk",
					function()
						vim.diagnostic.goto_prev()
					end,
					desc = "lsp: prev diagnostic",
				},
				{
					"<leader>ll",
					function()
						vim.lsp.codelens.run()
					end,
					desc = "lsp: codeLens action",
				},
				{
					"<leader>lr",
					function()
						vim.lsp.buf.rename()
					end,
					desc = "lsp: rename",
				},
				{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "lsp: document symbols" },
				{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "lsp: workspace symbols" },
				{ "<leader>lt", "<cmd>Trouble<cr>", desc = "lsp: trouble" },
				{ "<leader>lT", "<cmd>TodoTrouble<cr>", desc = "lsp: todotrouble" },

				-- Search group
				{ "<leader>s", group = "search" },
				{ "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
				{ "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
				{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
				{ "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
				{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
				{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
				{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
				{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
				{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
				{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Files" },
				{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
				{ "<leader>se", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
				{ "<leader>si", "<cmd>Telescope media_files<cr>", desc = "Media" },
				{
					"<leader>sm",
					function()
						local pattern = vim.fn.input("Search Pattern: ")
						vim.api.nvim_command("vimgrep " .. pattern .. " **/*")
					end,
					desc = "Multiple",
				},
				{ "<leader>sn", "<cmd>cnext<cr>", desc = "Next Quickfix" },
				{ "<leader>sp", "<cmd>cprevious<cr>", desc = "Prev Quickfix" },

				-- Terminal group
				{ "<leader>t", group = "terminal" },
				{
					"<leader>tn",
					function()
						_NODE_TOGGLE()
					end,
					desc = "Terminal: Node",
				},
				{
					"<leader>tu",
					function()
						_NCDU_TOGGLE()
					end,
					desc = "Terminal: NCDU",
				},
				{
					"<leader>tb",
					function()
						_BTM_TOGGLE()
					end,
					desc = "Terminal: Bottom",
				},
				{
					"<leader>tp",
					function()
						_PYTHON_TOGGLE()
					end,
					desc = "Terminal: Python",
				},
				{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal: Float" },
				{ "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Terminal: Horizontal" },
				{ "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Terminal: Vertical" },
			})
		end,
	},
}
