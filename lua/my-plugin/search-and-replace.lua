local get_root = require'utils.utils'.get_root

-- TODO:
--  * Add support for different options for search and replace
--      * open in a fwindow or swindow
--      * filter by file type

vim.g.search_options = {
    grepprg = 'rg -n',
    excludes = {'.git', 'node_modules', 'site_packages', 'tags', 'tags~', 'tagz~'},
}


local function find_word(opts)
    -- TODO: opts can contain some search options
    local grepprg = vim.g.search_options.grepprg or 'rg -n'
    vim.opt.grepprg = grepprg

    local options = ''

    if vim.g.search_options.excludes then
        local all = table.concat(vim.g.search_options.excludes, ',')
        options = options .. '-g!{' .. all .. '}'
    end

    local command = 'grep! ' .. opts.word .. ' ' .. options .. ' ' .. get_root()
    vim.fn.execute(command)

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
        word = opts.word,
        replacement = vim.fn.input('Replacement: '),
    }

    if opts.word == '' or opts.replacement == '' then
        return
    end

    find_word(opts)

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
vim.api.nvim_set_keymap('n', '<F7>', '<Cmd>lua require"my-plugin/search-and-replace".find_word({word = vim.fn.expand("<cword>")})<CR>', {})
vim.api.nvim_set_keymap('n', '<c-F7>', '<Cmd>lua require"my-plugin/search-and-replace".find_word({word = vim.fn.input("Enter word: ")})<CR>', {})

vim.api.nvim_set_keymap('n', '<leader>H', '<Cmd>lua require"my-plugin/search-and-replace".replace_word({word = vim.fn.expand("<cword>")})<CR>', {})
vim.api.nvim_set_keymap('n', '<leader>HH', '<Cmd>lua require"my-plugin/search-and-replace".replace_word({word = vim.fn.input("Enter word: ")})<CR>', {})

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

