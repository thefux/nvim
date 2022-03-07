local all = {
    'lsp-lua',
    'lsp-rust',
    'lsp-python',
    'lsp-config',
    'completion',
    'debug-python',
    'debug-config',
    'debug-rust',
    'status-line-config',
    'terminal-config',
    'git-config',
    'tree-config',
    'spectre-config',
    'surround-config',
    'my-plugin/search-and-replace',
    'treesitter-config',
    'general-settings/settings',
    'outline-config',
    'telescope-config',
    'worktree-config',
    'commentary-config',
    -- 'lsp-cpp',
    -- 'treesitter-config',
    -- 'bufferline-config', out for now because it's not working as i like
    -- 'sidebar-config',
}

require('telescope').load_extension('lazygit')
vim.api.nvim_set_keymap('n', '<leader>lg', '<Cmd>lua require("telescope").extensions.lazygit.lazygit()<CR>', {})


-- TODO: put in a function and automate loading a reloading
for k in pairs(package.loaded) do
    for _, value in ipairs(all) do
        if k:match(value) then
            package.loaded[k] = nil
        end
    end
end

for _, value in ipairs(all) do
    require(value)
end
