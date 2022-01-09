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
    -- 'bufferline-config', out for now because it's not working as i like
    'treesitter-config',
    'general-settings/settings',
    'outline-config',
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

-- require("lsp-lua")
-- require("lsp-rust")
-- require("lsp-python")
-- require("completion")
-- require("lsp-config")

-- require("debug-config")
-- require("debug-python")
-- require("debug-rust")
-- require("status-line-config")
-- require("terminal-config")

