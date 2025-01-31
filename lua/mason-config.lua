require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "pyright", "omnisharp" },
    automatic_installation = true,
})
