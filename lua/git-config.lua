require('gitsigns').setup()

require('telescope').load_extension('lazygit')
vim.api.nvim_set_keymap('n', '<leader>lg', '<Cmd>lua require("telescope").extensions.lazygit.lazygit()<CR>', {})

