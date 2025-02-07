require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", "pyright", "csharp_ls", "htmx", "html" },
    automatic_installation = true,
})
