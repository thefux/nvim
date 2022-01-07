-- TODO:
--  * Add support for different options for search and replace
--      * open in a fwindow or swindow
--      * filter by file type

local function find_word(opts)
    -- TODO: this dependency is not ideal ??
    local root_dir = vim.api.nvim_eval('FindRootDirectory()')

    opts = {
        word = opts['word'] or vim.fn.expand('<cword>') or vim.fn.input('Enter word: ')
    }

    -- TODO: opts can contain some search options
    vim.opt.grepprg = 'rg -n'
    vim.fn.execute('grep ' .. opts.word .. ' ' .. root_dir)

    if #vim.fn.getqflist() == 0 then
        print('No word was found')
        return
    end

    vim.fn.execute('copen')
    -- TODO: use a fwindow or a swindow to show the results
    -- for _, filename in ipairs(buffer_numbers) do
    --     print(filename)
    -- end
end


-- replace will only work after searching one time
local function replace_word(opts)
    opts = {
        word = opts['word'] and opts['word'] or vim.fn.input('Replace word: '),
        replacement = vim.fn.input('Replacement: '),
    }

    if opts.word == '' or opts.replacement == '' then
        return
    end

    vim.fn.execute('cdo %s/' .. opts['word'] .. '/' .. opts['replacement'] .. '/ge | update')
    vim.g['undo_replace_command'] = 'cdo ' .. '%s/' .. opts['replacement'] .. '/' .. opts['word'] .. '/ge | update'
end


local function reverse_replace_action()
    if vim.g.undo_replace_command then
        vim.api.nvim_command(vim.g.undo_replace_command)
        vim.g.undo_replace_command = nil
    end
end


local function remove_quickfix_element()
    local qf_list = vim.fn.getqflist()
    if #qf_list == 0 then
        return
    end

    local line = vim.fn.line('.')
    vim.fn.remove(qf_list, line)
    vim.fn.setqflist(qf_list)
end


-- TODO: refine to support options
vim.api.nvim_set_keymap('n', '<leader>H', '<Cmd>lua require"my-plugin/search-and-replace".replace_word({})<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>F', '<Cmd>lua require"my-plugin/search-and-replace".find_word({})<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>U', '<Cmd>lua require"my-plugin/search-and-replace".reverse_replace_action()<CR>', {})


require'tools'.create_augroup(
    {
        { 'FileType', 'quickfix', 'map <buffer> dd', ':lua require("my-plugin/search-and-replace").remove_quickfix_element()<CR>' },
    }, 'QuickFix'
)


return
{
    find_word = find_word,
    replace_word  = replace_word,
    reverse_replace_action  = reverse_replace_action,
    remove_quickfix_element  = remove_quickfix_element,
}

