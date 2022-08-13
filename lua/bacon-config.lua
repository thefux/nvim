vim.api.nvim_set_keymap('n', 'b!', ':BaconLoad<CR>:w<CR>:BaconNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'b,', ':BaconList<CR>', {noremap = true, silent = true})
