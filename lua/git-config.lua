require('gitsigns').setup(
    {
        current_line_blame_opts =
        {
            delay = 500,
        }
    }
)

require('telescope').load_extension('lazygit')
vim.api.nvim_set_keymap('n', '<leader>lg', '<Cmd>lua require("telescope").extensions.lazygit.lazygit()<CR>', {})

