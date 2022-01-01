local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)

vim.api.nvim_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-P>', '<Cmd>lua vim.lsp.buf.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-p>', '<Cmd>lua vim.lsp.buf.goto_next()<CR>', opts)



