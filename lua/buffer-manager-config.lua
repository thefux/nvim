require'buffer_manager'.setup{}

vim.api.nvim_set_keymap('n', '<leader>m', ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>', {silent=true})
