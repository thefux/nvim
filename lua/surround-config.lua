require'surround'.setup{
    load_keymaps = false,
}

local opts = {}
vim.api.nvim_set_keymap('v', 'S', '<ESC>gv<Cmd>lua require"surround".surround_add()<CR>', opts)
vim.api.nvim_set_keymap('n', 'ds', '<ESC>gv<Cmd>lua require"surround".surround_delete()<CR>', opts)
vim.api.nvim_set_keymap('n', 'drs', '<ESC>gv<Cmd>lua require"surround".surround_replace()<CR>', opts)
