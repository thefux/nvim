local cmp = require'cmp'

cmp.setup({
    -- completion = {
    --     keyword_length = 3
    -- },
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    experimental = {
        ghost_test = true
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})

-- breaks completion
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--     })
-- })

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')["rust-analyzer"].setup {
--   capabilities = capabilities
-- }


-- " Setup Completion
-- " See https://github.com/hrsh7th/nvim-cmp#basic-configuration
-- lua <<EOF
-- local cmp = require'cmp'
-- cmp.setup({
-- -- Enable LSP snippets
-- snippet = {
--     expand = function(args)
--     vim.fn["vsnip#anonymous"](args.body)
-- end,
-- },
--   mapping = {
--       ['<C-p>'] = cmp.mapping.select_prev_item(),
--       ['<C-n>'] = cmp.mapping.select_next_item(),
--       -- Add tab support
--       ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--       ['<Tab>'] = cmp.mapping.select_next_item(),
--       ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.close(),
--       ['<CR>'] = cmp.mapping.confirm({
--       behavior = cmp.ConfirmBehavior.Insert,
--       select = true,
--       })
--   },

--   -- Installed sources
--   sources = {
--       { name = 'nvim_lsp' },
--       { name = 'vsnip' },
--       { name = 'path' },
--       { name = 'buffer' },
--       },
--   })
-- EOF


