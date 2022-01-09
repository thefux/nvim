vim.g.symbols_outline =
{
    highlight_hovered_item = false,
    auto_preview = false,
    width = 50,
    show_relative_numbers = true,
    keymaps =
    {
        close = {'q'},
    }
}


vim.api.nvim_set_keymap('n', '<F8>', ':SymbolsOutline<cr>', { noremap = true, silent = true })

