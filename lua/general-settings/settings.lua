local group = vim.api.nvim_create_augroup('Spell', {clear = true})
vim.api.nvim_create_autocmd(
    'BufEnter',
    {
        pattern = '*.md',
        command = ':setlocal spell',
        group = group,
    }
)

vim.api.nvim_create_autocmd(
    'VimEnter',
    {
        group = group,
        callback = function()
            vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<c-m>', ':MaximizerToggle<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<c-->', ':ZoomIn<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<c-+>', ':ZoomOut<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<F4>', ':UndotreeToogle<cr>', {noremap = true, silent = true})
            vim.g.tmux_navigator_save_on_switch = 2
        end,
    }
)

vim.api.nvim_create_autocmd(
    'BufEnter',
    {
        group = group,
        callback = function()
            vim.api.nvim_command(":lua require('lazygit.utils').project_root_dir()")
        end
        }
)


vim.api.nvim_create_autocmd(
    'TermOpen',
    {
        group = group,
        callback = function()
            vim.api.nvim_command("setlocal nospell nonumber norelativenumber")
        end
        }
)

