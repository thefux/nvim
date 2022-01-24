require"git-worktree".setup{
    update_on_change_command = '%bd! | Startify'
}

require"telescope".load_extension("git_worktree")


local function worktree()
    return vim.fn.input('Worktree: ')
end

vim.cmd( "command! SwitchWorktree " .. ':lua require"git-worktree".switch_worktree(vim.fn.input("Worktree: "))')

-- broken
-- vim.cmd( "command! CreateWorktree " .. ':lua require"git-worktree".create_worktree(vim.fn.input("Worktree: "))')
vim.cmd( "command! DeleteWorktree " .. ':lua require"git-worktree".delete_worktree(vim.fn.input("Worktree: "))')

return
{
    worktree = worktree,
}



