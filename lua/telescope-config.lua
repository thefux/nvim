local get_root = require'utils.utils'.get_root


vim.api.nvim_set_keymap('n', '<leader>ff', '',
{
    callback = function ()
        local cmd = string.format(':lua require("telescope.builtin").find_files({ cwd = "%s" })', get_root())
        vim.api.nvim_command(cmd)
    end,
    noremap = true, silent = true
})


vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', {noremap = true, silent = true})
