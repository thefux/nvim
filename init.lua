require"general-settings/plugins"
require"general-settings/settings"
require"general-settings/mappings"

-- " source ~/.config/nvim/plugin/settings.vim

if not vim.g.vscode then
    require"setup-lua"
end
