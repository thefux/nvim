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
    'BufEnter',
    {
        group = group,
        callback = function()
            vim.api.nvim_command('"cd " .. vim.fn.getcwd()')
            vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', {noremap = true, silent = true})
        end,
    }
)

