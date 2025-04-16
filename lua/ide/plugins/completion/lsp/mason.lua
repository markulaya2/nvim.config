local servers = {
    "lua_ls",
    "cssls",
    "html",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
    "tsserver",
    "intelephense",
}

local servers2 = {
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

local settings = {
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
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local lspconfig = Prequire("lspconfig")

local opts = {}

for _, server in pairs(servers2) do
    opts = {
        on_attach = require(
            "ide.plugins.completion.lsp.handlers"
        ).on_attach,
        capabilities = require(
            "ide.plugins.completion.lsp.handlers"
        ).capabilities,
    }

    server = vim.split(server, "@")[1]

    local conf_opts = Prequire(
        "ide.plugins.completion.lsp.settings."
            .. server
    )
    opts =
        vim.tbl_deep_extend("force", conf_opts, opts)

    lspconfig[server].setup(opts)
end
