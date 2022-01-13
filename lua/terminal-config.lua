if vim.fn.has('win32') then
    vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>terminal<CR> pwsh<CR>', {silent=true})
    vim.api.nvim_set_keymap('n', '<leader>tv', '<C-w>v <Cmd>terminal<CR> pwsh<CR>', {silent=true})
else
    vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>terminal<CR>', {silent=true})
    vim.api.nvim_set_keymap('n', '<leader>tv', '<C-w>v <Cmd>terminal<CR>', {silent=true})
end

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {})


vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-h>', {})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-j>', {})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n>C-k>', {})


local function lazygit_toggle()
    vim.api.nvim_command('LazyGit')
    -- set option for current buffer which is the lazygit terminal view
    vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<Esc>', {noremap = true, silent = true})
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua require'terminal-config'.lazygit_toggle()<CR>", {noremap = true, silent = true})


return
{
    lazygit_toggle = lazygit_toggle
}

