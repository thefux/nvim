local cspell = require('cspell')

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        -- cspell.diagnostics,
        cspell.code_actions,
        -- null_ls.builtins.completion.spell,
    },
})
