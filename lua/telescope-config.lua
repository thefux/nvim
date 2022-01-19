local telescope = require('telescope.builtin')

-- vim.op.wildignore = '*\\Scripts\\*'

local function find_files()
    local current_path = vim.fn.getcwd(0)
    vim.api.nvim_set_current_dir(current_path)
    local root_path = vim.fn.eval('FindRootDirectory()')
    local _, e = current_path:find(root_path, 0, 0)
    local diff_path = string.sub(current_path, e + 1)

    local _, count = string.gsub(diff_path, "\\", "")
    -- -- print(diff, count)
    -- vim.fn.input(count)

    telescope.find_files({
        cwd = string.rep('../', count),
    })
end


local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap( "n", "<leader>e", ":lua require('telescope-config').find_files()<CR>", opts)

return {
    find_files = find_files
}
