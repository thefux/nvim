local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        sql = {},
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        -- lua = { "stylua" },
        python = { "isort" }, -- , "black"
        rust = { "rustfmt" },
        cs = { "csharpier" },
    },
    format_on_save = {
        lsp_fallback = false,
        async = true,
        timeout_ms = 1000,
    },
    csharpier = {
        command = "dotnet-csharpier",
        args = { "--write-stdout" },
        stdin = true,
    },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end, { desc = "Format file or range (in visual mode)" })
