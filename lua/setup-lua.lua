local all = {
    { vscode = false, name = 'lsp-config' },
    { vscode = false, name = 'debug-python' },
    { vscode = false, name = 'debug-config' },
    { vscode = false, name = 'debug-rust' },
    { vscode = false, name = 'status-line-config' },
    { vscode = false, name = 'terminal-config' },
    { vscode = false, name = 'git-config' },
    { vscode = false, name = 'tree-config' },
    { vscode = false, name = 'surround-config' },
    { vscode = false, name = 'my-plugin/search-and-replace' },
    { vscode = false, name = 'general-settings/settings' },
    { vscode = false, name = 'outline-config' },
    { vscode = false, name = 'telescope-config' },
    { vscode = false, name = 'telescope-bookmark' },
    { vscode = false, name = 'worktree-config' },
    { vscode = false, name = 'commentary-config' },
    { vscode = false, name = 'mason-config' },
    { vscode = false, name = 'bacon-config' },
    { vscode = false, name = 'multi-cursors' },
    { vscode = false, name = 'treesitter-config' },
    { vscode = false, name = 'aerial-config' },
    { vscode = false, name = 'bufferline-config' },
    { vscode = false, name = 'trouble-config' },
    { vscode = false, name = 'goto-preview-config' },
    { vscode = false, name = 'buffer-manager-config' },
    { vscode = false, name = 'autopair-config' },
    { vscode = false, name = 'startify' },
    { vscode = false, name = 'peekup' },
    { vscode = false, name = 'tokyonight' },
    { vscode = false, name = 'colorscheme' },
    { vscode = false, name = 'spectre_' },
    -- 'neovide',
    -- 'bufferline-config', out for now because it's not working as i like
    -- 'sidebar-config',
}


-- TODO: put in a function and automate loading a reloading
for k in pairs(package.loaded) do
    for _, value in ipairs(all) do
        if k:match(value.name) then
            package.loaded[k.name] = nil
        end
    end
end

for _, value in ipairs(all) do
    if vim.g.vscode and value.vscode then
        require(value.name)
    else
        require(value.name)
    end
end
