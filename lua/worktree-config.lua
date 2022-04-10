local worktree = require'git-worktree'

worktree.setup{
    update_on_change_command = '%bd! | Startify'
}

require"telescope".load_extension("git_worktree")


local function switch_worktree(callback)
    local input = vim.fn.input('Worktree: ')
    if input == '' then
        return
    end

    callback(input)
end

local group = vim.api.nvim_create_augroup('git-worktree', {clear = true})

vim.api.nvim_create_autocmd(
    'BufEnter',
    {
        group = group,
        callback = function ()
            vim.api.nvim_add_user_command("SwitchWorktree",
                function ()
                    switch_worktree(worktree.switch_worktree)
                end,
                {nargs = 0}
            )

            vim.api.nvim_add_user_command("DeleteWorktree",
                function ()
                    switch_worktree(worktree.delete_worktree)
                end,
                {nargs = 0}
            )

            -- broken
            -- vim.cmd( "command! CreateWorktree " .. ':lua require"git-worktree".create_worktree(vim.fn.input("Worktree: "))')
        end
    }
)


return
{
    switch_worktree = switch_worktree,
}

