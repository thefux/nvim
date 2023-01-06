require'lsp_signature'.setup{
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
}


vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    bufmap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    bufmap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    bufmap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>')
    bufmap('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
    bufmap('n', 'rn', 'nCmd>lua vim.lsp.buf.rename()<CR>')
    bufmap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    bufmap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>')
    bufmap('n', 'L', '<Cmd>lua vim.diagnostic.open_float()<CR>')
    bufmap('n', '<C-P>', '<Cmd>lua vim.lsp.buf.goto_prev()<CR>')
    bufmap('n', '<C-c>', '<Cmd>lua vim.lsp.buf.goto_next()<CR>')
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

  end
})


---
-- Diagnostics
---

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
  virtual_text = true,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  {border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  {border = 'rounded'}
)

---
-- LSP config
---

-- require('mason').setup({})
-- require('mason-lspconfig').setup({})

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').default_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)


---
-- LSP servers
---

lspconfig.tsserver.setup({})
lspconfig.sumneko_lua.setup({})
lspconfig.rust_analyzer.setup{}
lspconfig.pyright.setup({})
local function cmd()
    -- or make sure OmniSharp is installed and put in global path
    if vim.fn.has('win32') then
        return{'C:/tools/omnisharp-win-x64-net6.0/OmniSharp.exe', '--languageserver'}
    else
        return{'OmniSharp', '--languageserver'}
    end
end

lspconfig.omnisharp.setup({
    on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    end,
    cmd = cmd(),
})


---
-- Autocomplete
---

-- require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}
local compare = require'cmp.config.compare'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'crates'},
    -- {name = 'cmp_tabnine'},
    {name = 'buffer', keyword_length = 2},
    {name = 'luasnip', keyword_length = 2},
  },
  sorting = {
      prioriry_weight = 2,
      comparators = {
          -- require'cmp_tabnine.compare',
          compare.offset,
          compare.exact,
          compare.score,
          compare.recently_used,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
      },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})

