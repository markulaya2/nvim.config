return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"jay-babu/mason-nvim-dap.nvim",
		},

		config = function()
			local servers = {
				"lua_ls",
				"cssls",
				"html",
				"pyright",
				"bashls",
				"jsonls",
				"yamlls",
				"ts_ls",
				"intelephense",
			}

			require("mason").setup({
				ui = {
					border = "none",
					icons = {
						package_installed = "◍",
						package_pending = "◍",
						package_uninstalled = "◍",
					},
				},
				log_level = vim.log.levels.INFO,
				max_concurrent_installers = 4,
			})

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			require("mason-nvim-dap").setup({
				ensure_installed = { "php" },
				automatic_installation = true,

				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
					php = function(config)
						config.configurations = {
							{
								type = "php",
								request = "launch",
								name = "Listen for XDebug",
								port = 9003,
								log = true,
								pathMappings = {
									["/var/www/html/"] = vim.fn.getcwd() .. "/",
								},
								hostname = "0.0.0.0",
							},
						}

						-- don't forget this!
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})

			for _, server in pairs(servers) do
				local M = {}

				local cmp_nvim_lsp = require("cmp_nvim_lsp")

				M.capabilities = vim.lsp.protocol.make_client_capabilities()
				M.capabilities.textDocument.completion.completionItem.snippetSupport = true
				M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

				M.setup = function()
					local signs = {

						{ name = "DiagnosticSignError", text = "" },
						{ name = "DiagnosticSignWarn", text = "" },
						{ name = "DiagnosticSignHint", text = "" },
						{ name = "DiagnosticSignInfo", text = "" },
					}

					for _, sign in ipairs(signs) do
						vim.fn.sign_define(sign.name, {
							texthl = sign.name,
							text = sign.text,
							numhl = "",
						})
					end

					local config = {
						virtual_text = false, -- disable virtual text
						signs = {
							active = signs, -- show signs
						},
						update_in_insert = true,
						underline = true,
						severity_sort = true,
						float = {
							focusable = true,
							style = "minimal",
							border = "rounded",
							source = "always",
							header = "",
							prefix = "",
						},
					}

					vim.diagnostic.config(config)

					vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
						border = "rounded",
					})

					vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
						border = "rounded",
					})
				end

				local function lsp_keymaps(bufnr)
					local opts = { noremap = true, silent = true }
					local keymap = vim.api.nvim_buf_set_keymap
					keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
					keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
					keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
					keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
					keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
					keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
					keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
					keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
					keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
					keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
					keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
					keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
					keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
					keymap(bufnr, "n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
					keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
				end

				M.on_attach = function(client, bufnr)
					if client.name == "tsserver" then
						client.server_capabilities.documentFormattingProvider = false
					end

					if client.name == "lua_ls" then
						client.server_capabilities.documentFormattingProvider = false
					end

					lsp_keymaps(bufnr)
				end

				opts = {
					on_attach = M.on_attach,
					capabilities = M.capabilities,
				}

				server = vim.split(server, "@")[1]

				local conf_opts = require("nova.plugins.lsp.settings." .. server)

				opts = vim.tbl_deep_extend("force", conf_opts, opts)

				require("lspconfig")[server].setup(opts)
			end
		end,
	},
}
