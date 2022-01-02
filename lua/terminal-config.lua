local function setup_terminal()
    if vim.fn.has('win32') then
        vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>terminal<CR> pwsh<CR>', {})
        vim.api.nvim_set_keymap('n', '<leader>tv', '<C-w>v <Cmd>terminal<CR> pwsh<CR>', {})
    else
        vim.api.nvim_set_keymap('n', '<leader>tt', '<Cmd>terminal<CR>', {})
        vim.api.nvim_set_keymap('n', '<leader>tv', '<C-w>v <Cmd>terminal<CR>', {})
    end
end

setup_terminal()

local tools = require('tools')

-- list folder content
local function get_folder_content(path)
    local path = path
    if not path then
        path = '.'
    end

    local popen = io.popen
    vim.cmd('setlocal shell=pwsh')
    -- local content = popen('ls')
    -- for name in content:lines() do
    --     print(name)
    -- end
end

local function activate_terminal()
    local file_type = vim.bo.filetype
    get_folder_content()

    -- local win = tools.create_fwin()

    if file_type == 'python' then
        -- list all envs
        print('envs')
    else
        -- do nothing for now
    end

    -- vim.cmd(string.format("e #", ))
end


return
{
    activate_terminal = activate_terminal
}
