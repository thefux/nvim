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
            vim.api.nvim_set_keymap('n', '<cr>', ':MaximizerToggle<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<F4>', ':UndotreeToogle<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>gs', ':G<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>gr', ':diffget //3<cr>', {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<leader>gl', ':diffget //2<cr>', {noremap = true, silent = true})

            vim.api.nvim_command("set wildignore+=*\\tmp\\*,*.swp,*.zip")
            vim.g.tmux_navigator_save_on_switch = 2
            vim.g.ctrlp_custom_ignore = {
                file = "\\v\\.(exe|d|pdb)$",
            }
            vim.g.ctrlp_working_path_mode = 'rs'
        end,
    }
)


vim.api.nvim_create_autocmd(
    'BufEnter',
    {
        group = group,
        callback = function()
            vim.api.nvim_command(":lua require('lazygit.utils').project_root_dir()")
            -- TODO: this applies for all project, better to specify the query for project with
            --       different languages
            vim.api.nvim_command("setlocal wildignore+=*.dll,*.rlib,*.rmeta,*.lib,*.exp,*.timestamp,*.bin,target\\*")
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


-- to heavy
-- vim.api.nvim_create_autocmd(
--     'CursorMoved',
--     {
--         group = group,
--         callback = function()
--             vim.rpcnotify(0, 'all', {'test'})
--         end
--     }
-- )
