vim.g.ale_cpp_ccls_init_options = {
    cache = {
        directory= 'C:/Users/abdou.AWINIA/AppData/Local/Temp'
    }
}

vim.g.ale_completion_enabled = 1

local ale = vim.api.nvim_create_augroup('ALE')
vim.api.nvim_create_autocmd(
    'FileType',
    {
    pattern = '*.cpp',
    callback = function()
        vim.api.nvim_set_keymap('n', 'dg', ':ALEGoToDefinition<cr>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', 'dr', ':ALEFindReference<cr>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', 'dD', ':ALESymbolSearch<cr>', {noremap = true, silent = true})
        vim.api.nvim_set_keymap('n', 'K', ':ALEHover<cr>', {noremap = true, silent = true})
    end,
    group = ale,
})


