local telescope = require('telescope.builtin')

-- vim.op.wildignore = '*\\Scripts\\*'

local function find_files()
    local current_path = vim.fn.getcwd(0)
    vim.api.nvim_set_current_dir(current_path)
    local root_path = vim.fn.eval('FindRootDirectory()')
    local diff_path = current_path:gsub(root_path, "")
    local diff, count = string.gsub(diff_path, "\\", "")
    print(diff, count)

    telescope.find_files({
        cwd = string.rep('../', count),
    })
end


vim.api.nvim_set_keymap(
    "n",
    "<c-p>",
    ":lua require('telescope-config').find_files()<CR>",
    {noremap = true, silent = true}
)

return {
    find_files = find_files
}
