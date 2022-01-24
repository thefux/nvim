require'tools'.create_augroup(
    {
        {'BufEnter', '*.md', 'setlocal spell'}
    }, 'Spell'
)


require'tools'.create_augroup(
    {
        {'BufEnter', '*', ':lua vim.cmd("cd " .. vim.fn.getcwd(0))'}
    }, 'Spell'
)

