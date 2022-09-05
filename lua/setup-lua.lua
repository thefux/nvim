local all = {
    'lsp-lua',
    'lsp-rust',
    'lsp-python',
    'lsp-typescript',
    'lsp-config',
    'debug-python',
    'debug-config',
    'debug-rust',
    'completion',
    'status-line-config',
    'terminal-config',
    'git-config',
    'tree-config',
    'spectre-config',
    'surround-config',
    'my-plugin/search-and-replace',
    'general-settings/settings',
    'outline-config',
    'telescope-config',
    'telescope-bookmark',
    'worktree-config',
    'commentary-config',
    'mason-config',
    'bacon-config',
    'multi-cursors',
    'treesitter-config',
    'aerial-config',
    'trouble-config'
    -- 'lsp-cpp',
    -- 'treesitter-config',
    -- 'bufferline-config', out for now because it's not working as i like
    -- 'sidebar-config',
}


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
