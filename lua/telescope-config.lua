local telescope = require('telescope.builtin')

-- vim.op.wildignore = '*\\Scripts\\*'

local function find_files()
    local root_path = vim.fn.eval('FindRootDirectory()')
    local current_path = vim.fn.getcwd(0)
    local diff_path = current_path:gsub(root_path, "")
    local n = string.gsub(diff_path, "\\", "")
    print(n)

    telescope.find_files({
        cwd = '../'
    })
end


-- vim.api.nvim_set_keymap(
--     "n",
--     "<c-p>",
--     ":lua require('telescope.builtin').find_files({cwd = vim.fn.expand('FindRootDirectory()')})<CR>",
--     {noremap = true, silent = true}
-- )

return {
    find_files = find_files
}
