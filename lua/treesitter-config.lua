local configs = require('nvim-treesitter.configs')
configs.setup{
    ensure_installed = { "cpp", "lua", "rust", "python" },
    highlight = {
        enable = true,
        -- disable = {'rust', 'vim'},
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "gnr",
            scope_incremental = "gnc",
            node_decremental = "gnm",
        },
    },
    indent = {
        enable = false,
    },
}

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

